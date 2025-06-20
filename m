Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18563C71155
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 12:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xZ+D6WvhTprU2KiuKq/wmFQ4WyA7NbfW3mFCrOTE7HI=; b=IBlyNsHhSNrj/d
	vkWkjb9BYvuFznoTCrCo48WqEB7ftEFPYaKbUURuS+eIzG6T0dTdjbwZNCJbsuxHaPQocUb6pUtIb
	4olhyC0U0Lcv01Mu/OA7W6hKYou/KeM149lVjS5KmMuJ38MPsMLJfvF3V27pPMwQyWeqA0Bb00zbi
	K8tm7ZMCMyyPkkAvb3Z5+ZsJtKv1e1jDhLT5Yzhry8rP7honLu86YFkVGXckDw37rdIxhvEWi1xr2
	yzRJKfU+JwmR/FbBN1/BQCz/HnLIIQE/vnBa4OAmFbr+h7qUaTm5jefx2I/oPv79+ZVhZO7rgqebv
	6b6MenAZ856rxRlTlrwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbJm-0000000FcOn-2sMf;
	Fri, 20 Jun 2025 12:58:06 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSah9-0000000FZ0m-2lfq
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 12:18:13 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3de2b02c69eso5785095ab.1
        for <kvm-riscv@lists.infradead.org>; Fri, 20 Jun 2025 05:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1750421890; x=1751026690; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4hugVmrBISDi3akfpzZfvuXIoYg3pJdh83x0txrI/9s=;
        b=V2wDQL7D6NrMYQmkBFVhUrnvvkXOmNQLTpcy4pE4oHzblR+tFgfZ0hEokOg7QVbrWA
         EHzQapVFct+WNvckb6fDgpxLY9gYgHs57JzcpjD2DQnhxuvcMW3FI1kXY53aoHotfyfW
         zT5mXv5Ay7E2pzRIeKuHyOWMaGHty/yhcJAvLOm30FSnwwYlRQMMCq3ojtbonlNVnORX
         lGWe52DVJdg67JdsVPIrbhseDDVGIj3fPVaqTnXqRuTX2jZazWngjRzi3a3wehnNGQRN
         f/jgj5hlWVOgpuYBTxu2jk/B9XonSx7SRJpPciPgx+5rvteYodogANwY20EqxPb0fNPN
         VwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750421890; x=1751026690;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4hugVmrBISDi3akfpzZfvuXIoYg3pJdh83x0txrI/9s=;
        b=gf2rah+VY/1fyiy8WtpcPCs/NmC1ESdRqEYB181iuo6y0f77jld+GtGjfMpjHoCxPt
         TIQqeK+5wB0j/JNBqF1+7P2PqPInebSnz72srUwrpFg/JGPRyhJt4HCsNSOHBwphfcll
         2FuUT2XrWk0BRPrIDqP4CXu9PGHrs3NF4oEw5SAvgTrlotkGMj3Zifwr6t21A0MJBHNX
         74Sg0XzUvQ607iWcHYbduSC1Mrkd4Qkhtju3SVpjS4JtVtjkNDLZ6FOZU/Kfno+iL9gS
         nRW/srtf6zZqJ+RhuyWbfPk99w/bLnKRBp7rLdYWxZkQtoIIRiWyPozfslAEN4ei6ECF
         T0hw==
X-Forwarded-Encrypted: i=1; AJvYcCXAXd2BcrjfCteVvGXGHcsYt4Tglh+wJCqc7fNFEJ9K9A+tl7sOlWNhxuiv8tZ1vDzyY1tFvEDcF3A=@lists.infradead.org
X-Gm-Message-State: AOJu0YyEhjZZqGQjgYhg3C2JMHewrBNEbAXAZ6oDmX6GuQSnTVOT638r
	A8A5DmU4djH+dEtFlgcSC94KZsuSR9mtRhiv4saSJySPOrW5HEdA8pvytetdscFjXIE1h8LS3iQ
	dSUcCsdXZpAjssMM5Zj+obQ0XO1j/2sL96pEvOvLYgA==
X-Gm-Gg: ASbGncvnCs4kFnWN+Un/V2pFL2vdz/NcdsmIdgiRLcGTXwoOEV78GXIgQeg/SAGKI2L
	09LFHDZsPi7SnKVxM3IjHJWMEkLIBrN0r8+NZt3bzvcfbORc5CRXSH5j4gQfCpSzU3NbBThYHz6
	GdhUvOFcTlPlKxWP12AMUqM7+rN2NIhG45ZT/I1oFJ8wc=
X-Google-Smtp-Source: AGHT+IGUKckbOdUcs/PEHFCfX8DaHeChlsAcllC9njuzBBFlcoE/j6rYlhRl0odIphq/zEklEHqkQQcRHcRFp0HVE3A=
X-Received: by 2002:a05:6e02:156e:b0:3dd:d7ea:ae4c with SMTP id
 e9e14a558f8ab-3de38cc75abmr25819005ab.21.1750421890334; Fri, 20 Jun 2025
 05:18:10 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 20 Jun 2025 17:47:59 +0530
X-Gm-Features: AX0GCFv5QmR6EhpuKEA0i5hObjxmRietKMEidwx9nwYmXTwXtzi8ut3dN43QQcg
Message-ID: <CAAhSdy2ZTWpx82buvGmcTp+0bXJCncQ8TCdmW7tCMC_P69GBeA@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 6.16 take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_051811_935975_CF461B70 
X-CRM114-Status: UNSURE (   5.93  )
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

We have two SBI related fixes for the 6.16 kernel which focus
on aligning the SBI RFENCE implementation with the SBI spec.

Please pull.

Regards,
Anup

The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e3267e:

  Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.16-1

for you to fetch changes up to 2e7be162996640bbe3b6da694cc064c511b8a5d9:

  RISC-V: KVM: Don't treat SBI HFENCE calls as NOPs (2025-06-17 10:18:40 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.16, take #1

- Fix the size parameter check in SBI SFENCE calls
- Don't treat SBI HFENCE calls as NOPs

----------------------------------------------------------------
Anup Patel (2):
      RISC-V: KVM: Fix the size parameter check in SBI SFENCE calls
      RISC-V: KVM: Don't treat SBI HFENCE calls as NOPs

 arch/riscv/kvm/vcpu_sbi_replace.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
