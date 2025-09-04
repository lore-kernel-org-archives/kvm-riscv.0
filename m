Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511F0CA1012
	for <kvm-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 10:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wt8jNQNE2pWLwqGBwjtHBDeohRVlAPq+yDpzQ8HGirE=; b=aRY6cViQCVe1CT
	Prr2tdnDf4lCnE+097YeTO6R9yJdq3Y8YNuCxIhBRdI0MKUHgfXN72vmCi44YR3C2oXtwnRnVdei3
	x35j6h9cjUuRRcvrxdZiHk4QUzLeUoXu/apAFM39REGy2+3zgPPAISSJK/R+0e/uAXxaDg8KAhmT+
	5YCf9wOf1cNaCuvjoCVsA3HMsH6nFykjsJn1PbpjJKZZvIxKX97he8TkBThDS9s4WDfrBFut7dBl2
	cKKHBoNTyJ1ycnM+9urduLvg9yXiXey0fe86+PfY7AqTrma8+NcQCJqLyk+Czqs7RhV3PAYGzuHuC
	5QXhAuIJwG7qLjFYTHpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7bG-0000000B1qq-3JX9;
	Thu, 04 Sep 2025 10:53:54 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu6a2-0000000Af44-0mkw;
	Thu, 04 Sep 2025 09:48:35 +0000
Received: by mail-pj1-x1041.google.com with SMTP id 98e67ed59e1d1-329e47dfa3eso769045a91.1;
        Thu, 04 Sep 2025 02:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756979313; x=1757584113; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1IurcVIvDmIouCP1bc4ecxaPSklAYPP27lDW3IVEMq8=;
        b=EbCkkz05Xn1whYgeDY1kxA23HDl0BUnbwaBTZ2ByB1z7pcKGxUPji+jOiFyxkfusyb
         OCwokR3jqTTbY9Oz1Zlb/ZTHoejL2HfP1MTpFn1mscps3uEQQKyJXcw1st/r50vsKeGd
         JbJAYbB4xnK5GZ3T0HlOqtfuY2g6PSbUeuwts4VAoHaRLrhDRUCKwVkEiGbDiDhrr+2v
         iUPaWieG6iG0PJLYhcsqcbnxecwfId3JLS5G3te69FQror9EcSNzfCpqOltyzrfMjNmC
         G4n6Byn0k54AqOdxETnfHr50U11P0auOCLqxdCluZcyDTRoQ0hS7aYqjcdAQuOdAWKce
         cG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756979313; x=1757584113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IurcVIvDmIouCP1bc4ecxaPSklAYPP27lDW3IVEMq8=;
        b=UF7K8L+9YG7SSiSGRD5whHsm2Rk5Ge2o/oEIZfxpYWqsydYy9DF84grl9+2n3xz7zl
         rd/NenORNCVcuB3JrsPLQAmrEx9o7J/zieuZQtdUVsQoQh17vAJKmSFXDydl3kUAn+5J
         GUIAi1bN0YkD4I0KJaCTiw0m09AiGREWWCFml+/qMdGzpV+0j8q30nZq10vYSWDIZC20
         CFMMst6NEHu7LFpNB6QYRkqmKlaIVkI+5ahc16snBhomI9pR1YAccuBGJfwkgYccSw5U
         e3NgrvWqI7DzCxCrOs70yT98Cv14zwRLnrrL3owO6+AFgObahvvIRGxL4GSD8cBnivIf
         vedQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPq2+fHNha9ddsRyuAfgQwwNVczQwltqCQ946zPtKu2Udt+oTmp2hgw+IDPdecbUXZBthhFy2/I8Y=@lists.infradead.org, AJvYcCXucKbNJ5ZE6bxltxUeBp1DFIeJafylRyqdGG+fjQfOa2qFpISdpVgPVIEoE4X+bmixMZ69+cictKKznTA=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo1aM8yMnVEw16fnrcvEyQZ51drOvYY86HvlDC1jXred7Ll6Ar
	FWWP4aHpUS1laX9LRs8xEyRRoIOQD6ET7kg0gJUFI7DGiUNuMG29EjQ3ZJQfIgeoi/uVSA==
