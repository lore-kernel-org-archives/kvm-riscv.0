From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 16 Feb 2024 16:57:38 -0800
Subject: [PATCH RFC 20/20] tools/perf: Detect if platform supports counter delegation
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
Message-ID: <20240217005738.3744121-21-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The perf tool currently remap the standard events to the encoding
specified by the platform in the json file. We need that only if
the counter delegation extension is present. Otherwise, SBI PMU
interface is used which defines the encoding for all standard
events.

The hwprobe mechanism can be used to detect the presence of these
extensions and remap the encoding space only in that case.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/perf/arch/riscv/util/Build    |  1 +
 tools/perf/arch/riscv/util/evlist.c |  3 ++-
 tools/perf/arch/riscv/util/pmu.c    | 41 +++++++++++++++++++++++++++++
 tools/perf/arch/riscv/util/pmu.h    | 11 ++++++++
 4 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 tools/perf/arch/riscv/util/pmu.c
 create mode 100644 tools/perf/arch/riscv/util/pmu.h

diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/util/Build
index b581fb3d8677..2358f0666e8d 100644
--- a/tools/perf/arch/riscv/util/Build
+++ b/tools/perf/arch/riscv/util/Build
@@ -1,6 +1,7 @@
 perf-y += perf_regs.o
 perf-y += header.o
 perf-y += evlist.o
+perf-y += pmu.o
 
 perf-$(CONFIG_DWARF) += dwarf-regs.o
 perf-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
diff --git a/tools/perf/arch/riscv/util/evlist.c b/tools/perf/arch/riscv/util/evlist.c
index 9ad287c6f396..aa7eef7280ca 100644
--- a/tools/perf/arch/riscv/util/evlist.c
+++ b/tools/perf/arch/riscv/util/evlist.c
@@ -6,6 +6,7 @@
 #include "util/parse-events.h"
 #include "util/event.h"
 #include "evsel.h"
+#include "pmu.h"
 
 static int pmu_update_cpu_stdevents_callback(const struct pmu_event *pe,
 					     const struct pmu_events_table *table __maybe_unused,
@@ -41,7 +42,7 @@ int arch_evlist__override_default_attrs(struct evlist *evlist, const char *pmu_n
 							  "iTLB-load-misses"};
 	unsigned int i, len = sizeof(overriden_event_arr) / sizeof(char *);
 
-	if (!pmu)
+	if (!pmu || !perf_pmu_riscv_cdeleg_present())
 		return 0;
 
 	for (i = 0; i < len; i++) {
diff --git a/tools/perf/arch/riscv/util/pmu.c b/tools/perf/arch/riscv/util/pmu.c
new file mode 100644
index 000000000000..79f0974e27f8
--- /dev/null
+++ b/tools/perf/arch/riscv/util/pmu.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright Rivos Inc 2024
+ * Author(s): Atish Patra <atishp@rivosinc.com>
+ */
+
+#include <string.h>
+#include <stdio.h>
+#include <asm/hwprobe.h>
+#include <unistd.h>
+#include <sys/syscall.h>
+
+#include "pmu.h"
+
+static bool counter_deleg_present;
+
+bool perf_pmu_riscv_cdeleg_present(void)
+{
+	return counter_deleg_present;
+}
+
+void perf_pmu__arch_init(struct perf_pmu *pmu __maybe_unused)
+{
+	struct riscv_hwprobe isa_ext;
+	int ret;
+
+	isa_ext.key = RISCV_HWPROBE_KEY_IMA_EXT_0;
+
+	ret = syscall(__NR_riscv_hwprobe, &isa_ext, 1, 0, NULL, 0);
+	if (ret)
+		return;
+
+	if (isa_ext.key < 0)
+		return;
+
+	if ((isa_ext.value & RISCV_HWPROBE_EXT_SSCSRIND) &&
+	    (isa_ext.value & RISCV_HWPROBE_EXT_SMCDELEG) &&
+	    (isa_ext.value & RISCV_HWPROBE_EXT_SSCCFG))
+		counter_deleg_present = true;
+}
diff --git a/tools/perf/arch/riscv/util/pmu.h b/tools/perf/arch/riscv/util/pmu.h
new file mode 100644
index 000000000000..21f33f7d323d
--- /dev/null
+++ b/tools/perf/arch/riscv/util/pmu.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __RISCV_UTIL_PMU_H
+#define __RISCV_UTIL_PMU_H
+
+#include "../../../util/pmu.h"
+
+
+bool perf_pmu_riscv_cdeleg_present(void);
+
+#endif
-- 
2.34.1


