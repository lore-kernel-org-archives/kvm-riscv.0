Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A2AC43458
	for <kvm-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 13:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NZ2vVdlYxaXTS8OjyaYTuIKyJsnL8NxxcziIhmoQJ60=; b=V2Z2rSryO6vbm6
	WmXmudEfeSNeDDz+lX/OBn/ZecWeL7KKny/f979nNSVlUPBEAFJWXwJBzADTMNz0+sZV4gcYSesZr
	gSLxibz1ed2BqZPIRhfjuKN6vQrNLoP0lkrxwx9I09ZAFzVsjB8CXujhfp3wA/CVUL89D7MTLNe5R
	OiKTsOXOHlc/+DqPbxBe61PlQd1lEVgdEk/F6ZEozp+U1/dk64eZxQHguwvw7bJPXjkPAOc0fh0Gk
	ug2nTqNd0GCrTPcsDd1rFOzffkqN4p8sU5f5t31kim9OYRNjX7/hBA98A1armQk8LvNYHAkDV3qb3
	qXLKCSiDTyg35/3RAZyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoMy-00000002UQq-3VuL;
	Thu, 09 Jul 2026 13:00:48 +0000
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoMw-00000002UOr-0Evu
	for kvm-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 13:00:47 +0000
Received: by mail-pz2-x00.google.com with SMTP id 41be03b00d2f7-c95bd574471so711358a12.0
        for <kvm-riscv@lists.infradead.org>; Thu, 09 Jul 2026 06:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783602045; x=1784206845; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lg4645HSiS5JZdY+bW3DgGTrgEGwdoGfmFw6PnvB3Go=;
        b=SthabmedeHyG8rFGBsory//B1eOpDL3eqTgQcloQQLn95jk90/4UBGpgbcbN9gH5Us
         4yl+m4rPSbEpp5f1yIIitJFwZPV4gMUcpWVLX8X6T77CP1OnACduEQpXi0l573rKth7+
         nwDOR1E6yssH7vAZK7O047nIfb6oU2rXGD8nrhl9WVhnqW6GY+teG09QMVpSn0udLp84
         fcLnYSHyN/IgX1L2Amwfh4diAp9rWUYD7sDxG84HqtDoZ+Dkf52tjJusupzKpJ5WaO9b
         ILRGhZ9X4VohwinrtREuDh+d+4fc37zrok+ZzBBtu3Ii1NhIjijXMX/+kvuzZojSnYX+
         yBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602045; x=1784206845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lg4645HSiS5JZdY+bW3DgGTrgEGwdoGfmFw6PnvB3Go=;
        b=ogWA5h4SBfDWIkF0TJRMzg1gMLY5qnQHpHHnoST1quwUXT89tajv39I6Z117t7C9gS
         YVb0c5/sF+pPLB7GJLUhFcL1x+N0RrUgj5voi1mQe9KX5+wi3wivjuIv59BZMVdVuWAV
         o/2259wlxtIdSxXMzdn05Zu2VH4O9bI5tcrLhf7a5tDjoJUVVWbCKGpeXbpZCyg1Pb26
         QeTc0XeI2VBJcvpOff7vpkk9YryyK9D9NNzn0U7SsACng7ePtfLumuwNu3kFtS/6yPQJ
         M5QKSXCYlg58hl9a9/dCA43XvkDxj8T5LHexy0la94mAc6ZZXgigb9+HeawhkMF5Z0Iz
         6ubA==
X-Forwarded-Encrypted: i=1; AHgh+RrcDI2uIvQQpwueImE9MiNHfeoUxweYmIRwNvqjhz5lPdD7o3+KE1YHRiSr+tItufF/zlSh1TKa2OI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzzJervD44Ubz39pMMUMcZ0rl4D+8brLnf1db68cHKN8aEkufyO
	0I+cZr2yRMfLrMYYmj3DruvE7jQlbFAGR7lui2pYSKkQ8Fc3UuahRQoR
X-Gm-Gg: AfdE7cmfIgqAHIG9Lvijk14UPYHKGdvyaSmfyRwpC/+uaTe5TbLHz0eWEpfMSVgg0K1
	+sWYcxHg4GEEJvNqxwk9NPMa3FrRsx/Sa3jnNIpeV/fS8hVkJKLkZHnWqff6M3aYZ0RMqnZLOtO
	N+p+JNY8ziMDg/YtYauhUkaJQl53lezv4YBZBWWPoAB59+X6BrNzlpI07NSHaXeBN0niwfiu5xa
	aVRHD639n2/dgpsT4BXl5PGKz8rvlZSlkaK/r2z+RhuOnfzIUA3fHjtcjK8I93g/QmVPkIVDMdq
	eckEIViLpprI/5G795E3cuZzJA9fWPtuaRbZWw0n8Q84HYyc6kqPr9XTNfhr3ymPimMFsENKtb6
	sB3k7DGJlzU3yV+gazwG/vOToECDc3mI+rKdYCL6zyevt7CipSAucgeithKuGy+DiyEazoEJiVy
	fmR3aekj9bsK01EbUDOEHnCvVgltk=
