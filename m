Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12CECD6E6D
	for <kvm-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 16:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yy2GsVDdLL4lY0Kpt60WOYXppEcANuxfgV+psQiJBAI=; b=Ou8d09TBPorR8eFRHBzf9TGKkA
	0luLPV78R2GlyYbElLifeOD54CYWYq2QFoQJG8g739wYwLHvQ5RYmb/UdYVGSrOsWrUSgpQWZQsp7
	5EeF4RIim8kjerT5N3d+qHDeqDCyQvCPA739RBvIk0zkcYiCLKne5H/LoqPTzbgjegeG6xzPd5NjE
	FsXAKH4aa5qMjrNaS8f7FN0dB3pa7vRrVIBk7qCXpivVbAlJ/3hvPuFUakW/m6dKbdYIjHLMHiY8I
	7K9heVpE5GxhC8vI2KykEeZ+ohhTWWReRy1/FELAgPLJEi1mSHCY67yAhIPE7aXNEr/dRl3ZHD3ji
	1Bj4+5RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVAps-0000000H3lm-14sJ;
	Thu, 04 Jun 2026 16:22:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVApr-0000000H3ld-0aAh;
	Thu, 04 Jun 2026 16:22:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B4ED600AE;
	Thu,  4 Jun 2026 16:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914261F00893;
	Thu,  4 Jun 2026 16:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780590141;
	bh=F2TSuSy2fzh9HuIAd56pwrl0AaEkrI23dzAjyDp0t9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ViiY4wnouQ9k6t1sxmqMVFMCul6eUzunF8oKW0rsiW/ZTfAivON+rEvptHkvOW4uD
	 TlktGmGVUAJjYF39NnCL2WFkTS4og2KJPMJS46w1Nn/p3Rmk3ob3AGoWKt33Mflioc
	 TAYaFyB47q7z3p2KtWMb2N8/6Hn0dRH7HxtmBeEIS59BUIyqgMs/vfVgiKCNlCxsWt
	 aBks9x6b8hSHQsdh5d+ducLM5LillQ6kxM0VlrNv3y3VQliF3d1z3Vc+W0Qex2r5G1
	 geh5DRYhVLNpRPu21Gs0PcWAEcIAha7agUbWKXVI88AyRMpgdCsoZkTXCdbrUgfEfQ
	 RQNWbN7VfJ+Kw==
Date: Thu, 4 Jun 2026 17:22:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Guodong Xu <guodong@riscstar.com>, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>,
	Christian Brauner <brauner@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	Guodong Xu <docularxu@outlook.com>
Subject: Re: [PATCH v2 08/10] riscv: cpufeature: Introduce ISA bases bitmap
 and rva23u64 detection
Message-ID: <20260604-decency-salaried-4cb69e1c9fa9@spud>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
 <20260511-rva23u64-hwprobe-v2-v2-8-21c5a544f1dc@riscstar.com>
 <5tjmypgyxbhgxfjub5q6ne475uysse6yl473sxisjoammkdvbu@yebejqbiy6e3>
 <CAH1PCMa-5W9PsX8cDLUk6-MkcM53HOz2QtaxCHd+XOr7DgH5+w@mail.gmail.com>
 <ug2cipududshcbv24ruicqpugzinujnamvdcuy6pubkwh67bfp@2fysrplz3nr4>
MIME-Version: 1.0
In-Reply-To: <ug2cipududshcbv24ruicqpugzinujnamvdcuy6pubkwh67bfp@2fysrplz3nr4>
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
Content-Type: multipart/mixed; boundary="===============5129994988242456759=="
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org


--===============5129994988242456759==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5cyPpCm7a4usSWqT"
Content-Disposition: inline


--5cyPpCm7a4usSWqT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 04, 2026 at 10:29:19AM -0500, Andrew Jones wrote:
> On Sat, May 30, 2026 at 08:42:29AM +0800, Guodong Xu wrote:
> > On Thu, May 28, 2026 at 12:35=E2=80=AFAM Andrew Jones
> > > Sashiko points out a few things about this patch which I think I
> > > agree with
> > >
> > > https://sashiko.dev/#/patchset/20260511-rva23u64-hwprobe-v2-v2-0-21c5=
a544f1dc%40riscstar.com?part=3D8
> >=20
> > Quote the following from Sashiko.dev:
> > > Should this mask specify the individual subset extensions required by=
 the
> > > profile instead of the superset extensions like RISCV_ISA_EXT_B,
> > > RISCV_ISA_EXT_C, and RISCV_ISA_EXT_V?
> >=20
> > My preference is to leave the mask on B/C/V (and A) as-is. I'd prefer to
> > keep matching on the single-letter, rather than expanding them. Here is=
 why:
