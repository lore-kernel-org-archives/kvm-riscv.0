Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB00C7115A
	for <kvm-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A0tgQppyzTUMiZHKFMzGxXElsdbbRJQFCO36ON8FPss=; b=2sTiQaUG+Ay4RT
	ZGnN67bU4pjlhzgmyNAJVZVAwibAb2cc4JMNvcCSrEkuBLXKhkZffC3mNNtN87N1jre31attSmPuL
	HrCYVi5H3hMAbtdPbalM12bnDJUQ3kXZnCNhS5DAkjeNfvJcrXxOKrN/XVxEZunkvUKu8LnEDUhOI
	op+8XXfTmPcx+Wa8MPK7vWXrRIVKzb2TbshbwkBipnSy0Fce+RiRoHQbu4IrdRMlR3N666F7SkEPt
	4uNBcF7tE59N0WupLu1+GH2c1ynWCrbzpC9oTb5LFFBd/0jNCmOfjbrcsnrlPLKsI0FR01VC1XXXK
	/QhQuzHdDWNBdQHpdU9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsWh-0000000AEXR-3U0V;
	Wed, 18 Jun 2025 13:08:27 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRr50-00000009xbm-142y
	for kvm-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 11:35:47 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-236470b2dceso60701455ad.0
        for <kvm-riscv@lists.infradead.org>; Wed, 18 Jun 2025 04:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750246545; x=1750851345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O8iWAhDJxETW40ym1irbHf7bY4A+gmTdzotzkqqzyxY=;
        b=LUuzG8t+q641iIcwVLl4n2zVJICMa0tN9Bub2EZpJe57rOq5UM2htS2AB6zLz+HiLC
         g2aYIZSPphSoZT/9kBvLpDMqeTjZaPLIp07CtOD+iMwGuGblSceAvM3qV5iwsK0hgEhH
         lNdIuPYGck6ZLXrOlRw9s/q34BAosenklJerXgThBs5EaznedElP5mG/VAl1EDVJyTlE
         jQF99nQB7K+3rBT0kjBYxgMb3rtbVxqKKXRTNP4utBgniXN3zjLzcwKzsupZKGQW7EWY
         gdHqj8tiC+46u68LJD1mb/KWqXjoXLjbhjMMVYDPXf4GwKw8rhqarvL44SiTLUAoCrqP
         3xrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246545; x=1750851345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8iWAhDJxETW40ym1irbHf7bY4A+gmTdzotzkqqzyxY=;
        b=qJjUG8zbV4WVFMzAKa9co+G6Z3Kdh3/EAzTtN7yK1y7PGETIcqsE9NtnlwHrtFvXzM
         HgP9R8u7Yck2u8MXw33c7uTWE1ra8mJP/5RyXPIsMoBaRRSsdXvbBc6K66BjNlx0wW7J
         w0dEdCqAE4osfHbYa2Xg/mOOP+33VE6MhVE28hbo6ZLcKYgGytEAyuGoUw5DjNHsrhBH
         VlTTvaUYU0dU8rMl7gOnuPVXmuRrRyIik9rc9tx4fbt0bro/pWK3N+30l3yetSQ+VFnO
         /OzudgsCGsZTXtQZWqwpO5hbo9veBLZGPRODzXRG5K1B1S7JSFcuxksME8J/er15uBdu
         HHlw==
X-Forwarded-Encrypted: i=1; AJvYcCWRnjUj+6fDJRKtgY/Lxx+URzcIBIX+6LyXfnqbx+JBBpz4wMoxLBMm8xIv/NvYtSA+rTKmwxhYhX8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyebCHg9iuu/6n9XS7bGDz2xCmFcdgnbjH6D2AFRtdltRwmQb+Q
	Ms++zGXYm3JSlS4ZMdgH3216M1cPnFSaoo+6f1W7YNcsCG635Z4YyxW2PI+9wlbtMaRfKqaG3kr
	QlCtB
X-Gm-Gg: ASbGnctsYxYTT/KEngBs6A5q5Gc/uzzI+eqsQzFsGi4pSizg53zPOJ2csGqivvow1QK
	eyAXJ9ZsY3v9RhYhzNWG/OkspCD61EXyQzfqC9Z5aeukQbM+THfnzflnLK2oaEXNGXD5fYqUKVP
	TVRlVYMK3HfnXqXERJGoWFOvgd+yPlRLFWfIV86uIdOFUEeZv+tYoFbwMYEaKL80e0qiDKMtrNZ
	AqWdKOFwpUq+ArCLB3bI2FFKnCLhQurfQgNiXIzTnQNPyH4eG7A6dDTtTy+Nc5sXwZdvPR3pMoz
	U1NvYz6xzUhEe1FWytahUCb46HM4vJFlPs/zSOA+oBxm+/U00NHOGlkDdGcFyoMsCoPzUTqap/n
	yCaNyPORiKuc6dQEpuQ==
X-Google-Smtp-Source: AGHT+IHPnSOG9Zfjo3AXh1Ue9MlaL5hmmABB22HqQcHI7XHuRT4ee8G3zhSleCl++zcQ0XmNSUBiMg==
X-Received: by 2002:a17:902:ba83:b0:236:6f43:7047 with SMTP id d9443c01a7336-2366f43724emr191830325ad.9.1750246545357;
        Wed, 18 Jun 2025 04:35:45 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237c57c63efsm9112475ad.172.2025.06.18.04.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:35:44 -0700 (PDT)
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
Subject: [PATCH v3 00/12] MMU related improvements for KVM RISC-V
Date: Wed, 18 Jun 2025 17:05:20 +0530
Message-ID: <20250618113532.471448-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_043546_295219_5A3B2CA4 
X-CRM114-Status: GOOD (  12.63  )
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

PATCH1 to PATCH4: Few cosmetic improvements
PATCH5 to PATCH7: TLB maintenance and SBI NACL related improvements
PATCH8 to PATCH12: MMU related preparatory work for nested virtualization

These patches can also be found in the riscv_kvm_mmu_imp_v3 branch
at: https://github.com/avpatel/linux.git

Changes since v2:
 - Rebased upon Linux-6.16-rc2 and latest riscv_kvm_queue branch
 - Added Reviewed-by tags to appropriate patches

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
