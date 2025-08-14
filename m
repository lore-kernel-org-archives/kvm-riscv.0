Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5543CA0EE4
	for <kvm-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 16:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7wyxVPHH2sXPgHCOFF/3YCVvZuVY313ozGFDiQOU2eA=; b=RlURYU+1Hh4MZ8
	vKe/IRwVLyUdKmyZ0x37XPdTPkhBlkb/08MGSAtPHnjUqBsl6/t9KngpfTrp/OLmHmQbGEgJgMew9
	7p2EHQ9Qa/QKhoGYNCDE5lJmKJU+O3o2HXNBn5Q9zrO7VXbAi45amOayxETKtmI/3AN4PcINVvUzT
	tTvwF0DRTrKZ1T0675dIYYUGbdOzrBo3sFFr0xh9sjuYPz45fRKcLBQU+7/LTp+MpYsP+ac2je/Le
	0yOSMjMJk61eV8qWn+PKgFqX3Kf7cIPPFeTIEMBHR2rfA5fx77DQx+U8HK65IS98WX7C2KWPSh3zW
	7Fa+IoqVxAkXYLEvC0JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umbHA-000000007x8-0t6l;
	Thu, 14 Aug 2025 16:58:04 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umaJ6-0000000HY46-2cVW
	for kvm-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 15:56:02 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-76e2e5c0d4fso988911b3a.0
        for <kvm-riscv@lists.infradead.org>; Thu, 14 Aug 2025 08:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755186960; x=1755791760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fbS0SnSfDCYNteBkAugCZAVezW6wYeQqbL6j1Y/9w2o=;
        b=lrkPIcKa48cRDTKMN4ukq29X40b04Rgyv/3VCKlAFEQ6x7EGDrgIcaiFn26uZPCv0F
         jv2ArefF+fImglGinfQOVzTl5VBZ2DSTCTvNIsfitKaEU7I8oM+MhQknnwQSDP7FGW9c
         UjEPZiHocPycom1O//qohLYDW0fP+jxowj5wJEK6o3uwB+x9nDWBa6OrdADlqwSjN7gO
         ie8mytwbvJUsfYkBdr2q+BuGedkaDxbCZOhNq1Hh9VBDTFYDiUOg29YB4p1w3p9dYI+Y
         Xtx7g5fiM6VbiR+pOoi++27T3uEFp67jQjPrwB/kt+b2knr+Z/UXQLxANfsPIs+88wwP
         0Hmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755186960; x=1755791760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fbS0SnSfDCYNteBkAugCZAVezW6wYeQqbL6j1Y/9w2o=;
        b=l0jLLV11ZPebJVRiwS4wCrSIzsDRBm54S+vwHfhbX3BHqRwCpxi+p4KkCqAcKeiiS2
         XVxjwFZ6ni1+nqeGPRzpvPX6Nh/LiY0C1b93lNufdsUU0rO1aQUNgQS9kAO91ktyOJSt
         cAnm19JmTBDjcNlD0BTixR8sqxmCfePXkGruoG1hREKatUPCWcnXYYoj2JYWj2AzRmXT
         sh4u79F36zW3fYmyhcM8/r0+5Ha6SbRyT6I/AQBO2ae+iY4ucXpQHYegwiXqMr2MOIcf
         Sed4ebjVUsG4hduOZlijpvIu9X+oaGO55Vg4z/cappNpAAPCE7FhnP/bGBGngdU4afxX
         IJzg==
X-Forwarded-Encrypted: i=1; AJvYcCWI0ofVnMMHFn7iV993l67n+dU7H7jTUA+GgzNwru5abXMwvLGDKvHAlCeUy7fEmzKSKmYZ8mTft4g=@lists.infradead.org
X-Gm-Message-State: AOJu0YwoyKPDmFbn8C17RZQKOWyUu2jNrWHrc9f0FTRLIVs8KAHYKM4N
	qlT1P3TGyM9E6YQyFUmJdqbdJVqqqi4jF0IKCfxr8wGSfAcrZfiL2Bmq0tQrtrhFfqY=
X-Gm-Gg: ASbGncuKtK0JKV/jrPT6qWn1hfscJWUMR0vKoyaCyJGI5XaBvP0Ba4ELaawpcAAJt89
	FfZ3sw7ZnBRZWjK3Ld3NeRtgtG8jf+J3fPE9yFVRc26W49LrpaExMYsH3T7PsU7vlRKABiFaY7O
	e0zfbv0pplHqRBFcVOjpmuv34to2v6n8hujmlnqDMk+wEWloVxKCcRIOj71Zb0mKZYV/2LLRXR2
	N3NAlICEcA9iCOx/NuM+fRa/+MlE4paBXqcp+55D+H7geQLK5cDgBnmYTEZS13IWu7UDnb6nXnm
	bmUbnXD2GN4tp1XoaRu6rLajo2JGGh4Ora584iKhOivkGeTXk4gEgDyV+xkGLwz/tx1TXotvjt3
	HyLQfjE13n7n7kV4l8dyGG2FIZdUDxaQWs+ZZ7+1GbxeTwygojlmDxGk7mcLscg==
X-Google-Smtp-Source: AGHT+IHiJ/C+iotNnCA3DhU4+fNK2fePBsmUyymIcxaNYom/9E0Z1/NWwsgFdX4eBUWW/qEOqDpszg==
X-Received: by 2002:a17:903:1a30:b0:242:fc4f:9fe3 with SMTP id d9443c01a7336-244586a18c8mr55450135ad.37.1755186959600;
        Thu, 14 Aug 2025 08:55:59 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3233108e1d9sm2225500a91.29.2025.08.14.08.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 08:55:59 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/6] ONE_REG interface for SBI FWFT extension
Date: Thu, 14 Aug 2025 21:25:42 +0530
Message-ID: <20250814155548.457172-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_085600_663110_F99482E3 
X-CRM114-Status: UNSURE (   7.57  )
X-CRM114-Notice: Please train this message.
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

This series adds ONE_REG interface for SBI FWFT extension implemented
by KVM RISC-V. This was missed out in accepted SBI FWFT patches for
KVM RISC-V.

These patches can also be found in the riscv_kvm_fwft_one_reg_v1 branch
at: https://github.com/avpatel/linux.git

Anup Patel (6):
  RISC-V: KVM: Set initial value of hedeleg in kvm_arch_vcpu_create()
  RISC-V: KVM: Introduce feature specific reset for SBI FWFT
  RISC-V: KVM: Introduce optional ONE_REG callbacks for SBI extensions
  RISC-V: KVM: Move copy_sbi_ext_reg_indices() to SBI implementation
  RISC-V: KVM: Implement ONE_REG interface for SBI FWFT state
  KVM: riscv: selftests: Add SBI FWFT to get-reg-list test

 arch/riscv/include/asm/kvm_vcpu_sbi.h         |  23 +-
 arch/riscv/include/uapi/asm/kvm.h             |  14 ++
 arch/riscv/kvm/vcpu.c                         |   3 +-
 arch/riscv/kvm/vcpu_onereg.c                  |  60 +-----
 arch/riscv/kvm/vcpu_sbi.c                     | 172 ++++++++++++---
 arch/riscv/kvm/vcpu_sbi_fwft.c                | 199 ++++++++++++++++--
 arch/riscv/kvm/vcpu_sbi_sta.c                 |  64 ++++--
 .../selftests/kvm/riscv/get-reg-list.c        |  28 +++
 8 files changed, 436 insertions(+), 127 deletions(-)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
