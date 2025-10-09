Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB93CCD184
	for <kvm-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 14:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=90VESDI8ncUWXX7rWk91PFZtvAKj7fwIriY1RgNkvP0=; b=QI1z9AOV2+Q+b3
	VTCcq5I4FMpA/rc6A7+0kMwKUY8NaK7chCZJbLwly8B+S4wW2oHNLtzhRkNlmXcxSK49hn9VjhV+w
	THkem77Cg/B8D6K3WzKD3PyYX7sO2g/DFbq6rQRc7tSIjop7bPBJfExYplGRB+3si39otmtgJR5ec
	5pA7To5OEpYufNbNeqjwSd7ri2GTPrn5N6N/wwfB5jtIaqSxWsGRIFD8FR8fyJbszZNcBXJ1JYSIf
	GQlgekqX+fkYG64x/Y1XxnknzHk6gWln4PSqd7KxyxUTe+4jG3flNmVg1YEqmjX19A4Z35ixqehxN
	amKfXe2XE6hbMJDV6AMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6rom-00000006Lwg-3IjT;
	Thu, 09 Oct 2025 14:40:32 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6rok-00000006LwH-0067
	for kvm-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 14:40:31 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-4259247208aso7462415ab.3
        for <kvm-riscv@lists.infradead.org>; Thu, 09 Oct 2025 07:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760020829; x=1760625629; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yvXkTMwKJ07zycGMackYC55rbv2yAD6SRl32nfwnd0Q=;
        b=TjctAwnBO3HtwjOj8Tm/8/9/sFR4ASpWJ0iuueT94DOuWDp0wXXA+T0nuYW4v868eH
         PZYSJpptU28OJErz4rKIYfUrynltJMrKUPGD5CwMHDsAmNcblWIglJHz2EZPQ7TFA5jy
         Y2wIkElFvpGsxN4AcmW2UAU0wW1RpeAO95WoaAOchKV8T/DX+3XlikrkGsPjUsv4z1ys
         MPmGr09GeEUcVGKug3eNJ7CIGeoqqyhF7+A3il/bG089DEZeUmEHt3Z7HuM/R4xAmB2Y
         0M5u1HUl5MUz6ynGwS806hVyR2l1Cr6UmOfM9EQ7ruvkoOMDaKwhAh3pgKPnPEOotAzf
         VQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760020829; x=1760625629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvXkTMwKJ07zycGMackYC55rbv2yAD6SRl32nfwnd0Q=;
        b=OVx0MjCTVUk7R8GlteaeKLDGx6UabnTuu9xgqpQEnsfQySgtrxBoIa4Brbup4y+wUF
         BHE8ac0ph9P9ueSdKNGs98m/6wEYpX04BOqWjJwzcUthcODwD/OzeKlCAqiJtB2iyVUI
         9svPC6QM/tg08sq34S61z8R0Ou3koFGyCpjOtJB+2zEkuhtTFKZeqP+AlAoSuz1p14Fm
         EZ7iE95Zj2ecOyE7getfVyAb+k4kPvTsu2kvb8MFydirX/OmxmGDYJWM3CZu8aHbl0MN
         1D4XF0c5Id4MlInlQ5q7AlPsbd8i3JALLhM2w6W4mSfRhj0rNTiyHR2R7UGOFFxdebC2
         SvVA==
X-Forwarded-Encrypted: i=1; AJvYcCX4vYkt8FclW4oELTU0Pn1VbzVYZsgILN6txccGrCbveK6IVzgXbJG+OwwOP8m9kMU3T2sKkAzoBbA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvA9P9+1sJR13NggScS73+Y76xzCpYIyi5p9EAWWLi3H/+T75/
	GYiKpZdhFLgyLK02xUnR1+W0UbApRNQOxtEGcaQPlvHjK3V0XUW5+QEcPw64nje332w=
X-Gm-Gg: ASbGncvF6NWSYeazE+wcCRfrp2WgthIa3AYrnizp6M3nIxes7HnZ+Qhaga9mtGTiKhv
	StarWuWRkJZB+W8ZmMXOkwNY2Ll+mx5HCHlR2f0PfYQFBozQKtt3czL5EFCPLcP/LW88F3OHp7c
	qNhBNIEktIkM0f6LGCfWMZBbRmo4ry79BfOU81QoGdJPeU6V07uby+aPFLIzgaovq0um5l8oaWM
	QaTiRrX39jSivUmAozthZnzh4+rxhiQvwswLEnmjK0mAUlzYdlD5khKbJiFt5CQU4W7ku6zvjlI
	f8qCaRFWg1iZNuACuF6+jyx11kuoMg8Scx8ZPlZaM6SUhFGYRDHlOvi3ON9vfzbkLvDz1osOYU0
	342Yy5aOiZlcpV5KT25z2nSC9GesHgrvFPeK9+/iM0GQSAFQyGZl7DHKszAQ=
