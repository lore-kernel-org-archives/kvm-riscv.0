Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595F8CD8CA8
	for <kvm-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 08:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7Kut8udm0qZ19ozi2WFf/Qn7Vzvmp0Ts3QfutBzaKw=; b=thDaqeFdLqQrFgye5ICk/F4SgF
	l5xZVSGtHTSYVUIHLRlBMm4X0YdrebnRgKMCKqO8ItDdgJCW//Ob6IlJvBRKotF/kkdyd1zYUBT2A
	tOr6U0LQwRwIUHwvdyDox5zUNn55+LhdFHWqdI/Cia57v6CLIoAKioRIpU9vRUJvT+KQyg1PivmLu
	uYn7HaW7Qrt/B+tJ/B798TqYQ5asyQs9Mh1PkGAUSnvaM8o0DA0Ztuv8yKxYcWvlDG9HSwgczSgOY
	e/8JKWMONUPoFDwPjl8swndj0RvNa8AegQSoqAH8JfyJVtdlMfS1dFcNKAdLk9hGS0pWoYfPdiSX2
	+D9HcM5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxSg-0000000AauP-3vTj;
	Fri, 12 Jun 2026 08:41:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxSd-0000000Aatt-2K5v;
	Fri, 12 Jun 2026 08:41:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1781253717; x=1812789717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cJS4+U+Lvd9JiTFvDEcycO1GrMxgHTDXXvhAFBUdHBY=;
  b=rn5Vab6uWHYXd1rjInpzacx/i9ApDbJQIQ7WtIOeC3zQXDO+WTCSL/a+
   p8tVZiSkk53fQr0hMwaWkiCfTqyj+tSTWG6evFK5wnJgtSGrrd/B/fsFQ
   f2ckYMxMvl2UA97xxXtQwX2TjjjptF4gvHouvS4N3RhEKjj8zsbF+ltXj
   9rqfMuWoIEn/z9XDbDR8/f3XP2LvUmOTtHbJfS78rxYptrns5AJ1bSC9/
   YNUnsYYU5R2bfBWTKkvujfVUD6RWoE2G82RS63PMLdDROFgY818ER3qoN
   QZ2l/rwwwX0LrYToVVAPfxLfG7QnIC0Vtb9NEUPKX0nQM4Y8t0F/8d9sd
   Q==;
X-CSE-ConnectionGUID: XuaeUrWDQs68NJpIlx5NwQ==
X-CSE-MsgGUID: /IzbyA5FSWGqN1HaIZcVPg==
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="asc'?scan'208";a="59017390"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Jun 2026 01:41:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 12 Jun 2026 01:41:53 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 12 Jun 2026 01:41:48 -0700
Date: Fri, 12 Jun 2026 09:41:02 +0100
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
	<linux-kselftest@vger.kernel.org>, Palmer Dabbelt <palmer@sifive.com>,
	Qingwei Hu <qingwei.hu@bytedance.com>
Subject: Re: [PATCH v4 09/16] riscv: Add Zic64b to cpufeature and hwprobe
Message-ID: <20260612-frays-feast-e631e3aa047d@wendy>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
 <20260611-rva23u64-hwprobe-v2-v4-9-3f01a2449488@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-9-3f01a2449488@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_014155_886836_5425DA21 
X-CRM114-Status: GOOD (  14.90  )
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
Content-Type: multipart/mixed; boundary="===============6994296995151983683=="
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

--===============6994296995151983683==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yeEbaUwKYQ4BJ0tH"
Content-Disposition: inline

--yeEbaUwKYQ4BJ0tH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 04:12:46PM -0400, Guodong Xu wrote:
> From: Qingwei Hu <qingwei.hu@bytedance.com>
>=20
> Zic64b mandates 64-byte naturally aligned cache blocks and is a
> mandatory extension of the RVA22 and RVA23 profiles.  Allocate a
> RISCV_ISA_EXT_ZIC64B id, parse "zic64b" from the ISA string with a
> validate callback that requires each cbom/cbop/cboz cache block size to
> be 64 bytes when it is present, and export it through hwprobe.
>=20
> Link: https://lists.riscv.org/g/tech-unprivileged/topic/question_about_zi=
c64b_and/119631059
> Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
> Co-developed-by: Guodong Xu <docular.xu@gmail.com>
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>

> +static int riscv_ext_zic64b_validate(const struct riscv_isa_ext_data *da=
ta,
> +				     const unsigned long *isa_bitmap)
> +{
> +	/*
> +	 * Zic64b mandates 64-byte naturally aligned cache blocks; cross-check =
the
> +	 * cbom/cbop/cboz block-size (when declared) device-tree properties to
> +	 * avoid inconsistency.
> +	 */
> +	if ((riscv_cbom_block_size && riscv_cbom_block_size !=3D 64) ||
> +	    (riscv_cbop_block_size && riscv_cbop_block_size !=3D 64) ||
> +	    (riscv_cboz_block_size && riscv_cboz_block_size !=3D 64)) {
> +		pr_err("Zic64b detected in ISA string, disabling as a CBO block size i=
s not 64 bytes\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}

I'm inclined to object to this, but we don't have validation on ACPI
stuff to be able to mandate that people fill in the rhct entries.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


--yeEbaUwKYQ4BJ0tH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaivGHgAKCRB4tDGHoIJi
0lFLAQDha3cantxsp/CPLOnAf10qvhl6aJAKsPOLD54gW9K0AQD+I9ggy4JDJWBL
AjJkB9ffVB058Go53e93Vc4lz51wNQw=
=4eTb
-----END PGP SIGNATURE-----

--yeEbaUwKYQ4BJ0tH--


--===============6994296995151983683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

--===============6994296995151983683==--

