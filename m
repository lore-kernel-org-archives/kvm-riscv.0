Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CFECD98CF
	for <kvm-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 23:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3ipApwqVrZQxgAFRFRFZNIEDh9EQeubPf4DWvfGuCQA=; b=TLMcfznV0lLJ07r0jPrVE3EoUC
	k1FLmNn4fRa9NTjbe4NKsaNVPd+g1h9LW8cwrVm1x4z80P/M/qMGMO+xeQsAORVNJfb8FDiF2n0FA
	cYKnXttzXllMhGFJfSo8VNSp3u+A0YJa+C0UN7AJiwtrkiZzjzoaIIVLpf/FemFNyutM6kl+E6uJI
	Bm0UaQ5pG4kdmenWdI+abAhmn4TIBeiEfe9RDUMH7O952WXaAm6W2zY8QtjlVaa+Ww8+BPcRzLon+
	Y6PnvjylKAkwRoCkfoCI84wZYDItKkjCvLpztflwxbeNkeNvW3GnLq9hNyQFHEAnX7h+PGNE0hyD4
	PsMlTAVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYBjU-0000000BmmY-037p;
	Fri, 12 Jun 2026 23:56:16 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYBjS-0000000Bmlw-1RtV
	for kvm-riscv@lists.infradead.org;
	Fri, 12 Jun 2026 23:56:15 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-842208d5b0eso1207165b3a.3
        for <kvm-riscv@lists.infradead.org>; Fri, 12 Jun 2026 16:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781308573; x=1781913373; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7F1CL07F07wvyE5qrB0/UKvrGwjihO70EZ1fPlSezlQ=;
        b=LgRlDpND7ZaCvSpAO1NwOL2UFzTa2EwQnNpD/DKz37Oy2UsfRGCeQQqLe9qS6yjGxL
         vqiGlePRCKTCjRTl3NzSAqcV9R+yH7Ycok3bxz7un0EQ3RL+lUUt3tzuGR6zQ1gIr22M
         CowKersj34f/pPSJ/0GVW/prhi1cnWbxcWElaxQCdb2yIWbXPFlirKVM8J5T10N5v/Qi
         vvmPqcqGTWXPlkIqC9lILv3RSIkiB/RecEnrVwNEDvqJVc+KSUNyMf2kVn1eHggkcO3R
         jfq02F8QGiMU1s+AcoLgjBxzmagpSx4wKPdNMZNfCeT9OjX8CcxXeP/vfp+Ygtv1qxGy
         IXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781308573; x=1781913373;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7F1CL07F07wvyE5qrB0/UKvrGwjihO70EZ1fPlSezlQ=;
        b=S/zG55N5tMLaLZ/aKg9cQfisekhtS0qt6H4iQ2c1ucRpozF+oSQdv/khNQwIFpedJ3
         xcxYxvaW1ABhwHBiMA6T5V/WSg0IdaXQxXTHY2ewSckcPfRhqaMzAyoe1DW0Vzspx3NK
         E9u1O/QTHXfqYqp9Bf0yM/mAhqig0uOmDdJ/7rB7Fi/KDr6/fMYHthHBfFe9nJ4Wj6rQ
         L1Ryz1QYou60LC1CDGOAF10zBL/ed35eRCNX+v74uqMC4qtDiG4IjPJz04eFjJRojP3E
         QHcSc7B2Dr8xmzcUk8WWx/PeKrJzePHKsGeVHGFr4vJX5ZQtp0CGOtglWORvc4vyVHpk
         5wKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/DInXY6FOkQIvLWTlyiMPN6ig4lvp4wdX19spxFVkkH/hbdTlQIAev7q185WjaYaDKyav5wJ6pLCU=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv5MQJ/9ovmC4G1VbUyze7aBwKiE7nzBGJCKqK6ICqTr9I3VAu
	xTyurH+4eXXU8BfTpzOk/VSPwfA614Nu0E2z8QLBv+VXuCglpeujGCXabLXLWldiJ8awM8qYKx/
	jWGIqvw==
X-Received: from pfux29.prod.google.com ([2002:a05:6a00:bdd:b0:83e:e8a8:71ee])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:aa8b:b0:834:e5a2:d089
 with SMTP id d2e1a72fcca58-8434ce8c0d4mr5319281b3a.33.1781308572362; Fri, 12
 Jun 2026 16:56:12 -0700 (PDT)
