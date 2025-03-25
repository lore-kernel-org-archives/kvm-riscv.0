Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E79C3600D
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 13:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nlnYucN3DuQsT1jFnMmfxWtMYD1iLSy7nCr3/0vOUow=; b=ru8NX+PVSVf0Fo
	btxcxRU3/VZmXHYBFMAjTkWYZxH7wmRa4OtYhoZ1JiIHWyXgxiCkxr4xrvZ5oGtktnGDZJSme1aNZ
	QM8kVqbccdbivixurfg8Fvwct594FxrVG2uOTF85KYBhsQUYQPkMdjToMvbxoigYCjVXo+rx7gseO
	NVyv0ywteThHC91eGoWRIIXJRx59h0e1vP6fsLZPLxGnsJpy4gdVPnb1X1IFT/pT7DUrvoCkf39a7
	NPD5ZJqroGkFRlecDtFzrDm7E09Lpht5MmwA840oVzlRmZbZIftKBJPey+owAqMQ6BWDHGoInUnaC
	RZx3IdeaPH0EXwSe7lLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4ip-000000066Fw-46nm;
	Tue, 25 Mar 2025 13:53:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3HS-00000005nAi-0s0X;
	Tue, 25 Mar 2025 12:21:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 62D99A43621;
	Tue, 25 Mar 2025 12:15:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE0C8C4CEED;
	Tue, 25 Mar 2025 12:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905277;
	bh=2UWsq5ym5VI7/vPr12wsi4xJfQOhojxJV/AkLgh/hzg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CASldfZKFy6JxMfog2czdRUW400bjKu3qkIqf2g0bO4mAfdCAZJOHjQKj39cz8aqg
	 XG1civv4o3gD3MK48Yhqik6WW027RRpl8DQvIB9Yob7C9kX6E9qV9uYudT8hhev5cL
	 QTVrUoI6O6nkCMoTVAOPFZqdY9GzjntjKQO6ayze5oXkt5L0UWJbyNb4+aKdlWWzz3
	 3BCk6+WJF49ZitzC7I5AW48N1eiiEebNx/f6MnTwAH2grSuKMLPrEypZXRY8Sm16qK
	 mLSvyciL4KYAbVkJERD8dZPZNRmSFb8RH3/1NqleyW9uvgrIwTuaYlC1t3hgHEcd/Z
	 SqwIoUbHe8uUw==
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
Subject: [RFC PATCH V3 19/43] rv64ilp32_abi: irqchip: irq-riscv-intc: Use xlen_t instead of ulong
Date: Tue, 25 Mar 2025 08:16:00 -0400
Message-Id: <20250325121624.523258-20-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_052118_374495_D36C8583 
X-CRM114-Status: UNSURE (   8.21  )
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

The RV64ILP32 ABI is based on CONFIG_64BIT, so use xlen/xlen_t
instead of BITS_PER_LONG/ulong.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 drivers/irqchip/irq-riscv-intc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index f653c13de62b..4fc7d5704acf 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -20,18 +20,19 @@
 #include <linux/soc/andes/irq.h>
 
 #include <asm/hwcap.h>
+#include <asm/ptrace.h>
 
 static struct irq_domain *intc_domain;
-static unsigned int riscv_intc_nr_irqs __ro_after_init = BITS_PER_LONG;
-static unsigned int riscv_intc_custom_base __ro_after_init = BITS_PER_LONG;
+static unsigned int riscv_intc_nr_irqs __ro_after_init = __riscv_xlen;
+static unsigned int riscv_intc_custom_base __ro_after_init = __riscv_xlen;
 static unsigned int riscv_intc_custom_nr_irqs __ro_after_init;
 
 static void riscv_intc_irq(struct pt_regs *regs)
 {
-	unsigned long cause = regs->cause & ~CAUSE_IRQ_FLAG;
+	xlen_t cause = regs->cause & ~CAUSE_IRQ_FLAG;
 
 	if (generic_handle_domain_irq(intc_domain, cause))
-		pr_warn_ratelimited("Failed to handle interrupt (cause: %ld)\n", cause);
+		pr_warn_ratelimited("Failed to handle interrupt (cause: " REG_FMT ")\n", cause);
 }
 
 static void riscv_intc_aia_irq(struct pt_regs *regs)
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
