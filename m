From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 28 Nov 2023 20:26:21 +0530
Subject: [kvmtool PATCH 03/10] riscv: Make CPU_ISA_MAX_LEN depend upon isa_info_arr array size
In-Reply-To: <20231128145628.413414-1-apatel@ventanamicro.com>
References: <20231128145628.413414-1-apatel@ventanamicro.com>
Message-ID: <20231128145628.413414-4-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, the CPU_ISA_MAX_LEN is a fixed value so we will easily
run out of space when all possible ISA extensions supported by
KVM RISC-V are available.

Instead of above, let us make CPU_ISA_MAX_LEN depend upon the
isa_info_arr[] array size so that CPU_ISA_MAX_LEN automatically
adapts to growing number of ISA extensions.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index b45f731..230d1f8 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -44,7 +44,6 @@ static void dump_fdt(const char *dtb_file, void *fdt)
 }
 
 #define CPU_NAME_MAX_LEN 15
-#define CPU_ISA_MAX_LEN 128
 static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 {
 	int cpu, pos, i, index, valid_isa_len;
@@ -60,6 +59,7 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 
 	for (cpu = 0; cpu < kvm->nrcpus; ++cpu) {
 		char cpu_name[CPU_NAME_MAX_LEN];
+#define CPU_ISA_MAX_LEN (ARRAY_SIZE(isa_info_arr) * 16)
 		char cpu_isa[CPU_ISA_MAX_LEN];
 		struct kvm_cpu *vcpu = kvm->cpus[cpu];
 		struct kvm_one_reg reg;
-- 
2.34.1


