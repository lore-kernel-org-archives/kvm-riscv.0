Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3196DC47BCF
	for <kvm-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 09:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ryWU6uwww7DCNqRz9W+DDGt9PHddSIqc7zkkxIGCR18=; b=gnx
	Ui8ZMJkX8v7wle14SK9cls/onW/0E8vaM/x3iNBEzUCVHnfJi30hin5bPFMcoXOZYD9XRzTKjE+f0
	2oN7mIhaG4DqHIKL/RPNTZhNH861pDwOOr9PCvwMffKoso1cyyfXj1x1qRqsjqKijPLx6JIXQDbVp
	sJIJL9V/FxI/qM+cdC5QP0CQzAmMqeModkQ3cNwZXAGUtXAM2F4pstuZlUuzAVivOW7Ro+yiLTeXd
	IigP5CzUEpbLWdz7ofqNG26SE5hBaJrsWE3DI59ek/puRx1OdFNxxl1FW2QG8Lr4379N2LE51biSG
	iVxpnkEzsDsw9O91pJXTaPDXiyyKg2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3Il-0000000Ci0R-265X;
	Tue, 06 Jan 2026 09:24:31 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3Ii-0000000Chxs-2g5o
	for kvm-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 09:24:30 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-47d62cc05daso4834565e9.3
        for <kvm-riscv@lists.infradead.org>; Tue, 06 Jan 2026 01:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767691466; x=1768296266; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+LqF8/lht1o9n/0GpUByxOJv4W80ArGZN3sXAN7aJgw=;
        b=ZrtvGMG19Uoq5NNmJu3RiBTmHD8wud0O9KV9Pk+LKMsrXcLBBg7R023dDB0ERJ5cTY
         /hJsefF5JpCp7EcU3duFg96QiI9Vv1ReQjpMiciHK22FKnIjbtu3rPFvKHvkSnxqqS86
         SmBwnT41hnU/15egEb4EqpXn0a1gYTLua/lwoSqEdIsXSZHjC7Av+axFwfdSP4GE+zw2
         X5ULetZo8zWVyz9e0WgqTH7fuVGtZzLktUJpXgFfOZiNCD5gP625zDbtEIUf3LCkkueC
         vqjAtTjdv7q9SMFTyeAarUmNmEpcbg2j0FhurzmLIFmp93Xji+hUkYRs89qbeao2WqsF
         VRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767691466; x=1768296266;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+LqF8/lht1o9n/0GpUByxOJv4W80ArGZN3sXAN7aJgw=;
        b=isy+GmdFuOQsyVYqULxzA1L2gtmn3NdP/sQ9yXPnWiK+eZc/UBNrqNn6VjlTfA+8m1
         13QD5EYYpoLywv3nUaWLXm1WXKG9O84wk8nwpzHf5mSw8CEbvpeIpL+fsjbepMZ48VBO
         57X/THa/xs2LXAWhnWHlyW5EH1h6GGMngHS23G1XMujMcfqdpsC/0wMWQ6trfOHaAMhG
         LVzONYrXK4sL+Ta68yfKLeT1k4zW85nd2KVYHuRA2mtP0LngXnqHRWjBKUD9fnMAQkT/
         Pr3E2X4HYz8XFQXBq9D4GtiwizWX89kzMl2lqUah8h6hrwYrW12dPtLu8RAWK2QlDd07
         Zzzg==
X-Forwarded-Encrypted: i=1; AJvYcCW3qBr1sPZNcDXJMUFAxuBILkAR0VxWBT1xBMWw/PbYr6tMwnOEEh3aeqE9Yg0UFybpznxbvCb3p3A=@lists.infradead.org
X-Gm-Message-State: AOJu0YzR8w8+mInHVp8a6pyqj898AwfJhIg8OJ6No5oNTVbm2m9Oq60n
	YM7kFpC9ngnRK85PI0sjeA2TaZqMvcujmTjdPN4tWE8x6aUqz20OUxBkbvKabfsncp4usWir12C
	Veg==
X-Google-Smtp-Source: AGHT+IGJDvWpfC1ugVJSYdWQcUeMnYmXOhwJri2fdiSaOwSbZ5cVH4Myj4tyQgT04GoXs3XHWR0vuJXjyQ==
X-Received: from wmbdu14.prod.google.com ([2002:a05:600c:634e:b0:477:9b3e:67e3])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3555:b0:479:33be:b23e
 with SMTP id 5b1f17b1804b1-47d7f090045mr30939095e9.17.1767691466044; Tue, 06
 Jan 2026 01:24:26 -0800 (PST)
Date: Tue,  6 Jan 2026 09:24:20 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20260106092425.1529428-1-tabba@google.com>
Subject: [PATCH v3 0/5] KVM: selftests: Alignment fixes and arm64 MMU cleanup
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, 
	itaru.kitayama@fujitsu.com, andrew.jones@linux.dev, tabba@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_012428_686866_D80320BD 
X-CRM114-Status: GOOD (  10.48  )
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

Changes from v2 [1]:
- Collected Reviewed-by tags from the previous version (thanks!)
- Rebased on 6.19-rc4
- No code changes

This series tidies up a few things in the KVM selftests. It addresses an
error in memory alignment, hardens the arm64 MMU configuration for
selftests, and fixes minor documentation issues.

First, for arm64, the series explicitly disables translation table walks
for the unused upper virtual address range (TTBR1). Since selftests run
entirely in the lower range (TTBR0), leaving TTBR1 uninitialized but
active could lead to unpredictable behavior if guest code accesses high
addresses. We set EPD1 (and TBI1) to ensure such accesses
deterministically generate translation faults.

Second, the series fixes the `page_align()` implementation in both arm64
and riscv. The previous version incorrectly rounded up already-aligned
addresses to the *next* page, potentially wasting memory or causing
unexpected gaps. After fixing the logic in the arch-specific files, the
function is moved to the common `kvm_util.h` header to eliminate code
duplication.

Finally, a few comments and argument descriptions in `kvm_util` are
updated to match the actual code implementation.

Based on Linux 6.19-rc4.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20251215165155.3451819-1-tabba@google.com/

Fuad Tabba (5):
  KVM: arm64: selftests: Disable unused TTBR1_EL1 translations
  KVM: arm64: selftests: Fix incorrect rounding in page_align()
  KVM: riscv: selftests: Fix incorrect rounding in page_align()
  KVM: selftests: Move page_align() to shared header
  KVM: selftests: Fix typos and stale comments in kvm_util

 tools/testing/selftests/kvm/include/arm64/processor.h | 4 ++++
 tools/testing/selftests/kvm/include/kvm_util.h        | 9 +++++++--
 tools/testing/selftests/kvm/lib/arm64/processor.c     | 7 ++-----
 tools/testing/selftests/kvm/lib/kvm_util.c            | 2 +-
 tools/testing/selftests/kvm/lib/riscv/processor.c     | 5 -----
 5 files changed, 14 insertions(+), 13 deletions(-)


base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
-- 
2.52.0.351.gbe84eed79e-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
