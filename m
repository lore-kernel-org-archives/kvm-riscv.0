Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DDEC35FFC
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 12:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IPo4oGIqcoPAaxlRRv7G1/S1G/zlML/+FsCBcI2SVhw=; b=f8wdScml+oLpBk
	n0dd7TC8oAzpFEjoL4/FzhnzGwkv8E66oI9JIg1ygjjkddRrGEbrPTndBtYaOPkLS3Z3gxX0X+hFV
	+bYqBzs4FmPN6IWwI3ckbmcH8xBNIKyIga/hUR4W2fVvoK7bk2AIoUBMiq60vR3ajYYJGesBoCAnX
	gOkQ72sl/Z5HhnFbbrmKiRIPUUUetXdSZ5JtyLTlUdaCASdW68Q/MwVOoS+C/Wi8lJxBkSASXCGPo
	BORm6Is3vRdSm5U6ZTNqHvfxk6sKVfgcFXHstRcmSb9yZF21gCnEuKSKKoXZOjEcfIIbmTkKEzaBS
	X7s40HC8BLwi1Rj+q5Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3dC-00000005tPO-00lc;
	Tue, 25 Mar 2025 12:43:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3Ki-00000005o9I-2s1j;
	Tue, 25 Mar 2025 12:24:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DD69A61592;
	Tue, 25 Mar 2025 12:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2D02C4CEED;
	Tue, 25 Mar 2025 12:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905479;
	bh=+rpm/N8/UHXP5n3hRK8c2vpAMzIx7Ul4qNvFlNw8mss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fJ61zsFNPv0tVZchhiONptI9S+phpKdkaxrIZlJXfqP8ZFhX5npdPIZKutJs7jnqd
	 cCfXzR1Lhw26JF6STGdUIKZRIQjVQ3FNgrDHdOvq/LtsFHWE3zxFE/GTBVb31ANpi6
	 beEwlo8W1sTeTn0cFAZJSTH8Xx2n6hy1MZKcm5ZKAENN6VnIKjbEvFrXx/UwseWpbr
	 aofW9gTlCfs1lWzyuR3LRO5UKXtkNqYmP8M+/YlMc+6Le8QBFSTCqH374JFrd1SAX6
	 1sinYuNojS4RMnq31N3OYBaEEMx5tdvpoFDLmiGmnn4c78h2enMsQS6DDCJxF83lgY
	 sgAsBfhlY0xYg==
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
Subject: [RFC PATCH V3 33/43] rv64ilp32_abi: mm/auxvec: Adapt mm->saved_auxv[] to Elf64
Date: Tue, 25 Mar 2025 08:16:14 -0400
Message-Id: <20250325121624.523258-34-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
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

Unable to handle kernel paging request at virtual address 60723de0
Oops [#1]
Modules linked in:
CPU: 0 UID: 0 PID: 1 Comm: init Not tainted 6.13.0-rc4-00031-g01dc3ca797b3-dirty #161
Hardware name: riscv-virtio,qemu (DT)
epc : percpu_counter_add_batch+0x38/0xc4
 ra : filemap_map_pages+0x3ec/0x54c
epc : ffffffffbc4ea02e ra : ffffffffbc1722e4 sp : ffffffffc1c4fc60
 gp : ffffffffbd6d3918 tp : ffffffffc1c50000 t0 : 0000000000000000
 t1 : 000000003fffefff t2 : 0000000000000000 s0 : ffffffffc1c4fca0
 s1 : 0000000000000022 a0 : ffffffffc25c8250 a1 : 0000000000000003
 a2 : 0000000000000020 a3 : 000000003fffefff a4 : 000000000b1c2000
 a5 : 0000000060723de0 a6 : ffffffffbffff000 a7 : 000000003fffffff
 s2 : ffffffffc25c8250 s3 : ffffffffc246e240 s4 : ffffffffc2138240
 s5 : ffffffffbd70c4d0 s6 : 0000000000000003 s7 : 0000000000000000
 s8 : ffffffff9a02d780 s9 : 0000000000000100 s10: ffffffffc1c4fda8
 s11: 0000000000000003 t3 : 0000000000000000 t4 : 00000000000004f7
 t5 : 0000000000000000 t6 : 0000000000000001
status: 0000000200000100 badaddr: 0000000060723de0 cause: 000000000000000d
[<bc4ea02e>] percpu_counter_add_batch+0x38/0xc4
[<bc1722e4>] filemap_map_pages+0x3ec/0x54c
[<bc1adc86>] handle_mm_fault+0xb6c/0xe9c
[<bc01bb3e>] handle_page_fault+0xd0/0x418
[<bca3e264>] do_page_fault+0x20/0x3a
[<bca4882c>] _new_vmalloc_restore_context_a0+0xb0/0xbc
Code: 8a93 4baa 511c 171b 0027 873b 00ea 4318 2481 9fb9 (aa03) 0007

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 include/linux/mm_types.h | 4 ++++
 kernel/sys.c             | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index da3ba1a79ad5..0d436b0217fd 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -962,7 +962,11 @@ struct mm_struct {
 		unsigned long start_brk, brk, start_stack;
 		unsigned long arg_start, arg_end, env_start, env_end;
 
+#ifdef CONFIG_64BIT
+		unsigned long long saved_auxv[AT_VECTOR_SIZE]; /* for /proc/PID/auxv */
+#else
 		unsigned long saved_auxv[AT_VECTOR_SIZE]; /* for /proc/PID/auxv */
+#endif
 
 		struct percpu_counter rss_stat[NR_MM_COUNTERS];
 
diff --git a/kernel/sys.c b/kernel/sys.c
index cb366ff8703a..81c0d94ff50d 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2008,7 +2008,11 @@ static int validate_prctl_map_addr(struct prctl_mm_map *prctl_map)
 static int prctl_set_mm_map(int opt, const void __user *addr, unsigned long data_size)
 {
 	struct prctl_mm_map prctl_map = { .exe_fd = (u32)-1, };
+#ifdef CONFIG_64BIT
+	unsigned long long user_auxv[AT_VECTOR_SIZE];
+#else
 	unsigned long user_auxv[AT_VECTOR_SIZE];
+#endif
 	struct mm_struct *mm = current->mm;
 	int error;
 
@@ -2122,7 +2126,11 @@ static int prctl_set_auxv(struct mm_struct *mm, unsigned long addr,
 	 * up to the caller to provide sane values here, otherwise userspace
 	 * tools which use this vector might be unhappy.
 	 */
+#ifdef CONFIG_64BIT
+	unsigned long long user_auxv[AT_VECTOR_SIZE] = {};
+#else
 	unsigned long user_auxv[AT_VECTOR_SIZE] = {};
+#endif
 
 	if (len > sizeof(user_auxv))
 		return -EINVAL;
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
