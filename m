Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF45C43458
	for <kvm-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 13:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hOSTt8Ov0GVG75HiICORfPBJ7DOgC8BkjA22N3yWQvM=; b=CxKuT1q1CdEYAj
	I+O30ywi6UnJ1Xjiat0o7VD0kN06U1OV4HB+u8EDiMPBUx8mIUwXko6LJcbBcjZdLDd8/exY3z5uV
	623ET7yRUzUSQX4HZrEV++HOnliftQY5VUs/7ph8/O+GFYen4Sb1vZKi2FuagHcEjz26Fn38o/cB9
	BVuvIM9immw61cfnRedIahVXRDX7irUbZBGQPJ7y7aJBy5eOFr58eBt6DIO7NkJk2aOsqsilg6azQ
	GgLtJp0iK82FvnEKU2rj6L6dIQePgK70Upi/bL7xbyquVA3wM0OY5Gz2wa3CuasnBYQFro448lllf
	XNkyYbgeDCEEk5gnKfig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoN3-00000002USu-3xbY;
	Thu, 09 Jul 2026 13:00:53 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoMy-00000002UPy-1DcL
	for kvm-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 13:00:52 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-ca7d1dc4554so535369a12.1
        for <kvm-riscv@lists.infradead.org>; Thu, 09 Jul 2026 06:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783602047; x=1784206847; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+wAaThcX990kSRtqjacNAU5n1AediKM/mHhnlqDicCA=;
        b=f9JbbQQwPIW0x2HsDp2c+j+74gom9YNgW7Om8AB1mLGWRrBIGs/guRnNM0FLUomjzs
         7D118NLWz3UEZUwIBJfu4B+AZN/KpnUTb0g0/MgQhazpYeEjNQC8QFlb79NvgJt74AH1
         f2kEdjaJRYVA6vycm1/3Z6n0yMO6fsqZC1dh7I7GNRc9Fs+MHoZBAK9dbgZtqBn0W2Hg
         83LS81RdATGxZAGcNEei28Bcje3oV3QusecG5KeaQw+PN2lZZGt7mO8h3wE2FdKGBlm5
         OXZZYmN+r8/LlR1erQ6cD+XEaeKKcqK6gX3i7sxmgCyIIxo+xnWAWBksc0Bc1/x9yAEc
         WvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602047; x=1784206847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+wAaThcX990kSRtqjacNAU5n1AediKM/mHhnlqDicCA=;
        b=Uh+0+0vtxzz82FEOolp02vo/hyQFZyS8j0Uq18L8jPyKorGFUu8r70zpWj/R6kE+8s
         hYEAGN76FgrHfbS3NiH9A+ZyqsaCFWANsw8yTN9QISy/ZRl3dEFE/Z2gaOwkRogGOp19
         b5UFDskp1yfOq3HQrCDK5qy8sHTZGNefj+OSJ5699VSd2+jbiFUr9GufTjcGiXwHULa3
         YJR3x1LynmULT1FvibfpQUBCnsLgTiHWbJK8HXzSnpgejvDlKdqh2FKbl9YfpP9TjDt/
         FDcHW3p/vH2/8ynuzpyJtYbJjvXytLWRSVkaE7PSmuA6qzmk7gh91wLuX1zsbdxdykjY
         xw4Q==
X-Forwarded-Encrypted: i=1; AHgh+RoVAvWcMrIR4WrpamarTWcjoD+6hSQsKfhHZgiuZ9nRki+UrACkgJX7QpGyO0jMLRZ32fwI+Hnq4K4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyIGDiII62bzvWgOv6szWl/ZPcbcKG70x15bgqYhRqvh35FpfcT
	PjoA/rm0l3VPjJE7j5LJxEpUiUyyJ9gRZEB58OELaG0Pb9moSK8lSmwH
