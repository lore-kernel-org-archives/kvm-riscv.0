Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65017C369DC
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 08:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6TkgSbJhTPtl05EZ8ryiz3Zlm7RlZ93WTwlYo660R9Y=; b=ioc4QyWf/XRS7J
	sDASyqwzmpU96qKkC9X5mnNwIvcXLTm7AoEYEd911ATwMfSKWxiVLDuzpBnBXqaMjBs+z5j5x5Ead
	pWd8zEggq3dPqL78osD6DHo+KQle3bK6Uy2s3pfhmjwqerW8esaU8eGRwMnvyk1v5ZJKDyGo85fG7
	j64MGWOY169/Tut1BbUwvjjvyQdBNFVSbdG1FfxWWQQdPREByr9V8ihlS3tBfGXPcamPhWOHIi3Yl
	imrbUcYQFjl5LKA5xvPFW1eGH6TlyH4gY/xvc7dtuYP4nZu5dS88hJO/3jEV425ByqtapT92N2oXo
	SXqsTvTBYXiOU6QWyO+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2op-0000000C9TT-3evo;
	Wed, 30 Apr 2025 08:29:27 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2cN-0000000C7Jh-1nH3
	for kvm-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 08:16:37 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-736b350a22cso6056187b3a.1
        for <kvm-riscv@lists.infradead.org>; Wed, 30 Apr 2025 01:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746000994; x=1746605794; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qsXzG0OPFSj9Y/N7ILSDxyejpILMY8rt11Cw8ETnit0=;
        b=BAe/rBhcKKnnSmnJP36NPQxOL7QRzZsjpOOcs8yH8+qamft3oDDHwKknJWYmP4Ein0
         SNkZaOxq2XIkGlEJTCx+inQVDG6x3NnuLNK8aTfYJ6a3P1ZPgWOnnZtWytccuhnUGSrT
         fkjCMewefFb0MI2NgvQCRCEk2+NZIvaZ8AcuVgtr+BqKmYxpFxAum3zbnC033pku6VhT
         wURVf0oPMhOZKxLGkCv8fWcrgDv/fHrwpgdRjcS3e6RDHUiy1vr+1P98k3AHNcmWv4/T
         0iJVgMX2+zFwslrGL5JtpSp2zrpfZECTsCWaDRlL/NzGLOw9siVQ8pJWbc8svh5NCjKp
         7VNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746000994; x=1746605794;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsXzG0OPFSj9Y/N7ILSDxyejpILMY8rt11Cw8ETnit0=;
        b=a6yDBYhHW1rZxqwPIwD/i/Io7k6pMe4LWmRlJy0a0bCXRgNhRsfsD3yV/4nE+JSOOs
         jvZpUUFV6ajlgWdqtKsCaGXgQYf+xD32KZAbsQk5X8nCT+Bo265DymkOa0Vg6BKKzbu+
         7D+LA4QhkdzishBlr6A/TsEZx91ehKZkuwQ3ALA8Yrpml2Z5BWhU2Q0lkVy/K3aWr7eH
         4aTqbZGvXRH+ha1DoW2XVzVGqtwUa53PUnPTZEP/BlxhMP1e/1x48E1sNS27UuNjF+cN
         IuvUX5LlewJ9jMI6RMLqLI3/bVTgJaLqoV/MjjQMgu9XM4O4U+r1uUL6qAUDZrkx3yff
         kRTg==
X-Forwarded-Encrypted: i=1; AJvYcCUUMnvd+CPVmZoN5o3oFCgsfka80iFi6ihsySj/H/+WIQQ+ltB9L01IQWI7EhlTRAHrbV9ke85UMpA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2R9XOTYdJcGwPw2P2nRo22/TiX7u1RarqleWkCMh6W20aofp7
	CgGEs0Wch3BGAviCJrOKgzYi0g7quJbI17zMO8/Beg9AJVuH7CYNIrvxX7sg5N8=
