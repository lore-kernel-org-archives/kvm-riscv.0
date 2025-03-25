Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D041C36005
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 12:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v27eapePyYRFJ2gtQXzkboxLUgdnsVd3LE3qISrsZKc=; b=anajT5IoXNvgj6
	xjqw94k9HD6u2D8gpcal1kNdbodbBsPNL/MQzQMPhfLgP8S57ALJVB2z1Z5nK/MuZvmfE460NdBHs
	nrOCWUMrCIy/mth2l4vFg01d3mQQoxFwfBu/TlPGpcG8ev61zC3+JMJ+pr3Vc0rrXMpBsavqB+z08
	pMdqLHNdbltSKRhONEcSffCBb0vzXk97/SBwAFrt28FVGpwURqIdXEZ3RHL9b5PUCdVM1yTcALs95
	968BRHgTB1ncyn7JxoHz5ZwA7xD3TkEwfI++iJ0xp4D/UNu8hHqqhF3lhDFEiXeaq6ouXA9tzxyC9
	yjEYsFceRF0gk/1NjaAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3dC-00000005tPv-3cpK;
	Tue, 25 Mar 2025 12:43:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3Kx-00000005oEg-0jtt;
	Tue, 25 Mar 2025 12:24:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FFC340C51;
	Tue, 25 Mar 2025 12:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BE93C4CEE4;
	Tue, 25 Mar 2025 12:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905494;
	bh=JwtECzOHq6ymjHklbfhF05tHrVz/dVoFwQnBuog4LCc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NBdZnQ6wGqSC6QfVLwGWKEPwB7OJ2JptqWNe6hKJxvNlO7hfByhpmxMvHthIUgk61
	 dNUcCE7m/h28WuqOcXJmgPZQk3Hy8cSc4aiS4wgdEwf37RF7fMts6mVPBiUNrWNCWt
	 oWzAZgLDhGX29uKl8dWvRO9Mm1JoxE4/TpLaaQgKCG0EvxU9De7+6S+NM9bXKazZUh
	 iiJaT6DEIOs44LKfjd1QeKJBQDjIo3VxGUUBkRirfVvYipwwzvO9PksRO3PoHIeu8G
	 685HBjMd/zqHvy1H0+rm2OtgsMHs8OXxw2D6U5NNsckTsb6/vNidB7w2u683wCRv8q
	 kinJAJyufOtuA==
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
Subject: [RFC PATCH V3 34/43] rv64ilp32_abi: mm: Adapt vm_flags_t struct
Date: Tue, 25 Mar 2025 08:16:15 -0400
Message-Id: <20250325121624.523258-35-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_052455_267891_291483D9 
X-CRM114-Status: GOOD (  13.84  )
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

RV64ILP32 ABI linux kernel is based on CONFIG_64BIT, so uses
unsigned long long as vm_flags struct type.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 fs/proc/task_mmu.c       |  9 +++++++--
 include/linux/mm.h       | 10 +++++++---
 include/linux/mm_types.h |  4 ++++
 mm/debug.c               |  4 ++++
 mm/memory.c              |  4 ++++
 5 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index f02cd362309a..6c4eaba794da 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -905,6 +905,11 @@ static int smaps_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	return 0;
 }
 
