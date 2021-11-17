From: David Woodhouse <dwmw2@infradead.org>
Date: Wed, 17 Nov 2021 17:40:01 +0000
Subject: [PATCH v3 10/12] KVM: x86/xen: Maintain valid mapping of Xen
 shared_info page
In-Reply-To: <20211117174003.297096-1-dwmw2@infradead.org>
References: <20211117174003.297096-1-dwmw2@infradead.org>
Message-ID: <20211117174003.297096-11-dwmw2@infradead.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: David Woodhouse <dwmw@amazon.co.uk>

Use the newly reinstated gfn_to_pfn_cache to maintain a kernel mapping
of the Xen shared_info page so that it can be accessed in atomic context.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/include/asm/kvm_host.h |  2 +-
 arch/x86/kvm/xen.c              | 25 ++++++++++++++-----------
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 6ac61f85e07b..4b2b4ecf3b46 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1014,7 +1014,7 @@ struct msr_bitmap_range {
 struct kvm_xen {
 	bool long_mode;
 	u8 upcall_vector;
-	gfn_t shinfo_gfn;
+	struct gfn_to_pfn_cache shinfo_cache;
 };
 
 enum kvm_irqchip_mode {
diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index dff2bdf9507a..32a915a4fe20 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -23,16 +23,21 @@ DEFINE_STATIC_KEY_DEFERRED_FALSE(kvm_xen_enabled, HZ);
 
 static int kvm_xen_shared_info_init(struct kvm *kvm, gfn_t gfn)
 {
+	struct gfn_to_pfn_cache *gpc = &kvm->arch.xen.shinfo_cache;
 	gpa_t gpa = gfn_to_gpa(gfn);
 	int wc_ofs, sec_hi_ofs;
 	int ret = 0;
 	int idx = srcu_read_lock(&kvm->srcu);
 
-	if (kvm_is_error_hva(gfn_to_hva(kvm, gfn))) {
-		ret = -EFAULT;
+	if (gfn == GPA_INVALID) {
+		kvm_gfn_to_pfn_cache_destroy(kvm, gpc);
 		goto out;
 	}
-	kvm->arch.xen.shinfo_gfn = gfn;
+
+	ret = kvm_gfn_to_pfn_cache_init(kvm, gpc, NULL, false, true, gpa,
+					PAGE_SIZE, true);
+	if (ret)
+		goto out;
 
 	/* Paranoia checks on the 32-bit struct layout */
 	BUILD_BUG_ON(offsetof(struct compat_shared_info, wc) != 0x900);
@@ -260,15 +265,9 @@ int kvm_xen_hvm_set_attr(struct kvm *kvm, struct kvm_xen_hvm_attr *data)
 		break;
 
 	case KVM_XEN_ATTR_TYPE_SHARED_INFO:
-		if (data->u.shared_info.gfn == GPA_INVALID) {
-			kvm->arch.xen.shinfo_gfn = GPA_INVALID;
-			r = 0;
-			break;
-		}
 		r = kvm_xen_shared_info_init(kvm, data->u.shared_info.gfn);
 		break;
 
-
 	case KVM_XEN_ATTR_TYPE_UPCALL_VECTOR:
 		if (data->u.vector && data->u.vector < 0x10)
 			r = -EINVAL;
@@ -299,7 +298,10 @@ int kvm_xen_hvm_get_attr(struct kvm *kvm, struct kvm_xen_hvm_attr *data)
 		break;
 
 	case KVM_XEN_ATTR_TYPE_SHARED_INFO:
-		data->u.shared_info.gfn = kvm->arch.xen.shinfo_gfn;
+		if (kvm->arch.xen.shinfo_cache.active)
+			data->u.shared_info.gfn = gpa_to_gfn(kvm->arch.xen.shinfo_cache.gpa);
+		else
+			data->u.shared_info.gfn = GPA_INVALID;
 		r = 0;
 		break;
 
@@ -661,11 +663,12 @@ int kvm_xen_hvm_config(struct kvm *kvm, struct kvm_xen_hvm_config *xhc)
 
 void kvm_xen_init_vm(struct kvm *kvm)
 {
-	kvm->arch.xen.shinfo_gfn = GPA_INVALID;
 }
 
 void kvm_xen_destroy_vm(struct kvm *kvm)
 {
+	kvm_gfn_to_pfn_cache_destroy(kvm, &kvm->arch.xen.shinfo_cache);
+
 	if (kvm->arch.xen_hvm_config.msr)
 		static_branch_slow_dec_deferred(&kvm_xen_enabled);
 }
-- 
2.31.1


