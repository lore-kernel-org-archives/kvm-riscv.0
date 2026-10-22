Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFFD606A327
	for <kvm-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 12:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bBnB8GKP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=pIdIpCNx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=VK7zPGZc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OsS3pthc5C64ELiMz2ctKVJmeJFNqYGrYxmwPqA0k8Q=; b=bBnB8GKPUKVJvSAeDMbxVZeJuo
	yB2/tPqtEV0QzoLEd1H+UiiyblZnlTJbrDqzr9afVMuxJo2kWQ3Q3OyHNtuwphdA32tTQ9t8pbSWh
	awarkCFhqOI8RzJUUdUDA2cSSE5MmpZuMwvZBA+ekLM7N54FT2AoDS5XEVaedd2//Lej2jn+Zl007
	8Zb4uVjQcXur7XRJ/w+S9iPqmslq22e0kU7FfYc7i4aFRVXJTmdWik+DzSP72eZc0C0W2rx/4NFJQ
	mK7EkBwqBQFuHFx4f/Ju6RCS/nWk9Q38yPrNVdKIzxJFlQjGPlvdXHZ7KTtsAkVjFbDPvbNtL2mgm
	qAbI0ODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsGj-0000000E6DN-3sSF;
	Thu, 22 Oct 2026 12:51:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsGi-0000000E6BI-26WZ
	for kvm-riscv@bombadil.infradead.org;
	Thu, 22 Oct 2026 12:51:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=lkhWzDFxqaEySec5iIKN1ckUu+fpCVqgL2+r7zgE9p0=; b=pIdIpCNxhngR0sp4XQe1e5cY7v
	tkqxyyNgi9R/jO0iR67LMY66t53i4imtF3O9VzXTX2ky/H1INX/FlULbds/s8HozkP0lHtJPK7blu
	6+u1Cl93tzubh++AQh3cc4+IWa07CfjQpBQf4974fW98N9OK9VPRzp2LE9xkrU3EwTwls6FUgiKnO
	I84f27J8KTPwj6AmEIKp9EItmjuJCtuS2aLTDd5K9c0tzi/Txsoe6Xop1OMP95yCntl8oX6pOL3sy
	ZG8ya91V6R4zvOQ2YSvRLxbYhGKgopH+ZtTR05OImSg6zfCR4g244Io1j5LJV2bg0S5eTAkqJe6f1
	iuIi/OZA==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsGd-000000077Nk-1tHH
	for kvm-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 12:51:38 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso21110575e9.2
        for <kvm-riscv@lists.infradead.org>; Thu, 22 Oct 2026 05:51:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792673491; cv=none;
        d=google.com; s=arc-20260327;
        b=A/JCr96q6QTbyUE01XBdrJt09KrR63zJpEqRudaO7YMI6xEr4EL3YVk3JIaFjFeqj2
         dWJGL+dj1d0ueC/tg9RTZIn3P22O1Z+VkQUNb37v7hOWhC6o84Aya1XF/D8PUJgqhfkz
         d5DE8FuD4enq7FGn5kINVfdVGNfS/8mQhirGzOzrgRTSYegBbI5y/CpRlHuN4YJFjdOD
         v8dtXOLGYXWlMYg/Shq7RoUbSO9zsN342oM32IGOQdelhA5rsm4wASdhCK/jMxU7yj2k
         18HC7q9JxiR64fd29Upkt1tozk5QA8a5r86MsQn9SzRhuur+LNQUY3o7XikiwwJkxz8H
         zatQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=lkhWzDFxqaEySec5iIKN1ckUu+fpCVqgL2+r7zgE9p0=;
        fh=1GnK4s5A393Ff/zPz+X9r4GlaaTxV9yBkD68H8iPZvo=;
        b=DaHaAx5D+n1e9Ci66EoOUXBlXSHiLQc6Qc9OCB7cX2uf7d9AjejFunuVzDMY9MSLRQ
         AyvI4XQ4wPMz7A6cdBbd9PPwzFnhSZFzjs/NyAForrvincs3wBuQGDBrqJSB0mdZrfln
         hXSregCbwDQy20LmRGKEe2XkdZqQPvJeoBGq5tMOJuAX4cpGgYn/9tplOeoAPOL6+i0r
         1YfUYindt8NkeshF3k4FY/bEojg6cVunNrhHj8mzwufHOKyehKJbpopAGsS/QS4fuLei
         7YxvCc696Mwt10/bhoPztJTEtZ3Kjn4mCQhqrw3OwfJ6kd5I9tWcIB707oJfdKUm2yvD
         fhJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792673491; x=1793278291; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lkhWzDFxqaEySec5iIKN1ckUu+fpCVqgL2+r7zgE9p0=;
        b=VK7zPGZcMs2qvORD9ax2WsidWPTFpM2i6g8uJ/FvpX5VrcMDe+yDvJpKLTvlG9yj2Q
         SW+zs+XQawug4CCsg+9pPKi853RZuSUxvSbRX1VPJXx6kUhvi8InTsr2onUWA0gVv4X3
         H0QOrqLk10b9BX6xV3TYr0othyjDjprqt28xsdhSSY0nkhWeVWVbAbRJawp3goVx9F3T
         qFFgXbZ6FTibVK++XdWNLRG4w/dfQb/WPNORDpN88CTDT0AtWpxNtR/rZ94qAkex0Syc
         xZF0w7ucw0XTkfYR+LvKYrXy9QgIwRqmvr9HtGeCo+975NFjQk0X1B65qeihqaZ/nu3m
         dqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673491; x=1793278291;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lkhWzDFxqaEySec5iIKN1ckUu+fpCVqgL2+r7zgE9p0=;
        b=bY+71qtrjbyHj+mu1f7U+/oUCMWkbXTWa1AxKX540orH52B3ldp/CBDgupRhzhRxBn
         eKaonGH/ppkvxf6BK2XtOD6Q/wCw0R304mfxQDK+3NRIXVK5vNxQWB1OtsARbJlac6HL
         LlPqxcTve9yk/wSbUH6OXycc4AsSvcT+bHZYjHL7AReFNIs0AQEls4GZbVA203en8wxI
         Ei57Cg+9I4VFiIZADmlvJRngeZEks0NPWgLAs6lNgPubF5OoplW8yT0IIUwtjIiVuq2z
         82k2TeqCKXzZdECX/eB0PD0C17tHRJq/tlqKAEqsCDb4zOxKSr19VY3GCBCMucOWco//
         w1YA==
