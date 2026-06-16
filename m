Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C028CD98E1
	for <kvm-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 18:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=usGFqo1vcJ5NSO2qq3uDA+ESnRwKJZfshdGQAWeq2CU=; b=GNyvCGXxt2CQ/u
	qHKvOJPX5uV8QHUYhvbtBtZvDIDRlH7MgSeJ3Xtn1xj2z/OTiZaBqdysNND/O1o6XvVfLvENdfDbf
	892X70yFoeQ6G15ZiPR8VmeFS2Y6i4VOM5tBAaNW4KI1PB8uKON9KJhhFYE0ZPWRhn4iNGqY26MFY
	AiB/ui2eXj5cy6mznqwN1oj0Ky1IGc1rKdLzWTmGzY/pXvEuOqOeYwoMlNhYykDRp4NXWaXhEti7O
	CdErfrxRSY+PWcuQpn4IC48XAIwo703KOqYzWYGYzjTTXnoVT32jXgljzjBVVNcfsGn1wxCnOvBMb
	q0qqe0FzMEduNkVSGiBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZYY2-0000000GD6l-2od8;
	Tue, 16 Jun 2026 18:30:06 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZYY0-0000000GD6N-2OEu
	for kvm-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 18:30:05 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2c69fa0b1f8so10405ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 16 Jun 2026 11:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781634602; x=1782239402; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cX4ssr4Y9/OOfcYZ2FcReQvMLH2Gq4SbTEa5005JITE=;
        b=gqxs+QrhM1kQ3n5R1+9x0055cT4F2g1EXquhz6gq7y1vP/FHOceZzkfJiOw3j5ECWa
         fWto+rkcHrhJRzeVm5nzoN6CWfurv9JjPZ5caiPTF2sUx+bX44WvUGhee9rUsw7kZ1GH
         GqIfiNn9S/kNGOsCqMdoK/o2osQmEcAy7lH8g/KkeRbLGG3kRCsFjPUKq4oWIogpnlvM
         mCOpZozfgGgWaZxK6g8zYqU57oAklxvlh0nP8Dv9FvZ+vRvW9MwufCE8aeaUzO8/p4Hr
         D1BuLoXRZGzYIckfAUW3zUGws3TNq0WyxDrMkenw2yy4O1tt6Y3hLcUiNQGv8b4NqEmr
         CqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781634602; x=1782239402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cX4ssr4Y9/OOfcYZ2FcReQvMLH2Gq4SbTEa5005JITE=;
        b=gYhigAC17YH6nYmfnfucVLYop9Q7dC91a9Mjgl/t9gj1ttbwO8XSb7J3TIy4qvRHua
         x4cT/F8+fuIOOakkjal0yZo8CfP1v0XYLLkZa/rAGhPspt/kphQfP7xcqCQu/cyUwjJB
         RK5lH4mtp7hCEsPVPQHuYZAwjLrbxwQ0x6MkiM+PUKYdPQ8vaiJqWcPmAQoxGr9dxmZx
         yI/9QbskwXhMHztgdMfeIWiWUZAYOPNZ8Otx133dlQTqhz1QaZs2QMfQ9Ju9KvRdIfFK
         k+2KNwqvKsDDj8Y71IWElM6H6Kce390Ut4/iM250/waxCQkw5uhB1jiTewvYriFmK9WP
         +Y4g==
X-Forwarded-Encrypted: i=1; AFNElJ+MAJg9LRjdL+GbgIwCA/dOU/aXppG73o01J3+8Dd50jh9YRv6SoCDjeJ+NuHVL+7F7bl+J/33qiws=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWDz5BqCz26EOmCTQQHcbGfEWf+E7VM9/FaKB3zbGFmjo30L2E
	NQ7FyZfHh/DIIk2VSkx8/gAsRYYVRXw1JK31P1AzACyiHXWNtqM/qEE2cbgxCwJ+eA==
X-Gm-Gg: AfdE7cmx9MPSkj/5rPckPTEP8qw8ZqVZFuKjz6NEmCNrhpaAQxwBAS5x/5sSmx5T3ud
	1moj0/iAZec6a6MOACbQdnzeUtiGn+dJqa57KMP9H+2T7cC0PHBfLoSWBZaBmJqh0w8mLA//n+W
	CNgQ7RwxudxUbhN8EGzMqf0iJnGe7HEGpXT/umAHjh5RDRppOE+KDlNcK/tTQXX9MqYmwj9D7i8
	dGXwQAO81FN5sQ1xxQSnaVO5lv/Ac7NubCSZVjU7k/YOFm39TtVq5h8fCZ5VTIwz5ZvwMITiLDF
	faO/dDcwJuveWpzwcnMGxPAnhfi7P2DlFVx+IaiseMz/l+c/935wjygHxfucLMwjobup8zbEqYF
	jMThBeKka31H8pvDEe+Y/mjzHYmLlQ4GVG1ykDvnf/w4ujovbxpwzSgI/KYUJXlg++nfasGt5JW
	qUVa+fdh00YSNk1e2vqkY2PEt663LvUx/KEt0mhN1t2hAss39nLRmG+TmK9g==
X-Received: by 2002:a17:902:ce91:b0:2bd:7bec:f0e6 with SMTP id d9443c01a7336-2c6bbc6030fmr270055ad.1.1781634602099;
        Tue, 16 Jun 2026 11:30:02 -0700 (PDT)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521aa047sm4617808a91.3.2026.06.16.11.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 11:30:01 -0700 (PDT)
