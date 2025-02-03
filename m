Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC312C02192
	for <kvm-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 11:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RzWDd1NKV+4kkaB5/p6GgEZxPqh0AZOjpg4hhnJqt0Y=; b=3k0fE0qACgIY+M
	+eJgVcwxFngB2VQ37h1o61jTp9B/Dd2vWxwd3+mbMwwwmoIIAsdy+q+M6g+BGB2cecLMIxzxA+CDB
	2TxsyInT5ZfbfOez6lZ2arKHhAhvIhX1Yp0oH9wrfBwWYPYgVbnKTBKffjUnVVRCESmYXuc8Ssap+
	a+QL81F8bU8zTlZ24TlgwXDapRlfrJXKC+0/mYftn/3fZ0+qg+l/hf1pzPughDNLrozLpCS0Hwuxu
	YZk1grP5P1vinfY7hKnzHHCmYs74FwkWbhZKmNgcKFBizAmqA4AmYh7ZHXZZw19DxnO6yCDu+2JXF
	yXOkk2S1OUVrgSblm0iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teudC-0000000FEdo-2zUp;
	Mon, 03 Feb 2025 11:28:46 +0000
Received: from out-184.mta1.migadu.com ([95.215.58.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teucr-0000000FEcj-0pJW
	for kvm-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 11:28:26 +0000
Date: Mon, 3 Feb 2025 12:28:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738582102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n/Gn+lnaA6cZd+X/nFV70pW2ibAIrBqWeHAoN0HmN8c=;
	b=O4V4jF1fonLIozIx4caSCXZ7E+gDvaSrvMTDjQ9VT6pF+FxPwW/x388DykGlTARUwpXsru
	soW24RnQnDqfTCcqrUyvzvmxYDc+HMwGjfPErsjuPoJt2nkPTHLcLiQXDo8+SMAQfMzrrn
	mks7eDobv5PnBlUsgmQVz/EQ2bByORQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm-riscv@lists.infradead.org, jamestiotio@gmail.com, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH 3/3] riscv: sbi: Add sbiret_report_error
Message-ID: <20250203-26ef848b21403f95e4f37652@orel>
References: <20250129170138.174222-5-andrew.jones@linux.dev>
 <20250129170138.174222-8-andrew.jones@linux.dev>
 <29b93378-e219-4c46-8cf9-270d06f8b843@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29b93378-e219-4c46-8cf9-270d06f8b843@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_032825_379748_6E0D87B5 
X-CRM114-Status: GOOD (  18.17  )
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

On Mon, Feb 03, 2025 at 10:00:39AM +0100, Cl=E9ment L=E9ger wrote:
> =

> =

> On 29/01/2025 18:01, Andrew Jones wrote:
> > An sbiret value may be unspecified in the case of errors, and even in
> > the case of success when the function doesn't return anything.
> > Provide an sbiret report function that only checks sbiret.error.
> > =

> > Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> > ---
> >  riscv/sbi-tests.h | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> > =

> > diff --git a/riscv/sbi-tests.h b/riscv/sbi-tests.h
> > index 2bdc9440d82d..f6e646a79dbe 100644
> > --- a/riscv/sbi-tests.h
> > +++ b/riscv/sbi-tests.h
> > @@ -36,20 +36,29 @@
> >  #ifndef __ASSEMBLY__
> >  #include <asm/sbi.h>
> >  =

> > -#define sbiret_report(ret, expected_error, expected_value, fmt, ...) (=
{						\
> > +#define __sbiret_report(ret, expected_error, expected_value, has_value=
, fmt, ...) ({				\
> >  	long ex_err =3D expected_error;										\
> >  	long ex_val =3D expected_value;										\
> >  	bool ch_err =3D (ret)->error =3D=3D ex_err;									\
> >  	bool ch_val =3D (ret)->value =3D=3D ex_val;									\
> > -	bool pass =3D report(ch_err && ch_val, fmt, ##__VA_ARGS__);						\
> > +	bool pass =3D report(ch_err && (!(has_value) || ch_val), fmt, ##__VA_=
ARGS__);				\
> =

> Nit: I would have moved the has_value check in the ch_val bool but I'm
> good with both way.

Thanks for the review. I'll spin a v2 with this change and also look into
outputting the expected error code.

drew

> =

> >  														\
> > -	if (!pass)												\
> > +	if (!pass && (has_value))										\
> >  		report_info(fmt ": expected (error: %ld, value: %ld), received: (err=
or: %ld, value %ld)",	\
> >  			    ##__VA_ARGS__, ex_err, ex_val, (ret)->error, (ret)->value);				\
> > +	else if (!pass)												\
> > +		report_info(fmt ": expected (error: %ld), received: (error: %ld)",		=
		\
> > +			    ##__VA_ARGS__, ex_err, (ret)->error);						\
> >  														\
> >  	pass;													\
> >  })
> >  =

> > +#define sbiret_report(ret, expected_error, expected_value, ...) \
> > +	__sbiret_report(ret, expected_error, expected_value, true, __VA_ARGS_=
_)
> > +
> > +#define sbiret_report_error(ret, expected_error, ...) \
> > +	__sbiret_report(ret, expected_error, 0, false, __VA_ARGS__)
> > +
> >  #define sbiret_check(ret, expected_error, expected_value) \
> >  	sbiret_report(ret, expected_error, expected_value, "check sbi.error a=
nd sbi.value")
> >  =

> =

> Tested-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Reviewed-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> =

> Thanks,
> =

> Cl=E9ment
> =

> -- =

> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
