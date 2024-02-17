From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 16 Feb 2024 16:57:36 -0800
Subject: [PATCH RFC 18/20] tools arch uapi: Sync the uinstd.h header file for RISC-V
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
Message-ID: <20240217005738.3744121-19-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The uninstd.h has been changed since it's last sync. Update it so
that perf tool can use the new RISC-V specific syscall in perf tool.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/arch/riscv/include/uapi/asm/unistd.h | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tools/arch/riscv/include/uapi/asm/unistd.h b/tools/arch/riscv/include/uapi/asm/unistd.h
index f506cca520b0..950ab3fd4409 100644
--- a/tools/arch/riscv/include/uapi/asm/unistd.h
+++ b/tools/arch/riscv/include/uapi/asm/unistd.h
@@ -15,11 +15,14 @@
  * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
-#ifdef __LP64__
+#if defined(__LP64__) && !defined(__SYSCALL_COMPAT)
 #define __ARCH_WANT_NEW_STAT
 #define __ARCH_WANT_SET_GET_RLIMIT
 #endif /* __LP64__ */
 
+#define __ARCH_WANT_SYS_CLONE3
+#define __ARCH_WANT_MEMFD_SECRET
+
 #include <asm-generic/unistd.h>
 
 /*
@@ -40,3 +43,12 @@
 #define __NR_riscv_flush_icache (__NR_arch_specific_syscall + 15)
 #endif
 __SYSCALL(__NR_riscv_flush_icache, sys_riscv_flush_icache)
+
+/*
+ * Allows userspace to query the kernel for CPU architecture and
+ * microarchitecture details across a given set of CPUs.
+ */
+#ifndef __NR_riscv_hwprobe
+#define __NR_riscv_hwprobe (__NR_arch_specific_syscall + 14)
+#endif
+__SYSCALL(__NR_riscv_hwprobe, sys_riscv_hwprobe)
-- 
2.34.1


