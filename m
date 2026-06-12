Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3F3CD8CA8
	for <kvm-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 08:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L//0crN2O5oUiAfGVZlUKj/Px0xn1SFSTLcrpQnh3jk=; b=fIjSZ4f22cMOIE2NLTGiD6dXFJ
	yg7GypDQuAdWmrE13SpIxCm9Wp6qS4CX2ARrQFOfcMKQ2rDm1tEHMPcrB3tde//diODtTSTVQ8M3g
	BGpVw42aHLgNUsgrrcRftLbBH9BWqHzBvoUc7jLM3d3g1nVHV7IGK0bR3rmEUMwqn/2Zv5zNGAacU
	fjtBH2xGs7OQedoC9zXtL+kk4RlAYwFJnYULqh1dqmFe/KFMV2WdFMGmzmIET+IGMNQEgL04uhENz
	wvsUToYzjj8Sq6qbmHaAyk+NQZL50NN8rwbOT9vVYlRlaRaTNO8MXEMuKZVDEpMdMT4RoXCRv//fO
	Zo69scog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwz5-0000000AYSf-1gHO;
	Fri, 12 Jun 2026 08:11:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwz3-0000000AYSF-0e44;
	Fri, 12 Jun 2026 08:11:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1781251881; x=1812787881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=09IdOVLMNDB2JSk1h6RiniYc8xGkWsFYI0Azybko6vM=;
  b=ipJuFK1e9zGb690R4pe++xOKvb2XASC/UkMFFmg6QeOFJdbdAoXicAvI
   yRg1BAF+JcvlnzsEzGDThI/XVREMWP56Fvmwvjs0AvikLGl1XBAzleC1X
   4jX9JYhgHXoEV9WufrdzVMzFHo0H5uJMHxZquDsV9pCdIpEL7Pb9Cz2vF
   hyNB0Xxl96Fx8crsYrtNVoNRaTXHkJQeg2FqJuEjt3CX/86/9Gj48il5a
   Y/cyjveDy/1U3jslRIM+lMF8wV75bHN01D4+K9Ga3he0y9QqLKrJ1Rwq5
   d5+MLv91WbF++JTcThTxeFH34lDwkAuNHhI6cAYXP9sHY/5lv5KP50mb0
   A==;
X-CSE-ConnectionGUID: 7jMcURnnQSWYXlwofOiWTQ==
X-CSE-MsgGUID: uQQAS81sTPGD4Sp0EYLexQ==
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="asc'?scan'208";a="59402913"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Jun 2026 01:11:19 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 12 Jun 2026 01:11:19 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 12 Jun 2026 01:11:14 -0700
Date: Fri, 12 Jun 2026 09:10:28 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Guodong Xu <docular.xu@gmail.com>
CC: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Zong Li
	<zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>, Anup Patel
	<anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Chen Wang
	<unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>,
	<linux-doc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
	<kvm-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>, <devicetree@vger.kernel.org>,
	<spacemit@lists.linux.dev>, <sophgo@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, Palmer Dabbelt <palmer@sifive.com>, Andrew
 Jones <andrew.jones@oss.qualcomm.com>
Subject: Re: [PATCH v4 06/16] riscv: Add Ziccamoa, Ziccif, Ziccrse, and
 Za64rs to cpufeature and hwprobe
Message-ID: <20260612-revered-statue-793228111bf1@wendy>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
 <20260611-rva23u64-hwprobe-v2-v4-6-3f01a2449488@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-6-3f01a2449488@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_011121_261031_A7BE59DD 
X-CRM114-Status: GOOD (  19.35  )
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
Content-Type: multipart/mixed; boundary="===============0702783504312098461=="
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

--===============0702783504312098461==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qxWNCqHoXJi6kp6h"
Content-Disposition: inline

--qxWNCqHoXJi6kp6h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 04:12:43PM -0400, Guodong Xu wrote:
> From: Andrew Jones <andrew.jones@oss.qualcomm.com>
>=20
> Add Ziccamoa, Ziccif, and Za64rs to riscv_isa_ext[] so they can be
> parsed from devicetree/ACPI ISA strings. Ziccrse is already present
> in cpufeature; this patch only adds its hwprobe exposure.
>=20
> Expose all four extensions via hwprobe through new bits in
> RISCV_HWPROBE_KEY_IMA_EXT_1 (RISCV_HWPROBE_EXT_ZICCAMOA, _ZICCIF,
> _ZICCRSE, _ZA64RS), so userspace can probe each of these
> RVA23U64-mandatory extensions individually.
>=20
> Rationale for the validation dependencies added for Ziccamoa and Za64rs:
>=20
> 1) Ziccamoa depends on Zaamo.  The RVA23 profile prose was updated
> post-ratification to spell out the Zaamo reference: commit
> 2b218613752d in riscv/riscv-profiles ("Improve description of
> Ziccamoa (#224)") reworded the rva23-profile.adoc (and other profiles
> that include Ziccamoa) text from "must support all atomics in A" to
> "must support all atomics in the Zaamo extension" [1].
>=20
> 2) Za64rs depends on Zalrsc. The unprivileged ISA manual src/zars.adoc,
> integrated in commit ebe06adc22cd ("Integrate profiles as Volume III
> (#2771)"), defines Za64rs as: "The Za64rs extension requires that the
> reservation sets used by the instructions in the Zalrsc extension be
> contiguous, naturally aligned, and at most 64 bytes in size" [2].

I think I made the point on either an earlier version of this, or a
similar thread, that the point of the validate callback stuff is to make
sure that the kernel is correctly configured to use the extension in
question or an extension it depends on. It's not the kernel's job to
make sure that the firmware has not reported having an extension without
one that it depends on (at least it is not in devicetree land, and I can
only assume that ACPI is by and large the same.

ziccamoa and za64rs don't depend on kernel configuration and neither do
zaamo and zalrsc, so these validate callbacks should be removed.

Cheers,
Conor.

> +static int riscv_ext_zaamo_depends(const struct riscv_isa_ext_data *data,
> +				   const unsigned long *isa_bitmap)
> +{
> +	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZAAMO))
> +		return 0;
> +
> +	return -EPROBE_DEFER;
> +}
> +
> +static int riscv_ext_zalrsc_depends(const struct riscv_isa_ext_data *dat=
a,
> +				    const unsigned long *isa_bitmap)
> +{
> +	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZALRSC))
> +		return 0;
> +
> +	return -EPROBE_DEFER;
> +}

--qxWNCqHoXJi6kp6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiu+8wAKCRB4tDGHoIJi
0om5AQC8Njoz4GNfpjgzPd4cWpxlA4c1jp3tdh2XAHtySRQDEQEA0ZBPLNZ+r6Ue
lM5ZxmXdd2griErGWLwGSLQDdTBztQ4=
=cqPD
-----END PGP SIGNATURE-----

--qxWNCqHoXJi6kp6h--


--===============0702783504312098461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

--===============0702783504312098461==--

