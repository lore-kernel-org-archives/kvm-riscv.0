Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CB8C02183
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 07:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zkh1ENnZQsYoIsePyz6p8IxC38b5BoHNXGUq6mpEeaY=; b=LSNgXorRddWtqC
	qRa6thMPmh2QwcMckq7o2+qRE+ozhtJQrtnrjSaCJWQsrzBfaXHFmAJ50Xemb1X9YFaq+AsuwlsR9
	uK15n+f6E+wbbZ9qlUcj9dUCNqdV9UuqYzYSNnSHmePBB2igoV385k6RQQvfwiEH7pCa0wJ6TU3eu
	x76h7cAGpwznaMJiol7xx90hWfXgrsZ1B44mwtfX9K1B2LRpb+nj756nRFnbxyjSl1fex4TcgvblH
	5jCb11bSbWqn0mkPgApbSci/ucdV2YPceccnPsOb3k2e/8wg4jwFIm+Xptkje6r8QiQ/z+Qor3aor
	G/4/FMW7yeTDp0RQhsIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYgRE-0000000HA1M-3JlY;
	Fri, 17 Jan 2025 07:06:40 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYgRA-0000000HA0M-2oWn
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 07:06:38 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3ce7f6fdd2aso12546055ab.3
        for <kvm-riscv@lists.infradead.org>; Thu, 16 Jan 2025 23:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1737097595; x=1737702395; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LfYpH+Y1jpQO12PadF3pL3zexhSFdkqlBmV2LuVWqDs=;
        b=IteFj2OnGxQ5+RDLkepopzn8H3rBb7LBsXGE7nmCkthwfvA74w/vmAo0q6W9MyUWtO
         Ox8dP6tr0D+2nbe4PQ+CesJEseT6Dopp5Ik8z69OPo2Lg4tsnE9h5stkOLUOJqv6xC1L
         u+fnnME8XQlD+tL/2Xr/3gc9QpfqTrSupfMCVmCV4wnUrCIGyquSsnmyFtVKMPlhpZ0E
         mQsdOeqPE/nhrNeun5NM50Ey/sAiknOHCNXEzVztT8XzFrWsg99uw3PmPpEHqPi7EPQy
         RMeHxk6m3OOdFRfd/T2xGm5AXWbMBc5bALtfsvwzXXgJMJsJ/Pijf12VEx02oqkfqCZq
         9VMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737097595; x=1737702395;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LfYpH+Y1jpQO12PadF3pL3zexhSFdkqlBmV2LuVWqDs=;
        b=eRQekk5t1zBaNZgsk3XONz3K7lTPE6MGUO92dSQRHNMJDY+GrI/oxGt3L9izzyFAgy
         qRVRk/6l/ezhAg9nVqB7dAbOqOOF4jqwi1HA38xIOlPL0iBOxANjHpFQ6PPs9jST2lRK
         TypLy7Lrknj7bPfFYuwTifO3kfYWf04KLnUGyQvrIzpaRRWF8lbXszQwdcUUDaSuwQyT
         L/+rIMxm2JP0LeaTEBjtlNM1qrC2B2lvT78f2wkAXstdJVu1njSwZplIx/FQI+sRfRcx
         uQncYtY9vS4pNUKpFNcQi+POvyamhxtjInDdxXAyqKJtaxj/nWwJ34rwJYY3vSeufjw7
         0Lfw==
X-Forwarded-Encrypted: i=1; AJvYcCXfiBXCt3KB+8B7b42KfHKIyDQZH43k061I/z7jLiW8U8ZoiSpE/lMIGPWPjE814pKXxBRUENEQznw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwFE1XVVBAF6oM6TIZORy8T0UWp8T4hes9dAESJf3dNL7f0n5rN
	DSf6kQ9DN4QECyBY45DmXqRjjxZswx486XYzAaVyOoitk8Ephnjk4I4IMzCAcK8fSeGz+2fKkVZ
	XnKnNW+uBUroKl334K2MEB6SoWmKt50Zb0E9m2Q==
