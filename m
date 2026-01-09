Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D53D232EE
	for <kvm-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 08:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=nQSAryC/gI07XQrlCJU9Qy03F+dvEfaObs314UZ+rBI=; b=BSI
	0QffGztMj8awRoHu7Cvnb8U986A1vYxsW3ITude6mjufuWoGYaW5XVI9VCwozSMn371TFRkrQDIZq
	jR1d77dQgpimFFcuJacq/oDi+LvQ4Buxr+A+LWW95P9ixVY4cQVZ9uoxqlN6cYxVR7+RuB0a+90Ne
	H74bGjTk/TSSA4PlPx8RR+V6FVkno9lsvRwBaUiwc/FABqELmzQ1BrgbzX4hHZWCcjkeKvK2PVwsF
	FCccMb+phyz53Poh8/PzBZh7nXOb4t4lKTCZSQqJrgNtcJQmK9swwy1FTdqpqOngoC49Gkp+UWsy0
	YDTwfdsAuQbSVr6p/gBMStswtyZijKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7lJ-00000001sZn-0y8w;
	Fri, 09 Jan 2026 08:22:25 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7lG-00000001sVF-035V
	for kvm-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 08:22:23 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-47d62cc05daso24549885e9.3
        for <kvm-riscv@lists.infradead.org>; Fri, 09 Jan 2026 00:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767946939; x=1768551739; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BMgUtghnuAy1sqqzoIvEfRuLHghrW+zp1tKrLf8u880=;
        b=bLsiJJmKDO6QnA7pW1zh7MvLpC760iGAGpb1YS92ORWfPm7npC5gWe9ayZoTUif37c
         7SwT9P8olCFD5kdJzzLbH3hXpENIrSbPjAU6YYupVO3R5fDZ+ckNYMxkSgok+XQ/mkGU
         MuFcw5oZidczpFjs7TaY5TiT9CxZPuG7rCiripJOAKhC+rAGurh1NXsSkQYVWlklkNn8
         4ZhJcz5KPQ4/5qZ7EpoJTiqCG1MKtYPq6KNYEVWQ/0gz+ZzLSccSYEl2g667stOfo/Bg
         5zmJ7X1zdicUKrFAnWFMSppocscWPiYfFRxR/x23xH8h3rerUUFtqmNV0TyCch9t92l0
         6GUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767946939; x=1768551739;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BMgUtghnuAy1sqqzoIvEfRuLHghrW+zp1tKrLf8u880=;
        b=H2BzgtYzFd9hSd5iSOGpE3YuHHMtZtYL9dWFJnTHaHttSh1dux5pc1NmTlpynQ9lAE
         OG2vQhGd39dq7RI4rsvJtpp5v6/tOgZmI524uaKt++ADvswNPrklDkJcsQ3iHA/pme2D
         QnWaLQs1WLZ4x6kFaVHW4X+jZO7/hNvpNJBUJdLdRfriIgKveJUiLZSStvFiMqaEL9V1
         wOOqJx8q72rOP2LdSGs1gRUtJemovXh2h5c+hau9dzkCcijOmcOyOboBL7bvGhnFLGsL
         1uVmDASJ5g2l8zsqsulo8vLkxn9G1fgUMhCHr7kPKd/FrzQjDWkKmOBIXYxfvD79Gdcl
         eHSw==
X-Forwarded-Encrypted: i=1; AJvYcCXH83y2X7ucQDsfSBsblFFfI+2FirD7VZGypGv69NnBJ+0NG27dLXcqq7oJChXcpv/Q6zF2ORgGyMo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxPDHiHK36STfWN9owppVkQbVHPBJUtSXYvp4fGPryqIhH9EdKE
	4VpPCm1fotwdI9xrFV8uQ0EDdDO7jr5nyuYru7KKCtDfiOfUS7/Pw92CJRr4025dpBLYfHjbmgK
	Mwg==
X-Google-Smtp-Source: AGHT+IEEqNYMoHeY+3DwmkTCwwRtWsTJKfrOQfXfQ55U2Jju+BCRFWy02s7qCZ5He0miV9LurIPAHvpnNA==
X-Received: from wrbgz29.prod.google.com ([2002:a05:6000:481d:b0:431:1c7:f966])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4fd2:b0:47b:deb9:f8a
 with SMTP id 5b1f17b1804b1-47d84b40a99mr108297505e9.30.1767946939194; Fri, 09
 Jan 2026 00:22:19 -0800 (PST)
Date: Fri,  9 Jan 2026 08:22:13 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260109082218.3236580-1-tabba@google.com>
Subject: [PATCH v4 0/5] KVM: selftests: Alignment fixes and arm64 MMU cleanup
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, 
	atish.patra@linux.dev, itaru.kitayama@fujitsu.com, andrew.jones@linux.dev, 
	seanjc@google.com, tabba@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_002222_063053_0B748977 
X-CRM114-Status: UNSURE (   9.76  )
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

Changes from v3 [1]:
- Renamed page_align() to vm_page_align() (Sean)

This series tidies up a few things in the KVM selftests. It addresses an
error in memory alignment, hardens the arm64 MMU configuration for
selftests, and fixes minor documentation issues.

First, for arm64, the series explicitly disables translation table walks
for the unused upper virtual address range (TTBR1). Since selftests run
entirely in the lower range (TTBR0), leaving TTBR1 uninitialized but
active could lead to unpredictable behavior if guest code accesses high
addresses. We set EPD1 and TBI1 to ensure such accesses
deterministically generate translation faults.

Second, the series fixes the `page_align()` implementation in both arm64
and riscv. The previous version incorrectly rounded up already-aligned
addresses to the *next* page, potentially wasting memory or causing
unexpected gaps. After fixing the logic in the arch-specific files, the
function is moved to the common `kvm_util.h` header to eliminate code
duplication, and renamed to vm_page_align() to make it clear that the
alignment is done with respect to the guest's base page size.

Finally, a few comments and argument descriptions in `kvm_util` are
updated to match the actual code implementation.

Based on Linux 6.19-rc4.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260106092425.1529428-1-tabba@google.com/

Fuad Tabba (5):
  KVM: arm64: selftests: Disable unused TTBR1_EL1 translations
  KVM: arm64: selftests: Fix incorrect rounding in page_align()
  KVM: riscv: selftests: Fix incorrect rounding in page_align()
  KVM: selftests: Move page_align() to shared header
  KVM: selftests: Fix typos and stale comments in kvm_util

 tools/testing/selftests/kvm/include/arm64/processor.h | 4 ++++
 tools/testing/selftests/kvm/include/kvm_util.h        | 9 +++++++--
 tools/testing/selftests/kvm/lib/arm64/processor.c     | 9 +++------
 tools/testing/selftests/kvm/lib/kvm_util.c            | 2 +-
 tools/testing/selftests/kvm/lib/riscv/processor.c     | 7 +------
 5 files changed, 16 insertions(+), 15 deletions(-)


base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
-- 
2.52.0.457.g6b5491de43-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
