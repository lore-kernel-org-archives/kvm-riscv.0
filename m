From: Nicholas Piggin <npiggin@gmail.com>
Date: Fri,  9 Feb 2024 17:01:41 +1000
Subject: [kvm-unit-tests PATCH v3 8/8] migration: add a migration selftest
In-Reply-To: <20240209070141.421569-1-npiggin@gmail.com>
References: <20240209070141.421569-1-npiggin@gmail.com>
Message-ID: <20240209070141.421569-9-npiggin@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a selftest for migration support in  guest library and test harness
code. It performs migrations a tight loop to irritate races and bugs in
the test harness code.

Include the test in arm, s390, powerpc.

Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com> (s390x)
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
This has flushed out several bugs in developing the multi migration test
harness code already.

Thanks,
Nick

 arm/Makefile.common          |  1 +
 arm/selftest-migration.c     |  1 +
 arm/unittests.cfg            |  6 ++++++
 common/selftest-migration.c  | 34 ++++++++++++++++++++++++++++++++++
 powerpc/Makefile.common      |  1 +
 powerpc/selftest-migration.c |  1 +
 powerpc/unittests.cfg        |  4 ++++
 s390x/Makefile               |  1 +
 s390x/selftest-migration.c   |  1 +
 s390x/unittests.cfg          |  4 ++++
 10 files changed, 54 insertions(+)
 create mode 120000 arm/selftest-migration.c
 create mode 100644 common/selftest-migration.c
 create mode 120000 powerpc/selftest-migration.c
 create mode 120000 s390x/selftest-migration.c

diff --git a/arm/Makefile.common b/arm/Makefile.common
index f828dbe0..f107c478 100644
--- a/arm/Makefile.common
+++ b/arm/Makefile.common
@@ -5,6 +5,7 @@
 #
 
 tests-common  = $(TEST_DIR)/selftest.$(exe)
+tests-common += $(TEST_DIR)/selftest-migration.$(exe)
 tests-common += $(TEST_DIR)/spinlock-test.$(exe)
 tests-common += $(TEST_DIR)/pci-test.$(exe)
 tests-common += $(TEST_DIR)/pmu.$(exe)
diff --git a/arm/selftest-migration.c b/arm/selftest-migration.c
new file mode 120000
index 00000000..bd1eb266
--- /dev/null
+++ b/arm/selftest-migration.c
@@ -0,0 +1 @@
+../common/selftest-migration.c
\ No newline at end of file
diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index fe601cbb..1ffd9a82 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -55,6 +55,12 @@ smp = $MAX_SMP
 extra_params = -append 'smp'
 groups = selftest
 
+# Test migration
+[selftest-migration]
+file = selftest-migration.flat
+groups = selftest migration
+
+arch = arm64
 # Test PCI emulation
 [pci-test]
 file = pci-test.flat
diff --git a/common/selftest-migration.c b/common/selftest-migration.c
new file mode 100644
index 00000000..f70c505f
--- /dev/null
+++ b/common/selftest-migration.c
@@ -0,0 +1,34 @@
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
+#if defined(__arm__) || defined(__aarch64__)
+/* arm can only call getchar 15 times */
+#define NR_MIGRATIONS 15
+#else
+#define NR_MIGRATIONS 100
+#endif
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
index eb88398d..da4a7bbb 100644
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
index 00000000..bd1eb266
--- /dev/null
+++ b/powerpc/selftest-migration.c
@@ -0,0 +1 @@
+../common/selftest-migration.c
\ No newline at end of file
diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index e71140aa..7ce57de0 100644
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
index b72f7578..344d46d6 100644
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
index 00000000..bd1eb266
--- /dev/null
+++ b/s390x/selftest-migration.c
@@ -0,0 +1 @@
+../common/selftest-migration.c
\ No newline@end of file
diff --git a/s390x/unittests.cfg b/s390x/unittests.cfg
index f5024b6e..a7ad522c 100644
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


