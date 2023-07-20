From: Isaku Yamahata <isaku.yamahata@gmail.com>
Date: Thu, 20 Jul 2023 14:28:06 -0700
Subject: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl()
 for guest-specific backing memory
In-Reply-To: <20230718234512.1690985-13-seanjc@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-13-seanjc@google.com>
Message-ID: <20230720212806.GG25699@ls.amr.corp.intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 18, 2023 at 04:44:55PM -0700,
Sean Christopherson <seanjc@google.com> wrote:

> +static int kvm_gmem_release(struct inode *inode, struct file *file)
> +{
> +	struct kvm_gmem *gmem = file->private_data;
> +	struct kvm_memory_slot *slot;
> +	struct kvm *kvm = gmem->kvm;
> +	unsigned long index;
> +
> +	filemap_invalidate_lock(inode->i_mapping);
> +
> +	/*
> +	 * Prevent concurrent attempts to *unbind* a memslot.  This is the last
> +	 * reference to the file and thus no new bindings can be created, but
> +	 * dereferencing the slot for existing bindings needs to be protected
> +	 * against memslot updates, specifically so that unbind doesn't race
> +	 * and free the memslot (kvm_gmem_get_file() will return NULL).
> +	 */
> +	mutex_lock(&kvm->slots_lock);
> +
> +	xa_for_each(&gmem->bindings, index, slot)
> +		rcu_assign_pointer(slot->gmem.file, NULL);
> +
> +	synchronize_rcu();
> +
> +	/*
> +	 * All in-flight operations are gone and new bindings can be created.
> +	 * Zap all SPTEs pointed at by this file.  Do not free the backing
> +	 * memory, as its lifetime is associated with the inode, not the file.
> +	 */
> +	kvm_gmem_invalidate_begin(gmem, 0, -1ul);
> +	kvm_gmem_invalidate_end(gmem, 0, -1ul);
> +
> +	mutex_unlock(&kvm->slots_lock);
> +
> +	list_del(&gmem->entry);
> +
> +	filemap_invalidate_unlock(inode->i_mapping);
> +
> +	xa_destroy(&gmem->bindings);
> +	kfree(gmem);
> +
> +	kvm_put_kvm(kvm);
> +
> +	return 0;
> +}

The lockdep complains with the filemapping lock and the kvm slot lock.


From bc45eb084a761f93a87ba1f6d3a9949c17adeb31 Mon Sep 17 00:00:00 2001
Message-Id: <bc45eb084a761f93a87ba1f6d3a9949c17adeb31.1689888438.git.isaku.yamahata@intel.com>
From: Isaku Yamahata <isaku.yamahata@intel.com>
Date: Thu, 20 Jul 2023 14:16:21 -0700
Subject: [PATCH] KVM/gmem: Fix locking ordering in kvm_gmem_release()

The lockdep complains the locking order.  Fix kvm_gmem_release()

VM destruction:
- fput()
   ...
   \-kvm_gmem_release()
     \-filemap_invalidate_lock(inode->i_mapping);
       lock(&kvm->slots_lock);

slot creation:
kvm_set_memory_region()
   mutex_lock(&kvm->slots_lock);
   __kvm_set_memory_region(kvm, mem);
    \-kvm_gmem_bind()
      \-filemap_invalidate_lock(inode->i_mapping);

======================================================
WARNING: possible circular locking dependency detected
------------------------------------------------------
...

the existing dependency chain (in reverse order) is:

-> #1 (mapping.invalidate_lock#4){+.+.}-{4:4}:
       ...
       down_write+0x40/0xe0
       kvm_gmem_bind+0xd9/0x1b0 [kvm]
       __kvm_set_memory_region.part.0+0x4fc/0x620 [kvm]
       __kvm_set_memory_region+0x6b/0x90 [kvm]
       kvm_vm_ioctl+0x350/0xa00 [kvm]
       __x64_sys_ioctl+0x95/0xd0
       do_syscall_64+0x39/0x90
       entry_SYSCALL_64_after_hwframe+0x6e/0xd8

-> #0 (&kvm->slots_lock){+.+.}-{4:4}:
       ...
       mutex_lock_nested+0x1b/0x30
       kvm_gmem_release+0x56/0x1b0 [kvm]
       __fput+0x115/0x2e0
       ____fput+0xe/0x20
       task_work_run+0x5e/0xb0
       do_exit+0x2dd/0x5b0
       do_group_exit+0x3b/0xb0
       __x64_sys_exit_group+0x18/0x20
       do_syscall_64+0x39/0x90
       entry_SYSCALL_64_after_hwframe+0x6e/0xd8

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(mapping.invalidate_lock#4);
                               lock(&kvm->slots_lock);
                               lock(mapping.invalidate_lock#4);
  lock(&kvm->slots_lock);

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 virt/kvm/guest_mem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/virt/kvm/guest_mem.c b/virt/kvm/guest_mem.c
index ab91e972e699..772e4631fcd9 100644
--- a/virt/kvm/guest_mem.c
+++ b/virt/kvm/guest_mem.c
@@ -274,8 +274,6 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
 	struct kvm *kvm = gmem->kvm;
 	unsigned long index;
 
-	filemap_invalidate_lock(inode->i_mapping);
-
 	/*
 	 * Prevent concurrent attempts to *unbind* a memslot.  This is the last
 	 * reference to the file and thus no new bindings can be created, but
@@ -285,6 +283,8 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
 	 */
 	mutex_lock(&kvm->slots_lock);
 
+	filemap_invalidate_lock(inode->i_mapping);
+
 	xa_for_each(&gmem->bindings, index, slot)
 		rcu_assign_pointer(slot->gmem.file, NULL);
 
@@ -299,12 +299,12 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
 	kvm_gmem_issue_arch_invalidate(gmem->kvm, file_inode(file), 0, -1ul);
 	kvm_gmem_invalidate_end(gmem, 0, -1ul);
 
-	mutex_unlock(&kvm->slots_lock);
-
 	list_del(&gmem->entry);
 
 	filemap_invalidate_unlock(inode->i_mapping);
 
+	mutex_unlock(&kvm->slots_lock);
+
 	xa_destroy(&gmem->bindings);
 	kfree(gmem);
 
-- 
2.25.1



-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

