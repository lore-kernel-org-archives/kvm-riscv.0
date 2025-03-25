Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1B2C36005
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 12:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J/BpIy6Y+pulm4MyzOWrM/hDbypNHu/dJ4IkDp/KrFU=; b=NWBV4/Q1kScd3d
	2BTQBuOmHm+7Axfk7OJe3FmEErZYkxiKcsQ6IIdFIYCuzoaAXMDE6hiRWnyByRDlPT1vnZ2VHLFE+
	HcSub0lbHKWPPDR+57wR8ng2Rd9AueVbhr7aXa/J5IyAZUFk9KvQpRQn0I06fgINnO3ZuugMX68bK
	GXNUeRkYlkcLi3C3XDM0j+Lc3H3X2kO8iY6EwSESSH1zLpXMgg/8b2DTmIcB0BA3HIWw2OykRNv/J
	vD79ZD9o9mKW9xJ+tnkrpd0QpH4nuS9Sb3leTKc+qXnYdzPwMjlNClG3qddGvljAhMslsTqiNcOaR
	z02CCGCmARtkTkGvap3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3dQ-00000005tlP-4Aea;
	Tue, 25 Mar 2025 12:44:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3N8-00000005ot1-1ais;
	Tue, 25 Mar 2025 12:27:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BAB9543C58;
	Tue, 25 Mar 2025 12:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF18C4CEE4;
	Tue, 25 Mar 2025 12:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905629;
	bh=AWjl4tBrnhRkcRiex/88q6k6fRAmxNwISnnYEf7182Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BOK/wPKSymoONoK8d8zXPGGMy5MG+aYpHf3TkadCLwDPTOQJGUAW9et07ZG7zCZWv
	 ef4pdsDxtkJTHjY+SAKtAcW26il80oDtB38MozaTEhXlGd4IkrTlN3tIWkXmAwnoLn
	 BzHu8ImCylu3Yb81WL68Buni1g0ODfLOGd7OBrnKV/M2af0y77JoFV43LSNATjnN4G
	 9CzIE3AozXUaiD7HuaDWAl0wAkWF1HUbFGm1CJxGQ45QPczxfx9HKr6TYKmSS9kPAD
	 gZpFZHUBEZFz8k7KsyAguseekaOJzmeEib25mONLZRMhFlnpUorLwGTrqPnI6I56MM
	 2bv1z0/9P4X3A==
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
Subject: [RFC PATCH V3 43/43] riscv: Fixup address space overlay of print_mlk
Date: Tue, 25 Mar 2025 08:16:24 -0400
Message-Id: <20250325121624.523258-44-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_052710_464661_B2596C86 
X-CRM114-Status: UNSURE (   8.74  )
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

If phyical memory is 1GiB for ilp32 linux, then print_mlk would be:
lowmem : 0xc0000000 - 0x00000000   ( 1024 MB)

After fixup:
lowmem : 0xc0000000 - 0xffffffff   ( 1024 MB)

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 arch/riscv/mm/init.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 3cdbb033860e..e09286d4916a 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -105,26 +105,26 @@ static void __init zone_sizes_init(void)
 
 static inline void print_mlk(char *name, unsigned long b, unsigned long t)
 {
-	pr_notice("%12s : 0x%08lx - 0x%08lx   (%4ld kB)\n", name, b, t,
+	pr_notice("%12s : 0x%08lx - 0x%08lx   (%4ld kB)\n", name, b, t - 1,
 		  (((t) - (b)) >> LOG2_SZ_1K));
 }
 
 static inline void print_mlm(char *name, unsigned long b, unsigned long t)
 {
-	pr_notice("%12s : 0x%08lx - 0x%08lx   (%4ld MB)\n", name, b, t,
+	pr_notice("%12s : 0x%08lx - 0x%08lx   (%4ld MB)\n", name, b, t - 1,
 		  (((t) - (b)) >> LOG2_SZ_1M));
 }
 
 static inline void print_mlg(char *name, unsigned long b, unsigned long t)
 {
-	pr_notice("%12s : 0x%08lx - 0x%08lx   (%4ld GB)\n", name, b, t,
+	pr_notice("%12s : 0x%08lx - 0x%08lx   (%4ld GB)\n", name, b, t - 1,
 		   (((t) - (b)) >> LOG2_SZ_1G));
 }
 
 #if BITS_PER_LONG == 64
 static inline void print_mlt(char *name, unsigned long b, unsigned long t)
 {
-	pr_notice("%12s : 0x%08lx - 0x%08lx   (%4ld TB)\n", name, b, t,
+	pr_notice("%12s : 0x%08lx - 0x%08lx   (%4ld TB)\n", name, b, t - 1,
 		   (((t) - (b)) >> LOG2_SZ_1T));
 }
 #else
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
