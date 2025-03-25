Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90070C35FFC
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 13:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=swwzqATRaI4uoUc+QWaU89ZH9xU2Qy0m9oBU9RkxI2U=; b=B0EVVi+BntQWqV
	k+m2V1E5QIgqBk7ZqCo0GRVeOzw43nJyXoDS/WeD9VJrj0888ZcARjPy2Nh0M1LR7ulmSymdy1jkd
	hbZHQtkx5Eh6MXo0+5u4oVuC6rJ8WhtxZIp5spMcWdVJsm6JcX14Snni2RBXFtow/dUZTxKFhqvAG
	WgvGpuDMvUdmYGPlaTDm8R9POXjWve9DtrLjZrIRcgir1qsQr5tM5rM9g3owktnucSFMvfEXVUldD
	nBrenSn506xuhxeEhzuaoO+KNDSTmuLlv/iIAb5YCfDcTidfGJNZDMZNzlYCDXY7OjwG6juaBnO0J
	6jnWCSmPN4hvIETjJqTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4jD-000000066qh-07mf;
	Tue, 25 Mar 2025 13:54:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3Mf-00000005ok2-1J5S;
	Tue, 25 Mar 2025 12:26:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9ED5E43C5F;
	Tue, 25 Mar 2025 12:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58230C4CEE4;
	Tue, 25 Mar 2025 12:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905600;
	bh=gGEDexkonBv9xkqlklXH6H0siev5It/WclAJgWuLAaE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ihVlwKblKsuWFNcMtDJ1k3ctKSbBwY49h9IjoH9KGH6RI/zq8BylDBqvJ9wyno/qp
	 IUv3RwZeYhK0sWieeIu1X7UarNylQxXDlKivCnDKhn4bx62KBOApARfUIXTkLXXsFn
	 3rI4E6bpvA/elj8kLNZnsdeON0EYb/TTcZHXFJrgLVFjWNZTsDHQaIIhPnPY6YDHgo
	 7rJORY6u+zOpHejnqnKv38Ge2nOcCABkagysYa3pxGYsHk/Lvc8HyUvKwE4GThzBZl
	 GffrGstDg5zLMeOPdXBQ0RXicXDZjiJ6nMyN1iFUR0hjCFd9gaaZECI2ylLLzOHNni
	 HKltn+V1I4Cmg==
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
Subject: [RFC PATCH V3 41/43] rv64ilp32_abi: tty: Adapt ptr_to_compat
Date: Tue, 25 Mar 2025 08:16:22 -0400
Message-Id: <20250325121624.523258-42-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_052641_385178_D2C625E3 
X-CRM114-Status: UNSURE (   7.94  )
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
So, the size of unsigned long is the same as compat_ulong_t and
no need "(unsigned long)v.iomem_base >> 32 ? 0xfffffff : ..."
detection.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 drivers/tty/tty_io.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index 449dbd216460..75e256e879d0 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -2873,8 +2873,12 @@ static int compat_tty_tiocgserial(struct tty_struct *tty,
 	err = tty->ops->get_serial(tty, &v);
 	if (!err) {
 		memcpy(&v32, &v, offsetof(struct serial_struct32, iomem_base));
+#if BITS_PER_LONG == 64
 		v32.iomem_base = (unsigned long)v.iomem_base >> 32 ?
 			0xfffffff : ptr_to_compat(v.iomem_base);
+#else
+		v32.iomem_base = ptr_to_compat(v.iomem_base);
+#endif
 		v32.iomem_reg_shift = v.iomem_reg_shift;
 		v32.port_high = v.port_high;
 		if (copy_to_user(ss, &v32, sizeof(v32)))
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
