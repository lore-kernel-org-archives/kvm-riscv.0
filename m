Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25A3C43458
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 20:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ULN2OmV6jvxcLWYGSaoAWTvZ6nEYbLTf0uFKBGbM0dQ=; b=gGrn47O1knLwUfINzIBHjo8JJg
	ZHXp03h9TsFY8JFCTsG+kQ1bd1bMUqWR7LJpGpsWvOhJQxN4zCqQs03M376peFe4+NrABuPdU8L0M
	S6WSLgYBdLJ0L4y0pDsEPA9rKssGXby6Fbxcl2JJnzfHdtL0yQrnadZbnkDLXx9RiGv+BziW/ANcP
	Pao3/obreYjKvM1DGu2A5FSQ+LMGmu0yZ3B9yuYOqeNNTiJJLqeaVTx7ByCC0hVb9Qd86mbYqHVTp
	NunEo3ikGT51T9M/dyHXo9Z8j+MedjQFM8F8TnnX9PNjlqBRY2zlt6tsE7C5OT2Lr16q2tz1258As
	Za2uIcrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1iS-00000002yTy-3raS;
	Wed, 01 Jul 2026 20:39:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1iR-00000002yTo-2Sqi;
	Wed, 01 Jul 2026 20:39:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 184124004F;
	Wed,  1 Jul 2026 20:39:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC711F000E9;
	Wed,  1 Jul 2026 20:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782938367;
	bh=f6QVBJJnOqTAmv9bGgn42fUJj2cY0FZxJ1ME1xdC+T8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RJRDi4cwA05SdSW+713uFlPiyHLZCwR49gpm/dBeCn1+LQodBzos5L0rNrOeB3byQ
	 WYhZPYks9Se42SWieNvBWgUMjEsqBcwWOs4xOFFLRMbHi6ddQDqKg30NUNu0SRnybo
	 Dxb53nC6CoI0/DRmyz5F3NPVghBQyDdplb73P47xUpH/v/YS8//CW0poBUhA6iC8QZ
	 umZIFhJEUn1UA3tMpqYUH5xGl95l2jJ2JSaktuQKz/5/5/JCb3OwudfJXCtAean9jS
	 MjQR6siiOHHeuqOsor+6mVOYZFjNM2kgMm41a5faaSghy28LcMtS8/BW+wK19MQomK
	 Bdzqn1x2pljIA==
Date: Wed, 1 Jul 2026 21:39:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <chen.wang@linux.dev>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Jesse Taube <jtaubepe@redhat.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 08/17] dt-bindings: riscv: Require block-size for
 Zicbom, Zicbop, and Zicboz
Message-ID: <20260701-squiggle-aging-459cd99cb2dc@spud>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
 <20260701-rva23u64-hwprobe-v2-v5-8-2c61f94a695a@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-8-2c61f94a695a@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1648921951228000963=="
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

--===============1648921951228000963==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dKXZ0SKTAmT4FGH2"
Content-Disposition: inline

--dKXZ0SKTAmT4FGH2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2026 at 08:52:21AM -0400, Guodong Xu wrote:
> Zicbom, Zicbop, and Zicboz have no default cache block size, so a
> devicetree that declares one must also provide the matching
> riscv,cbom/cbop/cboz-block-size property. Make it required so a
> missing block-size property can be caught by dtbs_check.
>=20
> Suggested-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>
> ---
> v5: New patch.
> ---
>  .../devicetree/bindings/riscv/extensions.yaml      | 26 ++++++++++++++++=
++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 5ffc40d599c02..f4dd34d446c02 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -1142,6 +1142,32 @@ allOf:
>            not:
>              contains:
>                const: zilsd
> +  # All three Zicbo* extensions require their block size property as the=
re's no
> +  # default.
> +  - if:
> +      properties:
> +        riscv,isa-extensions:
> +          contains:
> +            const: zicbom

I think the way to fix this is to add
  required:
    - riscv,isa-extensions
to each of these if conditions
(not got time to test it right now, sorry)

> +    then:
> +      required:
> +        - riscv,cbom-block-size
> +  - if:
> +      properties:
> +        riscv,isa-extensions:
> +          contains:
> +            const: zicbop
> +    then:
> +      required:
> +        - riscv,cbop-block-size
> +  - if:
> +      properties:
> +        riscv,isa-extensions:
> +          contains:
> +            const: zicboz
> +    then:
> +      required:
> +        - riscv,cboz-block-size
> =20
>  additionalProperties: true
>  ...
>=20
> --=20
> 2.43.0
>=20

--dKXZ0SKTAmT4FGH2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakV69wAKCRB4tDGHoIJi
0qZuAPsE7PpkS7Q9Q/QdOXMXVi0vMgDYbeEgMRtzf0lMlv6w6gEA1JDV5vGVvkwY
e3dZ2Ec1Eq1CjjFHEnDtDfSSbocyhQw=
=AQmB
-----END PGP SIGNATURE-----

--dKXZ0SKTAmT4FGH2--


--===============1648921951228000963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

--===============1648921951228000963==--

