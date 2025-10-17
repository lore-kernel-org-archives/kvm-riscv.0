Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52137CCD195
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 15:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZP0/Qd6iAEoL4WPyI+5pnzFcM2DAYOthIjnzc+oIvR4=; b=fOP7LEjSZsmqTx
	/NwcM2bEPczkiZtOCm1nRoEcpak+akTjjHGXBzj+/azazeQ5aq2VmpyZWDjP2wSk22cnEJouq8d8g
	MkiQBb+UCHygJRYl+rIWAMtAETGpZ6kbN+82VA474LTa2YOB2FCvvEWKwFYxnyXXjgQtF1L4u6F7t
	6DE9/OmSiSl4rtP4/6q2Z7uoMj00KqaYAOobwzY3ADE3pUaw6x0mKTHD6M/hYqLEdsvL5kWi7TQed
	7wOV6avqDNT2qYnDPAqikszvXSf4wACi0dn4V55HqmO3A2xpuCMhaRDajnSDk6zLOFOhyiSBaf5C+
	B9cMVKh3ZqdLaHbtwZeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mrj-00000008Lds-3tun;
	Fri, 17 Oct 2025 15:59:39 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mrh-00000008LcF-0X93
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 15:59:38 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso2066387b3a.0
        for <kvm-riscv@lists.infradead.org>; Fri, 17 Oct 2025 08:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760716776; x=1761321576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C3sebnt8lI1uLFunjh62A3i8Z6IjtTbQpyFes/e/NfQ=;
        b=aKTK34o/6jVCvsXzjnbanupCWUvozISgmU5pXO+O3daj6KkcW1o2RX+scJhiU0OoYq
         LWejjDiPd9INCCadn0U969NOz+I1CqoDS2AztQLtGna8lQmlB4roa3R36EtkHy1tCR2j
         o+KW7jI939Jprc6FQGChrT89+gXWbE52eLSSuXhCUsWieSKPQ+/eS1D/bwS4P9ObLaby
         jpiB+43EbUqv54CvZS2YX1kADfGCvPazvXKLHwWVi6YZ/1XEx7GzOO0gE0cYIbS7ZXae
         HxSdXfT+oVhZKww74WuBbAtTEc3/UGBHWdBY7Xjg9P4zE0v9vYjfowGiFVB9NSa9JLx0
         Fpbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760716776; x=1761321576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C3sebnt8lI1uLFunjh62A3i8Z6IjtTbQpyFes/e/NfQ=;
        b=EoSVg7q50xnEeyCdZ9sVHg+/c7YCFzNl3edGIch0DjahgMIjJWslB/uscfpD71rRXX
         lQjpsiG2NxZtM38CC36z/eAxK2bwVPYeAKXuO5SdWirRZPB7HTHFWjWmqKWzP8yeVoWg
         lD7ex81hIyF/Iqz4eedLlWDun4+14PTQhr/YEciLywZKvC0n9bFHvJrYoHg6py96qwQW
         DpC84gPPZxDSCvo0YxLbZqxAgJ6bvhLHMJt1DI1lODsuxDKKcXZFA5VRyOa1llwVzTE3
         QCcusQ/7XOPja/BIqd/e/SCZq6YqauV2D2BzU8N72NivOxzFC/q/XaK/aENgng0+Sh/w
         IDfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7l+KLcIpQ4cHnLTI6JFFlzRMBtqMMRZzSVhZQwZSg/ZTvQU/dMi2rTjrh47Ateho1ilu7SnxEfSQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyelptRrkqo1GRzdL2rF719DWUovX3FyIm5B7MRfLOBeGqJPDnw
	97Ts6i1ndHpUEX+IZn9GxqmTOBo83hDdhKyTRwjZCYy/H7YKGJvOxW8gFcppt6KqmLSEG+cypDi
	5MY9WAh4=
X-Gm-Gg: ASbGncveU3Z89keFmuCelQs47UUfHqu3x1DXsLJSnnOm076CoaVcy+y4+/43DecDOlz
	4xQUdk0Uc6J0upODxoZBAtlMQvwROCuuJhGZiwMXUsFGhOpvrc17x1q1lXA3+y7IoCcBMYv4kxr
	0enFvGmebaOw+FtNr30q4AkDM59hqqd+yajjejxLqFoKMCCkZ9qqufHDs2slLNX3Jh8EeBBZcoP
	dpeGobUyskYwRuYj72XiatROwgF1diR4VhFsUBOrYwmzaWbZrkuYsUbV7ZaxENz9jCIylIVRXkF
	PlM6qmCyHo/KIV0eLTeMo3LLDbii3uKD3gdwwNmQZgyozJ7VnbdX2Y95r6dua5dfgNbi/nRzB4x
	lmdPE53MrN+1t6g/11B35EXCW+SMFfjcOIQ6uyV+LgueUgf+Zg5c1oamxgU9T+JLwyLZ4Co3UoA
	TIdaOu/odjoPYS+hQ8Pq7vyQWZZ5WTP/H8cVAkuKrvsm8=
X-Google-Smtp-Source: AGHT+IGXVOTATy+D04tW0ZdHIUpLbiat0j1Zpq3tC7lF/XTd5JaW53iu75rTOxxNbuFmzr3SM4KXPg==
X-Received: by 2002:a05:6a21:6d99:b0:334:9861:ba67 with SMTP id adf61e73a8af0-334a85fd82amr5481874637.34.1760716776216;
        Fri, 17 Oct 2025 08:59:36 -0700 (PDT)
Received: from localhost.localdomain ([122.171.18.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a7669392csm151067a12.18.2025.10.17.08.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 08:59:35 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/4] SBI MPXY support for KVM Guest
Date: Fri, 17 Oct 2025 21:29:21 +0530
Message-ID: <20251017155925.361560-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_085937_163969_9A56FE57 
X-CRM114-Status: UNSURE (   9.59  )
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

This series adds SBI MPXY support for KVM Guest/VM which will
enable QEMU-KVM or KVMTOOL to emulate RPMI MPXY channels for the
Guest/VM.

These patches can also be found in riscv_kvm_sbi_mpxy_v1 branch
at: https://github.com/avpatel/linux.git

Anup Patel (4):
  RISC-V: KVM: Convert kvm_riscv_vcpu_sbi_forward() into extension
    handler
  RISC-V: KVM: Add separate source for forwarded SBI extensions
  RISC-V: KVM: Add SBI MPXY extension support for Guest
  KVM: riscv: selftests: Add SBI MPXY extension to get-reg-list

 arch/riscv/include/asm/kvm_vcpu_sbi.h         |  5 ++-
 arch/riscv/include/uapi/asm/kvm.h             |  1 +
 arch/riscv/kvm/Makefile                       |  1 +
 arch/riscv/kvm/vcpu_sbi.c                     | 10 +++++-
 arch/riscv/kvm/vcpu_sbi_base.c                | 28 +--------------
 arch/riscv/kvm/vcpu_sbi_forward.c             | 34 +++++++++++++++++++
 arch/riscv/kvm/vcpu_sbi_replace.c             | 32 -----------------
 arch/riscv/kvm/vcpu_sbi_system.c              |  4 +--
 arch/riscv/kvm/vcpu_sbi_v01.c                 |  3 +-
 .../selftests/kvm/riscv/get-reg-list.c        |  4 +++
 10 files changed, 56 insertions(+), 66 deletions(-)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_forward.c

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
