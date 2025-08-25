Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEB1CA0FE7
	for <kvm-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 17:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=an3P6s9o9GpImWlQmmGkZ+O73qAYkWDL7UbHHBXzIqY=; b=OiTCklqDfnqKs6C79dG2f6QXzM
	IJyj5tRJC7nm992tcJ4rGxHArkgKiMw5SR0Z+M2mPaFxKZt6zvKTqO9PwgsccVmZC0vJxzEQ+XL1d
	tJpHjr2p+1YliZGa//fTIOlos90hRFJwL5qd4AtzVj7xo3ukg+tOoz9MAaEuuIiTYigQcJdS43R0k
	6V2j3zBgwOkzNqg3U3IuQf4LVl7RQOitrLA6tZn+pR+dUlxwa8JcOyf/YN/yqqtZfBrrnlp0OPaKV
	PXkDbSzYg5aSADAQ5NWyKcjJQnoO3WqQFkBwabyAt9ZeOsr9T+x9rrsXLj3hE9T1wI3m0IiFcAa9O
	wXkSPlPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqaZA-00000008kzv-2v73;
	Mon, 25 Aug 2025 17:01:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZz9-00000008eRV-153G;
	Mon, 25 Aug 2025 16:23:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 24A4740396;
	Mon, 25 Aug 2025 16:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09423C4CEED;
	Mon, 25 Aug 2025 16:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756139022;
	bh=KgpIyi6RAg5MAXdti7zU0f2hj8RJXYvhBuIqG1e+0CE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cuZQedcg1Zp25ehlMzicSD+8IdnsfbE4M/4qDW+GBk9ac9z4eDU7QA6R5eTSxBxbe
	 IFjDzU/5VAjaY7v9KqbVmjsEbZWtdaSccRasiAxWh7JdLtkj+ykHU+0OaB9UTDfEgW
	 8v3PFGD7ukTKEdGiWSqbat61DdJsQ9rU/FEmZLPNkKxQDhf/heHdagLNykxupDCCSm
	 3lu7uf5m1eR2ji0UUJezLjeh0pDx9h8qfk1AU2OFNwyw+HTJPTewAnEGi434B1V6Br
	 p9w1zuysufJvFxZwXfaIKGYzFCI2xiznEsqSR8PVd5faWmyVnMEqXjwtewDrGZOMx5
	 kCya4XmM0eXwQ==
Date: Mon, 25 Aug 2025 17:23:34 +0100
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
Message-ID: <20250825-clang-husband-bcb5defdb5f3@spud>
References: <20250821140131.225756-1-pincheng.plct@isrc.iscas.ac.cn>
 <20250821140131.225756-2-pincheng.plct@isrc.iscas.ac.cn>
 <20250822-purge-doubling-f38988284db1@spud>
 <a2cc4cbe-82ca-4a89-b623-73721a1f3baf@isrc.iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <a2cc4cbe-82ca-4a89-b623-73721a1f3baf@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_092355_339100_0292F334 
X-CRM114-Status: GOOD (  28.41  )
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
Content-Type: multipart/mixed; boundary="===============0656769901248220721=="
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org


--===============0656769901248220721==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="przAQh4lUz2Eomq/"
Content-Disposition: inline


--przAQh4lUz2Eomq/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 11:26:13PM +0800, Pincheng Wang wrote:
> On 2025/8/23 0:33, Conor Dooley wrote:
> > On Thu, Aug 21, 2025 at 10:01:27PM +0800, Pincheng Wang wrote:
> > > Add descriptions for the Zilsd (Load/Store pair instructions) and
> > > Zclsd (Compressed Load/Store pair instructions) ISA extensions
> > > which were ratified in commit f88abf1 ("Integrating load/store
> > > pair for RV32 with the main manual") of the riscv-isa-manual.
> > >=20
> > > Signed-off-by: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>
> > > ---
> > >   .../devicetree/bindings/riscv/extensions.yaml | 39 ++++++++++++++++=
+++
> > >   1 file changed, 39 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml =
b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > index ede6a58ccf53..d72ffe8f6fa7 100644
> > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > @@ -366,6 +366,20 @@ properties:
> > >               guarantee on LR/SC sequences, as ratified in commit b1d=
806605f87
> > >               ("Updated to ratified state.") of the riscv profiles sp=
ecification.
> > > +        - const: zilsd
> > > +          description:
> > > +            The standard Zilsd extension which provides support for =
aligned
> > > +            register-pair load and store operations in 32-bit instru=
ction
> > > +            encodings, as ratified in commit f88abf1 ("Integrating
> > > +            load/store pair for RV32 with the main manual") of riscv=
-isa-manual.
> > > +
> > > +        - const: zclsd
> > > +          description:
> > > +            The Zclsd extension implements the compressed (16-bit) v=
ersion of the
> > > +            Load/Store Pair for RV32. As with Zilsd, this extension =
was ratified
> > > +            in commit f88abf1 ("Integrating load/store pair for RV32=
 with the
> > > +            main manual") of riscv-isa-manual.
> > > +
> > >           - const: zk
> > >             description:
> > >               The standard Zk Standard Scalar cryptography extension =
as ratified
> > > @@ -847,6 +861,16 @@ properties:
> > >               anyOf:
> > >                 - const: v
> > >                 - const: zve32x
> > > +      # Zclsd depends on Zilsd and Zca
> > > +      - if:
> > > +          contains:
> > > +            anyOf:
> > > +              - const: zclsd
> > > +        then:
> > > +          contains:
> > > +            anyOf:
> > > +              - const: zilsd
> > > +              - const: zca
> > >   allOf:
> > >     # Zcf extension does not exist on rv64
> > > @@ -864,6 +888,21 @@ allOf:
> > >             not:
> > >               contains:
> > >                 const: zcf
> > > +  # Zilsd extension does not exist on rv64
> > > +  - if:
> > > +      properties:
> >=20
> > > +        riscv,isa-extensions:
> > > +          contains:
> > > +            const: zilsd
> >=20
> > This syntax is odd, it shouldn't be required to have zilsd in here and
> > in the then. Did you copy this from Zcf or come up with it yourself
> > because it didn't work otherwise?
> >=20
>=20
> Yes, I did model this after the existing Zcf constraint in the same file.
> The structure is nearly identical: cheking for presence of the extension =
and
> rv64i, then forbidding it in the "then" branch.
>=20
> I've tested confirmed that removing the "contains: const: zilsd" from the
> "if" condition still correctly enforces that zilsd must not appear when
> rv64i is present. The "then" clause with "not: contains" is sufficient.
>=20
> Given that the validation behavior is equivalent, but the logic is cleaner
> and less redundant without the extra "contains", would you recommend
> updating it to the simpler form:
>=20
>     - if:
>         properties:
>           riscv,isa-base:
>             contains:
>               const: rv64i
>       then:
>         properties:
>           riscv,isa-extensions:
>             not:
>               contains:
>                 const: zilsd
>=20
> If so, I'll update it in the next revision.

Yeah, please reduce it to this form.

--przAQh4lUz2Eomq/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKyOBgAKCRB4tDGHoIJi
0tBmAPwITOW6B962WAfPzymCU4z9xZ51B5BtYVuDFIxypRRcogD/bJcgHnZ/rI15
6Mdyko1A6Tb+pZvgrrtqkICniCrQogc=
=3Dwx
-----END PGP SIGNATURE-----

--przAQh4lUz2Eomq/--


--===============0656769901248220721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

--===============0656769901248220721==--

