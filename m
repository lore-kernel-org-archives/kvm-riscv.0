Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52073D5B84D
	for <kvm-riscv@archiver.kernel.org>; Mon, 15 Dec 2025 16:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=fGrUAgbcQ1BN3ri+Q40+GjlJrbFmcq4bS6yBmPqQMmM=; b=aEU
	/ChhteRGgPsrPd/21cYDI/8UJBKNqYZgimb620lSJoZg8464cwqI/CaruuXHHQMDc2xbv/KQ7WxHX
	/MydlH+C2jVb2oVl0j3i/1J8Lxpz4GR3aKAUnBF+WQFXhgSn7542KU3jNxMycrY/MBCPB3dn8JH6O
	D4k3qoex36DfCj031gx6UfDb8y5rpIbd6KbRlmxd8CDQcyNpmao3K9m6nTuC39GPUbMVlpTQ6q+Hq
	ahi5eiMYcX0hs0KMBfxCGYmBwdZSYM4VETZcAe6J3YWqk6gvxDVME9keVTDmIoOZ2/v5Bzt3fpD5D
	87+Z2wgeGBA1gyWxpc+3UjmUbb33AvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBnk-000000041a2-3Ioc;
	Mon, 15 Dec 2025 16:52:00 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBni-000000041YV-1HUJ
	for kvm-riscv@lists.infradead.org;
	Mon, 15 Dec 2025 16:51:59 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4775d8428e8so34620085e9.0
        for <kvm-riscv@lists.infradead.org>; Mon, 15 Dec 2025 08:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765817516; x=1766422316; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k4K0A7tw0piWVnb/7q48qsAOBuaPwaaJnbI388C3EIk=;
        b=i3NJffp+7p8r/F8m/q3K7Jh7EH0ZVotjA/BtTCeEGw+yhusx/Yuz3rjtOmSMmL0Kna
         X9FLGMBuaBV9iGVQYMKKbN2SGtI+cOTaqMkVpO+U50B8S5mJbeaSV3SDGJKy/7FW1ey9
         SuhVYxQ2/fNPjw9xlzVSessMYKomh1LdENB34ZcwmaUcSKvT6Ls4gFMm/w9tmNSkzWh3
         46CzTgeTnoZ4naOt5R1Ai9orXaBfzpN0LapFkX1kzJ3Z4uLDUl1A0J8WiWwmsOxPTOVc
         cN+9lJniBCi7VS7YxyirkIbZw2d/V4FgKwCd//PCWb/RPvi5XiPZWOn0jPwRmRL5WySu
         JFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765817516; x=1766422316;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k4K0A7tw0piWVnb/7q48qsAOBuaPwaaJnbI388C3EIk=;
        b=jEJDTBpBTdnhXghnuuOjxsY3tP2yr6tbeBrmddoWS8YUsJofvDRTCyTD37mNPw5vju
         h6BrFMTkvYPQcQSQ3R23vIql/3ckt/1VQOG0H7txEIyJebOuD58MLnl3+OUvTmJTJOyF
         TXmEQGrKTcEZh6AfPUyw/lxKU4kaiRb1WSiauxV/KGM6T2oiybKhlQhkEe8IQPbLySPB
         B76bqdOhG9z6CyaTPJxI4Agpa0Yg84uLyOCdipIy+JO6OW5bGw9DpILkNCdGQm1O6/q0
         LQqH+Mq8Uj7ZtDJ9yH1HIeDx/CQcpliH30VhaudEQncuRhKRkthTyME4WGIPsdxYfBtv
         Fcpw==
X-Forwarded-Encrypted: i=1; AJvYcCXLmwXIuflHl8yiNWhHED2Ibvq14ZExwEKummMSzCU5F7fj7gv+XgOhZLevEkVlmCSN4d+EY+p3dwk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwgAVXvN3cNvtRQzx2TZ5XzjvTGhPZ0VkGKpLEwGGaBDnOwQzXx
	zYwFBtgYDw7CykTQ1O+eOGWugVk6tvdQ1bPeM4dwcQduI8VrR8V48h1Qj/mChBJ19j4J4irDEqv
	usQ==
X-Google-Smtp-Source: AGHT+IGNq+OOelN0gNt5/INxptKwNuOhXBeg9PpZV5h/y2ooLGgWvT+8nQuHYF+Ar/8EPep76SDOriq1fw==
X-Received: from wmpo6.prod.google.com ([2002:a05:600c:3386:b0:475:d804:bfd2])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:840f:b0:479:1a09:1c4a
 with SMTP id 5b1f17b1804b1-47a96378c50mr93572455e9.31.1765817516238; Mon, 15
 Dec 2025 08:51:56 -0800 (PST)
Date: Mon, 15 Dec 2025 16:51:50 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251215165155.3451819-1-tabba@google.com>
Subject: [PATCH v2 0/5] KVM: selftests: Alignment fixes and arm64 MMU cleanup
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, tabba@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_085158_375958_54D8C41E 
X-CRM114-Status: UNSURE (   9.91  )
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

v2:
- Resend to correct partial To/Cc lists. The previous versions were
  inadvertently sent to disjoint subsets of the maintainers and lists
  (kvmarm vs kvm-riscv). Apologies for the noise and the duplicate
  threads.
- No code changes.

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

Based on Linux 6.19-rc1.

Cheers,
/fuad

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


base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.52.0.239.gd5f0c6e74e-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
