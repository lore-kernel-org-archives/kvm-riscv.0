From: Andreas Schwab <schwab@suse.de>
Date: Mon, 14 Aug 2023 12:02:43 +0200
Subject: [PATCH] tools/kvm_stat: add support for riscv
Message-ID: <mvmbkfadjr0.fsf@suse.de>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 tools/kvm/kvm_stat/kvm_stat | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/kvm/kvm_stat/kvm_stat b/tools/kvm/kvm_stat/kvm_stat
index 15bf00e79e3f..05220b9d07dc 100755
--- a/tools/kvm/kvm_stat/kvm_stat
+++ b/tools/kvm/kvm_stat/kvm_stat
@@ -320,6 +320,8 @@ class Arch(object):
             return ArchA64()
         elif machine.startswith('s390'):
             return ArchS390()
+        elif machine.startswith('riscv'):
+            return ArchRISCV()
         else:
             # X86_64
             for line in open('/proc/cpuinfo'):
@@ -396,6 +398,18 @@ class ArchS390(Arch):
             return 'exit_instruction'
 
 
+class ArchRISCV(Arch):
+    def __init__(self):
+        self.sc_perf_evt_open = 241
+        self.ioctl_numbers = IOCTL_NUMBERS
+        self.exit_reason_field = None
+        self.exit_reasons = None
+
+    def debugfs_is_child(self, field):
+        """ Returns name of parent if 'field' is a child, None otherwise """
+        return None
+
+
 ARCH = Arch.get_arch()
 
 
-- 
2.41.0


-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