X-Gm-Gg: ASbGncu6iW/vj2ZfBRx7awCwXa23HntvAsMehOCLnT00Wy4zp6EcudnqtDuavyKd+wh
	hjYg6P0h44JaVcD4DLV2UTyckezR3YVL3mEWJiAE=
X-Google-Smtp-Source: AGHT+IF+AL3eLH94oddazC6IWMSZ5U/suLVNW1B+QIp0pFHRGvcni4BJzwXCFG3UMDaASPRqHB6/9Ut3S6E7Kq7eQYM=
X-Received: by 2002:a05:6e02:2402:b0:3a7:e0c0:5f27 with SMTP id
 e9e14a558f8ab-3cf743df906mr16474775ab.2.1737097595136; Thu, 16 Jan 2025
 23:06:35 -0800 (PST)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Jan 2025 12:36:23 +0530
X-Gm-Features: AbW1kvZIPS-DR3om7fqXj69kIV9exvX1qxrHBy8YHvK5NBpiQJVs4OBbEUSSQSw
Message-ID: <CAAhSdy1ekLq08nByCh9E-ZZsMcm7rCpkA+FyAPwvQctEgjwFZA@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 6.14
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_230636_974207_E74E163E 
X-CRM114-Status: UNSURE (   5.81  )
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

Hi Paolo,

We have the following KVM RISC-V changes for 6.14:
1) Svvptc, Zabha, and Ziccrse extension support
2) Virtualize SBI system suspend extension
3) Trap related exit statistics as SBI PMU firmware counters

Please pull.

Regards,
Anup

The following changes since commit fc033cf25e612e840e545f8d5ad2edd6ba613ed5:

  Linux 6.13-rc5 (2024-12-29 13:15:45 -0800)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.14-1

for you to fetch changes up to af79caa83f6aa41e9092292a2ba7f701e57353ec:

  RISC-V: KVM: Add new exit statstics for redirected traps (2024-12-30
14:01:02 +0530)

----------------------------------------------------------------
KVM/riscv changes for 6.14

- Svvptc, Zabha, and Ziccrse extension support for Guest/VM
- Virtualize SBI system suspend extension for Guest/VM
- Trap related exit statstics as SBI PMU firmware counters for Guest/VM

----------------------------------------------------------------
Andrew Jones (2):
      RISC-V: KVM: Add SBI system suspend support
      KVM: riscv: selftests: Add SBI SUSP to get-reg-list test

Atish Patra (2):
      RISC-V: KVM: Update firmware counters for various events
      RISC-V: KVM: Add new exit statstics for redirected traps

Quan Zhou (5):
      RISC-V: KVM: Allow Svvptc extension for Guest/VM
      RISC-V: KVM: Allow Zabha extension for Guest/VM
      RISC-V: KVM: Allow Ziccrse extension for Guest/VM
      KVM: riscv: selftests: Add Svvptc/Zabha/Ziccrse exts to get-reg-list test
      RISC-V: KVM: Redirect instruction access fault trap to guest

 arch/riscv/include/asm/kvm_host.h                |  5 ++
 arch/riscv/include/asm/kvm_vcpu_sbi.h            |  1 +
 arch/riscv/include/uapi/asm/kvm.h                |  4 ++
 arch/riscv/kvm/Makefile                          |  1 +
 arch/riscv/kvm/vcpu.c                            |  7 ++-
 arch/riscv/kvm/vcpu_exit.c                       | 37 ++++++++++--
 arch/riscv/kvm/vcpu_onereg.c                     |  6 ++
 arch/riscv/kvm/vcpu_sbi.c                        |  4 ++
 arch/riscv/kvm/vcpu_sbi_system.c                 | 73 ++++++++++++++++++++++++
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 18 +++++-
 10 files changed, 150 insertions(+), 6 deletions(-)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_system.c

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
