Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182B1CD98DA
	for <kvm-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 19:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dOsbrzlvb0WTfWN9eG3picHY0/0JzRfuyJ6pzjzUtQ8=; b=fiJBHztihPShOv7yPWA4BV0Adw
	nv345HLNa7ujlgPi8kzdyjM3xq5ERmhmgtS+oUbao8WE/ne9vWo7mIoxvzib0inMp3Da6yYmfUFMI
	EoslZPCAo8eZYFqu3hNb7CQyy79NTMmZyFLvBhWRZy3bUBHr/eMKyVr/rPuGdTMk01rCSTgfVpd8G
	SEYb/EUbFbzcv9NKlHV1DyEz3Sw2I6qdcIEpq6SbrXGQivmGFVk6yggVB5IDlFBgSfYp7b2WsGfw3
	m5TnWjf5VWq20widPTIGT8a7qBJ2qSfTxFNixTJYAgVpXD5+gOhkV+N/Lp4EsTRxDlMZ2JaN98Zkp
	U9VEc62w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7oe-0000000BUyo-2MRW;
	Fri, 12 Jun 2026 19:45:20 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7ob-0000000BUyI-38PQ
	for kvm-riscv@lists.infradead.org;
	Fri, 12 Jun 2026 19:45:18 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-13810b63a1aso3017376c88.1
        for <kvm-riscv@lists.infradead.org>; Fri, 12 Jun 2026 12:45:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781293515; cv=none;
        d=google.com; s=arc-20240605;
        b=WbRvHalnP5E3mNzyGPTXRG9ybT3e0/ZNTOgu8DXqXJzD4Z2jTozvzA5VRU6+aOOEX8
         H6lXReEuYCjnuGRR+YXhQSlxdvWq922YQr8PSZh2gIMiSVEQfhOz3Kd0/rO2qRkzXEYL
         S/dbjLdhSdNx2gQXED+ORpHCYcKRBHzArIqtz2nGwEWzCequOz/te8D5I5yYlRBYYJMq
         T/p3G+KVcWTfShA39bBgm8QDiYCpIuSE975f9+Go2QWsKWKWAotaoKi9OqC7W15x13m0
         v/6w4iiOpY5MoNFjs0KNZush8uEeTnRKp/IqvfDQS1XQ+8PdZyf60kCzCKiqGBllZTkG
         u6RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=aLJTxmN0M9ZPVQW0kpELnacC0gVuFIrIwjygErMroM4=;
        fh=urOchaJ15wUhUFmzSid3g9F+vfschGUlph3FuSeu7E0=;
        b=NXo85R1zofSm/nFLZ+Y3JOqYA8Y5lPAcDqH0MsKwZfhztT3eQMJhZrQshlOiQomebl
         5SkzfVxJSytnMtIuOWg110Odab6wKm40TbyjzaqnhgfgNtTVUgvue+UqPZb8jrc8SQuN
         HKzIiENLpyAeqW4xwI+mdHrmdp75LPu2bVzyQNbf1ZKFMeBnyn/MOj34mPjmbn8B2G3Z
         RWtgj3HJT1c7eMz+PcoQBPiubpkSNuJp5Mby38uU8xZb4+GrQ6SyYXKP3hnyjPVuhran
         TzLDaxkhTyimoUrXRXv0MtPCWHEL9+pgg7+R4hwgyQcY0MY9hs5S3LDJpN82KAgCdsaY
         Q57A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781293515; x=1781898315; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aLJTxmN0M9ZPVQW0kpELnacC0gVuFIrIwjygErMroM4=;
        b=EYiXWC44gXfRRtv+RlyvYzrvGbrQS2k+0WDKc3A3NSkVvOmojidzDYhI2n6qKSiDKd
         pBLMR4yfZlnrcDu15naAaaXxo5D1GUk7vQ8epO37wKpAupy+UozAqwHVGX6IccYxQ5aY
         DE937SMIJ4YySrNXkIdc7jbG68gjPbKqsjGMoebpJLwoHOuZgQXExcUmocqGkVY1ot47
         5z9slS5E7cwKNegQgqmBv3ZyIFxPQXO0GApCBrZ2CRQBbMw7iKWUgOnQHHTlG0HOEOot
         OkmJCnI9aU4keMTYpuGZVgOxrY+StOF7u17raE1ClOw7O6Z7+tMAtXEE2Y2MUNrdS31w
         h+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781293515; x=1781898315;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLJTxmN0M9ZPVQW0kpELnacC0gVuFIrIwjygErMroM4=;
        b=fqgG0L7st16tbKSVCj4alGKRL+W5IuDl1rH1SYpSafx5W/2rk06isr+709nCCX9K5c
         dhG7ZcdYnkSoMYfgta8AzWcBbDF4r8klmXnaWDnQT3QWywbZYCY4QNjV2ALLLuDrnOqZ
         wPhK/23juwA0ZEjVn7TU5yFsKR2lvTU4LiJcnvraV0COd+0xa3tOwBhUeocNvmZx6uWD
         o7LAo9cLcfWnOJRdLCmM2i6aNzdMFJWqX8ER96i27Pvpn+xCwFUpL2V9oUDTRmPv2SpT
         dJrnYDocFWJ+Pf1CfOXBnXhhijGJVJ9qTe7BJbuzghAI5qUErIcVoMFPeJF/W7uql/p6
         0UjA==
