Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D313E606EE83
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 14:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cvv8gINg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OzcD3iuV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=G5RdD/djeDGPE1Nzbrkd8XKJb0EVF+BJVj4PFbUmM/Y=; b=cvv8gINgrSaYV3aLXhmYm95fsS
	i0sklgTdMKWbTORioJi57EfmVuvpmWhKa/FqPn+W1Wv0RREYENu11OIrRNXeu0y3wx7xrIfrbm5hc
	/x93JJBI+m06+YD+hGhQ1Xm1DqnWyS2++MbhUZnRoXfbu3k/lPwBGAw+GcXTt8NAXKhPPtWDoqFAR
	U3JfpeyJRkMpqHZ5D49zZO0+ug6sVGab0yoZVUIDrQrJCpwq4fZq7qdg5+tUIVFGmZe/Ge4VkRTKs
	OKly8BkubwCqchhzszosm/um6j/ie7D3RnYAa2xUyNKCqmjys41A4GSXKE8l0QT8gERlsL9ku5Yl0
	TDBVFaRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKXK-0000000Cala-28jR;
	Fri, 06 Nov 2026 14:03:22 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKXG-0000000CahR-34Kx
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 14:03:21 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-36f6295304dso654518eec.1
        for <kvm-riscv@lists.infradead.org>; Fri, 06 Nov 2026 06:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793973798; x=1794578598; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=55So9WQ/WyrADhzVx1hdq8ywmTf+r85oSbdNInvKBS8=;
        b=OzcD3iuVhYA9zhHAtr/8HyNHG8SCJz7ij0aNZRYELsi0lsqzNVMPzegxBcbCOwnJvs
         /IvcnOnDXB37Vku6nTuhgCec1ruysJRdw22b1t9ylB/b37IGIJ6oS2ESWb1U9vFoazmE
         KrFw6tayUbR2kPXAfff0zEhB/Zbn5HdIK90y5KTNU9Z0c9siQjdMyl66krCSk0fbl1Ek
         Z0VoE5S2PIGwEwDjwsLWhDHL+wOyhFz+9rjyaiAUUt0VySiy1hQiibvzTCBZIZXz1PqX
         g+kO3Ca957LWBf7Pp1I5ukSMLHGpFDSDyiFSuUvHrLHJZFefuRA7o/8u5kEoG4R+uQh9
         MINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973798; x=1794578598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=55So9WQ/WyrADhzVx1hdq8ywmTf+r85oSbdNInvKBS8=;
        b=d2460Pzdo8XUq5kwfvufCR8p02IU2viyQKoKAITMw6Qb9uDhEfGLHzik3uQCZK7HLH
         svcy3wwWGFp37cPB6uQCcgUx+TulWjsuzzr2hREMYQPn97H6aBL6mr6Gv1UVwC1lbOH9
         w6SVjUacz5TAA6Ki2EFUh8S3Q9HDYQH9UDJO5tGHG36ATPjQbC4qP86or7GKRPCu8xGW
         cVKnJ93bjHjv4j+PMAPnJGqRbrC8ylRciu36oSUu9h16s7wzmBeExVioP7jvlKTl8+o8
         c2XL6Vxn3+MHDMm4viUiEv+FFHlXBTWiMuC3oV539WmPKGM1+VigA4fGGxH/OR0MX8Dc
         mAVw==
X-Forwarded-Encrypted: i=1; AL+hErFKJo8WrllpOqLQV9a50TmYHD6SrOEmuZH6iVesghC4tk1jQ0ODyEza+snj/C1mufNcU25UQSEm6J8=@lists.infradead.org
X-Gm-Message-State: APuU4Z8IhZ60TslzFeiMFB4Smxs+s+GRVPH8aIfxJNkAMHu0RUQWjAMO
	4XseT4RdEklU7AxFH7MYsoM1GlhiJY2mJr5FRQMgOqHR13Wev9qfD4MK
