From: Nicholas Piggin <npiggin@gmail.com>
Date: Wed, 21 Feb 2024 13:27:57 +1000
Subject: [kvm-unit-tests PATCH v5 8/8] migration: add a migration selftest
In-Reply-To: <20240221032757.454524-1-npiggin@gmail.com>
References: <20240221032757.454524-1-npiggin@gmail.com>
Message-ID: <20240221032757.454524-9-npiggin@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a selftest for migration support in  guest library and test harness
code. It performs migrations in a tight loop to irritate races and bugs
in the test harness code.

Include the test in s390, powerpc.

Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com> (s390x)
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 common/selftest-migration.c  | 29 +++++++++++++++++++++++++++++
 powerpc/Makefile.common      |  1 +
 powerpc/selftest-migration.c |  1 +
 powerpc/unittests.cfg        |  4 ++++
 s390x/Makefile               |  1 +
 s390x/selftest-migration.c   |  1 +
 s390x/unittests.cfg          |  4 ++++
 7 files changed, 41 insertions(+)
 create mode 100644 common/selftest-migration.c
 create mode 120000 powerpc/selftest-migration.c
 create mode 120000 s390x/selftest-migration.c

diff --git a/common/selftest-migration.c b/common/selftest-migration.c
new file mode 100644
index 000000000..54b5d6b2d
--- /dev/null
+++ b/common/selftest-migration.c
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Machine independent migration tests
+ *
+ * This is just a very simple test that is intended to stress the migration
+ * support in the test harness. This could be expanded to test more guest
+ * library code, but architecture-specific tests should be used to test
+ * migration of tricky machine state.
+ */
+#include <libcflat.h>
+#include <migrate.h>
+
+#define NR_MIGRATIONS 30
+
+int main(int argc, char **argv)
+{
+	int i = 0;
+
+	report_prefix_push("migration");
+
+	for (i = 0; i < NR_MIGRATIONS; i++)
+		migrate_quiet();
+
+	report(true, "simple harness stress test");
+
+	report_prefix_pop();
+
+	return report_summary();
+}
diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
index eb88398d8..da4a7bbb8 100644
--- a/powerpc/Makefile.common
+++ b/powerpc/Makefile.common
@@ -6,6 +6,7 @@
 
 tests-common = \
 	$(TEST_DIR)/selftest.elf \
+	$(TEST_DIR)/selftest-migration.elf \
 	$(TEST_DIR)/spapr_hcall.elf \
 	$(TEST_DIR)/rtas.elf \
 	$(TEST_DIR)/emulator.elf \
diff --git a/powerpc/selftest-migration.c b/powerpc/selftest-migration.c
new file mode 120000
index 000000000..bd1eb266d
--- /dev/null
+++ b/powerpc/selftest-migration.c
@@ -0,0 +1 @@
+../common/selftest-migration.c
\ No newline at end of file
diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index e71140aa5..7ce57de02 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -36,6 +36,10 @@ smp = 2
 extra_params = -m 256 -append 'setup smp=2 mem=256'
 groups = selftest
 
+[selftest-migration]
+file = selftest-migration.elf
+groups = selftest migration
+
 [spapr_hcall]
 file = spapr_hcall.elf
 
diff --git a/s390x/Makefile b/s390x/Makefile
index b72f7578f..344d46d68 100644
--- a/s390x/Makefile
+++ b/s390x/Makefile
@@ -1,4 +1,5 @@
 tests = $(TEST_DIR)/selftest.elf
+tests += $(TEST_DIR)/selftest-migration.elf
 tests += $(TEST_DIR)/intercept.elf
 tests += $(TEST_DIR)/emulator.elf
 tests += $(TEST_DIR)/sieve.elf
diff --git a/s390x/selftest-migration.c b/s390x/selftest-migration.c
new file mode 120000
index 000000000..bd1eb266d
--- /dev/null
+++ b/s390x/selftest-migration.c
@@ -0,0 +1 @@
+../common/selftest-migration.c
\ No newline@end of file
diff --git a/s390x/unittests.cfg b/s390x/unittests.cfg
index f5024b6ee..a7ad522ca 100644
--- a/s390x/unittests.cfg
+++ b/s390x/unittests.cfg
@@ -24,6 +24,10 @@ groups = selftest
 # please keep the kernel cmdline in sync with $(TEST_DIR)/selftest.parmfile
 extra_params = -append 'test 123'
 
+[selftest-migration]
+file = selftest-migration.elf
+groups = selftest migration
+
 [intercept]
 file = intercept.elf
 
-- 
2.42.0


