Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A525C35FFC
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 12:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z1x7lVYNNCOuIJhTsVbT6F8uz5V3CpNNFML4pW1UnVc=; b=lA6zs/UKfqW0yp
	boCPOu3MJwOqmYEclX3CTkxauxFZ51rmZqqYhI31cz3Ilt3au+Po4vb8fA6ZiZZryCrY+xCVOrFg7
	pACPqrn6Az3qp7S79f+3MPKfVJYOt1Mx9EPalM07pu+OdXVOPS94OQuK+aBC/oI7FYFcR9cEvgBJS
	+iDsMxmi4bq6p17ODJl1PjvRHaSXgStfO3irxs9WWuwv11xmsl0Qtlm4NF9mwMCsKaFxUJLUKXQ4p
	V2EPZRZpraVrCawaRayJOXaebtv7HEi1cV5JjQZ45iwwzsSVm67y990r4T+TskMyftDJlZ+dC4O+b
	z+TLf/JHY3GwW7ZJZDCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3dG-00000005tTe-0Ztz;
	Tue, 25 Mar 2025 12:43:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3Lg-00000005oRd-2ml9;
	Tue, 25 Mar 2025 12:25:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 027BC43C55;
	Tue, 25 Mar 2025 12:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2764C4CEE4;
	Tue, 25 Mar 2025 12:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905540;
	bh=sm654hPYjWJMXJD/nEEXxI+s+R28mm6voQq4ZrjJStU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kb/eV2Rwu3zYNU7Jt3dNKcNXYL8nMRHt5pyAJqK6Q/FHeFvW6XiemJEA3uvEk7fVs
	 3EdHOm9rkT05EzHBa5buxdZyLrstfBsowWufM7HqrOlG+CIUjr96jk/fDQXjnFPt+R
	 dWfnumlqW9XRN8RlSa4I28acYRg721cxluLl8IEARR3ZQbcXBk3NZPefJ2WwhFLcUe
	 OiQ0cG9dLZ0sgksiS+3kI0Gf4fzOMT9Xk2MfF9taYcuO0Y49REu0hLiOZAG6x8XWZ3
	 isLS319gnMj4Vs30saFH4Hmz96Q2P/kZ1dTH5mgBIdyz3rnr7TCbzfvoPIkyCS5b43
	 0M+WNWc7E/U2Q==
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
Subject: [RFC PATCH V3 37/43] rv64ilp32_abi: random: Adapt fast_pool struct
Date: Tue, 25 Mar 2025 08:16:18 -0400
Message-Id: <20250325121624.523258-38-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_052540_751118_D3420031 
X-CRM114-Status: UNSURE (   7.35  )
X-CRM114-Notice: Please train this message.
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

RV64ILP32 ABI systems have BITS_PER_LONG set to 32, matching
sizeof(compat_ulong_t). Adjust code

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 drivers/char/random.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index 2581186fa61b..0bfbe02ee255 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -1015,7 +1015,11 @@ EXPORT_SYMBOL_GPL(unregister_random_vmfork_notifier);
 #endif
 
 struct fast_pool {
+#ifdef CONFIG_64BIT
+	u64 pool[4];
+#else
 	unsigned long pool[4];
+#endif
 	unsigned long last;
 	unsigned int count;
 	struct timer_list mix;
@@ -1040,7 +1044,11 @@ static DEFINE_PER_CPU(struct fast_pool, irq_randomness) = {
  * and therefore this has no security on its own. s represents the
  * four-word SipHash state, while v represents a two-word input.
  */
+#ifdef CONFIG_64BIT
+static void fast_mix(u64 s[4], u64 v1, u64 v2)
+#else
 static void fast_mix(unsigned long s[4], unsigned long v1, unsigned long v2)
+#endif
 {
 	s[3] ^= v1;
 	FASTMIX_PERM(s[0], s[1], s[2], s[3]);
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
