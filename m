Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B5CCC54F51
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 07:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UWkJZJ2KmZlMYDT01jspFsFYibG5B3J3PDETpBzrW4o=; b=mtVEFRN+8M0LvP
	1mlegnqhU5qnM3NXvUunXH+NZ2jXslIYmt5umJTTaztTmAmFJTBOE5QlCduMUXMRf9q5vQN0pX4JK
	ZgfFMBbK9a5XBT0FdoKnJ5egYJklvoGxUnlfjPzYyleHZ9WznzmyyQZrKFjy9WPIc2F/HbXzvwxtN
	OTNhBYVkpSaIVx9I/q6us+vgxib9lo/uao49JR/k+TjAb0z4iWZn/L7Dd+BPbO9+dd5nAUI4+rlRc
	M/NASuzgY/vYz4IXPslzCNHQh/UtguQvlzuDqYrC2hUEp24Qj9uK/yF9hEQNXCM8tqJ0P3Qc9HC9y
	rj4erTCI5BIYhhgxFQZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyOV-0000000757e-0hKh;
	Wed, 29 Jul 2026 07:07:59 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyOT-0000000756f-2Hkh
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 07:07:58 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-ca7a25cd87dso454245a12.1
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 00:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785308876; x=1785913676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D50VgXdohjCe0RlJun/XbYhvNc02+cTyZmQgaJjzY0o=;
        b=TbY332VV/cGgAc9W0ZjmL90z+Io+6/FC+xeYyZxBLoFJp+x7iscUdYgQLBQKBag6N9
         KxUqRUEUJG4hLr73+qEpghDfyviXHKXiw3w5IWCkqkCM0vSOEmtche+Iz4ZySwcZtsqd
         WESubNQtJJ1SJv+aA90aLBfjWaiDn0JmGCoohIxD4iw+vieRMf+97c726cRpDqdJCUYR
         qAoJD9z1L5FKf8ZKzT8SAbtHXi3vzuwdW++g0iDdPQ3hcSDIEzYTnhs3/bUz/LUIH6eP
         KtrlTFBTNJxcpcgpkwpy5L8qZG6/Jm60s8Tva8EHzYCGWeReCggLeDaNLDnvU3H0Ib+s
         m2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785308876; x=1785913676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D50VgXdohjCe0RlJun/XbYhvNc02+cTyZmQgaJjzY0o=;
        b=Wbe/iQyHymzOkC+GI4P9jOxvQIazGiYtbsevg2tZtfFGFacTZQqDsqrbf6hu7SBXG8
         yPmEdj6Onh90diXjiAZfajhkPaGhqRn2Ai4vCmB3xT2Dn/ona93VgNAP0adUlTLQlEBc
         7j+xu97sHg7N+y88AuW96thAbLAKCYNdl3oH+9/Rc3hUcPKbKcvOw58pSc/OCgWhN+FF
         5VoxDtloyZITOuqcAhNPR0BhyCBDI9dtWoJatq5KOjfsBbzSkhbtTVcYxqKLyLdKzXD0
         HfU2i038bHa6EvSPjIv8hpKvm7g2xej7KN6Ks6RF3cJVDsYzzfl6Mntj0dHQ7v6acLs7
         xXMg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+fnuEOXYX7bUH7+rLbMTV+TczFCQyB8eOrNpCuJ8Eagjgh9OTbc81FogQn2w7f/nYQAK9zbhq1eU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwsK80KToqMPXMSHwU0d6ZgBamgtytY1iVZcmlR5yvxlVLca/P5
	jXPkLvFuHcC12giU8YjT4gxFgHzVPSeMEuXxQMlzLYsX4xhSok69FfYF
X-Gm-Gg: AR+sD126sguKNhfC1m1z42l/Py3rBt0C961xTpflYFhkGmpFPc2wLckd5xjEm/D52SD
	GcpYiN0LIWhfwtAtqR+2rZg1thU9IrZgfSSY/VzALPdhgyXVcNPBE+OhW5Xi4cv8ejceL3obKxF
	viyRhuO+UGBctWAc3m8R4JpP+eWBs/AEOquCYff+aFxG1pfIWinEkS5YLxBJuOVLjPZdZOQ2BDE
	EGdhcFeK6NrVwx5sFaQqIkl02zlNGSAavntOsR02wofdI4L4WWm83QUBOSWzTo5NB5979Aoo9rV
	hC17LprnBO655rx5Zq7ui8l1+cVXI9u0W/dTw0pJE67hNqIrnFCE+jq+pKyVvSEl/31ISjivBKU
	HLe/8RJ2moZSWlXnSyCdSMeEwMO/1fuoSt9Tyh1CL73SrbcfjBZgNMm7pio2QhU9hidAEqYYaZw
	fg+T8+PYCGWbpHddwC/putXnH+OVtu5HtvF8xL/NuvjOnmTLlsHXPorrGosyb8phtTucNhCxq2R
	UXTG9edVVhtCyYA3kQ5aq9gGw==
