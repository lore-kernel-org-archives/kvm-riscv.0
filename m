Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357EEC5AE59
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 06:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VjhS1ot/dawZYExhjfA7SnfZVXF+QIEN2B99L87DifQ=; b=fVEPNckmOT5sgc
	EuuselkTcajjJM0u/k8s9QzFNck/qoXaFMeyFCfdt9bmn8V7Mafyvf0JPrcJ3NiiI2mt0F3IuwFXp
	jciZl72X0f6vBZo5pVkEepOv9CD2VjDH3RjrCxSyPlqv3poU0Z7Tw7oTViNUSj6rYMDiarv2ltzcR
	i7pUlmfGw0VpbUl1W7DUVL241H+NTzkK2r5cyp9Ho1l8DkbScEOMlsmNgxMUkHdjzvwlUcOTP0aif
	V+YwT7YOfXdB1joM/kyF3zkv9zNQ1DYtA1fCpB+lDm8hzDtGusKHROKYYAv28SXmtPC2nRQShKG+p
	mO6Cd32rHytttlFxzqag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3sg-0000000EomN-3TEu;
	Thu, 05 Jun 2025 06:15:14 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3sZ-0000000Eoir-02NU
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 06:15:13 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3127cc662e2so612462a91.0
        for <kvm-riscv@lists.infradead.org>; Wed, 04 Jun 2025 23:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749104106; x=1749708906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IYCdKhY8aW9URe8Blmx5TcE5ZqYHha77HAw4jeob92E=;
        b=lbBLOG+5CLTTykyRWxk3O7m/7Ib0SHSEwnWM3tvCOj0VYKhaUBDQJQLag40DYPyORM
         tQuYO/Gbw/h4Jd35n5+w4VpzFpdyzC9r7LlbnhGPbaqYmvTwfRPyQmx8GnuyjIMrwHNT
         CFrI2xPOj8eYsuMmmTLXLgpmccqmPbMpwEUmepjCsVQw2I7XGehySypx7xN/YBTSKGdm
         8zd7fcsmBXRZfNpY1DKkGJlcEFkldWCShJuutW9NfSDz7UzmzHIrLO9D+oIwgRUoJ3BS
         pmegGSSIduQRyArHAwNcT40RVJFtdMpr0obMmAhMTpodez7pX7ssD0O072gQmUjT6EHb
         kngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104106; x=1749708906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IYCdKhY8aW9URe8Blmx5TcE5ZqYHha77HAw4jeob92E=;
        b=INIOpIeSklwtOnby1cMVNr7m0za90xjusKjs+RrTWl6C8U/E2HCp2HiyfEE5T0cozi
         4U4uLhDzwNdfBwjUwclDim9i6xWFcPZFYfo/PuP98bnYNfmAS0NkzUKhXy+MC4tEECdl
         gZAysn/6P1bcjfyITRBXKSXCGNiTUj+gp441reTzO3feUoouK36sN9Rar9uK3H5+dzgV
         Ds+fcdLsVoGe9SWRXstv/WPeYnv1EIpKB8N5bOVz7AzufgMbL0gWgRc+8QNJnXUyKRWS
         lbYOIKeEL7lakB0SE1kWJkQAHG+BuRmbTnJZTzoyzMt8JdNp1xOf75XzozQDr0CdEKaS
         Dx1A==
X-Forwarded-Encrypted: i=1; AJvYcCXo7KbF0jcEpBoye1px9h9E5E73F+17tpptS2OPSCT7yVgcW5UzL2TbrtN05ocQWmBFlv/c6My4GvE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5Cz/MIPaIYtxjoqyMiooCngcYJIZ2Lfna195thssiOHTWDGmg
	CA5+qbC7MaRuAoaddLxV7nmEIrtdgpIv/EUb/mU5yQCsuYIRJw6N91zuKgc8ldt4pfU=
X-Gm-Gg: ASbGncty/gLAklAnHekokltZkvRfgl2u7h84DzeMagmS80bI4lTi57evHlK0jWMdsib
	C3PoF9iNgO8RWJRFmBUYWyO1llnbN6JtjiXjuIu/dLXlcEBYITcT/ZDXozkuhmFmWImJVPzyJ4x
	9odgPHzsyVNFNhpnsIdIeDyUPmy3KG+hdth9BFu81hMlbUdFd/lLoRkD/DPYPIs1vaFB9lThRfn
	D/x7GsTD0+22/qlN3GK4hqGEICRZpTNQFxCuiQ1MGP1f0ulewzpzOKB0n5oFX/DhPhMMVScfhZ2
	5DnGxo5Xx6Qrb2GDltTWI/vdNInCNiLW/r8ZSDwResD7XHfvqIf7FtCY/9CVbgyElNsKdHiUxzK
	SUWQYgQ==
X-Google-Smtp-Source: AGHT+IEERT0Tj/0eAgp/ef6xa8y7k+Vq1PulNXuIhfC0x9NWeX6p07jWalxiSI7B9LR8eu0ziMDdUA==
X-Received: by 2002:a17:90b:1d07:b0:310:8d4a:4a97 with SMTP id 98e67ed59e1d1-3132903824dmr3193484a91.15.1749104105532;
        Wed, 04 Jun 2025 23:15:05 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0bedc7sm716026a91.49.2025.06.04.23.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:15:04 -0700 (PDT)
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
Subject: [PATCH 00/13] MMU related improvements for KVM RISC-V
Date: Thu,  5 Jun 2025 11:44:45 +0530
Message-ID: <20250605061458.196003-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_231507_059325_8477237F 
X-CRM114-Status: GOOD (  11.99  )
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

These patches can also be found in the riscv_kvm_mmu_imp_v1 branch
at: https://github.com/avpatel/linux.git

Anup Patel (13):
  RISC-V: KVM: Fix the size parameter check in SBI SFENCE calls
  RISC-V: KVM: Don't treat SBI HFENCE calls as NOPs
  RISC-V: KVM: Check kvm_riscv_vcpu_alloc_vector_context() return value
  RISC-V: KVM: Drop the return value of kvm_riscv_vcpu_aia_init()
  RISC-V: KVM: Rename and move kvm_riscv_local_tlb_sanitize()
  RISC-V: KVM: Replace KVM_REQ_HFENCE_GVMA_VMID_ALL with
    KVM_REQ_TLB_FLUSH
  RISC-V: KVM: Don't flush TLB in gstage_set_pte() when PTE is unchanged
  RISC-V: KVM: Implement kvm_arch_flush_remote_tlbs_range()
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
 arch/riscv/kvm/gstage.c             | 336 +++++++++++++++++++
 arch/riscv/kvm/main.c               |   3 +-
 arch/riscv/kvm/mmu.c                | 499 ++++++----------------------
 arch/riscv/kvm/tlb.c                | 110 +++---
 arch/riscv/kvm/vcpu.c               |  27 +-
 arch/riscv/kvm/vcpu_exit.c          |   7 +-
 arch/riscv/kvm/vcpu_sbi_replace.c   |  25 +-
 arch/riscv/kvm/vcpu_sbi_v01.c       |  25 +-
 arch/riscv/kvm/vm.c                 |   7 +-
 arch/riscv/kvm/vmid.c               |  25 ++
 19 files changed, 791 insertions(+), 601 deletions(-)
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
