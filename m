Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DC3CCF9E3
	for <kvm-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 10:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lL/BwBbuh2fLYQ3NGnnGFiQI5m4E+97FV5xUYM+NORc=; b=zBXRSY8ncgQOXP
	p6NjqBpAYX2Culeq+iJrHp46P33eQ/54irnBXM5J9JTcA+LFL1QblqhkISZ5hsrlhAv3wtq2UYX9m
	hR7LdZA38nSPYK6qTCLBJnppkoPpP65xFvu5T/LGmFxMJX9vWfN9sAbLFkB61F96GdYKMXXpFK0pT
	lU24Td22CjcKEplxH/DTPeTvzGhZXxs3YASIZD2LiF+oo5mAk5uY/j/NAi8CXut0V/EsixcuOSsa2
	wyTVq7d0QKUhhOBmNEPBphbVwUSGHm7NKC/Drx+ovqJuPX2M+6fCFOXBaGLMoiphkXrqv+E8Cn9gr
	fG7ocGbWQeNxAU+06dSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCbHq-0000000BCke-415T;
	Sat, 25 Oct 2025 10:14:14 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCbHn-0000000BCig-36gA
	for kvm-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 10:14:13 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-930cfdfabb3so188966139f.1
        for <kvm-riscv@lists.infradead.org>; Sat, 25 Oct 2025 03:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1761387250; x=1761992050; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wN5MsaqKfRbeYqcIv/KVHd41EL8Y3jzy/bgpR/o5GyI=;
        b=vpELyfhq9uTRuB7/1X4tgwvIwTVSpW6lDLOG33z10hQB8BBog+iP/de0TUvLI1KaTw
         lrLQ7CUfn9wiAWzmXg/SZHPxuO5DVd/5sih1lqNr0ekTjFLFcB3pK4OhKli4m3dhRlBZ
         MsoHctCATd59+UPKkkX1BvSeC6YeaSLI6DrpyAyOyRgLsHJ6YQmnOeplqFIxFpn3fHdl
         KhjgXC3wvokNMwSfOfVUst8+kKZw7JWM2qKDtI8lqpO8PKSIkTtjWgJMBv5rIraxMGtH
         hUOSu811oR+FsNw+RNphlQFPaEyCSf4iDN9w6IIXL93YNuRrTDrX8PsDKJxrqueFBWyf
         HKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761387250; x=1761992050;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wN5MsaqKfRbeYqcIv/KVHd41EL8Y3jzy/bgpR/o5GyI=;
        b=oOrmgKslHqXOX5rhO5PYyNRoslR6QIHIDUjTgl0ktBnG5XWgr8v+673L+3B/MLddcT
         1jFbsfdowSfketPe/94wN5tCAde0oUm5yXGasXXcorEC0dSXYcATyuKsALMg9/nys8by
         +wuR0rcF/i2pVRwWFu6b8ijNwGszrPQ9CCIUVBp0eJ8dMF/+rvvDvOmcCI/mcoTMQaaY
         rGv4IT2kCnTtBgBWB20BTVbmu8JkTmbAyMgKV7NFQHO8eTRRl47XJCtw5WjvO+oTLs1b
         CC+r7h60zC05uQxiOkphoY0g16VVe+OMMWgUlaT9rTwNKFR3Y078S/v+CG9MC2+OJmeM
         6p5A==
X-Forwarded-Encrypted: i=1; AJvYcCVRKokkFSJSjvqbBjg4yxNhmWcV7o0lRVoqY3iGlkSg5KIpMP2x/Bt/JQuP2SuoNwmCRSpJbWEQqqs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzvDsMTcCH+Hz8Gl8+cZ4LFR1bn+FoIGR0z5eBbrfNORd50xsOY
	37ZinYqT7q+I2ibdozXxRWFMLTq6lIrm2icnK3fSz/w5qzRPrtODNpBWMyxqLxJ2wmLiTOzV8FF
	d1ny0L+DlqlpzFl1cAU8TsaSZxkk4ktY+MlyY4KmNrg==
X-Gm-Gg: ASbGnctNeUuMaERXFPethvx/MGP6CajeCOgKkHbpgoCMspB3A1ETCEEK1PWVRzoLe1n
	JV6GT8pLaGc9IX5tp9DB+HhPHKGdGhq0gYzDPwMLWs8QvLcwYFmumLKtpJQeSQH07j3qTCpjdYv
	3Pgc/SbjBUYRM0wt8OBPZQE5oBJKD15XkVlOfcKT+zxz5Au5F+tue+kwifLr4LdZDpiKfYhWTTe
	MPp8rZi48iWCbHYG19fzkgIlsZuVLzUXAX6racFCKjLyKeY1E3vqREemZi7NCLfZ1y/3KKOwdNK
	f0bHXPcuNRfXNDAbq++o1ad7i9gA
X-Google-Smtp-Source: AGHT+IFpWZVjRCuwhb4DtOufiG7BXJsKl5vIHXR0e6zokP9kahb0yrltoaSSXtmlHhJhQihxphgaQ1Awrp0N48kr/R0=
X-Received: by 2002:a05:6e02:1786:b0:430:bf84:e94c with SMTP id
 e9e14a558f8ab-431eb67c444mr59866215ab.13.1761387250503; Sat, 25 Oct 2025
 03:14:10 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Sat, 25 Oct 2025 15:43:58 +0530
X-Gm-Features: AWmQ_bmwq2oGHjBSLEnWv7bNvD-fJRrO3lgDsBq83C5kNERHDGX9jLhLgFP3WlI
Message-ID: <CAAhSdy1jcXypH3yCUBaci2EbOy2cbr2qNtdYriKa-vcyFFeCzg@mail.gmail.com>
Subject: [GIT PULL v2] KVM/riscv fixes for 6.18 take #2
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_031412_016897_1DA566BD 
X-CRM114-Status: UNSURE (   6.64  )
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

We have three fixes for the 6.18 kernel. Two of these
are related to checking pending interrupts whereas
the third one removes automatic I/O mapping from
kvm_arch_prepare_memory_region().

Please pull.

Regards,
Anup

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.18-2

for you to fetch changes up to 8c5fa3764facaad6d38336e90f406c2c11d69733:

  RISC-V: KVM: Remove automatic I/O mapping for VM_PFNMAP (2025-10-24
21:24:36 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.18, take #2

- Fix check for local interrupts on riscv32
- Read HGEIP CSR on the correct cpu when checking for IMSIC interrupts
- Remove automatic I/O mapping from kvm_arch_prepare_memory_region()

----------------------------------------------------------------
Fangyu Yu (2):
      RISC-V: KVM: Read HGEIP CSR on the correct cpu
      RISC-V: KVM: Remove automatic I/O mapping for VM_PFNMAP

Samuel Holland (1):
      RISC-V: KVM: Fix check for local interrupts on riscv32

 arch/riscv/kvm/aia_imsic.c | 16 ++++++++++++++--
 arch/riscv/kvm/mmu.c       | 25 ++-----------------------
 arch/riscv/kvm/vcpu.c      |  2 +-
 3 files changed, 17 insertions(+), 26 deletions(-)

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
