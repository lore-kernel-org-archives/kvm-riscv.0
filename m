Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A462FC6179
	for <kvm-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 09:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WbAnhjPqUZ6YyD8KMi3oJduKEg2IzhYFV6irhojbbAM=; b=Ao8EKVw4N6z/VQ
	m4aO/c0v7+DOadGm46jF+BQrF0IuB+EH5tZGltRHhM8KAVX4Gy9E1pQXxJ1GeK1EKZ52Y7S3ZhuQS
	onn1xVHRYRuLI/wq/M/zrGpzLDxmSl3QpgELkiTA4F/okd+8orkSP7INBCF8eQrDSqe2it4wFQ7xy
	P8ftwF1LMCgoBWKHcSUs+s97jSG0Q0FfpuP3wA0qEIcuc+P45lYOKb2DuY42NfrzLy+DpnYMYCyBT
	PHJqDNPBBSPUXO2z1at/exq98pMBo2s77NosFRUk+noMy+m1ktNxImMjqM+Su/l2WfjeR4OIkaXbw
	UzAuSuJoc51OEXBurB9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbyD6-00000009A7T-3AD8;
	Sat, 03 Jan 2026 09:46:12 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbyD3-00000009A5q-0TI1
	for kvm-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 09:46:10 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a09757004cso161265805ad.3
        for <kvm-riscv@lists.infradead.org>; Sat, 03 Jan 2026 01:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767433568; x=1768038368; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JD0n/Fm55UFJQkbcsKqmkl3SnWwAZypi4Xu05/Efcno=;
        b=DZR+K7jrIB2UOjpURIsi2sAMJR83iPl42LxTHOuJ9X6Z2nMQaQjy1Ouxz1Bdwi+JOZ
         Oq+e+U/mfsMSK+dHm4G+bE7M+CavS7Dz/oW+NcIFlomwX3e5Sw1GGaqD6ox7wxXCaDwh
         8B7ebnPyipfBo92OkAkLbWYfrZU/yb1elCQRhEdHj1MbzWiKxME80VyUA/1/PUNUKZRV
         xV8906H0gHIvn6LHV6B6YKsegZkurSVe5IlH2Ai9WZHXAHMBEUn3YrXwYHP0J8aNyEfk
         EiwEm/aEM+0Dz7ssz2n7YgQK1VsMJAlykDVIBHaMI1DVSESu7IQeZhtyYrMII+M+F/Vn
         reqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767433568; x=1768038368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JD0n/Fm55UFJQkbcsKqmkl3SnWwAZypi4Xu05/Efcno=;
        b=o6tZeAXpX4kyARqTNbACRkzO6pGY5hBwMOpS/Iv8mpkBc3nteKcHh9v07bAoAMQ2Fi
         G1T8Tby57BiKoMtsw7NNc96ZyzC/dlKj30vvxki3ouAVeH6nVABsC5DxTK1xnC7+BZ+6
         WD9giKLLl/TQaPUwsAygnnO8gdSRbVrGX1SAKyI926z93orpmdvgUQbZ9YR5zORzFEyv
         vLDbYZDriSvr5d0zcbBitgC7SSHqKlS8Hw2HLSMjVxBUwILX10UImrYSA2So59A1iPv6
         VXXpo1UY6OET14339pr1hGSyHKAW53cmKVpEfM4YmblhSWilL5hZl9cWxtXfCH4cR63s
         Wlmg==
X-Forwarded-Encrypted: i=1; AJvYcCWkNKpVc2uqnW8Is/Er38To5TaF5vaw4IHRGvkmU2tKXqvoYPkzDbT72fGQ3IHaCPq1QP7TO0fkbyU=@lists.infradead.org
X-Gm-Message-State: AOJu0YznqVlbM/5EkIsuTfU3roOvYgVYZIdTN7xQxDGaI7F4deiDcLyT
	rsoJ80BmhsvQavbSpO8zAz2oSqAqpcnwVi4gaJyP40QOj5pGh55uDQzSadHMvHM4ndM=
