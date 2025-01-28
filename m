Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8144FC0218A
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 18:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZb9vW5zK/k10Mjk40sVDdaCHjYqKgAbq8czUwqlvOg=; b=gCQqq+8CdmVVd2zS3OHPj6p1tJ
	Ak8bwBdHoIiX+59x3aP7gh7cunhTfQ8tHTJP0H5JjDo6QA07+KijP8JHSjIy+CxjMa0Jt/MnWI28N
	6KyZHhLU/Vn4vLbD7TzOJJS0UTokSamF8V41VZwBFmEedloM+EzbSXQZ1JS2Ef6zp7OKSzSBPc4vB
	djp7K5fvzr4vUyGoeSDiTUMCFQ9ePhTLqrx8sGH0fkdK46jymxh5ZWfHe1JgRV9ES/vmGv4+hNYhn
	k+7SlfdWopq0DhMKaGtIhS2uuwvvoydxWA03+ZjVGVj9zRvs5hgizrX5j6eJqs1pG4EPzSbBqXjm0
	jpqMrGXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcq9L-00000005YIJ-0zZF;
	Tue, 28 Jan 2025 18:17:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcq8Q-00000005Y5Y-2pLD;
	Tue, 28 Jan 2025 18:16:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 14F34A41078;
	Tue, 28 Jan 2025 18:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F36FAC4CED3;
	Tue, 28 Jan 2025 18:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738088185;
	bh=dAhBIZe0NzGrk1yP7ba0F2cmDA+lcqNfDyuYt8ErwRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZrftOapNA8Eyku0qCpJKq83E+TD2XmaWlujUh9CFP4XK8vS31y6coss+9ZWtBusns
	 AHcEsFX0JlmC8QYGEOggefw0efgPihS9eUzUIHHdUDwtDhWtJAPPHnWvv3LraZhB6E
	 XGOMQNebgjk4IBWQg3Wa6c3K2FziMHBNWSm2tsu2g1FMDrCwJbxqDO9Agg6/0gqfzl
	 I+XiSOsd7PN/30899VQtArlsbbAjsvaCoojBh4I6UPEO2cNsB1+PTHf8oyVmAqPSC6
	 /i56wCYOR4kLHGDO1W9UH4FEJvDF8MhbIsVZ19awk2Svz+J3luKa52D1KTi4JciHUy
	 z0BCn2hK8R5rA==
Date: Tue, 28 Jan 2025 18:16:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Atish Patra <atishp@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v3 10/21] dt-bindings: riscv: add Smcntrpmf ISA extension
 description
Message-ID: <20250128-alkalize-gains-d7ff05cb8c71@spud>
References: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
 <20250127-counter_delegation-v3-10-64894d7e16d5@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20250127-counter_delegation-v3-10-64894d7e16d5@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_101626_841410_FCB60667 
X-CRM114-Status: GOOD (  17.53  )
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
Content-Type: multipart/mixed; boundary="===============7356582968358473459=="
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org


--===============7356582968358473459==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9yLtu4dFJkbHyVHb"
Content-Disposition: inline


--9yLtu4dFJkbHyVHb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 08:59:51PM -0800, Atish Patra wrote:
> Add the description for Smcntrpmf ISA extension
>=20
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 1706a77729db..0afe47259c55 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -136,6 +136,14 @@ properties:
>              20240213 version of the privileged ISA specification. This e=
xtension
>              depends on Sscsrind, Zihpm, Zicntr extensions.
> =20
> +        - const: smcntrpmf
> +          description: |
> +            The standard Smcntrpmf supervisor-level extension for the ma=
chine mode
> +            to enable privilege mode filtering for cycle and instret cou=
nters as
> +            ratified in the 20240326 version of the privileged ISA speci=
fication.
> +            The Ssccfg extension depends on this as *cfg CSRs are availa=
ble only
> +            if smcntrpmf is present.

Same here, this Ssccfg dep on Smcntrpmf should be in schema.

> +
>          - const: smmpm
>            description: |
>              The standard Smmpm extension for M-mode pointer masking as
>=20
> --=20
> 2.34.1
>=20

--9yLtu4dFJkbHyVHb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5ke8gAKCRB4tDGHoIJi
0vPhAQDx+AuPwwIGi1but7cc+ZSuNL3hdXEnMDZgYqVgWvZYyQD/XAo/U+6tF1Qq
aDwsQLtFmnRh8LNdj2PoYC0npPteJQg=
=WLCX
-----END PGP SIGNATURE-----

--9yLtu4dFJkbHyVHb--


--===============7356582968358473459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

--===============7356582968358473459==--