X-Forwarded-Encrypted: i=1; AKwUvByVbjt1X7EpBvjrNcb60E01/gdAhqoVrOGp0tw5OG0pJb/Gfdb1sFtBz3/MRkT1oImjGQk2YvrFrAk=@lists.infradead.org
X-Gm-Message-State: AFq9FYI61W5LwVCjb+Vs5FkRITqaYcaTuJ6mwmPYOWiU/HMANRRX86A9
	MFhO+Nldq9e74IuAlaBWxOTO/zM/W4FYgYfPwZc4+F7FCjYdwQQ2OAIeOp7LLphrZ5PCqF0oDgz
	IwNPKx1cd2qN8Elk/sMN1spOMAUIZ9IskTnxiFAQrvg==
X-Gm-Gg: AYBFou0TW8Q5lQ83t8FEgjSzflpVLUZE+fML/eSsxE83ss0u0CExMh4IfnmwEUnJ+m9
	j52tJj2/i6pB9R6+FeFOffMgcvyEJlj5AO9OiFksr1dGStxNEpiraNSV0krMMdHc+DbAbc3VvIO
	nQSVulGf3kO5FDPm+ykmjHXAlN8iczk4uM8yM4nvYhhFU92H5RoqH9tRsfeGYzQvqxGkzKVhCiC
	zwWkmd+gptQMM9wq0mFSMXBHpwI2rkJ7a5Z6gWRPvQxnKu2tWhYxPRGxkCWvIkdneGrNMbkXSnQ
	67hYoGVi6C3dWmsmuKEliAfHMiuoIjj3AduElOfPEz9haphUgsYYYOpXxIILisTlqAbH2LPJdzc
	OM89dCjcl4adhLl0GNzhacqbhF62FV0203k5sZxeU0z5xPiYImqoaUC6wKPoRvLhZ8YDRSaz1Yi
	0Fj23Rb/lnSOIwRAj2pwY5Ugxv+ADHyRr+Qiwg7dDNgakyaJQPEg22xAY=
X-Received: by 2002:a05:600c:3513:b0:4a1:cedc:ab49 with SMTP id
 5b1f17b1804b1-4a1fdd1e97emr110310385e9.31.1792673491312; Thu, 22 Oct 2026
 05:51:31 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Thu, 22 Oct 2026 18:21:19 +0530
X-Gm-Features: AclHuK8tY4cnQo19_qXz-4M4enDNV7jYzKlMWWGhWHS4NdQgPAJSZrkmDICrIVs
Message-ID: <CAAhSdy1zNA7Xn9Uv1fFTRJMuCP0Pd2xLQazzm2FedTo_DZwMCA@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 7.4
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Atish Patra <atish.patra@linux.dev>, 
	"KVM RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_135136_813040_C1D11ECD 
X-CRM114-Status: GOOD (  10.27  )
X-Spam-Score: -0.2 (/)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Paolo,

I was on vacation last week; hence, I am sending
the KVM RISC-V 7.4 PR a bit late. Apologies for
the inconvenience.