X-Google-Smtp-Source: AGHT+IFwqFVM9/6leTIDYMEYAb5ogU2LylmIM18QfTZ/qS1hx26rBuuvl+qg1EWVrHjTdJ5xj1yleA==
X-Received: by 2002:a05:6e02:1d8d:b0:42f:8d40:6c4b with SMTP id e9e14a558f8ab-42f8d40719dmr50934235ab.11.1760020828706;
        Thu, 09 Oct 2025 07:40:28 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42f90386a49sm10628885ab.35.2025.10.09.07.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:40:28 -0700 (PDT)
Date: Thu, 9 Oct 2025 09:40:27 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Wu Fei <atwufei@163.com>
Cc: wu.fei9@sanechips.com.cn, kvm-riscv@lists.infradead.org
Subject: Re: KVM: riscv: selftests: sv39 support needed?
Message-ID: <20251009-fbe27696dc9ef50de56c44d3@orel>
References: <202509170234.58H2YCma081344@mse-fl2.zte.com.cn>
 <20250918-618ded295b364b5aee7d17b2@orel>
 <305003be-8f8b-47f1-bbe6-17c547eb3725@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <305003be-8f8b-47f1-bbe6-17c547eb3725@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_074030_066847_E0A809A3 
X-CRM114-Status: GOOD (  28.77  )
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

On Thu, Oct 09, 2025 at 08:40:03PM +0800, Wu Fei wrote:
> 
> On 9/18/25 22:13, Andrew Jones wrote:
> > On Wed, Sep 17, 2025 at 10:11:05AM +0800, wu.fei9@sanechips.com.cn wrote:
> > > I was running kvm selftests on qemu-system-riscv64 with "-cpu rva23s64", which
> > > uses sv39 by default, then I got the following error. After some debugging I
> > > found sv39 is not supported for selftests, should we add sv39 support? I can
> > > prepare a patch if it's needed.
> > Yes, please.
> 
> 
> Should we add another mode as VM_MODE_P41V39_4K? The smallest VA is 47bits
> on the existing modes.

Why P41? sv39 supports a 56-bit physical address. To support sv39 I'd
expect to add a VM_MODE_P56V39_4K. And, afaict, the reason we don't have a
VM_MODE_P56V48_4K is simply because when riscv support was added it
didn't add any new modes. We could VM_MODE_P56V48_4K as part of this work.

> 
> Also, is it necessary to add mode for sv57? Or we can just use some existing
> ones such as P52V48 instead.

We need new modes that support 57-bit virtual addresses to test that
support, and I'd like to see that. Again we have a 56-bit physical
address, so the new mode would be VM_MODE_P56V57_4K.

> 
> > 
> > > # ./arch_timer
> > > Random seed: 0x6b8b4567
> > > ==== Test Assertion Failure ====
> > >    arch_timer.c:73: false
> > >    pid=144 tid=146 errno=0 - Success
> > We can avoid errors for the default case by adding a
> > kvm_selftest_arch_init() function for riscv which calls
> > guest_modes_append_default(). We'll also need to modify
> > guest_modes_append_default() to configure the default using information
> > from KVM that can be obtained with a get-one-reg of the satp_mode config
> > register. OIOW, use satp_mode but otherwise just mimic arm64's setup.
> 
> 
> Is the current kvm_check_cap(KVM_CAP_VM_GPA_BITS) equal to satp_mode,
> 
> e.g. gpa 41-bits always means 8 in satp_mode?

No, KVM_CAP_VM_GPA_BITS only tells you the number of physical bits of the
host, which dictates the maximum mode you can choose (see
lib/guest_modes.c). You can get the maximum satp_mode with get-one-reg
RISCV_CONFIG_REG(satp_mode) and then use that or anything smaller than
that for the mode in the test. See lib/guest_modes.c again to see how
there's support in the test framework for looping over modes in order to
run the same tests on multiple modes. To do that, the test will change
the guest configured mode with a set-one-reg of satp_mode.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
