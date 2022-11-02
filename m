From: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Nov 2022 23:19:09 +0000
Subject: [PATCH 42/44] KVM: Make hardware_enable_failed a local variable in
 the "enable all" path
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
Message-ID: <20221102231911.3107438-43-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Isaku Yamahata <isaku.yamahata@intel.com>

Rework detecting hardware enabling errors to use a local variable in the
"enable all" path to track whether or not enabling was successful across
all CPUs.  Using a global variable complicates paths that enable hardware
only on the current CPU, e.g. kvm_resume() and kvm_online_cpu().

Opportunistically add a WARN if hardware enabling fails during
kvm_resume(), KVM is all kinds of hosed if CPU0 fails to enable hardware.
The WARN is largely futile in the current code, as KVM BUG()s on spurious
faults on VMX instructions, e.g. attempting to run a vCPU on CPU if
hardware enabling fails will explode.

  ------------[ cut here ]------------
  kernel BUG at arch/x86/kvm/x86.c:508!
  invalid opcode: 0000 [#1] SMP
  CPU: 3 PID: 1009 Comm: CPU 4/KVM Not tainted 6.1.0-rc1+ #11
  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 0.0.0 02/06/2015
  RIP: 0010:kvm_spurious_fault+0xa/0x10
  Call Trace:
   vmx_vcpu_load_vmcs+0x192/0x230 [kvm_intel]
   vmx_vcpu_load+0x16/0x60 [kvm_intel]
   kvm_arch_vcpu_load+0x32/0x1f0
   vcpu_load+0x2f/0x40
   kvm_arch_vcpu_ioctl_run+0x19/0x9d0
   kvm_vcpu_ioctl+0x271/0x660
   __x64_sys_ioctl+0x80/0xb0
   do_syscall_64+0x2b/0x50
   entry_SYSCALL_64_after_hwframe+0x46/0xb0

But, the WARN may provide a breadcrumb to understand what went awry, and
someday KVM may fix one or both of those bugs, e.g. by finding a way to
eat spurious faults no matter the context (easier said than done due to
side effects of certain operations, e.g. Intel's VMCLEAR).

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
[sean: rebase, WARN on failure in kvm_resume()]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 31949a89fe25..a18296ee731b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -104,7 +104,6 @@ LIST_HEAD(vm_list);
 
 static DEFINE_PER_CPU(bool, hardware_enabled);
 static int kvm_usage_count;
-static atomic_t hardware_enable_failed;
 
 static struct kmem_cache *kvm_vcpu_cache;
 
@@ -5006,19 +5005,25 @@ static struct miscdevice kvm_dev = {
 	&kvm_chardev_ops,
 };
 
-static void hardware_enable_nolock(void *junk)
+static int __hardware_enable_nolock(void)
 {
 	if (__this_cpu_read(hardware_enabled))
-		return;
+		return 0;
 
 	if (kvm_arch_hardware_enable()) {
-		atomic_inc(&hardware_enable_failed);
 		pr_info("kvm: enabling virtualization on CPU%d failed\n",
 			raw_smp_processor_id());
-		return;
+		return -EIO;
 	}
 
 	__this_cpu_write(hardware_enabled, true);
+	return 0;
+}
+
+static void hardware_enable_nolock(void *failed)
+{
+	if (__hardware_enable_nolock())
+		atomic_inc(failed);
 }
 
 static int kvm_online_cpu(unsigned int cpu)
@@ -5033,16 +5038,9 @@ static int kvm_online_cpu(unsigned int cpu)
 	 * errors when scheduled to this CPU.
 	 */
 	if (kvm_usage_count) {
-		WARN_ON_ONCE(atomic_read(&hardware_enable_failed));
-
 		local_irq_save(flags);
-		hardware_enable_nolock(NULL);
+		ret = __hardware_enable_nolock();
 		local_irq_restore(flags);
-
-		if (atomic_read(&hardware_enable_failed)) {
-			atomic_set(&hardware_enable_failed, 0);
-			ret = -EIO;
-		}
 	}
 	mutex_unlock(&kvm_lock);
 	return ret;
@@ -5094,6 +5092,7 @@ static void hardware_disable_all(void)
 
 static int hardware_enable_all(void)
 {
+	atomic_t failed = ATOMIC_INIT(0);
 	int r = 0;
 
 	/*
@@ -5109,10 +5108,9 @@ static int hardware_enable_all(void)
 
 	kvm_usage_count++;
 	if (kvm_usage_count == 1) {
-		atomic_set(&hardware_enable_failed, 0);
-		on_each_cpu(hardware_enable_nolock, NULL, 1);
+		on_each_cpu(hardware_enable_nolock, &failed, 1);
 
-		if (atomic_read(&hardware_enable_failed)) {
+		if (atomic_read(&failed)) {
 			hardware_disable_all_nolock();
 			r = -EBUSY;
 		}
@@ -5744,7 +5742,7 @@ static void kvm_resume(void)
 	lockdep_assert_irqs_disabled();
 
 	if (kvm_usage_count)
-		hardware_enable_nolock(NULL);
+		WARN_ON_ONCE(__hardware_enable_nolock());
 }
 
 static struct syscore_ops kvm_syscore_ops = {
-- 
2.38.1.431.g37b22c650d-goog


