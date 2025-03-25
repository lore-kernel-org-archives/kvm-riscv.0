Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5617C36005
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 12:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jf6FcPYpDIj6Z9E9RX4YG4osIRuxhe1jBDsDWqnV05c=; b=0IJrMIB9n2IOy6
	Q2F9v8GuUUl8xjoJLlUO5BVpB3He/bnGv5e1eiKdnj4LxWuYqigK7YexoNJR3AuLpm/1uPQYgZO1X
	XtGbiwhwNtyAykVYUqwoF0RccDP9UycTPkCaHMzCY9a2tCnX4ChFJnDbjgsK91B8nLtlBV484pMEa
	uKEs/2sQsCkIqcuCwp5lJ5mcHW7vPQZf+fBjzN8l2Nzs0u8IIrWmyfCyhFJE+ncP84fn5fZaVwgtY
	xsuXtkkaGuMTc+WGg5efjZrMDs0/8XxD0xtKUio49HD4sZuRvCgBn6ojIGEB+NkTlH/nPNnQnGt4C
	B4p3pNQ4ugF5SkRNDb1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3YR-00000005rKn-2Qhi;
	Tue, 25 Mar 2025 12:38:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3EI-00000005mHb-0rEw;
	Tue, 25 Mar 2025 12:18:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CCB3434D7;
	Tue, 25 Mar 2025 12:18:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B2FDC4CEF0;
	Tue, 25 Mar 2025 12:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905081;
	bh=iWYi5/d3lIOrxHNI1EIVP5k9hUi9+eK2hLYPYcT89jg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mJnrUfpQU3tRiz/k25gw4Uqd12Aw8TcM6cjFO/pD8K+3ShkeSS04mnHDe7BpyS9ke
	 O8z/kOa0aXdpl9GLvZpnTK+Xx+g5W6fJjabNS4JH2Wwvd5+2wgVNE54fuiymHoC1wG
	 50KxnfqoOdtuha4aPxrF6rszRIRlwHFNHlIfbWoUlSci7i3a1tzNjs60WJvLsFt2CL
	 k4uREm/BjGR8keu0URF80UT0E0VmN+e0XoVL0J9C2x4l4RFyOLnqNqNi9ALPjHGSGJ
	 JkfPLCYVJWSPzMY2y47OjruYC0XtjptJeJQjpc7rLp5TYbe0YDu+bublV7qn3GnUev
	 yahK8zT/PrMfQ==
From: guoren@kernel.org
To: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	torvalds@linux-foundation.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	oleg@redhat.com,
	kees@kernel.org,
	tglx@linutronix.de,
	will@kernel.org,
	mark.rutland@arm.com,
	brauner@kernel.org,
	akpm@linux-foundation.org,
	rostedt@goodmis.org,
	edumazet@google.com,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	gaohan@iscas.ac.cn,
	shihua@iscas.ac.cn,
	jiawei@iscas.ac.cn,
	wuwei2016@iscas.ac.cn,
	drew@pdp7.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	ctsai390@andestech.com,
	wefu@redhat.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	josef@toxicpanda.com,
	dsterba@suse.com,
	mingo@redhat.com,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	guoren@kernel.org,
	xiao.w.wang@intel.com,
	qingfang.deng@siflower.com.cn,
	leobras@redhat.com,
	jszhang@kernel.org,
	conor.dooley@microchip.com,
	samuel.holland@sifive.com,
	yongxuan.wang@sifive.com,
	luxu.kernel@bytedance.com,
	david@redhat.com,
	ruanjinjie@huawei.com,
	cuiyunhui@bytedance.com,
	wangkefeng.wang@huawei.com,
	qiaozhe@iscas.ac.cn
Cc: ardb@kernel.org,
	ast@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-crypto@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	maple-tree@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net,
	linux-btrfs@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	linux-nfs@vger.kernel.org,
	linux-sctp@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [RFC PATCH V3 05/43] rv64ilp32_abi: riscv: crc32: Utilize 64-bit width to improve the performance
