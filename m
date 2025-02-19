Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1ACC021AA
	for <kvm-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 08:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kDFVjLD1PCqhT+s89kxVz3DFvBiBmCMrW8MsbPydAu8=; b=wwAJqfEZlKUNf9
	xHLdctnOChfC5h0FjSwyGJhN8nIJquwxZHKOS3mryDYI1RJsdkoLaBMlBee4J4QoB7pA3qaUbp2bf
	O7nJU819U/65rVJ/PiFJ9xlq5bh0exTymz2ZlnPamQL4Q9E1+heI/KXteY5w33RCCaLI8MK6lWFWe
	v3zDDysBYZfhSu6fx8JnQgFauNr7O2o06K+1gwvgB3uy0qL0/PYOorz/u8mT8ZYFh9xGnrk87i5TR
	DXSEtIqJb4yMo+Ay/Wj2W7U2Ce+MbT3zieCRDm697HV6EHoij03Mz0b6BpfMwidaugdxqIcc/ixP6
	Yc0pxKRnU/J/Y/KGiEIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfoO-0000000Beiy-3nvL;
	Wed, 19 Feb 2025 08:52:08 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfYv-0000000BZKX-02H3
	for kvm-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 08:36:10 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38f2b7ce2e5so2660340f8f.2
        for <kvm-riscv@lists.infradead.org>; Wed, 19 Feb 2025 00:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739954167; x=1740558967; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hX5Pqy74HJXGhYd3EYVGCK1e+ORfs5MU+F8H+njiblE=;
        b=fS3FjYJGyqCLb0dvezGwFk9jMFUMnrPk7ODT7E58EVlemFEZ1gTQmnzpkYfFu3Ja8X
         flaISJ84q5/G07bYQ//XSWQYLbpah+ci3YsPOVP3y8iGNJISdx4SAbVofN9POyGKQNSt
         c0poO3EMAdTnnuXDmujYjLvzCUJJX7gblPm1qJ/UnFer75hwgXLaMjviyTvLjYuaoNvR
         zz2meWFblIST1mImdEXFfqfO+ksxwVOd9YZKZA/6bMvcfOS4SOGsZl2n4Mj4hy1T9UvF
         QSUCQW2TQFCS9qbBFV5MvM+fqFojElHwu7bMl41OdYXUMU1hQ4jm0J5h7xB7+C0Lf3Ma
         C1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739954167; x=1740558967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hX5Pqy74HJXGhYd3EYVGCK1e+ORfs5MU+F8H+njiblE=;
        b=gbi2mQ0vyTCtzPsyuTOiXOkbYrW8XopH8L33NcURxsAjA1wboTqjhHdK3J/tKheU4c
         cxR3Y/XYQpmquhsUX9HhOxFJGctKy4KSblPbMiCgE0NCAlfyYzAdzMhsB2Cw9KSsb8r0
         tvWqddKe6Z5gJ4CpUSE0Mab4EDC72YC7oaDlXhNy0tiAm7f9ZfXrj+gcoHbJ8rdOpaWR
         FsIfV2lcVhc5tYz6S20qdeW5qKLMFjVm/eRrMO4O8VD6V35FX2LaMzOcAg7v2K9ihOg2
         J3NBOFQGNPOtHYNKqNUBEo8GDwLkzBtjvsbJOYqZOXm1WakbUeXw5j0Ev3Dw6S9iuPFS
         /3/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIPU7ChMAsdd7knNS6NNHmCNcwD2Fhi/LSqxTWuNNrt7SJ4claTf/YiIowpUnW4dzXKdyuW4wLuII=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0GXeExN7mIdc/TfpTqpQgN5386CLZvJ22dO9zieJS28myCi9v
	9nqXunkOM1Bfy32hZwbSBs36LGDgs9Qc3BD8bhVDNwP4aUyl6tpGYLTHHbnZgvE=
X-Gm-Gg: ASbGncvk7kfiBgfKGAlC72+LqkpTtSkzZpA2IdhgTBV/5bz68QkoK4ES4tTrAkqiT0j
	Rr6PjU95sQvfGv3cIESiOoVDj4ZFszCbOJp+wsiQmUsBH96/k+mWDarg/MVV8X2BJrbAc32fli5
	QuU4Kg+s3jvpyAYXKocRaCNSYc2Z5yTstlSZkzd6BEtpuM9P5FDzkubtq7yLFcwwIYyjzimb31L
	dDBtN0D23kYgBSq1LqU0FcqB+18Jl1tl7hYpIIEqLdHmiPrpVjOZwWHcuA/HhsZHLsI9Q+FQexR
	Q4o=
X-Google-Smtp-Source: AGHT+IHs4kVPkFYUzWm7KaTrDUxtzlrgRhTgXt+SxWy9TWu9laptUSWnP8MSP8v1LxvgTwxXTCCeSQ==
X-Received: by 2002:a5d:6484:0:b0:38f:4c30:7cdd with SMTP id ffacd0b85a97d-38f4c307ec0mr7919846f8f.37.1739954167212;
        Wed, 19 Feb 2025 00:36:07 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d58f3sm17085819f8f.73.2025.02.19.00.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 00:36:06 -0800 (PST)
Date: Wed, 19 Feb 2025 09:36:05 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: BillXiang <xiangwencheng@lanxincomputing.com>
Cc: anup@brainfault.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu
Subject: Re: [PATCH] riscv: KVM: Remove unnecessary vcpu kick
Message-ID: <20250219-badec60b9b12834cf534dcbf@orel>
References: <20250219015426.1939-1-xiangwencheng@lanxincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250219015426.1939-1-xiangwencheng@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_003609_055248_5DF57415 
X-CRM114-Status: GOOD (  20.16  )
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

On Wed, Feb 19, 2025 at 09:54:26AM +0800, BillXiang wrote:
> Thank you Andrew Jones, forgive my errors in the last email.

From here down is all exactly the same as your first email, which I
already completely replied to.

> I'm wondering whether it's necessary to kick the virtual hart
> after writing to the vsfile of IMSIC.
> From my understanding, writing to the vsfile should directly
> forward the interrupt as MSI to the virtual hart. This means that
> an additional kick should not be necessary, as it would cause the
> vCPU to exit unnecessarily and potentially degrade performance.
> I've tested this behavior in QEMU, and it seems to work perfectly
> fine without the extra kick.
> Would appreciate any insights or confirmation on this!
> Best regards.
> 
> Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
> ---
>  arch/riscv/kvm/aia_imsic.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
> index a8085cd8215e..29ef9c2133a9 100644
> --- a/arch/riscv/kvm/aia_imsic.c
> +++ b/arch/riscv/kvm/aia_imsic.c
> @@ -974,7 +974,6 @@ int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_vcpu *vcpu,
>  
>  	if (imsic->vsfile_cpu >= 0) {
>  		writel(iid, imsic->vsfile_va + IMSIC_MMIO_SETIPNUM_LE);
> -		kvm_vcpu_kick(vcpu);
>  	} else {
>  		eix = &imsic->swfile->eix[iid / BITS_PER_TYPE(u64)];
>  		set_bit(iid & (BITS_PER_TYPE(u64) - 1), eix->eip);
> -- 
> 2.46.2

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
