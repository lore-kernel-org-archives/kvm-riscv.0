Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6757CC6B2A
	for <kvm-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 03:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9g7CtOEcbbvzLbLrqW1tCJK8gTV1csbye6zVWqZajrA=; b=CNWulF0ETngX58
	8SA+tm7sYdCcRwZlHo2oVNZAC3gH5NQVfwHzs/zLeCVB50WWf31QrJMo2bxHY7wPoHVjpPxvEL0d5
	H6xXnyPFitMTIpnwB0WUhDFngv6MbTzechAG2NeV9TYBdPKnWZ8OCLdH1wUBjORkudyQP6mV6r5kO
	TfnmqSpZdnmxJaBuB0OWCZDVbUkE1YkA6sCMcg2m5P3MN1Hxf+6xBH1yPNXgSdIq6TTQbsLHLu0EB
	Odf6kxHeevRdFw5S6RxuinnevQQTUfXNepsvapIZXGS0xE5VMrFy8Hv8gI8I4SWNpyS1NGhRZtNFc
	JQkj3TMOwPka+2O1go8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHunq-00000004Mpg-45dI;
	Sat, 17 Oct 2026 03:09:46 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHuno-00000004Mox-2M9O
	for kvm-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 03:09:46 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso230384a12.0
        for <kvm-riscv@lists.infradead.org>; Fri, 16 Oct 2026 20:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792206583; x=1792811383; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=enK3RSWvXdgqwIVRPBvjJmOYoe9F1G7CwzrwYjBwBdA=;
        b=Xkg1dCTnj3rKYH1pG2Z0zej9DKUgA09SRlaNWLMNY5NCvTp1oLkcXdUlP7BWMnUjTq
         CG9SO2YqxcWJHs6OSsaYnbburOWEKevDXDWOxkKEWsKSfOMT0AnFtH9WDyj/KXQKxEbl
         fzzxg3huQkRyVXmhyQ6cpGLcCAe5tLEeFg7fBDUUuKKxaF3OiERErm8FXkuQARQBcEwX
         84lc/qtyycQG6jkWXTak+bV7GDHOg9ueO9LtfyLDx7vLaxB9Lzr9S4oaJt+4hVsx8hor
         mZde3Tuw+6ezd0xZgYOr15Cg64N1083nWQ+VtDK+e2HwbzpTpo7Zvj7nnXF0Hzx5/fiY
         +01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792206583; x=1792811383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=enK3RSWvXdgqwIVRPBvjJmOYoe9F1G7CwzrwYjBwBdA=;
        b=nXeHTZ68SiuvVVl/crqmJXxMKQOzNwCPaZoyMvuKRJaGmdiBJqjtioxOhKwtfv6nVE
         QkqgRTKq1ptDPUsMf3fLxZD8Ku74M1BUo2G0yqTZP2A+FHjZ+rznNDd6CfGOWdz0HtPH
         s69EM3CJzPpGUZqXzbiobDjPiFN3OLBpkUPmKBDYdeoKU12DGdCWZgNXY9GXSvMtzvOi
         NAIRDIMFipajXE0PBMl8D/iw4iBIZcimY4D1Ily9tU4p/v+GzxQHORdmIVQ+1wTf/zNP
         ACd1pNwPK/EXub7s+UcEuWrhVGFHHVq7ZhpzCOyp+GfD9kVqhNnPfpGTf6L+fU+tNs+K
         HZXg==
X-Forwarded-Encrypted: i=1; AKwUvBwtZLB+rvQM6tOVh2GZh9fF0Q7gBSIZkFr53auTTykxD4LwuEXtanD0P6a6Rtb9UlMjXNnZrkcD5zs=@lists.infradead.org
X-Gm-Message-State: AFq9FYIsczDCQ1t6Do0pd1nQ4YbXJIc9QnbQh9qyfoLCO2c1mAB3BB8v
	Yql8BNW/XKjSUQiuCpRU6YA7vG1j4yF5qDiOv2tPp+fZ52LOlw8kom9i
