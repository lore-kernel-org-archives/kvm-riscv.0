Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1F3F327CD
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 09:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vbTvkFbNoxYZJJZMxjz1RFLphr1j1V5IjmIZXENYFMc=; b=OAwZkYEw8ymNtJ
	rd5suNKLgelqLNCBgWTd7cLZNRR95r1i2AQaAXWdEseQYCecs7vprE5k8yWK1ujH8UTGjGFXSF8Lt
	SVtKgiq+jRvHJroWvh++0YYK2ZYULrJK+zzxOU02YG/g/SfWEFrymIXeYgC5s3uQeLeAh/iPivLVx
	dul36gNSHVpmBRc2RJH6xdgV2M6eKD7EKNGocrhXs2Yo4NxnHMLEelmNUnsR14UGC5QRuI/QwsO/n
	UEt9Qpm+p4L0S36F4wP4+4rC1hupWv+R26t3S7hQ5yEebUU36Cg53zDuF5UIbMPkLN0iVdvwCWM4V
	YcNareB8h+AvnA7BqfPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7NA-00000008KnD-2dR0;
	Tue, 21 Apr 2026 09:26:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7N9-00000008Km7-00Az
	for kvm-riscv@bombadil.infradead.org;
	Tue, 21 Apr 2026 09:26:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=FJWvxx2SvBNX2CVsFvwsTk0IK3zSjjAIlJH4BJFUonM=; b=kH9kbgkRACXzHkegmI4cO+0ZNJ
	2Y2X0IeSGGmQOFmwrDmy+Slg7e1jHsViw8giPGgeQMmyMnfQUvq/PpQwmj8VtehtJRmNfRS1mXA5D
	7TdZZHC2aUg2Oi6HrHXmhjaG0kf6Dx8Mf8iPbmlLYJar8mduEaSIseBFRg87h8zE21+Q3b5X+6iL/
	4eurZBj/8vACjwyXw5z13R5JxIQFc/l0amIuHCaRkB4kgjAHIda9HtDLIfsY17/kCdKrAZUAxSKNM
	mctAixfWfreR32ftwbMDSBFeDO8bawypuhP9V/ZIUy8CAca6BPt13AzTMG1qcJszYbFc5Z/rEMh3P
	h9fJ/PyQ==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7N0-00000009TtB-3H01
	for kvm-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 09:26:21 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-354bc7c2c46so2402526a91.0
        for <kvm-riscv@lists.infradead.org>; Tue, 21 Apr 2026 02:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1776763566; x=1777368366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJWvxx2SvBNX2CVsFvwsTk0IK3zSjjAIlJH4BJFUonM=;
        b=c8ShjUptkJnjjVth3QZXjXfcLGnKsrhO57WghHlU9sWTeP2QUzd9wG2bHaWndqKVPt
         XV8Y2gXhQCeTR3reaANckmiBQUibiycLY4xRtHS+1Elf9pxgtlS3fQhBb2Qd7UxGf7Es
         3YrYlcc+h0s/dxw+hW0t7k5sloUcrqTxKpEvFxfBHzoRd/pWaq+pujN41M/7b8yAl4by
         cAFdEsrTGzrDO4KdrEckZIsonDU4cIJ/IFZTZZjvGi6e7O9+pP96w8DDh7vmucF3smgA
         JGQubBNaaqSk8O3AKrc4oSCdcJwK23k5XlO+RMPW8G+wqGn0Op2ZZrBQ9R3x4YnpoH0t
         kr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776763566; x=1777368366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FJWvxx2SvBNX2CVsFvwsTk0IK3zSjjAIlJH4BJFUonM=;
        b=AcuJxMR9m64Y46beTNk8/WS1NU5HL/vfuCfuhEnHJ6ca9r+nXu4WY6rfLFzpGAYdQy
         D6HTL35ziCEd4H352To/OmvRzLeA5JmCfIjeEpY/gbHbHGaIQED5roaKUs4ckF3i1vj5
         M7W07qQ2XsuVo65qc9pV9zJ20rIxrzI3Cwt3bjgdOMLFXsVdUALm3ehu/mHqbeDZnqag
         2vt7fJVWhuYwbo4r7vYPlET8wi4weLx/2Y+vqLh5fCS9qERT5fAYED7leqERCVtGcbzk
         jGP41eepOA/jzqyzY3tCGSk9InJMmE+u7RG+TO5MSzNSdpdSTYdeic07YkJxEj9rk5Sl
         CF7g==
X-Forwarded-Encrypted: i=1; AFNElJ/b//EDYCma9ZxTUEv6hdoEjGW2R0qKJ480/iAlF6FJQmqAcBmz4F5q6tziMbB1QOlJT1zBHAs2Xeo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxmNXXM61mF3VpkKazGRuhjGs3tPoqAnnpwu7KTwOsjGN6k6L37
	4udY/cYs+yhMbokfHb6JqzmjBLD0Ut5k7Ss85nlvp7Aj+piSLU/LDlYTfHWnZ5fRESA=
