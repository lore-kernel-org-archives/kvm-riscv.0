From: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 Sep 2023 17:31:06 -0700
Subject: [PATCH 14/26] KVM: arm64: Move ARM specific headers in include/kvm to
 arch directory
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
References: <20230916003118.2540661-1-seanjc@google.com>
Message-ID: <20230916003118.2540661-15-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move kvm/arm_{arch_timer,pmu,vgic}.h to arch/arm64/include/asm and drop
the "arm" prefix from all file names.  Now that KVM no longer supports
32-bit ARM, there is no reason to expose ARM specific headers to other
architectures beyond arm64.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../arm64/include/asm/kvm_arch_timer.h                     | 0
 arch/arm64/include/asm/kvm_host.h                          | 7 +++----
 include/kvm/arm_pmu.h => arch/arm64/include/asm/kvm_pmu.h  | 0
 .../kvm/arm_vgic.h => arch/arm64/include/asm/kvm_vgic.h    | 0
 arch/arm64/kvm/arch_timer.c                                | 5 ++---
 arch/arm64/kvm/arm.c                                       | 3 +--
 arch/arm64/kvm/pmu-emul.c                                  | 6 +++---
 arch/arm64/kvm/reset.c                                     | 3 +--
 arch/arm64/kvm/trace_arm.h                                 | 2 +-
 arch/arm64/kvm/vgic/vgic-debug.c                           | 2 +-
 arch/arm64/kvm/vgic/vgic-init.c                            | 2 +-
 arch/arm64/kvm/vgic/vgic-irqfd.c                           | 2 +-
 arch/arm64/kvm/vgic/vgic-kvm-device.c                      | 2 +-
 arch/arm64/kvm/vgic/vgic-mmio-v2.c                         | 2 +-
 arch/arm64/kvm/vgic/vgic-mmio-v3.c                         | 2 +-
 arch/arm64/kvm/vgic/vgic-mmio.c                            | 4 ++--
 arch/arm64/kvm/vgic/vgic-v2.c                              | 2 +-
 arch/arm64/kvm/vgic/vgic-v3.c                              | 2 +-
 18 files changed, 21 insertions(+), 25 deletions(-)
 rename include/kvm/arm_arch_timer.h => arch/arm64/include/asm/kvm_arch_timer.h (100%)
 rename include/kvm/arm_pmu.h => arch/arm64/include/asm/kvm_pmu.h (100%)
 rename include/kvm/arm_vgic.h => arch/arm64/include/asm/kvm_vgic.h (100%)

diff --git a/include/kvm/arm_arch_timer.h b/arch/arm64/include/asm/kvm_arch_timer.h
similarity index 100%
rename from include/kvm/arm_arch_timer.h
rename to arch/arm64/include/asm/kvm_arch_timer.h
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index af06ccb7ee34..90cfbf420545 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -26,16 +26,15 @@
 #include <asm/daifflags.h>
 #include <asm/fpsimd.h>
 #include <asm/kvm.h>
+#include <asm/kvm_arch_timer.h>
 #include <asm/kvm_asm.h>
+#include <asm/kvm_pmu.h>
+#include <asm/kvm_vgic.h>
 
 #define __KVM_HAVE_ARCH_INTC_INITIALIZED
 
 #define KVM_HALT_POLL_NS_DEFAULT 500000
 
-#include <kvm/arm_vgic.h>
-#include <kvm/arm_arch_timer.h>
-#include <kvm/arm_pmu.h>
-
 #define KVM_MAX_VCPUS VGIC_V3_MAX_CPUS
 
 #define KVM_VCPU_MAX_FEATURES 7
diff --git a/include/kvm/arm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
similarity index 100%
rename from include/kvm/arm_pmu.h
rename to arch/arm64/include/asm/kvm_pmu.h
diff --git a/include/kvm/arm_vgic.h b/arch/arm64/include/asm/kvm_vgic.h
similarity index 100%
rename from include/kvm/arm_vgic.h
rename to arch/arm64/include/asm/kvm_vgic.h
diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 6dcdae4d38cb..5e40bea8f3f3 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -14,12 +14,11 @@
 
 #include <clocksource/arm_arch_timer.h>
 #include <asm/arch_timer.h>
+#include <asm/kvm_arch_timer.h>
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_nested.h>
-
-#include <kvm/arm_vgic.h>
-#include <kvm/arm_arch_timer.h>
+#include <asm/kvm_vgic.h>
 
 #include "trace.h"
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 6de1d63b981b..6480628197b4 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -39,10 +39,9 @@
 #include <asm/kvm_nested.h>
 #include <asm/kvm_pkvm.h>
 #include <asm/kvm_emulate.h>
+#include <asm/kvm_pmu.h>
 #include <asm/sections.h>
 
-#include <kvm/arm_pmu.h>
-
 #include "arm_hypercalls.h"
 #include "arm_psci.h"
 
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 6b066e04dc5d..b5d999adce56 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -11,10 +11,10 @@
 #include <linux/perf_event.h>
 #include <linux/perf/arm_pmu.h>
 #include <linux/uaccess.h>
-#include <asm/kvm_emulate.h>
-#include <kvm/arm_pmu.h>
-#include <kvm/arm_vgic.h>
 #include <asm/arm_pmuv3.h>
+#include <asm/kvm_emulate.h>
+#include <asm/kvm_pmu.h>
+#include <asm/kvm_vgic.h>
 
 #define PERF_ATTR_CFG1_COUNTER_64BIT	BIT(0)
 
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 7a65a35ee4ac..ad5e239774f1 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -17,12 +17,11 @@
 #include <linux/string.h>
 #include <linux/types.h>
 
