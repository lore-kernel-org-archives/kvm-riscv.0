Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284C4C43458
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 07:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kyssywciF7glJ2LoUZopnj26Je9ovnHRrxw39zVxqP8=; b=xYqveuFcx2PN3Q
	GeJRU9lL+FIGhzphxjVm2gJG55rAU/Ire+EXc3fe+o6OanSd9oM5vzomThuAWRzaq+azj6r1O534w
	Q86z9ueHmpaVXRmTbV5+2pPp5ug/L4v/NjsIVRTtoUpTxNnGaHt6rxHmng+x0u81Uofzq8DTTyOkP
	P6xccoQ7DtG4JQC8jQ9cXv7a3nNksmUne1xkXD3gWvVxq0lwrscbBxefQU11guBXhXuwQTsDPrKyL
	C8VXHqPjou7+AQS9LXd8NkjGptQxyDPATbINqHzGbzjGG0w3heElIDzogM44eah+AlfdkzkHUp+LM
	iUsDsgp0k2HR6rLi+OPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAz1-00000008Nsn-2iKN;
	Mon, 13 Jul 2026 07:21:43 +0000
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAyz-00000008Nrd-3d32
	for kvm-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 07:21:43 +0000
Received: by mail-pj2-x04.google.com with SMTP id d9443c01a7336-2cabe9335f1so17232805ad.0
        for <kvm-riscv@lists.infradead.org>; Mon, 13 Jul 2026 00:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783927300; x=1784532100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uoXDjnnGnfjdjZLeKSIkqLVfLmi5f0feB1W9q0yXDSk=;
        b=UNTjNPlrGzHu9O5cxHxdYk8k8tJ8eqpjBs9Ts3luSrZ2jD4PizdUax8S4LfsSlVdHA
         7JvUm7lMkwYW3pKRWxV/PsRA+drFn/iJl9TVnuFEtXO6aKV86+ql8WFWqqQof/SW/TmA
         GDgdE3QdshQkrQXC7p34/G1uwCE2huR7OPFC+QszKz+azSLtDSz9YhG648+L0GXIaSZG
         ed+V3phRArqkcha2kGW8rf22iTt0xlYmMqSUTjI/T90EjXhRewZcpc17ZMOIV8XY1KfT
         EPWnOjmOKA+zDnbhkAec3lKXM9PCGaz4pncnUdDqXdU99ZLZFFHsADUdMYzqxl1vMDBY
         ON+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927300; x=1784532100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uoXDjnnGnfjdjZLeKSIkqLVfLmi5f0feB1W9q0yXDSk=;
        b=Opds6L1KoIOJ0ffdMEYe2Jce94oMHHymNn9WFS3MSGMUksdQ3X9jqectLRmyl7P8Hv
         oTkqj5FAr37o+vCxtnuIdKRmvRjry4fZbVs6XL9qAfZWQaq8kJiABRjv8ErX63tMi1DD
         q2c1iTEELj+Of7LvpJkc303WLdfX0rhS+a3bHfl6XU8/ICjAitPP2ZlQeRZNoTZepF1e
         tWeOro3J9qha1suuwmzmWvVka/jJtcr/PgdnLv4LZ+cmaUY7mPynbVKdNOYzbYTygOcI
         J0KrLFZ9r2mvkro3iu+3pAk6XS7L5IQ2gd/NZ8XPUdVcW7dce9FvOeEpwKv7BleCs+15
         SdVA==
X-Forwarded-Encrypted: i=1; AHgh+RpFjDmz+YrDg0soQ5J0vvujEHZAL9vwXSxC1lOp8b0HZI5gc4wNjZqpigoOaAXO0nXHGys9UHS5wio=@lists.infradead.org
X-Gm-Message-State: AOJu0YzqF5KpoG4KrBqh6qFLvm3i6/QKs0rKTQRrPRGtPyXGP9UBcxb6
	jxSXQRSylJYjTZrOdXE/nTWcMfb8ARrmYvhl070FgyI28FOK6PQyMZ2l
X-Gm-Gg: AfdE7cmKwqrqKAGGTdNEa1hfhsR6bwx9CQArIL/76242zHA6TgwmlZbXMtC3eN1lLkG
	MM0DrU1gTVteMX+F8W/KXdoLQPnrHrnZuL4fQzM78SEZKNOLX5SWK/9lzTAly34ogbj5PpPBBcc
	0XBpu+XEAmuM5oBnnbN/HsVEixXiCvwEDTK/kdJfkRyEtI7PFuuANw+373fuePVkJhj4hn9gZwe
	j0I7RvO/KcpNNv1GYSSIH3kXxwXFLjvldr33Facx6YpES0189BGVBryu8Og5L7axvWWsJ0Or7wP
	gsUwDymHNmKCTJYMlLtJRTlNr3tir6mNvWH6FsCkbyDSlO50c179OQstbV7Td9nLAmOycZ8BExe
	DfozLCZnkZh1IcHD3p/FO5RFEFTzaj1VzOeykyOl22EpA4FIla+o1WCHnOJRCRz/XWt7dGK8qGT
	1uYWq+cxrUuj+O/Mgr1jh72WMkGMXbQ+X3/ezXDA==
X-Received: by 2002:a17:902:fc45:b0:2ca:e08e:9e70 with SMTP id d9443c01a7336-2ce9f18381dmr80811085ad.46.1783927300494;
        Mon, 13 Jul 2026 00:21:40 -0700 (PDT)
Received: from q-System-Product-Name ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb7e9sm97547295ad.10.2026.07.13.00.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:21:40 -0700 (PDT)
From: "Bingyu.Xian" <shanbeeyoo@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC v3] KVM: riscv: Allow G-stage PMD block mappings for VM_PFNMAP
Date: Mon, 13 Jul 2026 15:21:23 +0800
Message-ID: <20260713072123.1591097-1-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_002141_917183_3F1CC1A1 
X-CRM114-Status: GOOD (  19.80  )
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

RISC-V KVM currently forces all VM_PFNMAP faults to PAGE_SIZE, so a
256 MB VFIO BAR requires 65 536 G-stage PTEs instead of 128 PMD blocks.
This becomes critical as RISC-V targets server workloads with GPU/NPU
VFIO passthrough and the RISC-V IOMMU nears mainstream support.

Adapt arm64's "stage-2 block mapping for host device MMIO" idea from
commit 2aa53d68cee6 ("KVM: arm64: Try stage2 block mapping for host
device MMIO"), but with a safer approach: instead of deriving the host
physical address from vma->vm_pgoff (unreliable since the VFIO
unmap_mapping_range() changes), pfnmap_mapping_size() walks the host page
tables via get_hva_mapping_size().  If the host mm installed a PMD leaf,
physical contiguity is guaranteed and KVM uses a 2 MB G-stage block;
otherwise it falls back to 4 KB as before.

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

Assisted-by: YuanSheng:deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Bingyu.Xian <shanbeeyoo@gmail.com>
---
Changes from v2:
- https://lore.kernel.org/kvm-riscv/20260710051903.3454598-1-shanbeeyoo@gmail.com/
- Correct the author and Signed-off-by identity to:
  Bingyu.Xian <shanbeeyoo@gmail.com>
- Use the canonical commit-reference and Assisted-by formats.
- No code changes.

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
