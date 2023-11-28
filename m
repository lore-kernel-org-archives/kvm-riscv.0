From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 28 Nov 2023 20:26:27 +0530
Subject: [kvmtool PATCH 09/10] riscv: Set mmu-type DT property based on satp_mode ONE_REG interface
In-Reply-To: <20231128145628.413414-1-apatel@ventanamicro.com>
References: <20231128145628.413414-1-apatel@ventanamicro.com>
Message-ID: <20231128145628.413414-10-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of hard-coding the mmu-type DT property, we should set it
based on satp_mode ONE_REG interface.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c | 44 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 1124fa1..8485acf 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -57,7 +57,7 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 	int cpu, pos, i, index, valid_isa_len;
 	const char *valid_isa_order = "IEMAFDQCLBJTPVNSUHKORWXYZG";
 	int arr_sz = ARRAY_SIZE(isa_info_arr);
-	unsigned long cbom_blksz = 0, cboz_blksz = 0;
+	unsigned long cbom_blksz = 0, cboz_blksz = 0, satp_mode = 0;
 
 	_FDT(fdt_begin_node(fdt, "cpus"));
 	_FDT(fdt_property_cell(fdt, "#address-cells", 0x1));
@@ -125,15 +125,45 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 		}
 		cpu_isa[pos] = '\0';
 
+		reg.id = RISCV_CONFIG_REG(satp_mode);
+		reg.addr = (unsigned long)&satp_mode;
+		if (ioctl(vcpu->vcpu_fd, KVM_GET_ONE_REG, &reg) < 0)
+			satp_mode = (vcpu->riscv_xlen == 64) ? 8 : 1;
+
 		_FDT(fdt_begin_node(fdt, cpu_name));
 		_FDT(fdt_property_string(fdt, "device_type", "cpu"));
 		_FDT(fdt_property_string(fdt, "compatible", "riscv"));
-		if (vcpu->riscv_xlen == 64)
-			_FDT(fdt_property_string(fdt, "mmu-type",
-						 "riscv,sv48"));
-		else
-			_FDT(fdt_property_string(fdt, "mmu-type",
-						 "riscv,sv32"));
+		if (vcpu->riscv_xlen == 64) {
+			switch (satp_mode) {
+			case 10:
+				_FDT(fdt_property_string(fdt, "mmu-type",
+							 "riscv,sv57"));
+				break;
+			case 9:
+				_FDT(fdt_property_string(fdt, "mmu-type",
+							 "riscv,sv48"));
+				break;
+			case 8:
+				_FDT(fdt_property_string(fdt, "mmu-type",
+							 "riscv,sv39"));
+				break;
+			default:
+				_FDT(fdt_property_string(fdt, "mmu-type",
+							 "riscv,none"));
+				break;
+			}
+		} else {
+			switch (satp_mode) {
+			case 1:
+				_FDT(fdt_property_string(fdt, "mmu-type",
+							 "riscv,sv32"));
+				break;
+			default:
+				_FDT(fdt_property_string(fdt, "mmu-type",
+							 "riscv,none"));
+				break;
+			}
+		}
 		_FDT(fdt_property_string(fdt, "riscv,isa", cpu_isa));
 		if (cbom_blksz)
 			_FDT(fdt_property_cell(fdt, "riscv,cbom-block-size", cbom_blksz));
-- 
2.34.1


