From: Anup Patel <anup.patel@wdc.com>
Date: Wed, 17 Nov 2021 14:17:05 +0530
Subject: [PATCH v2] RISC-V: Enable KVM in RV64 and RV32 defconfigs as a module
Message-ID: <20211117084705.687762-1-anup.patel@wdc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Let's enable KVM RISC-V in RV64 and RV32 defconfigs as module
so that it always built along with the default kernel image.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
Changes since v1:
 - Rebased on Linux-5.16-rc1
 - Removed unwanted stuff from defconfig PATCH1
 - Dropped PATCH2 and PATCH3 since these are already merged via KVM tree
---
 arch/riscv/configs/defconfig      | 2 ++
 arch/riscv/configs/rv32_defconfig | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index c252fd5706d2..ef473e2f503b 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -19,6 +19,8 @@ CONFIG_SOC_VIRT=y
 CONFIG_SOC_MICROCHIP_POLARFIRE=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
+CONFIG_VIRTUALIZATION=y
+CONFIG_KVM=m
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 434ef5b64599..6e9f12ff968a 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -19,6 +19,8 @@ CONFIG_SOC_VIRT=y
 CONFIG_ARCH_RV32I=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
+CONFIG_VIRTUALIZATION=y
+CONFIG_KVM=m
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
-- 
2.25.1


