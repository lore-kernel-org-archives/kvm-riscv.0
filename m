Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AF3CD98CC
	for <kvm-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 01:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Rwk+JloBariG4vNx2bG8u1YcBqh71F/KkvEWXqrX160=; b=sFW/m+BAK/LkUyaNz3b7t+7wKz
	t8S6tL4RZtCjslPXw8ycKaUnzdOmZzOVcd4AuT5rr83d9KWNrgmzPBctZIGkU4eShy9BfoNywugIh
	3Dzh6kUkqIt6F2PBSH6nNPQbh9fiK7+9in1q4ZWG5WJy3qPDevj4BfGxMP7vwbc19hZynEgFTKwNn
	VD+NsqxNjH9DobvZ+l3uizLgp311iUVv/ui/A3UcyVLgo0rwARoDiaE1026Wx0HD+GcBMyr+y3eOW
	xtMICs+lDX5yRwev6dMZ37mLorb6P94sb7tjWK+5KKoW5t3+7/9stKObDjaexM0+piQXK5UeDyldW
	80Rv3kSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXqMc-0000000AEzJ-0kHr;
	Fri, 12 Jun 2026 01:07:14 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXqMZ-0000000AEyw-45MP
	for kvm-riscv@lists.infradead.org;
	Fri, 12 Jun 2026 01:07:13 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-84240b58211so324437b3a.1
        for <kvm-riscv@lists.infradead.org>; Thu, 11 Jun 2026 18:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781226430; x=1781831230; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ltYTnUEFnoWpppzAgPG27GJdcRnPuw2iznLkjvKvVEY=;
        b=pRVHq84q6WDTbT4ehY87AUV2h11mEuv7tEi/9sFpucYRmeiPKLr2je3ATkhDbfTz0H
         mu6Vh0A1+BsrwRvpMF8IwaDqk1XhsmlX4L4AeeFLRXe67p+e32dFt+VS2FwbfJ7N5i4E
         VoeUI+FLxSG2kgK+M7f0j5fP7yTrCqZR1Fcz1ZsOwPZ2jZ6A8uD2zy7O/ezwgvUzTE0R
         BSg6t5fq1T6+v16V7fWCl2uVpEWWK41Feio9BSBdZgLlcz9y882DKqUiMdJsbYVZNktM
         RA14EARgxf0foVSm3QvECGq9Rarrf3fwAmSYJmyZEJhr6DMaYlKU9OOiMW61pmWIyHXG
         nFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781226430; x=1781831230;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ltYTnUEFnoWpppzAgPG27GJdcRnPuw2iznLkjvKvVEY=;
        b=hTe1tdW1ySj/18Ukaijd8ECq78PlPn7XFAQrGe4ownLEwAr0ZwJisdqVFrVrH/b30q
         coPv5N2HoioEHbhV0pULVVSC7bMGHwIA9S2EmB4a0q/Ko4wH9h8uT9qCTQOk0JVz0L9A
         UNMHAFYJl6av78bXwfy2+rJ/AWJVo0lvzjsJbv/xl4Q1Cc8TBFqDInQrMD+A6uu2UOdI
         Ib6JGfIOfiXvTsTb+ILT8uurxCMsfHLpSo3p8ffngSYY0RghkeBl1xa274hprVPSh6aa
         O7nAikIpVT2ZVqx7CMTKkfOrK/KdQJfjdUDFh/d99Eveow6QGbFZ9r4zicEUO2CD/GnQ
         v5+w==
X-Forwarded-Encrypted: i=1; AFNElJ/jsOEaHvx8Xj8lDdYJfNvfS2l4Cahb5T8/hS2NVSYAskVBa6zyyexHj7Mj3ORM/iZGFSKATvG3Nbw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUxltNRrNhvqlNHTTb88W40lUkt5pFNz9OObF3hYVJF8llqELv
	kCtWdOdb8mZljVzUkeY44QTaozwHoAHJb3H5RU2zWP2U1TJcTdvER5+Njnka3UI1EtYlC7Tv/PN
	tgF9i9w==
X-Received: from pgam22.prod.google.com ([2002:a05:6a02:2b56:b0:c82:7761:9941])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6d8f:b0:3b4:6cae:4a51
 with SMTP id adf61e73a8af0-3b783b5ffdcmr817576637.11.1781226429893; Thu, 11
 Jun 2026 18:07:09 -0700 (PDT)
Date: Thu, 11 Jun 2026 18:07:09 -0700
In-Reply-To: <CAEvNRgE-qt8DAjOeE5ANpXzrgEKs+2_wh4YSmY=pe6krngBXqQ@mail.gmail.com>
Mime-Version: 1.0
References: <20260331194202.1722082-1-vipinsh@google.com> <20260331194202.1722082-2-vipinsh@google.com>
 <CAEvNRgGrPKBXh=VA3QBLJOczKRpMOB4nDmZL0XRwV6B3PT_7+Q@mail.gmail.com>
 <aisHySKe0PwM5DSg@google.com> <CAEvNRgE-qt8DAjOeE5ANpXzrgEKs+2_wh4YSmY=pe6krngBXqQ@mail.gmail.com>
Message-ID: <aitbveI2Sdx4s4BP@google.com>
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
X-CRM114-CacheID: sfid-20260611_180712_038352_77B8163E 
X-CRM114-Status: GOOD (  17.28  )
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

On Thu, Jun 11, 2026, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > On Wed, Jun 10, 2026, Ackerley Tng wrote:
> >> Vipin Sharma <vipinsh@google.com> writes:
> >> My (future) use case is that with hugepages, I want to run something
> >> like
> >>
> >>   ./guest_memfd_test --order=0
> >>   ./guest_memfd_test --order=9
> >>   ./guest_memfd_test --order=18
> >>
> >> And 0, 9 and 18 are the supported HugeTLB orders on the machine being
> >> tested. I'd like to iterate over supported HugeTLB orders at runner
> >> runtime instead of at build time.
> >
> > No.  The right way to handle this is to define testcases for the "interesting"
> > sizes, and then rely on the test itself to SKIP if the size is unsupported.  This
> > is no different than a test that requires EPT, or nested VMX, or nested SVM, etc.
> 
> That should work too. So at build time I'd make it define all the
> possible HugeTLB sizes on every arch, and then skip as necessary.

Not necessarily at "build time", the testcases can also come from your local
environment.

> Why though, why not find the supported sizes at runtime?

You can find the supported sizes at runtime, just not in the test runner.  I want
the runner itself to be largely oblivious to what's its running.  Disallowing
more or less _any_ test specific configuration/setup in the runner is the only
way I see of keeping the runner strictly focused on running tests/testcases.


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
