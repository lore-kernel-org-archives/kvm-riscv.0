From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 29 Mar 2024 17:26:26 +0800
Subject: [PATCH RFC 10/11] riscv: KVM: Add hcontext support
In-Reply-To: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
References: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
Message-ID: <20240329-dev-maxh-lin-452-6-9-v1-10-1534f93b94a7@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Yong-Xuan Wang <yongxuan.wang@sifive.com>

hcontext CSR store the ID of the currently running machine status.
When a virtual machine is initialized, it will obtain and utilize
the first available ID.
It will be updated to VM ID when switch to a virtual machine,
and updated to 0 when switch back to host machine.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Co-developed-by: Max Hsu <max.hsu@sifive.com>
Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 arch/riscv/include/asm/kvm_host.h       |  3 ++
 arch/riscv/include/asm/kvm_vcpu_debug.h |  7 +++
 arch/riscv/kvm/main.c                   |  4 ++
 arch/riscv/kvm/vcpu_debug.c             | 78 +++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vm.c                     |  4 ++
 5 files changed, 96 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index d495279d99e1..b5d972783116 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -103,6 +103,9 @@ struct kvm_arch {
 
 	/* AIA Guest/VM context */
 	struct kvm_aia aia;
+
+	/* hcontext ID for guest VM */
+	unsigned long hcontext;
 };
 
 struct kvm_cpu_trap {
diff --git a/arch/riscv/include/asm/kvm_vcpu_debug.h b/arch/riscv/include/asm/kvm_vcpu_debug.h
index 6e7ce6b408a6..0a025fc4e6dd 100644
--- a/arch/riscv/include/asm/kvm_vcpu_debug.h
+++ b/arch/riscv/include/asm/kvm_vcpu_debug.h
@@ -11,6 +11,13 @@
 
 #include <linux/types.h>
 
+DECLARE_STATIC_KEY_FALSE(use_hcontext);
+extern atomic_long_t hcontext_id_share;
+
+void kvm_riscv_debug_init(void);
+void kvm_riscv_debug_exit(void);
+void kvm_riscv_debug_get_hcontext_id(struct kvm *kvm);
+void kvm_riscv_debug_return_hcontext_id(struct kvm *kvm);
 void kvm_riscv_debug_vcpu_swap_in_guest_context(struct kvm_vcpu *vcpu);
 void kvm_riscv_debug_vcpu_swap_in_host_context(struct kvm_vcpu *vcpu);
 
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 225a435d9c9a..ff28b96ad70b 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -125,6 +125,8 @@ static int __init riscv_kvm_init(void)
 		return rc;
 	}
 
+	kvm_riscv_debug_init();
+
 	return 0;
 }
 module_init(riscv_kvm_init);
@@ -133,6 +135,8 @@ static void __exit riscv_kvm_exit(void)
 {
 	kvm_riscv_aia_exit();
 
+	kvm_riscv_debug_exit();
+
 	kvm_exit();
 }
 module_exit(riscv_kvm_exit);
diff --git a/arch/riscv/kvm/vcpu_debug.c b/arch/riscv/kvm/vcpu_debug.c
index e7e9263c2e30..5081c272f01d 100644
--- a/arch/riscv/kvm/vcpu_debug.c
+++ b/arch/riscv/kvm/vcpu_debug.c
@@ -6,6 +6,84 @@
 #include <linux/kvm_host.h>
 #include <asm/switch_to.h>
 
+DEFINE_SPINLOCK(hcontext_lock);
+unsigned long *hcontext_bitmap;
+unsigned long hcontext_bitmap_len;
+
+static __always_inline bool has_hcontext(void)
+{
+	return static_branch_likely(&use_hcontext);
+}
+
+void kvm_riscv_debug_init(void)
+{
+	/*
+	 * As from riscv-debug-spec, Chapter 5.7.9:
+	 * If the H extension is implemented, it?s recommended to
+	 * implement no more than 7 bits on RV32 and 14 on RV64.
+	 * Allocating bit array according to spec size.
+	 */
+#if __riscv_xlen > 32
+	unsigned long tmp = atomic_long_read(&hcontext_id_share) & GENMASK(13, 0);
+#else
+	unsigned long tmp = atomic_long_read(&hcontext_id_share) & GENMASK(6, 0);
+#endif
+	if (has_hcontext()) {
+		while (tmp) {
+			kvm_info("hcontext: try to allocate 0x%lx-bit array\n", tmp);
+			hcontext_bitmap_len = tmp + 1;
+			hcontext_bitmap = bitmap_zalloc(tmp, 0);
+			if (hcontext_bitmap)
+				break;
+			tmp = tmp >> 1;
+		}
+
+		if (tmp == 0) {
+			/* We can't allocate any space for hcontext bitmap */
+			static_branch_disable(&use_hcontext);
+		} else {
+			/* ID 0 is hypervisor */
+			set_bit(0, hcontext_bitmap);
+		}
+	}
+}
+
+void kvm_riscv_debug_exit(void)
+{
+	if (has_hcontext()) {
+		static_branch_disable(&use_hcontext);
+		kfree(hcontext_bitmap);
+	}
+}
+
+void kvm_riscv_debug_get_hcontext_id(struct kvm *kvm)
+{
+	if (has_hcontext()) {
+		unsigned long free_id;
+
+		spin_lock(&hcontext_lock);
+		free_id = find_first_zero_bit(hcontext_bitmap, hcontext_bitmap_len);
+
+		/* share the maximum ID when we run out of the hcontext ID */
+		if (free_id <= hcontext_bitmap_len)
+			set_bit(free_id, hcontext_bitmap);
+		else
+			free_id -= 1;
+
+		kvm->arch.hcontext = free_id;
+		spin_unlock(&hcontext_lock);
+	}
+}
+
+void kvm_riscv_debug_return_hcontext_id(struct kvm *kvm)
+{
+	if (has_hcontext()) {
+		spin_lock(&hcontext_lock);
+		clear_bit(kvm->arch.hcontext, hcontext_bitmap);
+		spin_unlock(&hcontext_lock);
+	}
+}
+
 void kvm_riscv_debug_vcpu_swap_in_guest_context(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vcpu_sdtrig_csr *csr = &vcpu->arch.sdtrig_csr;
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index ce58bc48e5b8..275f5f05d4dd 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -45,6 +45,8 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 
 	kvm_riscv_guest_timer_init(kvm);
 
+	kvm_riscv_debug_get_hcontext_id(kvm);
+
 	return 0;
 }
 
@@ -53,6 +55,8 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
 	kvm_destroy_vcpus(kvm);
 
 	kvm_riscv_aia_destroy_vm(kvm);
+
+	kvm_riscv_debug_return_hcontext_id(kvm);
 }
 
 int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irql,

-- 
2.43.2


