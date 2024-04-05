From: Nicholas Piggin <npiggin@gmail.com>
Date: Fri,  5 Apr 2024 19:00:35 +1000
Subject: [kvm-unit-tests RFC PATCH 03/17] shellcheck: Fix SC2295
In-Reply-To: <20240405090052.375599-1-npiggin@gmail.com>
References: <20240405090052.375599-1-npiggin@gmail.com>
Message-ID: <20240405090052.375599-4-npiggin@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

  SC2295 (info): Expansions inside ${..} need to be quoted separately,
  otherwise they match as patterns.

Doesn't appear to be a bug since the match string does not include
patterns.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 run_tests.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/run_tests.sh b/run_tests.sh
index 9067e529e..116188e92 100755
--- a/run_tests.sh
+++ b/run_tests.sh
@@ -99,7 +99,7 @@ else
         local testname="$1"
         CR=$'\r'
         while read -r line; do
-            line="${line%$CR}"
+            line="${line%"$CR"}"
             case "${line:0:4}" in
                 PASS)
                     echo "ok TEST_NUMBER - ${testname}: ${line#??????}" >&3
-- 
2.43.0