X-Gm-Gg: AfdE7cmhp7qka70XEpSWdDApPeVv2IVIM1Y0HSr9QNfEFjbCpyG9YTJSzzwRxw5AZAg
	yP2rmKrz+nC7/P9fy+zXGgyQ/DE1HYdE/DNcCzZNp4Oo3ouYGx+5S3nxx/nF7r02xz7u0bSMgWn
	mGAV/VlIQO+hW8hSwR3HOE/19gNNN1wU/LuVs+N/VbDYeM8PFpQZ3jefA0nta1WO9aFMJqhmfhn
	Hve5IMYbsezUT9hs9k3heJ+4dwmPh6B/7KpqIrLA5GEGQL4WL2y4AvO0snFm0NJs+CajjazlPoi
	GO5ehCQmrCbMDdz+4DR40FKtmOMDXG+KL3lkzYCM8SrSswTTGhqpWM4hKkRCB/aMzC8fUuf6flw
	NsvmVRGkU5A/gV6rMjahVpShz+YrfR1bUMwsx+nQK6WNgrUeEQKvR1i1YMvy3gMILzOAWBgAX4Z
	HnCZ6h6S/Kcac/t8Q/0IdOOpiKEk4=
X-Received: by 2002:a05:6a00:e8b:b0:847:8b0f:2508 with SMTP id d2e1a72fcca58-84842ed229bmr6425259b3a.13.1783602047269;
        Thu, 09 Jul 2026 06:00:47 -0700 (PDT)
Received: from q-System-Product-Name ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b975a0sm8752976b3a.14.2026.07.09.06.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:00:46 -0700 (PDT)
From: "Bingyu.Xian" <shanbeeyoo@gmail.com>
To: anup@brainfault.org
Cc: atish.patra@linux.dev,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	"Bingyu.Xian" <Shanbeeyoo@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH RFC 1/1] KVM: riscv: Allow safe G-stage PMD block mappings for VM_PFNMAP
Date: Thu,  9 Jul 2026 21:00:36 +0800
Message-ID: <20260709130036.1708586-2-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709130036.1708586-1-shanbeeyoo@gmail.com>
References: <20260709130036.1708586-1-shanbeeyoo@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_060048_339683_BE10D81D 
X-CRM114-Status: GOOD (  21.71  )
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

From: "Bingyu.Xian" <Shanbeeyoo@gmail.com>

RISC-V KVM currently forces all VM_PFNMAP (device MMIO) faults to
PAGE_SIZE, preventing G-stage block mappings for VFIO-assigned device
BARs:

    if (logging || (vma->vm_flags & VM_PFNMAP))
        vma_pagesize = PAGE_SIZE;

A 256 MB VFIO BAR therefore requires 65 536 G-stage PTEs instead of
128 PMD blocks, incurring excessive G-stage faults, page-table memory
and TLB pressure.

The arm64 patch "Try stage2 block mapping for host device MMIO"
(commit 2aa53d68cee6) addressed this by deriving the host physical
address from vma->vm_pgoff.  However, vma->vm_pgoff is unreliable for
VM_PFNMAP since the VFIO unmap_mapping_range() changes discussed on the
RISC-V list in 2025 ("Remove automatic I/O mapping for VM_PFNMAP").

This patch takes a different, more conservative approach:
pfnmap_mapping_size() walks the host page tables via the existing
get_hva_mapping_size().  If the host mm itself installed a PMD leaf,
physical contiguity within that 2 MB block is already guaranteed and
KVM can safely use a G-stage PMD block.  Otherwise it falls back to
PAGE_SIZE, exactly as before.

RISC-V has a natural advantage here: the memory type is derived from
the physical address' PMA (Physical Memory Attribute), independent of
the G-stage PTE size, so promoting 4 KB -> 2 MB does not alter the
memory-type semantics.  arm64 requires extra care with the stage-2
PTE MemAttr field in this situation.

The eligibility helper fault_supports_gstage_huge_mapping() is
generalized to accept a map_size parameter (previously hardcoded to
PMD_SIZE) so it can be reused for both THP and PFNMAP checks.

The gfn alignment calculation is fixed to use vma_pagesize instead of
huge_page_mask(hstate_vma(vma)), since PFNMAP VMAs are not hugetlb.

