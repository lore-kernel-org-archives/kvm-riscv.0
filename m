Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E2DC54FCD
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 02:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PCXd0VwacT99xY5hUxxBBqfG4lXLDUKN4QfwqJBvQ40=; b=lGEju0h/lk0mJR
	p5LwfbHbTdiy/NUXLJVvB55L41Toad7rVVWUqcpL+akEE72C8Awm20XPkn6lo3Y3/BjYx7Me00NX+
	njJDwE9W3HZQHLDXq4X1gYTs5Z2QwVgSQiGbzGdJynDqLDJQajwfSEfMrxtuo4tjplo8DgA/Kks9h
	AUA/t5zQXXTvnJqDuUT+6cKb2LlUW7oggY+5BGveT5EhZ8W8Rquno8WJTG/Kj4ozs9yTSEJtyBpnD
	molP+9wD7nuy2KSyfmEcHqMz464bkTTmj9bXUQXtz32iR3bbQ5VBvi1CW4VFW+E8aRRyYadACqhZR
	ORuwhNbidiyInyki8Zng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpGlq-00000009Mrk-44VU;
	Thu, 30 Jul 2026 02:45:18 +0000
Received: from mail-pj2-x03.google.com ([2607:f8b0:4864:39::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpGln-00000009Mqw-3eVx
	for kvm-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 02:45:17 +0000
Received: by mail-pj2-x03.google.com with SMTP id 98e67ed59e1d1-38111ea8a88so1003569a91.1
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 19:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785379515; x=1785984315; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=meJSQ04WBiDIRj28ufTGbhmrt28uHJ+jjo+yeu158ak=;
        b=l0QSEZhUN2oCdBDHWp2pDLPgE6nobLF4dyX+E3/qYOR4CnZcNiFFg+0vv02qcL98ug
         ObdO6ltKm0oBGRgVVzSlOb6YRUTUpNrzYluoWZRFvdH1AJnTNf366ogX/0Z4A4ttkcCJ
         e02r7I0CbXmy4gUYEkzrYqcKnykWBlRFMt16IgGz9Se+IoFri6RfuvVWMfQlvr0gQAjH
         OUVniv7YiK6KVBjY18d1YbqE/lrHUzsJ8wYBH8Q29IaNOtK4t8JOm+gv3QF8o/HG9a3y
         LBIsnsv+EPc8RcBPF1T2cFGfwCF72c80tHbDkuILnXIYbTi5midc666ZV9A99CEjjVsy
         VZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785379515; x=1785984315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=meJSQ04WBiDIRj28ufTGbhmrt28uHJ+jjo+yeu158ak=;
        b=AQFRdV1ak8VJRSr2yjDTdJGLnO0bRuiwzDtBD23Uy/gyfwmg4U++hukDGN3uGtPS8B
         M2JfGMm4XGTIj3y+C35WQCpQCQFja52inE1T5P7jQ+2UVTVF2g5fppMYOocoFHFkX6Es
         GMFppzW6qn9YLe9bwU+WqCP1O6Qh9O33dRpm3RfAOo2RYiUH1AnX5N2GoTbIj5VawVCg
         QYeTOYjY4p5onGz9N3Nvi0cYU1Aia9OxB4abQZQic5w/D3YnaPk2OTBvOWfc33+BizAF
         pv4LLiZWjXxbyBBz+rHG60LT6NZfhZtsPOlNu+5TNiVHCy5obpcDGiTukMblbgvjey2R
         dc8A==
X-Forwarded-Encrypted: i=1; AHgh+RqhbxNweBsy92UXASTajXigJGaggTn6f7XN5jhIuyx6Xu0ijJJ2V8yXwgjbj4Prfqhd6U9sq3ILTMI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwPCSeakBoo7F/82gVOpCnVq3DSof/jrifU8asmf/BpbiWi7vAy
	a+D0pVrQh97rrkIFe/A+p68KlXAp2MczSTtsJdqrK5RNgKClPpwY+6M4
X-Gm-Gg: AR+sD10DmoeHaJcSxCqqlhXc7w7AxvWj9sawEFTC6jGev+O8ehqIsAZf8kBFSFK0hZa
	PhBkBBWUwVmF2fzgFojmuI6yOooUHTZm2K8wWVRpR6oWiqF3iN2Wub4UQFXtiN61Sj/hwoj1z4q
	sCg6oQ488gvI7GVReCJDwIsMqhdB4p9NlyzJCUHBTKGGRQHy3rGE4zCc3vaZLNTyoGY64sGmTM9
	UuzfVT+BeMhm1ikKIVpgcptrt/ylT9lapEQu6qYMS4fgYPtRA7V9MJd5KZklvd5uE2t0lt98EUM
	b+rIRZhLMNSEtImgk00lNg/MPhiB7GuFDPk7YqLdWSdoFGQ4sIr7mX98tZkwraLUcis4k5QmpFK
	JbsObqvls+7KfVS3GghiqvQvj4yGd/SI5zcEoLvYlfOqIx4/LF60JL6wA1+OTJd36adGxYF6q7p
	1fQWcwoFL8e8ikDSXCCONhpfNVeXqAyucUlxjs10yAG9+XdAzu2pKor8TtJNhEPbfoFRXrkUris
	Fo=
X-Received: by 2002:a17:90b:52cc:b0:38e:712a:bb38 with SMTP id 98e67ed59e1d1-38f9bef3409mr874083a91.24.1785379514730;
        Wed, 29 Jul 2026 19:45:14 -0700 (PDT)
Received: from q-System-Product-Name ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9babbf90sm221489a91.14.2026.07.29.19.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 19:45:14 -0700 (PDT)
From: "Bingyu.Xian" <shanbeeyoo@gmail.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: linux-riscv@lists.infradead.org,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v2] RISC-V: KVM: Add minimal guest_memfd support
Date: Thu, 30 Jul 2026 10:45:10 +0800
Message-ID: <20260730024510.1063290-1-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260729070756.730312-1-shanbeeyoo@gmail.com>
References: <20260729070756.730312-1-shanbeeyoo@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_194515_946172_562F3962 
X-CRM114-Status: GOOD (  22.80  )
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

Add minimal guest_memfd support for RISC-V KVM, following the same

pattern as x86 and arm64.

1. Select KVM_GUEST_MEMFD in Kconfig

2. In kvm_riscv_mmu_map(), check kvm_slot_has_gmem() early, before

   taking mmap_read_lock(). For gmem memslots, resolve the PFN via

   kvm_gmem_get_pfn(), then acquire kvm->mmu_lock and jump to G-stage

   mapping, bypassing vma_lookup()/__kvm_faultin_pfn(). The gmem PFN

   is resolved before mmap_read_lock() so the mmu_lock taken for the

   mapping is never held while waiting for mmap_lock, which would

   deadlock against mmu_notifier invalidation (mmu_lock -> mmap_lock).

3. Skip kvm_release_faultin_page() for gmem pages; their lifetime is

   managed by the gmem inode and invalidation notifier.

4. Skip hva lookup and validity check in gstage_page_fault() for gmem,

   which does not have a userspace VMA backing it.

Changes since RFC v1:

  - Add vcpu_exit.c hva lookup bypass for gmem slots

  - Call kvm_prepare_memory_fault_exit() on gmem fault failure

  - Respect KVM_MEM_READONLY for gmem slot writability

  - Skip THP adjustment for gmem (only PAGE_SIZE supported)

  - Skip dirty tracking for gmem (handled by gmem notifier)

  - Replace goto with is_gmem variable for cleaner flow


Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Bingyu.Xian <shanbeeyoo@gmail.com>
---
 arch/riscv/kvm/Kconfig     |   1 +
 arch/riscv/kvm/mmu.c       | 134 +++++++++++++++++++++++--------------
 arch/riscv/kvm/vcpu_exit.c |  17 ++++-
 3 files changed, 99 insertions(+), 53 deletions(-)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index ec2cee0a39e0..77121100579f 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -29,6 +29,7 @@ config KVM
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select KVM_MMIO
+	select KVM_GUEST_MEMFD
 	select VIRT_XFER_TO_GUEST_WORK
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index d2a06a54be17..5d37d8a93a1d 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -551,6 +551,8 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	unsigned long vma_pagesize, mmu_seq;
 	struct kvm_gstage gstage;
 	struct page *page;
+	int max_order;
+	bool is_gmem;
 
 	kvm_riscv_gstage_init(&gstage, kvm);
 
@@ -568,60 +570,79 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 		return ret;
 	}
 
