Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D10C369DC
	for <kvm-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 09:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=400I9huT3aN3nRzLbm5DvsyVr5KLsOSCU9V89t+MLYw=; b=hpvCygmSthc79O
	qiTtHykQmUknLb6588zFokEpl6K4rg8yt6T2ILRGIavlHYVnnxIxBB2C05pBPVqLL5UiKGvqCqgHV
	Qh1Jm4+LM4ABRuY9yfbdjOQy/+eWRkeK4XKc3AUJldZFclfxpKr52pMOFqlANAXUe2ix0vMtxIcP3
	bq1TwUfJj512GDgsCwvCW8nMP503yUlR9kMBR1hQrmsdgLWg/pKHPhhELu59Ur5BkpXcUXFOSdCvB
	TF+5V+eFDM4oaGL02WOb9hg1UZfrKKyWSqUsziyjPD/16W3bChsfBrpdGeuc76/WPIm/+IA/CNQi5
	SnJzdiNi9S5S7v2UB9mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gy0-000000094MD-48CW;
	Tue, 29 Apr 2025 09:09:28 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gug-000000093qv-1ave
	for kvm-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 09:06:03 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39c0dfba946so4168502f8f.3
        for <kvm-riscv@lists.infradead.org>; Tue, 29 Apr 2025 02:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745917560; x=1746522360; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KatqGhsrZH+ZioIyyPM0GHZkF6RidX+RSSACu/Ebkcw=;
        b=dITa4Mah38rwpnWjCqlK7+AavK/KCFIQJgSoy16R6TWuQHb1Mjj+KtQVB+X3KYRRy1
         hupeu2Z8Qmi52kCsYkSJ9gytnNCTbweGoxCKEXar9IT33HTAOngGoYNaRX2bAVIGKQGN
         gKTgPraKos1Go8bxxwDigGnBh9dN38WmrCvcSuXLzjn1oDWkp9CzfoMQxPESxumb1tH5
         C2u/XBzbXaDUB6wBx41J3QdSN0vcdbMK5fDbMRJaDCl3k+37HlUMkAs/gzXJ3z158F9h
         UwwYz6LPhv9GNShx+yC8mqDByOx2ARu2UQa8FFfiTQHCRDOgJJoURR8qad2X9Mmx6hcG
         bSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745917560; x=1746522360;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KatqGhsrZH+ZioIyyPM0GHZkF6RidX+RSSACu/Ebkcw=;
        b=nb361D8XEHSqgE8ZFUy0R2k4u71CltrGMCJQqKFdysliMax7WSopUsmZYeYZB6i1c+
         QUHFbmomuvGbbBJVs4A9EjyLW8rf4L6czMaiTR6W2fIKKsNCVXjDa/lHzi5nWlKJ/E3Y
         JHu6iG0DEd/Dr8H4uC87Aplub6KLX7Rn+OOMAXXrmleLGCCZwWTKAN+0j7Yaia10YILZ
         6af5JekHyHjb2MYb0PRzuTR4pCLfkjNZ6tBp/IkHxeDewq3g9loObyamqvOrHeeASKMo
         rG7qryT3svkupgNAABEuXzp99NCwIYV54tuuWLoxN6i1BWzHWOs5NzjuwlK4QfPxcf6N
         RVyg==
X-Forwarded-Encrypted: i=1; AJvYcCWhedDdfWE6fsckY3ZofQvsyC5ewwzKPjpARRu/j/V1dcYGVZQ5VAq76ayTbkC6O7cLUR08NdO7N1w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yydg53re2PX1CJIN2VuVpzMWe9zm8Fn7K6JbjvJKsJESWxuk6SV
	d0Tsyagu2cWmc8VAY1W/ErGRweEMoZl1+Utn3LCl+qt+3zrfBJsJTv7FtMpk2v0=
X-Gm-Gg: ASbGnct6sT6Rt8fWoEFp5X3t15gpiG4ixgSangiFoYYVVBtpnfZXEO9kq1svtbe1uwB
	jYCpG2/PwJLqbPXWri6H8FOFTMR/szZY53a7qVc7GcQokNdtqzJ9TnkC2otpXSnZ+bmzD/OuAbx
	GKZUtOCYXZAaGvhpgHFeCm/WatxFLnXUKBa4PXoUinuIuiqJ57KPUqnzZNRyQePKXI4PUPliof2
	Pe2Wf7BJH0LY2RZWmNbX/FYrivClqQ+btC5qliqZ21gfzDbKnNepi2zAmp9gEnhEx33CKJD0UpJ
	2SNcucvWeFTkmS33gDGes+4VV7oW
