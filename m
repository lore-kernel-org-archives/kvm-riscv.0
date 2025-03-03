Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB6FC282C6
	for <kvm-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 22:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n4aEb0KrWsRUVi+7FIV9lzDSqR96Cgw4GQ5uHUC5OvA=; b=1Bq9wPgPCGNQPL
	c2/4x+3NQwi+NgThGemlI/MbEKw3iFnhh/CE7WVavRFyCCeNBH1IfozIVjc0oQn44uBzq0oCya9aZ
	Wac+q4sFMmm+3+SzIsWtXc3PiR8x+uhOsEUjvfX5EIq8pH9Nbai1xE2IfVzPcAyg77TFNTtZNurnP
	hSL5J+owKtVtAJWo/Ym58sG67e0iLsldz+C11XGeoDpwDXF3TTiXI8FXpoIJYhbNJ0++LbmixuRgz
	y+tYvHpbIllZMueYU+NE52ChG/VkiknCOnTM1KD1G3G4l7D0i3WV40MndapQ531/ZOBMSvyXl9p02
	P2puDcBRlt+zByC4ICKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpEey-00000002Vyj-2hWj;
	Mon, 03 Mar 2025 22:53:16 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpEev-00000002Vvf-1ZrZ
	for kvm-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 22:53:15 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-223480ea43aso123999055ad.1
        for <kvm-riscv@lists.infradead.org>; Mon, 03 Mar 2025 14:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741042392; x=1741647192; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rHRREGcSp2krqTtJr5eO01PBlpy/oFOdFDc6Qvhwm80=;
        b=QHAtYYEOhLs1F4RBuz6r2gFQkm+jg61vJj20OT0ga8tirYhbSqG2IzqrLSBPWyDpLL
         9feZI+SrhMOlG5Nd/bCdZWpt5MH3MZAa+M50lFi7y9Ny0AiCloUb5nkCqDi3wED14rqs
         rEYJAfhrFDMhSudRo8flxItBSTB6gZ11nViNCcCRiNIFrQ+y/nD6D+hEOxUlNUflOY0h
         +VXU3FUvkqQVOLwuMgR1B1L74ldTFtGAZ0lAQLM+2PBwFIKphRI2TqkZKbrE8x5Uted+
         7pksdV9h3bTPuiaF03w4wQ5Z2aStPlPg1pTCEKOBufviPiAk5ZnA9ZOGOFI21cGeYM7i
         uCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741042392; x=1741647192;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rHRREGcSp2krqTtJr5eO01PBlpy/oFOdFDc6Qvhwm80=;
        b=dk03Ur6ZKDHpPpGlxNs2Ed4oyMLi7lYRHr5drzsNvWy6ChVAeq+I2Wx/5cskeEa8hC
         rJiyxt7VoprCXzrlhgN2rc/eurfXag9hz4RcHDBa7PzW6k9oFEh2VN4isLkzjArIB/m5
         q6aLsYMJxvp6djtL1jsdSzLUPCYbon53agheE3C4P5yh9HlM66i92KVAM9Hd7tjtw6xH
         Gx0gc8ynroTf3gvaZilu9XC/FArHn+jh8LfGgsqvRjKNRdJUZ9BRqaH2X8RcNz1fe+d3
         lnHK6vBK/0QMxZTTYeEhc1t+PSkOreKkaBzcl2lTdn+evbHdU0Nn9PS0mxZf5AcoI7VA
         b5Cg==
X-Forwarded-Encrypted: i=1; AJvYcCVuYkYfKKc8QZf9+o5AAQ14+JOJhIEZeIIXkzTHP09nPo2YSiBxMs5zFbfMw/ujBmwVfZNjQi45P1I=@lists.infradead.org
X-Gm-Message-State: AOJu0YxSTYnAN7MRbM8zhwyRl+Qqf5SX0HuLmyMGLKOEiapthpqtFYK3
	ORAEMalzzBereBLaDadji2xF1j90lFkS077leH8BjkWHWnfbe26EzNCv5OJO1AUEMfdBGEr0TlY
	i
X-Gm-Gg: ASbGnct0tSZNAvl+dXDUp5qJFjoNnp7CN5xlix1pzAiJbRVQsFpH8roxfaj9rPYyzoX
	Nuv3ph2ref6uMPVB0PPdfk2jQAOsLzFnYiEoo3G+DvdVbOhoGKfh2AI9b6h6S9j8/Q+FxfBEX7o
	7103QyVigAC2VjRI59fj51/XWeN1kQ0snO7H6tmRGXQ85QvZYNMxb+AQ5VV/cM7o9Pzs8WwHHHE
	afTZErTn6nHo6SVg4i5YYOTWdb2cGM3xgkURSXvot45G/W+EQVB0nhlNQWyp81jkIglCUFfd3jk
	NV1/nrUz0lUP20Oh8YG1b5RzbCIGdHSDvjqL411gJLAA2SF5iU7cj3wN8Q==
X-Google-Smtp-Source: AGHT+IFTnPiC8gGn23TPq+Loy5LwqUVXrpZ/genl7BFYk1BAOqQRQeXw3l+mF/ky73QXi/CT689qMQ==
X-Received: by 2002:a05:6a00:a91:b0:731:e974:f9c2 with SMTP id d2e1a72fcca58-734abed5bbfmr23190306b3a.0.1741042391979;
        Mon, 03 Mar 2025 14:53:11 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a003eb4fsm9440601b3a.129.2025.03.03.14.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 14:53:11 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 0/4] RISC-V KVM PMU fix and selftest improvement
Date: Mon, 03 Mar 2025 14:53:05 -0800
Message-Id: <20250303-kvm_pmu_improve-v2-0-41d177e45929@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANEyxmcC/2WNywrCMBBFf6XM2kg6JrW48j+kFJuHHSRNSDQoJ
 f9uLLhyeQ7cc1dIJpJJcGpWiCZTIr9UwF0Dar4uN8NIVwbkKDmiZPfsxuCeI7kQfTbMWqv5oZ9
 QcAF1FaKx9NqKl6HyTOnh43s7yO3X/lrdXyu3jLOjUFz2Cifb6XOk7BMtaq+8g6GU8gGwP2/cs
 QAAAA==
X-Change-ID: 20250225-kvm_pmu_improve-fffd038b2404
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_145313_407340_5B0BC48F 
X-CRM114-Status: UNSURE (   9.08  )
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

This series adds a fix for KVM PMU code and improves the pmu selftest
by allowing generating precise number of interrupts. It also provided
another additional option to the overflow test that allows user to
generate custom number of LCOFI interrupts.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Changes in v2:
- Initialized the local overflow irq variable to 0 indicate that it's not a
  allowed value. 
- Moved the introduction of argument option `n` to the last patch. 
- Link to v1: https://lore.kernel.org/r/20250226-kvm_pmu_improve-v1-0-74c058c2bf6d@rivosinc.com

---
Atish Patra (4):
      RISC-V: KVM: Disable the kernel perf counter during configure
      KVM: riscv: selftests: Do not start the counter in the overflow handler
      KVM: riscv: selftests: Change command line option
      KVM: riscv: selftests: Allow number of interrupts to be configurable

 arch/riscv/kvm/vcpu_pmu.c                        |  1 +
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 81 ++++++++++++++++--------
 2 files changed, 57 insertions(+), 25 deletions(-)
---
base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
change-id: 20250225-kvm_pmu_improve-fffd038b2404
--
Regards,
Atish patra


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
