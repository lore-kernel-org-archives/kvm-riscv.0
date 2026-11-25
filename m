Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20A1606A323
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 12:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BA2KV+Uy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yjP9RPQsLRgG9GgexYkvhffrNr7iUnDjQrWd7aM+cHY=; b=BA2KV+UyHCjSqQ3sumNHBY1WSz
	/al5lD+7NNtFLkWFFFgGnnD04Ii5QdgoOszWES9Uw5a/+4I8dNwuR4yQyXnEnkyOEW6/aibk1smgk
	zeY+mvBuKPKU5GE5fUplYWlbHKim0GDkGTqAvgUr77jlgyY2OAU00FREjaK0LeMFO5SRGq8HHo4YU
	6ZUPB01HwtWoLRsFzY0rkIvfw3A/AZo98RVAkZB6/7eeMuvlh8Jm3jBEH2sD+6D4RUi1U9ywZYw42
	YFXM148VPOQvaOTd494r/p7+Ep+GW87Y0gKWuToYSNABs46sr1avko21Cj4BQepeXhnpw4uoiTBrH
	RZqg3cwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCT0-00000009tSH-1573;
	Wed, 25 Nov 2026 12:51:18 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCSv-00000009tPH-2gRa;
	Wed, 25 Nov 2026 12:51:16 +0000
Received: from k3-03 (unknown [159.226.43.8])
	by APP-01 (Coremail) with SMTP id qwCowABXgfuY2QZrsdirAQ--.2368S2;
	Wed, 25 Nov 2026 20:50:43 +0800 (CST)
From: Tan Chi <tanchi25@mails.ucas.ac.cn>
To: anup@brainfault.org
Cc: atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	yosry@kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tan Chi <tanchi25@mails.ucas.ac.cn>
Subject: [PATCH] RISC-V: KVM: Account G-stage page table memory
Date: Wed, 25 Nov 2026 20:50:23 +0800
Message-ID: <20261125125024.1983082-1-tanchi25@mails.ucas.ac.cn>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: qwCowABXgfuY2QZrsdirAQ--.2368S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCrW8JrWUCr48Zr17ur4xCrg_yoWrKw47pF
	1DCryS9r1rtr93Cr13twn2vr17Ga95Wr45Jr9F9a45ZFsxtrySywnYq3sFvF15XFykZayf
	ZrZIgFy5Zrs2ywUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPj14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE14
	v_Xr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
	xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrx
	kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
	6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
	CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRWeHgUUUU
	U
X-CM-SenderInfo: pwdquxrlsvqzpdlo2hpxfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_045114_075879_58BA3A45 
X-CRM114-Status: GOOD (  13.66  )
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RISC-V KVM currently does not account G-stage page table memory
in NR_SECONDARY_PAGETABLE.

Use kvm_account_pgtable_pages() to account for the allocation and
freeing of the root and lower-level page tables, including those
allocated when splitting huge page mappings.

This makes G-stage page table memory usage visible through
SecPageTables in /proc/meminfo and sec_pagetables in the cgroup
memory.stat interface.

Update the documentation accordingly.

Tested on a RISC-V KVM host running under QEMU TCG with Sv57x4.
The observed G-stage page table memory usage was:

  100 empty VMs:                         1600 KiB
  8 GiB sparsely mapped with 4 KiB pages: 16448 KiB
  256 MiB mapped with 2 MiB pages:          36 KiB
  After enabling dirty logging:           548 KiB

The accounting in /proc/meminfo, /proc/vmstat and cgroup
memory.stat matched the expected values and returned to zero
after destroying the VMs.

This reimplements the work originally proposed by Yosry Ahmed
in 2022, adapted to the current G-stage MMU code.

Link: https://lore.kernel.org/r/20220426053904.3684293-6-yosryahmed@google.com

