From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 16 Feb 2024 16:57:33 -0800
Subject: [PATCH RFC 15/20] tools/perf: Add arch hooks to override perf standard events
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
Message-ID: <20240217005738.3744121-16-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

RISC-V doesn't have any standard event encoding defined in the
ISA. Cycle/instruction event is defined in the ISA but lack of
event encoding allow vendors to choose their own encoding scheme.
These events directly map to perf cycle/instruction events which
gets decoded as per perf definitions. An arch hooks allows the
RISC-V implementation to override the encodings if a vendor has
specified the encodings via Json file at runtime.

The alternate solution would be define vendor specific encodings in
the driver similar to other architectures. However, these will grow
over time to become unmaintainable as the number of vendors in RISC-V
can be huge.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/perf/arch/riscv/util/Build              |  1 +
 tools/perf/arch/riscv/util/evlist.c           | 59 +++++++++++++++++++
 tools/perf/builtin-record.c                   |  3 +
 tools/perf/builtin-stat.c                     |  2 +
 tools/perf/builtin-top.c                      |  3 +
 .../pmu-events/arch/riscv/arch-standard.json  | 10 ++++
 tools/perf/pmu-events/jevents.py              |  6 ++
 tools/perf/util/evlist.c                      |  6 ++
 tools/perf/util/evlist.h                      |  6 ++
 9 files changed, 96 insertions(+)
 create mode 100644 tools/perf/arch/riscv/util/evlist.c
 create mode 100644 tools/perf/pmu-events/arch/riscv/arch-standard.json

diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/util/Build
index 603dbb5ae4dc..b581fb3d8677 100644
--- a/tools/perf/arch/riscv/util/Build
+++ b/tools/perf/arch/riscv/util/Build
@@ -1,5 +1,6 @@
 perf-y += perf_regs.o
 perf-y += header.o
+perf-y += evlist.o
 
 perf-$(CONFIG_DWARF) += dwarf-regs.o
 perf-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
diff --git a/tools/perf/arch/riscv/util/evlist.c b/tools/perf/arch/riscv/util/evlist.c
new file mode 100644
index 000000000000..9ad287c6f396
--- /dev/null
+++ b/tools/perf/arch/riscv/util/evlist.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <stdio.h>
+#include "util/pmu.h"
+#include "util/pmus.h"
+#include "util/evlist.h"
+#include "util/parse-events.h"
+#include "util/event.h"
+#include "evsel.h"
+
+static int pmu_update_cpu_stdevents_callback(const struct pmu_event *pe,
+					     const struct pmu_events_table *table __maybe_unused,
+					     void *vdata)
+{
+	struct evsel *evsel = vdata;
+	struct parse_events_terms terms;
+	int err;
+	struct perf_pmu *pmu = perf_pmus__find("cpu");
+
+	if (pe->event) {
+		parse_events_terms__init(&terms);
+		err = parse_events_terms(&terms, pe->event, NULL);
+		if (err)
+			goto out_free;
+		err = perf_pmu__config_terms(pmu, &evsel->core.attr, &terms,
+					     /*zero=*/true, /*err=*/NULL);
+		if (err)
+			goto out_free;
+	}
+
+out_free:
+	parse_events_terms__exit(&terms);
+	return 0;
+}
+
+int arch_evlist__override_default_attrs(struct evlist *evlist, const char *pmu_name)
+{
+	struct evsel *evsel;
+	struct perf_pmu *pmu = perf_pmus__find(pmu_name);
+	static const char *const overriden_event_arr[] = {"cycles", "instructions",
+							  "dTLB-load-misses", "dTLB-store-misses",
+							  "iTLB-load-misses"};
+	unsigned int i, len = sizeof(overriden_event_arr) / sizeof(char *);
+
+	if (!pmu)
+		return 0;
+
+	for (i = 0; i < len; i++) {
+		if (perf_pmus__have_event(pmu_name, overriden_event_arr[i])) {
+			evsel = evlist__find_evsel_by_str(evlist, overriden_event_arr[i]);
+			if (!evsel)
+				continue;
+			pmu_events_table__find_event(pmu->events_table, pmu,
+						     overriden_event_arr[i],
+						     pmu_update_cpu_stdevents_callback, evsel);
+		}
+	}
+
+	return 0;
+}
diff --git a/tools/perf/builtin-record.c b/tools/perf/builtin-record.c
index 86c910125172..305c2c030208 100644
--- a/tools/perf/builtin-record.c
+++ b/tools/perf/builtin-record.c
@@ -4152,6 +4152,9 @@ int cmd_record(int argc, const char **argv)
 			goto out;
 	}
 
