From: Björn Töpel <bjorn@kernel.org>
Date: Mon,  4 Nov 2024 20:21:19 +0100
Subject: [PATCH kvmtool] riscv: Pass correct size to snprintf()
Message-ID: <20241104192120.75841-1-bjorn@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bj?rn T?pel <bjorn@rivosinc.com>

The snprintf() function does not get the correct size argument passed,
when the FDT ISA string is built. Instead of adjusting the size for
each extension, the full size is passed for every iteration. Doing so
will make __snprinf_chk() bail out on glibc.

Adjust size for each iteration.

Fixes: 8aff29e1dafe ("riscv: Append ISA extensions to the device tree")
Signed-off-by: Bj?rn T?pel <bjorn@rivosinc.com>
---
 riscv/fdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 8189601f46de..85c8f95604f6 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -157,7 +157,7 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 					   isa_info_arr[i].name);
 				break;
 			}
-			pos += snprintf(cpu_isa + pos, CPU_ISA_MAX_LEN, "_%s",
+			pos += snprintf(cpu_isa + pos, CPU_ISA_MAX_LEN - pos, "_%s",
 					isa_info_arr[i].name);
 		}
 		cpu_isa[pos] = '\0';

base-commit: 3040b298156e4e2a82b27ac8db5bd63a72b3785b
-- 
2.43.0


