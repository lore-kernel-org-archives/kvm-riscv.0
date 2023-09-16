From: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 Sep 2023 17:31:16 -0700
Subject: [PATCH 24/26] powerpc/xics: Move declaration of xics_wake_cpu() out
 of kvm_ppc.h
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
References: <20230916003118.2540661-1-seanjc@google.com>
Message-ID: <20230916003118.2540661-25-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

xics_wake_cpu() is provided by core PPC code, not by KVM.  Move its
declaration out of kvm_ppc.h and into xics.h.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/include/asm/kvm_ppc.h | 2 --
 arch/powerpc/include/asm/xics.h    | 3 +++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index b4da8514af43..72fee202d3ec 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -1072,6 +1072,4 @@ static inline ulong kvmppc_get_ea_indexed(struct kvm_vcpu *vcpu, int ra, int rb)
 	return ea;
 }
 
-extern void xics_wake_cpu(int cpu);
-
 #endif /* __POWERPC_KVM_PPC_H__ */
diff --git a/arch/powerpc/include/asm/xics.h b/arch/powerpc/include/asm/xics.h
index 89090485bec1..17a45c022bd9 100644
--- a/arch/powerpc/include/asm/xics.h
+++ b/arch/powerpc/include/asm/xics.h
@@ -32,6 +32,9 @@
 extern int icp_native_init(void);
 extern void icp_native_flush_interrupt(void);
 extern void icp_native_cause_ipi_rm(int cpu);
+#ifdef CONFIG_SMP
+extern void xics_wake_cpu(int cpu);
+#endif
 #else
 static inline int icp_native_init(void) { return -ENODEV; }
 #endif
-- 
2.42.0.459.ge4e396fd5e-goog