-#include <kvm/arm_arch_timer.h>
-
 #include <asm/cpufeature.h>
 #include <asm/cputype.h>
 #include <asm/fpsimd.h>
 #include <asm/ptrace.h>
+#include <asm/kvm_arch_timer.h>
 #include <asm/kvm_arm.h>
 #include <asm/kvm_asm.h>
 #include <asm/kvm_emulate.h>
diff --git a/arch/arm64/kvm/trace_arm.h b/arch/arm64/kvm/trace_arm.h
index 8ad53104934d..76ef72de6133 100644
--- a/arch/arm64/kvm/trace_arm.h
+++ b/arch/arm64/kvm/trace_arm.h
@@ -3,7 +3,7 @@
 #define _TRACE_ARM_ARM64_KVM_H
 
 #include <asm/kvm_emulate.h>
-#include <kvm/arm_arch_timer.h>
+#include <asm/kvm_arch_timer.h>
 #include <linux/tracepoint.h>
 
 #undef TRACE_SYSTEM
diff --git a/arch/arm64/kvm/vgic/vgic-debug.c b/arch/arm64/kvm/vgic/vgic-debug.c
index 07aa0437125a..2d542040008c 100644
--- a/arch/arm64/kvm/vgic/vgic-debug.c
+++ b/arch/arm64/kvm/vgic/vgic-debug.c
@@ -9,7 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/kvm_host.h>
 #include <linux/seq_file.h>
-#include <kvm/arm_vgic.h>
+#include <asm/kvm_vgic.h>
 #include <asm/kvm_mmu.h>
 #include "vgic.h"
 
diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index c8c3cb812783..9f548ffac90b 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -7,7 +7,7 @@
 #include <linux/interrupt.h>
 #include <linux/cpu.h>
 #include <linux/kvm_host.h>
-#include <kvm/arm_vgic.h>
+#include <asm/kvm_vgic.h>
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_mmu.h>
 #include "vgic.h"
diff --git a/arch/arm64/kvm/vgic/vgic-irqfd.c b/arch/arm64/kvm/vgic/vgic-irqfd.c
index 475059bacedf..c35e1a138617 100644
--- a/arch/arm64/kvm/vgic/vgic-irqfd.c
+++ b/arch/arm64/kvm/vgic/vgic-irqfd.c
@@ -6,7 +6,7 @@
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
 #include <trace/events/kvm.h>
-#include <kvm/arm_vgic.h>
+#include <asm/kvm_vgic.h>
 #include "vgic.h"
 
 /**
diff --git a/arch/arm64/kvm/vgic/vgic-kvm-device.c b/arch/arm64/kvm/vgic/vgic-kvm-device.c
index 212b73a715c1..2c7027d675c9 100644
--- a/arch/arm64/kvm/vgic/vgic-kvm-device.c
+++ b/arch/arm64/kvm/vgic/vgic-kvm-device.c
@@ -6,7 +6,7 @@
  * Author: Marc Zyngier <marc.zyngier@arm.com>
  */
 #include <linux/kvm_host.h>
-#include <kvm/arm_vgic.h>
+#include <asm/kvm_vgic.h>
 #include <linux/uaccess.h>
 #include <asm/kvm_mmu.h>
 #include <asm/cputype.h>
diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v2.c b/arch/arm64/kvm/vgic/vgic-mmio-v2.c
index e070cda86e12..bba0cfeefffe 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v2.c
@@ -9,7 +9,7 @@
 #include <linux/nospec.h>
 
 #include <kvm/iodev.h>
-#include <kvm/arm_vgic.h>
+#include <asm/kvm_vgic.h>
 
 #include "vgic.h"
 #include "vgic-mmio.h"
diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index 188d2187eede..d54a90beef61 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -9,11 +9,11 @@
 #include <linux/kvm_host.h>
 #include <linux/interrupt.h>
 #include <kvm/iodev.h>
-#include <kvm/arm_vgic.h>
 
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_arm.h>
 #include <asm/kvm_mmu.h>
+#include <asm/kvm_vgic.h>
 
 #include "vgic.h"
 #include "vgic-mmio.h"
diff --git a/arch/arm64/kvm/vgic/vgic-mmio.c b/arch/arm64/kvm/vgic/vgic-mmio.c
index ff558c05e990..68a3d8062473 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio.c
@@ -10,8 +10,8 @@
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
 #include <kvm/iodev.h>
-#include <kvm/arm_arch_timer.h>
-#include <kvm/arm_vgic.h>
+#include <asm/kvm_arch_timer.h>
+#include <asm/kvm_vgic.h>
 
 #include "vgic.h"
 #include "vgic-mmio.h"
diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index 7e9cdb78f7ce..7eacf1c850a5 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -6,7 +6,7 @@
 #include <linux/irqchip/arm-gic.h>
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
-#include <kvm/arm_vgic.h>
+#include <asm/kvm_vgic.h>
 #include <asm/kvm_mmu.h>
 
 #include "vgic.h"
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 3dfc8b84e03e..e8501828072b 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -6,7 +6,7 @@
 #include <linux/kstrtox.h>
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
-#include <kvm/arm_vgic.h>
+#include <asm/kvm_vgic.h>
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_asm.h>
-- 
2.42.0.459.ge4e396fd5e-goog


