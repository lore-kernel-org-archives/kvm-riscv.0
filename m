Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B787DC43458
	for <kvm-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 05:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1b1sKyPZFS58INXC+l+QwuQIzqdLRSr8m7FqFzNgvbo=; b=PER/b6MO3/gA3D
	S2+AE9dsqgGFU0chJ6t8zQAj0ROa95kCmHMqhGh9ruKW9k+oEmPmEU/QWBwhbhQ5BEzl6lyTm3hGU
	FTaFSipeXWnvkV1CODz1Wm0COYctirIT0CsVW+cOxgc2RDLF+FuYZpEdlmlEsP0wR6cYqAjIZJqZc
	VW+ORQK7dqTwvJxc/KALLeYC9qW6tMaZxnirFc5w50nLmRGpXWQB0tzWvJj8CQsxJNWZH5YZw42jn
	oa0qG4A8NeJz7vlli9GXI+6lUWe9fQnGbDRNv8N1JreXsvU6SmxZ521W37E5EgFS7Ep4Cas0RC4Oz
	dJW4hMzKUxnBsWq4FFFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3ds-00000004BcB-42XZ;
	Fri, 10 Jul 2026 05:19:16 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3dp-00000004BbN-2KLB
	for kvm-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 05:19:14 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-c9fe62e0da3so190361a12.1
        for <kvm-riscv@lists.infradead.org>; Thu, 09 Jul 2026 22:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660753; x=1784265553; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eaT2VzoKRrCEsQJsGJsh7iwXPoQA/5ukSwz33vQMgQA=;
        b=i6C4LMoeIkSz58hgBpuD8mCDqj9I420sEfnsh4UQnhLz6G+DBUaH6B/R6neLx3+Uh9
         1v/J1weY0HoyKFfR5LXHBOwW/66XOTSkuBZz7v/5P33p3Xwz2KU/LCv4wl5xiOthNps8
         0V7CzeQuEEgjbo7IMe5kD/TZGJK/Ln7NWMmI4J+ulVRNRqk9fbWJDRGNsF+79AE3n0IM
         7dAMHb3MdhyEwDFDTrDujPdOft1HsSqwvKty6/n9Jt+UEBZxq/StkLlZw0u+thljdmGB
         kxha+GUmlScVJkoTLbHmvifpk31JWXRUIZIFrcdpS2J7taxdu5l3LNSCRzvCZ+EJq/rQ
         BomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660753; x=1784265553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eaT2VzoKRrCEsQJsGJsh7iwXPoQA/5ukSwz33vQMgQA=;
        b=f5YptA/sgYc4Gz8NPaT3y8ck6emyPXyNFr921fORmUXv1vHuD3aD172vGeW6fT2cXk
         miq/Un3bxSo6r0zUcIm9B0+pnd/fILP1sH2osoueYO5uhzGDzOpwrS41d9FQ+J4NW6Go
         DQB6LDulmBW/fUeanNfsPdD9PjPNYAHy916eRqTZK3PVzqubnlvx/5BSt6Vj02bOeZwK
         mugPVP29xP6i2kSnhLrHkCYMw4DKcHoQbtXk7mNWTedrzq/jTVoA7OWqSD12xUw1X7AR
         LE9PYWOKQ0aFmPXqEoAGe0TrO+5AzgjfTjcJ+S0ZWky5dblw/8SS1uPphzMH1zkrBCPJ
         3Egg==
X-Forwarded-Encrypted: i=1; AHgh+Ro0a7AX6fV/UujL0xqfZZxQIQiO0PAZoA+obTChfRCz0HcHnmPy+5IaKhYdq4b4eVPL8PXr4Khi414=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm600C8ht2u0TERYuiOmjWokBHjHx+IXemFj0lzDAMNFV5bKij
	BbbPbVHCgKq6Ps71f6TZ4c7IBMntHXefA7fXibMajcj+mGtRKx0tDzI/
