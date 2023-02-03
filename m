From: Thomas Huth <thuth@redhat.com>
Date: Fri,  3 Feb 2023 10:42:25 +0100
Subject: [PATCH 2/7] KVM: x86: Improve return type handling in kvm_vm_ioctl_get_nr_mmu_pages()
In-Reply-To: <20230203094230.266952-1-thuth@redhat.com>
References: <20230203094230.266952-1-thuth@redhat.com>
Message-ID: <20230203094230.266952-3-thuth@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

kvm_vm_ioctl_get_nr_mmu_pages() tries to return a "unsigned long" value,
but its caller only stores ther return value in an "int" - which is also
what all the other kvm_vm_ioctl_*() functions are returning. So returning
values that do not fit into a 32-bit integer anymore does not work here.
It's better to adjust the return type, add a sanity check and return an
error instead if the value is too big.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/x86/kvm/x86.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index da4bbd043a7b..caa2541833dd 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -6007,8 +6007,11 @@ static int kvm_vm_ioctl_set_nr_mmu_pages(struct kvm *kvm,
 	return 0;
 }
 
-static unsigned long kvm_vm_ioctl_get_nr_mmu_pages(struct kvm *kvm)
+static int kvm_vm_ioctl_get_nr_mmu_pages(struct kvm *kvm)
 {
+	if (kvm->arch.n_max_mmu_pages > INT_MAX)
+		return -EOVERFLOW;
+
 	return kvm->arch.n_max_mmu_pages;
 }
 
-- 
2.31.1


