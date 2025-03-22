Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D020C35FFC
	for <kvm-riscv@archiver.kernel.org>; Sat, 22 Mar 2025 07:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8EsqhLI0Vkg+odueJb/DDshBciXcSq1z9XwgSpRoRxE=; b=wEACyiQICbFh39
	blQUkSEEa1aNt7S5mgKuQSoboIawOV6uqXSmpCXuaE/87XlnLtcum06dDZkuaEHOhU6BzTLErTd16
	RDUTWnoIA8Q57BxWQUGmPdEpaPgPI24wJlwaqPROYFdhjqB4Q4OVckP+vw7XWj5UkbWjw1ipdI7XW
	nHdGFXcPACPZyyaXuEBevwva/6Ue8p18cYHNSizBwEJiBOOqi1nD3ZGQ4sntYLjsIzVXYhq0ohtly
	uGK3lSrGTtbhPR1IochDQ7oqv9mzx3pyi9iTOU3k9jAsMUrjMIUDcqb2GPUD3KBgiM1HtA06Qwmo2
	CB/TjRQmQl2x409OD9og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvtT3-0000000H2Qf-2cwj;
	Sat, 22 Mar 2025 07:40:29 +0000
Received: from out-170.mta0.migadu.com ([91.218.175.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvtRa-0000000H2EQ-2GeW
	for kvm-riscv@lists.infradead.org;
	Sat, 22 Mar 2025 07:39:00 +0000
Date: Sat, 22 Mar 2025 08:38:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742629134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LfhLC5sqlQafvn+0xKuGq6lbyGDnAKhNMAnd1fBQhlg=;
	b=VESwZjAtgGFlpg1o5TeXxmhOoUv1TwxNO0ti/JhuAwz1krBJf52IW9zCiXNJDk8mW2p76e
	pcrSavYBy1rGVnZfNOyZdeWUaCMIK09C/X5kheZpCsKbJObdGzxgQWzBCPyd/jWzQlggb4
	W9lRSOzDPnrlAGs+uOdkM2qdVbLgXoc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	atishp@rivosinc.com, akshaybehl231@gmail.com
Subject: Re: [kvm-unit-tests PATCH 3/3] riscv: sbi: Use kfail for known
 opensbi failures
Message-ID: <20250322-3d41f407f8d352d262718c20@orel>
References: <20250321165403.57859-5-andrew.jones@linux.dev>
 <20250321165403.57859-8-andrew.jones@linux.dev>
 <dba5ed81-6557-45aa-8246-0c9e6d6c18a0@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dba5ed81-6557-45aa-8246-0c9e6d6c18a0@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_003859_231375_5F6DA0C9 
X-CRM114-Status: GOOD (  26.20  )
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

On Fri, Mar 21, 2025 at 09:22:19PM +0100, Cl=E9ment L=E9ger wrote:
> =

> =

> On 21/03/2025 17:54, Andrew Jones wrote:
> > Use kfail for the opensbi s/SBI_ERR_DENIED/SBI_ERR_DENIED_LOCKED/
> > change. We expect it to be fixed in 1.7, so only kfail for opensbi
> > which has a version less than that. Also change the other uses of
> > kfail to only kfail for opensbi versions less than 1.7.
> > =

> > Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> > ---
> >  riscv/sbi-fwft.c | 20 +++++++++++++-------
> >  riscv/sbi.c      |  6 ++++--
> >  2 files changed, 17 insertions(+), 9 deletions(-)
> > =

> > diff --git a/riscv/sbi-fwft.c b/riscv/sbi-fwft.c
> > index 3d225997c0ec..c52fbd6e77a6 100644
> > --- a/riscv/sbi-fwft.c
> > +++ b/riscv/sbi-fwft.c
> > @@ -83,19 +83,21 @@ static void fwft_feature_lock_test_values(uint32_t =
feature, size_t nr_values,
> >  =

> >  	report_prefix_push("locked");
> >  =

> > +	bool kfail =3D __sbi_get_imp_id() =3D=3D SBI_IMPL_OPENSBI &&
> > +		     __sbi_get_imp_version() < sbi_impl_opensbi_mk_version(1, 7);
> > +
> >  	for (int i =3D 0; i < nr_values; ++i) {
> >  		ret =3D fwft_set(feature, test_values[i], 0);
> > -		sbiret_report_error(&ret, SBI_ERR_DENIED_LOCKED,
> > -			"Set to %lu without lock flag", test_values[i]);
> > +		sbiret_kfail_error(kfail, &ret, SBI_ERR_DENIED_LOCKED,
> > +				   "Set to %lu without lock flag", test_values[i]);
> >  =

> >  		ret =3D fwft_set(feature, test_values[i], SBI_FWFT_SET_FLAG_LOCK);
> > -		sbiret_report_error(&ret, SBI_ERR_DENIED_LOCKED,
> > -			"Set to %lu with lock flag", test_values[i]);
> > +		sbiret_kfail_error(kfail, &ret, SBI_ERR_DENIED_LOCKED,
> > +				   "Set to %lu with lock flag", test_values[i]);
> >  	}
> >  =

> >  	ret =3D fwft_get(feature);
> > -	sbiret_report(&ret, SBI_SUCCESS, locked_value,
> > -		"Get value %lu", locked_value);
> > +	sbiret_report(&ret, SBI_SUCCESS, locked_value, "Get value %lu", locke=
d_value);
> =

> Reformatting ?

Yup, and the "Set..." strings above. I missed that the format was wrong
when I applied the fwft_feature_lock_test_values patch and just lazily
fixed it up with this patch. I still haven't merged to the master
branch yet, so I can still squash a formatting fix into the
fwft_feature_lock_test_values patch in order to make this patch cleaner.

> =

> >  =

> >  	report_prefix_pop();
> >  }
> > @@ -103,6 +105,7 @@ static void fwft_feature_lock_test_values(uint32_t =
feature, size_t nr_values,
> >  static void fwft_feature_lock_test(uint32_t feature, unsigned long loc=
ked_value)
> >  {
> >  	unsigned long values[] =3D {0, 1};
> > +
> =

> That's some spurious newline here.

It's also reformatting.

> =

> =

> >  	fwft_feature_lock_test_values(feature, 2, values, locked_value);
> >  }
> >  =

> > @@ -317,7 +320,10 @@ static void fwft_check_pte_ad_hw_updating(void)
> >  	report(ret.value =3D=3D 0 || ret.value =3D=3D 1, "first get value is =
0/1");
> >  =

> >  	enabled =3D ret.value;
> > -	report_kfail(true, !enabled, "resets to 0");
> > +
> > +	bool kfail =3D __sbi_get_imp_id() =3D=3D SBI_IMPL_OPENSBI &&
> > +		     __sbi_get_imp_version() < sbi_impl_opensbi_mk_version(1, 7);
> > +	report_kfail(kfail, !enabled, "resets to 0");
> >  =

> >  	install_exception_handler(EXC_LOAD_PAGE_FAULT, adue_read_handler);
> >  	install_exception_handler(EXC_STORE_PAGE_FAULT, adue_write_handler);
> > diff --git a/riscv/sbi.c b/riscv/sbi.c
> > index 83bc55125d46..edb1a6bef1ac 100644
> > --- a/riscv/sbi.c
> > +++ b/riscv/sbi.c
> > @@ -515,10 +515,12 @@ end_two:
> >  	sbiret_report_error(&ret, SBI_SUCCESS, "no targets, hart_mask_base is=
 1");
> >  =

> >  	/* Try the next higher hartid than the max */
> > +	bool kfail =3D __sbi_get_imp_id() =3D=3D SBI_IMPL_OPENSBI &&
> > +		     __sbi_get_imp_version() < sbi_impl_opensbi_mk_version(1, 7);
> >  	ret =3D sbi_send_ipi(2, max_hartid);> -	report_kfail(true, ret.error
> =3D=3D SBI_ERR_INVALID_PARAM, "hart_mask got expected error (%ld)", ret.e=
rror);
> > +	sbiret_kfail_error(kfail, &ret, SBI_ERR_INVALID_PARAM, "hart_mask");
> >  	ret =3D sbi_send_ipi(1, max_hartid + 1);
> > -	report_kfail(true, ret.error =3D=3D SBI_ERR_INVALID_PARAM, "hart_mask=
_base got expected error (%ld)", ret.error);
> > +	sbiret_kfail_error(kfail, &ret, SBI_ERR_INVALID_PARAM, "hart_mask_bas=
e");
> >  =

> >  	report_prefix_pop();
> >  =

> =

> Hi Andrew,
> =

> I tried thinking of some way to factorize the version check but can't
> really find something elegant. Without the spurious newline:

I'll move the reformatting to the fwft_feature_lock_test_values patch,
but I'm generally not overly opposed to sneaking a couple reformatting
fixes into patches when the reformatting is obvious enough.

> =

> Reviewed-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>

Thanks,
drew

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
