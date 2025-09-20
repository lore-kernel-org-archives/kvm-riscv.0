Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B99CAC5A7
	for <kvm-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 20:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZAaXDBXY8HSRD3ONgNFpk+pvuOvw46ULBiRT5Odd2Bk=; b=hVz8eREj5eEmJm
	0d6fDdA96FEs7jxE3jCGhOyT90NwROBCP3CW6c2C2njl+nboXBMkEusogUZMILsmFRjWG8guC5cd6
	jKBb9P3PFS/qMIhHYpGoUgOGP4bhqygSVuL112IAaphEfxIvdR7MBOUHnl+nY5uJXLvSMWBSeaM6h
	K284mHjAwrauQn/riVsUxJZlUwGX45YSckgGfrOgqXlAxNEyNP3yfMWzpR3bU6rOn94vXXLAbxLOb
	YYMhMGGlgeARvBU6ihPAMRf2citb4fAjIcufuHUTrKWv0GBUGxzopYo0qzafI7tI+k1BrevLQHWOS
	+pbwY7a62IhPh6BJv8iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MC-00000005tGr-3EE8;
	Sat, 20 Sep 2025 20:38:56 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MA-00000005tEs-1Ugx
	for kvm-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 20:38:55 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-4240784860bso12439445ab.1
        for <kvm-riscv@lists.infradead.org>; Sat, 20 Sep 2025 13:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758400733; x=1759005533; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QhhBAyqrQkktxGVEvf+eNDaA1KtGAPXA3DGbaEzOigo=;
        b=nR8crLzAuYWMKFIhItF90HhbAYlHeILKKkpqcHUkkqQBmRxz03KTZTblUm9nbJoRo7
         EgGGhXJxw59a00OyWJ+cNpB7M2aLautOsrrtuanS3w3e+Tx93soHsnbKRzbQ/NGz/BEQ
         UQgM8XIpALClECaGMS4M9b8HJ91DLu2/4XJlRqxvDV8qhsCosxff7h1v8qMdwYefip8N
         9gH4gt51h4FSk2gSCkWOg80Yff9xya/uFzSGjqacYnGyLXhZ4N1+iWkdrr+3KL1DSABg
         Vt/Yrx5GVBMTHp5Js6XjPzFyN8r4hGKcWDTZiPWT98EWVet8eEUHrAefTnPeMQB5Vz7l
         YSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758400733; x=1759005533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QhhBAyqrQkktxGVEvf+eNDaA1KtGAPXA3DGbaEzOigo=;
        b=OzO/SWw5/p78DsqGJzPuDAyfeMeQnWURQ5oCglxE5LGTO3vZBCVL6/a51XjS7kR5HH
         B9o2LVikqzZ+/fZQDETgRDqPEx8Bjbf3z+8/jZkvOfBXLPSrHAT0JQ2HkW7oyBvc5yKV
         k4SHNNxQu18f3Vq9CqgerFdwln5KfYPH9HH8RSpHbRQjJ466sNpM5d0jfwgN1DJkBkO1
         6Nt0f6XCMYVLkRy1D2pNPxxN0cyvZp15QeQocEY6iPIfAjvUseJqvlkg+9iHxPTTEHG2
         lKnuPtUMnLfiWB04ikIU8QdHnpWphKTJCzD97wvm6k+TxbGLO1IY8lXuqwVM+WewQcJA
         SNRw==
X-Forwarded-Encrypted: i=1; AJvYcCVFSGgJvk/ZPs2+5BgrlGBCI5jRp4S6Uo4/NUl/b1Sk8Gc8eVvUx1J3XBE+nn80r7wCkCe+aaWKG+k=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8VHvn8uk8DI5LEJmHyENSFkxcYY8+pr1c1rx46Arp1Wxpj9Gq
	soaFwbQiQttoq5vsMI/KklGj99hP+j8ph0+W1R3eufAGHam3IrQ46WrlcshX067gQj8=
X-Gm-Gg: ASbGncsHgEBey8KuYC7AdxTABi7yr0Zbbwv+Vr9o4z/If0kcEg9r5Xg5Xun/lrhfxBe
	ACmkFHaH7ZrTAPPnKBFL2y2Tg7gQrUo8wFycSfBEjqKWCFsHEj3pWwDck/J6so8mXGC1ijyPuWd
	IJszre5s2HIQXHpZZ5GjSxE0FwbUgs0wYIHaFnhyFab8L+AKvgqLixIBogxrKFnIdojy4O9YZ+V
	JufPEY2c5yVnoE3x2pcMDCFo06AbVgobb1ruPr3WT/8E327pL4Vx+MPA1kNAa9vabpxFkdWHFq0
	hjjp14iPFDE0T0p52GIDt1lVhK1d6ZWBw8kYscOeKyvhPIL7gKcyaaY44OfwMJAfZltwcrt4jkJ
	owgr7/9ctLDFwz3uPWV+fLN0N