X-Received: by 2002:a05:6a00:cc6:b0:848:467d:293b with SMTP id d2e1a72fcca58-84e931b505dmr5656775b3a.11.1785308876062;
        Wed, 29 Jul 2026 00:07:56 -0700 (PDT)
Received: from q-System-Product-Name ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea03d3182sm890181b3a.54.2026.07.29.00.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 00:07:55 -0700 (PDT)
From: "Bingyu.Xian" <shanbeeyoo@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	Bingyu Xian <shanbeeyoo@gmail.com>
Subject: [PATCH] RISC-V: KVM: Fix spurious -EEXIST and clean up gstage fault path types
Date: Wed, 29 Jul 2026 15:07:49 +0800
Message-ID: <20260729070749.730218-1-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_000757_585892_22AFDE21 
X-CRM114-Status: GOOD (  17.64  )
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

Two small fixes to the RISC-V G-stage page fault path, both suggested
during review of the in-progress KVM Userfault port.

1. Treat -EEXIST from kvm_riscv_gstage_map_page() as a quiet success.

   When a concurrent vCPU installs the same G-stage mapping while we
   are waiting for mmu_lock, gstage_map_page() returns -EEXIST.  This
   is not an error -- the page is correctly mapped and the faulting
   vCPU can simply retry the guest instruction -- but KVM was treating
   it as one: printing "Failed to map in G-stage" to dmesg and
   propagating -EEXIST all the way to userspace.

   Align RISC-V with x86 and arm64, which already swallow -EEXIST in
   their respective fault handlers.  This also lets
   kvm_release_faultin_page() drop its "ret && ret != -EEXIST" special
   case: with ret normalized to 0 the regular release path is correct.

2. Clean up fault path types.

   - vma_pageshift: short -> unsigned int.  Bit widths and shift counts
     conventionally use unsigned int in the kernel.

   - fault_addr: unsigned long -> gpa_t.  RV32 with Sv32x4 has 34-bit
     guest physical addresses that would be truncated when stored in a
     32-bit unsigned long; gpa_t is u64 on RV32 and holds the full
     address.  No functional change on RV64.

   These type changes are in preparation for sharing a common
   struct kvm_page_fault across architectures, as requested during
   review.

No functional change on RV64 beyond silencing the spurious -EEXIST.

These are independent fixes with no dependencies; they can be merged
on their own.  The KVM_MEM_USERFAULT port that motivated them will be
sent separately as an RFC once the generic userfault series lands.

Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programming")
Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Bingyu Xian <shanbeeyoo@gmail.com>
---
 arch/riscv/kvm/mmu.c       | 8 +++++---
 arch/riscv/kvm/vcpu_exit.c | 3 ++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 8a0aa5e0e216..d2a06a54be17 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -541,7 +541,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	kvm_pfn_t hfn;
 	bool is_hugetlb;
 	bool writable;
-	short vma_pageshift;
+	unsigned int vma_pageshift;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
 	struct vm_area_struct *vma;
 	struct kvm *kvm = vcpu->kvm;
@@ -652,11 +652,13 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 						vma_pagesize, true, true, out_map);
 	}
 
-	if (ret)
+	if (ret == -EEXIST)
+		ret = 0;
+	else if (ret)
 		kvm_err("Failed to map in G-stage\n");
 
 out_unlock:
-	kvm_release_faultin_page(kvm, page, ret && ret != -EEXIST, writable);
+	kvm_release_faultin_page(kvm, page, ret, writable);
 	write_unlock(&kvm->mmu_lock);
 	return ret;
 }
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 6c8530b9f29e..76cceecee5ab 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -17,7 +17,8 @@ static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 {
 	struct kvm_gstage_mapping host_map;
 	struct kvm_memory_slot *memslot;
-	unsigned long hva, fault_addr;
+	unsigned long hva;
+	gpa_t fault_addr;
 	bool writable;
 	gfn_t gfn;
 	int ret;
-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
