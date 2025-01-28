Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C1DC0218A
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 18:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+cURNqYX+SxiG+HysREWkUxN6nPR9SarVNrCh63gnKI=; b=Wja+1i3kQAW6ldSYJx2OmPA3gn
	IS4CfF4yiqn0HkF5gO1ABtbQHPZPqrLQ3jCYFXfux7CZcOS8FDO/kBCHG49uNPBI81hsJ4qBhtqM+
	bd5C2FJc2LxexUVlkpSsLrSHIQl0DRxpGBKevTqlLX8rEqyCrRdMrOt/QIiGn55LF3uN+Ohofwoia
	/cggVslf4Ma+Nc32j5eqvEHAUBITLkS+4kpvEMKzo6cyJuZwJoqft+ij3GAyBrspjSWAfoEAwbby9
	LlXuL64z1kQ6rlVcHwQMFWJ89sV9rz0yBO9ma6pkKCi+SzZTb2SmbqRs2tTpGLiI03sATUbg/ZZ5U
	O009PLcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcq6h-00000005XZW-2URD;
	Tue, 28 Jan 2025 18:14:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcq5h-00000005XPB-2n2v;
	Tue, 28 Jan 2025 18:13:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0DEEA5C5DEB;
	Tue, 28 Jan 2025 18:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5BCC4CED3;
	Tue, 28 Jan 2025 18:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738088016;
	bh=ZII8PZSI4LeKQp3xZZFOwVUjjXkbI08cdwKGSeAU3ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fkDeNu+H4AejWPaGDdgyWju3XPs4aU/s9RSc7SlhVr/J6tDUE6ZmioABJ+DSYiMNX
	 BjeO0bFLPmdToOwoOw3aZY5CQ3nxHiQxWl4cL45dpkXkefQUfGx+bhJGJsHGZ8kdrd
	 Bkv4imXVAH0fW9cjrYmabvwIdLd+DDQUMznxv7ffVZ8C6VKKgBlkRYKFhKcv8Mu4B7
	 KQfqSYz6ycODwT65fpfPm6QlooCW9e+zS2U78LPvLIDqv8DmG/P6mbdr0z0CtIQ0IP
	 mRBZ8pNDW7+69UKXQpgaY+dZ9+qvxeQgAFPtpFbR7Ez4UXubpRQHGHagw336p6ddg3
	 w3wAg5HDt4GiA==
Date: Tue, 28 Jan 2025 18:13:30 +0000
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
Message-ID: <20250128-crazed-crudeness-f7b1fbc87f1d@spud>
References: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
 <20250127-counter_delegation-v3-8-64894d7e16d5@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20250127-counter_delegation-v3-8-64894d7e16d5@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_101337_745074_66EA515B 
X-CRM114-Status: UNSURE (   9.26  )
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
Content-Type: multipart/mixed; boundary="===============2275744587819675597=="
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org


--===============2275744587819675597==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GvgqpjPPPGH/clyG"
Content-Disposition: inline


--GvgqpjPPPGH/clyG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 08:59:49PM -0800, Atish Patra wrote:
> Add description for the Smcdeleg/Ssccfg extension.
>=20
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--GvgqpjPPPGH/clyG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5keSQAKCRB4tDGHoIJi
0rDgAPwON9XqyKUy23jJH1lSiqhZdCPhX0R4hX2MfIgKmnZOeQEA77rnupIw+zEX
DD6TjYVZE8nXtyNpDTjlWlsM7onJhwM=
=kpCk
-----END PGP SIGNATURE-----

--GvgqpjPPPGH/clyG--


--===============2275744587819675597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

--===============2275744587819675597==--

