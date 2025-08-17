Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB12CA0EE4
	for <kvm-riscv@archiver.kernel.org>; Sun, 17 Aug 2025 12:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ugf3i2rrUz6s7u3UGD6iz8r/2+oO/4OHcuWLGxIWOrs=; b=HxUugOP3/oOaEO
	jzP/rzGuvjqV6cunUvq89OI7QAO3M/jISGa+TFsCuku+WR3gj0JMZnIiEXK7vNF2jKIkq6JKFlEiQ
	joSAQq+C3IQ6bEUZPiIkkAWR9ofu/sL4bKq6w8bC2hXg/gUS7JUvZDycFiQZJcDgzb985LwqZvs9h
	6vs2vJR23zkSAwh2LTSkJDBBsbte/Gtt+74CKOrbmohQv6Mgl+kRxmgX+y+kmLe6Xku97/puwupAc
	J1egHZh8gJTrU/hei0hdAawRpEd7fCjz+aBwtFmBchOfctenbDuSZjstlStIiEGXrbrK2QWd81paA
	ebnz0NtpCAWzn9jYUsPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unca0-00000005etT-3YVz;
	Sun, 17 Aug 2025 12:33:44 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uncZx-00000005esc-2gex
	for kvm-riscv@lists.infradead.org;
	Sun, 17 Aug 2025 12:33:43 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-323266b6ff5so1903858a91.0
        for <kvm-riscv@lists.infradead.org>; Sun, 17 Aug 2025 05:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755434021; x=1756038821; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7WbiJIeRAyXPasTR+StFJQvgx7M5MTQOS33x2RRGox8=;
        b=cP6hU/rVgCPnLmgZfjagw6kygp/XbuBcHkCn92L6OT3WgMWLPFJ/xnqQYlEXuotkSv
         gNfFGp1sIrWxyRlKHbXl03rRcDGJRgTMlLzSKnx6PTaucoKz+eqxxLq1ArTxojKf77SZ
         gnSRTl8nY9KoRM/6u1UUPswSuCZjsgzmO1gSZ+jr96rFAq1js1y+CllDyV1fjvbzjbay
         C6RRc86vx5f7h3f1dZWF0p3IF/wrEe73FRDUYNHsHqhODnUfZ7vX+hGFMGJIh2qDjETI
         ndvQwYvjuMLaG6AVq/25zpXbvGmtpL3qtz4SAQmlXOB7mwNqFMtK+bs6zGqxE+BHYKQf
         cM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755434021; x=1756038821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WbiJIeRAyXPasTR+StFJQvgx7M5MTQOS33x2RRGox8=;
        b=IX7Xj/sCRvoWywb8MOkwhADDGDQqQCHt0SJaBTemtF1mA2D1h0Ki24TpsS2unxZNQk
         6GvHVYtqhXs/MvTRDEthyfObwQceJRMz/SBACzZw++9/7eVJ/APV1lXyh652C1Ilprjx
         wIsUbIcrudKrYeS7WYyA7NyBZoZp257g4Sil/jomag6ZTcZtU4lReKl0u+HrXjF3JWop
         yE/ezLhRyn1xG03G+Ok6XPFYlYBaBnhpYfxa9BIvr/KFhqn2VcvThzL4gnsu2ZuLghQr
         ZKvmAVTE5pZGm3c4d9xUkQfDrzNxxGu4V44RJCQ2bFashlTkU3Y9r+Mv5jRxaBeNU0or
         46Fw==
X-Forwarded-Encrypted: i=1; AJvYcCXEsFixGipHzQwqAVa9LjEOSGVLqPTwLCQ/GPGPw1lQakty35+HmQnKwUFzxxZhyffcBFLroNaMWBo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxbwOMMyJ2cygRoC/or9umrrz+G1rOm4uTxKZSYYcvUONRl2CR9
	Vhc08HIFTN4/QRQvbFKMRrdM7RudTlEkAWsPVM8wx63W/qIJ4zaSMDmUfOb3JD39rqQ=
X-Gm-Gg: ASbGncvwMPl3EkjmZGX0eYlF7UWWREVw5DilLFFhKac/ZpbfV6Kj7FmIxGX4FQQJX7S
	KxWhzhBkRAyedNBuzu8GI75sMRNyz6Le8HNtbfV+gwO+rpW/kEmKpD6dbkhDg5P38nThQL8z7g0
	Mlio9O6kwNLyjxGvvU0/FqOrDVaIJN/HE1MrenHPmU3lb40ZUnPJWwJoj/Z13b6kI/ohlwI2BjY
	mw5ulfWnfswupgaHvfMpQ/Z+sc7DT14jio5UE7RYBl1axY4laEf3gTRNsP2z39IFiu7w2/O96MR
	Ucbx0L3TTsq1gzlJb7wJJeT0UOf7yRtlTjozx9A7y8q6PfUYV8FtjRr2HIMSEEoCYmMCVvitdOx
	m4eRLQMKBYobhNoVV3djaHR1kyZ7phS3DmYWVJsXQzgPGYTG4NlRLU+dZqzI+1YQx1Q==
X-Google-Smtp-Source: AGHT+IFVbDDjII11gSvR9Q4jewkTQtbKL3ViUFZFZq0yfpKxvIKgRxHNfx519E/5M9iV986Io2UJ3g==
X-Received: by 2002:a17:90b:3c8c:b0:320:e145:26f3 with SMTP id 98e67ed59e1d1-323296f24bdmr20313460a91.8.1755434020703;
        Sun, 17 Aug 2025 05:33:40 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3232b291449sm4480912a91.0.2025.08.17.05.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 05:33:40 -0700 (PDT)
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
Subject: [PATCH v2 0/6] ONE_REG interface for SBI FWFT extension
Date: Sun, 17 Aug 2025 18:03:18 +0530
Message-ID: <20250817123324.239423-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_053341_676658_2B69E810 
X-CRM114-Status: UNSURE (   7.72  )
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

These patches can also be found in the riscv_kvm_fwft_one_reg_v2 branch
at: https://github.com/avpatel/linux.git

Changes since v1:
 - Dropped have_state in PATCH4 as suggested by Drew
 - Added Drew's Reviewed-by in appropriate patches

Anup Patel (6):
  RISC-V: KVM: Set initial value of hedeleg in kvm_arch_vcpu_create()
  RISC-V: KVM: Introduce feature specific reset for SBI FWFT
  RISC-V: KVM: Introduce optional ONE_REG callbacks for SBI extensions
  RISC-V: KVM: Move copy_sbi_ext_reg_indices() to SBI implementation
  RISC-V: KVM: Implement ONE_REG interface for SBI FWFT state
  KVM: riscv: selftests: Add SBI FWFT to get-reg-list test

 arch/riscv/include/asm/kvm_vcpu_sbi.h         |  22 +-
 arch/riscv/include/uapi/asm/kvm.h             |  14 ++
 arch/riscv/kvm/vcpu.c                         |   3 +-
 arch/riscv/kvm/vcpu_onereg.c                  |  60 +-----
 arch/riscv/kvm/vcpu_sbi.c                     | 172 ++++++++++++---
 arch/riscv/kvm/vcpu_sbi_fwft.c                | 198 ++++++++++++++++--
 arch/riscv/kvm/vcpu_sbi_sta.c                 |  63 ++++--
 .../selftests/kvm/riscv/get-reg-list.c        |  28 +++
 8 files changed, 433 insertions(+), 127 deletions(-)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