X-Gm-Gg: AeBDievkd12GDN3SamthB8rNaJNDSAzR/jdfi6fgbTO8ZpPTFlz7hqUipCAE85/v3Hv
	VtEf7KWcZzTbQ8WZFRjV89VOPtZySSN1hKqcD8+VL9fu7L9LVqNd7960/b2NYsxlnf4iMTABA8q
	b4/gpGOpA3GIYbwI1spjIIKKdMDWHxY2jg9mdy47SHozPnUzpA5rDkVPNgDHZiN6F5eMahvl8lJ
	W+lCqM0MZKG8TWu+lxELydvMoJjc7sWwDPaDtyNfXslZsraTnRc3XhfX+rCAodPINH13FR674Ac
	S2BAEIMWNxw+A4wMgs+5a4leM3RF/rCd4xBKYXyblJpGKUgqOH45WUNg1gmHE2B6C8zDKySOUIN
	90XQEPteSxcYuOVAf3u9LS2a1JYC5r5hS/CVT59pIllIov7V2/ifhQDAtBaIRMNH/XYfhKxbrAh
	zt8rvU9HRlykW/hzR6if3hc6S55CoFJT+N1Uw91GvJTWNyBOgIjs5F6zWTbIQP8b734nb2DvRn2
	U97N7k=
X-Received: by 2002:a17:90b:5865:b0:35d:a557:e41 with SMTP id 98e67ed59e1d1-3614046f978mr18558407a91.14.1776763566317;
        Tue, 21 Apr 2026 02:26:06 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff39csm131965105ad.4.2026.04.21.02.25.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Apr 2026 02:26:05 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: akpm@linux-foundation.org,
	alex@ghiti.fr,
	andrew+kernel@donnellan.id.au,
	andreyknvl@gmail.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	apopple@nvidia.com,
	ardb@kernel.org,
	atish.patra@linux.dev,
	baolin.wang@linux.alibaba.com,
	cuiyunhui@bytedance.com,
	david@kernel.org,
	debug@rivosinc.com,
	djordje.todorovic@htecgroup.com,
	dvyukov@google.com,
	elver@google.com,
	glider@google.com,
	ilias.apalodimas@linaro.org,
	junhui.liu@pigmoral.tech,
	kasan-dev@googlegroups.com,
	kees@kernel.org,
	kevin.brodsky@arm.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liu.xuemei1@zte.com.cn,
	ljs@kernel.org,
	namcao@linutronix.de,
	osalvador@suse.de,
	palmer@dabbelt.com,
	pjw@kernel.org,
	rmclure@linux.ibm.com,
	rostedt@goodmis.org,
	rppt@kernel.org,
	ryabinin.a.a@gmail.com,
	surenb@google.com,
	vincenzo.frascino@arm.com,
	vishal.moola@gmail.com,
	wangruikang@iscas.ac.cn,
	zhangchunyan@iscas.ac.cn
Subject: [PATCH 6/7] riscv: batch write-protect contiguous PTE ranges
Date: Tue, 21 Apr 2026 17:24:56 +0800
Message-Id: <20260421092457.37649-7-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260421092457.37649-1-cuiyunhui@bytedance.com>
References: <20260421092457.37649-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_102618_875974_BB4F6BF2 
X-CRM114-Status: GOOD (  14.33  )
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

Hook wrprotect_ptes() into the Svnapot contpte helpers so write
protection can preserve fully covered NAPOT blocks and only unfold
partial ranges at the edges.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h | 38 +++++++++++++++++++++++++++--
 arch/riscv/mm/contpte.c          | 42 ++++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 3e6516b5a4587..db82253efb218 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -813,13 +813,30 @@ __ptep_set_wrprotect(struct mm_struct *mm, unsigned long address, pte_t *ptep)
 	 * shadow stack memory is XWR = 010 and thus clearing _PAGE_WRITE will lead to
 	 * encoding 000b which is wrong encoding with V = 1. This should lead to page fault
 	 * but we dont want this wrong configuration to be set in page tables.
+	 * Keep the entry readable when clearing write permissions so we don't create
+	 * an invalid present encoding.
 	 */
 	atomic_long_set((atomic_long_t *)ptep,
-			((pte_val(read_pte) & ~(unsigned long)_PAGE_WRITE) | _PAGE_READ));
+			(pte_val(read_pte) & ~(unsigned long)_PAGE_WRITE) |
+			_PAGE_READ);
 }
 
 #define __ptep_set_wrprotect __ptep_set_wrprotect
 
