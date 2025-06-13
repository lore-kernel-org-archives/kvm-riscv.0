Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE4DC71135
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 06:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uP9c3VTTNZEVvzfdebivSeu0IV75nT4fF2KPXdm1h+8=; b=YxrNfvo3bnW8yX
	eBlqm6sdT81QCGAWranP4U2I0oAmJKW1WMrv1u3FTnMTR83XJ2WoYSJTLTxQv+fc5LL7R10yL6y5v
	Pgj5TDQnc/VHV75EDF2fJ5cLzvDl5Tt8jVpuNyc8LXaqzw9aoE+LMM9QkjsWrExkP1/rk5XtVhPXB
	7nZbi+P8G6y2RCquQnbE4Vanv395+MS9iUUYrke+hyoaqjzmJzyDyIzPvDuA0NE3dl+SgzxBQKeFx
	hobkDLpUfvfeU85kAdoUK52kRixLR0QfXbtOkTLrJk5a/nx/qJMR/ql1JYiNCLQggAx4DtP6evfKU
	c6Y9TATCk0m4SQihbWuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyMQ-0000000FXDf-0Wvo;
	Fri, 13 Jun 2025 06:57:58 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyMO-0000000FXCp-15nO
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 06:57:57 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3122a63201bso1763650a91.0
        for <kvm-riscv@lists.infradead.org>; Thu, 12 Jun 2025 23:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749797875; x=1750402675; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fS5629Jr+WvAX+3s1UFysCJ0aoAPCHlpZZzgXeCc68k=;
        b=cSJZ6yVsgwt8uZEN0S97ZJsVnjfL+dFfqQQtVCC9Z2ao17mz1ovEtzOBZI6B0M+4Gv
         wRrbb3KkUb0LQuIzEgeRLgMFUovthSaLJzDNKAxKuA3LtJX0m8vusNZM4APpMScjmYJ/
         nIbWWI12cNhUmMF6vQQUtlZ/Tg7lgnGZCX2zloJgg9YA0WwuT3fCUg4SDIo5CucsZZi+
         5V9srSuveJeAZHQM39R2P971zT+jij3gnQsVZqSB4k4EDr7RLbv9UEhElvnE0Yq2HV0D
         K8tSZo39LDZQwGKpJs9QTOfzSjM4f0eX57RKpzl5NBqTE0xxrAPbe+Bv6dmyV/9VUcgr
         TbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749797875; x=1750402675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fS5629Jr+WvAX+3s1UFysCJ0aoAPCHlpZZzgXeCc68k=;
        b=WklOX2DswwAou7qpEcvlDF2/BmUe7DcTKN/3W6TZ5jeoTiPhdEnayT2L/hHnARHOYO
         kOF0fmVWnHD3LlV7MlGZ/t8CKoS1s5Wi0KtUzUvDYlm7Hr0IjVjnWhulGU17y7kEjQ7F
         CH+9I3qUNFTcdIdzAv6Yg/XrXtQRtLTAgC9jaWbPjK/W6btb1k0LGRXQx0IqK50fWV9g
         tf2ZW7OdDgNppB5bN0Is4TFC4UkaJTmKwnIMv4rnJNac2k19Aikuiv8/OzmmqOJEM7lv
         9FjTyvoU/dwyofWQQz8eOGhIB/JaRylnzHtfo0F2jLSXp5AdDUbcQJ8OTxi8N+hToJeX
         AkpA==
X-Forwarded-Encrypted: i=1; AJvYcCVvBjvDkQTFmaB4E2qxUWtpakPX7ZN6s7rbq2Kbzsa/nIvruasu/NBkUL3Kk5+cI4NDkXmmTEG9SKc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwCqqymDUFgTmNAsbAvpknYSHMDuACaJUBVFkkuAXfR8JC75K5Y
	2PseqP/PpPv0z0kDr2uLjjBMLjzXHy8tMsblYHj8fy1GLSEog+T/fU5Pdq+JoZYlKKk=
X-Gm-Gg: ASbGncvd7W7avwUPZeSpMyi6KWpgphY/HVK7Wz2ehBln6mZPVcSCDFXBlHb6w6Ub2L7
	99vF+aEF4WkCc0/tPhP4lhDfJWq82VcU3QJ9dNHIGe9d+j+d2zGrO/quenzTsFEwznN7Gh/GnsV
	b36zfivWCqnbTOvNoyFbP4vezP2sMbEVi3GuYfFHiTZORRqOi67hoYaKgy2SM2E8WI+B9acsX3S
	j2Ag4DzSGTkhk1l9e6SSYH3/xTF/Fv6OmlsmMyQKmv6IZaY/YyZ4IaMzhZ6jTf/2VylIun643eu
	HvaaQanJbrw1G63x+dcjaiK+rrdavNanKUjVfaHIN8f40FRQgqcymR+ZJPUP2qEwbjuSW0fj/6v
	aAMhBIWMEjRI8zKDngGM=