X-Google-Smtp-Source: AGHT+IGkl5qjiabpogb2jkKx++DcNwNz6kC3SVaUoXxULD2fuawYRLha0X61n1NZ+hz8YxEyViubjg==
X-Received: by 2002:a5d:6903:0:b0:390:eacd:7009 with SMTP id ffacd0b85a97d-3a07ab9be44mr6194393f8f.42.1745917560430;
        Tue, 29 Apr 2025 02:06:00 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5da02sm13462185f8f.93.2025.04.29.02.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:06:00 -0700 (PDT)
Date: Tue, 29 Apr 2025 11:05:59 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] KVM: riscv: selftests: Add stval to exception
 handling
Message-ID: <20250429-683f10a791d9ec41b060ec4a@orel>
References: <20250324-kvm_selftest_improve-v1-0-583620219d4f@rivosinc.com>
 <20250324-kvm_selftest_improve-v1-1-583620219d4f@rivosinc.com>
 <20250425-dc44cb547ab5e2f994c94e80@orel>
 <3b05d1a0-c873-4e61-b98c-b725d0dbb350@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b05d1a0-c873-4e61-b98c-b725d0dbb350@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_020602_418554_004FE702 
X-CRM114-Status: GOOD (  28.72  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Apr 28, 2025 at 03:47:47PM -0700, Atish Patra wrote:
> =

> On 4/25/25 6:50 AM, Andrew Jones wrote:
> > On Mon, Mar 24, 2025 at 05:40:29PM -0700, Atish Patra wrote:
> > > Save stval during exception handling so that it can be decoded to
> > > figure out the details of exception type.
> > > =

> > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > ---
> > >   tools/testing/selftests/kvm/include/riscv/processor.h | 1 +
> > >   tools/testing/selftests/kvm/lib/riscv/handlers.S      | 2 ++
> > >   2 files changed, 3 insertions(+)
> > > =

> > > diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/=
tools/testing/selftests/kvm/include/riscv/processor.h
> > > index 5f389166338c..f4a7d64fbe9a 100644
> > > --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> > > +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> > > @@ -95,6 +95,7 @@ struct ex_regs {
> > >   	unsigned long epc;
> > >   	unsigned long status;
> > >   	unsigned long cause;
> > > +	unsigned long stval;
> > >   };
> > >   #define NR_VECTORS  2
> > > diff --git a/tools/testing/selftests/kvm/lib/riscv/handlers.S b/tools=
/testing/selftests/kvm/lib/riscv/handlers.S
> > > index aa0abd3f35bb..2884c1e8939b 100644
> > > --- a/tools/testing/selftests/kvm/lib/riscv/handlers.S
> > > +++ b/tools/testing/selftests/kvm/lib/riscv/handlers.S
> > > @@ -45,9 +45,11 @@
> > >   	csrr  s0, CSR_SEPC
> > >   	csrr  s1, CSR_SSTATUS
> > >   	csrr  s2, CSR_SCAUSE
> > > +	csrr  s3, CSR_STVAL
> > >   	sd    s0, 248(sp)
> > >   	sd    s1, 256(sp)
> > >   	sd    s2, 264(sp)
> > > +	sd    s3, 272(sp)
> > We can't add stval without also changing how much stack we allocate at =
the
> > top of this macro, but since we need to keep sp 16-byte aligned in order
> > to call C code (route_exception()) we'll need to decrement -8*36, not
> =

> Yes. Thanks for catching that.
> =

> > -8*35. Or, we could just switch struct ex_regs to be the kernel's struct
> > pt_regs which has 36 unsigned longs. The 'badaddr' member is for stval =
and
> > the additional long is orig_a0.
> =

> I think switching to pt_regs is better in terms of maintainability in the
> future.
> I will do that.
> =

> > >   .endm
> > >   .macro restore_context
> > I guess we should restore stval too.
> =

> Do we ?=A0 stval is written by hardware and doesn't contain any state of =
the
> interrupted program.
> Once, the trap handler processes the trap using stval information, there =
is
> no need to restore it.

True. It just felt unbalanced.

Thanks,
drew

> =

> Am I missing something ?
> =

> > Thanks,
> > drew
> > =

> > > -- =

> > > 2.43.0
> > > =

> > > =

> > > -- =

> > > kvm-riscv mailing list
> > > kvm-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
