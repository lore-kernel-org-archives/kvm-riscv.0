Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE28C02192
	for <kvm-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 11:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JahOE17eviX8UEkqUo4Jo/Ot1nZlb3qoUC6JlU+6NH0=; b=1MsXEKPeVGT1lG
	8gY7H9xEaIt8dOQS2hOkbWNcRFpMF1kvdFG9Y/xAA/adJPhcrBWjkeSbo4qf0PltcXe03SohfcRsA
	yUDXyKASz3qZ1uVAaHxK7dRfzFwz89Ne530ZRu9vRiIh7zYQ3IANs3V0MZl5HY40hAElOrrP+NBvF
	vnh1wCntQvJC5LcdZTPDMD9hW6oKnYbBwkZB20K+5SPMvtUQWUOWX7X6MGUVt2cQZKXahJWT2/c+X
	6/GiAM3Zx8jS+qTwW4JLXx0w44Gk9uNdUmE7+1Uu65UG49tHC1Q2NmVjiunALtjXldK3tSJJABXdr
	7SLNxRKMF2wVCuNLqkcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teubW-0000000FERT-2JpV;
	Mon, 03 Feb 2025 11:27:02 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teubT-0000000FEQp-09A1
	for kvm-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 11:27:00 +0000
Date: Mon, 3 Feb 2025 12:26:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738582010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U841itt0zvSZsn5ut09MwPk82eChOkavOEgTAVNTZ6U=;
	b=JH0wmf6l0WurjcFzELuvofM9iF1oYNIhb1Y8aNJNcgAo4gR1qkfgSbrdLmhzym1uxMiOIM
	KVibFG5PJdceQ1BsbxCSRd4G6RlBBIMOFNgdsI00EaSkz8DBMVcLniWilodfG5Y2GM0WTz
	ajGj+lpxdh3WzWi4V4sdmqHY6HOBr98=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm-riscv@lists.infradead.org, jamestiotio@gmail.com, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH 1/3] riscv: sbi: Improve gen_report
Message-ID: <20250203-274aa2b6d359671fa0553ea4@orel>
References: <20250129170138.174222-5-andrew.jones@linux.dev>
 <20250129170138.174222-6-andrew.jones@linux.dev>
 <1e4b6e91-b5c6-48b4-a80d-163d89ae29da@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1e4b6e91-b5c6-48b4-a80d-163d89ae29da@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_032659_364274_EED5D691 
X-CRM114-Status: GOOD (  28.95  )
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

On Mon, Feb 03, 2025 at 09:57:49AM +0100, Cl=E9ment L=E9ger wrote:
> Hey Andrew,
> =

> While using it, I wondered if it would be helpful to display the
> expected return value even in the case it was successful and only
> display the return value if it was different. I feel like it avoid the
> need to specify it in the reported string, for instance,
> =

> I have a few "test foo no error" or "test invalid event id 0x0". So that
> displaying them like:
> =

> "test foo: SBI_SUCCESS"
> "test event id 0x0: SBI_INVALID_PARAM"

This looks nice and is easy to do now that we use a macro. Of course, in the
end, a PASSing line is almost never descriptive enough for people to truly
know what was tested anyway. If somebody wants to know what was actually
passing then they'll need to read the code. So as long as the strings are
unique, even if only by prefix, then we're pretty much good to go.

Thanks,
drew


> =

> could be better. But that's only a personal taste.
> Anyway, I used these macros and it works has expected:
> =

> Tested-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Reviewed-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> =

> Thanks,
> =

> Cl=E9ment
> =

> =

> On 29/01/2025 18:01, Andrew Jones wrote:
> > Make several improvements to gen_report(), starting by renaming it
> > to something less generic (sbiret_report) and then, instead of
> > relying on report prefix to link the report_info with the unexpected
> > return values to the failed test, use the test string itself, by
> > taking it as a parameter. And, reporting sbiret.error and
> > sbiret.value separately was more verbose than necessary since the
> > report_info can be used to see which one failed, so combine them.
> > Finally, return the pass/fail result of the test in case a caller
> > wants to use it.
> > =

> > Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> > ---
> >  riscv/sbi.c | 45 ++++++++++++++++++++++++---------------------
> >  1 file changed, 24 insertions(+), 21 deletions(-)
> > =

> > diff --git a/riscv/sbi.c b/riscv/sbi.c
> > index 6f4ddaf13df3..9f591f8ff76a 100644
> > --- a/riscv/sbi.c
> > +++ b/riscv/sbi.c
> > @@ -156,19 +156,22 @@ static bool get_invalid_addr(phys_addr_t *paddr, =
bool allow_default)
> >  	return false;
> >  }
> >  =

