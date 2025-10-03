Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A29CAC5B0
	for <kvm-riscv@archiver.kernel.org>; Fri,  3 Oct 2025 01:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=G939tbtanBJaCnIZ5YF9+bFCpw/HfZlnbQFuWh7Tfzw=; b=XRDWNs/v4RUKDCoK+hPBDsDnye
	IwNiTAFGiKjQK8gISU3DB04ftM7Jf9TC89ukyHl5N0ET/9JaQzPf++fjZAVQ1+FWZoS21oBOCCliH
	feKPQyqjoS7vQZs0djdIKq8sMb5oh5qS0YoXWTwBYTRVMi+vB3rjVOaRhLuSRY1pnxBzZjlrgsiW0
	h/D/6TFhXPyk795dmd1GbuDBBGQM+A/VDZ/Z3j1NoDFQVHgL87s/lbu8iu6RWmXk+4E72koEgS32Y
	dUG6jJ0L2HkhnhPWxsH4gWo9LdGqSfdoM4+zwkhofvceVVIUFvUBzIg5YYFuJQ7hs1d4k6eYPdO1n
	7CDl3v3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4UBY-0000000BToc-2mE9;
	Fri, 03 Oct 2025 01:02:12 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4UBW-0000000BToE-2q8c
	for kvm-riscv@lists.infradead.org;
	Fri, 03 Oct 2025 01:02:11 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33428befc5bso1819800a91.0
        for <kvm-riscv@lists.infradead.org>; Thu, 02 Oct 2025 18:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759453329; x=1760058129; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Jhsi/hyS7a38NhT2Hqz3OM4Bzlch84UkK/Xe3cm3J0=;
        b=am0O1bemSJB77CPntZpJc89nJOk02JTSmmXFYlaJ1N92AflQQD5nzwnMByIXPUQ1GG
         k/3W6AZZYtB3WVTbhRwnXkatgU/vAqmyqfIRjZjMe8togXpIumQVd3aZt2LFEP+TSNDy
         GapzrcwnjWf5awbNb1TdlUzHk9dWhgPwU5ENnp3rfOSe8fRS1Gao2WYv5u87iGBJIZtz
         GbmnAqnIVuRW0KOdmhB7Ushj9DFjZ1zJ5iBxJdSuyXkh32G7t0Q4sSe1EophfAIOHz3+
         U1rBzO1bwmJE7I/DpRmLIHvAk65LdNI3A+xKMQhm8anw49JpFgY/+pFr+k0lnHz02wQ0
         iWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759453329; x=1760058129;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Jhsi/hyS7a38NhT2Hqz3OM4Bzlch84UkK/Xe3cm3J0=;
        b=NpYQspK2PULFlWKbaXTGe34RrmC+dhBWvzDlEVqcVPD+aX/tdkjIXVPS8zdL6y4UrC
         vF0Z6g1ZP3ftPhCFlld+F+X3yxtHh6bvmvQ3ROI05eSvE6sUDF3Sm7tqCdi9/WFJl5aN
         S6a5p3rMQZZ9MgU6MSp+jJfq4u6hc0NKj2zSqjQeP9Tb3WY8vEXPCjjS9n6VhIiU8AVa
         pTjcfgLM0AZuZjdfQZXDz31HZ/30f9I0xix6wrdqIlL0W7jqaeorAalSveQOkWUk+2sr
         gYeCA2diiLszSz/DS3BNHpcrVy4b0dgDEbHpPfcFW9bo3nQ+0h8GcYDmQtL+9ZcH14H3
         efiw==
X-Forwarded-Encrypted: i=1; AJvYcCWNe7YikzpeFglh9CuAa5chXzfoy/c3sbDALCbdLVI3cfH9HMUy4+2+ZEF8BldCt+UObkFltTji1d0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2M7XKCv/outEasawYf+1QuD9W52XWtWDz80o5a+D8sBhHex8h
	g8oKkW1ywh/4+Qzd8g7YU06pwNHjpnp47q+vzIVGF5Q9n5lO4piwkj6U4OnHRQE4ewDX/xf5oCI
	Nk/oihw==
