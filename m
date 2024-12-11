Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B65E7717D
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 22:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mRm6xQ9JFl9FE1mTiOE1Z7T7s/V6sGWWzlqHii8OOsY=; b=jcvaITfKjVKzAOoTeuxNwCQwvb
	tIayRiGIFyaDz4mQN3DUlvC0Z69abQiZo/V37JfHRG4NNsj9vV63omwLaFvyTXdefTr82LlTi0jgF
	LmDPPx4n2vulVVnZBG7a1KzyLguCF/CzSc73txut6jwGwCaptoQ1HRb/xiAWB9B1pJEtRhBSGPEhF
	Tfrf3r4GhCpb8K6ARqW8Kq4ytLyS1L/JYdJgCkbJLgxwoTX+bdhjKqDJUt0/pHybRs4rdL1IM+3hK
	bl3qN6NESazSBUMy9WhLL5M+ytDAGzmJh3dQCVtsVv8XPYTRyTum0XrWGz8Zj2oSGTcIKnvaF+S8V
	WvLWxtXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLUpM-0000000GGYD-3zaD;
	Wed, 11 Dec 2024 22:05:04 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLUpL-0000000GGXg-0dZg
	for kvm-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 22:05:04 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ef6ef9ba3fso5612609a91.2
        for <kvm-riscv@lists.infradead.org>; Wed, 11 Dec 2024 14:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733954701; x=1734559501; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eUq2+HHfD0MZnKG6S4yv713N9r4cWKPzp2/GucLxJ8U=;
        b=Y+qlezQD7aKSZnFRcoVztTNcMa78SlGX0bGS/zZwqMAOlOP+Ny8iGN2xtMXDeNxW6V
         1b6X4GGpNYj6stpp+olZyspqhcg7Vu/2oK0cMEwuzIfIrwmhlMXuwaK1bcUl4b5MJTAS
         JGI7PAIBgkHrgKZJLMvhDl0SO6Xdn+WcpJT6Qi3PuX0pQBmRjz8PbIUYOJ+CwAjzpJhJ
         e8w7d/gPWsh5/Y30X0yvouqVRDuEKsHENL04vv0XpZqOpRe/YalivwH5jy3s1Xh2/s4t
         5i6pYovMq5IJ8OT/m05AtrXzpxgNIQcz7CrF9Z6gWmhqg5tq/oxwYbe/7DNd1Gs5yJZj
         tqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733954701; x=1734559501;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eUq2+HHfD0MZnKG6S4yv713N9r4cWKPzp2/GucLxJ8U=;
        b=XymQ/Oiu9Rvmmfr9tkP0HB7+ScRwgCqUSCUjRRgfsXYkkJYHv7+UrIvTokPsr935wH
         avAQVFDuem7cDYeFwQfj9tJqZZI2oKTAbIK1jU1acPWpoHZ4MVL2NfYJIncl23KUUnoL
         RU1BsoT755Vig/Z2BHP6UPiqgTgGrTsPHOI7OGQphzTBNr+0EvnrGwb5QUF7tBsuipQ0
         zwIpAz33K4er1/pL/9mH817aY+AsHh1mTuV7zsV7ga6I8dpFud3l6gJ2q93GKCa+OAFo
         9PNYG9J3AQNxZ1mtGFKp1Yj6jYXdGrlA6qHh8urT16UcvmlrYj+NLiw43Tc1sYwodMkL
         xQTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOxqqYUofi6urV/+s6miqERGcHLMThAQqA30hnltUDZEdspUM1+qy8piXNtvzJCRzsSuRtyoHnwiA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzeNQEAq/co7uLx9zpxJ0ZDDdSXEeb/BJCRTHo5IyBYoyYFntgY
	GeuU06eEqriSimKBcqY90UtvI7udtdyLNvw1IdyYQtJ/N4AO/AzHOXaUr5dW9V6Y4OYnjsEBNb+
	lGw==
