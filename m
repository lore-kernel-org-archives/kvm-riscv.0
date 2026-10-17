Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8D4CCF2C7
	for <kvm-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 11:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cH4O7wWO5g8nFEPwqF+KJxk7CtSNtr9CZ5zQWCl0Rhs=; b=iTkFsw6fyRmkW+
	uFalBrB3DMrzZNw/XXsp+vXE9VVdUWmais6OCXZQs/SpQfFpNqNya9pBGXYRJSnGzvUjvXIGz9dC9
	r5U+9u5rUf3U5khx5eOJaoFJHPUdAjSawBnYyQ/UDleX+62+hz6ZeLGj7zQGitM8foMW9ug5VL4Fw
	g2BVL8riWQj4E6dEFcRMWXlcSjN3jepCeCFxxtUt0EO2Pm8+5QehaMOJ/X6FsH7DmsQf2OIxcY+oo
	B+OVSXffvOxLoOXumrzsebh6M589+6PqIZGXMNx444o34xE6cJbTH1B2Ttu9R8Ih9/t/kPPU+/CAY
	GSHqqlGeMGRQ0w8ltySQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2BN-00000004h1X-0XGr;
	Sat, 17 Oct 2026 11:02:33 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2BK-00000004h0a-34ab
	for kvm-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 11:02:31 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2e987b4a710so7892795ad.1
        for <kvm-riscv@lists.infradead.org>; Sat, 17 Oct 2026 04:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792234949; x=1792839749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EooerGosbt9uNoLNk2R3r8CmWtmPXhr2JTyWgkAeP44=;
        b=eyPN9INruwfMbeQ860L/JWHxU9aABGGNzDVeuvxwwZlYvlT6m/o7wr2xFrB+xAr8AM
         SPiW+ynVKiPaI+L32T3hT3N+lFV6tpM3ImhfkOJPcJIj5S9/oIS8CHB4hkhxmhaSf1Jo
         HJtmzQ1t+OZdtSaS2Q/YLesvNrdaji7PzdtERSanzaIcasSz5LxTnJAYzCEWOv7A+K5D
         0LkFZNPiXDuUqCu+krWaF8I50r2zjyTmvoL4xmZRdFIgLm8NqbvHUJBySXoqUm88bxKe
         36gXriPTZfm2Q1uQUD5xZ2JxrWtX0inpzpcXV1qd7AxbSxN6sP5J0tue3tuDiEhNTWMp
         SKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792234949; x=1792839749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EooerGosbt9uNoLNk2R3r8CmWtmPXhr2JTyWgkAeP44=;
        b=PKTZ2Bxl48kJIEsS1WVSkGM9W+TPorcyliDDZV774CxewJSNb+mUcJUUne9lbqfUut
         CvHUm1ZKMeirWWX8w4XRK0bt+8hg+W1UEone7mMYgJyEyTsXEGuBbp+snxYPUMwmUtrU
         mWO/gK9pUebpGQnw+2V0ObTh3YXsCifBTWGhSy5/O11zOLFgoLn726EawKBH6rw1wy/4
         NUWSW4+Kam4+JpeCv2KZtTrAGUpRMc2iFPZa/FxBiaLhdesSko10ksjjQ3B/j2xeizmq
         0eJR+t+ppGSk2pWuC2BdUV9yxi2dGn1QxHdH8udsfVQCY0BedCz+Ltj2iYXRVkJhxhV1
         bFxA==
X-Forwarded-Encrypted: i=1; AKwUvByVJNqKCg8cx8126/aGDf9li7TlJFxoG7qupbNVj3p5kpDOSPK0WDXe7HDaA03yJF20B4jVU8Qps0k=@lists.infradead.org
X-Gm-Message-State: AFq9FYLPm2V9uqcYeMbIj3fs9wnIQZKNCcWKI1gOorSqyyE5/CvCNwFo
	HEqlPZt3CFn+DD4Hcq4fAa5pqaJMlqD5DdF+4HalkgCSjDK2X0CsMWDg
