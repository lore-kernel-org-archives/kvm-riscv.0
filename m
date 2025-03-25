Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57632C3600B
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 12:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vAFELOc7PKumlsAizBVcmoDBmLHFd9XtlECYuw/3TVw=; b=g70wsd+ivB9Nzw
	Nq0Ufy95u3KlR/WKmifZh3ProsdtsHqzQummqOU139+MWDjWcHHcn16xyvLVg6ALgpSKfYecUcrqc
	EZ9fqASSYXtBKB3Q6sp6KlVxs8GOdH3ZdEu0EWAzmWtgR9Lvh25qPWG3NanBq+MaSVkTuBB1Ko2+m
	qQmjyjUJXoDVw99UuZHo3JZOSniztrtkj52QAEy3+8nqyBlVnWLj0Tj0Fdg65lmWqmQr4HwU9dJh7
	BYvDxvKE8aPs5GuOfDyZ4AIqGjHZqStClQYZjHYB4tIvBhnrviO1ZMrXgTLrrS386oEnI7ydghQAT
	PDDL9ItnMr7F5yMza5hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3dE-00000005tRr-3zRz;
	Tue, 25 Mar 2025 12:43:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3LS-00000005oOM-0bHS;
	Tue, 25 Mar 2025 12:25:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7F9695C5ED2;
	Tue, 25 Mar 2025 12:23:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7793AC4CEEE;
	Tue, 25 Mar 2025 12:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905525;
	bh=YhFQ2ibshi4VdwpUCryIeDZCxGJd5L8LcBHKHU0qt6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MseyejDnF7mwqmEqN7tEG0RqwtwCeVyNtPH/896j91wVIegZa2jtI2EZ83uU/0V2E
	 9lABAyLdbPYzFsVhyfmGnTTu37x50QYjuV8s+jH6Amg7TKgjIpjJN8Z1yU4VwkbWUT
	 x5BXsnAu3qJ+98zrmXtBO952PUMQ22v+Yt9pce53Mph3EDro8EXgBHN3FBLaE3Dems
	 iwO2PikBqjaPdls2M1/9azOD9y8bGLfzPBTVJus/mPdsTHro2WluEYbis3rUZIYFMZ
	 ayOSUhoxogSQEsa2y3V0uhRHOG/GCXPjaG6XijbjVMJSyE4jTNrm5nZ34MPsJ6W1+h
	 mVg9mRnoG2F4A==
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
Subject: [RFC PATCH V3 36/43] rv64ilp32_abi: printf: Use BITS_PER_LONG instead of CONFIG_64BIT
Date: Tue, 25 Mar 2025 08:16:17 -0400
Message-Id: <20250325121624.523258-37-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_052526_225199_7DC2C644 
X-CRM114-Status: UNSURE (   9.65  )
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

RV64ILP32 ABI systems have BITS_PER_LONG set to 32. Use
BITS_PER_LONG instead of CONFIG_64BIT.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 lib/vsprintf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 56fe96319292..2d719be86945 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -771,7 +771,7 @@ static inline int __ptr_to_hashval(const void *ptr, unsigned long *hashval_out)
 	/* Pairs with smp_wmb() after writing ptr_key. */
 	smp_rmb();
 
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	hashval = (unsigned long)siphash_1u64((u64)ptr, &ptr_key);
 	/*
 	 * Mask off the first 32 bits, this makes explicit that we have
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
