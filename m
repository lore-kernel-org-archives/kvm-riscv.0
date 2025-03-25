Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B64C3600B
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 13:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rMi6g18NeubEidOaSKMWFSQnH65zqd7x6402fPYSFoQ=; b=CIVZGYRbsfpv78
	4x86M1ZQDl7306P3tF6nKoBTcvqZWfpe97EYq4cVNujPFTfpyXgm5qCbmlAV84JT/EhJ2kkcVdkN0
	I2uPAul3Y5z4NsQDUdtcwlq3/kEziSsHHLmLTw7AMAf4MpF+JaHopu8WCpPElazionfQMhlgptE3v
	GuKRESgqEBAvYvY/P+tFLDiPGFkqckLbN26ZbB0nbeZkQU9cHBNjcaSHrORxE6GrRwV/ziatLYXw2
	wZFgr9L/ZXLqGtOMOtZctJHel/MyEEtclo9axJEJ49iDUUAKydBVO/c0jx5z6Ea3qU9rnwvvgPN6U
	iUqRQdC96TmjwFDQoA3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4it-000000066Jw-1BKh;
	Tue, 25 Mar 2025 13:53:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3IB-00000005nN0-0BYh;
	Tue, 25 Mar 2025 12:22:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1FED16158D;
	Tue, 25 Mar 2025 12:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED79C4CEE9;
	Tue, 25 Mar 2025 12:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905322;
	bh=EOiooLZvwzRM6FHGKB7Ghuvoq/JlTjUJTDs6W9lVozk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YiNwDozbmDOug84APDztOZ2kil/O/36KZmxFYgseIvSYpf80jP5BkPovMatjpEwF7
	 9Mq3kmZ4ePc7RYLpMw9NEaSm0LGSMxns79AzH45x1KmUkZqWo4Skq6zfdG3Tlcxage
	 +k81YCl4yto0KufO7fU24VbbmT5HpsiwnQ/LJNEbWscleUqJq17+j1b39fWz8LWMSg
	 Uuit3b1JS+cJhBplzgf1jYyOjOrjET/O1rJQILxC4gg7nPXrpSCtouxe46dwFeFif2
	 9u1eZQAL0xJs37uoPehOJHR0ac4C+89etNoi3+6KrTYRMMOEqLazYSIyboQBbBmP0S
	 sxGJTKjz/HGow==
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
Subject: [RFC PATCH V3 22/43] rv64ilp32_abi: bpf: Change KERN_ARENA_SZ to 256MiB
Date: Tue, 25 Mar 2025 08:16:03 -0400
Message-Id: <20250325121624.523258-23-guoren@kernel.org>
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

The RV64ILP32 ABI limits the vmalloc range to 512MB, hence the
arena kernel range is set to 256MiB instead of 4GiB.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 kernel/bpf/arena.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
index 870aeb51d70a..4eb99f83d4a1 100644
--- a/kernel/bpf/arena.c
+++ b/kernel/bpf/arena.c
@@ -40,7 +40,14 @@
 
 /* number of bytes addressable by LDX/STX insn with 16-bit 'off' field */
 #define GUARD_SZ (1ull << sizeof_field(struct bpf_insn, off) * 8)
-#define KERN_VM_SZ (SZ_4G + GUARD_SZ)
+
+#if BITS_PER_LONG == 64
+#define KERN_ARENA_SZ SZ_4G
+#else
+#define KERN_ARENA_SZ SZ_256M
+#endif
+
+#define KERN_VM_SZ (KERN_ARENA_SZ + GUARD_SZ)
 
 struct bpf_arena {
 	struct bpf_map map;
@@ -115,7 +122,7 @@ static struct bpf_map *arena_map_alloc(union bpf_attr *attr)
 		return ERR_PTR(-EINVAL);
 
 	vm_range = (u64)attr->max_entries * PAGE_SIZE;
-	if (vm_range > SZ_4G)
+	if (vm_range > KERN_ARENA_SZ)
 		return ERR_PTR(-E2BIG);
 
 	if ((attr->map_extra >> 32) != ((attr->map_extra + vm_range - 1) >> 32))
@@ -321,7 +328,7 @@ static unsigned long arena_get_unmapped_area(struct file *filp, unsigned long ad
 
 	if (pgoff)
 		return -EINVAL;
-	if (len > SZ_4G)
+	if (len > KERN_ARENA_SZ)
 		return -E2BIG;
 
 	/* if user_vm_start was specified at arena creation time */
@@ -337,12 +344,14 @@ static unsigned long arena_get_unmapped_area(struct file *filp, unsigned long ad
 	ret = mm_get_unmapped_area(current->mm, filp, addr, len * 2, 0, flags);
 	if (IS_ERR_VALUE(ret))
 		return ret;
+#if BITS_PER_LONG == 64
 	if ((ret >> 32) == ((ret + len - 1) >> 32))
 		return ret;
+#endif
 	if (WARN_ON_ONCE(arena->user_vm_start))
 		/* checks at map creation time should prevent this */
 		return -EFAULT;
-	return round_up(ret, SZ_4G);
+	return round_up(ret, KERN_ARENA_SZ);
 }
 
 static int arena_map_mmap(struct bpf_map *map, struct vm_area_struct *vma)
@@ -366,7 +375,7 @@ static int arena_map_mmap(struct bpf_map *map, struct vm_area_struct *vma)
 		return -EBUSY;
 
 	/* Earlier checks should prevent this */
-	if (WARN_ON_ONCE(vma->vm_end - vma->vm_start > SZ_4G || vma->vm_pgoff))
+	if (WARN_ON_ONCE(vma->vm_end - vma->vm_start > KERN_ARENA_SZ || vma->vm_pgoff))
 		return -EFAULT;
 
 	if (remember_vma(arena, vma))
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
