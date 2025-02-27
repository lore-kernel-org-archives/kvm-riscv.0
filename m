Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23599C021BE
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 12:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZlkP05Wh/E/QM3rgBWL9u1PbRj47f3Vx42E2D42+hkI=; b=d+s3nWFWDyJP2C
	yTcjg1sgXpRFpHvmAkhx2Cb0KqVjXMqJarAvPYio6eu4WBe5BRkTxG9c2WcSN6R3EdbQ2F613B/G9
	YuoZMVFx01Qo1BWPenGejOyfGklrXTj1gxVo+OKhRao3/gakUrBJjAbVyJgcIDGvN1XauFNsO7JAf
	/c52Zo3bVOOOyfWDYcexx20VEIX1r6MWu5iOVJ6L6Hp9ehrKqpHeMfNzXNc1yWf3h1xdCIrxdPjBQ
	oN9xWfPwE3jmF7PrF6TiLVWJF9RhAzuSBG7ccyEDLezNKMIOS7IWlQNzWP2QEVgNlkAObuRYpsV6q
	akbhyhy8hAUERyy3Fwdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnd9z-00000007OSA-39aY;
	Thu, 27 Feb 2025 12:38:39 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tncfn-00000007IG4-2Dlg
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 12:07:29 +0000
Date: Thu, 27 Feb 2025 13:07:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740658041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bsXCN3iqMhSVmdQ4stuIIKbxmG5vRRnHKi5Ys0ExZg4=;
	b=kf6lwIe52fDBkg2M2yS+6OcKr9/X5U6pLHjZvugLoqmL4Cf4pkG94CsOQNVgzcScpLZed0
	F4QYHgcgDpS/jGhATBDCaOD1/iwD9mpEcoFPtrJpqSfwdS3dwXM7Uo5lgI2g7+krwTDBhv
	+w5EhTa6bPGejaCm3zK4WdN17yslEYw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm-riscv@lists.infradead.org, atishp@rivosinc.com, 
	jamestiotio@gmail.com
Subject: Re: [kvm-unit-tests PATCH 11/10] riscv: sbi: Add fwft
 pte_hw_ad_updating test
Message-ID: <20250227-aa83c6934b574c860989b31b@orel>
References: <20250221155533.123418-12-andrew.jones@linux.dev>
 <20250226175912.30239-2-andrew.jones@linux.dev>
 <8f02937b-4a01-4c69-91a2-59623ef81246@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8f02937b-4a01-4c69-91a2-59623ef81246@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_040728_198575_4A96368A 
X-CRM114-Status: GOOD (  19.88  )
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

On Thu, Feb 27, 2025 at 10:09:42AM +0100, Cl=E9ment L=E9ger wrote:
...
> > +	report(hw_updating_enabled !=3D *triggered &&
> > +	       adue_check_pte(pte_val(*ptep), write), "%s %s",
> > +	       hw_updating_enabled ? "hw updating enabled" : "hw updating dis=
abled", op);
> =

> Hi Andrew,
> =

>  adue_check_pte(pte_val(*ptep), write), "hw updating %s %s",
>  hw_updating_enabled ? "enabled" : "disabled", op);

Will do

> =

