From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 15 Aug 2022 15:43:25 +0530
Subject: [PATCH kvmtool 5/5] riscv: Fix serial0 alias path
In-Reply-To: <20220815101325.477694-1-apatel@ventanamicro.com>
References: <20220815101325.477694-1-apatel@ventanamicro.com>
Message-ID: <20220815101325.477694-6-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We have all MMIO devices under "/smb" DT node so the serial0 alias
path should have "/smb" prefix.

Fixes: 7c9aac003925 ("riscv: Generate FDT at runtime for Guest/VM")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index aeba042..e3d7717 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -122,6 +122,7 @@ static int setup_fdt(struct kvm *kvm)
 		cpu_to_fdt64(kvm->arch.memory_guest_start),
 		cpu_to_fdt64(kvm->ram_size),
 	};
+	char *str;
 	void *fdt		= staging_fdt;
 	void *fdt_dest		= guest_flat_to_host(kvm,
 						     kvm->arch.dtb_guest_start);
@@ -205,12 +206,15 @@ static int setup_fdt(struct kvm *kvm)
 	_FDT(fdt_end_node(fdt));
 
 	if (fdt_stdout_path) {
-		_FDT(fdt_begin_node(fdt, "aliases"));
-		_FDT(fdt_property_string(fdt, "serial0", fdt_stdout_path));
-		_FDT(fdt_end_node(fdt));
-
+		str = malloc(strlen(fdt_stdout_path) + strlen("/smb") + 1);
+		sprintf(str, "/smb%s", fdt_stdout_path);
 		free(fdt_stdout_path);
 		fdt_stdout_path = NULL;
+
+		_FDT(fdt_begin_node(fdt, "aliases"));
+		_FDT(fdt_property_string(fdt, "serial0", str));
+		_FDT(fdt_end_node(fdt));
+		free(str);
 	}
 
 	/* Finalise. */
-- 
2.34.1


