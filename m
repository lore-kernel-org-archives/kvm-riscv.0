Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11D5C3ABBC
	for <kvm-riscv@archiver.kernel.org>; Mon,  5 May 2025 19:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JRHkBcvVgickPwIeWvoQCTalJU7d0Em3AzTbh5LPRFY=; b=tsSvl3U8zk8GoX
	wgXfSMuo/6n3p3127Kk/XOb3lecc9s1CZWGKKx7i9V53Y+wE/LYvWgbgZG9TFm6muQwwWkbB2/9rw
	EzmK8r+LMwE+bsYoBihkTGRltLCF1biUtHCAgjCLV4LrMH4IUI9woEUQ8oW/3WI2v6NjLlo3M97PP
	0tkf7vWXrpaKVctX5Mx2wV8XhU5RvHV6o2N+Tkgvc3em3AQ1z0yDGCAfzLFIKZ4Z7sGH1EfA2LNUV
	SpeLQh8sBTC6Fg6qorCOtOX5JW/VbZSwbbSZb4oAUgEB+/Z9jD8UPcKRz1RL0PQrsLg7XyMcp3qxY
	gLhNkZ6xrCVWMwV8TP/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC1C8-00000008NAE-00fG;
	Mon, 05 May 2025 19:09:40 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC18M-00000008Ms8-40f5
	for kvm-riscv@lists.infradead.org;
	Mon, 05 May 2025 19:05:49 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2263428c8baso22805ad.1
        for <kvm-riscv@lists.infradead.org>; Mon, 05 May 2025 12:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746471945; x=1747076745; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nxc3AA271rP0clF1WTv1WRpUSSHlH6QI7su8jxLA6Qg=;
        b=3HTKwAjCQdVRduS9OJ9EHwGevlNll1aouVH2RA5nH/Y+xaFKEqCqOT7QdXrBRvmFNI
         VRe0+2aONo0GeHpx1QcDcfp8vr7qe46iDJXDALZ2CVi8o65vXtRjGCrK7lKhfqW6hDPo
         7Zrm42sn3dB8eI2vp44PAnrvGkEr72RGfRR9cFO9gc5o/y1fNS+/ssYpalYsBK/yA0K8
         Nx/FvdAAKDtB7YEiUz+I1waYrZUYQNRmKjVeRiQfSojxc03n+D61BeWsuFduI0/klYbp
         JoUla3K0iCfwesZmVBMZ4Vko4NbM2NZutOx3s2HyzI2rNArr3wHr7YcEew8GktZ+guv8
         m0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746471945; x=1747076745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxc3AA271rP0clF1WTv1WRpUSSHlH6QI7su8jxLA6Qg=;
        b=VHUxOT7Ctgu2e6bedgO5SVeOtJsCrz+3bLWFPy6KSGPilPU+b995cB908QdRb48q+a
         jvUc30H+0Tit1l5AXZjuHpL4F5oj9qaro0UgfUF0LUM/2lsaQuVgY3XvWXOOvME0Plvr
         uIe5/SrPKwGy+hQg8SBvdX3NbkkTkMeN/Xf+AGsdJNv9mk8o0VtAWhetoTz29kYrautr
         cdPJayt4lhZh+D+qF49wH3KuX6WA9xGfjIHUU7VU4PxHftBLjDACumBtThB49cC97GIY
         agtq7rn9EqlWY79Adrdyl9/rINc9U9wquNPhzwQQ7nUF1+2LJ8AWiUfNAfqBHilPWi8l
         MRVA==
X-Forwarded-Encrypted: i=1; AJvYcCX53CA/rsWVo6uGXqqRchCgPNQOYq+TTMZQJOxWAKkswVzEPJURGrqtwAv144Mth7lr7Vu77Euelgc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwpE0RKiXH2nFpOHma9hRl4/8cCf+lQbO2z0MOCAgQk90tnHeLA
	xhZhwOK8bQExqpIT60zY5kgt1tyTk4KTDJFc+TjyIMZ133zc//6a1bLPhz7EZw==
X-Gm-Gg: ASbGncvVWfbUZBEItyF8cAt9l0j1pReNtip38YPGTQY9MnPQuv1TLmu6+YpIwx/ibE1
	zMBfWOAJH38gpVL+cMeHDc08UsmzudNIpCxN50yuEj9Q8OE9roB/VbIFmQLRc8XW46EtqRGGQ20
	3sygHLKWLhQBkjrmGKP9MHKSyccg0qYSSbE08R0uLgWXNnZBRc3SHfFFgDeFZUU2OJysEaKz5ti
	uTN3eJPrDUORRDEmZefanCaIVq09Z3IGVI8X0CW6nu9nhGMOwS4uvvjkUG7GMt4MOGb6wj/VStu
	2qt6Hc8nzEdU+znOXEASWKm11SUvy9bt/E7DvP5Kr+OnFlbWEqu6v6lAMMU8S375L3DjeoKQDgE
	=
X-Google-Smtp-Source: AGHT+IFASicqsLQoC4gNxHelYC0aG3lNabvqq0UOOhgv1HOFYapFQUFpIvWUjmSTv3Puo5pNrUg8AQ==
X-Received: by 2002:a17:903:46cd:b0:223:37ec:63be with SMTP id d9443c01a7336-22e34dee32bmr461265ad.4.1746471945198;
        Mon, 05 May 2025 12:05:45 -0700 (PDT)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522fa16sm58920035ad.239.2025.05.05.12.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 12:05:44 -0700 (PDT)