X-Gm-Gg: AYBFou1CdCjVxvKgwNGsdcFuwGYXpCEaoWhIwDwR9kEdGoh7mofC9LOodmSVrQPVd4k
	I/BAoYkc85vgLY4hFPsc+FF24QMjvLAxAIUn4zcnaCtntIb9rvRj/sw/xuhTophub3PzGsTHMsj
	ju1FJqI0EMFL4VkCkXEkmBjnFI1hXmEv06W67uyJMWPORswJseV4br2fY94G5CRWfEVaY82NpZc
	4Kz/uc0AT5PRvUrDGlkmPz7jLdDamvqFH9Do3sMgMXoo/Ek9Hml8e+kfjF9UAG2dPWM56lXLjtU
	xzpR90Cd0axhCXbp5FhKhRa1MxOj9YuY75kdequ9cfjeUKtakVogyIhr6wuq4Da0Q+trH2gnGEe
	8scVQzG57hATmOqRjCPykvhfdPX5Q6pnduvHJC/U4XJDXmlHZDR5pxJ8b7/NilK95C4BM0Ly8u1
	TpPJ7JNaaBD7+vH1/8Yk+JFDK5sTgAVyONPXwAIkWJTXt9tLlci6afpuLABo0EXiSg5dRidj7ow
	yByVHd7i8xf9l8FMtXLXRTWkpJ40iR78Q==
X-Received: by 2002:a17:90b:5803:b0:3ab:9c73:12e with SMTP id 98e67ed59e1d1-3acee29303bmr1411650a91.6.1792206583320;
        Fri, 16 Oct 2026 20:09:43 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549b6171sm1795406a12.14.2026.10.16.20.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 20:09:42 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: anup@brainfault.org,
	atish.patra@linux.dev
Cc: tjytimi@163.com,
	inochiama@gmail.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@linux.dev,
	pbonzini@redhat.com,
	seanjc@google.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	SeungJu Cheon <suunj1331@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] KVM: riscv: Only fast-path dirty-log write faults on host-writable leaves
Date: Sat, 17 Oct 2026 12:09:26 +0900
Message-ID: <20261017030927.345454-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_200944_632598_7551C82B 
X-CRM114-Status: GOOD (  16.67  )
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

The dirty-log write fault fast path sets _PAGE_WRITE without checking
whether the backing page is host-writable. A read fault can install
a read-only mapping to the shared zero page. A subsequent guest write
then takes the fast path and writes into the zero page instead of
going through the slow path to break CoW.

Use RSW bit 9 to record host writability before dirty logging forces
the mapping read-only. Preserve this bit across write-protection and
fall back to the slow path when it is clear.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-174168@kernel.org/
Fixes: 7705be59eb2d ("KVM: riscv: Fast-path dirty logging write faults")
Cc: stable@vger.kernel.org # 7.2+
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
Testing:

1. HiFive Premier P550

   A selftest makes the guest read an untouched page, then write to
   it with dirty logging enabled. Before the fix, the write corrupts
   the host zero page. After the fix, CoW allocates a private page
   and the zero page stays zero.

   dirty_log_perf_test -v 3 -b 256M -i 3 shows no noticeable
   regression (14-21s per iteration before and after).

2. QEMU (-cpu rv64,h=true)

   The same selftest reproduces the zero-page corruption before the
   fix and passes after it.

This patch applies on top of the Accessed-bit fix [1].

[1] https://lore.kernel.org/all/20261016101458.221648-1-suunj1331@gmail.com/

 arch/riscv/include/asm/kvm_gstage.h |  5 ++++-
 arch/riscv/kvm/gstage.c             |  5 ++++-
 arch/riscv/kvm/mmu.c                | 15 +++++++++++++--
 3 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
index aaf080ba1b77..0d19ad6d7dfe 100644
--- a/arch/riscv/include/asm/kvm_gstage.h
+++ b/arch/riscv/include/asm/kvm_gstage.h
@@ -35,6 +35,9 @@ extern unsigned long kvm_riscv_gstage_max_pgd_levels;
 #define kvm_riscv_gstage_pgd_xbits	2
 #define kvm_riscv_gstage_pgd_size	(1UL << (HGATP_PAGE_SHIFT + kvm_riscv_gstage_pgd_xbits))
 