A new tracepoint kvm_mmu_map is added to aid debugging and performance
analysis, recording GPA, HVA, HFN, mapping size and whether the fault
was a VM_PFNMAP region.

This first version is conservative:
  - Only PMD (2 MB) blocks, not PUD (1 GB)
  - dirty logging still forces PAGE_SIZE
  - falls back to PAGE_SIZE whenever contiguity/alignment cannot be
    proven

Testing: verified on QEMU (rv64, h=true, sstc=true) with a custom
kernel module that installs a PMD leaf in the host page table for a
VM_PFNMAP VMA.  Tracepoint confirms:
  - anonymous memory:   size=4KB   pfnmap=0  (control)
  - /dev/mem (4KB PTE): size=4KB   pfnmap=1  (safe fallback)
  - PMD leaf module:    size=2048KB pfnmap=1 (block mapping success)
  
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Bingyu.Xian <Shanbeeyoo@gmail.com>
Cc: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>
Cc: kvm@vger.kernel.org
Cc: kvm-riscv@lists.infradead.org
Cc: linux-riscv@lists.infradead.org
---
 arch/riscv/kvm/mmu.c   | 45 ++++++++++++++++++++++++++++++++++++------
 arch/riscv/kvm/trace.h | 29 +++++++++++++++++++++++++++
 2 files changed, 68 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 2d3def024270..53fb34d4b76d 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -16,6 +16,8 @@
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_nacl.h>
 
