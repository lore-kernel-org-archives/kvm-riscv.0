From: Andrew Jones <andrew.jones@linux.dev>
Date: Tue,  3 Sep 2024 16:39:49 +0200
Subject: [kvm-unit-tests PATCH 2/2] riscv: Make NR_CPUS configurable
In-Reply-To: <20240903143946.834864-4-andrew.jones@linux.dev>
References: <20240903143946.834864-4-andrew.jones@linux.dev>
Message-ID: <20240903143946.834864-6-andrew.jones@linux.dev>
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

To override the default for NR_CPUS to, e.g. 256, testers should use
--add-config. For example,

  $ cat <<EOF > 256.config
  #undef CONFIG_NR_CPUS
  #define CONFIG_NR_CPUS 256
  EOF
  $ ./configure --arch=riscv64 --cross-prefix=riscv64-linux-gnu- --add-config=256.config

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 configure             | 3 ++-
 lib/riscv/asm/setup.h | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 7a1317d0650d..5ed0c28fcaea 100755
--- a/configure
+++ b/configure
@@ -508,7 +508,8 @@ EOF
 elif [ "$arch" = "riscv32" ] || [ "$arch" = "riscv64" ]; then
 cat <<EOF >> lib/config.h
 
-#define CONFIG_UART_EARLY_BASE 0x10000000
+#define CONFIG_NR_CPUS			(__riscv_xlen * 2)
+#define CONFIG_UART_EARLY_BASE		0x10000000
 
 EOF
 fi
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
2.46.0


