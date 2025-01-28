Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49316C0218A
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 18:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0etWsR9M5Cv4xvr8ufaAXzx98LoLC3eqQANMknJ26Ao=; b=WBjii6EJbUdFhudZAgRz4+CXQQ
	9HvJfmhdQtV+Wtn4lQSXkO/6RrQ/YmNTRDt/mquSQcGs0Q5FIDv3Lf8F81DWQn7slJhvzhQ4TRDma
	CQnh4Dm6gAe4nbP9RkRTua5s6Sw9fWzqxkVBhIB/jZYAcKbmoVoSCbCp1X9OY2iY/J5HyYFjW+hoX
	J0UULSbe4bM3FflZ15iG5Ti8fhLXJx5StCUTv/+0m53aNds6hrjDZz3xXodsa6Rg4Ma2LkH8W37nl
	B+RjHGuGFuZsdEngPh8jbVoNuX1X7bcGWuK93HkHmiIiK/CRmbmSnXhpsGQS3/2mFYvJH55ytoZ6U
	uH5uLg+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcq5N-00000005XIh-0FPZ;
	Tue, 28 Jan 2025 18:13:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcq5L-00000005XHm-0Vzv;
	Tue, 28 Jan 2025 18:13:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB3495C5F4B;
	Tue, 28 Jan 2025 18:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12AEAC4CED3;
	Tue, 28 Jan 2025 18:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738087993;
	bh=+I9h/svnrKeZUj46Q/YA9sqg4nwDYw/Jz+DfrJhXcb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ia48mg0xrcDLeEXqdYVrCbqfVLpeuDkh3p5Z04Q8i6zAq/cRyi58IhHklxmjYbiVs
	 DnimRVPCxDp6Sz4+ORf5IthMQdNuuE4obeBeq0xW1lEilv1I5wR0GGmIa8mKSRCCmg
	 AqL8sjypOG5TU2cSuta2ksVzly3v+NKagWgPaM/M0Os0dr4fwfK4+Y6Ft5j+H8PP4s
	 f0fb9rRL4DhE4GjqL/6sZnX4mnuCOnf3w1VXGtliGsKxweGHZidnOK+WGcH0wwA0O6
	 BdVT3uYL0dPpWKgY3y6nlk0k/4+4cHvxo1C3Ub+V5RCZyE0kBToXgbYvM4UmhriQNe
	 0DCO2yqa0Jjkw==
Date: Tue, 28 Jan 2025 18:13:06 +0000
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
Subject: Re: [PATCH v3 04/21] dt-bindings: riscv: add Sxcsrind ISA extension
 description
Message-ID: <20250128-generous-subtract-32158b4ee05b@spud>
References: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
 <20250127-counter_delegation-v3-4-64894d7e16d5@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20250127-counter_delegation-v3-4-64894d7e16d5@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_101315_200383_A991EB45 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============8168960098281066577=="
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org


--===============8168960098281066577==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SYADI19HB8MN2NaU"
Content-Disposition: inline


--SYADI19HB8MN2NaU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 08:59:45PM -0800, Atish Patra wrote:
> Add the S[m|s]csrind ISA extension description.
>=20
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--SYADI19HB8MN2NaU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5keMgAKCRB4tDGHoIJi
0msdAQCuEvxDWJyKiJkoX8Q0COXGLdc8ZqrcoXFMy3qWLF8SdwD/YsLhWxVSNpiN
Ki4R6w9cUWtC4Px4K6vM3YQcTtwKzgQ=
=molm
-----END PGP SIGNATURE-----

--SYADI19HB8MN2NaU--


--===============8168960098281066577==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

--===============8168960098281066577==--