X-Forwarded-Encrypted: i=1; AFNElJ8rO+Z7Q9efTOdzL6RUu7cok4PmjKK7CIZ6+gnpbDFOKeOtsdocxq9jcmFHZXEU2GnUM0M+jrfDYX0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdT3W0YyjuvOu4JZN10SxlRdTHP5zCNu8D2JQgrKClzrnNpaxn
	xQJFuEfG/yF5TbYFafb2Vd2VJc05wlErXElHUhOTYlQSeb//gR0nRW/lq162hjhIayYqhKs+URI
	kVsKEMhwItZ/HbdLY202stJn18VyQb53zOm7FrrEq
X-Gm-Gg: Acq92OEEYGvICmkc2cHMAtFoftrAsm05dPa9ql41TP3iB+fkL6nQ9zOlxU1Qy+NpDgq
	Bsv2LlzgXmw5sDkcM5ii18jf3TQJ9gxdsAJAaw0TTRsUGUbX5a/YSKS5k9Cx8zrLavFFqkQAOMp
	tCFbMHa4KN5NEiW6+OhuY8MgFXNwp1J8sgLVS8oGwGUU1GXPS/MiXQdjnDVRDDwCBJ/bdSz7jPN
	ZV0CHVjEtpGcq5JgfaeGYofIeTePGZmWXrxBQA5UTYgG4IoJQp2R4no4sWielfdUwmWDaIJPmi7
	L7QmOuOJzfNI2dK2Byeh6tpXhhLUrFO5XxEt2XUF6kWBdqANt9juAuObQL0/JsuJ0aBbVw==
X-Received: by 2002:a05:7022:621:b0:138:4fb:f284 with SMTP id
 a92af1059eb24-1384bb38d6fmr1989806c88.15.1781293514036; Fri, 12 Jun 2026
 12:45:14 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 12 Jun 2026 12:45:13 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 12 Jun 2026 12:45:13 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aitbveI2Sdx4s4BP@google.com>
References: <20260331194202.1722082-1-vipinsh@google.com> <20260331194202.1722082-2-vipinsh@google.com>
 <CAEvNRgGrPKBXh=VA3QBLJOczKRpMOB4nDmZL0XRwV6B3PT_7+Q@mail.gmail.com>
 <aisHySKe0PwM5DSg@google.com> <CAEvNRgE-qt8DAjOeE5ANpXzrgEKs+2_wh4YSmY=pe6krngBXqQ@mail.gmail.com>
 <aitbveI2Sdx4s4BP@google.com>
MIME-Version: 1.0
Date: Fri, 12 Jun 2026 12:45:13 -0700
X-Gm-Features: AVVi8Cca4ehyVmpS233WMcTKmiImcVUcWDNZomRwvPGwAtUbK8L6EJTEUMvzdMg
Message-ID: <CAEvNRgFLnGkqvvks3joAwPjqLz=ATmqiS0UWk71g+YEsxNsfsg@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] KVM: selftest: Create KVM selftest runner
To: Sean Christopherson <seanjc@google.com>
Cc: Vipin Sharma <vipinsh@google.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_124517_793156_9A75AAA7 
X-CRM114-Status: GOOD (  17.75  )
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

> On Thu, Jun 11, 2026, Ackerley Tng wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>>
>> > On Wed, Jun 10, 2026, Ackerley Tng wrote:
>> >> Vipin Sharma <vipinsh@google.com> writes:
>> >> My (future) use case is that with hugepages, I want to run something
>> >> like
>> >>
>> >>   ./guest_memfd_test --order=0
>> >>   ./guest_memfd_test --order=9
>> >>   ./guest_memfd_test --order=18
>> >>
>> >> And 0, 9 and 18 are the supported HugeTLB orders on the machine being
>> >> tested. I'd like to iterate over supported HugeTLB orders at runner
>> >> runtime instead of at build time.
>> >
>> > No.  The right way to handle this is to define testcases for the "interesting"
>> > sizes, and then rely on the test itself to SKIP if the size is unsupported.  This
>> > is no different than a test that requires EPT, or nested VMX, or nested SVM, etc.
>>
>> That should work too. So at build time I'd make it define all the
>> possible HugeTLB sizes on every arch, and then skip as necessary.
>
> Not necessarily at "build time", the testcases can also come from your local
> environment.
>
>> Why though, why not find the supported sizes at runtime?
>
> You can find the supported sizes at runtime, just not in the test runner.  I want
> the runner itself to be largely oblivious to what's its running.  Disallowing
> more or less _any_ test specific configuration/setup in the runner is the only
> way I see of keeping the runner strictly focused on running tests/testcases.

The runner should 100% focus on running tests, I think it's hard for the
runner to avoid the process of test discovery though.

The current test discovery process is to go down the tree of directories
and find files, 1 file == 1 testcase. Each file should (statically)
contain a single command.

Since you're not opposed to runtime discovery of test cases, how about
something like:

    if the test case file has executable permissions
        execute it and get back a list of test cases to be run.
    else
        read it as a single test case.

I'd then use the executable version, check HugeTLB setup on the machine
under test and return bunch of separate commands to be run (each with a
different HugeTLB size).

The runner still doesn't need to deal test-specific config, that's part
of the executable that tells the runner what to run.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
