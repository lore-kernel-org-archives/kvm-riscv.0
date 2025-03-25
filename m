Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1C6C35FFC
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 13:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E1t0jnZOkRv9pAJQpF3AKl0fb2vVa+dCw7lx0qPzBGg=; b=SqFD12sIKL3RXD
	SEXT04VbmwI12Irt13D0/ZDQXLrbRIWlcQYXrhdzURdONZJVBH0oNwvx4eEzg/x/6aFL9lyLGOMEj
	Z5/KeAuCW5j+gcrOIOhcQ9kNvufNpPuVTwy/jyYk8tkBZCeSL8NJOQWgZafL+9QgWk/H5UwmZSq3m
	qIoJy1CVS7KhfxrdLQppF18F5+Ug1jfh/4NrujSGu18iKk76GmAZY7y6jZuXB4b9bb/w46I93zEM0
	2gmXp728Wkb5Msqpp4BNXLOFmLssQ3iW7ozOnyIj5XR5OenODgD18A8BtEVXWJuk9Ac3fHb78trG7
	6U5WLuONIDpk83p6lFlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4jA-000000066ll-0kPn;
	Tue, 25 Mar 2025 13:54:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3KT-00000005o5o-2IYx;
	Tue, 25 Mar 2025 12:24:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B5ED2A4A682;
	Tue, 25 Mar 2025 12:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B04FAC4CEE4;
	Tue, 25 Mar 2025 12:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905464;
	bh=JPoN7MLEf8eR2nMyp8/thu8bst5//5Hk8VxE062lQ9Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dEoFxhRXAgIXTk+izxMj8NAc58Z150abzTA52wVaUo6oYVdkPjOE5SSRWPRWeVTRZ
	 U1/G1qYs1uREuzAoBzG0S14o2UVbqgxlA890HlC1yYQsuSNAzyB+Rmkj4zJV2ekZPy
	 fzIcdDjyk24aWTyz20XnUJhgLKC2ybNiG3fcpWxbHC+p5onyj0QMYQr8LexFkeoHXi
	 ika5eYC4afRp1Kftijmmo0sAT2pI8cXHBmJitbAMMAFNHKZ8/nrfoTyLZqlkraub3q
	 7VNeoISO8HTPBn0sSZs3s+QMMmmB4sh2Efhd9ZKgZQ2gPqONiWgdp4ZF195RgbZqwa
	 EQz1rLnxWUczg==
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
Subject: [RFC PATCH V3 32/43] rv64ilp32_abi: mm: Remove _folio_nr_pages
Date: Tue, 25 Mar 2025 08:16:13 -0400
Message-Id: <20250325121624.523258-33-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_052425_719569_CE33F8B8 
X-CRM114-Status: GOOD (  11.54  )
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

BITS_PER_LONG defines the layout of the struct page, and
_folio_nr_pages would conflict with page->_mapcount for RV64ILP32
ABI. Here is problem:

BUG: Bad page state in process kworker/u4:0  pfn:61eed
page: refcount:0 mapcount:5 mapping:00000000 index:0x0 pfn:0x61eed
flags: 0x0(zone=0)
raw: 00000000 00000000 ffffffff 00000000 00000000 00000000 00000004 00000000
raw: 00000000 00000000
page dumped because: nonzero mapcount
Modules linked in:
CPU: 0 UID: 0 PID: 11 Comm: kworker/u4:0 Not tainted 6.13.0-rc4
Hardware name: riscv-virtio,qemu (DT)
Workqueue: async async_run_entry_fn
Call Trace:
[<bc015096>] dump_backtrace+0x1e/0x26
[<bc002330>] show_stack+0x2a/0x38
[<bc00f38c>] dump_stack_lvl+0x4a/0x68
[<bc00f3c0>] dump_stack+0x16/0x1e
[<bc1cadd8>] bad_page+0x120/0x142
[<bc1cf2c2>] free_unref_page+0x510/0x5f8
[<bc17fb16>] __folio_put+0x6a/0xbc
[<bc1d6090>] free_large_kmalloc+0x6a/0xb8
[<bc1d9144>] kfree+0x23c/0x300
[<bcc02834>] unpack_to_rootfs+0x27c/0x2c0
[<bcc02e96>] do_populate_rootfs+0x24/0x12e
[<bc04c80c>] async_run_entry_fn+0x26/0xcc
[<bc03e116>] process_one_work+0x136/0x224
[<bc03e9e4>] worker_thread+0x234/0x30a
[<bc046334>] kthread+0xca/0xe6
[<bca47bea>] ret_from_fork+0xe/0x18
Disabling lock debugging due to kernel taint

So, remove _folio_nr_pages just like CONFIG_32BIT and use
"_flags_1 & 0xff" instead.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 include/linux/mm.h       | 4 ++--
 include/linux/mm_types.h | 2 +-
 mm/internal.h            | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7b1068ddcbb7..454fb8ca724c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2058,7 +2058,7 @@ static inline long folio_nr_pages(const struct folio *folio)
 {
 	if (!folio_test_large(folio))
 		return 1;
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return folio->_folio_nr_pages;
 #else
 	return 1L << (folio->_flags_1 & 0xff);
@@ -2083,7 +2083,7 @@ static inline unsigned long compound_nr(struct page *page)
 
 	if (!test_bit(PG_head, &folio->flags))
 		return 1;
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return folio->_folio_nr_pages;
 #else
 	return 1L << (folio->_flags_1 & 0xff);
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 6b27db7f9496..da3ba1a79ad5 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -370,7 +370,7 @@ struct folio {
 			atomic_t _entire_mapcount;
 			atomic_t _nr_pages_mapped;
 			atomic_t _pincount;
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 			unsigned int _folio_nr_pages;
 #endif
 	/* private: the union with struct page is transitional */
diff --git a/mm/internal.h b/mm/internal.h
index 109ef30fee11..c9372a8552ba 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -682,7 +682,7 @@ static inline void folio_set_order(struct folio *folio, unsigned int order)
 		return;
 
 	folio->_flags_1 = (folio->_flags_1 & ~0xffUL) | order;
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	folio->_folio_nr_pages = 1U << order;
 #endif
 }
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