We have the following KVM RISC-V changes for 7.4:
1) Lazy V-extension enablement for KVM selftests
2) Implement KVM_PRE_FAULT_MEMORY ioctl() and enable corresponding KVM selftests
3) Show sepc/scause/stval CSRs in KVM selftests vcpu dump
4) Use a raw lock for IMSIC wakeup state
5) Reject vCPU creation after AIA initialization
6) Updated next branch name in KVM/riscv MAINTAINERS entry
7) Allow Zicclsm, Ziccamoa, Ziccif, Za64rs for KVM guest

In addition to the above, we also have the following fixes
and minor improvements:
1) Avoid redundant interrupt check for pending timers
2) Fix build with vector support disabled
3) Fix IPI delivery for out-of-order vcpu_id
4) Replace imsic switch-case macros with range checks

Please pull.

Regards,
Anup

The following changes since commit 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e:

  Linux 7.3-rc5 (2026-09-27 13:55:01 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-7.4-1

for you to fetch changes up to 633b3931a87438282d6454646ff40c669a6896cb:

  KVM: riscv: selftest: add Zicclsm, Ziccamoa, Ziccif, Za64rs
(2026-10-22 13:01:31 +0530)

----------------------------------------------------------------
KVM/riscv changes for 7.4

- Lazy V-extension enablement for KVM selftests
- Avoid redundant interrupt check for pending timers
- Implement KVM_PRE_FAULT_MEMORY ioctl() and enable corresponding KVM selftests
- Show sepc/scause/stval CSRs in KVM selftests vcpu dump
- Reject vCPU creation after AIA initialization
- Fix build with vector support disabled
- Fix IPI delivery for out-of-order vcpu_id
- Replace imsic switch-case macros with range checks
- Use a raw lock for IMSIC wakeup state
- Reject vCPU creation after AIA initialization
- Updated next branch name in KVM/riscv MAINTAINERS entry
- Allow Zicclsm, Ziccamoa, Ziccif, Za64rs for KVM guest

----------------------------------------------------------------
Andrew Jones (2):
      RISC-V: KVM: Reject vCPU creation after AIA initialization
      RISC-V: KVM: Use a raw lock for IMSIC wakeup state

Heinrich Schuchardt (2):
      RISC-V: KVM: Allow Zicclsm, Ziccamoa, Ziccif, Za64rs in guest
      KVM: riscv: selftest: add Zicclsm, Ziccamoa, Ziccif, Za64rs

Jinyu Tang (4):
      KVM: riscv: Avoid redundant interrupt check for pending timers
      KVM: riscv: Implement KVM_PRE_FAULT_MEMORY
      KVM: selftests: Add RISC-V Sv57 page table indexing
      KVM: selftests: Enable pre_fault_memory_test for RISC-V

Matthias Goergens (1):
      MAINTAINERS: name the kvm-riscv/linux riscv_kvm_next branch

Stefan Butz (1):
      RISC-V: KVM: Don't write MMIO load result to x0

Xiaofeng Yuan (2):
      RISC-V: KVM: Fix IPI delivery for out-of-order vcpu_id
      RISC-V: KVM: Replace imsic switch-case macros with range checks

Yong-Xuan Wang (1):
      KVM: riscv: selftests: Dump sepc/scause/stval on vcpu_arch_dump()

Zhanpeng Zhang (1):
      RISC-V: KVM: Fix build with vector support disabled

jinrui (1):
      KVM: selftests: riscv: Add lazy V extension enablement for guests

 MAINTAINERS                                        |   2 +-
 arch/riscv/include/asm/kvm_vcpu_vector.h           |   6 +-
 arch/riscv/include/uapi/asm/kvm.h                  |   4 +
 arch/riscv/kvm/Kconfig                             |   1 +
 arch/riscv/kvm/aia_imsic.c                         | 149 +++++----------------
 arch/riscv/kvm/gstage.c                            |   6 +-
 arch/riscv/kvm/isa.c                               |   8 ++
 arch/riscv/kvm/mmu.c                               |  42 ++++++
 arch/riscv/kvm/vcpu.c                              |   3 +
 arch/riscv/kvm/vcpu_insn.c                         |   2 +-
 arch/riscv/kvm/vcpu_sbi_replace.c                  |  12 +-
 arch/riscv/kvm/vcpu_timer.c                        |   6 +-
 arch/riscv/kvm/vm.c                                |   1 +
 tools/testing/selftests/kvm/Makefile.kvm           |   1 +
 .../selftests/kvm/include/riscv/processor.h        |  19 +++
 tools/testing/selftests/kvm/lib/riscv/processor.c  | 109 +++++++++++++--
 tools/testing/selftests/kvm/riscv/get-reg-list.c   |  16 +++
 17 files changed, 246 insertions(+), 141 deletions(-)

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
