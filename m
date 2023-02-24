From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 24 Feb 2023 17:01:14 +0000
Subject: [PATCH -next v14 15/19] riscv: signal: validate altstack to reflect Vector
In-Reply-To: <20230224170118.16766-1-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
Message-ID: <20230224170118.16766-16-andy.chiu@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

MINSIGSTKSZ alone have become less informative by the time an user calls
sigaltstack(), as the kernel starts to support extensions that
dynamically introduce footprint on a signal frame. For example, an RV64V
implementation with vlen = 512 may occupy 2K + 40 + 12 Bytes of a signal
frame with the upcoming Vector support. And there is no need for
reserving the extra sigframe for some processes that do not execute any
V-instructions.

Thus, provide the function sigaltstack_size_valid() to validate its size
based on current allocation status of supported extensions.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/kernel/signal.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index aa8ee95dee2d..aff441e83a98 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -494,3 +494,11 @@ void __init init_rt_signal_env(void)
 	 */
 	signal_minsigstksz = cal_rt_frame_size(true);
 }
+
+#ifdef CONFIG_DYNAMIC_SIGFRAME
+bool sigaltstack_size_valid(size_t ss_size)
+{
+	return ss_size > cal_rt_frame_size(false);
+}
+#endif /* CONFIG_DYNAMIC_SIGFRAME */
+
-- 
2.17.1


