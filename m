Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D87AC3600B
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 12:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rAN1V6F73xLDK6mXh7O1KEkep4pBjRqPvOiKrdzW1/I=; b=is5W3ciGgpfsSm
	BTY2oEggXn2MYsJhyvZgdAOqVLP/alelSZn1+Mz8+EhyjfJl3cWeLDmVDC+hLsy1ejPxdn9ynA8wl
	OE5R08isA0w8Zfz3sJRVZM1lSher41XpFfUh0hjZMfJfGV4GRY0bw6FEZamQo2/dJHEUWQNFnwTav
	qeK7T6FpPgHwZ3CVmLiPzcwfTr/xFHz7LyPU93Py+KS37SWyCtkvTQSo4BNq3kcLnj2E/N4It/Gej
	QqLQH07s0tSZr2lg9DDDvjeZgCHBB+ahitRT6q7++Bm4ABar1K37N1fzDEdldkXgbG3qu/JRQqHCS
	qyhrQv+lrfwRKeB0VkWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3dO-00000005tgT-09Rd;
	Tue, 25 Mar 2025 12:43:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3Mu-00000005oon-49E7;
	Tue, 25 Mar 2025 12:26:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B10A6159B;
	Tue, 25 Mar 2025 12:26:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD52C4CEED;
	Tue, 25 Mar 2025 12:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905616;
	bh=9rClAibepR5410hMymY5QyjFNfu9myyrJTkBJ7yJs84=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PSXvc+q07mYxURgabvhC0EDZ07GzmsdGsbFL99gOWwWn2P5z8FZ/BlJ02MvKw0oi0
	 DebZmNXKJ2CXOdMnsWEWR3OoVOJMtpx5upcoqoGzimuBC7isnkYS1TqP5L1E6cxZU6
	 4XrYv8tJiQ/yVO+KpHHDW9WJtvg1IAC6n5lPmXBEkrmtDpQIZKAsCw9ZnEWbQ7Gm8D
	 EFr+OQdexB1ClgCWhZJhpf6cX91lUXmdACsoE7/AQufDa2ng7DPJR1k3C71ynpd+D/
	 KrFEXsFArC7JDeWksZBrKc+/l/OmyTWBnHSzZmaXAgyqRcEOww2gygQgud3qZdqgXr
	 KuA9Abd2ez09A==
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
Subject: [RFC PATCH V3 42/43] rv64ilp32_abi: memfd: Use vm_flag_t
Date: Tue, 25 Mar 2025 08:16:23 -0400
Message-Id: <20250325121624.523258-43-guoren@kernel.org>
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

RV64ILP32 ABI linux kernel is based on CONFIG_64BIT, and uses
unsigned long long as vm_flags_t. Using unsigned long would
break rv64ilp32 abi.

The definition of vm_flag_t exists, hence its usage is
preferred even if it's not essential.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 include/linux/memfd.h | 4 ++--
 mm/memfd.c            | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/memfd.h b/include/linux/memfd.h
index 246daadbfde8..6f606d9573c3 100644
--- a/include/linux/memfd.h
+++ b/include/linux/memfd.h
@@ -14,7 +14,7 @@ struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx);
  * We also update VMA flags if appropriate by manipulating the VMA flags pointed
  * to by vm_flags_ptr.
  */
-int memfd_check_seals_mmap(struct file *file, unsigned long *vm_flags_ptr);
+int memfd_check_seals_mmap(struct file *file, vm_flags_t *vm_flags_ptr);
 #else
 static inline long memfd_fcntl(struct file *f, unsigned int c, unsigned int a)
 {
@@ -25,7 +25,7 @@ static inline struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
 	return ERR_PTR(-EINVAL);
 }
 static inline int memfd_check_seals_mmap(struct file *file,
-					 unsigned long *vm_flags_ptr)
+					 vm_flags_t *vm_flags_ptr)
 {
 	return 0;
 }
diff --git a/mm/memfd.c b/mm/memfd.c
index 37f7be57c2f5..50dad90ffedc 100644
--- a/mm/memfd.c
+++ b/mm/memfd.c
@@ -332,10 +332,10 @@ static inline bool is_write_sealed(unsigned int seals)
 	return seals & (F_SEAL_WRITE | F_SEAL_FUTURE_WRITE);
 }
 
-static int check_write_seal(unsigned long *vm_flags_ptr)
+static int check_write_seal(vm_flags_t *vm_flags_ptr)
 {
-	unsigned long vm_flags = *vm_flags_ptr;
-	unsigned long mask = vm_flags & (VM_SHARED | VM_WRITE);
+	vm_flags_t vm_flags = *vm_flags_ptr;
+	vm_flags_t mask = vm_flags & (VM_SHARED | VM_WRITE);
 
 	/* If a private matting then writability is irrelevant. */
 	if (!(mask & VM_SHARED))
@@ -357,7 +357,7 @@ static int check_write_seal(unsigned long *vm_flags_ptr)
 	return 0;
 }
 
-int memfd_check_seals_mmap(struct file *file, unsigned long *vm_flags_ptr)
+int memfd_check_seals_mmap(struct file *file, vm_flags_t *vm_flags_ptr)
 {
 	int err = 0;
 	unsigned int *seals_ptr = memfd_file_seals_ptr(file);
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