> > -static void gen_report(struct sbiret *ret,
> > -		       long expected_error, long expected_value)
> > -{
> > -	bool check_error =3D ret->error =3D=3D expected_error;
> > -	bool check_value =3D ret->value =3D=3D expected_value;
> > -
> > -	if (!check_error || !check_value)
> > -		report_info("expected (error: %ld, value: %ld), received: (error: %l=
d, value %ld)",
> > -			    expected_error, expected_value, ret->error, ret->value);
> > -
> > -	report(check_error, "expected sbi.error");
> > -	report(check_value, "expected sbi.value");
> > -}
> > +#define sbiret_report(ret, expected_error, expected_value, fmt, ...) (=
{						\
> > +	long ex_err =3D expected_error;										\
> > +	long ex_val =3D expected_value;										\
> > +	bool ch_err =3D (ret)->error =3D=3D ex_err;									\
> > +	bool ch_val =3D (ret)->value =3D=3D ex_val;									\
> > +	bool pass =3D report(ch_err && ch_val, fmt, ##__VA_ARGS__);						\
> > +														\
> > +	if (!pass)												\
> > +		report_info(fmt ": expected (error: %ld, value: %ld), received: (err=
or: %ld, value %ld)",	\
> > +			    ##__VA_ARGS__, ex_err, ex_val, (ret)->error, (ret)->value);				\
> > +														\
> > +	pass;													\
> > +})
> > +
> > +#define sbiret_check(ret, expected_error, expected_value) \
> > +	sbiret_report(ret, expected_error, expected_value, "check sbi.error a=
nd sbi.value")
> >  =

> >  static void check_base(void)
> >  {
> > @@ -184,7 +187,7 @@ static void check_base(void)
> >  		expected =3D (long)strtoul(getenv("SBI_SPEC_VERSION"), NULL, 0);
> >  		assert_msg(!(expected & BIT(31)), "SBI spec version bit 31 must be z=
ero");
> >  		assert_msg(__riscv_xlen =3D=3D 32 || !(expected >> 32), "SBI spec ve=
rsion bits greater than 31 must be zero");
> > -		gen_report(&ret, 0, expected);
> > +		sbiret_check(&ret, 0, expected);
> >  	}
> >  	report_prefix_pop();
> >  =

> > @@ -199,7 +202,7 @@ static void check_base(void)
> >  	if (env_or_skip("SBI_IMPL_ID")) {
> >  		expected =3D (long)strtoul(getenv("SBI_IMPL_ID"), NULL, 0);
> >  		ret =3D sbi_base(SBI_EXT_BASE_GET_IMP_ID, 0);
> > -		gen_report(&ret, 0, expected);
> > +		sbiret_check(&ret, 0, expected);
> >  	}
> >  	report_prefix_pop();
> >  =

> > @@ -207,17 +210,17 @@ static void check_base(void)
> >  	if (env_or_skip("SBI_IMPL_VERSION")) {
> >  		expected =3D (long)strtoul(getenv("SBI_IMPL_VERSION"), NULL, 0);
> >  		ret =3D sbi_base(SBI_EXT_BASE_GET_IMP_VERSION, 0);
> > -		gen_report(&ret, 0, expected);
> > +		sbiret_check(&ret, 0, expected);
> >  	}
> >  	report_prefix_pop();
> >  =

> >  	report_prefix_push("probe_ext");
> >  	expected =3D getenv("SBI_PROBE_EXT") ? (long)strtoul(getenv("SBI_PROB=
E_EXT"), NULL, 0) : 1;
> >  	ret =3D sbi_base(SBI_EXT_BASE_PROBE_EXT, SBI_EXT_BASE);
> > -	gen_report(&ret, 0, expected);
> > +	sbiret_check(&ret, 0, expected);
> >  	report_prefix_push("unavailable");
> >  	ret =3D sbi_base(SBI_EXT_BASE_PROBE_EXT, 0xb000000);
> > -	gen_report(&ret, 0, 0);
> > +	sbiret_check(&ret, 0, 0);
> >  	report_prefix_popn(2);
> >  =

> >  	report_prefix_push("mvendorid");
> > @@ -225,7 +228,7 @@ static void check_base(void)
> >  		expected =3D (long)strtoul(getenv("MVENDORID"), NULL, 0);
> >  		assert(__riscv_xlen =3D=3D 32 || !(expected >> 32));
> >  		ret =3D sbi_base(SBI_EXT_BASE_GET_MVENDORID, 0);
> > -		gen_report(&ret, 0, expected);
> > +		sbiret_check(&ret, 0, expected);
> >  	}
> >  	report_prefix_pop();
> >  =

> > @@ -233,7 +236,7 @@ static void check_base(void)
> >  	if (env_or_skip("MARCHID")) {
> >  		expected =3D (long)strtoul(getenv("MARCHID"), NULL, 0);
> >  		ret =3D sbi_base(SBI_EXT_BASE_GET_MARCHID, 0);
> > -		gen_report(&ret, 0, expected);
> > +		sbiret_check(&ret, 0, expected);
> >  	}
> >  	report_prefix_pop();
> >  =

> > @@ -241,7 +244,7 @@ static void check_base(void)
> >  	if (env_or_skip("MIMPID")) {
> >  		expected =3D (long)strtoul(getenv("MIMPID"), NULL, 0);
> >  		ret =3D sbi_base(SBI_EXT_BASE_GET_MIMPID, 0);
> > -		gen_report(&ret, 0, expected);
> > +		sbiret_check(&ret, 0, expected);
> >  	}
> >  	report_prefix_popn(2);
> >  }
> =

> =

> -- =

> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
