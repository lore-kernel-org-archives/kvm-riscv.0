From: Anup Patel <anup.patel@wdc.com>
Date: Wed, 19 May 2021 09:05:52 +0530
Subject: [PATCH v18 17/18] RISC-V: KVM: Move sources to drivers/staging
 directory
In-Reply-To: <20210519033553.1110536-1-anup.patel@wdc.com>
References: <20210519033553.1110536-1-anup.patel@wdc.com>
Message-ID: <20210519033553.1110536-18-anup.patel@wdc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As-per the Linux RISC-V patch acceptance policy, patches for unfrozen
specifications won't be accepted in arch/riscv directory.

To unblock KVM RISC-V development, we move KVM RISC-V sources to
drivers/staging directory. Only arch/riscv/include/uapi/asm/kvm.h
header will remain in arch/riscv directory because this KVM RISC-V
UAPI header is compliant with ratified RISC-V privilege specification
hence also satisfies Linux RISC-V patch acceptance policy.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/Kconfig                                          | 2 +-
 arch/riscv/Makefile                                         | 2 +-
 {arch => drivers/staging}/riscv/kvm/Kconfig                 | 0
 {arch => drivers/staging}/riscv/kvm/Makefile                | 6 +++---
 .../include => drivers/staging/riscv/kvm}/asm/kvm_csr.h     | 0
 .../include => drivers/staging/riscv/kvm}/asm/kvm_host.h    | 0
 .../include => drivers/staging/riscv/kvm}/asm/kvm_types.h   | 0
 .../staging/riscv/kvm}/asm/kvm_vcpu_timer.h                 | 0
 {arch => drivers/staging}/riscv/kvm/main.c                  | 0
 {arch => drivers/staging}/riscv/kvm/mmu.c                   | 0
 {arch => drivers/staging}/riscv/kvm/riscv_offsets.c         | 0
 {arch => drivers/staging}/riscv/kvm/tlb.S                   | 0
 {arch => drivers/staging}/riscv/kvm/vcpu.c                  | 0
 {arch => drivers/staging}/riscv/kvm/vcpu_exit.c             | 0
 {arch => drivers/staging}/riscv/kvm/vcpu_sbi.c              | 0
 {arch => drivers/staging}/riscv/kvm/vcpu_switch.S           | 0
 {arch => drivers/staging}/riscv/kvm/vcpu_timer.c            | 0
 {arch => drivers/staging}/riscv/kvm/vm.c                    | 0
 {arch => drivers/staging}/riscv/kvm/vmid.c                  | 0
 19 files changed, 5 insertions(+), 5 deletions(-)
 rename {arch => drivers/staging}/riscv/kvm/Kconfig (100%)
 rename {arch => drivers/staging}/riscv/kvm/Makefile (69%)
 rename {arch/riscv/include => drivers/staging/riscv/kvm}/asm/kvm_csr.h (100%)
 rename {arch/riscv/include => drivers/staging/riscv/kvm}/asm/kvm_host.h (100%)
 rename {arch/riscv/include => drivers/staging/riscv/kvm}/asm/kvm_types.h (100%)
 rename {arch/riscv/include => drivers/staging/riscv/kvm}/asm/kvm_vcpu_timer.h (100%)
 rename {arch => drivers/staging}/riscv/kvm/main.c (100%)
 rename {arch => drivers/staging}/riscv/kvm/mmu.c (100%)
 rename {arch => drivers/staging}/riscv/kvm/riscv_offsets.c (100%)
 rename {arch => drivers/staging}/riscv/kvm/tlb.S (100%)
 rename {arch => drivers/staging}/riscv/kvm/vcpu.c (100%)
 rename {arch => drivers/staging}/riscv/kvm/vcpu_exit.c (100%)
 rename {arch => drivers/staging}/riscv/kvm/vcpu_sbi.c (100%)
 rename {arch => drivers/staging}/riscv/kvm/vcpu_switch.S (100%)
 rename {arch => drivers/staging}/riscv/kvm/vcpu_timer.c (100%)
 rename {arch => drivers/staging}/riscv/kvm/vm.c (100%)
 rename {arch => drivers/staging}/riscv/kvm/vmid.c (100%)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d0602ea394bc..e79a73ff86c0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -555,5 +555,5 @@ source "kernel/power/Kconfig"
 
 endmenu
 
-source "arch/riscv/kvm/Kconfig"
+source "drivers/staging/riscv/kvm/Kconfig"
 source "drivers/firmware/Kconfig"
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 05687d8b7b99..e8706c01733c 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -92,7 +92,7 @@ head-y := arch/riscv/kernel/head.o
 
 core-y += arch/riscv/
 core-$(CONFIG_RISCV_ERRATA_ALTERNATIVE) += arch/riscv/errata/
-core-$(CONFIG_KVM) += arch/riscv/kvm/
+core-$(CONFIG_KVM) += drivers/staging/riscv/kvm/
 
 libs-y += arch/riscv/lib/
 libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