X-Gm-Gg: ASbGncsncshqU1uMxwp5ZEvmsvAwNEu62yod8R9NFOBEmGmrcGbEMKdzEKM2pBUmXgi
	eknfeVVj9659DYP/XOwn7KEzPkH5yjSKoEERy+aXJn3z2zUvxmoJi+UaXd8vyHCKi+eiIEKpoaV
	lRo7xnqC1Fk6HBPQsy0MT8mySgL5y7VQxYZSsQLZ3C0LVFs8cjgsATyyGvdhVurY+tmHIP0TQM9
	RbEkVCdgsFS3alID0XetD2DABLPPCONQ0dXNAe1kujffVYQuVVqwXyvHG+PxK9VtGBfW8y6i3Tn
	v/jpEt+k/y41mfjZi3MNyBxsjLpTTMpFFOjV4LPmq4SMmwj+FSmQlvpEZxLehB5tE5HZS7XV9Tb
	g/4pkU8/DB+5jrbaxM0Xu+dKT
X-Google-Smtp-Source: AGHT+IEjJvp6rZMEUJSWcF25yiJN1Bj1VOnRLqvBit6RxKK7N20DSMX22/c7VA4ex8hcWLfqNlRIIw==
X-Received: by 2002:a17:90b:1dcc:b0:31e:7410:a4d7 with SMTP id 98e67ed59e1d1-328156e473cmr24241658a91.33.1756979312777;
        Thu, 04 Sep 2025 02:48:32 -0700 (PDT)
Received: from days-ASUSLaptop ([50.7.253.114])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329e1c8e07bsm7668990a91.4.2025.09.04.02.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 02:48:32 -0700 (PDT)
Date: Thu, 4 Sep 2025 17:48:21 +0800
From: Dong Yang <dayss1224@gmail.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org,
	atish.patra@linux.dev, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/3] KVM: riscv: selftests: Enable supported test cases
Message-ID: <aLlf6ZQ1uNjs8XS+@days-ASUSLaptop>
References: <cover.1756710918.git.dayss1224@gmail.com>
 <20250902-9cc0d0dad59ba680062dbbf8@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250902-9cc0d0dad59ba680062dbbf8@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_024834_225473_DDA4A0C5 
X-CRM114-Status: GOOD (  18.56  )
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

On Tue, Sep 02, 2025 at 10:36:10AM -0500, Andrew Jones wrote:
> On Mon, Sep 01, 2025 at 03:35:48PM +0800, dayss1224@gmail.com wrote:
> > From: Dong Yang <dayss1224@gmail.com>
> > 
> > Add supported KVM test cases and fix the compilation dependencies.
> > ---
> > Changes in v3:
> > - Reorder patches to fix build dependencies
> > - Sort common supported test cases alphabetically
> > - Move ucall_common.h include from common header to specific source files
> > 
> > Changes in v2:
> > - Delete some repeat KVM test cases on riscv
> > - Add missing headers to fix the build for new RISC-V KVM selftests
> > 
> > Dong Yang (1):
> >   KVM: riscv: selftests: Add missing headers for new testcases
> > 
> > Quan Zhou (2):
> >   KVM: riscv: selftests: Use the existing RISCV_FENCE macro in
> >     `rseq-riscv.h`
> >   KVM: riscv: selftests: Add common supported test cases
> > 
> >  tools/testing/selftests/kvm/Makefile.kvm                    | 6 ++++++
> >  tools/testing/selftests/kvm/access_tracking_perf_test.c     | 1 +
> >  tools/testing/selftests/kvm/include/riscv/processor.h       | 1 +
> >  .../selftests/kvm/memslot_modification_stress_test.c        | 1 +
> >  tools/testing/selftests/kvm/memslot_perf_test.c             | 1 +
> >  tools/testing/selftests/rseq/rseq-riscv.h                   | 3 +--
> >  6 files changed, 11 insertions(+), 2 deletions(-)
> > 
> > -- 
> > 2.34.1
> 
> In the future please CC previous reviewers on the entire series
> (particularly when they have reviewed the entire previous series).
Okay, I will pay attention to this in the future. Thanks.
> 
> For the series,
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