+#ifdef CONFIG_64BIT
+#define MNEMONICS_SZ 64
+#else
+#define MNEMONICS_SZ 32
+#endif
 static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
 {
 	/*
@@ -917,11 +922,11 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
 	 * -Werror=unterminated-string-initialization warning
 	 *  with GCC 15
 	 */
-	static const char mnemonics[BITS_PER_LONG][3] = {
+	static const char mnemonics[MNEMONICS_SZ][3] = {
 		/*
 		 * In case if we meet a flag we don't know about.
 		 */
-		[0 ... (BITS_PER_LONG-1)] = "??",
+		[0 ... (MNEMONICS_SZ-1)] = "??",
 
 		[ilog2(VM_READ)]	= "rd",
 		[ilog2(VM_WRITE)]	= "wr",
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 454fb8ca724c..d9735cd7efe9 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -412,7 +412,11 @@ extern unsigned int kobjsize(const void *objp);
 
 #ifdef CONFIG_HAVE_ARCH_USERFAULTFD_MINOR
 # define VM_UFFD_MINOR_BIT	38
+#ifdef CONFIG_64BIT
+# define VM_UFFD_MINOR		BIT_ULL(VM_UFFD_MINOR_BIT)	/* UFFD minor faults */
+#else
 # define VM_UFFD_MINOR		BIT(VM_UFFD_MINOR_BIT)	/* UFFD minor faults */
+#endif
 #else /* !CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
 # define VM_UFFD_MINOR		VM_NONE
 #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
@@ -426,14 +430,14 @@ extern unsigned int kobjsize(const void *objp);
  */
 #ifdef CONFIG_64BIT
 #define VM_ALLOW_ANY_UNCACHED_BIT	39
-#define VM_ALLOW_ANY_UNCACHED		BIT(VM_ALLOW_ANY_UNCACHED_BIT)
+#define VM_ALLOW_ANY_UNCACHED		BIT_ULL(VM_ALLOW_ANY_UNCACHED_BIT)
 #else
 #define VM_ALLOW_ANY_UNCACHED		VM_NONE
 #endif
 
 #ifdef CONFIG_64BIT
 #define VM_DROPPABLE_BIT	40
-#define VM_DROPPABLE		BIT(VM_DROPPABLE_BIT)
+#define VM_DROPPABLE		BIT_ULL(VM_DROPPABLE_BIT)
 #elif defined(CONFIG_PPC32)
 #define VM_DROPPABLE		VM_ARCH_1
 #else
@@ -442,7 +446,7 @@ extern unsigned int kobjsize(const void *objp);
 
 #ifdef CONFIG_64BIT
 /* VM is sealed, in vm_flags */
-#define VM_SEALED	_BITUL(63)
+#define VM_SEALED	_BITULL(63)
 #endif
 
 /* Bits set in the VMA until the stack is in its final location */
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 0d436b0217fd..900665c5eca8 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -571,7 +571,11 @@ static inline void *folio_get_private(struct folio *folio)
 	return folio->private;
 }
 
+#ifdef CONFIG_64BIT
+typedef unsigned long long vm_flags_t;
+#else
 typedef unsigned long vm_flags_t;
+#endif
 
 /*
  * A region containing a mapping of a non-memory backed file under NOMMU
diff --git a/mm/debug.c b/mm/debug.c
index 8d2acf432385..0fcb85e6efea 100644
--- a/mm/debug.c
+++ b/mm/debug.c
@@ -181,7 +181,11 @@ void dump_vma(const struct vm_area_struct *vma)
 	pr_emerg("vma %px start %px end %px mm %px\n"
 		"prot %lx anon_vma %px vm_ops %px\n"
 		"pgoff %lx file %px private_data %px\n"
+#ifdef CONFIG_64BIT
+		"flags: %#llx(%pGv)\n",
+#else
 		"flags: %#lx(%pGv)\n",
+#endif
 		vma, (void *)vma->vm_start, (void *)vma->vm_end, vma->vm_mm,
 		(unsigned long)pgprot_val(vma->vm_page_prot),
 		vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
diff --git a/mm/memory.c b/mm/memory.c
index 539c0f7c6d54..3c4a9663c094 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -533,7 +533,11 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
 		 (long long)pte_val(pte), (long long)pmd_val(*pmd));
 	if (page)
 		dump_page(page, "bad pte");
+#ifdef CONFIG_64BIT
+	pr_alert("addr:%px vm_flags:%08llx anon_vma:%px mapping:%px index:%lx\n",
+#else
 	pr_alert("addr:%px vm_flags:%08lx anon_vma:%px mapping:%px index:%lx\n",
+#endif
 		 (void *)addr, vma->vm_flags, vma->anon_vma, mapping, index);
 	pr_alert("file:%pD fault:%ps mmap:%ps read_folio:%ps\n",
 		 vma->vm_file,
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
