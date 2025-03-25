Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B52C3600D
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 13:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DpvM6T2Ecym1oMOtSTOtfNRsYs67KeXIk7GeOSSfLfg=; b=mx1aWR1ynezm46
	LfSVDa2SQQ+BLHgTXL6StOj9wGX5OVwRQ/HnzLHAuma1iNl8hPlAIX8lKlS73juZG3hJ7Rqh8vzBF
	qyEwcGyurPZEDv7k15qS0+fpHp5oUYzCIpEbzVooRCEzsyR64uYxXdUdTFvybQtHXYEfj84P7giXx
	htj7mB/223WEYxv1Ccf/k7fp6wnQM4vQGhb164c0+9O1RFFAqYxtIv27RyLsDGu6lw2jRK+lImiGf
	mvmuFQlPrI8Lv4PdT8ofhQPnY4tTL7tHhlyM36Nmbc5OlUrToD+qSGVO0cXkegADL8eLBCbATwyce
	cKcrZ3Rc4WqBUVCZnlHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4j8-000000066j8-232d;
	Tue, 25 Mar 2025 13:53:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3KE-00000005o1a-3hGF;
	Tue, 25 Mar 2025 12:24:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 30A625C5DAA;
	Tue, 25 Mar 2025 12:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33EE3C4CEE9;
	Tue, 25 Mar 2025 12:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905449;
	bh=YlFb6KkzVSGSuegSI2MJMuDKnOb+jmQgRm/aIyv4ASM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sWpvaUIxJ2xmK0FQF0ljHhlr/YashdPyYsTn7al4PxnIvUdy5/V+e9JCSqYjPiQ5E
	 qVMLggXWg+4qFNOeniAE53fLZ1Prkl0/M6GeEuOJ+uT+3t3q7fV6UUS2UIgffUSeso
	 wRSxhB5nlUaDz5ji9smEUpkoHf9ykZfP/NySchrJUTDEg5MhkdVVvAnNX4EACaRX4T
	 pdKSFNThVJ1sR53X8HbMYhyVDRiX7Q6sFsJkcrdiRsi7pFRqIxw20GaRxB8ae45rL7
	 7llPuKtxuxdA0NoRclxRUGq3TI+0zr3JNpZA7Af2b2pgVGyaoWF87wcU8ebw0LTt3d
	 JLIfeJGTL7Z9g==
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
Subject: [RFC PATCH V3 31/43] rv64ilp32_abi: maple_tree: Use BITS_PER_LONG instead of CONFIG_64BIT
Date: Tue, 25 Mar 2025 08:16:12 -0400
Message-Id: <20250325121624.523258-32-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_052411_020542_BDE91A87 
X-CRM114-Status: UNSURE (   9.90  )
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

The Maple tree algorithm uses ulong type for each element. The
number of slots is based on BITS_PER_LONG for RV64ILP32 ABI, so
use BITS_PER_LONG instead of CONFIG_64BIT.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 include/linux/maple_tree.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
index cbbcd18d4186..ff6265b6468b 100644
--- a/include/linux/maple_tree.h
+++ b/include/linux/maple_tree.h
@@ -24,7 +24,7 @@
  *
  * Nodes in the tree point to their parent unless bit 0 is set.
  */
-#if defined(CONFIG_64BIT) || defined(BUILD_VDSO32_64)
+#if (BITS_PER_LONG == 64) || defined(BUILD_VDSO32_64)
 /* 64bit sizes */
 #define MAPLE_NODE_SLOTS	31	/* 256 bytes including ->parent */
 #define MAPLE_RANGE64_SLOTS	16	/* 256 bytes */
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
