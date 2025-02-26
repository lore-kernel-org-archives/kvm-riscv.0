Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5023FC021B8
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 18:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b6BeXkHTsA0e8+CcmMrdA4mOhwNcOXQAVU/XiizTNhU=; b=13jwKiA4K0JpL0
	a7Z/OfuIJmPWDdmI36hf6u97Ld0j8ykITnc8vijWJNuM2MQbqUFUL3ReDAu44XSRPtpqnZ7sNYgWc
	Z2oTPIlBtIUXsor1FZU7OUrgiOXBiQTVmA681OGNy2RsdDaBkg6dPXw5JxynCB/F/v5JKn8ynwAMi
	MWnq6a1v6UMFEykBK2ypbYPWoEpAMbL82JsCTQ40AF//6eMn7JbpyaSLI/w47ypAk7F7yecHuQVDQ
	QIu9kbr34bPBeC1QCXvKIjz0T8jrF/RYENhy/tqlKLu18lqTZgX5Ge+OHcLXPm04agHIywK+ymLZx
	mcOcIf2abG2LAPKDZNRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnLj6-00000004ozP-3B6z;
	Wed, 26 Feb 2025 18:01:44 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnLj4-00000004oyv-1CBn
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 18:01:43 +0000
Date: Wed, 26 Feb 2025 19:01:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740592900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v/wsRG73sMeahmFOqhTWD0fHJ5CUTxwKB3f2RTTnfzk=;
	b=SHJhEAWO1WCK9jAS+4YT4ydt6WNWPA4cZMYjwlcupxmdpAzlCO+tsSKYFawUu+vSpfx6h2
	xaoU/8xn/XSywdVTibgYLTPM+A2efXbQDMCPVAyqL/BLKhh3tmqQp7DNhmX9EhIUvlPE8/
	+XFCSbRBEb94fJDxzagIBEf0nIr8v8E=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, kvm-riscv@lists.infradead.org, 
	atishp@rivosinc.com, jamestiotio@gmail.com
Subject: Re: [kvm-unit-tests PATCH 01/10] riscv: sbi: Mark known fwft
 failures as kfails
Message-ID: <20250226-0d067bd02ffddb477c2d21c8@orel>
References: <20250221155533.123418-12-andrew.jones@linux.dev>
 <20250221155533.123418-13-andrew.jones@linux.dev>
 <1bc65c8e-4d36-4ed4-8f9e-b7a14c09c08a@rivosinc.com>
 <20250225-e46d015c86d53c9a2dfc35ad@orel>
 <20250225-e2ac6882b637786a5712e24e@orel>
 <127ca898-82f9-4595-a3fe-22748818365f@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <127ca898-82f9-4595-a3fe-22748818365f@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_100142_476420_DC5438D4 
X-CRM114-Status: GOOD (  24.32  )
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

On Tue, Feb 25, 2025 at 04:48:42PM +0100, Cl=E9ment L=E9ger wrote:
> =

> =

> On 25/02/2025 16:32, Andrew Jones wrote:
> > On Tue, Feb 25, 2025 at 11:25:13AM +0100, Andrew Jones wrote:
> >> On Tue, Feb 25, 2025 at 11:14:13AM +0100, Cl=E9ment L=E9ger wrote:
> >>>
> >>>
> >>> On 21/02/2025 16:55, Andrew Jones wrote:
> >>>> Until we fix opensbi mark these known failures as kfails so we can
> >>>> pass CI.
> >>>>
> >>>> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> >>>> ---
> >>>>  riscv/sbi-fwft.c | 15 ++++++++++++---
> >>>>  1 file changed, 12 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/riscv/sbi-fwft.c b/riscv/sbi-fwft.c
> >>>> index b10c147f22dd..19340d6bb48c 100644
> >>>> --- a/riscv/sbi-fwft.c
> >>>> +++ b/riscv/sbi-fwft.c
> >>>> @@ -63,11 +63,17 @@ static void fwft_check_base(void)
> >>>>  		struct sbiret ret;
> >>>>  =

> >>>>  		ret =3D fwft_get_raw(BIT(32));
> >>>> -		sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM,
> >>>> +		if (ret.error =3D=3D 0)
> >>>> +			report_kfail(true, false, "get feature with bit 32 set error: SB=
I_ERR_INVALID_PARAM");
> >>>> +		else
> >>>> +			sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM,
> >>>>  				    "get feature with bit 32 set error");
> >>>
> >>>
> >>> Hey Andrew,
> >>>
> >>> I'm actually a bit confused here. As raised by Anup, the spec states =
that:
> >>>
> >>> "Every SBI function should prefer unsigned long as the data type. It
> >>> keeps the specification simple and easily adaptable for all RISC-V ISA
> >>> types. In case the data is defined as 32bit wide, higher privilege
> >>> software must ensure that it only uses 32 bit data."
> >>>
> >>> Does this means 64 bits value are truncated to 32 bits ?
> >>
> >> Ah, yes. I had noticed that required truncation while doing some KVM f=
ixes
> >> and patch 9 of this series is even adding a test for it for SUSP. I ju=
st
> >> didn't look closely enough at why this FWFT test was failing. The test
> >> should get SBI_SUCCESS, as it does, but it should also check that
> >> feature =3D BIT(32) behaves the same as features =3D 1.
> > =

> > Eh, '...as feature =3D 0 (MISALIGNED_EXC_DELEG)'. For now, I think we s=
hould
> > just drop the test, though, because we need a feature that, when presen=
t,
> > always allows enable/disable in order to test for a change in behavior.
> > While we may be able to toggle 0/1 for MISALIGNED_EXC_DELEG, we can't
> > count on traps getting enabled. I'll add ADUE tests and do a truncated
> > feature ID test for it.
> =

> Ah yeah totally make sense ! I'll modify SSE test as well to test that
> 64 bits identifier are correctly truncated.
>

I sent a patch 11/10 to this series with the ADUE test including a
truncated feature id.

Thanks
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
