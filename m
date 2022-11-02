From: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Nov 2022 23:18:32 +0000
Subject: [PATCH 05/44] KVM: s390: Unwind kvm_arch_init() piece-by-piece() if a
 step fails
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
Message-ID: <20221102231911.3107438-6-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In preparation for folding kvm_arch_hardware_setup() into kvm_arch_init(),
unwind initialization one step at a time instead of simply calling
kvm_arch_exit().  Using kvm_arch_exit() regardless of which initialization
step failed relies on all affected state playing nice with being undone
even if said state wasn't first setup.  That holds true for state that is
currently configured by kvm_arch_init(), but not for state that's handled
by kvm_arch_hardware_setup(), e.g. calling gmap_unregister_pte_notifier()
without first registering a notifier would result in list corruption due
to attempting to delete an entry that was never added to the list.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/kvm-s390.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 45d4b8182b07..8395433a79b2 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -490,11 +490,11 @@ int kvm_arch_init(void *opaque)
 
 	kvm_s390_dbf_uv = debug_register("kvm-uv", 32, 1, 7 * sizeof(long));
 	if (!kvm_s390_dbf_uv)
-		goto out;
+		goto err_kvm_uv;
 
 	if (debug_register_view(kvm_s390_dbf, &debug_sprintf_view) ||
 	    debug_register_view(kvm_s390_dbf_uv, &debug_sprintf_view))
-		goto out;
+		goto err_debug_view;
 
 	kvm_s390_cpu_feat_init();
 
@@ -502,25 +502,32 @@ int kvm_arch_init(void *opaque)
 	rc = kvm_register_device_ops(&kvm_flic_ops, KVM_DEV_TYPE_FLIC);
 	if (rc) {
 		pr_err("A FLIC registration call failed with rc=%d\n", rc);
-		goto out;
+		goto err_flic;
 	}
 
 	if (IS_ENABLED(CONFIG_VFIO_PCI_ZDEV_KVM)) {
 		rc = kvm_s390_pci_init();
 		if (rc) {
 			pr_err("Unable to allocate AIFT for PCI\n");
-			goto out;
+			goto err_pci;
 		}
 	}
 
 	rc = kvm_s390_gib_init(GAL_ISC);
 	if (rc)
-		goto out;
+		goto err_gib;
 
 	return 0;
 
-out:
-	kvm_arch_exit();
+err_gib:
+	if (IS_ENABLED(CONFIG_VFIO_PCI_ZDEV_KVM))
+		kvm_s390_pci_exit();
+err_pci:
+err_flic:
+err_debug_view:
+	debug_unregister(kvm_s390_dbf_uv);
+err_kvm_uv:
+	debug_unregister(kvm_s390_dbf);
 	return rc;
 }
 
-- 
2.38.1.431.g37b22c650d-goog


