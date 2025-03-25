Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E37C3600E
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 13:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QQpMxTXpQDwujPgytGonZ98tRPHCFlwshJAPmJQAGTI=; b=hW6ALloha7NAXu
	Ogqjldjtnu/OT11yE+Vw1Xi0R/9e6TdqfDCJhZlz4/bxxevmc4GGgOlzN4M1REnRQNjFeyXwv1t0D
	+cTy26a5id5ss+XGDIwZ+eBg3YVSzDowq4R7FpNA7T6anpPgNdpVFF+FMPxi4wCqZjlEPpJ6rFWsu
	InBCjF6ltKgRGiXRtGocBH6vKIozqnKPmqXB/eJTLMLEiPOcbsYughZEeZydIQ3eHeuJpUXg/Q1KV
	WSkOAq7XlRVoFi4Povr5vQS3WKRaHA9mnNhv3yc+GFthiPFWEkbquJ8j1XVIBGH/p2IN9OIKG3wqO
	6nL3unrOfb6v/3vuRF5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4j6-000000066fi-1VGh;
	Tue, 25 Mar 2025 13:53:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3K0-00000005nyF-3Dzi;
	Tue, 25 Mar 2025 12:23:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 11D495C5D06;
	Tue, 25 Mar 2025 12:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF58FC4CEE4;
	Tue, 25 Mar 2025 12:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905435;
	bh=1gg5o3afeYXr2oDy1XVLnTyki+lz38CMW137QmWraJ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L4cw2mlnpKO9zzlBV0K7R2SnFVRKniFFdGTiR1XJiWloP049xrRfsGdsekAZNO6iT
	 0IyPu7HYxWtcNr/GVwIsyoiG0WQGDVHF9znzdKgcSLP4/Mx+qe6abUvE609AinUueV
	 0KJNmISd/m0sVDU0CIIc8bPKS7tsLxYBWl6C9Q4zukQ4gJ5jyGZZAxFc2SGU/Bu4a5
	 45akXD+WZ2MUCfkqONcTDqGPuoH+ifGT/z4RaEjXSFoHsvMQYWwCSPkJnIvizKw1Rw
	 hDbQZdSoaf8SOQJv2hZJOxEN9nVfFJY2tF55Gmc3rr6AyEV5ls4O48mzUFO7UNigWe
	 wLQU7WgDVZaDw==
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
Subject: [RFC PATCH V3 30/43] rv64ilp32_abi: kernel/smp: Disable CSD_LOCK_WAIT_DEBUG
Date: Tue, 25 Mar 2025 08:16:11 -0400
Message-Id: <20250325121624.523258-31-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_052356_899641_C9A4799E 
X-CRM114-Status: GOOD (  10.12  )
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

The rv64ilp32 abi is based on CONFIG_64BIT, but uses ILP32 for a
smaller cache & memory footprint. So, disable CSD_LOCK_WAIT_DEBUG
to get smaller csd struct.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 include/linux/smp_types.h | 2 +-
 lib/Kconfig.debug         | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/smp_types.h b/include/linux/smp_types.h
index 2e8461af8df6..5912b694059f 100644
--- a/include/linux/smp_types.h
+++ b/include/linux/smp_types.h
@@ -61,7 +61,7 @@ struct __call_single_node {
 		unsigned int	u_flags;
 		atomic_t	a_flags;
 	};
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	u16 src, dst;
 #endif
 };
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 1af972a92d06..f55f0ded826c 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1613,6 +1613,7 @@ config CSD_LOCK_WAIT_DEBUG
 	depends on DEBUG_KERNEL
 	depends on SMP
 	depends on 64BIT
+	depends on !ABI_RV64ILP32
 	default n
 	help
 	  This option enables debug prints when CPUs are slow to respond
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
