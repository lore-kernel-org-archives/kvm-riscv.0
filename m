Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF549CCD185
	for <kvm-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 18:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lhMKVrv8YT0+OJ/Awge0ue5UNtln34jbxHM0gXSSanA=; b=SWb9E5TawlCA0eU2Hd4W7HUPmZ
	COzDyg4cofzuYipgIwnlPBfAY6PU/hCZTV8cQMGyaRE6SMaa+KhKt6DAmWciI/09GAZ+uSJboe7vw
	fp7XwNB6cgN5r444utih16dSNdu9Z26ipfjW5jzuJfo+/cced9Pj/Wqau3VJq8qgmQVx37nUOEjly
	J/YyYidiVN4fvSxiY/jcUeGaWnBqgZzIYvn3MQz5vxASlyxKQ/rLJEJzQj9ts+Y9vEB2daq3G1veK
	l8Hx5hPEaUBwTgWyN4qyuEEN2aERdwHWhOsBLP0g/5GjVZnSNhUr6wdsQaKxNydpJZdmTLcCJtWUn
	e3nhX15A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Hd5-000000098JJ-1TaE;
	Fri, 10 Oct 2025 18:14:11 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Hd3-000000098Ii-2ds4
	for kvm-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 18:14:10 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2681623f927so49675895ad.0
        for <kvm-riscv@lists.infradead.org>; Fri, 10 Oct 2025 11:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760120048; x=1760724848; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RRqqebB5b3S+5bGOfhb1j8iKUMVMXWWcx0kI9eE51UQ=;
        b=OuJr4FVlnaTl6X0FH2vXXE0iaups9oIGgOe3yC/aSSfipTNUgZoSNTh+vUDZxTObQC
         iwtmSTUCMLllWamkx7MZw6EaSJg9OVCCCVWilLmu30hBrPVEu37PBvam83milJZoE/z0
         IIZi5dMF1ugO4hqxOf3QSoWu72oxj2LgP5Ahjd5Sz2WARWrpfapUiVyWnzLlciIK29Zk
         +IWlRbCBEWDWW8Cgt1NjGGPclW56ZFc7YDny+CIshptrsXKrpPIhu9qGQr6JlxGeXSGV
         fqLsWGWNZphoOUIs0aBuh805JpO067AKST7yuoXQuJ2DTNJD42Vv6a84baVpB+mJ34LB
         B9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760120048; x=1760724848;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RRqqebB5b3S+5bGOfhb1j8iKUMVMXWWcx0kI9eE51UQ=;
        b=WmdS22TppD8oLC88fRFw6IgnK6pePUBSZO4CybjDYgVSpCp9EiuLsZqLbDxGOrrd/i
         es44EPyuBs8nbMCE5N+mZHt7qoJKNHA8pd1ztcTCnJWZyTFJKrZTx06lt75g+kyXn+vD
         2elYtnfz19DB/fSW9gsArRLNokfNmShnaiMygxTHeeMpyGP4IjhueF0YS0AoGFYYDZ3B
         UfyZ3E7pouXYez/7sgRyHy/sspBMzjv9n1tyPD8wH72z8V1pqVN2qNxvoqO5tj5wM+d6
         A+/HY6WIv7/Xdeep4KpiTM1NW2OFAynxDO0P28xFgFstLUSUeMM+HkLIkmLYqryl8ewa
         thZQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5avwezc4PeMf1yrfeU6QsmwrUSjvV9BnWKEqEV+BZ+z0ZbdfJCawQzXWBPLeVFL8PMfzgO3ZjnSc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwXRuY2NKZ8OUJfs4cm58E/ZDSr7nvtfBdgirh0E3jFBYPGBXaj
	BDwq/cNfAaBjLd7CD5Nc+M+ioRQGZfT6+SAv5bZXbPxYcfbTNjyd2NRwASzb6V2RMs8dTEu9igO
	7hWnHgg==
X-Google-Smtp-Source: AGHT+IH7cFlVTSNM+0j4l/xFWY5dLqOboXxalLgs1PnQJ4K/8YINWNO1tWQ0AvtHmyKAMc8BcWffcUfPi8Q=
X-Received: from plkb3.prod.google.com ([2002:a17:903:fa3:b0:268:1af:fcff])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f54b:b0:265:47:a7b0
 with SMTP id d9443c01a7336-290272117f0mr156739855ad.10.1760120048173; Fri, 10
 Oct 2025 11:14:08 -0700 (PDT)
Date: Fri, 10 Oct 2025 11:14:06 -0700
In-Reply-To: <DDEJY5ON407O.2O7CMOY9311NV@google.com>
Mime-Version: 1.0
References: <20250930163635.4035866-1-vipinsh@google.com> <20250930163635.4035866-10-vipinsh@google.com>
 <DDEJY5ON407O.2O7CMOY9311NV@google.com>
