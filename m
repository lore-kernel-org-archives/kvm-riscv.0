Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47274CD98E1
	for <kvm-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 16:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1FkKJMLt4w6MAf7gPzT/wu7pOBQ0fntpzuDE32pJm38=; b=nwNLofxEU73wrKh4RjthLHNrfc
	XYWlwFggPPeU9pKkJyYV2Yo2AgkZheeDZTLFX5zEeib02snMvbyTQ89cn5wRoUEM/T2vhppnfrsWS
	jK/t+rBS9NGLLjymu1AZsfWPYGHMLPi9eIjv/I+uRkJUUNnlqsdajWh1x+stjDv2KGh22xVWGvmco
	MLluK94RUelL5j7uB5MMVUL3/ojWnHvLw38XGmGTsp1kC+Ros6AzZekniPjVTy8GMWuwSfhKnDrBF
	/97gftboAROJti/PUyw0saFLeRqP+36DaxMgPgwmOImLXClYoch1I8qoPJtXm5H0zBYf1U+FPuBjL
	BHkgdIEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZWRn-0000000G5R2-2gML;
	Tue, 16 Jun 2026 16:15:31 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZWRk-0000000G5Qc-11KI
	for kvm-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 16:15:29 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-30bb7d20ad9so1065779eec.1
        for <kvm-riscv@lists.infradead.org>; Tue, 16 Jun 2026 09:15:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781626527; cv=none;
        d=google.com; s=arc-20240605;
        b=QaokVvscXpDMLJKlu4+w0Qo5qulL6aNMVbYzFgv+0LlUUfDfn0fvsTEBm9tbTIhuQf
         gfShZHh+IDFTV7voyhqvOGN0ZfGOsoB773nS/44ohI2LhHFrsP0XyTYc2vmhxZgQlvjQ
         E4TjWKAqCK3IYb5o67Nqt59vQ4OIixnpoTSIoOQ+EIULGcr14DX3AzPPFCj2hTXOvvhq
         hnNbd5UmAb3bA0HLhmtm1GA0DnnapLOwl8mKCNf6H30PvnGwRj1STH7qc0mXrQdo2HES
         YkhSCQvoVxZtaKid516BMkn7xpu00/HMJSuDKN99sYziSOURv9hhNLx3375EYKprYFXx
         QvWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=KxrAh3gZox9w5915Zp8CYh2ybM8dKM0MmMGgcGgqfcQ=;
        fh=qMG5mVyiXm50mbx+OdawOTpUjaBoC3qDX9iqU2wO6l8=;
        b=afZnW0D9LZWY1tHASIcGhE10l83mUG7Lcmd6qunHfZMrCQ4vaVyWANj2e1X0bkJNsr
         jTU6eerGTT2/eWtUn5X/TJ8PfJn6r1JIHOkFPP9by8efNTxf9bZEXQV3OTrli38tqsZS
         vscTgt9+RxpaWsxuvKK/JNVth8Yt6MTm+H8BH6n/XvDf2ByAOvfrUUeaXMVWcCXJhoNY
         OiLKvwCwpVC4KlNWcDsJQSWY1js6RPrd74GjXXJr9JI72H0u/qQBvxmnG9037jiFZjGz
         FbhsVWlkAO2E8Em48UA2bCMDOxsyR36r/pHVN5F5LG/OoZZj7oqKwhIProcoGNMeFsMD
         BS9Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781626527; x=1782231327; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KxrAh3gZox9w5915Zp8CYh2ybM8dKM0MmMGgcGgqfcQ=;
        b=UNfDr2JmNgBYhAFi/Z3n4QR5znwZyQJ6/Z9baWGRDOyhT4uvPB5tlpJy09JlsXNFu6
         iwz0EHUErUwSQ7ioHP/ExqU7FIEj8xii6l8odRbux7PQjU5sMq5Kk8Y2Le/wTbA0t5fY
         KIXbqhANHX1L7mJV6TeoKUhyuyS+HqPvEMWn2iRvRQklZgJ0uEJVmFrAj810DwW1VsJ7
         hSn7oKtKPD8vipU82sObsQF8/Q8csT/RoURRtjP3MfXZjtfFF0W2EobyoB/PUL7EuKNL
         DbAJ92gpIYi3ZBYs+vRUw9/9Oliy5TrLn+fYGLr3QC0dBqul34soUufeZxXwO9/fvGqS
         fi/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781626527; x=1782231327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxrAh3gZox9w5915Zp8CYh2ybM8dKM0MmMGgcGgqfcQ=;
        b=HxQro/lK3/SzSNNK1nZ0yLBzHgdVQ/0NPAjuo0tktN73+dBE8l+w/HvSWB7z751lgs
         AnKlrUfzQsci9ocOJyPodj0c2RtoMOrHXAFoSbAT/Ph0U7eD7OnQG83dpvQssLcFf6jb
         Bbbi72k3EZt5prQrQYdMfZKZZolJjfP0GP8RZt2faq9x5RxHTLkpmT92PhlJ+dLzhr59
         TRuEgjKzTOQA99VfmU7f92uKwthVxMvOd/QXePXe6hwCjvFEQ1kKfcM4co8BXkAlcDir
         CFNvUTEDeYuaGkL9TdQGNZXkcUjXTCQlFnhX/0IwgJ4Hw3t8W6On3A/VX2ImfWUVMUg2
         QOZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8D8tVBnU2Jk3nDkrl3jXKsJ5/xlTTC02XcRvr3LkGozi+azQ3OrEB6wfMD/swtjc5KIxU6njWpRGE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzgaBpFLk/mDFdy9Kv+l9LhE2SbWEcHlEiGJK2BBPwMbjOGTza6
	NSYDR0xNqm1FWQyw/2CdAZjaM+gV7OHrLfTp599BINf+ofhU8F2HDb+K3ovqCft3O93nsA1+Fez
	UrNqHkHzVmH4dVUUI1JOnHbWX34hC7p1bEOt3fUhV
