Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7E8C35FFA
	for <kvm-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 17:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ukITDlw58sf5FVGMspIEmvi6gWhSeUpybCdof89oClc=; b=tVUQAfd41JHQdk
	0oIY59Lx3g0RvRodOnRwYZc7K7mYPWVBu/Ie0fa5/3QwL5YayjzpSU/SujmrTHnhy5GlmFhzv69+i
	7yS5erG252K1gmPupNuEmQS66DtxydenDU9SvxgtEXWJEGys0nSZPmP/VEEGCj3mY9tQX7zcuTkOH
	CwKZPAyLUltP2Won4PPshWUKlxVuQi/+R1hQKHm5RaAcsY0qYGV8yXwurIHlaDrFdiAwc40TMPyXs
	+Ktvx2N+wfubJog4fYbn9rrBuQ1/aKs6VU8BhIf0NZWBMEOhOZyhOQbrPXBLvmOj9scXWbTJuO7SL
	C/ZN9O30JbTnkhZ/Cz1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuxGz-00000009iKz-27PO;
	Wed, 19 Mar 2025 17:32:09 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuxGw-00000009iIy-0Mrn
	for kvm-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 17:32:08 +0000
Date: Wed, 19 Mar 2025 18:31:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742405518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z2pqXA/0SlPrspqJJaHSGdI17Q8kctLaPstjxatkNlU=;
	b=MNZ2ReFMY8kfunRXE+pcnZTr3t+U9sdt7uz6cjy52DGzH4JjpAjcc1GkfYzuIQRTnAR8j9
	yeJp8P0rYRZOI6310FTREa34E5hbi9RhSxlkq49R3qoBapQardJ1LDBxk91Z9iVJDIMZU8
	Swe2sefwPL1GKOb8A9tW8xmOdBrwdgQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v11 4/8] lib: riscv: Add functions for
 version checking
Message-ID: <20250319-7ce04ed29661af987303b215@orel>
References: <20250317164655.1120015-1-cleger@rivosinc.com>
 <20250317164655.1120015-5-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250317164655.1120015-5-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_103206_333835_AF83FD94 
X-CRM114-Status: GOOD (  16.83  )
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

On Mon, Mar 17, 2025 at 05:46:49PM +0100, Cl=E9ment L=E9ger wrote:
> Version checking was done using some custom hardcoded values, backport a
> few SBI function and defines from Linux to do that cleanly.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  lib/riscv/asm/sbi.h | 15 +++++++++++++++
>  lib/riscv/sbi.c     |  9 +++++++--
>  2 files changed, 22 insertions(+), 2 deletions(-)
> =

> diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
> index 2f4d91ef..ee9d6e50 100644
> --- a/lib/riscv/asm/sbi.h
> +++ b/lib/riscv/asm/sbi.h
> @@ -18,6 +18,13 @@
>  #define SBI_ERR_IO			-13
>  #define SBI_ERR_DENIED_LOCKED		-14
>  =

> +/* SBI spec version fields */
> +#define SBI_SPEC_VERSION_MAJOR_SHIFT	24
> +#define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
> +#define SBI_SPEC_VERSION_MINOR_MASK	0xffffff
> +#define SBI_SPEC_VERSION_MASK		((SBI_SPEC_VERSION_MAJOR_MASK << SBI_SPEC=
_VERSION_MAJOR_SHIFT) | \
> +					SBI_SPEC_VERSION_MINOR_MASK)
                                       ^ needs one more space
> +
>  #ifndef __ASSEMBLER__
>  #include <cpumask.h>
>  =

> @@ -110,6 +117,13 @@ struct sbiret {
>  	long value;
>  };
>  =

> +/* Make SBI version */

Unnecessary comment, it's the same as the function name.

> +static inline unsigned long sbi_mk_version(unsigned long major, unsigned=
 long minor)
> +{
> +	return ((major & SBI_SPEC_VERSION_MAJOR_MASK) << SBI_SPEC_VERSION_MAJOR=
_SHIFT)
> +		| (minor & SBI_SPEC_VERSION_MINOR_MASK);
> +}
> +
>  struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>  			unsigned long arg1, unsigned long arg2,
>  			unsigned long arg3, unsigned long arg4,
> @@ -124,6 +138,7 @@ struct sbiret sbi_send_ipi_cpu(int cpu);
>  struct sbiret sbi_send_ipi_cpumask(const cpumask_t *mask);
>  struct sbiret sbi_send_ipi_broadcast(void);
>  struct sbiret sbi_set_timer(unsigned long stime_value);
> +struct sbiret sbi_get_spec_version(void);
>  long sbi_probe(int ext);
>  =

>  #endif /* !__ASSEMBLER__ */
> diff --git a/lib/riscv/sbi.c b/lib/riscv/sbi.c
> index 02dd338c..9d4eb541 100644
> --- a/lib/riscv/sbi.c
> +++ b/lib/riscv/sbi.c
> @@ -107,12 +107,17 @@ struct sbiret sbi_set_timer(unsigned long stime_val=
ue)
>  	return sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value, 0, =
0, 0, 0, 0);
>  }
>  =

> +struct sbiret sbi_get_spec_version(void)
> +{
> +	return sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_SPEC_VERSION, 0, 0, 0, =
0, 0, 0);
> +}
> +
>  long sbi_probe(int ext)
>  {
>  	struct sbiret ret;
>  =

> -	ret =3D sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_SPEC_VERSION, 0, 0, 0,=
 0, 0, 0);
> -	assert(!ret.error && (ret.value & 0x7ffffffful) >=3D 2);
> +	ret =3D sbi_get_spec_version();
> +	assert(!ret.error && (ret.value & SBI_SPEC_VERSION_MASK) >=3D sbi_mk_ve=
rsion(0, 2));
>  =

>  	ret =3D sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, ext, 0, 0, 0, 0=
, 0);
>  	assert(!ret.error);
> -- =

> 2.47.2
>

I fixed those two things up while applying.

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