> >=20
> > - The RVA23 profile lists A, B, C and V as single-letter mandatory
> >   extensions; it doesn't enumerate Zaamo/Zalrsc, Zba/Zbb/Zbs, Zc* or the
> >   Zve*/Zvl* subsets in the mandatory set.
> >=20
> > - In current merged code, hwprobe_isa_ext0() is already using
> >   riscv_isa_extension_available() signle letter checking for C and V.
> >=20
> > PS:
> > B maybe a special one, just in case anybody raise it. As the community
> > discussed when I adding it into the bindings, because B comes later than
> > its sub-components zba/zbb/zbs, so, when I added B, I cleaned up all
> > in-tree dts files which declared zba/zbb/zbs but not B and made them de=
clare
> > both.
> >=20
> > Link: https://lore.kernel.org/linux-riscv/20260115-adding-b-dtsi-v2-0-2=
54dd61cf947@riscstar.com/
> > [1]
> >=20
> > Also, in the bindings: extensions.yaml, a schema rule is added which re=
quires
> > a node listing zba, zbb and zbs to also list b (and the reverse). Movin=
g on,
> > new dtsi/dts fils, a node with only the subsets fails dtbs_check.
> >=20
> > One may argue that the schema check doesn't cover ACPI path. But again,
> > shouldn't the vendor who publishs RVA23 hardware be conformant to the
> > extensions wording in RVA23 v1.0 spec?
> >=20
> > What do you think?
> >
>=20
> I certainly see a case for the kernel staying out of the extension
> dependency validation game. I think it makes sense for an ISA string
> validation tool to exist for vendors to do sanity checks on their
> ISA strings, but that's not the kernel's role. OTOH, whether or not
> the kernel wants to try and detect inconsistencies with the ISA
> string in order to build confidence in using what it sees there
> and publishing what it sees there to usermode, through hwprobe, might
> still be worth debating.

On the dt front, our policy is that it is not the kernel's job to
check that the dt matches the hardware. It is the firmware's job to
accurately report what the hardware is. There's definitely some
exceptions to that already (*cough thead vector cough*) but that's in
part because we failed to come up with concrete descriptions in the
first place.

Yesterday I commented on a patch that was adding this kind of thing:
| The point of validate callbacks is twofold: checking that the kernel
| configuration supports the extension and that extensions that the kernel
| depends on to support the one in question are present.

The latter is because you could depend on an extension that is affected
by the former.
Looking at the list of validate callbacks, I think there are some that
actually don't follow this policy (I saw riscv_ext_zca_depends() that
has no real purpose, but didn't look much further).
I'm not even sure that the validate callback added in this series for
zic64b should be added, it's borderline for me. I'm only really not
objecting to it because it outputs a warning if someone has the
retroactively added extension without the relevant dt/acpi properties
and expects things to work.

> Without CPUID / ID_* registers for Linux to be able to check an
> authoritative source of truth about what is and isn't supported by
> the CPU, riscv Linux has to decide to either blindly trust the
> hardware description or do sanity checks / probes in order to
> confirm what it sees there. Maybe we can assume that any extension
> used by the kernel will trip over itself quickly, alerting vendors
> to fix their ISA strings, but I'm not sure we can make that assumption
> for usermode extensions that Linux doesn't use, but does expose
> through hwprobe. What apps need to run in testing to exercise them?
> How long will those apps need to run before they trip over something?
>=20
> The more I think I about it, the more I think the lack of CPUID / ID_*
> registers puts Linux in a tight spot. If Linux trustingly publishes
> what firmware tells it to to userspace and userspace blows up, Linux
> will have to share some of the blame for having misled it. So, should
> Linux validate everything it publishes somehow? Or, should it at least
> do relatively cheap sanity checks on everything it publishes in order
> to build some confidence?

Part of me wants to know why we should be going to a bunch of effort to
cover up for inaccurate devicetrees etc. Garbage in -> garbage out and let
them keep the pieces.
That said, if we were to do something with checks, we can't actually
even check everything and my opinion is that either we certify that
everything is VerifiedTM or we don't certify at all.

Cheers,
Conor.

--5cyPpCm7a4usSWqT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiGmNwAKCRB4tDGHoIJi
0hptAP4n8/eEpWp31Uijt9FDzlcZE1va/I9dJJ5pHP5ldvSQNgD/aPo4Nice+Y6x
WG57+HLwQioheX4qt2I60jJ46gTx7wE=
=5ZRN
-----END PGP SIGNATURE-----

--5cyPpCm7a4usSWqT--


--===============5129994988242456759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

--===============5129994988242456759==--

