Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2D1C282DE
	for <kvm-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 14:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i0EPWb+JkHgxI+PRdLg9DkxK50vDKVLPzwtq+0ry8ho=; b=fg6yr+COoMI8uO
	6pZkpEyAXDKe2hwbLzMtGRptTFJp1IICNpQ2EnLIo056dSb2ygdEFAbmgw1zb94pv4w/fS4e5cGD1
	wIh2MxgzwLCFqdpiBwRPKUVI+ouL5HRMQzTUWkzftgE4ybhSBK4hlWtY8FD/Z0bxfx1s9dDNJKHJD
	TjSLmCGjIPBY8Suo9/vptl5Lwajdfb3lTJ9BjMAfy3Urb+eEWfZ1pcWYcScE7ZxeoLXaK+U4wQP1n
	fzr3R4vn/t1MpXjsWP0nm9BHuBZVntxN2Mu/wtI/GTFNih7uOze4zHb02f289L/hHRSqfk/lpYTXS
	OyinfgXcIJnakyah01ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjtg-0000000BaIa-1dN0;
	Thu, 13 Mar 2025 14:50:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tshvC-0000000BHBm-3wbB
	for kvm-riscv@bombadil.infradead.org;
	Thu, 13 Mar 2025 12:44:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=p4eBilR3cQKKkUL6iTV1U2gPm+aqkc/I2/ErCrbp51A=; b=B82xc6SVqOd2WbuINoOfzR3c47
	4IgFNkY7pxfmu6CGSk0Los9xe+21qNh7dxIdrLaf5gZh2+OWQCTrqaqNumhUUHLusss+CwZjR2YhZ
	g6jlaYHiHOLZUXkIpu/4Q1odSjj7Bu5fZSw35IlfxK+OU2n3P732A17jzJCugT4bju4FhwJwsCW3y
	NgOGEvMHEdT9jHV5ZPdraSAY21bKruM0bfbGlsYRFjQgnouYul+TQqSyMJf1TWqVYqcOraRUc7K/w
	u3H+grmD0/CrmPi9LvXgIfktxTzRqV0QlxaiGCJTOxZjB78Qe9i2qBSDJ7YXVKbmHwKCGwmTxNDiz
	/29jUR+A==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tshv9-00000002cP3-3P53
	for kvm-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 12:44:21 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39129fc51f8so785992f8f.0
        for <kvm-riscv@lists.infradead.org>; Thu, 13 Mar 2025 05:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741869857; x=1742474657; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p4eBilR3cQKKkUL6iTV1U2gPm+aqkc/I2/ErCrbp51A=;
        b=jbTcCO4AR+HYvwXEAE2dDtDOIJATqlS/f01V2Aq4hnLK5dsY74KvcU+/f3sOSdq2dd
         fgEhUQwKUo+Sy+LjaHyGlgab1zLufjQsqolhJ1uDNM0cYNHrSXRTunwlAv9xq66txKDD
         MzxqYX4VCtVT3RshfJW0ArdBe4FWEum4bbb2I7hrnRt5/ZGSlD1SexPjXhP4Sb0/7CNC
         +GRGP7ZocH0dbk4DQRKpySUqKbhvRwq7mNksgwAK0hkOtoyidJyp3EYp6mxbY6UCz0Hd
         2ggWy4Pd8aw7owihvDoc+m9yfKhIHOLqPfjGNs3hmk28CPJrh1pkUkh0hD7ucNSzl+Dg
         Nylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741869857; x=1742474657;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p4eBilR3cQKKkUL6iTV1U2gPm+aqkc/I2/ErCrbp51A=;
        b=d2dnnLGqTE20dKg5mQt22UsrBxgWJ9zw003RUffYmTmEJyv+vaTigGJNbUdjYnL6jK
         ejpdtmnQBwmdF4gv1XjaEdWbrKA8VhiLGgfzdamm54SrTWXvuXUAHGdPFS/DllQ0pRt6
         qQzdVJmyzOK1bsWiYEbeHAmaRrZcuEoko6Aiz9069gU8sQbKHi06wi04JXVRSxKCcRpO
         o1qUb4Fj+S8UFg2hoSqu8s7ghEgv+kjjON32o4/HSbOPTwkTpNCrIyIRpchjuz6YtqSW
         AM3xR3PrO4pwm08JwJwsSaFFawZsLyPQ+dI6iSw32CTf4jXyzKd6Vf4PsoumABluT2ZS
         6h4g==
X-Forwarded-Encrypted: i=1; AJvYcCXt/sQIfqcP2STtMWKEtIDwQJfkwWqyyFr7A2SZd7qQWJCWUAV6mM7vwrQ4xE4VbNv3sNSyEViDjWI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2pzEaFe4J/TkIWa8akQV97FQ4K3HonbinbwSP1wtIAnq50N73
	fL6xuKG9hGGAv5wDlLVvYOC5WIxwAYYNHI2gxbPvRKaTlKjAo1RDSs6XQotctOg=
