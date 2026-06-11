Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2877CCD8C9D
	for <kvm-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 20:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xGiK+J/BnsLD5dApOyWcoTXDe/SpDGS+eSJSfqt9xAU=; b=fJRpeRdZIGV4EKuF20fnlNTudf
	siQCAszWGIBWRBCkC1+h+GpIEwUocEfLFUJomNXbStOjv/wVqJuB56IDJSPle0neeyjX4IgJd2ndr
	A/hzuzOx9c5wA+oZH67tceAuHc4Rpe3lTTcKO83hkQL8kWgSpfmtmJEZp3+OhP0Eh+veL5bH2Cliw
	cH+SZsHwd68LYgPQUHUVt3zh1f3NvAHuXcJoWH63GdvRwPxPwf725WzOwV9J0QObybPDgX2+QGQ0/
	sryQxOfVrH7pJlJd5pOxe77jgzyyV/0HGdlXB+vOv88QjyFJCP+4EG593ukxyM6KOJPJaboABm+qM
	/ebUkLRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlpJ-0000000A23e-3hND;
	Thu, 11 Jun 2026 20:16:33 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlpH-0000000A23F-0DMz
	for kvm-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 20:16:32 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-13809223fd4so276753c88.1
        for <kvm-riscv@lists.infradead.org>; Thu, 11 Jun 2026 13:16:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781208990; cv=none;
        d=google.com; s=arc-20240605;
        b=g1LWr1B13FI17gqj5xQniNppan1v8PCQRhIOB6He5FfkhfBbC5IKrpvrgoTM3C7p6S
         6vjAys/NNLuC3ZeLNG97qExvYT3vYfCgXgVnbh2AmnPQi//AS1p1m38V/S5kr/Jtv/7q
         H3pmfw4capics6tIY9u7GtCq3BW6d09bdAdXqOMmtOPLyR50l6HGd8STZOcg7EMUe15G
         1poDON16iylj6tXi9ddwc7bFktkKCHIv02Hiu/MbE1mG+/IOe9TqKVhwHxhAV7KXXVD7
         6nxC3UzjqgINN5gl5EzN0DACYkafkHtVQ++VYyFKH+S3iqwlt4wUH1jkxO/2R4vpr7ru
         N/iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=c6w4o8cPFnkNvj1bY6N4ohMTXqYLTs78fDk/pXJtYGc=;
        fh=m4/+RtyNKQgtEehyI+Z3uAQG4GBB6i0YuiCnDXKUpOk=;
        b=FzymCUdd++9eiOnFJ92+8Cg/Vq3kR3ZZuyEYtASNhz2eHvWl73xLeianwByrBBigky
         BppheU9uVAmqUiZluf5xude5XI//SC3garUfOBOVLNRkff+Ol+VvLSPXjgg42ZNLFW6y
         aegkXVQGMaHJ3xvFbfKhpWR7GFjRZ0GbdNQLOc6CS9yUGHIsuoBvWawk0+xgR6mniv5L
         V8wuNlZaYJ8ZRmVg/ErTY8AaxbiYiYwoGYQubRjFbH7jP7b2ToQgvN9HFfy+7zakxthM
         d3wqMLwgtMrqEJA7BS1A6vYBfn1VgYUAbBVT2ouCc5nC+C05BtArUCmQ6OYvM81S37To
         luNg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781208990; x=1781813790; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=c6w4o8cPFnkNvj1bY6N4ohMTXqYLTs78fDk/pXJtYGc=;
        b=byY0HMJpzwBdfq97YXkxVxS77JjSc2js8FTmaJ93olYMLvwL0z/b2eQMnv4CE63wgg
         vkS/tWZOaG5UCirWdXh5dJGeLiFIJoYhk7jVBf55Rl3zTWcdS7n6uuXFtlsjbR3RXFjs
         uTBeOgXy1KzhFADdtiWyqWF/fc3G8azwv8vRUIO9mf0l183MtmK+8HXj/2LkNvMBx8pH
         XF235Sek1unFg4euPuBVth+YSiTFgcLZLKogyUb8sTyGt+yOhFuxf2PlCaP7ivf7rLQn
         RXxGhkw+gWx5xTuZXDgiE4NcXVEpgvwkmuHm29FoXnRIUESW7LcSES+neYKq97tIrAKn
         GINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208990; x=1781813790;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6w4o8cPFnkNvj1bY6N4ohMTXqYLTs78fDk/pXJtYGc=;
        b=b1K9h0ARkJ7q0PBrKJiZfxeNvArnmdlZ0cF+qjc6GcHuLyVJ1Ox1XvJGyS5gs04GEA
         /ds5jhqGUXXmPv/X/PwTwKcALyHWoGYE/Qln1vLA+Bpdbzq5GGgMBfuosYFqgSxSu+ap
         cztUyU45IiDC+Gtxf44duDKrkR9PD5CNq82uZoMrRhwcwo04/rwNCJOgxwaVlr0lZXM4
         hk9u8FWzK2A4xq2TbsmR5OBD/GDcC6Tyxt1mGTz4fSY6d6eW0PhHIhlRWA4r3vi0jqdd
         AsbHnbY19c1psz4mkPDA8WyRHLa7If5xNBzRNExCykGfr9f9uzBszXTR7j5fCJ/nFWn7
         x1gg==
