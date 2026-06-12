Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E430CD4F2C
	for <kvm-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 08:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JKQZ71aIxBw4ro65lN1jdx9cnH3EF1uDS+4nI1y0f0=; b=h2f9jtCoZX7x5b1CsW/DieKo/7
	ANHbeCUu8bTckO1IObfmJde0/iMCYfhE1rK9Nc3HU/l4Nq/ykRYIh1gUMfzua+Vna5UHmpJgCvT28
	QxdDVouGTWE0WZzf5RqkqGj8VNRA9OTrKIqiFJucJSE4YWBifuWHU9thjuswRQmtMzXguq5WMmsah
	BMYg0sCYFvhxO7bVWbU6Zu/6+xAN7WmQ05IjYGYPZzAAflLKceYf/U+RzdV1xLKc9QRURRF4BPGgz
	KIYodcoiie9zmHetA6RVTyekE1g9zBATJimx1EbLOBDJqH8IQe99chJJaSPL4X1O8zFnsB5sCjRfR
	kKAsl0Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxBO-0000000AZlL-3vwu;
	Fri, 12 Jun 2026 08:24:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxBM-0000000AZkq-426g;
	Fri, 12 Jun 2026 08:24:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1781252646; x=1812788646;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aik1yZWSrKo57yjYoAjGg1WiRNqIySZleRfYd2RGgiY=;
  b=M/qYnh2+vzN1VsNIX0tPDvOnW85ecMAt3gC38tmwrBiJoD+dgPWvOaBa
   PMZNaTjI1RR6qFedYC0gVKFcQYc2+01pomTsCjt6VpoN9UNa5AqJTZ+fc
   CkytOOD5UZSqCCEYTgFR90iyJftYn+k0aOYtWJ7kYAyneB8IsOnqY220z
   gzrsu3b+7ry76uClLhzUYaya0ZZH8EXBIUq2czovOec2ov42UubNLijTb
   tiwhh13GCY0Z42cw11+tDd3z9RpThKbpCzWvIKw0R7E/0B2cidbpu9xU9
   eB5CIw2nai+X9JLd3P2kYOGF4doxx8PPRgEfDSBoYSacW9x6Ac1RErXxf
   A==;
X-CSE-ConnectionGUID: 5MrWdWtvTtS4GM0us5yIIA==
X-CSE-MsgGUID: szhd3KRbRoylTsr8ICyu6g==
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="asc'?scan'208";a="59016839"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Jun 2026 01:24:04 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 12 Jun 2026 01:24:02 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 12 Jun 2026 01:23:58 -0700
Date: Fri, 12 Jun 2026 09:23:12 +0100
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
	<linux-kselftest@vger.kernel.org>, Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH v4 08/16] dt-bindings: riscv: Add Zic64b extension
 description
Message-ID: <20260612-scarcity-willow-c073342b5ac2@wendy>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
 <20260611-rva23u64-hwprobe-v2-v4-8-3f01a2449488@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-8-3f01a2449488@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_012405_016147_F003A0B7 
X-CRM114-Status: GOOD (  23.61  )
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
Content-Type: multipart/mixed; boundary="===============5973635434971860152=="
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

--===============5973635434971860152==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Dm2P8/tZRoFsL+eF"
Content-Disposition: inline

--Dm2P8/tZRoFsL+eF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 04:12:45PM -0400, Guodong Xu wrote:
> Zic64b mandates that cache blocks are 64 bytes in size and naturally
> aligned in the address space.  It is a mandatory extension of both the
> RVA22 (U64/S64) and RVA23 (U64/S64) profiles, ratified with RISC-V
> Profiles Version 1.0.
>=20
> Document it so it can be described in the riscv,isa-extensions property,
> alongside the related Zicbom/Zicbop/Zicboz cache-block extensions. Since
> Zic64b fixes the cache block size at 64 bytes, also add a  schema check
                                                           ^^
Not that it matters, but there's an extra space here.

> requiring any present cbom/cbop/cboz block size to be 64.
>=20
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>
> ---
> v4: Insert zic64b at its sorted position (before zicbom).
>     Update the commit message.
> v3: New patch.
> ---
>  .../devicetree/bindings/riscv/extensions.yaml        | 20 ++++++++++++++=
++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 5ffc40d599c02..1c24999beb59e 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -494,6 +494,12 @@ properties:
>              in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
>              riscv-isa-manual.
> =20
> +        - const: zic64b
> +          description:
> +            The standard Zic64b extension for 64-byte naturally aligned =
cache
> +            blocks, as ratified in RISC-V Profiles Version 1.0, with com=
mit
> +            b1d806605f87 ("Updated to ratified state.")
> +
>          - const: zicbom
>            description:
>              The standard Zicbom extension for base cache management oper=
ations as
> @@ -1142,6 +1148,20 @@ allOf:
>            not:
>              contains:
>                const: zilsd
> +  # Zic64b mandates 64-byte naturally aligned cache blocks
> +  - if:
> +      properties:
> +        riscv,isa-extensions:
> +          contains:
> +            const: zic64b
> +    then:
> +      properties:
> +        riscv,cbom-block-size:
> +          const: 64
> +        riscv,cbop-block-size:
> +          const: 64
> +        riscv,cboz-block-size:
> +          const: 64

I think we also need to have
diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Docu=
mentation/devicetree/bindings/riscv/extensions.yaml
index 1c24999beb59e..bbd442cfbd904 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -1162,6 +1162,32 @@ allOf:
           const: 64
         riscv,cboz-block-size:
           const: 64
+  # All three Zicbo* extensions require their block size property as there=
's no
+  # default.
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicbom
+    then:
+      required:
+        - riscv,cbom-block-size
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicbop
+    then:
+      required:
+        - riscv,cbop-block-size
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicboz
+    then:
+      required:
+        - riscv,cboz-block-size
=20
 additionalProperties: true
 ...

because I don't think there's a warning generated at present* if someone
does "zicbom" + "zic64b" and doesn't have a riscv,cbom-block-size property,
only if they have one and it isn't 64. I think the former is a bigger
problem than the latter.

Probably needs to be an additional patch, because it has value whether
or not we permit zic64b.

pwbot: cr

Cheers,
Conor.

*: the kernel will warn at runtime, but nothing in dtbs_check etc.

> =20
>  additionalProperties: true
>  ...
>=20
> --=20
> 2.43.0
>=20

--Dm2P8/tZRoFsL+eF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaivB7wAKCRB4tDGHoIJi
0r+LAP95Lkh6JmlVNGkOMGiFZ+ds+OC4z1NCcvaGyDDMznHyEQEAk5bm8w0ICEyr
TwHrpZxora0ISSspUjdDg1Xmy+dJDQM=
=9gRX
-----END PGP SIGNATURE-----

--Dm2P8/tZRoFsL+eF--


--===============5973635434971860152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

--===============5973635434971860152==--