Date: Tue, 25 Mar 2025 08:15:46 -0400
Message-Id: <20250325121624.523258-6-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_051802_291741_338FDA0F 
X-CRM114-Status: GOOD (  10.95  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>

The RV64ILP32 ABI, derived from a 64-bit ISA, uses 32-bit
BITS_PER_LONG. Therefore, crc32 algorithm could utilize 64-bit width
to improve the performance.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 arch/riscv/lib/crc32-riscv.c | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/lib/crc32-riscv.c b/arch/riscv/lib/crc32-riscv.c
index 53d56ab422c7..68dfb0565696 100644
--- a/arch/riscv/lib/crc32-riscv.c
+++ b/arch/riscv/lib/crc32-riscv.c
@@ -8,6 +8,7 @@
 #include <asm/hwcap.h>
 #include <asm/alternative-macros.h>
 #include <asm/byteorder.h>
+#include <asm/csr.h>
 
 #include <linux/types.h>
 #include <linux/minmax.h>
@@ -59,12 +60,12 @@
  */
 # define CRC32_POLY_QT_BE	0x04d101df481b4e5a
 
-static inline u64 crc32_le_prep(u32 crc, unsigned long const *ptr)
+static inline u64 crc32_le_prep(u32 crc, u64 const *ptr)
 {
 	return (u64)crc ^ (__force u64)__cpu_to_le64(*ptr);
 }
 
-static inline u32 crc32_le_zbc(unsigned long s, u32 poly, unsigned long poly_qt)
+static inline u32 crc32_le_zbc(u64 s, u32 poly, u64 poly_qt)
 {
 	u32 crc;
 
@@ -85,7 +86,7 @@ static inline u32 crc32_le_zbc(unsigned long s, u32 poly, unsigned long poly_qt)
 	return crc;
 }
 
-static inline u64 crc32_be_prep(u32 crc, unsigned long const *ptr)
+static inline u64 crc32_be_prep(u32 crc, u64 const *ptr)
 {
 	return ((u64)crc << 32) ^ (__force u64)__cpu_to_be64(*ptr);
 }
@@ -131,7 +132,7 @@ static inline u32 crc32_be_prep(u32 crc, unsigned long const *ptr)
 # error "Unexpected __riscv_xlen"
 #endif
 
-static inline u32 crc32_be_zbc(unsigned long s)
+static inline u32 crc32_be_zbc(xlen_t s)
 {
 	u32 crc;
 
@@ -156,16 +157,16 @@ typedef u32 (*fallback)(u32 crc, unsigned char const *p, size_t len);
 
 static inline u32 crc32_le_unaligned(u32 crc, unsigned char const *p,
 				     size_t len, u32 poly,
-				     unsigned long poly_qt)
+				     xlen_t poly_qt)
 {
 	size_t bits = len * 8;
-	unsigned long s = 0;
+	xlen_t s = 0;
 	u32 crc_low = 0;
 
 	for (int i = 0; i < len; i++)
-		s = ((unsigned long)*p++ << (__riscv_xlen - 8)) | (s >> 8);
+		s = ((xlen_t)*p++ << (__riscv_xlen - 8)) | (s >> 8);
 
-	s ^= (unsigned long)crc << (__riscv_xlen - bits);
+	s ^= (xlen_t)crc << (__riscv_xlen - bits);
 	if (__riscv_xlen == 32 || len < sizeof(u32))
 		crc_low = crc >> bits;
 
@@ -177,12 +178,12 @@ static inline u32 crc32_le_unaligned(u32 crc, unsigned char const *p,
 
 static inline u32 __pure crc32_le_generic(u32 crc, unsigned char const *p,
 					  size_t len, u32 poly,
-					  unsigned long poly_qt,
+					  xlen_t poly_qt,
 					  fallback crc_fb)
 {
 	size_t offset, head_len, tail_len;
-	unsigned long const *p_ul;
-	unsigned long s;
+	xlen_t const *p_ul;
+	xlen_t s;
 
 	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
 			     RISCV_ISA_EXT_ZBC, 1)
@@ -199,7 +200,7 @@ static inline u32 __pure crc32_le_generic(u32 crc, unsigned char const *p,
 
 	tail_len = len & OFFSET_MASK;
 	len = len >> STEP_ORDER;
-	p_ul = (unsigned long const *)p;
+	p_ul = (xlen_t const *)p;
 
 	for (int i = 0; i < len; i++) {
 		s = crc32_le_prep(crc, p_ul);
@@ -236,7 +237,7 @@ static inline u32 crc32_be_unaligned(u32 crc, unsigned char const *p,
 				     size_t len)
 {
 	size_t bits = len * 8;
-	unsigned long s = 0;
+	xlen_t s = 0;
 	u32 crc_low = 0;
 
 	s = 0;
@@ -247,7 +248,7 @@ static inline u32 crc32_be_unaligned(u32 crc, unsigned char const *p,
 		s ^= crc >> (32 - bits);
 		crc_low = crc << bits;
 	} else {
-		s ^= (unsigned long)crc << (bits - 32);
+		s ^= (xlen_t)crc << (bits - 32);
 	}
 
 	crc = crc32_be_zbc(s);
@@ -259,8 +260,8 @@ static inline u32 crc32_be_unaligned(u32 crc, unsigned char const *p,
 u32 __pure crc32_be_arch(u32 crc, const u8 *p, size_t len)
 {
 	size_t offset, head_len, tail_len;
-	unsigned long const *p_ul;
-	unsigned long s;
+	xlen_t const *p_ul;
+	xlen_t s;
 
 	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
 			     RISCV_ISA_EXT_ZBC, 1)
@@ -277,7 +278,7 @@ u32 __pure crc32_be_arch(u32 crc, const u8 *p, size_t len)
 
 	tail_len = len & OFFSET_MASK;
 	len = len >> STEP_ORDER;
-	p_ul = (unsigned long const *)p;
+	p_ul = (xlen_t const *)p;
 
 	for (int i = 0; i < len; i++) {
 		s = crc32_be_prep(crc, p_ul);
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