X-Forwarded-Encrypted: i=1; AFNElJ/OfyZWLONnOfyi6DTTkJusAZUXAkE9lzbjl7kAf3SycBfcXM43IAf6pBhsu7hODnUXLN//BRzaVpI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2PGfxAkfxbQaQvxpB2xqL5OM9MkIXhzkhyWhnvRzCLAsojYbJ
	B+k1KhZnZ4We1LTjVW9juO1MnGqGX1QaMvXaN1h5OXEFZSlpDwsNzwJ3Qouzf1MbUZBXDWnNzk+
	Gg6YsmvWGhSrrTiH57sSA+GIp3OfSGzkn4EflNkuj
X-Gm-Gg: Acq92OGeBy4/slqWPrrePeeyQouyt+OIHCC9CKSvnZU2EVlH1RTr+ml7GNHy+S5bloz
	uyeo/AtWFvgcffpUlF1AJZTsISLP4DA6ccYBfVaqc6VmBYZOL45DqGLUq1f6CrUZhnJrL3tFHyo
	abrBQtscQeKbe9IlN30Js+onC2HoiS7lm46T02/PY+V5DUBXxY4Fiys6Z3u9gIG67wFDOQHgNNw
	XrzFhbH5AalRSZ1jxiS1ECqEih416NfEvV0SQiJwhtuQ78p097pQZqeBsI8u2bYITW47hsORUxH
	uRf8ImcyMGRFwb5ZNyqKfA+eDzfJ5lXwbLUgOew80nz688uZNito/kz4dP3eSmRpYc4Jvg==
X-Received: by 2002:a05:7022:fd04:b0:137:fb6c:5355 with SMTP id
 a92af1059eb24-1384211e6fcmr2478309c88.3.1781208989421; Thu, 11 Jun 2026
 13:16:29 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Jun 2026 13:16:28 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Jun 2026 13:16:28 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aisHySKe0PwM5DSg@google.com>
References: <20260331194202.1722082-1-vipinsh@google.com> <20260331194202.1722082-2-vipinsh@google.com>
 <CAEvNRgGrPKBXh=VA3QBLJOczKRpMOB4nDmZL0XRwV6B3PT_7+Q@mail.gmail.com> <aisHySKe0PwM5DSg@google.com>
MIME-Version: 1.0
Date: Thu, 11 Jun 2026 13:16:28 -0700
X-Gm-Features: AVVi8CeGqWOzdSyzWUUivrRwH0AG_QWu1g0DCt9ZOfKtFkCXDKefnGkWsFu90NU
Message-ID: <CAEvNRgE-qt8DAjOeE5ANpXzrgEKs+2_wh4YSmY=pe6krngBXqQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] KVM: selftest: Create KVM selftest runner
To: Sean Christopherson <seanjc@google.com>
Cc: Vipin Sharma <vipinsh@google.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_131631_112386_5E237691 
X-CRM114-Status: UNSURE (   8.11  )
X-CRM114-Notice: Please train this message.
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

> On Wed, Jun 10, 2026, Ackerley Tng wrote:
>> Vipin Sharma <vipinsh@google.com> writes:
>> My (future) use case is that with hugepages, I want to run something
>> like
>>
>>   ./guest_memfd_test --order=0
>>   ./guest_memfd_test --order=9
>>   ./guest_memfd_test --order=18
>>
>> And 0, 9 and 18 are the supported HugeTLB orders on the machine being
>> tested. I'd like to iterate over supported HugeTLB orders at runner
>> runtime instead of at build time.
>
> No.  The right way to handle this is to define testcases for the "interesting"
> sizes, and then rely on the test itself to SKIP if the size is unsupported.  This
> is no different than a test that requires EPT, or nested VMX, or nested SVM, etc.

That should work too. So at build time I'd make it define all the
possible HugeTLB sizes on every arch, and then skip as necessary.

Why though, why not find the supported sizes at runtime?

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