X-Gm-Gg: AYBFou3pS10jg2bZIpg5kMg2zLHpM7xYBUr3ULnBJATKKL+YiMbKppDHMz9rcD46oko
	Ak4vZ3fCML/dk39ooWNqv43kWekgmFmp5dbR9tmsj/3W4ZBhhAxyvUMaRu8h+PRQQcEFeLmlYg2
	13U8F429exmyjnR9BYvfOd05QPXIblILtWHI6K4iD9rFyKq0sgQcNzq+D5kROt1Td6EWFT8VIMn
	gOTDC8rpy49EsThzVliip70Gr0fxK9WHTBEueN7tFVlL9kMVS1FcA9R8yw0s2Q3Lf2eDg8s+Xad
	LeswPYWOlELRQXKbnxeBYu/9t8bd415HkGjMNsfigIIdYDpevfXr4JbJb+z32g/aiHxQh2Il9oV
	wN/15uAp8/xQsRRDDcPeORFeW17RL3ToxvxQ10JyFDc3WXdxNQEgQpPf4Q3jjFSlRYHbPGofPJQ
	rVlFcbzOK43Qv9kM5YxMu82Y2b8GN9T6t3uNh5t3V9aeyLhpDp5GwNIYyDtzMTFiiPAEuEIWd+o
	NbPC01Cl2fJihkGl95FAg==
X-Received: by 2002:a17:903:1a10:b0:2df:a0d4:71de with SMTP id d9443c01a7336-2e9a66ebc71mr15900275ad.0.1792234948529;
        Sat, 17 Oct 2026 04:02:28 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:7c65:ff3e:80ba:b06])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804dd9sm20559955ad.16.2026.10.17.04.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:02:28 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH 0/5] KVM: selftests: Reserve memslot 1 for ucall MMIO
Date: Sat, 17 Oct 2026 18:02:08 +0700
Message-ID: <20261017110213.46199-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_040230_783716_8FC24A5C 
X-CRM114-Status: UNSURE (   8.69  )
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

This series addresses the TODO in __vm_create() to reserve memslot 1
for the ucall MMIO region. It introduces a shared base for test
memslots, migrates existing test users, and adds a read-only region to
prevent overlapping allocations.

A regression test verifies overlap rejection and continued ucall
operation.

Testing:
- Intel Core i5-10210U and Rockchip RK3588 (arm64).

These tests are changed but not tested: 
- arm64/sea_to_user.c: not enough memory allocation.
- x86/nested_vmsave_vmload_test.c: requires X86_FEATURE_SVM.
- riscv/sbi_pmu_test.c: riscv hardware unavailability.

The following test failures reproduce on both the unmodified base
<8edffbc1f6272db167037e1a8c49b99e9cd04803> with host kernel 
7.3.0-rc1-gd4b7fb647204 on RK3588 and with this series applied:
- arm64/vgic_its_save.c
- arm64/hypercalls.c

These failures are unchanged by this series.

Tharit Tangkijwanichakul (5):
  KVM: selftests: Introduce a shared base for test memslots
  KVM: selftests: Use the shared memslot base in memslot_perf_test
  KVM: selftests: Use the shared memslot base in memstress
  KVM: selftests: Reserve memslot 1 for the ucall MMIO address
  KVM: selftests: Test protection of the ucall MMIO region

 tools/testing/selftests/kvm/Makefile.kvm      |  1 +
 .../testing/selftests/kvm/arm64/hypercalls.c  |  3 +-
 .../testing/selftests/kvm/arm64/sea_to_user.c |  2 +-
 .../kvm/arm64/stage2_block_transitions.c      |  2 +-
 .../selftests/kvm/arm64/vgic_its_save.c       |  2 +-
 .../selftests/kvm/arm64/vgic_lpi_stress.c     |  2 +-
 tools/testing/selftests/kvm/dirty_log_test.c  |  2 +-
 .../testing/selftests/kvm/guest_memfd_test.c  |  2 +-
 .../testing/selftests/kvm/include/kvm_util.h  |  1 +
 .../testing/selftests/kvm/include/memstress.h |  2 +-
 .../selftests/kvm/kvm_page_table_test.c       |  2 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    | 19 ++++--
 .../testing/selftests/kvm/memslot_perf_test.c | 62 +++++++++++--------
 tools/testing/selftests/kvm/mmu_stress_test.c |  2 +-
 .../selftests/kvm/reserved_slot_test.c        | 61 ++++++++++++++++++
 .../selftests/kvm/riscv/sbi_pmu_test.c        |  3 +-
 tools/testing/selftests/kvm/steal_time.c      |  3 +-
 .../selftests/kvm/x86/nested_dirty_log_test.c |  2 +-
 .../kvm/x86/nested_vmsave_vmload_test.c       |  2 +-
 19 files changed, 128 insertions(+), 47 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/reserved_slot_test.c

-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