X-Google-Smtp-Source: AGHT+IGwK4PrAd7CyoBUGRZ3PUQqWIF5Zj/5N9zpz7O49heeJaggKCpHt+afTDzWqXDEvIoleQehPQ==
X-Received: by 2002:a05:6e02:12e9:b0:424:bec:4a01 with SMTP id e9e14a558f8ab-424819743bbmr104189845ab.16.1758400733061;
        Sat, 20 Sep 2025 13:38:53 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4244afa9fbfsm39814525ab.26.2025.09.20.13.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:38:52 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: jgg@nvidia.com,
	zong.li@sifive.com,
	tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	tglx@linutronix.de,
	alex.williamson@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alex@ghiti.fr
Subject: [RFC PATCH v2 00/18] iommu/riscv: Add irqbypass support
Date: Sat, 20 Sep 2025 15:38:50 -0500
Message-ID: <20250920203851.2205115-20-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_133854_406694_5644C809 
X-CRM114-Status: GOOD (  18.06  )
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

Changelog
---------
This is v2 of the RFC for adding interrupt remapping support to the
RISC-V IOMMU driver along with support for KVM in order to apply it
to irqbypass. v1 of the series was discussed here[1] where a couple
large design flaws were pointed out. Those, along with a v1 TODO of
referencing counting MSI PTEs in order to track when they may be
unmapped, have been addressed in v2. Additionally, v2 is based on
msi-lib, which didn't exist at the time of the v1 posting, and on
the recent KVM irqbypass rework.

Description
-----------
Platforms with MSI support (IMSICs) and implementations of the RISC-V
IOMMU with an MSI table can control device MSI delivery, including
directly delivering MSIs of devices assigned to guests to VCPUs. This
series enables that control and enables IOMMU_DMA in order to use
paging IOMMU domains by default. When the IOMMU doesn't support an MSI
table (it's an optional IOMMU capability) then paging domains are still
used, but the system does not have isolated MSIs. For direct delivery
to VCPUs an MSI table is required and thanks to KVM+VFIO it's possible
to determine when and how to map guest IMSIC addresses to host guest
interrupt files. The RISC-V IOMMU and AIA also support MRIFs (memory-
resident interrupt files), but support for those will be posted as a
follow-on to this series. Also, additional work will be done in order
to take advantage of the RISC-V IOMMU's second stage of paging. At
this time, the series just uses the first stage which allows testing
with unmodified KVM userspace and VFIO.

The patches are organized as follows:
  1-4:  Create an irq domain and some function stubs for an initial
        interrupt remapping support skeleton
  5-9:  Add MSI table management to enable host interrupt remapping
        and enable IOMMU_DMA
 10-13: Add IOMMU driver support for directly delivering MSIs to VCPUs
 14-17: Add KVM support for directly delivering MSIs to VCPUs

The last patch is a workaround for a KVM bug not introduced by this series
which is needed to enable testing of the series -- I still need to debug
and fix that properly.

There series is also available here[2].

Based on commit 39879e3a4106.

[1] https://lore.kernel.org/all/20241114161845.502027-17-ajones@ventanamicro.com/
[2] https://github.com/jones-drew/linux/commits/riscv/iommu-irqbypass-rfc-v2/


Andrew Jones (13):
  genirq/msi: Provide DOMAIN_BUS_MSI_REMAP
  iommu/riscv: Move struct riscv_iommu_domain and info to iommu.h
  iommu/riscv: Add IRQ domain for interrupt remapping
  iommu/riscv: Prepare to use MSI table
  iommu/riscv: Implement MSI table management functions
  iommu/riscv: Export phys_to_ppn and ppn_to_phys
  iommu/riscv: Use MSI table to enable IMSIC access
  RISC-V: Define irqbypass vcpu_info
  iommu/riscv: Maintain each irq msitbl index with chip data
  iommu/riscv: Add guest file irqbypass support
  RISC-V: KVM: Add guest file irqbypass support
  RISC-V: defconfig: Add VFIO modules
  DO NOT UPSTREAM: RISC-V: KVM: Workaround kvm_riscv_gstage_ioremap()
    bug

Tomasz Jeznach (4):
  iommu/dma: enable IOMMU_DMA for RISC-V
  iommu/riscv: report iommu capabilities
  RISC-V: KVM: Enable KVM_VFIO interfaces on RISC-V arch
  vfio: enable IOMMU_TYPE1 for RISC-V

Zong Li (1):
  iommu/riscv: Use data structure instead of individual values

 arch/riscv/configs/defconfig     |   2 +
 arch/riscv/include/asm/irq.h     |   9 +
 arch/riscv/kvm/Kconfig           |   3 +
 arch/riscv/kvm/aia_imsic.c       | 143 ++++++-
 arch/riscv/kvm/mmu.c             |   2 +-
 arch/riscv/kvm/vm.c              |  31 ++
 drivers/iommu/Kconfig            |   2 +-
 drivers/iommu/riscv/Makefile     |   2 +-
 drivers/iommu/riscv/iommu-bits.h |  11 +
 drivers/iommu/riscv/iommu-ir.c   | 698 +++++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.c      | 158 +++----
 drivers/iommu/riscv/iommu.h      |  75 ++++
 drivers/irqchip/irq-msi-lib.c    |   8 +-
 drivers/vfio/Kconfig             |   2 +-
 include/linux/irqdomain_defs.h   |   1 +
 15 files changed, 1063 insertions(+), 84 deletions(-)
 create mode 100644 drivers/iommu/riscv/iommu-ir.c

-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