X-Gm-Gg: ASbGncsPNCrjOzkCTEb2hNYjvAnf35dD9cnuBqadhlCgnr6aqLU8PRUWSCtF7/ZvUrA
	Y+VNXuawNKt+r0aWYGwmCeHVKmqSj7aK7jwWL7q3wPL+Ty63IO7UPw07Pfe5OxS+TXR19Cf70RA
	5GF6riHRK5l5yoYYKgs8zF4JMeVIfA2fReaZyrQh1jpOsiIWeYfNethvHaMKG2fpFTSgeZf1A4H
	WfF9FvGCAyLfuPbKcwtQT5KGSrxog2QyeSHRkXlhrhMEOtA9Y+hwFll2BdV3mJfjE7FUiXVHjX3
	4Vzh8aMOBEVtxh36tQqmCiBUZQc6t6A2RWWj7+sNuSk=
X-Google-Smtp-Source: AGHT+IEVKvciONpN7IaLFK/qsTCvmNWqORyhjjKaAjaSuACjOZk+fDyP3VpTM/ig5PwqolpsjOd7kg==
X-Received: by 2002:a05:6000:1a87:b0:391:1923:5a91 with SMTP id ffacd0b85a97d-39132dc4395mr17992640f8f.55.1741869857406;
        Thu, 13 Mar 2025 05:44:17 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b6e87sm2097439f8f.32.2025.03.13.05.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 05:44:16 -0700 (PDT)
Date: Thu, 13 Mar 2025 13:44:16 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 03/17] riscv: sbi: add SBI FWFT extension calls
Message-ID: <20250313-ce439653d16b484dba6a8d3e@orel>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-4-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250310151229.2365992-4-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_124420_107611_9FC5E653 
X-CRM114-Status: GOOD (  18.82  )
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

On Mon, Mar 10, 2025 at 04:12:10PM +0100, Cl=E9ment L=E9ger wrote:
> Add FWFT extension calls. This will be ratified in SBI V3.0 hence, it is
> provided as a separate commit that can be left out if needed.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/kernel/sbi.c | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> =

> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index 256910db1307..af8e2199e32d 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -299,9 +299,19 @@ static int __sbi_rfence_v02(int fid, const struct cp=
umask *cpu_mask,
>  	return 0;
>  }
>  =

> +static bool sbi_fwft_supported;
> +
>  int sbi_fwft_get(u32 feature, unsigned long *value)
>  {
> -	return -EOPNOTSUPP;
> +	struct sbiret ret;
> +
> +	if (!sbi_fwft_supported)
> +		return -EOPNOTSUPP;
> +
> +	ret =3D sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_GET,
> +			feature, 0, 0, 0, 0, 0);
> +
> +	return sbi_err_map_linux_errno(ret.error);
>  }
>  =

>  /**
> @@ -314,7 +324,15 @@ int sbi_fwft_get(u32 feature, unsigned long *value)
>   */
>  int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags)
>  {
> -	return -EOPNOTSUPP;
> +	struct sbiret ret;
> +
> +	if (!sbi_fwft_supported)
> +		return -EOPNOTSUPP;
> +
> +	ret =3D sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_SET,
> +			feature, value, flags, 0, 0, 0);
> +
> +	return sbi_err_map_linux_errno(ret.error);

sbi_err_map_linux_errno() doesn't know about SBI_ERR_DENIED_LOCKED.

>  }
>  =

>  struct fwft_set_req {
> @@ -389,6 +407,9 @@ static int sbi_fwft_feature_local_set(u32 feature, un=
signed long value,
>  int sbi_fwft_all_cpus_set(u32 feature, unsigned long value, unsigned lon=
g flags,
>  			  bool revert_on_fail)
>  {
> +	if (!sbi_fwft_supported)
> +		return -EOPNOTSUPP;
> +
>  	if (feature & SBI_FWFT_GLOBAL_FEATURE_BIT)
>  		return sbi_fwft_set(feature, value, flags);
>  =

> @@ -719,6 +740,11 @@ void __init sbi_init(void)
>  			pr_info("SBI DBCN extension detected\n");
>  			sbi_debug_console_available =3D true;
>  		}
> +		if ((sbi_spec_version >=3D sbi_mk_version(2, 0)) &&

Should check sbi_mk_version(3, 0)

> +		    (sbi_probe_extension(SBI_EXT_FWFT) > 0)) {
> +			pr_info("SBI FWFT extension detected\n");
> +			sbi_fwft_supported =3D true;
> +		}
>  	} else {
>  		__sbi_set_timer =3D __sbi_set_timer_v01;
>  		__sbi_send_ipi	=3D __sbi_send_ipi_v01;
> -- =

> 2.47.2
>

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