X-Gm-Gg: AY/fxX7g43DnRlfgMEdmQ+t6S3r/4UwKXUhr6JZvEwpRNPYA9Gei5p5DQ04vkxvZPi+
	gcmaCnmhKdV48DoaiW+3qIl4GtvMvQ8i/PhP+KJYLJ0u/WipSjLovGp39i0Nq+m6Xp8r0oJd+r6
	mvoghPaaY45Vv7AxXHZZDKXio3B0GdTh3cEPYI9+A1vshlcXYO4mwPast4RsTDtDZUbhIKoON6s
	PzqSf0/GGPgW6JQkr946hlBRRXIMXlFu77KXygn2ZEwmIi1Kd2HTq7MZFoA140a/unXCi310Lmz
	NFzmmw+frllDa5eEhR5F5ftCCAzLNWLRwes/SMiI1I3s7ijXXAAWvQXRuWGT5ubWYtGaSz4EopR
	9VD0G/uJaXo9WbSJbVD571uUTKqUbJXH+H5foUbCxOZUGwB+jtII5iZpYU8Vyi+lxUnFTAJ0pNB
	j7IUrcKHfkigCTgtqzAPuNCHff9VtFOKHuM0aXH49Cy++/5gNIgTpNksm9ls1uILaq
X-Google-Smtp-Source: AGHT+IFNLzKaiu1Bm8BObCDrR25tQvlAZc+Fjmboe3LwUIgq+AoeE4YcWvhwHDPuA8YxLt19m+hacA==
X-Received: by 2002:a17:903:244f:b0:2a1:3ade:c351 with SMTP id d9443c01a7336-2a2f222bd48mr502840155ad.2.1767433567709;
        Sat, 03 Jan 2026 01:46:07 -0800 (PST)
Received: from localhost.localdomain (123-48-16-240.area55c.commufa.jp. [123.48.16.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbdasm403124315ad.65.2026.01.03.01.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 01:46:07 -0800 (PST)
From: Naohiko Shimizu <naohiko.shimizu@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	atish.patra@linux.dev,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	nick.hu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Naohiko Shimizu <naohiko.shimizu@gmail.com>
Subject: [PATCH 0/3] riscv: Fix potential spurious timer interrupts on RV32
Date: Sat,  3 Jan 2026 18:44:58 +0900
Message-Id: <20260103094501.5625-1-naohiko.shimizu@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_014609_207515_33C760F9 
X-CRM114-Status: UNSURE (   8.14  )
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

This patch series addresses a potential race condition when updating 64-bit timer comparison registers (stimecmp/vstimecmp) on RV32 systems.

According to the RISC-V Privileged Specification (specifically section 3.2.1 for mtimecmp, which applies logically to stimcmp as well), updating a 64-bit comparison register via two 32-bit writes can cause a spurious interrupt if the intermediate state is evaluated by the hardware.

Currently, the Linux kernel (including v6.12) often writes the LSB first or does not use the recommended 3-step sequence (setting LSB to 0xFFFFFFFF first) on RV32. This can lead to a transient state where Time >= Compare is incorrectly true, triggering a "ghost" pending interrupt.

Changes:

1. Fix suspend_restore_csrs to use the 3-step sequence for stimecmp.
2. Fix KVM vcpu timer updates to prevent vstimecmp hazards.
3. Fix riscv_clock_next_event in the clocksource driver.

Although this hazard is difficult to observe in QEMU due to its instruction-boundary interrupt polling, it is a critical correctness issue for physical RV32 hardware implementations with asynchronous comparators.

Signed-off-by: Naohiko Shimizu <naohiko.shimizu@gmail.com>

Naohiko Shimizu (3):
  riscv: clocksource: Fix stimecmp update hazard on RV32
  riscv: kvm: Fix vstimecmp update hazard on RV32
  riscv: suspend: Fix stimecmp update hazard on RV32

 arch/riscv/kernel/suspend.c       | 3 ++-
 arch/riscv/kvm/vcpu_timer.c       | 6 ++++--
 drivers/clocksource/timer-riscv.c | 3 ++-
 3 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
