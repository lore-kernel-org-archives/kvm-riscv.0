Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43559CD8C88
	for <kvm-riscv@archiver.kernel.org>; Sun,  7 Jun 2026 08:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yyLVx5PR3FFyZKbfHF9jvRSslJjk29NGpkkt/EKSzUU=; b=YvjjUPeqkScHjv
	TS1kVFeg74JeDPM83fpIMfQEdadLZ5HugNEuTIrojs9M1sUP50eGC67DY2dERjLwrJ2smJk7rZhEw
	pvp++IIlDSW7t+96CeeB0bmpCXACDDRkGq671oJd5JikyZpz4MX+WErkA4K2g59xvsUBNX0Iuj9xy
	/GGsGXoCST1p0AEzdeaeOwVqRF13anh4TJRkD9C+hqTo0seEtt6Ji16B5OWuZV3vgJIUAxBPLTXT7
	YzrY4I6m3HPIBzTG8fn8GWs8Ksob2XccYmnqoCbxjN3RGjd4ElEi6mjkPATOk1fLMfEA9TkWLVf7A
	fSsiprOysFTAnhfgGTrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW8bJ-000000027Dj-341m;
	Sun, 07 Jun 2026 08:11:21 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW8bG-000000027CK-1UOV
	for kvm-riscv@lists.infradead.org;
	Sun, 07 Jun 2026 08:11:20 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2c0bd02d97eso38989475ad.2
        for <kvm-riscv@lists.infradead.org>; Sun, 07 Jun 2026 01:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780819877; x=1781424677; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EX0GhOhaSuN6IFI88OLaSPa41+0yBYDClmtrszme7Pc=;
        b=Z9ObPUFW4tO20VWlHo831H32QOPdqrwwPD66+jT7+1SpQOG6rOA4U5kNs22StTvq+G
         3giB21t2DsrfFHXGbRR6WBnj5UzI+MgFZHbwRndy9DrI2hs1fG4fRQD8QSdj3hWE48am
         wJ8kPnRbK4e5sX3n+q1FkQuXPcDIrYereXYc1MZhI4yd//blK3Fj1zLyDTgMHyD66YW2
         pvNtUN8h04bhgAgfkSFQTjPoL4FOjjigoG4uXzDGxbJ1uNWqypCU0f5Mb27cWQTBFrUR
         jCCSTvPif8ppwI/pvsujj984c8oZJMPFrqPL5VO2sh1oi+v6cuscSjoC58YSrfpWNVUv
         BtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780819877; x=1781424677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EX0GhOhaSuN6IFI88OLaSPa41+0yBYDClmtrszme7Pc=;
        b=iwIW8QS+kSQVXp2WJc34qjO8ldxttqyzXmlzm/JmGpHTvHOBdQ6EnW7L3aK7F8n33Y
         6A3DgR4MKp1qeUrM4d4W37lwQ5jqUE75sO7aN9mUmksAitYKKHSqMAAENgfgQgO+xKdo
         9Vc3ewgy3GishQpiMB8FIz8TvZhjrDJSD/c8eSSUtz0AlwkyhpjWZcFh2lQWYdqO145C
         E+IDuQFgw+9DuO62uB0pVu2meCMh4/NZreClEmasvt6tjkTeL+GXQT+1B+ZOsDnT3j9y
         UydjssWAWsgX4BN5Uh4OoBJEbkw1Dm4mOVmsUdOG9jn1Cl43lEFHCWYyl9JKhFfxQRAr
         2wtA==
X-Forwarded-Encrypted: i=1; AFNElJ9nWZ18dRIiOPJGhGkTbh/brIwAAfcGluet+eZTHUIBFCPfqf97aoi7bhl7bKmPgm5kEyrPXHVlLP4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzUkiXM1bv8IjBmFVmicUpu8n5z21/ggH+a13MjK92xVQnXO+AE
	LsDda+goLwv/OZfWEcPZl0jNigj0iqj5T7lZOH0IsQb4WX+kHtmuuFYQ