X-Received: by 2002:a05:6a00:859f:b0:848:5935:2e11 with SMTP id d2e1a72fcca58-8485935322amr2775708b3a.48.1783602044433;
        Thu, 09 Jul 2026 06:00:44 -0700 (PDT)
Received: from q-System-Product-Name ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b975a0sm8752976b3a.14.2026.07.09.06.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:00:44 -0700 (PDT)
From: "Bingyu.Xian" <shanbeeyoo@gmail.com>
To: anup@brainfault.org
Cc: atish.patra@linux.dev,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	"Bingyu.Xian" <Shanbeeyoo@gmail.com>
Subject: [PATCH RFC 0/1] KVM: riscv: G-stage PMD block mappings for VM_PFNMAP
Date: Thu,  9 Jul 2026 21:00:35 +0800
Message-ID: <20260709130036.1708586-1-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_060046_101143_2977CB39 
X-CRM114-Status: GOOD (  10.99  )
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

This RFC adapts the arm64 "stage-2 block mapping for host device MMIO"
idea (commit 2aa53d68cee6) to RISC-V KVM, allowing VM_PFNMAP regions
such as VFIO-assigned PCI BARs to use 2 MB G-stage PMD block mappings
instead of being forced to 4 KB PTEs.

=== Why this matters for RISC-V ===

1. RISC-V virtualization is maturing rapidly.  The H-extension was
   ratified in 2021 and KVM/riscv has been upstream since v5.15, but
   many performance optimizations that exist on arm64 and x86 are still
   missing.  This patch closes one of those gaps.

2. Server-class RISC-V platforms are on the roadmap.  Device passthrough
   (VFIO) for GPUs, NPUs, and high-speed NICs is essential for
   data-center workloads.  These devices have BARs ranging from tens of
   MB to multiple GB.  Without this patch, a single 256 MB GPU BAR
   requires 65 536 G-stage PTEs (512 KB of page-table memory and 65 536
   G-stage faults), compared to 128 PMD blocks with this optimization.

3. RISC-V IOMMU specification was ratified in March 2023 and Linux
   driver support is under active development.  Once RISC-V IOMMU
   hardware becomes available, VFIO passthrough will be a first-class
   use case.  This KVM G-stage optimization is a prerequisite for
   acceptable passthrough performance.

4. RISC-V has a natural advantage over arm64 here: the memory type is
   determined by the physical address' PMA (Physical Memory Attribute),
   not by the G-stage PTE attributes.  So promoting 4 KB -> 2 MB does
   not alter memory-type semantics, unlike arm64 where the stage-2 PTE
   MemAttr field requires careful handling.

=== Design choices ===

Unlike arm64's original implementation which derives the host physical
address from vma->vm_pgoff, this patch walks the host page tables via
get_hva_mapping_size().  This is more conservative but safer: if the
host mm itself has not installed a PMD leaf, KVM falls back to 4 KB
exactly as before.  The vm_pgoff approach is unreliable since the VFIO
unmap_mapping_range() changes discussed on the RISC-V list in 2025.

The first version is deliberately conservative:
  - Only PMD (2 MB) blocks, not PUD (1 GB)
  - dirty logging still forces PAGE_SIZE
  - falls back to PAGE_SIZE whenever contiguity/alignment cannot be
    proven

=== Testing ===

Verified on QEMU (rv64, h=true, sstc=true) with a custom kernel module
(pfnmap-huge-test.ko) that installs a PMD leaf in the host page table
for a VM_PFNMAP VMA, simulating a VFIO BAR with a 2 MB host mapping.

Tracepoint kvm_mmu_map confirms all three scenarios:
  - anonymous memory:      size=4KB    pfnmap=0  (control group)
  - /dev/mem (4KB host):   size=4KB    pfnmap=1  (safe fallback works)
  - PMD leaf module:       size=2048KB pfnmap=1  (block mapping works!)

I welcome feedback on:
  - Whether the host-page-table-walk approach is preferred over the
    arm64 vm_pgoff approach
  - Whether PUD (1 GB) block support should be added now or deferred
  - Whether the tracepoint should be kept or removed before non-RFC
    submission

Bingyu.Xian (1):
  KVM: riscv: Allow safe G-stage PMD block mappings for VM_PFNMAP

 arch/riscv/kvm/mmu.c   | 45 ++++++++++++++++++++++++++++++++++++------
 arch/riscv/kvm/trace.h | 29 +++++++++++++++++++++++++++
 2 files changed, 68 insertions(+), 6 deletions(-)

--
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
