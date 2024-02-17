From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 16 Feb 2024 16:57:35 -0800
Subject: [PATCH RFC 17/20] perf: Add json file for virt machine supported events
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
Message-ID: <20240217005738.3744121-18-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The linux driver will use the event encodings specified in platform
specific json file only for platforms with counter delegation support.

Use the perf json infrastructure to encode those events and let the
driver uses that if counter delegation is available.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/perf/pmu-events/arch/riscv/mapfile.csv  |  1 +
 .../pmu-events/arch/riscv/qemu/virt/cpu.json  | 30 ++++++++
 .../arch/riscv/qemu/virt/firmware.json        | 68 +++++++++++++++++++
 3 files changed, 99 insertions(+)
 create mode 100644 tools/perf/pmu-events/arch/riscv/qemu/virt/cpu.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/qemu/virt/firmware.json

diff --git a/tools/perf/pmu-events/arch/riscv/mapfile.csv b/tools/perf/pmu-events/arch/riscv/mapfile.csv
index cfc449b19810..b3e7d544e29c 100644
--- a/tools/perf/pmu-events/arch/riscv/mapfile.csv
+++ b/tools/perf/pmu-events/arch/riscv/mapfile.csv
@@ -17,3 +17,4 @@
 0x489-0x8000000000000007-0x[[:xdigit:]]+,v1,sifive/u74,core
 0x5b7-0x0-0x0,v1,thead/c900-legacy,core
 0x67e-0x80000000db0000[89]0-0x[[:xdigit:]]+,v1,starfive/dubhe-80,core
+0x0-0x0-0x0,v1,qemu/virt,core
diff --git a/tools/perf/pmu-events/arch/riscv/qemu/virt/cpu.json b/tools/perf/pmu-events/arch/riscv/qemu/virt/cpu.json
new file mode 100644
index 000000000000..9ab631723c88
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/qemu/virt/cpu.json
@@ -0,0 +1,30 @@
+[
+  {
+    "ArchStdEvent": "instructions",
+    "EventCode": "0x02",
+    "Counter":"2,3,4,5,6,7,8,9,10"
+  },
+  {
+    "ArchStdEvent": "cycles",
+    "EventCode": "0x01",
+    "Counter":"0,3,4,5,6,7,8,9,10"
+  },
+  {
+    "EventName": "dTLB-load-misses",
+    "EventCode": "0x10019",
+    "BriefDescription": "Data TLB load miss",
+    "Counter":"3,4,5,6,7,8,9,10"
+  },
+  {
+    "EventName": "dTLB-store-misses",
+    "EventCode": "0x1001B",
+    "BriefDescription": "Data TLB store miss",
+    "Counter":"3,4,5,6,7,8,9,10"
+  },
+  {
+    "EventName": "iTLB-load-misses",
+    "EventCode": "0x10021",
+    "BriefDescription": "Instruction fetch TLB load miss",
+    "Counter":"3,4,5,6,7,8,9,10"
+  }
+]
diff --git a/tools/perf/pmu-events/arch/riscv/qemu/virt/firmware.json b/tools/perf/pmu-events/arch/riscv/qemu/virt/firmware.json
new file mode 100644
index 000000000000..9b4a032186a7
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/qemu/virt/firmware.json
@@ -0,0 +1,68 @@
+[
+  {
+    "ArchStdEvent": "FW_MISALIGNED_LOAD"
+  },
+  {
+    "ArchStdEvent": "FW_MISALIGNED_STORE"
+  },
+  {
+    "ArchStdEvent": "FW_ACCESS_LOAD"
+  },
+  {
+    "ArchStdEvent": "FW_ACCESS_STORE"
+  },
+  {
+    "ArchStdEvent": "FW_ILLEGAL_INSN"
+  },
+  {
+    "ArchStdEvent": "FW_SET_TIMER"
+  },
+  {
+    "ArchStdEvent": "FW_IPI_SENT"
+  },
+  {
+    "ArchStdEvent": "FW_IPI_RECEIVED"
+  },
+  {
+    "ArchStdEvent": "FW_FENCE_I_SENT"
+  },
+  {
+    "ArchStdEvent": "FW_FENCE_I_RECEIVED"
+  },
+  {
+    "ArchStdEvent": "FW_SFENCE_VMA_SENT"
+  },
+  {
+    "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
+  },
+  {
+    "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
+  },
+  {
+    "ArchStdEvent": "FW_SFENCE_VMA_ASID_RECEIVED"
+  },
+  {
+    "ArchStdEvent": "FW_HFENCE_GVMA_SENT"
+  },
+  {
+    "ArchStdEvent": "FW_HFENCE_GVMA_RECEIVED"
+  },
+  {
+    "ArchStdEvent": "FW_HFENCE_GVMA_VMID_SENT"
+  },
+  {
+    "ArchStdEvent": "FW_HFENCE_GVMA_VMID_RECEIVED"
+  },
+  {
+    "ArchStdEvent": "FW_HFENCE_VVMA_SENT"
+  },
+  {
+    "ArchStdEvent": "FW_HFENCE_VVMA_RECEIVED"
+  },
+  {
+    "ArchStdEvent": "FW_HFENCE_VVMA_ASID_SENT"
+  },
+  {
+    "ArchStdEvent": "FW_HFENCE_VVMA_ASID_RECEIVED"
+  }
+]
-- 
2.34.1


