From: Andrew Jones <andrew.jones@linux.dev>
Date: Tue, 20 Aug 2024 19:01:51 +0200
Subject: [kvm-unit-tests PATCH] riscv: Make NR_CPUS configurable
Message-ID: <20240820170150.377580-2-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Unit tests would like to go nuts with the number of harts in order
to help shake out issues with hart number assumptions. Rather than
set a huge number that will only be used when a platform supports
a huge number or when QEMU is told to exceed the recommended
number of vcpus, make the number configurable. However, we do bump
the default from 16 to 2*xlen since we would like to always force
kvm-unit-tests to use cpumasks with more than one word in order to
ensure that code stays maintained.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 configure             | 8 ++++++++
 lib/riscv/asm/setup.h | 3 ++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 27ae9cc89657..6a8d6239a3cb 100755
--- a/configure
+++ b/configure
@@ -77,6 +77,8 @@ usage() {
 	                           Specify the page size (translation granule). PAGE_SIZE can be
 	                           4k [default], 16k, 64k for arm64.
 	                           4k [default], 64k for ppc64.
+	    --max-cpus=MAX_CPUS
+	                           Specify the maximum number of CPUs supported. (riscv64 only)
 	    --earlycon=EARLYCON
 	                           Specify the UART name, type and address (optional, arm and
 	                           arm64 only). The specified address will overwrite the UART
@@ -168,6 +170,9 @@ while [[ "$1" = -* ]]; do
 	--page-size)
 	    page_size="$arg"
 	    ;;
+	--max-cpus)
+	    max_cpus="$arg"
+	    ;;
 	--earlycon)
 	    earlycon="$arg"
 	    ;;
@@ -496,8 +501,11 @@ cat <<EOF >> lib/config.h
 
 EOF
 elif [ "$arch" = "riscv32" ] || [ "$arch" = "riscv64" ]; then
+	[ -z $max_cpus ] && max_cpus='(__riscv_xlen * 2)'
+
 cat <<EOF >> lib/config.h
 
+#define CONFIG_NR_CPUS $max_cpus
 #define CONFIG_UART_EARLY_BASE 0x10000000
 
 EOF
diff --git a/lib/riscv/asm/setup.h b/lib/riscv/asm/setup.h
index a13159bfe395..43b63c56d96f 100644
--- a/lib/riscv/asm/setup.h
+++ b/lib/riscv/asm/setup.h
@@ -2,9 +2,10 @@
 #ifndef _ASMRISCV_SETUP_H_
 #define _ASMRISCV_SETUP_H_
 #include <libcflat.h>
+#include <config.h>
 #include <asm/processor.h>
 
-#define NR_CPUS 16
+#define NR_CPUS CONFIG_NR_CPUS
 extern struct thread_info cpus[NR_CPUS];
 extern int nr_cpus;
 extern uint64_t timebase_frequency;
-- 
2.45.2