X-Gm-Gg: AfdE7cnBVLaZzmy6wRVyIjo58N51ndIVpNRw2DdQokblmYyhoglMwpfx7Lm0D4w804s
	365bjEtf1H7cgXjJCi4QFzj/HSq1dcLh21gfJzMlIgd0VV+moirTOhbfYcVFqNdWcDftPxt1m2z
	qF5+oXUaEEs75VSTTlzflG3BO2AlUpnXecga8EUbyF8QaKT6Q5jCshIuZfdudD3hmTaeAWa5Mhx
	FSTLiRSguWtxH6Uz4X8bZr+awKl/U6cmgQpvy5VD68BsLigWS2Qoc+ZJxndAbhchtIK2aKZWb2l
	CPyyU7LhsxqGNcz6+9xPd9QNaLbhCscI+zUld/M1b00F9VirLCVplZGnYsuh7M2En42MD+57S8r
	Y08eWl4ue+Ukh/3xQPHk2j8TzkN+VbTcMHf19NJU/zL9i56XLVOrawIZzKLRIrcEAEDnZAQsgli
	TzQgdDiMl1GLrnvQKq9F7dwr7R16QdbMLcTHzyXQ==
X-Received: by 2002:a05:6a00:451a:b0:842:6a3b:60d1 with SMTP id d2e1a72fcca58-84842f01e28mr10330536b3a.31.1783660752671;
        Thu, 09 Jul 2026 22:19:12 -0700 (PDT)
Received: from q-System-Product-Name ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8483dc66f2asm3970019b3a.24.2026.07.09.22.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:19:12 -0700 (PDT)
From: "Bingyu.Xian" <shanbeeyoo@gmail.com>
To: anup@brainfault.org
Cc: atish.patra@linux.dev,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	"Bingyu.Xian" <Shanbeeyoo@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	"bingyu.xian" <shanbeenyoo@gmail.com>
Subject: [PATCH RFC v2] KVM: riscv: Allow G-stage PMD block mappings for VM_PFNMAP
Date: Fri, 10 Jul 2026 13:19:03 +0800
Message-ID: <20260710051903.3454598-1-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_221913_604131_E9B8254B 
X-CRM114-Status: GOOD (  19.69  )
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

RISC-V KVM currently forces all VM_PFNMAP faults to PAGE_SIZE, so a
256 MB VFIO BAR requires 65 536 G-stage PTEs instead of 128 PMD blocks.
This becomes critical as RISC-V targets server workloads with GPU/NPU
VFIO passthrough and the RISC-V IOMMU nears mainstream support.

Adapt arm64's "stage-2 block mapping for host device MMIO" idea
(commit 2aa53d68cee6) but with a safer approach: instead of deriving
the host physical address from vma->vm_pgoff (unreliable since the
VFIO unmap_mapping_range() changes), pfnmap_mapping_size() walks the
host page tables via get_hva_mapping_size().  If the host mm installed
a PMD leaf, physical contiguity is guaranteed and KVM uses a 2 MB
G-stage block; otherwise it falls back to 4 KB as before.

RISC-V has an advantage here: memory type comes from the physical
address PMA, not the G-stage PTE attributes, so 4 KB -> 2 MB promotion
does not alter memory-type semantics.

Also generalize fault_supports_gstage_huge_mapping() to accept a
map_size parameter, fix gfn alignment to use vma_pagesize instead of
huge_page_mask(hstate_vma(vma)) since PFNMAP VMAs are not hugetlb, and
add a kvm_mmu_map tracepoint for debugging.

Conservative for now: only PMD (2 MB), not PUD (1 GB); dirty logging
still forces PAGE_SIZE; falls back whenever contiguity/alignment
cannot be proven.

Tested on QEMU (rv64) with a custom module that installs a PMD leaf
for a VM_PFNMAP VMA: tracepoint confirms 4 KB fallback when host has
no PMD leaf, and 2 MB block mapping when host does.

Changed from v1:
- https://lore.kernel.org/kvm/20260709153000.1-1-shanbeenyoo@gmail.com/
1. Drop the cover letter, merge into a single patch
2. Simplify the commit message to focus on functionality
3. Add Co-developed-by and Assisted-by tags
4. Fix the sign-off chain order

Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: bingyu.xian <shanbeenyoo@gmail.com>
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