Message-ID: <aOlM7ngJJsEW-5sV@google.com>
Subject: Re: [PATCH v3 9/9] KVM: selftests: Provide README.rst for KVM
 selftests runner
From: Sean Christopherson <seanjc@google.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: Vipin Sharma <vipinsh@google.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com, kvm-riscv <kvm-riscv-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_111409_664219_D8835897 
X-CRM114-Status: GOOD (  36.85  )
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

On Fri, Oct 10, 2025, Brendan Jackman wrote:
> On Tue Sep 30, 2025 at 4:36 PM UTC, Vipin Sharma wrote:
> > @@ -0,0 +1,54 @@
> > +KVM Selftest Runner
> > +===================
> > +
> > +KVM selftest runner is highly configurable test executor that allows to run
> > +tests with different configurations (not just the default), parallely, save
> > +output to disk hierarchically, control what gets printed on console, provide
> > +execution status.

...

> I understand that for reasons of velocity

It's not just velocity, it's also for stability and maintainability.  Selftests are
the wild, wild west; there's no central authority, and many subsystems have "needs"
and opinions.  E.g. tools/testing/selftests/kselftest_harness.h is quite opionated,
_and_ it has fatally been broken multiple due to one subsystem making changes that
broke usage for other subsystems.  Obviously those bugs got sorted out, but it's a
painful experience.

I guess you could say those things are all about velocity in the end; but I want
to call out that it's not just about the initial velocity of landing the series,
it's also about the long-term velocity of being able to make changes to fit KVM's
needs without getting bogged down due to other susbystems adding requirements and
use cases that are irrelevant or at odds with KVM's.

> it might make sense to do this as a KVM-specific thing, but IIUC very little
> of this has anything to do with KVM in particular, right?

The actual implementation doesn't have any dependencies on KVM, but the design
and its goal are tailored to the needs of KVM.

> Is there an expectation to evolve in a more KVM-specific direction?

Sort of?  I don't think we'll ever pick up direct dependencies, but I do think
we'll continue to tailor the runner to the needs of the KVM community.

> (One thing that might be KVM-specific is the concurrency. I assume there
> are a bunch of KVM tests that are pretty isolated from one another and
> reasonable to run in parallel.

Every KVM selftest should be able to run in parallel.  That's actually a very
intentional design property of the runner: any system-level configuration needs
to be done by a "higher" authority, e.g. the human manually running the test, a
wrapper script, some form of CI infrastructure, etc.

> Testing _the_ mm like that just isn't gonna work most of the time. I still
> think this is really specific to individual sets of tests though, in a more
> mature system there would be a metadata mechanism for marking tests as
> parallelisable wrt each other.

Dependency and friendliness tracking is again something we specifically avoided
doing, because the KVM selftests need to be self-contained anyways.  E.g. if a
test requires KVM module param X to be enabled, then the test needs to skip.
The runner takes advantage of that behavior in order to simplify the code; it
really is just a "dumb" executor.

> I guess this patchset is part of an effort to have a more mature system that
> enables that kind of thing.).

Sort of?  My response to Marc covered more of the goals in detail:

https://lore.kernel.org/all/aN8gkEMHuvIVPcCt@google.com

> To avoid confusing people and potentially leave the door open to a
> cleaner integration, please can you add some bits here about how this
> relates to the rest of the kselftest infrastructure? Some questions I
> think are worth answering:
> 
> - As someone who runs KVM selftests, but doesn't work specifically on
>   KVM, to what extent do I need to know about this tool? Can I still run
>   the selftests "the old fashioned way" and if so what do I lose as
>   compared to using the KVM runner?

The runner is purely optional.  You'll lose whatever you don't have, that the
runner provides.  E.g. I have (hacky) scripts to run KVM selftests in parallel,
but without much of the niceties provided by this runner.

> - Does this system change the "data model" of the selftests at all, and
>   if so how? I.e. I think (but honestly I'm not sure) that kselftests
>   are a 2-tier hierarchy of $suite:$test without any further
>   parameterisation or nesting (where there is more detail, it's hidden
>   as implementation details of individual $tests). Do the KVM selftests
>   have this structure?

More or less.

>   If it differs, how does that effect the view from run_kselftest.sh?

AFAIK, nothing in KVM selftests is at odds with run_kselftest.sh.

> - I think (again, not very sure) that in kselftest that each $test is a
>   command executing a process. And this process communicates its status
>   by printing KTAP and returning an exit code. Is that stuff the same
>   for this runner?

Yes?  Except most KVM selftests don't support TAP (yet).

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