> > +
> > +	free(ptr);
> > +}
> > +
> > +static void adue_check(bool hw_updating_enabled)
> > +{
> > +	__adue_check(hw_updating_enabled, false);
> > +	__adue_check(hw_updating_enabled, true);
> > +}
> > +
> > +static void fwft_check_pte_ad_hw_updating(void)
> > +{
> > +	struct sbiret ret;
> > +	bool enabled;
> > +
> > +	report_prefix_push("pte_ad_hw_updating");
> > +
> > +	ret =3D fwft_get(SBI_FWFT_PTE_AD_HW_UPDATING);
> > +	if (ret.error =3D=3D SBI_ERR_NOT_SUPPORTED) {
> > +		report_skip("not supported by platform");
> > +		return;
> > +	} else if (!sbiret_report_error(&ret, SBI_SUCCESS, "get")) {
> > +		/* Not much we can do without a working get... */
> > +		return;
> > +	}
> > +
> > +	enabled =3D !!ret.value;
> =

> Is there a reason to normalize value to a boolean ? The spec states that
> the values for ADUE is either exactly 0 or 1. So i'd expect value to
> contain 0 or 1 and thus no need to normalize it. That would even hide
> some invalid returned value from the SBI.

Good thought. We should test the exact 0/1.

> =

> > +	report(!enabled, "resets to 0");
> > +
> > +	install_exception_handler(EXC_LOAD_PAGE_FAULT, adue_read_handler);
> > +	install_exception_handler(EXC_STORE_PAGE_FAULT, adue_write_handler);
> > +
> > +	adue_check(enabled);
> > +
> > +	ret =3D fwft_set(SBI_FWFT_PTE_AD_HW_UPDATING, !enabled, 0);
> > +	if (!sbiret_report_error(&ret, SBI_SUCCESS, "set to %d", !enabled))
> > +		goto inval_tests;
> > +	else
> > +		enabled =3D !enabled;
> > +
> > +	ret =3D fwft_get(SBI_FWFT_PTE_AD_HW_UPDATING);
> > +	sbiret_report(&ret, SBI_SUCCESS, enabled, "get %d", enabled);
> > +
> > +	adue_check(enabled);
> > +
> > +	ret =3D fwft_set(SBI_FWFT_PTE_AD_HW_UPDATING, !enabled, 0);
> > +	if (!sbiret_report_error(&ret, SBI_SUCCESS, "set to %d again", !enabl=
ed))
> > +		goto inval_tests;
> > +	else
> > +		enabled =3D !enabled;
> > +
> > +	ret =3D fwft_get(SBI_FWFT_PTE_AD_HW_UPDATING);
> > +	sbiret_report(&ret, SBI_SUCCESS, enabled, "get %d again", enabled);
> > +
> > +	adue_check(enabled);
> =

> That seems like this whole block was copy/pasted, it might be factorized.
> =

> > +
> > +#if __riscv_xlen > 32
> > +	ret =3D fwft_set_raw(BIT(32) | SBI_FWFT_PTE_AD_HW_UPDATING, !enabled,=
 0);
> > +	if (!sbiret_report_error(&ret, SBI_SUCCESS, "set to %d with high feat=
ure bits set", !enabled))
> > +		goto inval_tests;
> > +	else
> > +		enabled =3D !enabled;
> > +
> > +	ret =3D fwft_get(SBI_FWFT_PTE_AD_HW_UPDATING);
> > +	sbiret_report(&ret, SBI_SUCCESS, enabled, "get %d after set with high=
 feature bits set", enabled);
> > +
> > +	adue_check(enabled);
> > +#endif
> > +
> > +	ret =3D fwft_set(SBI_FWFT_PTE_AD_HW_UPDATING, !enabled, 1);
> > +	if (!sbiret_report_error(&ret, SBI_SUCCESS, "set to %d with lock", !e=
nabled))
> > +		goto inval_tests;
> > +	else
> > +		enabled =3D !enabled;
> > +
> > +	ret =3D fwft_get(SBI_FWFT_PTE_AD_HW_UPDATING);
> > +	sbiret_report(&ret, SBI_SUCCESS, enabled, "get %d after set with lock=
", enabled);
> > +
> > +	adue_check(enabled);
> > +
> > +	ret =3D fwft_set(SBI_FWFT_PTE_AD_HW_UPDATING, !enabled, 0);
> > +	sbiret_report_error(&ret, SBI_ERR_DENIED_LOCKED, "set locked to %d wi=
thout lock", !enabled);
> > +
> > +	ret =3D fwft_set(SBI_FWFT_PTE_AD_HW_UPDATING, !enabled, 1);
> > +	sbiret_report_error(&ret, SBI_ERR_DENIED_LOCKED, "set locked to %d wi=
th lock", !enabled);
> > +
> > +	ret =3D fwft_set(SBI_FWFT_PTE_AD_HW_UPDATING, enabled, 0);
> > +	sbiret_report_error(&ret, SBI_ERR_DENIED_LOCKED, "set locked to %d wi=
thout lock", enabled);
> > +
> > +	ret =3D fwft_get(SBI_FWFT_PTE_AD_HW_UPDATING);
> > +	sbiret_report(&ret, SBI_SUCCESS, enabled, "get locked %d after same s=
et without lock", enabled);
> > +
> > +	ret =3D fwft_set(SBI_FWFT_PTE_AD_HW_UPDATING, enabled, 1);
> > +	sbiret_report_error(&ret, SBI_ERR_DENIED_LOCKED, "set locked to %d wi=
th lock", enabled);
> > +
> > +	ret =3D fwft_get(SBI_FWFT_PTE_AD_HW_UPDATING);
> > +	sbiret_report(&ret, SBI_SUCCESS, enabled, "get locked %d after same s=
et with lock", enabled);
> =

> Should this be factorized with the misaligned LOCKED testing as well ?
> =

> > +
> > +inval_tests:
> > +	ret =3D fwft_set(SBI_FWFT_PTE_AD_HW_UPDATING, 2, 0);
> > +	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "set to 2");
> > +
> > +	ret =3D fwft_set(SBI_FWFT_PTE_AD_HW_UPDATING, !enabled, 2);
> > +	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "set to %d with flag=
s=3D2", !enabled);
> =

> Ditto.
> =

> Otherwise, looks good to me.

Thanks for the review. I'll refactor as suggested. I've also got a couple
other changes to make, such as marking the reset value test as kfail,
since opensbi currently enables svadu when it's present.

I'll send a v2 of this series with patch 1/10 dropped and this patch
added after fixing it up.

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