diff --git a/arch/riscv/kvm/Kconfig b/drivers/staging/riscv/kvm/Kconfig
similarity index 100%
rename from arch/riscv/kvm/Kconfig
rename to drivers/staging/riscv/kvm/Kconfig
diff --git a/arch/riscv/kvm/Makefile b/drivers/staging/riscv/kvm/Makefile
similarity index 69%
rename from arch/riscv/kvm/Makefile
rename to drivers/staging/riscv/kvm/Makefile
index 938584254aad..3b876b6263e7 100644
--- a/arch/riscv/kvm/Makefile
+++ b/drivers/staging/riscv/kvm/Makefile
@@ -2,10 +2,10 @@
 # Makefile for RISC-V KVM support
 #
 
-common-objs-y = $(addprefix ../../../virt/kvm/, kvm_main.o coalesced_mmio.o)
-common-objs-y += $(addprefix ../../../virt/kvm/, eventfd.o)
+common-objs-y = $(addprefix ../../../../virt/kvm/, kvm_main.o coalesced_mmio.o)
+common-objs-y += $(addprefix ../../../../virt/kvm/, eventfd.o)
 
-ccflags-y := -Ivirt/kvm -Iarch/riscv/kvm
+ccflags-y := -Ivirt/kvm -Idrivers/staging/riscv/kvm
 
 kvm-objs := $(common-objs-y)
 
diff --git a/arch/riscv/include/asm/kvm_csr.h b/drivers/staging/riscv/kvm/asm/kvm_csr.h
similarity index 100%
rename from arch/riscv/include/asm/kvm_csr.h
rename to drivers/staging/riscv/kvm/asm/kvm_csr.h
diff --git a/arch/riscv/include/asm/kvm_host.h b/drivers/staging/riscv/kvm/asm/kvm_host.h
similarity index 100%
rename from arch/riscv/include/asm/kvm_host.h
rename to drivers/staging/riscv/kvm/asm/kvm_host.h
diff --git a/arch/riscv/include/asm/kvm_types.h b/drivers/staging/riscv/kvm/asm/kvm_types.h
similarity index 100%
rename from arch/riscv/include/asm/kvm_types.h
rename to drivers/staging/riscv/kvm/asm/kvm_types.h
diff --git a/arch/riscv/include/asm/kvm_vcpu_timer.h b/drivers/staging/riscv/kvm/asm/kvm_vcpu_timer.h
similarity index 100%
rename from arch/riscv/include/asm/kvm_vcpu_timer.h
rename to drivers/staging/riscv/kvm/asm/kvm_vcpu_timer.h
diff --git a/arch/riscv/kvm/main.c b/drivers/staging/riscv/kvm/main.c
similarity index 100%
rename from arch/riscv/kvm/main.c
rename to drivers/staging/riscv/kvm/main.c
diff --git a/arch/riscv/kvm/mmu.c b/drivers/staging/riscv/kvm/mmu.c
similarity index 100%
rename from arch/riscv/kvm/mmu.c
rename to drivers/staging/riscv/kvm/mmu.c
diff --git a/arch/riscv/kvm/riscv_offsets.c b/drivers/staging/riscv/kvm/riscv_offsets.c
similarity index 100%
rename from arch/riscv/kvm/riscv_offsets.c
rename to drivers/staging/riscv/kvm/riscv_offsets.c
diff --git a/arch/riscv/kvm/tlb.S b/drivers/staging/riscv/kvm/tlb.S
similarity index 100%
rename from arch/riscv/kvm/tlb.S
rename to drivers/staging/riscv/kvm/tlb.S
diff --git a/arch/riscv/kvm/vcpu.c b/drivers/staging/riscv/kvm/vcpu.c
similarity index 100%
rename from arch/riscv/kvm/vcpu.c
rename to drivers/staging/riscv/kvm/vcpu.c
diff --git a/arch/riscv/kvm/vcpu_exit.c b/drivers/staging/riscv/kvm/vcpu_exit.c
similarity index 100%
rename from arch/riscv/kvm/vcpu_exit.c
rename to drivers/staging/riscv/kvm/vcpu_exit.c
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/drivers/staging/riscv/kvm/vcpu_sbi.c
similarity index 100%
rename from arch/riscv/kvm/vcpu_sbi.c
rename to drivers/staging/riscv/kvm/vcpu_sbi.c
diff --git a/arch/riscv/kvm/vcpu_switch.S b/drivers/staging/riscv/kvm/vcpu_switch.S
similarity index 100%
rename from arch/riscv/kvm/vcpu_switch.S
rename to drivers/staging/riscv/kvm/vcpu_switch.S
diff --git a/arch/riscv/kvm/vcpu_timer.c b/drivers/staging/riscv/kvm/vcpu_timer.c
similarity index 100%
rename from arch/riscv/kvm/vcpu_timer.c
rename to drivers/staging/riscv/kvm/vcpu_timer.c
diff --git a/arch/riscv/kvm/vm.c b/drivers/staging/riscv/kvm/vm.c
similarity index 100%
rename from arch/riscv/kvm/vm.c
rename to drivers/staging/riscv/kvm/vm.c
diff --git a/arch/riscv/kvm/vmid.c b/drivers/staging/riscv/kvm/vmid.c
similarity index 100%
rename from arch/riscv/kvm/vmid.c
rename to drivers/staging/riscv/kvm/vmid.c
-- 
2.25.1