X-Google-Smtp-Source: AGHT+IGbcwSxBXFORB1F4UP8rztiMzZ/iN/4l/08KXt3P8+HxU0t7mDVGHn5YSyDBavfM4IMvKl4yQ==
X-Received: by 2002:a17:90b:184e:b0:311:ea13:2e6d with SMTP id 98e67ed59e1d1-313d9ec5adamr2880839a91.29.1749797874839;
        Thu, 12 Jun 2025 23:57:54 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b49b7fsm2653022a91.24.2025.06.12.23.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 23:57:54 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 00/12] MMU related improvements for KVM RISC-V
Date: Fri, 13 Jun 2025 12:27:31 +0530
Message-ID: <20250613065743.737102-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_235756_288717_F06E5870 
X-CRM114-Status: GOOD (  12.50  )
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

This series primarily has various MMU improvements for KVM RISC-V
and it also serves as a preparatory series for the upcoming nested
virtualization support.

PATCH1 to PATCH2: SBI spec related fixes in SBI RFENCE extension
PATCH3 to PATCH6: Few cosmetic improvements
PATCH7 to PATCH8: TLB maintenance related improvements
PATCH9 to PATCH13: MMU related preparatory work for nested virtualization

These patches can also be found in the riscv_kvm_mmu_imp_v2 branch
at: https://github.com/avpatel/linux.git

Changes since v1:
 - Rebased upon Linux-6.16-rc1
 - Dropped PATCH1 and PATCH2 of v1 series since these are queued
   as fixes for Linux-6.16
 - Addressed Atish's comment on PATCH1 in this series
 - Added new PATCH7 in this series

Anup Patel (12):
  RISC-V: KVM: Check kvm_riscv_vcpu_alloc_vector_context() return value
  RISC-V: KVM: Drop the return value of kvm_riscv_vcpu_aia_init()
  RISC-V: KVM: Rename and move kvm_riscv_local_tlb_sanitize()
  RISC-V: KVM: Replace KVM_REQ_HFENCE_GVMA_VMID_ALL with
    KVM_REQ_TLB_FLUSH
  RISC-V: KVM: Don't flush TLB when PTE is unchanged
  RISC-V: KVM: Implement kvm_arch_flush_remote_tlbs_range()
  RISC-V: KVM: Use ncsr_xyz() in kvm_riscv_vcpu_trap_redirect()
  RISC-V: KVM: Factor-out MMU related declarations into separate headers
  RISC-V: KVM: Introduce struct kvm_gstage_mapping
  RISC-V: KVM: Add vmid field to struct kvm_riscv_hfence
  RISC-V: KVM: Factor-out g-stage page table management
  RISC-V: KVM: Pass VMID as parameter to kvm_riscv_hfence_xyz() APIs

 arch/riscv/include/asm/kvm_aia.h    |   2 +-
 arch/riscv/include/asm/kvm_gstage.h |  72 ++++
 arch/riscv/include/asm/kvm_host.h   | 103 +-----
 arch/riscv/include/asm/kvm_mmu.h    |  21 ++
 arch/riscv/include/asm/kvm_tlb.h    |  84 +++++
 arch/riscv/include/asm/kvm_vmid.h   |  27 ++
 arch/riscv/kvm/Makefile             |   1 +
 arch/riscv/kvm/aia_device.c         |   6 +-
 arch/riscv/kvm/aia_imsic.c          |  12 +-
 arch/riscv/kvm/gstage.c             | 338 +++++++++++++++++++
 arch/riscv/kvm/main.c               |   3 +-
 arch/riscv/kvm/mmu.c                | 499 ++++++----------------------
 arch/riscv/kvm/tlb.c                | 110 +++---
 arch/riscv/kvm/vcpu.c               |  26 +-
 arch/riscv/kvm/vcpu_exit.c          |  20 +-
 arch/riscv/kvm/vcpu_sbi_replace.c   |  17 +-
 arch/riscv/kvm/vcpu_sbi_v01.c       |  25 +-
 arch/riscv/kvm/vm.c                 |   7 +-
 arch/riscv/kvm/vmid.c               |  25 ++
 19 files changed, 795 insertions(+), 603 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_gstage.h
 create mode 100644 arch/riscv/include/asm/kvm_mmu.h
 create mode 100644 arch/riscv/include/asm/kvm_tlb.h
 create mode 100644 arch/riscv/include/asm/kvm_vmid.h
 create mode 100644 arch/riscv/kvm/gstage.c

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
