From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue,  6 Sep 2022 10:35:55 +0200
Subject: [PATCH 3/3] RISC-V: KVM: Expose Zicbom to the guest
In-Reply-To: <20220906083555.931806-1-ajones@ventanamicro.com>
References: <20220906083555.931806-1-ajones@ventanamicro.com>
Message-ID: <20220906083555.931806-4-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Guests may use the cbo.inval,clean,flush instructions when the
CPU has the Zicbom extension and the hypervisor sets henvcfg.CBIE
(for cbo.inval) and henvcfg.CBCFE (for cbo.clean,flush).

Add Zicbom support for KVM guests which may be enabled and
disabled from KVM userspace using the ISA extension ONE_REG API.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index b9a4cf36be4b..ed37a4a6e5cf 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -99,6 +99,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_M,
 	KVM_RISCV_ISA_EXT_SVPBMT,
 	KVM_RISCV_ISA_EXT_SSTC,
+	KVM_RISCV_ISA_EXT_ZICBOM,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 3f36e79876e7..3ce4f1c11b4c 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -54,6 +54,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	RISCV_ISA_EXT_m,
 	RISCV_ISA_EXT_SVPBMT,
 	RISCV_ISA_EXT_SSTC,
+	RISCV_ISA_EXT_ZICBOM,
 };
 
 static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
@@ -795,6 +796,10 @@ static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
 
 	if (__riscv_isa_extension_available(isa, RISCV_ISA_EXT_SSTC))
 		henvcfg |= ENVCFG_STCE;
+
+	if (__riscv_isa_extension_available(isa, RISCV_ISA_EXT_ZICBOM))
+		henvcfg |= (ENVCFG_CBIE | ENVCFG_CBCFE);
+
 	csr_write(CSR_HENVCFG, henvcfg);
 #ifdef CONFIG_32BIT
 	csr_write(CSR_HENVCFGH, henvcfg >> 32);
-- 
2.37.2


