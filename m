Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DA8C36010
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 12:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJWCjQEQLQbgMRIz9E4URLR7XOAmvqWgl3suAe8eNp8=; b=ztvDBsBjoccFZf
	NPXX1pDAD0tBJqTszLT1U9GrAlXb1YPaWYVRUC4tw4g+x+k+IKpo6WOgi+jf3tI2C189oxYTGMi8K
	xTdeHNMhd6FcO6KMWJXRnp8XuRryamLlC/El8csKzzu0DPSrvyOH1COjozY6ARz5xVhnqVg064q7B
	SrM3SMzuw0AW8Z1WflZmoTx4UVegEXsH92fHwXHYhW87Io42scMZImSK1mvBnwrjRDouB/o43zmlw
	O9HcMmqg9C8B/GF+PQqluOAigYeD4GLG+YHjyyP0vfX0h9JdV4DfEsIylrnPj0naCuwB/CHAzaKbP
	zO9wDw2QrtlBqF5Z925w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3YS-00000005rMI-37Ir;
	Tue, 25 Mar 2025 12:38:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3EV-00000005mM2-2Fnd;
	Tue, 25 Mar 2025 12:18:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB38F43C1F;
	Tue, 25 Mar 2025 12:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3232CC4CEE4;
	Tue, 25 Mar 2025 12:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905095;
	bh=UABL4vMSXTJ7ioKDShPOJnvQ/v/SXYqnkdRYWjffYuI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=teUw2FHOlBQ1lrIKT7Hs+qUfkkWnEEpTWG7+L12tSB2mbphU+tEwWLTIzWHI0iiRJ
	 DbQvjYXhNoIHuNkVkJjJR9grTurlc5egb+jrZsRmnn/7yCBhuoST5sWNFrEg4whn8S
	 R8w4LPsMxn2q34XM1d2a9BJgQLJkEbNoee3acd75JHM7OSqPc/dbF55YqAnxMmxb3B
	 GonCtkmj1hPTAVD6eZOTRDAsO7Au8f+9qjRty68GqzTjCoMQ60GAujyzoXiVezS8hQ
	 Cw9dI4jq4Uyzfsd0C+8lhRsjuPYR84Qgic3GJeVkTgp4byQiRpTz3vrpRfdwMGr/ce
	 BEShK8B1mJ11Q==
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
Subject: [RFC PATCH V3 06/43] rv64ilp32_abi: riscv: csum: Utilize 64-bit width to improve the performance
Date: Tue, 25 Mar 2025 08:15:47 -0400
Message-Id: <20250325121624.523258-7-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_051815_624615_EF499216 
X-CRM114-Status: GOOD (  11.73  )
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
BITS_PER_LONG. Therefore, checksum algorithm could utilize 64-bit
width to improve the performance.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 arch/riscv/lib/csum.c | 48 +++++++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
index 7fb12c59e571..7139ab855349 100644
--- a/arch/riscv/lib/csum.c
+++ b/arch/riscv/lib/csum.c
@@ -22,17 +22,17 @@ __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
 			__u32 len, __u8 proto, __wsum csum)
 {
 	unsigned int ulen, uproto;
-	unsigned long sum = (__force unsigned long)csum;
+	xlen_t sum = (__force xlen_t)csum;
 
-	sum += (__force unsigned long)saddr->s6_addr32[0];
-	sum += (__force unsigned long)saddr->s6_addr32[1];
-	sum += (__force unsigned long)saddr->s6_addr32[2];
-	sum += (__force unsigned long)saddr->s6_addr32[3];
+	sum += (__force xlen_t)saddr->s6_addr32[0];
+	sum += (__force xlen_t)saddr->s6_addr32[1];
+	sum += (__force xlen_t)saddr->s6_addr32[2];
+	sum += (__force xlen_t)saddr->s6_addr32[3];
 
-	sum += (__force unsigned long)daddr->s6_addr32[0];
-	sum += (__force unsigned long)daddr->s6_addr32[1];
-	sum += (__force unsigned long)daddr->s6_addr32[2];
-	sum += (__force unsigned long)daddr->s6_addr32[3];
+	sum += (__force xlen_t)daddr->s6_addr32[0];
+	sum += (__force xlen_t)daddr->s6_addr32[1];
+	sum += (__force xlen_t)daddr->s6_addr32[2];
+	sum += (__force xlen_t)daddr->s6_addr32[3];
 
 	ulen = (__force unsigned int)htonl((unsigned int)len);
 	sum += ulen;
@@ -46,7 +46,7 @@ __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
 	 */
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
 	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
-		unsigned long fold_temp;
+		xlen_t fold_temp;
 
 		/*
 		 * Zbb is likely available when the kernel is compiled with Zbb
@@ -85,12 +85,12 @@ EXPORT_SYMBOL(csum_ipv6_magic);
 #define OFFSET_MASK 7
 #endif
 
-static inline __no_sanitize_address unsigned long
-do_csum_common(const unsigned long *ptr, const unsigned long *end,
-	       unsigned long data)
+static inline __no_sanitize_address xlen_t
+do_csum_common(const xlen_t *ptr, const xlen_t *end,
+	       xlen_t data)
 {
 	unsigned int shift;
-	unsigned long csum = 0, carry = 0;
+	xlen_t csum = 0, carry = 0;
 
 	/*
 	 * Do 32-bit reads on RV32 and 64-bit reads otherwise. This should be
@@ -130,8 +130,8 @@ static inline __no_sanitize_address unsigned int
 do_csum_with_alignment(const unsigned char *buff, int len)
 {
 	unsigned int offset, shift;
-	unsigned long csum, data;
-	const unsigned long *ptr, *end;
+	xlen_t csum, data;
+	const xlen_t *ptr, *end;
 
 	/*
 	 * Align address to closest word (double word on rv64) that comes before
@@ -140,7 +140,7 @@ do_csum_with_alignment(const unsigned char *buff, int len)
 	 */
 	offset = (unsigned long)buff & OFFSET_MASK;
 	kasan_check_read(buff, len);
-	ptr = (const unsigned long *)(buff - offset);
+	ptr = (const xlen_t *)(buff - offset);
 
 	/*
 	 * Clear the most significant bytes that were over-read if buff was not
@@ -153,7 +153,7 @@ do_csum_with_alignment(const unsigned char *buff, int len)
 #else
 	data = (data << shift) >> shift;
 #endif
-	end = (const unsigned long *)(buff + len);
+	end = (const xlen_t *)(buff + len);
 	csum = do_csum_common(ptr, end, data);
 
 #ifdef CC_HAS_ASM_GOTO_TIED_OUTPUT
@@ -163,7 +163,7 @@ do_csum_with_alignment(const unsigned char *buff, int len)
 	 */
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
 	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
-		unsigned long fold_temp;
+		xlen_t fold_temp;
 
 		/*
 		 * Zbb is likely available when the kernel is compiled with Zbb
@@ -233,15 +233,15 @@ do_csum_with_alignment(const unsigned char *buff, int len)
 static inline __no_sanitize_address unsigned int
 do_csum_no_alignment(const unsigned char *buff, int len)
 {
-	unsigned long csum, data;
-	const unsigned long *ptr, *end;
+	xlen_t csum, data;
+	const xlen_t *ptr, *end;
 
-	ptr = (const unsigned long *)(buff);
+	ptr = (const xlen_t *)(buff);
 	data = *(ptr++);
 
 	kasan_check_read(buff, len);
 
-	end = (const unsigned long *)(buff + len);
+	end = (const xlen_t *)(buff + len);
 	csum = do_csum_common(ptr, end, data);
 
 	/*
@@ -250,7 +250,7 @@ do_csum_no_alignment(const unsigned char *buff, int len)
 	 */
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
 	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
-		unsigned long fold_temp;
+		xlen_t fold_temp;
 
 		/*
 		 * Zbb is likely available when the kernel is compiled with Zbb
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