Date: Mon, 5 May 2025 12:05:38 -0700
From: Vipin Sharma <vipinsh@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	pbonzini@redhat.com, anup@brainfault.org, borntraeger@linux.ibm.com,
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, maz@kernel.org,
	oliver.upton@linux.dev
Subject: Re: [PATCH 1/2] KVM: selftests: Add default testfiles for KVM
 selftests runner
Message-ID: <20250505190538.GA1168139.vipinsh@google.com>
References: <20250222005943.3348627-1-vipinsh@google.com>
 <20250222005943.3348627-2-vipinsh@google.com>
 <aBJXabTuiJyRZb-O@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aBJXabTuiJyRZb-O@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_120546_989128_D8C6FD0E 
X-CRM114-Status: GOOD (  29.12  )
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

On 2025-04-30 10:01:29, Sean Christopherson wrote:
> On Fri, Feb 21, 2025, Vipin Sharma wrote:
> We definitely auto-generate the default testcases.  Relying on the user to remember
> to add a testcase, and on the maintainer to remember to check for that, isn't a
> winning strategy.

Good idea, this will help in at least automatically run the default tests.
Also, if tests are in the selftest kvm source directory then it will
give an hint to developer/maintainer that they missed writing a default
test file for a newly introduced test when they run git status.

> 
> But, I do think we should commit the default.test files to the repository.  If
> they're ephemeral, then several problems arise:
> 
>  1. For out-of-tree builds, the default.test files should arguably be placed in
>     the OUTPUT directory.  But if/when we add curated testcases/, then we'll either
>     end up with multiple testcases/ directories (source and output), or we'll have
>     to copy testcases/ from the source to the output on a normal build, which is
>     rather gross.  Or we'd need e.g. "make testcases", which is also gross, e.g.
>     I don't want to have to run yet more commands just to execute tests.
> 
>  2. Generating default.test could overwrite a user-defined file.  That's firmly
>     a user error, but at least if they default.test files are commited, the user
>     will get a hint or three that they're doing things wrong.
> 
>  3. If the files aren't committed, then they probably should removed on "clean",
>     which isn't the end of the world since they're trivially easy to generate,
>     but it's kinda funky. 
> 
> So, what if we add this to auto-generate the files?  It's obviously wasteful since
> the files will exist 99.9999999% of the time, but the overhead is completely
> negligible.  The only concern I have is if this will do the wrong thing for some
> build environments, i.e. shove the files in the wrong location.

We can get the current path of the Makefile.kvm by writing this at the top
of the Makefile.kvm:
	MAKEFILE_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

Then MAKEFILE_DIR will have the source directory of Makfile.kvm and
testcase will be in the same directory.

With this we can modify the below foreach you wrote by prefixing
MAKEFILE_DIR to "testcases".

Does this alleviate concern regaring build environment?

> 
> diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
> index f62b0a5aba35..d94bb8330ad1 100644
> --- a/tools/testing/selftests/kvm/Makefile.kvm
> +++ b/tools/testing/selftests/kvm/Makefile.kvm
> @@ -198,6 +198,13 @@ TEST_GEN_PROGS += $(TEST_GEN_PROGS_$(ARCH))
>  TEST_GEN_PROGS_EXTENDED += $(TEST_GEN_PROGS_EXTENDED_$(ARCH))
>  LIBKVM += $(LIBKVM_$(ARCH))
>  
> +$(foreach tc, $(TEST_PROGS), $(shell mkdir -p testcases/$(patsubst %.sh,%,$(tc))))
> +$(foreach tc, $(TEST_GEN_PROGS), $(shell mkdir -p testcases/$(tc)))
> +$(foreach tc, $(TEST_PROGS), \
> +  $(shell echo $(tc) > $(patsubst %.sh,testcases/%/default.test,$(tc))))
> +$(foreach tc, $(TEST_GEN_PROGS), \
> +  $(shell echo $(tc) > $(patsubst %,testcases/%/default.test,$(tc))))
> +

This looks good.

> > diff --git a/tools/testing/selftests/kvm/.gitignore b/tools/testing/selftests/kvm/.gitignore
> > index 1d41a046a7bf..550b7c2b4a0c 100644
> > --- a/tools/testing/selftests/kvm/.gitignore
> > +++ b/tools/testing/selftests/kvm/.gitignore
> > @@ -9,4 +9,5 @@
> >  !config
> >  !settings
> >  !Makefile
> > -!Makefile.kvm
> > \ No newline at end of file
> > +!Makefile.kvm
> > +!*.test
> 
> Let's keep the extension wildcards sorted alphabetically, i.e.:
> 
> # SPDX-License-Identifier: GPL-2.0-only
> *
> !/**/
> !*.c
> !*.h
> !*.py
> !*.S
> !*.sh
> !*.test
> !.gitignore
> !config
> !settings
> !Makefile
> !Makefile.kvm
> 

Okay.

> > diff --git a/tools/testing/selftests/kvm/testcases/aarch64/aarch32_id_regs/default.test b/tools/testing/selftests/kvm/testcases/aarch64/aarch32_id_regs/default.test
> > new file mode 100644
> > index 000000000000..5db8723f554f
> > --- /dev/null
> > +++ b/tools/testing/selftests/kvm/testcases/aarch64/aarch32_id_regs/default.test
> > @@ -0,0 +1 @@
> > +./aarch64/aarch32_id_regs
> 
> I don't see any reason to make the paths directly consumable with a leading "./".
> Spoiler alert from the next patch: the location of the test executables needs to
> explicitly resolved by the test runner.

I will remove this.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
