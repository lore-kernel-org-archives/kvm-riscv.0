Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E21C3600D
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 12:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xiBh76WE7/QVRPurt6Gbp6J4RHnGecmlK/v1T8BlcCE=; b=Fgc9L+FmYXd49X
	qrPh38BsiLtQTJEJpP2RBQkerzeEi+Lb4pcd9vDnfEL8V+QFdDDlmQ+YdN6JfvZ5SauaEChjPTxON
	RK3PmrKVW52LnU5WLCvamnSXlCQABDJ+FaEQBUdpx5nQgJpHsXwyKj+3zHNvuTPbFgnuWt7Uswefg
	q8FLBfHPUac1vcEDWCxwB1bow6YrAh1bSjZlduLUoAPqYLYcBITskINgvTZBn0l1Fw5UBLKsqVQ77
	LIP3RMahY/LJHj1YKWjUjI3nms6g9OWlrfvKJtsn0Vib9EH4IH8rF3Edup4lAw+8IjeqHecscHXLz
	bVPC7XlG+8RYHtNjE41g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3dD-00000005tQr-3Vja;
	Tue, 25 Mar 2025 12:43:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3LC-00000005oJ3-42AJ;
	Tue, 25 Mar 2025 12:25:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 578715C5E40;
	Tue, 25 Mar 2025 12:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2981CC4CEE4;
	Tue, 25 Mar 2025 12:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905510;
	bh=uqoJTO8TQ6On8+9R1MYgJxGk7xYpfwdXChiuqug5XKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tbm8Xu/xL9LwAkup8nr/CZGwgZ/HtBocjjMNivSDeL5hMNIibkzNWBIjcdug8EvfD
	 QidFgTYi+HMsMkeR8+VRTweKTrWgmou5CzsndMXzlO4oZEivwlhPhDjj4fjOc56Qc9
	 LEKFd8XS0hLN2de0NvYOj9MFS3ZC1n3uwR87P/ChdO+Qxq566Apd5rBSyR6mxaQqhR
	 uYwPY7KfQYrAJZbgGx2D1hYimJ9ECj2lRGYUD9xqOKdph3HacGa/jE9YJiGcpZdWWY
	 sfTkSdpa1Iac6eeiW6fFY3790kvmIaOHme0uYaLwkVlbwify8gYY2fjL3qNT/qkevh
	 HrFm01xwFxqLQ==
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
Subject: [RFC PATCH V3 35/43] rv64ilp32_abi: net: Use BITS_PER_LONG in struct dst_entry
Date: Tue, 25 Mar 2025 08:16:16 -0400
Message-Id: <20250325121624.523258-36-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_052511_085642_FAF36CB5 
X-CRM114-Status: UNSURE (   9.22  )
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

The rv64ilp32 ABI depends on CONFIG_64BIT for its ILP32 data type,
which is smaller. To align with ILP32 requirements, CONFIG_64BIT
was changed to BITS_PER_LONG in struct dts_entry.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 include/net/dst.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/net/dst.h b/include/net/dst.h
index 78c78cdce0e9..af1c74c4836e 100644
--- a/include/net/dst.h
+++ b/include/net/dst.h
@@ -65,7 +65,7 @@ struct dst_entry {
 	 * __rcuref wants to be on a different cache line from
 	 * input/output/ops or performance tanks badly
 	 */
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	rcuref_t		__rcuref;	/* 64-bit offset 64 */
 #endif
 	int			__use;
@@ -74,7 +74,7 @@ struct dst_entry {
 	short			error;
 	short			__pad;
 	__u32			tclassid;
-#ifndef CONFIG_64BIT
+#if BITS_PER_LONG == 32
 	struct lwtunnel_state   *lwtstate;
 	rcuref_t		__rcuref;	/* 32-bit offset 64 */
 #endif
@@ -89,7 +89,7 @@ struct dst_entry {
 	 */
 	struct list_head	rt_uncached;
 	struct uncached_list	*rt_uncached_list;
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	struct lwtunnel_state   *lwtstate;
 #endif
 };
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
