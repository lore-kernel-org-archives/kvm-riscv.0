From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:23:44 -0700
Subject: [RFC kvmtool 04/10] riscv: Invoke measure region for VM images
In-Reply-To: <20230419222350.3604274-1-atishp@rivosinc.com>
References: <20230419222350.3604274-1-atishp@rivosinc.com>
Message-ID: <20230419222350.3604274-5-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The DT, initrd and kernel images needs to be measured before a CoVE VM
can be started to validate its authenticity.

Hookup the measure region API for these three components.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 riscv/fdt.c | 3 +++
 riscv/kvm.c | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 61a28bb..07ec336 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -254,6 +254,9 @@ static int setup_fdt(struct kvm *kvm)
 
 	if (kvm->cfg.arch.dump_dtb_filename)
 		dump_fdt(kvm->cfg.arch.dump_dtb_filename, fdt_dest);
+
+	kvm_cove_measure_region(kvm, (unsigned long)fdt_dest,
+				kvm->arch.dtb_guest_start, FDT_MAX_SIZE);
 	return 0;
 }
 late_init(setup_fdt);
diff --git a/riscv/kvm.c b/riscv/kvm.c
index 99b253e..d59e8bc 100644
--- a/riscv/kvm.c
+++ b/riscv/kvm.c
@@ -148,6 +148,8 @@ bool kvm__arch_load_kernel_image(struct kvm *kvm, int fd_kernel, int fd_initrd,
 	pr_debug("Loaded kernel to 0x%llx (%zd bytes)",
 		 kvm->arch.kern_guest_start, file_size);
 
+	kvm_cove_measure_region(kvm, (unsigned long)pos, kvm->arch.kern_guest_start,
+			       file_size);
 	/* Place FDT just after kernel at FDT_ALIGN address */
 	pos = kernel_end + FDT_ALIGN;
 	guest_addr = ALIGN(host_to_guest_flat(kvm, pos), FDT_ALIGN);
@@ -188,6 +190,8 @@ bool kvm__arch_load_kernel_image(struct kvm *kvm, int fd_kernel, int fd_initrd,
 		pr_debug("Loaded initrd to 0x%llx (%llu bytes)",
 			 kvm->arch.initrd_guest_start,
 			 kvm->arch.initrd_size);
+		kvm_cove_measure_region(kvm, (unsigned long)pos, initrd_start,
+				       file_size);
 	} else {
 		kvm->arch.initrd_size = 0;
 	}
-- 
2.25.1


