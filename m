Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731C3D5B846
	for <kvm-riscv@archiver.kernel.org>; Mon, 15 Dec 2025 15:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=0ld9x6PHGzxGIankbBohdOiCp4NJ5OLKtpqZZ6Lsrj4=; b=H/8
	78a/FXFmSvwgDi46+87RQEP67odP2iZRFxJss9lbpmzOsCc0pNPv8MOjzeEr0E1lyCA695ATR++i2
	VGayOXQ7G055asl/+yB2RDnl/zYjU9SnPfhXHTcBa8NAsBqfEEB4IpJiHwMGPcKYXcvN6cq1KA1Ql
	4iYo5BgoF4JzVXQhglcUWhyKUqD7Hoe9Fdb4VwnGeRC1xK09flSzsNNR2zkc5TDkcAKznHF6KEXxK
	/9gqW3GSjqzFIuo4Q0wtnEkS5GLplji/LD0mk4FslDNa5W0TC/2UAvkMM0Cso5lVIm9FM0/dvNETl
	J3uIhr9p2Jpxy5jdFOXrK5ZKhaOvYsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAvQ-00000003wOz-0PIO;
	Mon, 15 Dec 2025 15:55:52 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAvK-00000003wNJ-0OEc
	for kvm-riscv@lists.infradead.org;
	Mon, 15 Dec 2025 15:55:49 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-430fdc1fff8so489224f8f.3
        for <kvm-riscv@lists.infradead.org>; Mon, 15 Dec 2025 07:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765814144; x=1766418944; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bw36UYHiJwTnMGEVt20djLkGP5pKUV/ucx4MipOtVRg=;
        b=RvwbA0H1RkCvKJv51ji50F6s2wT9hgNZyrQ/aD+d5/Rjai/rgRpQtEWHPE8yazj0dI
         QV9okn8qEbPbb5XiZzV4FBXs6G6G0jmLWsj5iHGaAZDncM0qKonC9PX6t82cZMcwNFI5
         +e6ip8SX2z3Qg+iPX26mzeJ3BttAf4hGACSYndflOZ1WfJsLi+ASOS/wZR13YtXutX1d
         aaMR3KSFGH39L4CeOkrTzT/DeiusjpyuG16iR596zWb8cgOtu2KIRPx0iCu2pPwVT7UY
         oIgtlB6k6Ql1XlHyoE8cSoRTFBl1QM/VSgJJI8IDOSdTU2Pjj/9kM4o+NX4NotMLkN5y
         u05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765814144; x=1766418944;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bw36UYHiJwTnMGEVt20djLkGP5pKUV/ucx4MipOtVRg=;
        b=opp0nY2qMFlUnp9ARGAtttEad3XDKzBOJ9SzbPg8IYV/eakTE0K+jwBuedBvMkC4Dk
         AAEfpS9RXOXgA20+0wg2PfgLZgvn+UIOfM9URCJTgkgUEUSRppRaoahFgrQpI6dXfUHj
         hFou8zIg5tB9Rk+OxbXolomNkA2B20oms8Lfxgqw8mThReRAWRdIsmXgyMfaM7i12FRD
         UOKzNI4sSMl/7YyAoxVGoE8tu9baB+qK5C+u0RnikEIkdGurbAcry/DBf0p5qhXvIfzo
         f7Qh02KZvp81u+Wj3bIGqk96mX+YM7K2Srn+MQ/OpGvjh9WhEcDZOamE4Y2QouMRcSUG
         lzuw==
X-Forwarded-Encrypted: i=1; AJvYcCXp2POJ5HtHEvdVH4RNnlEGplEW1bUqCSjJifo5jnUzxZLROXheNyW9Ez+UARA4usKeBzEr4XckMuE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwLkJUsBVP4lQf6gdr6XIhMH5YfjEwl1e2EM1843e3gekWTCKvq
	5Ebg9ea8nj6pGKLonrYkYYwyjU3+oFMmTi4ExweRG9CIP/Ja7Sq/4AML2xjHEg94UQcvA8GU9EL
	onQ==
X-Google-Smtp-Source: AGHT+IG6+F6Un10L9/EjIC++FIOUIVfTuu7QmmdObJt5Z2W5GEqSeoJWiEHDWPn2o3uOCFFO3GyVjgiaTg==
X-Received: from wrbee4.prod.google.com ([2002:a05:6000:2104:b0:42f:b38a:60db])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2303:b0:430:fd84:317a
 with SMTP id ffacd0b85a97d-430fd843502mr3958203f8f.38.1765814143740; Mon, 15
 Dec 2025 07:55:43 -0800 (PST)
Date: Mon, 15 Dec 2025 15:55:37 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251215155542.3195173-1-tabba@google.com>
Subject: [PATCH v1 0/5] KVM: selftests: Alignment fixes and arm64 MMU cleanup
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Cc: tabba@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_075546_137376_9C28399A 
X-CRM114-Status: UNSURE (   9.37  )
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