-	mmap_read_lock(current->mm);
-
-	vma = vma_lookup(current->mm, hva);
-	if (unlikely(!vma)) {
-		kvm_err("Failed to find VMA for hva 0x%lx\n", hva);
-		mmap_read_unlock(current->mm);
-		return -EFAULT;
-	}
+	is_gmem = kvm_slot_has_gmem(memslot);
+	if (is_gmem) {
+		/*
+		 * For guest_memfd-backed slots, bypass the userspace VMA lookup
+		 * and get the PFN directly from the guest_memfd inode.
+		 */
+		ret = kvm_gmem_get_pfn(kvm, memslot, gfn, &hfn, &page, &max_order);
+		if (ret) {
+			kvm_prepare_memory_fault_exit(vcpu, gpa, PAGE_SIZE,
+						      is_write, false, false);
+			return ret;
+		}
 
-	is_hugetlb = is_vm_hugetlb_page(vma);
-	if (is_hugetlb)
-		vma_pageshift = huge_page_shift(hstate_vma(vma));
-	else
-		vma_pageshift = PAGE_SHIFT;
-	vma_pagesize = 1ULL << vma_pageshift;
-	if (logging || (vma->vm_flags & VM_PFNMAP))
 		vma_pagesize = PAGE_SIZE;
-	else if (is_hugetlb)
-		vma_pagesize = hugetlb_mapping_size(memslot, hva, vma_pagesize);
+		writable = !(memslot->flags & KVM_MEM_READONLY);
+		/* gmem faultin does not go through mmu notifier invalidation */
+		mmu_seq = kvm->mmu_invalidate_seq;
+	} else {
+		mmap_read_lock(current->mm);
 
-	/*
-	 * For hugetlb mappings, vma_pagesize might have been reduced from the
-	 * VMA size to a smaller safe mapping size.
-	 */
-	if (vma_pagesize == PMD_SIZE || vma_pagesize == PUD_SIZE)
-		gfn = ALIGN_DOWN(gpa, vma_pagesize) >> PAGE_SHIFT;
+		vma = vma_lookup(current->mm, hva);
+		if (unlikely(!vma)) {
+			kvm_err("Failed to find VMA for hva 0x%lx\n", hva);
+			mmap_read_unlock(current->mm);
+			return -EFAULT;
+		}
 
-	/*
-	 * Read mmu_invalidate_seq so that KVM can detect if the results of
-	 * vma_lookup() or __kvm_faultin_pfn() become stale prior to acquiring
-	 * kvm->mmu_lock.
-	 *
-	 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
-	 * with the smp_wmb() in kvm_mmu_invalidate_end().
-	 */
-	mmu_seq = kvm->mmu_invalidate_seq;
-	mmap_read_unlock(current->mm);
+		is_hugetlb = is_vm_hugetlb_page(vma);
+		if (is_hugetlb)
+			vma_pageshift = huge_page_shift(hstate_vma(vma));
+		else
+			vma_pageshift = PAGE_SHIFT;
+		vma_pagesize = 1ULL << vma_pageshift;
+		if (logging || (vma->vm_flags & VM_PFNMAP))
+			vma_pagesize = PAGE_SIZE;
+		else if (is_hugetlb)
+			vma_pagesize = hugetlb_mapping_size(memslot, hva, vma_pagesize);
 
-	if (vma_pagesize != PUD_SIZE &&
-	    vma_pagesize != PMD_SIZE &&
-	    vma_pagesize != PAGE_SIZE) {
-		kvm_err("Invalid VMA page size 0x%lx\n", vma_pagesize);
-		return -EFAULT;
-	}
+		/*
+		 * For hugetlb mappings, vma_pagesize might have been reduced from the
+		 * VMA size to a smaller safe mapping size.
+		 */
+		if (vma_pagesize == PMD_SIZE || vma_pagesize == PUD_SIZE)
+			gfn = ALIGN_DOWN(gpa, vma_pagesize) >> PAGE_SHIFT;
 
-	hfn = __kvm_faultin_pfn(memslot, gfn, is_write ? FOLL_WRITE : 0,
-				&writable, &page);
-	if (hfn == KVM_PFN_ERR_HWPOISON) {
-		send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
-				vma_pageshift, current);
-		return 0;
+		/*
+		 * Read mmu_invalidate_seq so that KVM can detect if the results of
+		 * vma_lookup() or __kvm_faultin_pfn() become stale prior to acquiring
+		 * kvm->mmu_lock.
+		 *
+		 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
+		 * with the smp_wmb() in kvm_mmu_invalidate_end().
+		 */
+		mmu_seq = kvm->mmu_invalidate_seq;
+		mmap_read_unlock(current->mm);
+
+		if (vma_pagesize != PUD_SIZE &&
+		    vma_pagesize != PMD_SIZE &&
+		    vma_pagesize != PAGE_SIZE) {
+			kvm_err("Invalid VMA page size 0x%lx\n", vma_pagesize);
+			return -EFAULT;
+		}
+
+		hfn = __kvm_faultin_pfn(memslot, gfn, is_write ? FOLL_WRITE : 0,
+					&writable, &page);
+		if (hfn == KVM_PFN_ERR_HWPOISON) {
+			send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
+					vma_pageshift, current);
+			return 0;
+		}
+		if (is_error_noslot_pfn(hfn))
+			return -EFAULT;
 	}
