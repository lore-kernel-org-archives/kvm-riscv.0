From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 28 Nov 2023 20:26:20 +0530
Subject: [kvmtool PATCH 02/10] riscv: Improve warning in generate_cpu_nodes()
In-Reply-To: <20231128145628.413414-1-apatel@ventanamicro.com>
References: <20231128145628.413414-1-apatel@ventanamicro.com>
Message-ID: <20231128145628.413414-3-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Let's print name of the ISA extension in warning if generate_cpu_nodes()
drops the ISA extension from generated ISA string due to lack of space.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 9af71b5..b45f731 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -108,7 +108,8 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 			}
 
 			if ((strlen(isa_info_arr[i].name) + pos + 1) >= CPU_ISA_MAX_LEN) {
-				pr_warning("Insufficient space to append ISA exension\n");
+				pr_warning("Insufficient space to append ISA exension %s\n",
+					   isa_info_arr[i].name);
 				break;
 			}
 			pos += snprintf(cpu_isa + pos, CPU_ISA_MAX_LEN, "_%s",
-- 
2.34.1


