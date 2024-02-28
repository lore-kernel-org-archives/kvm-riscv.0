From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 28 Feb 2024 16:04:28 +0100
Subject: [kvm-unit-tests PATCH 12/13] riscv: efi: Add run script
In-Reply-To: <20240228150416.248948-15-andrew.jones@linux.dev>
References: <20240228150416.248948-15-andrew.jones@linux.dev>
Message-ID: <20240228150416.248948-27-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Adapt Arm's efi run script to riscv. We can now run efi tests with
run_tests.sh.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 configure     |   2 +-
 riscv/efi/run | 106 ++++++++++++++++++++++++++++++++++++++++++++++++++
 riscv/run     |   2 +-
 3 files changed, 108 insertions(+), 2 deletions(-)
 create mode 100755 riscv/efi/run

diff --git a/configure b/configure
index cb1718ce12e6..94b243fd1b26 100755
--- a/configure
+++ b/configure
@@ -94,7 +94,7 @@ usage() {
 	                           Select whether to run EFI tests directly with QEMU's -kernel
 	                           option. When not enabled, tests will be placed in an EFI file
 	                           system and run from the UEFI shell. Ignored when efi isn't enabled.
-	                           (arm64 only)
+	                           (arm64 and riscv64 only)
 EOF
     exit 1
 }
diff --git a/riscv/efi/run b/riscv/efi/run
new file mode 100755
index 000000000000..982b8b9c455a
--- /dev/null
+++ b/riscv/efi/run
@@ -0,0 +1,106 @@
+#!/bin/bash
+
+if [ $# -eq 0 ]; then
+	echo "Usage $0 TEST_CASE [QEMU_ARGS]"
+	exit 2
+fi
+
+if [ ! -f config.mak ]; then
+	echo "run './configure --enable-efi && make' first. See ./configure -h"
+	exit 2
+fi
+source config.mak
+source scripts/arch-run.bash
+
+if [ -f RISCV_VIRT_CODE.fd ]; then
+	DEFAULT_UEFI=RISCV_VIRT_CODE.fd
+fi
+
+KERNEL_NAME=$1
+
+: "${EFI_SRC:=$TEST_DIR}"
+: "${EFI_UEFI:=$DEFAULT_UEFI}"
+: "${EFI_TEST:=efi-tests}"
+: "${EFI_CASE:=$(basename $KERNEL_NAME .efi)}"
+: "${EFI_TESTNAME:=$TESTNAME}"
+: "${EFI_TESTNAME:=$EFI_CASE}"
+: "${EFI_CASE_DIR:="$EFI_TEST/$EFI_TESTNAME"}"
+: "${EFI_VAR_GUID:=97ef3e03-7329-4a6a-b9ba-6c1fdcc5f823}"
+
+if [ ! -f "$EFI_UEFI" ]; then
+	echo "UEFI firmware not found."
+	echo "Please specify the path with the env variable EFI_UEFI"
+	exit 2
+fi
+
+if [ "$EFI_USE_ACPI" = "y" ]; then
+	echo "ACPI not available"
+	exit 2
+fi
+
+# Remove the TEST_CASE from $@
+shift 1
+
+# Fish out the arguments for the test, they should be the next string
+# after the "-append" option
+qemu_args=()
+cmd_args=()
+while (( "$#" )); do
+	if [ "$1" = "-append" ]; then
+		cmd_args=$2
+		shift 2
+	else
+		qemu_args+=("$1")
+		shift 1
+	fi
+done
+
+if [ "$EFI_CASE" = "_NO_FILE_4Uhere_" ]; then
+	EFI_CASE_DIR="$EFI_TEST/dummy"
+	mkdir -p "$EFI_CASE_DIR"
+	$TEST_DIR/run \
+		$EFI_CASE \
+		-machine pflash0=pflash0 \
+		-blockdev node-name=pflash0,driver=file,read-only=on,filename="$EFI_UEFI" \
+		-drive file.dir="$EFI_CASE_DIR/",file.driver=vvfat,file.rw=on,format=raw,if=virtio \
+		"${qemu_args[@]}"
+	exit
+fi
+
+uefi_shell_run()
+{
+	mkdir -p "$EFI_CASE_DIR"
+	cp "$EFI_SRC/$EFI_CASE.efi" "$EFI_CASE_DIR/"
+	echo "@echo -off" > "$EFI_CASE_DIR/startup.nsh"
+	if [ "$EFI_USE_ACPI" != "y" ]; then
+		qemu_args+=(-machine acpi=off)
+		FDT_BASENAME="dtb"
+		UEFI_SHELL_RUN=y $TEST_DIR/run \
+			-machine pflash0=pflash0 \
+			-blockdev node-name=pflash0,driver=file,read-only=on,filename="$EFI_UEFI" \
+			-machine dumpdtb="$EFI_CASE_DIR/$FDT_BASENAME" \
+			"${qemu_args[@]}"
+		echo "setvar fdtfile -guid $EFI_VAR_GUID -rt =L\"$FDT_BASENAME\""  >> "$EFI_CASE_DIR/startup.nsh"
+	fi
+	echo "$EFI_CASE.efi" "${cmd_args[@]}" >> "$EFI_CASE_DIR/startup.nsh"
+
+	UEFI_SHELL_RUN=y $TEST_DIR/run \
+		-machine pflash0=pflash0 \
+		-blockdev node-name=pflash0,driver=file,read-only=on,filename="$EFI_UEFI" \
+		-drive file.dir="$EFI_CASE_DIR/",file.driver=vvfat,file.rw=on,format=raw,if=virtio \
+		"${qemu_args[@]}"
+}
+
+if [ "$EFI_DIRECT" = "y" ]; then
+	if [ "$EFI_USE_ACPI" != "y" ]; then
+		qemu_args+=(-machine acpi=off)
+	fi
+	$TEST_DIR/run \
+		$KERNEL_NAME \
+		-append "$(basename $KERNEL_NAME) ${cmd_args[@]}" \
+		-machine pflash0=pflash0 \
+		-blockdev node-name=pflash0,driver=file,read-only=on,filename="$EFI_UEFI" \
+		"${qemu_args[@]}"
+else
+	uefi_shell_run
+fi
diff --git a/riscv/run b/riscv/run
index cbe5dd792dcd..73f2bf54dc32 100755
--- a/riscv/run
+++ b/riscv/run
@@ -33,7 +33,7 @@ command="$qemu -nodefaults -nographic -serial mon:stdio"
 command+=" $mach $acc $firmware -cpu $processor "
 command="$(migration_cmd) $(timeout_cmd) $command"
 
-if [ "$EFI_RUN" = "y" ]; then
+if [ "$UEFI_SHELL_RUN" = "y" ]; then
 	ENVIRON_DEFAULT=n run_qemu_status $command "$@"
 else
 	# We return the exit code via stdout, not via the QEMU return code
-- 
2.43.0


