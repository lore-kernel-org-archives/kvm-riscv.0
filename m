Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97BBCA0EE4
	for <kvm-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIXcL4U0E01kOMqcC4uY67qmDMB2IL+uggjnGxf1TtQ=; b=bIdLYN/so4WIN/Em/7J7SUOfpt
	yMm1PAm1y0+oHRHYJgelqhJaKx89+/fW8Zx3kWnKec8CnQZPlD4FUsVwplW1ROhvY92mRLulK8xBN
	peKTDUHi1/89HWfMvEKa4Ku4hJyFVrvK6284bKhQl6kM896KbwOWH1wkDtUalXTcZANWBL4ORI8Lc
	q/GILxMKmt6rJ988SGRNPtvmHhThGnKeVDPF3N2E75vDnjJGi7FDDRI1DH1uFTiH16IdL6a+S9GXx
	lVeNU+iZDyGa0NDl0p4FartVwf8Akyk+CT3XXHRw56RCEiJg9213UdKKfbTrJBOrlx69AU6hQKgXF
	xRD9vvvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphul-00000004B9i-0Gcf;
	Sat, 23 Aug 2025 06:39:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upUiN-00000003B8F-2JrR;
	Fri, 22 Aug 2025 16:34:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 005D7A58A19;
	Fri, 22 Aug 2025 16:34:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D87CEC4CEED;
	Fri, 22 Aug 2025 16:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755880445;
	bh=iKMaqY2T2MvMaFi0XbUWD0o8saOVzIOavh0WskJFFJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gSgMwNByRYG87aU+xs9MlnWyfggyMpBShAVpHsDhv7+s2Rl50S6MV03gYuI5AIodC
	 gHcJY5vJ8pODlXqfgGFRJt9EsHTYJ9w2zZFxRJzHV80px0qH3IDHBBl2EIDCGFHNVc
	 NdTJacp29PXHOA/QWlJPY6xryO5kHtiYrIf2AmdKyPGVZOmtYOiIeRzrL/a25q30Mp
	 zcBN6hWt8nLuR0iQficgQqnP2PL2DpHAas3KYnbbJjCNjhbrFEoluJgwSHM9RLb14W
	 /tnD6l4HBcfilMhKlkILzTEKi08X16/ucccvai6fqwMVP7CYKttBi9Kng1v051vWcI
	 yXe6kg4RWOPiA==
Date: Fri, 22 Aug 2025 17:33:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, anup@brainfault.org, pbonzini@redhat.com,
	shuah@kernel.org, cyan.yang@sifive.com, cleger@rivosinc.com,
	charlie@rivosinc.com, cuiyunhui@bytedance.com,
	samuel.holland@sifive.com, namcao@linutronix.de, jesse@rivosinc.com,
	inochiama@gmail.com, yongxuan.wang@sifive.com,
	ajones@ventanamicro.com, parri.andrea@gmail.com,
	mikisabate@gmail.com, yikming2222@gmail.com,
	thomas.weissschuh@linutronix.de, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v1 RESEND 1/5] dt-bidings: riscv: add Zilsd and Zclsd
 extension descriptions
Message-ID: <20250822-purge-doubling-f38988284db1@spud>
References: <20250821140131.225756-1-pincheng.plct@isrc.iscas.ac.cn>
 <20250821140131.225756-2-pincheng.plct@isrc.iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20250821140131.225756-2-pincheng.plct@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_093407_739410_5E3E8920 
X-CRM114-Status: GOOD (  19.01  )
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
Content-Type: multipart/mixed; boundary="===============2292658737692843999=="
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org


--===============2292658737692843999==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iXs4qi8wL7fiAACn"
Content-Disposition: inline


--iXs4qi8wL7fiAACn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 10:01:27PM +0800, Pincheng Wang wrote:
> Add descriptions for the Zilsd (Load/Store pair instructions) and
> Zclsd (Compressed Load/Store pair instructions) ISA extensions
> which were ratified in commit f88abf1 ("Integrating load/store
> pair for RV32 with the main manual") of the riscv-isa-manual.
>=20
> Signed-off-by: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index ede6a58ccf53..d72ffe8f6fa7 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -366,6 +366,20 @@ properties:
>              guarantee on LR/SC sequences, as ratified in commit b1d80660=
5f87
>              ("Updated to ratified state.") of the riscv profiles specifi=
cation.
> =20
> +        - const: zilsd
> +          description:
> +            The standard Zilsd extension which provides support for alig=
ned
> +            register-pair load and store operations in 32-bit instruction
> +            encodings, as ratified in commit f88abf1 ("Integrating
> +            load/store pair for RV32 with the main manual") of riscv-isa=
-manual.
> +
> +        - const: zclsd
> +          description:
> +            The Zclsd extension implements the compressed (16-bit) versi=
on of the
> +            Load/Store Pair for RV32. As with Zilsd, this extension was =
ratified
> +            in commit f88abf1 ("Integrating load/store pair for RV32 wit=
h the
> +            main manual") of riscv-isa-manual.
> +
>          - const: zk
>            description:
>              The standard Zk Standard Scalar cryptography extension as ra=
tified
> @@ -847,6 +861,16 @@ properties:
>              anyOf:
>                - const: v
>                - const: zve32x
> +      # Zclsd depends on Zilsd and Zca
> +      - if:
> +          contains:
> +            anyOf:
> +              - const: zclsd
> +        then:
> +          contains:
> +            anyOf:
> +              - const: zilsd
> +              - const: zca
> =20
>  allOf:
>    # Zcf extension does not exist on rv64
> @@ -864,6 +888,21 @@ allOf:
>            not:
>              contains:
>                const: zcf
> +  # Zilsd extension does not exist on rv64
> +  - if:
> +      properties:

> +        riscv,isa-extensions:
> +          contains:
> +            const: zilsd

This syntax is odd, it shouldn't be required to have zilsd in here and
in the then. Did you copy this from Zcf or come up with it yourself
because it didn't work otherwise?

> +        riscv,isa-base:
> +          contains:
> +            const: rv64i
> +    then:
> +      properties:
> +        riscv,isa-extensions:
> +          not:
> +            contains:
> +              const: zilsd
> =20
>  additionalProperties: true
>  ...
> --=20
> 2.39.5
>=20

--iXs4qi8wL7fiAACn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKib9QAKCRB4tDGHoIJi
0irLAQCV5/SvoxN05dR+xOZRbx3ngdqvZgXtTOXV1Bvb1u1sbgEAqB+ZSQTXtrTn
OOlkomc7ojGER25FiOTQpdYiyfasmAg=
=zFKH
-----END PGP SIGNATURE-----

--iXs4qi8wL7fiAACn--


--===============2292658737692843999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

--===============2292658737692843999==--