+	if (arch_evlist__override_default_attrs(rec->evlist, "cpu"))
+		goto out;
+
 	if (rec->opts.target.tid && !rec->opts.no_inherit_set)
 		rec->opts.no_inherit = true;
 
diff --git a/tools/perf/builtin-stat.c b/tools/perf/builtin-stat.c
index 5fe9abc6a524..a0feafc5be2c 100644
--- a/tools/perf/builtin-stat.c
+++ b/tools/perf/builtin-stat.c
@@ -2713,6 +2713,8 @@ int cmd_stat(int argc, const char **argv)
 
 	if (add_default_attributes())
 		goto out;
+	if (arch_evlist__override_default_attrs(evsel_list, "cpu"))
+		goto out;
 
 	if (stat_config.cgroup_list) {
 		if (nr_cgroups > 0) {
diff --git a/tools/perf/builtin-top.c b/tools/perf/builtin-top.c
index 5301d1badd43..7e268f239df0 100644
--- a/tools/perf/builtin-top.c
+++ b/tools/perf/builtin-top.c
@@ -1672,6 +1672,9 @@ int cmd_top(int argc, const char **argv)
 			goto out_delete_evlist;
 	}
 
+	if (arch_evlist__override_default_attrs(top.evlist, "cpu"))
+		goto out_delete_evlist;
+
 	status = evswitch__init(&top.evswitch, top.evlist, stderr);
 	if (status)
 		goto out_delete_evlist;
diff --git a/tools/perf/pmu-events/arch/riscv/arch-standard.json b/tools/perf/pmu-events/arch/riscv/arch-standard.json
new file mode 100644
index 000000000000..96e21f088558
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/arch-standard.json
@@ -0,0 +1,10 @@
+[
+  {
+    "EventName": "cycles",
+    "BriefDescription": "cycle executed"
+  },
+  {
+    "EventName": "instructions",
+    "BriefDescription": "instruction retired"
+  }
+]
diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 81e465a43c75..30934a490109 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -7,6 +7,7 @@ from functools import lru_cache
 import json
 import metric
 import os
+import re
 import sys
 from typing import (Callable, Dict, Optional, Sequence, Set, Tuple)
 import collections
@@ -388,6 +389,11 @@ class JsonEvent:
     if arch_std:
       if arch_std.lower() in _arch_std_events:
         event = _arch_std_events[arch_std.lower()].event
+        if eventcode:
+          event = re.sub(r'event=\d+', f'event={llx(eventcode)}', event)
+        if configcode:
+          event = re.sub(r'config=\d+', f'event={llx(configcode)}', event)
+
         # Copy from the architecture standard event to self for undefined fields.
         for attr, value in _arch_std_events[arch_std.lower()].__dict__.items():
           if hasattr(self, attr) and not getattr(self, attr):
diff --git a/tools/perf/util/evlist.c b/tools/perf/util/evlist.c
index 55a300a0977b..f8a5640cf4fa 100644
--- a/tools/perf/util/evlist.c
+++ b/tools/perf/util/evlist.c
@@ -357,6 +357,12 @@ __weak int arch_evlist__add_default_attrs(struct evlist *evlist,
 	return __evlist__add_default_attrs(evlist, attrs, nr_attrs);
 }
 
+__weak int arch_evlist__override_default_attrs(struct evlist *evlist __maybe_unused,
+					       const char *pmu_name __maybe_unused)
+{
+	return 0;
+}
+
 struct evsel *evlist__find_tracepoint_by_id(struct evlist *evlist, int id)
 {
 	struct evsel *evsel;
diff --git a/tools/perf/util/evlist.h b/tools/perf/util/evlist.h
index cb91dc9117a2..705b6643b558 100644
--- a/tools/perf/util/evlist.h
+++ b/tools/perf/util/evlist.h
@@ -109,9 +109,15 @@ int arch_evlist__add_default_attrs(struct evlist *evlist,
 				   struct perf_event_attr *attrs,
 				   size_t nr_attrs);
 
+
 #define evlist__add_default_attrs(evlist, array) \
 	arch_evlist__add_default_attrs(evlist, array, ARRAY_SIZE(array))
 
+int arch_evlist__override_default_attrs(struct evlist *evlist, const char *pmu_name);
+
+#define evlist__override_default_attrs(evlist, pmu_name) \
+	arch_evlist__override_default_attrs(evlist, pmu_name)
+
 int arch_evlist__cmp(const struct evsel *lhs, const struct evsel *rhs);
 
 int evlist__add_dummy(struct evlist *evlist);
-- 
2.34.1