X-Gm-Gg: Acq92OF9R0Fwf2DJL2ujl+emLOI9CmWo+soJiVGM/Fkr7wYo0WgWmSTFVGtcQRsSP/q
	zv+Whcg5SBtBU+Ys9H9rIWtUa4q1NOf4OADkJt5d7KdV0yNITfO9LvCR73dA8VyfG6w2PPIlBQY
	x2I40FGYvD3UcjjN0K6ehRg59hM38h4EKHd2xumV6TeWczf6Cq+Uo2/poNeEb/6Toae2Rzzgzsx
	E7kmGwAgBI7h8XvyaEihheDn/80v8euVH/fFDx4+AZXsftHShPeqbLTHKd3ns1UABwrhZFC3K3j
	0ldq34OPUiOVQGLd8XhFB813LKv+2kMqvkU3bQtmbuKTOLmGjCqrYCV5fI7znUh164r/ig==
X-Received: by 2002:a05:7022:418:b0:137:fe07:8a2d with SMTP id
 a92af1059eb24-1386f24121cmr7479488c88.6.1781626525576; Tue, 16 Jun 2026
 09:15:25 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Jun 2026 09:15:24 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Jun 2026 09:15:24 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aiycmwMbhWuYghJh@google.com>
References: <20260331194202.1722082-1-vipinsh@google.com> <20260331194202.1722082-2-vipinsh@google.com>
 <CAEvNRgGrPKBXh=VA3QBLJOczKRpMOB4nDmZL0XRwV6B3PT_7+Q@mail.gmail.com>
 <aisHySKe0PwM5DSg@google.com> <CAEvNRgE-qt8DAjOeE5ANpXzrgEKs+2_wh4YSmY=pe6krngBXqQ@mail.gmail.com>
 <aitbveI2Sdx4s4BP@google.com> <CAEvNRgFLnGkqvvks3joAwPjqLz=ATmqiS0UWk71g+YEsxNsfsg@mail.gmail.com>
 <aiycmwMbhWuYghJh@google.com>