-	if (is_error_noslot_pfn(hfn))
-		return -EFAULT;
 
 	/*
 	 * If logging is active then we allow writable pages only
@@ -639,12 +660,20 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	 * Check if we are backed by a THP and thus use block mapping if
 	 * possible. Hugetlb mappings already selected their target size above,
 	 * so do not promote them through the THP helper.
+	 *
+	 * Skip THP adjustment for gmem, which only supports PAGE_SIZE mappings
+	 * and does not have a valid hva for follow_pte().
 	 */
-	if (!logging && !is_hugetlb && vma_pagesize == PAGE_SIZE)
+	if (!is_gmem && !logging && !is_hugetlb && vma_pagesize == PAGE_SIZE)
 		vma_pagesize = transparent_hugepage_adjust(kvm, memslot, hva, &hfn, &gpa);
 
 	if (writable) {
-		mark_page_dirty_in_slot(kvm, memslot, gfn);
+		/*
+		 * Skip dirty page tracking for gmem; page dirtying is handled
+		 * via the gmem invalidation notifier and page cache.
+		 */
+		if (!is_gmem)
+			mark_page_dirty_in_slot(kvm, memslot, gfn);
 		ret = kvm_riscv_gstage_map_page(&gstage, pcache, gpa, hfn << PAGE_SHIFT,
 						vma_pagesize, false, true, out_map);
 	} else {
@@ -658,7 +687,12 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 		kvm_err("Failed to map in G-stage\n");
 
 out_unlock:
-	kvm_release_faultin_page(kvm, page, ret, writable);
+	/*
+	 * Skip kvm_release_faultin_page() for gmem pages; their lifetime is
+	 * managed by the gmem inode and invalidation notifier.
+	 */
+	if (!is_gmem)
+		kvm_release_faultin_page(kvm, page, ret, writable);
 	write_unlock(&kvm->mmu_lock);
 	return ret;
 }
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 28cf9b27bb07..5c381a4f9977 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -26,10 +26,21 @@ static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	fault_addr = ((gpa_t)trap->htval << 2) | (trap->stval & 0x3);
 	gfn = fault_addr >> PAGE_SHIFT;
 	memslot = gfn_to_memslot(vcpu->kvm, gfn);
-	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
 
-	if (kvm_is_error_hva(hva) ||
-	    (trap->scause == EXC_STORE_GUEST_PAGE_FAULT && !writable)) {
+	/*
+	 * For guest_memfd-backed slots, bypass the hva lookup and validity check
+	 * since gmem does not have a userspace VMA backing it.
+	 */
+	if (kvm_slot_has_gmem(memslot)) {
+		hva = 0;
+		writable = !(memslot->flags & KVM_MEM_READONLY);
+	} else {
+		hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
+	}
+
+	if (!kvm_slot_has_gmem(memslot) &&
+	    (kvm_is_error_hva(hva) ||
+	     (trap->scause == EXC_STORE_GUEST_PAGE_FAULT && !writable))) {
 		switch (trap->scause) {
 		case EXC_LOAD_GUEST_PAGE_FAULT:
 			return kvm_riscv_vcpu_mmio_load(vcpu, run,
-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