Signed-off-by: Tan Chi <tanchi25@mails.ucas.ac.cn>
---
 Documentation/admin-guide/cgroup-v2.rst | 4 ++--
 Documentation/filesystems/proc.rst      | 2 +-
 arch/riscv/kvm/gstage.c                 | 6 +++++-
 arch/riscv/kvm/mmu.c                    | 7 ++++++-
 4 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 9e3c67b02ae2..c79d6432ecc3 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1591,8 +1591,8 @@ The following nested keys are defined.
 
 	  sec_pagetables
 		Amount of memory allocated for secondary page tables,
-		this currently includes KVM mmu allocations on x86
-		and arm64 and IOMMU page tables.
+		this currently includes KVM mmu allocations on x86,
+		arm64 and riscv and IOMMU page tables.
 
 	  percpu (npn)
 		Amount of memory used for storing per-cpu kernel
diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index fa7a468e8edf..cd1a74da287c 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -1208,7 +1208,7 @@ PageTables
               Memory consumed by userspace page tables
 SecPageTables
               Memory consumed by secondary page tables, this currently includes
-              KVM mmu and IOMMU allocations on x86 and arm64.
+              KVM mmu and IOMMU allocations on x86, arm64 and riscv.
 NFS_Unstable
               Always zero. Previously counted pages which had been written to
               the server, but has not been committed to stable storage.
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index 0aace3215d3e..f8841136d852 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -162,6 +162,7 @@ int kvm_riscv_gstage_set_pte(struct kvm_gstage *gstage,
 				return -ENOMEM;
 			set_pte(ptep, pfn_pte(PFN_DOWN(__pa(next_ptep)),
 					      __pgprot(_PAGE_TABLE)));
+			kvm_account_pgtable_pages(next_ptep, 1);
 		} else {
 			if (gstage_pte_leaf(ptep))
 				return -EEXIST;
@@ -357,6 +358,7 @@ bool kvm_riscv_gstage_split_huge(struct kvm_gstage *gstage,
 
 		set_pte(ptep, pfn_pte(PFN_DOWN(__pa(next_ptep)),
 				__pgprot(_PAGE_TABLE)));
+		kvm_account_pgtable_pages(next_ptep, 1);
 
 		if (flush)
 			gstage_tlb_flush(gstage, current_level, addr);
@@ -399,8 +401,10 @@ bool kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage, gpa_t addr,
 		for (i = 0; i < PTRS_PER_PTE; i++)
 			flush |= kvm_riscv_gstage_op_pte(gstage, addr + i * next_page_size,
 							 &next_ptep[i], next_ptep_level, op);
-		if (op == GSTAGE_OP_CLEAR)
+		if (op == GSTAGE_OP_CLEAR) {
+			kvm_account_pgtable_pages(next_ptep, -1);
 			put_page(virt_to_page(next_ptep));
+		}
 	} else {
 		old_pte = *ptep;
 		if (op == GSTAGE_OP_CLEAR)
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 6861c0e2728d..c7141395b9e3 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -816,6 +816,8 @@ int kvm_riscv_mmu_alloc_pgd(struct kvm *kvm)
 	if (!pgd_page)
 		return -ENOMEM;
 	kvm->arch.pgd = page_to_virt(pgd_page);
+	kvm_account_pgtable_pages(kvm->arch.pgd,
+				kvm_riscv_gstage_pgd_size >> PAGE_SHIFT);
 	kvm->arch.pgd_phys = page_to_phys(pgd_page);
 	kvm->arch.pgd_levels = kvm_riscv_gstage_max_pgd_levels;
 	kvm->arch.pgd_split_page_cache.gfp_zero = __GFP_ZERO;
@@ -843,8 +845,11 @@ void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
 	if (flush)
 		kvm_flush_remote_tlbs(kvm);
 
-	if (pgd)
+	if (pgd) {
+		kvm_account_pgtable_pages(pgd,
+				-(kvm_riscv_gstage_pgd_size >> PAGE_SHIFT));
 		free_pages((unsigned long)pgd, get_order(kvm_riscv_gstage_pgd_size));
+	}
 }
 
 void kvm_riscv_mmu_update_hgatp(struct kvm_vcpu *vcpu)
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