X-Gm-Gg: ASbGncs4S+Gil5488Kqu2tjs8YhM/fyEXL4YZ4kpUZOc6Bntf5/lynLMRb29x/oXxpm
	rQK1HtXzKsx+b7kaCs/sOWPSc2C6whYdW/js5GbZNNQx//+xKSTqk/m2G0iPup3PQ2aTlFBrTfr
	XQy0fRAjLz794bt31wuMNDNIglvXPKmXoCf5XndkBl2S49Q50eHomrvk9wqIW8gLHHQaOi77yxa
	akhOxYInvxbKbOUQDJuSxBtRZAe+VwD4TcmdYzCqe8fR1nwUxP3SarMlx+Ww4z9SEi9RGJoDz3Q
	bqThDNPqPgjy0aHU2csvkv2lhzMwRPeUqZVKMbGGhXHZg2Wd1IFrug==
X-Google-Smtp-Source: AGHT+IH6seQgwJqi/FP/vswGEFmbX1nzlJ/wu6PVrapojvhfM+Yipa5sWjHxHBJfv7qDYrJjbCoowA==
X-Received: by 2002:a05:6a00:1146:b0:736:7270:4d18 with SMTP id d2e1a72fcca58-740389bbc36mr3347820b3a.14.1746000994070;
        Wed, 30 Apr 2025 01:16:34 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a309edsm1073084b3a.91.2025.04.30.01.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:16:33 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 0/3] RISC-V KVM selftests improvements
Date: Wed, 30 Apr 2025 01:16:27 -0700
Message-Id: <20250430-kvm_selftest_improve-v3-0-eea270ff080b@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFvcEWgC/4XNSwrCMBCA4auUrI3k1WpceQ+R0jYTO2iakpSgl
 N7dtBtBEJf/MPPNTCIEhEhOxUwCJIzohxxyV5Cub4YbUDS5iWCiZFIoek+ujvCwE8SpRjcGn4D
 qFkyrLWsqI0k+HQNYfG7s5Zq7xzj58Nq+JL5O/4CJU0bLo6zyGtdG2XPA5CMO3b7zjqxmEh9HC
 f3DEavDD1xazYGp5stZluUNvbqg9gMBAAA=
X-Change-ID: 20250324-kvm_selftest_improve-9bedb9f0a6d3
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_011635_594788_AEA067AE 
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

This series improves the following tests.
1. Get-reg-list : Adds vector support
2. SBI PMU test : Distinguish between different types of illegal exception

The first patch is just helper patch that adds stval support during
exception handling.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Changes in v3:
- Dropped the redundant macros and rv32 specific csr details. 
- Changed to vcpu_get_reg from __vcpu_get_reg based on suggestion from Drew.
- Added RB tags from Drew.
- Link to v2: https://lore.kernel.org/r/20250429-kvm_selftest_improve-v2-0-51713f91e04a@rivosinc.com

Changes in v2:
- Rebased on top of Linux 6.15-rc4
- Changed from ex_regs to pt_regs based on Drew's suggestion. 
- Dropped Anup's review on PATCH1 as it is significantly changed from last review.
- Moved the instruction decoding macros to a common header file.
- Improved the vector reg list test as per the feedback.
- Link to v1: https://lore.kernel.org/r/20250324-kvm_selftest_improve-v1-0-583620219d4f@rivosinc.com

---
Atish Patra (3):
      KVM: riscv: selftests: Align the trap information wiht pt_regs
      KVM: riscv: selftests: Decode stval to identify exact exception type
      KVM: riscv: selftests: Add vector extension tests

 .../selftests/kvm/include/riscv/processor.h        |  23 +++-
 tools/testing/selftests/kvm/lib/riscv/handlers.S   | 139 +++++++++++----------
 tools/testing/selftests/kvm/lib/riscv/processor.c  |   2 +-
 tools/testing/selftests/kvm/riscv/arch_timer.c     |   2 +-
 tools/testing/selftests/kvm/riscv/ebreak_test.c    |   2 +-
 tools/testing/selftests/kvm/riscv/get-reg-list.c   | 132 +++++++++++++++++++
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c   |  24 +++-
 7 files changed, 247 insertions(+), 77 deletions(-)
---
base-commit: f15d97df5afae16f40ecef942031235d1c6ba14f
change-id: 20250324-kvm_selftest_improve-9bedb9f0a6d3
--
Regards,
Atish patra


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
