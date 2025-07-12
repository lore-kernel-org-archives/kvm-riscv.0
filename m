Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7872C83F20
	for <kvm-riscv@archiver.kernel.org>; Sat, 12 Jul 2025 10:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OHxsTCKXpAcu8cZ8J582ipf00V8aFDszGehyN2ZaK/E=; b=3mwakANBioEyge
	siiP4C7vOi6W7I937tT3KPkobnpFq2azOh5G4/JJ4rLMzSCcsbb/EiwA6volQvER4HBEZ6+/UEpnO
	lmDh3MsKVDGEcPIbaX7JZd+gEdcY4/x9Sr4YUONHa8Fa+AKl5SJo1x4dwtndHPiTMaObLSivsbCS3
	pbJAo5HR4prXKJL/JsN7kIxFspewLtGxEeN833XTZmRCsp8zCg8QmmXF2MSMFBn9a0UlohMbbNuEl
	YN86aD1V4pFRkY4wshPdzdcVcDhnb3FsIUGO5cwMaMOEQB35OJqXymx860aB8n3mWxX7lEgfPOdGQ
	BOEZVErj6l9Os1HRMrcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaXPg-0000000GX4p-40QY;
	Sat, 12 Jul 2025 10:25:00 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaXPd-0000000GX3z-0H1S
	for kvm-riscv@lists.infradead.org;
	Sat, 12 Jul 2025 10:24:58 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-8723a232750so259270439f.1
        for <kvm-riscv@lists.infradead.org>; Sat, 12 Jul 2025 03:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752315896; x=1752920696; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dCU4bgUbnXvZ82jiG94+o4ASlTjyH7jDB0NCEushSNM=;
        b=dFcBulG3ThFKljkpbN+JPd65yvPA3Z9silQzP6X/Wmpayq8789J1jkdTetETuZ7/mT
         JwhpuqGqkVK5gRrseL3b1Nni0mDC+nqGz2RCiqUqq9bnLTz6q9qwypfR8oBJgYIfH2ZN
         +uFkryqL+G7f0iHRIJWlz8x6CIf851eseEagkBcFrRO+rFg7WIdotMqrfgqNdooRUn6O
         Tl7SOFG8goIPFiVopPFqwQDdYlSOnP3j4MRYr0FcCGfwAomfi22602Q/hVKccNdJn/7O
         JZAVVeLqizhNNmkRiuE9IOWHdgFZAi/UnlPr7NeTdvvRmr47E7SaCUml3Jj02jw2F10c
         j4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752315896; x=1752920696;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dCU4bgUbnXvZ82jiG94+o4ASlTjyH7jDB0NCEushSNM=;
        b=eJP3LQqnMguevrripFgWGBAPRaMNN7hGH1PReFgXRwtPK4aq2yXfa+04+0o9iHUfp9
         1Difp/SHOFj+X0PaG02Avw/4Nr45wcC2E+OHSQEUrIFvGU4K5BrFiwuVItoQ/EndECgx
         I7sFlB+cRr97jefadpncFGt8AedFjCBbxPZ/cY2rYvNlgfHMV1vFBC0ydSZOZ74NSEmG
         n5QIBABAWczj2XLmDLyF+02/iB9gIakjKaxBcn8otdfHVJqC+j1yS/2O8UH/mGKw7Q4K
         Jx7OjJTJAJ7vsnvlySx1uvmuvzXOaMhdmVNzHOu8ToBcG/jBf5pwD0joFUVZmQkXvYuL
         fAVg==
X-Forwarded-Encrypted: i=1; AJvYcCXU4B30hPPha7KJxhPrIaTP7KQhSy9piEtRsARSrVxVZKur1Do+3YSrhBknul5iF2J68+8b+M6OW7g=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1Y9PejuTl50WAGayg0D/mYUJOd0tEqW5iLnav7hYuY9k8llMB
	8Ipjg6c++WTiUr9kLRvCI4qj3yP8e5aJWDrNeXi9VULPVAj9iNvtIfAsUJbdcIUm5XOrr1mmuYh
	FWlvZdheaZHYnQYeRKAoJIJVPCPYxkHMATvwAllOE+A==
X-Gm-Gg: ASbGnctoLmp6u0wjZFXgymTNYJ9F76GwAbVUrfZCjf7lqSrWIhgTWPtk1lZuBTExQwX
	maW5OJ/WSX8wczeVkdlAlSK2B7eCJCpYBbfOn/OQsa4QRAWRrGScmE4FaSquoUpJW1HuvGYFVlY
	C+t+csLYsM7X92zXMAVCW37EvIhGUFWaS9+bwdVqXcTs2ydpOwMye9vbsgC4ddwThZnAZh9IJlf
	Z6CrEYJ
X-Google-Smtp-Source: AGHT+IEUvwOlNaKX67zF7XBXGRrrgd/vBWFzhk/JvZxSzB4yGZ48rpHvRk54/YtVPkl0kw3AwxxL6yqbQX3MQBck82w=
X-Received: by 2002:a05:6602:7181:b0:85c:96a5:dc2c with SMTP id
 ca18e2360f4ac-87977fddc7emr700617539f.14.1752315895993; Sat, 12 Jul 2025
 03:24:55 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Sat, 12 Jul 2025 15:54:45 +0530
X-Gm-Features: Ac12FXyD4VQVIOuVbQptVP1NvX--8ikGpI-rs3w8axR1N5KmYegrjMtYEUm3Pag
Message-ID: <CAAhSdy3_OE=R1jhF5-KBiw4mGOqHUXHdkvyeAAR18Qm8dezavQ@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 6.16 take #2
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_032457_342895_6843D594 
X-CRM114-Status: UNSURE (   7.45  )
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

We have two more fixes for the 6.16 kernel. The first one
fixes an issue reported by Canonical [1] which turned-out
to be an issue related to timer cleanup when exiting to
user-space. The second fix addresses a race-condition
in updating HGEIE CSR when IMSIC VS-files are in-use.

Please pull.

Regards,
Anup

[1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2112578Signed-off-by

The following changes since commit d7b8f8e20813f0179d8ef519541a3527e7661d3a:

  Linux 6.16-rc5 (2025-07-06 14:10:26 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.16-2

for you to fetch changes up to 4cec89db80ba81fa4524c6449c0494b8ae08eeb0:

  RISC-V: KVM: Move HGEI[E|P] CSR access to IMSIC virtualization
(2025-07-11 18:33:27 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.16, take #2

- Disable vstimecmp before exiting to user-space
- Move HGEI[E|P] CSR access to IMSIC virtualization

----------------------------------------------------------------
Anup Patel (2):
      RISC-V: KVM: Disable vstimecmp before exiting to user-space
      RISC-V: KVM: Move HGEI[E|P] CSR access to IMSIC virtualization

 arch/riscv/include/asm/kvm_aia.h  |  4 ++-
 arch/riscv/include/asm/kvm_host.h |  3 +++
 arch/riscv/kvm/aia.c              | 51 ++++++---------------------------------
 arch/riscv/kvm/aia_imsic.c        | 45 ++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu.c             | 10 --------
 arch/riscv/kvm/vcpu_timer.c       | 16 ++++++++++++
 6 files changed, 74 insertions(+), 55 deletions(-)

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
