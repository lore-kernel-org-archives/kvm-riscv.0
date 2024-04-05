From: Nicholas Piggin <npiggin@gmail.com>
Date: Fri,  5 Apr 2024 19:00:34 +1000
Subject: [kvm-unit-tests RFC PATCH 02/17] shellcheck: Fix SC2223
In-Reply-To: <20240405090052.375599-1-npiggin@gmail.com>
References: <20240405090052.375599-1-npiggin@gmail.com>
Message-ID: <20240405090052.375599-3-npiggin@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

  SC2223 (info): This default assignment may cause DoS due to globbing.
  Quote it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 run_tests.sh         | 4 ++--
 scripts/runtime.bash | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/run_tests.sh b/run_tests.sh
index bb3024ff9..9067e529e 100755
--- a/run_tests.sh
+++ b/run_tests.sh
@@ -158,8 +158,8 @@ function run_task()
 	fi
 }
 
-: ${unittest_log_dir:=logs}
-: ${unittest_run_queues:=1}
+: "${unittest_log_dir:=logs}"
+: "${unittest_run_queues:=1}"
 config=$TEST_DIR/unittests.cfg
 
 print_testname()
diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index e4ad1962f..2d7ff5baa 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -1,6 +1,6 @@
 : "${RUNTIME_arch_run?}"
-: ${MAX_SMP:=$(getconf _NPROCESSORS_ONLN)}
-: ${TIMEOUT:=90s}
+: "${MAX_SMP:=$(getconf _NPROCESSORS_ONLN)}"
+: "${TIMEOUT:=90s}"
 
 PASS() { echo -ne "\e[32mPASS\e[0m"; }
 SKIP() { echo -ne "\e[33mSKIP\e[0m"; }
-- 
2.43.0