X-Google-Smtp-Source: AGHT+IFwurIZ5wEQactgz/Wb47f7lyl+S//nCwqNIeLCXTOqPn/FvG0AeALewYCWSg5yph5QxPM5itarytY=
X-Received: from pjpo10.prod.google.com ([2002:a17:90a:9f8a:b0:32e:a3c3:df27])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a91:b0:32e:c6b6:956b
 with SMTP id 98e67ed59e1d1-339c2765e06mr1319063a91.4.1759453329295; Thu, 02
 Oct 2025 18:02:09 -0700 (PDT)
Date: Thu, 2 Oct 2025 18:02:08 -0700
In-Reply-To: <86a529z7qh.wl-maz@kernel.org>
Mime-Version: 1.0
References: <20250930163635.4035866-1-vipinsh@google.com> <20250930163635.4035866-10-vipinsh@google.com>
 <86qzvnypsp.wl-maz@kernel.org> <20251001173225.GA420255.vipinsh@google.com> <86a529z7qh.wl-maz@kernel.org>
Message-ID: <aN8gkEMHuvIVPcCt@google.com>
Subject: Re: [PATCH v3 9/9] KVM: selftests: Provide README.rst for KVM
 selftests runner
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Vipin Sharma <vipinsh@google.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, oliver.upton@linux.dev, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_180210_735012_D75B9033 
X-CRM114-Status: GOOD (  20.64  )
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

On Thu, Oct 02, 2025, Marc Zyngier wrote:
> On Wed, 01 Oct 2025 18:32:25 +0100,
> > One can run these non-default tests as (assuming current directory is
> > kvm selftests):
> > 
> >   python3 runner -d ./tests
> > 
> > Over the time we will add more of these non-default interesting
> > testcases. One can then run:
> > 
> >   python3 runner -d ./tests ./testcases_default_gen
> 
> That's not what I am complaining about. What you call "configuration"
> seems to just be "random set of parameters for a random test".

Hopefully s/random/interesting, but yes, the design of the runner is specifically
to support running tests with different parameters, and not much more (from a
configuration perspective).

> In practice, your runner does not seem configurable at all. You just
> treat all possible configurations of a single test as different tests.
> 
> My (admittedly very personal) view of what a configuration should be
> is "run this single test with these parameters varying in these
> ranges, for this long".

Ya, but personal preference is precisely why we kept the runner fairly minimal.
The goal is to provide:

 1. A way to upstream non-standard test invocations so that they can be shared
    with others, and to improve the coverage provided when developers just run
    whatever tests are upstream (which probably covers most contributions?).

 2. Provide "basic" functionality so that each developer doesn't have to reinvent
    the wheel.

    E.g. I have a (horrific) bash script to run selftests in parallel, and while
    it works well enough for my purposes, it's far from perfect, e.g. there's no
    timeouts, it's super hard to see what tests are still running, the logging is
    hacky, etc.
 
    The idea with this runner is to deal with those low-level details that are
    painful to implement from scratch, and that generally don't require foisting
    a highly opinionated view on anyone.  E.g. if someone really doesn't want to
    see certain output, or wants to fully serialize tests, it's easy to do so.
   
 3. Tooling that power users (and hoepfully CI?) can build on, e.g. via wrapper
    scripts, or something even fancier, again without having to be too opinionated.

    E.g. thanks to the myraid module params in x86, I run all selftests with 5-6
    different versions of KVM (by unloading and reloading KVM modules).  We
    deliberately chose not to allow specifying module params of sysfs knobs as
    part of the runner, because:

        (a) Handling system-wide changes in a runner gets nasty because of the
            need to express and track dependencies/conflicts.
        (b) It's easy (or should be easy) to query dependencies in selftests.
        (c) Selftests need to query them anyways, e.g. to avoid failure when
            run with a "bad configuration".
        (d) Permuting on system-wide things outside of the runner isn't terribly
            difficult (and often requires elevated privileges).

So yeah, there are definitely limitations, but for the most part they are self-
imposed.  Partly to avoid boiling the ocean in the initial version (e.g. many
tests won't benefit from running with a range of values/parameters), but also so
that we don't end up in a situation where the runner only suits the needs of a
few people, e.g. because it's too opinionated and/or tailored to certain use cases.

I'm definitely not against providing more functionality/flexibility in the future,
but for a first go I'd like to stick to a relatively minimal implementation.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
