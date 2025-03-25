Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B810BC36013
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 12:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+7cu1izAMwi3evK2queE7JJTuv4P2cQJ8gnPxXmnFAU=; b=lpletBbhg8p1uK
	pCwGRjFx79b4HOPjlmM7J0t6EaL1HthAsChmVrqQyzEBzw8cnKRhIBlKcTxJuZgcysAWOCeA1xaCj
	VDbhZE2uwQdvq129kGQ27WbfxnWyfB0sMPuIYDwW86kC/0c+VC6khUDpZL/34Gm5B+o+2ShlGmg9A
	9RpvU5LWZUWAC9nbsN83ab0LrK5bWXDH/7EeoDJVd+pTWflVV5+4kJ2geW3PzKaAl8PHTi8WVp3dH
	jzggUBPLLA8UcMjXZjgq5b+KPRexqOHx4Y/Xbq9dLWlDk2hb59we1H6dJDPitEXKW6uOCINmyMwtb
	ygbbiYs3ZSkfPdUVJmig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3YU-00000005rOe-1i4D;
	Tue, 25 Mar 2025 12:38:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3Ej-00000005mQS-3T7U;
	Tue, 25 Mar 2025 12:18:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C4DF43C29;
	Tue, 25 Mar 2025 12:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC5F5C4CEE9;
	Tue, 25 Mar 2025 12:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905109;
	bh=BZhFrxC5LqWkJB24//QTxmrLgLREqoX75xqFkQDG2c4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WAArLR1cIlUkjcVTXX0Tls/hyrhxZQce1pwWCWmmrhVqZo6CHID40/UUJJxlUdSIH
	 pvJzyeJsFsbR3Qj6oZQI0sosmdA0f0axmt/j3x0JtA4NVFN4oEroDbhzfKMj77LjcG
	 VpeybYwfnePV+fqBKEfi+c8b/VpfgQniRgpy+YGfPxfyz64Z96hgATbQA+bOjettSE
	 TFQQdcxc3W5FBVyXIBMFFRRS9NmLp2l79WVGP9idTb0YBrpmWMraoXJreb1OnK+1kW
	 R4WBNVgCauqIfaxd2Ttz8fBWM1S2wpc+NpxrTt7N9OYAE6+nKKUlTbfrvFhzZhVeQ9
	 0U3othdem+g7g==
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
Subject: [RFC PATCH V3 07/43] rv64ilp32_abi: riscv: arch_hweight: Adapt cpopw & cpop of zbb extension
Date: Tue, 25 Mar 2025 08:15:48 -0400
Message-Id: <20250325121624.523258-8-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_051829_913469_F5155AAD 
X-CRM114-Status: UNSURE (   8.41  )
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

The RV64ILP32 ABI is based on 64-bit ISA, but BITS_PER_LONG is 32.
Use cpopw for u32_weight and cpop for u64_weight.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 arch/riscv/include/asm/arch_hweight.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/arch_hweight.h b/arch/riscv/include/asm/arch_hweight.h
index 613769b9cdc9..42577965f5bb 100644
--- a/arch/riscv/include/asm/arch_hweight.h
+++ b/arch/riscv/include/asm/arch_hweight.h
@@ -12,7 +12,11 @@
 #if (BITS_PER_LONG == 64)
 #define CPOPW	"cpopw "
 #elif (BITS_PER_LONG == 32)
+#ifdef CONFIG_64BIT
+#define CPOPW	"cpopw "
+#else
 #define CPOPW	"cpop "
+#endif
 #else
 #error "Unexpected BITS_PER_LONG"
 #endif
@@ -47,7 +51,7 @@ static inline unsigned int __arch_hweight8(unsigned int w)
 	return __arch_hweight32(w & 0xff);
 }
 
-#if BITS_PER_LONG == 64
+#ifdef CONFIG_64BIT
 static __always_inline unsigned long __arch_hweight64(__u64 w)
 {
 # ifdef CONFIG_RISCV_ISA_ZBB
@@ -61,7 +65,7 @@ static __always_inline unsigned long __arch_hweight64(__u64 w)
 	     ".option pop\n"
 	     : "=r" (w) : "r" (w) :);
 
-	return w;
+	return (unsigned long)w;
 
 legacy:
 # endif
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