+#include "trace.h"
+
 static void mmu_wp_memory_region(struct kvm *kvm, int slot)
 {
 	struct kvm_memslots *slots = kvm_memslots(kvm);
@@ -286,7 +288,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 }
 
 static bool fault_supports_gstage_huge_mapping(struct kvm_memory_slot *memslot,
-					       unsigned long hva)
+					       unsigned long hva, unsigned long map_size)
 {
 	hva_t uaddr_start, uaddr_end;
 	gpa_t gpa_start;
@@ -321,7 +323,7 @@ static bool fault_supports_gstage_huge_mapping(struct kvm_memory_slot *memslot,
 	 *   e -> g
 	 *   f -> h
 	 */
-	if ((gpa_start & (PMD_SIZE - 1)) != (uaddr_start & (PMD_SIZE - 1)))
+	if ((gpa_start & (map_size - 1)) != (uaddr_start & (map_size - 1)))
 		return false;
 
 	/*
@@ -336,7 +338,7 @@ static bool fault_supports_gstage_huge_mapping(struct kvm_memory_slot *memslot,
 	 * userspace_addr or the base_gfn, as both are equally aligned (per
 	 * the check above) and equally sized.
 	 */
-	return (hva >= ALIGN(uaddr_start, PMD_SIZE)) && (hva < ALIGN_DOWN(uaddr_end, PMD_SIZE));
+	return (hva >= ALIGN(uaddr_start, map_size)) && (hva < ALIGN_DOWN(uaddr_end, map_size));
 }
 
 static int get_hva_mapping_size(struct kvm *kvm,
@@ -404,7 +406,7 @@ static unsigned long transparent_hugepage_adjust(struct kvm *kvm,
 	 * sure that the HVA and GPA are sufficiently aligned and that the
 	 * block map is contained within the memslot.
 	 */
-	if (fault_supports_gstage_huge_mapping(memslot, hva)) {
+	if (fault_supports_gstage_huge_mapping(memslot, hva, PMD_SIZE)) {
 		int sz;
 
 		sz = get_hva_mapping_size(kvm, hva);
@@ -421,6 +423,31 @@ static unsigned long transparent_hugepage_adjust(struct kvm *kvm,
 	return PAGE_SIZE;
 }
 
+/*
+ * Determine the G-stage mapping size for a VM_PFNMAP (e.g. host device
+ * MMIO) fault.  Unlike arm64's original implementation, we never derive the
+ * host physical address from vma->vm_pgoff (which is unreliable since the
+ * VFIO unmap_mapping_range() changes).  Instead we walk the host page tables
+ * via get_hva_mapping_size(): if the host itself installed a leaf block for
+ * this address, physical contiguity within that block is already guaranteed
+ * by the host mm.  The memory type stays correct because RISC-V derives it
+ * from the physical address' PMA, independent of the G-stage PTE size.
+ *
+ * Be conservative for now and only promote to PMD-sized blocks; PUD-sized
+ * device blocks are left as future work.  Fall back to PAGE_SIZE whenever
+ * contiguity or HVA/GPA alignment cannot be proven.
+ */
+static unsigned long pfnmap_mapping_size(struct kvm *kvm,
+					 struct kvm_memory_slot *memslot,
+					 unsigned long hva)
+{
+	if (get_hva_mapping_size(kvm, hva) >= PMD_SIZE &&
+	    fault_supports_gstage_huge_mapping(memslot, hva, PMD_SIZE))
+		return PMD_SIZE;
+
+	return PAGE_SIZE;
+}
+
 int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 		      gpa_t gpa, unsigned long hva, bool is_write,
 		      struct kvm_gstage_mapping *out_map)
@@ -465,11 +492,14 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	else
 		vma_pageshift = PAGE_SHIFT;
 	vma_pagesize = 1ULL << vma_pageshift;
-	if (logging || (vma->vm_flags & VM_PFNMAP))
+
+	if (logging)
 		vma_pagesize = PAGE_SIZE;
+	else if (vma->vm_flags & VM_PFNMAP)
+		vma_pagesize = pfnmap_mapping_size(kvm, memslot, hva);
 
 	if (vma_pagesize == PMD_SIZE || vma_pagesize == PUD_SIZE)
-		gfn = (gpa & huge_page_mask(hstate_vma(vma))) >> PAGE_SHIFT;
+		gfn = (gpa & ~(vma_pagesize - 1)) >> PAGE_SHIFT;
 
 	/*
 	 * Read mmu_invalidate_seq so that KVM can detect if the results of
@@ -515,6 +545,9 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	if (!logging && (vma_pagesize == PAGE_SIZE))
 		vma_pagesize = transparent_hugepage_adjust(kvm, memslot, hva, &hfn, &gpa);
 
+	trace_kvm_mmu_map(gpa, hva, hfn, vma_pagesize,
+			  !!(vma->vm_flags & VM_PFNMAP));
+
 	if (writable) {
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
 		ret = kvm_riscv_gstage_map_page(&gstage, pcache, gpa, hfn << PAGE_SHIFT,
diff --git a/arch/riscv/kvm/trace.h b/arch/riscv/kvm/trace.h
index 3d54175d805c..db2d28f1d714 100644
--- a/arch/riscv/kvm/trace.h
+++ b/arch/riscv/kvm/trace.h
@@ -56,6 +56,35 @@ TRACE_EVENT(kvm_exit,
 		__entry->htinst)
 );
 
+TRACE_EVENT(kvm_mmu_map,
+	TP_PROTO(unsigned long gpa, unsigned long hva, unsigned long hfn,
+		 unsigned long map_size, bool is_pfnmap),
+	TP_ARGS(gpa, hva, hfn, map_size, is_pfnmap),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, gpa)
+		__field(unsigned long, hva)
+		__field(unsigned long, hfn)
+		__field(unsigned long, map_size)
+		__field(bool, is_pfnmap)
+	),
+
+	TP_fast_assign(
+		__entry->gpa		= gpa;
+		__entry->hva		= hva;
+		__entry->hfn		= hfn;
+		__entry->map_size	= map_size;
+		__entry->is_pfnmap	= is_pfnmap;
+	),
+
+	TP_printk("GPA:0x%lx, HVA:0x%lx, HFN:0x%lx, size:%luKB, pfnmap:%d",
+		__entry->gpa,
+		__entry->hva,
+		__entry->hfn,
+		__entry->map_size >> 10,
+		__entry->is_pfnmap)
+);
+
 #endif /* _TRACE_RSICV_KVM_H */
 
 #undef TRACE_INCLUDE_PATH
-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
