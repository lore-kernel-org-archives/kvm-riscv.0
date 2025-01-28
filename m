Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2798C02190
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 18:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TD7EuQ+38h+720Be/7G8sOSkj/mEJwcjiangbeFD11E=; b=IIRaTv4cpdmRrvE8sAeNPO+zUn
	5VvFtGGaq+L4YRtQdkjmHyI6CEYx0XjzuMhB+z15e4sxW8f8+3SQ/SV44XgR8wtBEKUJQrEnRip1J
	aybMrLQlcJ5N0PQwoYmhxt+74Ob1QeOE0BErJpg7f+bAwiKoRN5/7rQN4IRPRqmbMBBadpNS4gFuU
	gv0zuGpVCGeBNkN8Jz8kf4l60aRSG6NZVBvhSbgKgiW5lVp5bhXfwlpKSNkb7XJrH7KnuHaAAGygY
	eaN2eMhCPCneUf/P+FSeAkdglSLpfbuSd9rLkZAhM5Ag/MZIRBix1qRIfwVwG9nM0ubdpW84ADnGI
	XYf9XhrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcq83-00000005Xzz-2Yhp;
	Tue, 28 Jan 2025 18:16:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcq7X-00000005XrI-3G36;
	Tue, 28 Jan 2025 18:15:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2EBEBA40FAD;
	Tue, 28 Jan 2025 18:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1923CC4CED3;
	Tue, 28 Jan 2025 18:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738088130;
	bh=6075frjmGf2CUp9HJ5/vQDRATQCGJ5BP/XrPZq5Nprg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZHBk+2KBtaE1HOUtjCqrKseXmeqGHBEUiU1op0fxaYBtVY2NXJ5z/1iewzUG0d7MI
	 Fir+fc7UdqpYikHjmDTwnbmVvtZlf4Ey/93imq2a1I3mct7h7Nzrotkr1Yuj6EVz+o
	 CqdQZ8mDeXV/XYRI3z7ZVC+EdscMSxmZq73iVQ0GPZgOXS1ImdlXtp4LzVB/MMF84w
	 tFZPMdBoM4NW9cK9mpbHR4Bi3QOb7v4sFDlDjxkMWsKEzZQto798CEhGs5enRMlRWe
	 98x2v/SuhQlUY0AfZxEMWWZ0z1lMzF6kUgp8zeHCEqrn3ZolLzwun1WrCAmiPehQ9j
	 CrcGJOPVn8rcQ==
Date: Tue, 28 Jan 2025 18:15:24 +0000
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
Subject: Re: [PATCH v3 08/21] dt-bindings: riscv: add Counter delegation ISA
 extensions description
Message-ID: <20250128-murky-shack-0ba8e6e65db6@spud>
References: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
 <20250127-counter_delegation-v3-8-64894d7e16d5@rivosinc.com>
 <20250128-crazed-crudeness-f7b1fbc87f1d@spud>
MIME-Version: 1.0
In-Reply-To: <20250128-crazed-crudeness-f7b1fbc87f1d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_101531_878192_0A44A19E 
X-CRM114-Status: GOOD (  12.33  )
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
Content-Type: multipart/mixed; boundary="===============2663704667801885700=="
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org


--===============2663704667801885700==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/eM+/vjEehefq9Br"
Content-Disposition: inline


--/eM+/vjEehefq9Br
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 06:13:30PM +0000, Conor Dooley wrote:
> On Mon, Jan 27, 2025 at 08:59:49PM -0800, Atish Patra wrote:
> > Add description for the Smcdeleg/Ssccfg extension.
> >=20
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Actually no, I take this back. Don't describe dependencies in text,
there's examples at the end of the file for how to set up dependencies
between extensions in schema. If you get stuck, lmk and I'll help.

--/eM+/vjEehefq9Br
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5keuwAKCRB4tDGHoIJi
0tECAP4paJ3J93SR4l7JboJVyX3iK+3HsvDkfh03Tg6KWjjrzgD/daARcIoPZWNF
iNl1rW5lnWyTZ4vN+TrR+hLHXd6XmwU=
=h1bm
-----END PGP SIGNATURE-----

--/eM+/vjEehefq9Br--


--===============2663704667801885700==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

--===============2663704667801885700==--