+static inline void __wrprotect_ptes(struct mm_struct *mm,
+				    unsigned long address,
+				    pte_t *ptep, unsigned int nr)
+{
+	for (;;) {
+		__ptep_set_wrprotect(mm, address, ptep);
+		if (--nr == 0)
+			break;
+		ptep++;
+		address += PAGE_SIZE;
+	}
+}
+
+#define __wrprotect_ptes __wrprotect_ptes
 static inline pte_t __ptep_clear_flush(struct vm_area_struct *vma,
 				       unsigned long address,
 				       pte_t *ptep)
@@ -879,6 +896,8 @@ pte_t napotpte_get_and_clear_full_ptes(struct mm_struct *mm,
 void napotpte_clear_young_dirty_ptes(struct vm_area_struct *vma,
 				     unsigned long addr, pte_t *ptep,
 			     unsigned int nr, cydp_t flags);
+void napotpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
+			     pte_t *ptep, unsigned int nr);
 bool napotpte_ptep_set_access_flags(struct vm_area_struct *vma,
 				    unsigned long address, pte_t *ptep,
 			    pte_t entry, int dirty);
@@ -1004,11 +1023,25 @@ static inline pte_t get_and_clear_full_ptes(struct mm_struct *mm,
 	return napotpte_get_and_clear_full_ptes(mm, addr, ptep, nr, full);
 }
 
+#define wrprotect_ptes wrprotect_ptes
+static inline void wrprotect_ptes(struct mm_struct *mm,
+				  unsigned long address, pte_t *ptep,
+				  unsigned int nr)
+{
+	if (likely(nr == 1)) {
+		napotpte_try_unfold(mm, address, ptep, __ptep_get(ptep));
+		__ptep_set_wrprotect(mm, address, ptep);
+		return;
+	}
+
+	napotpte_wrprotect_ptes(mm, address, ptep, nr);
+}
+
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
 static inline void ptep_set_wrprotect(struct mm_struct *mm,
 				      unsigned long address, pte_t *ptep)
 {
-	__ptep_set_wrprotect(mm, address, ptep);
+	wrprotect_ptes(mm, address, ptep, 1);
 }
 
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
@@ -1062,6 +1095,7 @@ napotpte_ptep_clear_flush_young(struct vm_area_struct *vma,
 #define clear_young_dirty_ptes			__clear_young_dirty_ptes
 #define clear_full_ptes				__clear_full_ptes
 #define get_and_clear_full_ptes			__get_and_clear_full_ptes
+#define wrprotect_ptes				__wrprotect_ptes
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
 #define ptep_set_wrprotect			__ptep_set_wrprotect
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
diff --git a/arch/riscv/mm/contpte.c b/arch/riscv/mm/contpte.c
index 77c2a4dbd3dda..077ffa49e89d9 100644
--- a/arch/riscv/mm/contpte.c
+++ b/arch/riscv/mm/contpte.c
@@ -261,6 +261,30 @@ static void napotpte_try_unfold_range(struct mm_struct *mm,
 	}
 }
 
+static void napotpte_try_unfold_partial(struct mm_struct *mm,
+					unsigned long addr, pte_t *ptep,
+					unsigned int nr)
+{
+	pte_t pte;
+
+	if (ptep != napot_align_ptep(ptep) || nr < napotpte_pte_num()) {
+		pte = READ_ONCE(*ptep);
+		if (pte_present_napot(pte))
+			__napotpte_try_unfold(mm, addr, ptep, pte);
+	}
+
+	if (ptep + nr != napot_align_ptep(ptep + nr)) {
+		unsigned long last_addr;
+		pte_t *last_ptep;
+
+		last_addr = addr + PAGE_SIZE * (nr - 1);
+		last_ptep = ptep + nr - 1;
+		pte = READ_ONCE(*last_ptep);
+		if (pte_present_napot(pte))
+			__napotpte_try_unfold(mm, last_addr, last_ptep, pte);
+	}
+}
+
 void __napotpte_try_unfold(struct mm_struct *mm, unsigned long addr,
 			   pte_t *ptep, pte_t pte)
 {
@@ -485,6 +509,24 @@ void napotpte_clear_young_dirty_ptes(struct vm_area_struct *vma,
 }
 EXPORT_SYMBOL(napotpte_clear_young_dirty_ptes);
 
+void napotpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
+			     pte_t *ptep, unsigned int nr)
+{
+	unsigned int i;
+
+	if (!napot_hw_supported() || !mm_is_user(mm)) {
+		for (i = 0; i < nr; i++, ptep++, addr += PAGE_SIZE)
+			__ptep_set_wrprotect(mm, addr, ptep);
+		return;
+	}
+
+	napotpte_try_unfold_partial(mm, addr, ptep, nr);
+
+	for (i = 0; i < nr; i++, ptep++, addr += PAGE_SIZE)
+		__ptep_set_wrprotect(mm, addr, ptep);
+}
+EXPORT_SYMBOL(napotpte_wrprotect_ptes);
+
 bool napotpte_ptep_set_access_flags(struct vm_area_struct *vma,
 				    unsigned long address, pte_t *ptep,
 				    pte_t entry, int dirty)
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
