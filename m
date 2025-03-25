Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C01C3600B
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 13:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+szVeSMxFSCBTMKCKJXibhsusvtd+XivIWoBa1nvz7A=; b=B1y46RAyNFNl79
	frne0ne70NOKe1G6q6v7RmiPPZo82SBy+t362kNMvtuVnJKoIs4tM+tFQXf/pX8jnchz9hBVBKRY/
	xHuC0GJMVtL8j/6tJTywypM+BcELewFUOFFxZm5RHr8T1NnvoptV+dqJZyAyvdFUhxHdD0kzrO2/V
	3zWGwKOx39f8pXWAhUAkFjEtufMOSpZmUvOwhNCx93O5/KcOAo7wHi3uCo66ctjqGiCBFSKE9sOxo
	4MBBa4uviEG8rnVybCdH9I0t25Uj29U7rxRdGA0Fw1vEY3Qvv521yH5este6YeQPWGwhuG1Fg0cVW
	AOXFnZojEGmZChtj0+nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4j2-000000066Yj-1zrp;
	Tue, 25 Mar 2025 13:53:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3JY-00000005noX-2q1E;
	Tue, 25 Mar 2025 12:23:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 03F2A4368C;
	Tue, 25 Mar 2025 12:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2976FC4CEE4;
	Tue, 25 Mar 2025 12:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905408;
	bh=pIv4vnuS3dsIZ+vCl3ehqADgm2CZ2tBy3QR8swaXSZQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ecDCGr6OLJrXP13nyG/CgfeqC9ouA1qT3tlj+OsrVH1NtYD+Twp5WMbEHjMMkk81f
	 stvP5ulWY1CYT8IOPOz08uY1HZBIlRPl1RvD/lfIzSGNe84mV4QvJl7p4JgmuvzAGK
	 4RQVcdL24R3V34bLEfSycUxh++RgrXULYrYbovXoNTKWlQFJodYvno3cZge1QELjR8
	 9C6TOI1VyQMTYJ6+SrsJ+n3smhuFVy+uvJ4yY+gtiJBw2C4LdtFBWY4B9hpCJDn6Wt
	 XZ5TT6fYnWqqxrxfJ2ivZTzD3naWTrT9gp922T0ATA8xVyN89LV9zmP9RucwuPViGB
	 6t4JQnchHEBxw==
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
Subject: [RFC PATCH V3 28/43] rv64ilp32_abi: iov_iter: Resize kvec to match iov_iter's size
Date: Tue, 25 Mar 2025 08:16:09 -0400
Message-Id: <20250325121624.523258-29-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_052328_738704_B22A43F5 
X-CRM114-Status: UNSURE (   7.04  )
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

As drivers/vhost/vringh.c uses BUILD_BUG_ON(sizeof(struct iovec)
!= sizeof(struct kvec)), make them the same.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 include/linux/uio.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/uio.h b/include/linux/uio.h
index 8ada84e85447..0e1ca023374c 100644
--- a/include/linux/uio.h
+++ b/include/linux/uio.h
@@ -17,7 +17,13 @@ typedef unsigned int __bitwise iov_iter_extraction_t;
 
 struct kvec {
 	void *iov_base; /* and that should *never* hold a userland pointer */
+#if defined(CONFIG_64BIT) && (BITS_PER_LONG == 32)
+	u32  __pad1;
+#endif
 	size_t iov_len;
+#if defined(CONFIG_64BIT) && (BITS_PER_LONG == 32)
+	u32  __pad2;
+#endif
 };
 
 enum iter_type {
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
