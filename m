From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 24 Jan 2024 08:18:23 +0100
Subject: [kvm-unit-tests PATCH 07/24] riscv: Add run script and unittests.cfg
In-Reply-To: <20240124071815.6898-26-andrew.jones@linux.dev>
References: <20240124071815.6898-26-andrew.jones@linux.dev>
Message-ID: <20240124071815.6898-33-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

With a run script and a unittests.cfg file we can now run

 $ KVM_UNIT_TESTS_ENV=test-env ./run_tests.sh

where test-env has the environment variables needed for both tests.

Note, to change the SBI implementation under test, for example to
RustSBI, QEMU needs the -bios parameter. The full command line
would be

  qemu-system-riscv64 -nographic -M virt -cpu rv64 \
      -kernel riscv/sbi.flat \
      -bios $PATH_TO_RUSTSBI

and with the run script, it's

  SBI_IMPL="-bios $PATH_TO_RUSTSBI" ./run_tests.sh -g sbi

(note the '-g sbi' to only run the SBI test group)

Finally, with the addition of the run script, 'make standalone' now
also works.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/run           | 38 ++++++++++++++++++++++++++++++++++++++
 riscv/unittests.cfg | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100755 riscv/run
 create mode 100644 riscv/unittests.cfg

diff --git a/riscv/run b/riscv/run
new file mode 100755
index 000000000000..8a189e5349a2
--- /dev/null
+++ b/riscv/run
@@ -0,0 +1,38 @@
+#!/usr/bin/env bash
+
+if [ -z "$KUT_STANDALONE" ]; then
+	if [ ! -f config.mak ]; then
+		echo "run ./configure && make first. See ./configure -h"
+		exit 2
+	fi
+	source config.mak
+	source scripts/arch-run.bash
+fi
+
+if [[ $PROCESSOR == "riscv32" ]]; then
+	processor="rv32"
+elif [[ $PROCESSOR == "riscv64" ]]; then
+	processor="rv64"
+fi
+
+set_qemu_accelerator || exit $?
+[ "$ACCEL" = "kvm" ] && QEMU_ARCH=$HOST
+acc="-accel $ACCEL$ACCEL_PROPS"
+
+qemu=$(search_qemu_binary) || exit $?
+if ! $qemu -machine '?' | grep -q 'RISC-V VirtIO board'; then
+	echo "$qemu doesn't support mach-virt ('-machine virt'). Exiting."
+	exit 2
+fi
+mach='-machine virt'
+
+command="$qemu -nodefaults -nographic -serial mon:stdio"
+command+=" $mach $acc -cpu $processor "
+command="$(migration_cmd) $(timeout_cmd) $command"
+
+if [ "$EFI_RUN" = "y" ]; then
+	ENVIRON_DEFAULT=n run_qemu_status $command "$@"
+else
+	# We return the exit code via stdout, not via the QEMU return code
+	run_qemu_status $command -kernel "$@"
+fi
diff --git a/riscv/unittests.cfg b/riscv/unittests.cfg
new file mode 100644
index 000000000000..3840136064ee
--- /dev/null
+++ b/riscv/unittests.cfg
@@ -0,0 +1,37 @@
+##############################################################################
+# unittest configuration
+#
+# [unittest_name]
+# file = <name>.flat		# Name of the flat file to be used.
+# smp  = <num>			# Number of processors the VM will use
+#				# during this test. Use $MAX_SMP to use
+#				# the maximum the host supports. Defaults
+#				# to one.
+# extra_params = -append <params...>	# Additional parameters used.
+# arch = riscv32|riscv64		# Select one if the test case is
+#					# specific to only one.
+# groups = <group_name1> <group_name2> ...	# Used to identify test cases
+#						# with run_tests -g ...
+#						# Specify group_name=nodefault
+#						# to have test not run by
+#						# default
+# accel = kvm|tcg		# Optionally specify if test must run with
+#				# kvm or tcg. If not specified, then kvm will
+#				# be used when available.
+# timeout = <duration>		# Optionally specify a timeout.
+# check = <path>=<value> # check a file for a particular value before running
+#                        # a test. The check line can contain multiple files
+#                        # to check separated by a space but each check
+#                        # parameter needs to be of the form <path>=<value>
+##############################################################################
+
+[selftest]
+file = selftest.flat
+smp = 16
+extra_params = -append 'foo bar baz'
+groups = selftest
+
+[sbi]
+file = sbi.flat
+extra_params = $SBI_IMPL
+groups = sbi
-- 
2.43.0


