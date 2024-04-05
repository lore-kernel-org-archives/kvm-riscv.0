From: Nicholas Piggin <npiggin@gmail.com>
Date: Fri,  5 Apr 2024 19:00:33 +1000
Subject: [kvm-unit-tests RFC PATCH 01/17] Add initial shellcheck checking
In-Reply-To: <20240405090052.375599-1-npiggin@gmail.com>
References: <20240405090052.375599-1-npiggin@gmail.com>
Message-ID: <20240405090052.375599-2-npiggin@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This adds a basic shellcheck sytle file, some directives to help
find scripts, and a make shellcheck target.

When changes settle down this could be made part of the standard
build / CI flow.

Suggested-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 .shellcheckrc       | 32 ++++++++++++++++++++++++++++++++
 Makefile            |  4 ++++
 README.md           |  2 ++
 scripts/common.bash |  5 ++++-
 4 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 .shellcheckrc

diff --git a/.shellcheckrc b/.shellcheckrc
new file mode 100644
index 000000000..2a9a57c42
--- /dev/null
+++ b/.shellcheckrc
@@ -0,0 +1,32 @@
+# shellcheck configuration file
+external-sources=true
+
+# Optional extras --  https://www.shellcheck.net/wiki/Optional
+# Possibilities, e.g., -
+# quote?safe?variables
+# require-double-brackets
+# require-variable-braces
+# add-default-case
+
+# Disable SC2004 style? I.e.,
+# In run_tests.sh line 67:
+#            if (( $unittest_run_queues <= 0 )); then
+#                  ^------------------^ SC2004 (style): $/${} is unnecessary on arithmetic variables.
+disable=SC2004
+
+# Disable SC2034 - config.mak contains a lot of these unused variable errors.
+# Maybe we could have a script extract the ones used by shell script and put
+# them in a generated file, to re-enable the warning.
+#
+# In config.mak line 1:
+# SRCDIR=/home/npiggin/src/kvm-unit-tests
+# ^----^ SC2034 (warning): SRCDIR appears unused. Verify use (or export if used externally).
+disable=SC2034
+
+# Disable SC2086 for now, double quote to prevent globbing and word
+# splitting. There are lots of places that use it for word splitting
+# (e.g., invoking commands with arguments) that break. Should have a
+# more consistent approach for this (perhaps use arrays for such cases)
+# but for now disable.
+# SC2086 (info): Double quote to prevent globbing and word splitting.
+disable=SC2086
diff --git a/Makefile b/Makefile
index 4e0f54543..4863cfdc6 100644
--- a/Makefile
+++ b/Makefile
@@ -141,6 +141,10 @@ cscope:
 		-name '*.[chsS]' -exec realpath --relative-base=$(CURDIR) {} \; | sort -u > ./cscope.files
 	cscope -bk
 
+.PHONY: shellcheck
+shellcheck:
+	shellcheck -a run_tests.sh */run */efi/run scripts/mkstandalone.sh
+
 .PHONY: tags
 tags:
 	ctags -R
diff --git a/README.md b/README.md
index 6e82dc225..77718675e 100644
--- a/README.md
+++ b/README.md
@@ -193,3 +193,5 @@ with `git config diff.orderFile scripts/git.difforder` enables it.
 
 We strive to follow the Linux kernels coding style so it's recommended
 to run the kernel's ./scripts/checkpatch.pl on new patches.
+
+Also run make shellcheck before submitting a patch.
diff --git a/scripts/common.bash b/scripts/common.bash
index ee1dd8659..3aa557c8c 100644
--- a/scripts/common.bash
+++ b/scripts/common.bash
@@ -82,8 +82,11 @@ function arch_cmd()
 }
 
 # The current file has to be the only file sourcing the arch helper
-# file
+# file. Shellcheck can't follow this so help it out. There doesn't appear to be a
+# way to specify multiple alternatives, so we will have to rethink this if things
+# get more complicated.
 ARCH_FUNC=scripts/${ARCH}/func.bash
 if [ -f "${ARCH_FUNC}" ]; then
+# shellcheck source=scripts/s390x/func.bash
 	source "${ARCH_FUNC}"
 fi
-- 
2.43.0


