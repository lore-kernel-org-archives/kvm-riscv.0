From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 27 Mar 2023 16:49:35 +0000
Subject: [PATCH -next v17 15/20] riscv: signal: validate altstack to reflect Vector
In-Reply-To: <20230327164941.20491-1-andy.chiu@sifive.com>
References: <20230327164941.20491-1-andy.chiu@sifive.com>
Message-ID: <20230327164941.20491-16-andy.chiu@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Some extensions, such as Vector, dynamically change footprint on a
signal frame, so MINSIGSTKSZ is no longer accurate. For example, an
RV64V implementation with vlen = 512 may occupy 2K + 40 + 12 Bytes of a
signal frame with the upcoming support. And processes that do not
execute any vector instructions do not need to reserve the extra
sigframe. So we need a way to guard the allocation size of the sigframe
at process runtime according to current status of V.

Thus, provide the function sigaltstack_size_valid() to validate its size
based on current allocation status of supported extensions.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/signal.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 40f740183768..11411e113f0e 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -469,3 +469,10 @@ void __init init_rt_signal_env(void)
 	 */
 	signal_minsigstksz = get_rt_frame_size(true);
 }
+
+#ifdef CONFIG_DYNAMIC_SIGFRAME
+bool sigaltstack_size_valid(size_t ss_size)
+{
+	return ss_size > get_rt_frame_size(false);
+}
+#endif /* CONFIG_DYNAMIC_SIGFRAME */
-- 
2.17.1