MIME-Version: 1.0
Date: Tue, 16 Jun 2026 09:15:24 -0700
X-Gm-Features: AVVi8CcVnuVCx19L_GWSZ2nltEautD7sT8OALv94LzUOkIdPu2pxUDWRobjVJhw
Message-ID: <CAEvNRgGkjcVN80W7cNd1-tEUXAfnFXEekokh_VbMDb9XdecVVQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] KVM: selftest: Create KVM selftest runner
To: Sean Christopherson <seanjc@google.com>
Cc: Vipin Sharma <vipinsh@google.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_091528_348109_7EC76008 
X-CRM114-Status: GOOD (  23.88  )
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

Sean Christopherson <seanjc@google.com> writes:

> On Fri, Jun 12, 2026, Ackerley Tng wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>>
>> > On Thu, Jun 11, 2026, Ackerley Tng wrote:
>> >> Sean Christopherson <seanjc@google.com> writes:
>> >>
>> >> > On Wed, Jun 10, 2026, Ackerley Tng wrote:
>> >> >> Vipin Sharma <vipinsh@google.com> writes:
>> >> >> My (future) use case is that with hugepages, I want to run something
>> >> >> like
>> >> >>
>> >> >>   ./guest_memfd_test --order=0
>> >> >>   ./guest_memfd_test --order=9
>> >> >>   ./guest_memfd_test --order=18
>> >> >>
>> >> >> And 0, 9 and 18 are the supported HugeTLB orders on the machine being
>> >> >> tested. I'd like to iterate over supported HugeTLB orders at runner
>> >> >> runtime instead of at build time.
>> >> >
>> >> > No.  The right way to handle this is to define testcases for the "interesting"
>> >> > sizes, and then rely on the test itself to SKIP if the size is unsupported.  This
>> >> > is no different than a test that requires EPT, or nested VMX, or nested SVM, etc.
>> >>
>> >> That should work too. So at build time I'd make it define all the
>> >> possible HugeTLB sizes on every arch, and then skip as necessary.
>> >
>> > Not necessarily at "build time", the testcases can also come from your local
>> > environment.
>> >
>> >> Why though, why not find the supported sizes at runtime?
>> >
>> > You can find the supported sizes at runtime, just not in the test runner.  I want
>> > the runner itself to be largely oblivious to what's its running.  Disallowing
>> > more or less _any_ test specific configuration/setup in the runner is the only
>> > way I see of keeping the runner strictly focused on running tests/testcases.
>>
>> The runner should 100% focus on running tests, I think it's hard for the
>> runner to avoid the process of test discovery though.
>>
>> The current test discovery process is to go down the tree of directories
>> and find files, 1 file == 1 testcase. Each file should (statically)
>> contain a single command.
>>
>> Since you're not opposed to runtime discovery of test cases, how about
>> something like:
>>
>>     if the test case file has executable permissions
>>         execute it and get back a list of test cases to be run.
>
> I don't hate it, but I still dislike the idea.  I am all in favor of runtime
> *discovery* of testcases, but I am staunchly opposed to runtime *definition* of
> testcases.
>
> If I define guest_memfd testcases for 4KiB, 2MiB, and 1GiB pages, but the
> underlying system only support 4KiB and 2MiB, then I want to see a SKIP for the
> 1GiB testcase.  If the definition is dynamic, then the 1GiB testcase simply won't
> exist.
>

Seeing the SKIP is a huge advantage over dynamic definition. Thanks for
explaining. Makes a lot of sense now to have everything defined statically.

>>     else
>>         read it as a single test case.
>>
>> I'd then use the executable version, check HugeTLB setup on the machine
>> under test and return bunch of separate commands to be run (each with a
>> different HugeTLB size).
>>
>> The runner still doesn't need to deal test-specific config, that's part
>> of the executable that tells the runner what to run.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