Date: Tue, 16 Jun 2026 11:29:56 -0700
From: Vipin Sharma <vipinsh@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, pbonzini@redhat.com, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	anup@brainfault.org, atish.patra@linux.dev, zhaotianrui@loongson.cn, 
	maobibo@loongson.cn, chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com
Subject: Re: [PATCH v4 1/9] KVM: selftest: Create KVM selftest runner
Message-ID: <20260616175210.GA1675268.vipinsh@google.com>
References: <20260331194202.1722082-1-vipinsh@google.com>
 <20260331194202.1722082-2-vipinsh@google.com>
 <CAEvNRgGrPKBXh=VA3QBLJOczKRpMOB4nDmZL0XRwV6B3PT_7+Q@mail.gmail.com>
 <aisHySKe0PwM5DSg@google.com>
 <CAEvNRgE-qt8DAjOeE5ANpXzrgEKs+2_wh4YSmY=pe6krngBXqQ@mail.gmail.com>
 <aitbveI2Sdx4s4BP@google.com>
 <CAEvNRgFLnGkqvvks3joAwPjqLz=ATmqiS0UWk71g+YEsxNsfsg@mail.gmail.com>
 <aiycmwMbhWuYghJh@google.com>
 <CAEvNRgGkjcVN80W7cNd1-tEUXAfnFXEekokh_VbMDb9XdecVVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEvNRgGkjcVN80W7cNd1-tEUXAfnFXEekokh_VbMDb9XdecVVQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_113004_655074_55C99FB8 
X-CRM114-Status: GOOD (  35.04  )
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

On Tue, Jun 16, 2026 at 09:15:24AM -0700, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > On Fri, Jun 12, 2026, Ackerley Tng wrote:
> >> Sean Christopherson <seanjc@google.com> writes:
> >>
> >> > On Thu, Jun 11, 2026, Ackerley Tng wrote:
> >> >> Sean Christopherson <seanjc@google.com> writes:
> >> >>
> >> >> > On Wed, Jun 10, 2026, Ackerley Tng wrote:
> >> >> >> Vipin Sharma <vipinsh@google.com> writes:
> >> >> >> My (future) use case is that with hugepages, I want to run something
> >> >> >> like
> >> >> >>
> >> >> >>   ./guest_memfd_test --order=0
> >> >> >>   ./guest_memfd_test --order=9
> >> >> >>   ./guest_memfd_test --order=18
> >> >> >>
> >> >> >> And 0, 9 and 18 are the supported HugeTLB orders on the machine being
> >> >> >> tested. I'd like to iterate over supported HugeTLB orders at runner
> >> >> >> runtime instead of at build time.
> >> >> >
> >> >> > No.  The right way to handle this is to define testcases for the "interesting"
> >> >> > sizes, and then rely on the test itself to SKIP if the size is unsupported.  This
> >> >> > is no different than a test that requires EPT, or nested VMX, or nested SVM, etc.
> >> >>
> >> >> That should work too. So at build time I'd make it define all the
> >> >> possible HugeTLB sizes on every arch, and then skip as necessary.
> >> >
> >> > Not necessarily at "build time", the testcases can also come from your local
> >> > environment.
> >> >
> >> >> Why though, why not find the supported sizes at runtime?
> >> >
> >> > You can find the supported sizes at runtime, just not in the test runner.  I want
> >> > the runner itself to be largely oblivious to what's its running.  Disallowing
> >> > more or less _any_ test specific configuration/setup in the runner is the only
> >> > way I see of keeping the runner strictly focused on running tests/testcases.
> >>
> >> The runner should 100% focus on running tests, I think it's hard for the
> >> runner to avoid the process of test discovery though.
> >>
> >> The current test discovery process is to go down the tree of directories
> >> and find files, 1 file == 1 testcase. Each file should (statically)
> >> contain a single command.
> >>
> >> Since you're not opposed to runtime discovery of test cases, how about
> >> something like:
> >>
> >>     if the test case file has executable permissions
> >>         execute it and get back a list of test cases to be run.
> >
> > I don't hate it, but I still dislike the idea.  I am all in favor of runtime
> > *discovery* of testcases, but I am staunchly opposed to runtime *definition* of
> > testcases.

I don't think we should support this kind of usecase. Our goal is to
keep test runner as simple as possible. This will add one extra parsing
logic in the runner and also add more wrapper scripts in kvm selftests
for tests to create their own dynamic variants.

If dynamic variation is needed, then there is one option in this runner.
As testcases are executed by runner in a shell environment. This
basically means the test will run as a shell script and provide variable
expansion or call other terminal commands if present. One can define
interesting configuration which can be dynamic based on the host in a
testcase file. For example if one writes a test command as:

  dirty_log_perf_test -x 1 -v $(nproc) -i $(( (RANDOM % 5) + 2 ))

This will run above dirty_log_perf_test with the number of vCPUs equal
to the host CPU count and some randomly selected iteration count between
2 to 6.

This way one can provide interesting configurations which can test max
of a system in a separate test directory which can be invoked when
needed.

For predefined input values of a test, either one can write multiple
*.test files or use kselftest harness and add kselftest API based test
cases. Both option will still require that test should SKIP if something
needed is not present on the host as mentioned below.

> >
> > If I define guest_memfd testcases for 4KiB, 2MiB, and 1GiB pages, but the
> > underlying system only support 4KiB and 2MiB, then I want to see a SKIP for the
> > 1GiB testcase.  If the definition is dynamic, then the 1GiB testcase simply won't
> > exist.
> >
> 
> Seeing the SKIP is a huge advantage over dynamic definition. Thanks for
> explaining. Makes a lot of sense now to have everything defined statically.
> 


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