Date: Fri, 12 Jun 2026 16:56:11 -0700
In-Reply-To: <CAEvNRgFLnGkqvvks3joAwPjqLz=ATmqiS0UWk71g+YEsxNsfsg@mail.gmail.com>
Mime-Version: 1.0
References: <20260331194202.1722082-1-vipinsh@google.com> <20260331194202.1722082-2-vipinsh@google.com>
 <CAEvNRgGrPKBXh=VA3QBLJOczKRpMOB4nDmZL0XRwV6B3PT_7+Q@mail.gmail.com>
 <aisHySKe0PwM5DSg@google.com> <CAEvNRgE-qt8DAjOeE5ANpXzrgEKs+2_wh4YSmY=pe6krngBXqQ@mail.gmail.com>
 <aitbveI2Sdx4s4BP@google.com> <CAEvNRgFLnGkqvvks3joAwPjqLz=ATmqiS0UWk71g+YEsxNsfsg@mail.gmail.com>
Message-ID: <aiycmwMbhWuYghJh@google.com>
Subject: Re: [PATCH v4 1/9] KVM: selftest: Create KVM selftest runner
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Vipin Sharma <vipinsh@google.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_165614_437193_617CFAF8 
X-CRM114-Status: GOOD (  30.72  )
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

On Fri, Jun 12, 2026, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > On Thu, Jun 11, 2026, Ackerley Tng wrote:
> >> Sean Christopherson <seanjc@google.com> writes:
> >>
> >> > On Wed, Jun 10, 2026, Ackerley Tng wrote:
> >> >> Vipin Sharma <vipinsh@google.com> writes:
> >> >> My (future) use case is that with hugepages, I want to run something
> >> >> like
> >> >>
> >> >>   ./guest_memfd_test --order=0
> >> >>   ./guest_memfd_test --order=9
> >> >>   ./guest_memfd_test --order=18
> >> >>
> >> >> And 0, 9 and 18 are the supported HugeTLB orders on the machine being
> >> >> tested. I'd like to iterate over supported HugeTLB orders at runner
> >> >> runtime instead of at build time.
> >> >
> >> > No.  The right way to handle this is to define testcases for the "interesting"
> >> > sizes, and then rely on the test itself to SKIP if the size is unsupported.  This
> >> > is no different than a test that requires EPT, or nested VMX, or nested SVM, etc.
> >>
> >> That should work too. So at build time I'd make it define all the
> >> possible HugeTLB sizes on every arch, and then skip as necessary.
> >
> > Not necessarily at "build time", the testcases can also come from your local
> > environment.
> >
> >> Why though, why not find the supported sizes at runtime?
> >
> > You can find the supported sizes at runtime, just not in the test runner.  I want
> > the runner itself to be largely oblivious to what's its running.  Disallowing
> > more or less _any_ test specific configuration/setup in the runner is the only
> > way I see of keeping the runner strictly focused on running tests/testcases.
> 
> The runner should 100% focus on running tests, I think it's hard for the
> runner to avoid the process of test discovery though.
>
> The current test discovery process is to go down the tree of directories
> and find files, 1 file == 1 testcase. Each file should (statically)
> contain a single command.
> 
> Since you're not opposed to runtime discovery of test cases, how about
> something like:
> 
>     if the test case file has executable permissions
>         execute it and get back a list of test cases to be run.

I don't hate it, but I still dislike the idea.  I am all in favor of runtime
*discovery* of testcases, but I am staunchly opposed to runtime *definition* of
testcases.

If I define guest_memfd testcases for 4KiB, 2MiB, and 1GiB pages, but the
underlying system only support 4KiB and 2MiB, then I want to see a SKIP for the
1GiB testcase.  If the definition is dynamic, then the 1GiB testcase simply won't
exist.

>     else
>         read it as a single test case.
> 
> I'd then use the executable version, check HugeTLB setup on the machine
> under test and return bunch of separate commands to be run (each with a
> different HugeTLB size).
> 
> The runner still doesn't need to deal test-specific config, that's part
> of the executable that tells the runner what to run.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