X-Gm-Gg: AYBFou3iWls6cZ+9ryW02WML2zOpq8zvhYEqW6YBJI5NsHrPDsnHvvVAQh6cASr9VlA
	WMgqSvIkTEnOH4K6fTPjD4CXdUKfXGIRpYKdpph8TTLjw1Tog/1tmZytEgmpUV4RMWOoi78nkP+
	FHzNoFgX3dMjyVFq+k43QPwWs7kacLpkRE3wG6LP9I76PLUx4Wx4WHWoNu6ykQH+5ejWiwb2rwd
	6bTIKzqk3l6boFCz7sEq9ZZJSoZ1nPyOyDP6AnBl6uXjBRVLj7JcnEJyfMSE+Tse4pZcQ/wZxhs
	sud9ilX6fSGZHKGDXlE/yUyQiwpLKMmAEIcmePCR4e0lN4lSbWHSSpi53dJf7pDvUmqlZ0Jq7Vv
	Tr1JxspQprDgJdRYq4um7/9iNEJdX2qXXyibShwiUd/DadAaXE3PPtLd5wRx4wMwv+pNX46vPaJ
	Qkr7SbM5OqKV8SksMNLG1m7x9oPEPcbwEOh7/kdQaIgU2bkehxLF+69CQztv4GmKI1jl4YvkEIB
	vl1PqvkhkTDsq8R8vTAQvcZ+ndIOmjGHfABxIPoz17JAC2V0pEUTBM6TSno1PNDKe0O2rgwKVMK
	ax3q6FuQ7EypKfR0Y0XXRdqd9h3rMbLn/P6vg0hwNnpfcHkzP6wD
X-Received: by 2002:a05:7301:1887:b0:361:6884:78b1 with SMTP id 5a478bee46e88-36f7671a78cmr3700143eec.28.1793973792971;
        Fri, 06 Nov 2026 06:03:12 -0800 (PST)
Received: from fedora ([124.51.157.51])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b4680sm7004358eec.20.2026.11.06.06.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:03:12 -0800 (PST)
From: SeungJu Cheon <suunj1331@gmail.com>
To: anup@brainfault.org,
	atish.patra@linux.dev
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	jinyu.tang@linux.dev,
	inochiama@gmail.com,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	SeungJu Cheon <suunj1331@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v2] KVM: riscv: Only fast-path dirty-log write faults on host-writable leaves
Date: Fri,  6 Nov 2026 23:02:47 +0900
Message-ID: <20261106140247.155817-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_060318_779065_6F7C8F9F 
X-CRM114-Status: GOOD (  17.91  )
X-Spam-Score: -1.9 (-)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
Reviewed-by: Jinyu Tang <jinyu.tang@linux.dev>
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
v2:
 - Pass host_writable to kvm_release_faultin_page() as well
   (Inochi Amaoto, Sashiko)
v1: https://lore.kernel.org/all/20261017030927.345454-1-suunj1331@gmail.com/

Testing (v2, QEMU -cpu rv64,h=true, 4 vCPUs):

  A selftest makes the guest read an untouched page, then write to it
  with dirty logging enabled. Before the fix, the host zero page is
  corrupted (0x5a5a5a5a5a5a5a5a != 0). After the fix, CoW allocates a
  private page and the zero page stays zero.

  dirty_log_perf_test -v 2 -b 128M -i 3 completes for Sv39/Sv48/Sv57
  with no warnings in dmesg.

v1 was additionally tested on a HiFive Premier P550 (no noticeable
regression in dirty_log_perf_test -v 3 -b 256M -i 3). The board is
not available for v2.

This patch applies on top of the Accessed-bit fix [1].

[1] https://lore.kernel.org/all/20261016101458.221648-1-suunj1331@gmail.com/

 arch/riscv/include/asm/kvm_gstage.h |  5 ++++-
 arch/riscv/kvm/gstage.c             |  5 ++++-
 arch/riscv/kvm/mmu.c                | 17 ++++++++++++++---
 3 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
index aaf080ba1b7..0d19ad6d7df 100644
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
index be70607a33e..d9bfd0c6d5f 100644
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
index 5664383a1a3..b41534dd500 100644
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
@@ -750,7 +761,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 
 out_unlock:
 	kvm_release_faultin_page(kvm, page,
-				 unused || (ret && ret != -EEXIST), writable);
+				 unused || (ret && ret != -EEXIST), host_writable);
 	write_unlock(&kvm->mmu_lock);
 	return ret;
 }

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
prerequisite-patch-id: aea68332f05283074bb715e7dde093a2a316a51a
-- 
2.52.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