+/* RSW bit 9: the host mapping behind this leaf is writable. */
+#define KVM_GSTAGE_PTE_HOST_WRITABLE	BIT(9)
+
 static inline unsigned long kvm_riscv_gstage_gpa_bits(unsigned long pgd_levels)
 {
 	return (HGATP_PAGE_SHIFT +
@@ -61,7 +64,7 @@ bool kvm_riscv_gstage_try_update_pte(struct kvm_gstage *gstage, u32 level,
 int kvm_riscv_gstage_map_page(struct kvm_gstage *gstage,
 			      struct kvm_mmu_memory_cache *pcache,
 			      gpa_t gpa, phys_addr_t hpa, unsigned long page_size,
-			      bool page_rdonly, bool page_exec,
+			      bool page_rdonly, bool page_exec, bool host_writable,
 			      struct kvm_gstage_mapping *out_map);
 
 bool kvm_riscv_gstage_split_huge(struct kvm_gstage *gstage,
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index be70607a33ea..d9bfd0c6d5fd 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -207,7 +207,7 @@ static void kvm_riscv_gstage_update_pte_prot(struct kvm_gstage *gstage, u32 leve
 int kvm_riscv_gstage_map_page(struct kvm_gstage *gstage,
 			      struct kvm_mmu_memory_cache *pcache,
 			      gpa_t gpa, phys_addr_t hpa, unsigned long page_size,
-			      bool page_rdonly, bool page_exec,
+			      bool page_rdonly, bool page_exec, bool host_writable,
 			      struct kvm_gstage_mapping *out_map)
 {
 	bool found_leaf;
@@ -246,6 +246,9 @@ int kvm_riscv_gstage_map_page(struct kvm_gstage *gstage,
 			prot = PAGE_WRITE;
 	}
 
+	if (host_writable)
+		prot = __pgprot(pgprot_val(prot) | KVM_GSTAGE_PTE_HOST_WRITABLE);
+
 	found_leaf = kvm_riscv_gstage_get_leaf(gstage, gpa, &ptep, &ptep_level);
 	if (found_leaf) {
 		/*
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 042d1e3b3547..196cde6c40cd 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -586,6 +586,12 @@ static bool kvm_riscv_mmu_dirty_log_write_fault_fast(struct kvm *kvm,
 			break;
 		}
 
+		/* Let the slow path handle host-side write protection and CoW. */
+		if (!(pte_val(old_pte) & KVM_GSTAGE_PTE_HOST_WRITABLE)) {
+			ret = false;
+			break;
+		}
+
 		if (!dirty_marked) {
 			mark_page_dirty_in_slot(kvm, memslot, gfn);
 			dirty_marked = true;
@@ -630,6 +636,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	bool is_hugetlb;
 	bool unused = false;
 	bool writable;
+	bool host_writable;
 	unsigned int vma_pageshift;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
 	struct vm_area_struct *vma;
@@ -714,6 +721,8 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	if (is_error_noslot_pfn(hfn))
 		return -EFAULT;
 
+	host_writable = writable;
+
 	/*
 	 * If logging is active then we allow writable pages only
 	 * for write faults.
@@ -739,10 +748,12 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	if (writable) {
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
 		ret = kvm_riscv_gstage_map_page(&gstage, pcache, gpa, hfn << PAGE_SHIFT,
-						vma_pagesize, false, true, out_map);
+						vma_pagesize, false, true, host_writable,
+						out_map);
 	} else {
 		ret = kvm_riscv_gstage_map_page(&gstage, pcache, gpa, hfn << PAGE_SHIFT,
-						vma_pagesize, true, true, out_map);
+						vma_pagesize, true, true, host_writable,
+						out_map);
 	}
 
 	if (ret)
-- 
2.52.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