X-Google-Smtp-Source: AGHT+IEyb50yMKacPTznxoijQx7BN35QC5SQoHLR54g34UBhOfC2yU2PDiXYsV/JHqrTw/B7nLThww6z3/A=
X-Received: from pjbnb8.prod.google.com ([2002:a17:90b:35c8:b0:2ee:4f3a:d07d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2e46:b0:2ee:8439:dc8
 with SMTP id 98e67ed59e1d1-2f1280e2a8amr6417546a91.34.1733954701643; Wed, 11
 Dec 2024 14:05:01 -0800 (PST)
Date: Wed, 11 Dec 2024 14:05:00 -0800
In-Reply-To: <20240910152207.38974-1-nikwip@amazon.de>
Mime-Version: 1.0
References: <20240910152207.38974-1-nikwip@amazon.de>
Message-ID: <Z1oMjKa3gExDxsCN@google.com>
Subject: Re: [PATCH 00/15] KVM: x86: Introduce new ioctl KVM_TRANSLATE2
From: Sean Christopherson <seanjc@google.com>
To: Nikolas Wipper <nikwip@amazon.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Nicolas Saenz Julienne <nsaenz@amazon.com>, Alexander Graf <graf@amazon.de>, James Gowans <jgowans@amazon.com>, 
	nh-open-source@amazon.com, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_140503_212485_44E2D1B5 
X-CRM114-Status: GOOD (  25.09  )
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

On Tue, Sep 10, 2024, Nikolas Wipper wrote:
> This series introduces a new ioctl KVM_TRANSLATE2, which expands on
> KVM_TRANSLATE. It is required to implement Hyper-V's
> HvTranslateVirtualAddress hyper-call as part of the ongoing effort to
> emulate HyperV's Virtual Secure Mode (VSM) within KVM and QEMU. The hyper-
> call requires several new KVM APIs, one of which is KVM_TRANSLATE2, which
> implements the core functionality of the hyper-call. The rest of the
> required functionality will be implemented in subsequent series.
> 
> Other than translating guest virtual addresses, the ioctl allows the
> caller to control whether the access and dirty bits are set during the
> page walk. It also allows specifying an access mode instead of returning
> viable access modes, which enables setting the bits up to the level that
> caused a failure. Additionally, the ioctl provides more information about
> why the page walk failed, and which page table is responsible. This
> functionality is not available within KVM_TRANSLATE, and can't be added
> without breaking backwards compatiblity, thus a new ioctl is required.

...

>  Documentation/virt/kvm/api.rst                | 131 ++++++++
>  arch/x86/include/asm/kvm_host.h               |  18 +-
>  arch/x86/kvm/hyperv.c                         |   3 +-
>  arch/x86/kvm/kvm_emulate.h                    |   8 +
>  arch/x86/kvm/mmu.h                            |  10 +-
>  arch/x86/kvm/mmu/mmu.c                        |   7 +-
>  arch/x86/kvm/mmu/paging_tmpl.h                |  80 +++--
>  arch/x86/kvm/x86.c                            | 123 ++++++-
>  include/linux/kvm_host.h                      |   6 +
>  include/uapi/linux/kvm.h                      |  33 ++
>  tools/testing/selftests/kvm/Makefile          |   1 +
>  .../selftests/kvm/x86_64/kvm_translate2.c     | 310 ++++++++++++++++++
>  virt/kvm/kvm_main.c                           |  41 +++
>  13 files changed, 724 insertions(+), 47 deletions(-)
>  create mode 100644 tools/testing/selftests/kvm/x86_64/kvm_translate2.c

...

> The simple reason for keeping this functionality in KVM, is that it already
> has a mature, production-level page walker (which is already exposed) and
> creating something similar QEMU would take a lot longer and would be much
> harder to maintain than just creating an API that leverages the existing
> walker.

I'm not convinced that implementing targeted support in QEMU (or any other VMM)
would be at all challenging or a burden to maintain.  I do think duplicating
functionality across multiple VMMs is undesirable, but that's an argument for
creating modular userspace libraries for such functionality.  E.g. I/O APIC
emulation is another one I'd love to move to a common library.

Traversing page tables isn't difficult.  Checking permission bits isn't complex.
Tedious, perhaps.  But not complex.  KVM's rather insane code comes from KVM's
desire to make the checks as performant as possible, because eking out every little
bit of performance matters for legacy shadow paging.  I doubt VSM needs _that_
level of performance.

I say "targeted", because I assume the only use case for VSM is 64-bit non-nested
guests.  QEMU already has a rudimentary supporting for walking guest page tables,
and that code is all of 40 LoC.  Granted, it's heinous and lacks permission checks
and A/D updates, but I would expect a clean implementation with permission checks
and A/D support would clock in around 200 LoC.  Maybe 300.

And ignoring docs and selftests, that's roughly what's being added in this series.
Much of the code being added is quite simple, but there are non-trivial changes
here as well.  E.g. the different ways of setting A/D bits.

My biggest concern is taking on ABI that restricts what KVM can do in its walker.
E.g. I *really* don't like the PKU change.  Yeah, Intel doesn't explicitly define
architectural behavior, but diverging from hardware behavior is rarely a good idea.

Similarly, the behavior of FNAME(protect_clean_gpte)() probably isn't desirable
for the VSM use case.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