X-Gm-Gg: Acq92OFHZyVc45Qq2ray5iEhABvhF920CWGAc1owN3HJcgCGjgg8y7dj6lKlli8K3kM
	ZfUDUMmvVlXkcLPOhNqZfVvK070Q3J9z+FrqD2puEWjEVDtWs/YjEk1w9fsoN5VLgcj+glHA+tJ
	mRCBeULnHTnYC3hi3cDF9jikZonO3ho7l7ZYxrfe1s8NbiMqMzilSvlRZTREGDErDHQ/qECNz2x
	HS4M51d7F0hjZe5mmg+iNLAnvhz1SRJNNzxak56wrEb0f1IWU6S5u3Rq1zUnPl1320pAOcwhAa5
	OzYoQKZdfwYf9nZHyFspteWDyrLanaiL8T1LNKFSMUdN5aZPzCVTF4MN6cAgY/OohtKtvLddk64
	aAYNpeqNEIAt34LHGxWBIGYUUVuCIeucDsIwFFhst4fE6Ah0sTjPQgw+uPTo9XTRtkXoNDKqIGf
	KNSt/IlgTR5A8J5aF3+EpI+buppbSOsCfKPQ==
X-Received: by 2002:a17:903:1252:b0:2bd:eeb6:ff28 with SMTP id d9443c01a7336-2c1e820dae7mr117272165ad.12.1780819877063;
        Sun, 07 Jun 2026 01:11:17 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d211sm146385915ad.3.2026.06.07.01.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 01:11:16 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 0/8] RISC-V: KVM: Add Svadu/Zicfiss/Zicfilp FWFT support
Date: Sun,  7 Jun 2026 16:10:56 +0800
Message-ID: <20260607081105.993908-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_011118_399507_03B89E0B 
X-CRM114-Status: GOOD (  10.58  )
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

This patchset based on the patchset "RISC-V: KVM: Add Zicfiss/Zicfilp
support".

The patch includes all the function of original patchset from Quan:
adding the Svadu/Zicfiss/Zicfilp FWFT for the RISC-V KVM. And this
patchset already passes the KVM unit test.

Follow the patchset (Which is queued for v7.2)
https://lore.kernel.org/kvm/20260601-kvm-get_reg_list-v2-v5-0-415d08a2813b@sifive.com/

Test with the patch applied
https://lore.kernel.org/all/20260522142358.87589-1-cuiyunhui@bytedance.com

Changed from v2:
- https://lore.kernel.org/kvm/20260601084336.2601675-1-inochiama@gmail.com/
1. rebase with Yong-Xuan's patch set
2. Add SSP CSR context switch/set/get
3. Move the software-check exception set/unset into FWFT
4. Only delegate software-check exception when Zicfiss/Zicfilp is enabled.
5. Make KVM SBI_FWFT_PTE_AD_HW_UPDATING depends on both Svadu and Svade
   enabled.

Changed from Quan's v1:
- https://lore.kernel.org/kvm/cover.1764509485.git.zhouquan@iscas.ac.cn/
1. rebase to the latest master.
2. Split Svadu change as separate patch
3. Fix all build error from the original series
4. Remove the Svadu check in kvm_riscv_vcpu_config_ran_once() and in
   favor of the FWFT.
5. Remove the LPE/SSE setting bit in kvm_riscv_vcpu_config_ran_once()
   (kvm_riscv_vcpu_setup_config() in original patchset)

Inochi Amaoto (8):
  RISC-V: KVM: Add support for Svadu FWFT features
  KVM: riscv: selftests: add Svadu FWFT extension to get-reg-list test
  RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for Guest/VM
  RISC-V: KVM: Add ssp context save/restore
  RISC-V: KVM: Handle software-check exits for VCPU
  RISC-V: KVM: Delegate SPELP bit to VS/VU mode if landing pad is
    enabled.
  RISC-V: KVM: Add support for control-flow integrity FWFT features
  KVM: riscv: selftests: add Zicfiss/Zicfilp extension to get-reg-list
    test

 arch/riscv/include/asm/csr.h                  |   1 +
 arch/riscv/include/asm/kvm_host.h             |   7 +
 arch/riscv/include/uapi/asm/kvm.h             |  13 ++
 arch/riscv/kvm/isa.c                          |   2 +
 arch/riscv/kvm/vcpu.c                         |   6 +
 arch/riscv/kvm/vcpu_exit.c                    |  10 +
 arch/riscv/kvm/vcpu_onereg.c                  |  66 ++++++-
 arch/riscv/kvm/vcpu_sbi_fwft.c                | 182 ++++++++++++++++++
 .../selftests/kvm/riscv/get-reg-list.c        |  88 +++++++++
 9 files changed, 373 insertions(+), 2 deletions(-)

--
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
