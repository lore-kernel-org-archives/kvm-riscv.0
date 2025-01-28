Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D939EC0218A
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 18:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rnys4nnL5IhaC6/63GWA5QWPYY4cmHf/5xvQ/honpiQ=; b=3GjI73MI0yK6KRrZGAGIaZG3Wo
	/HWHuIBVXGxYpIX7U6u2tLgJ+Zy2CM+FyAPAN0u1M/KVoms2WcbVBFGBsW/IDoUALuTjh4Cb7FSQ6
	iI9hG4EzojBptHSaJaQLov8GqtBUwp4MoHXIpy+nPd2Xr7WidTqnVlHkAOYD9R4KtJmiyKuzKwweK
	ioZrF4xT9bQdqaeJwizQreVT8ZoSJY0fQAUIugvzAtamGpdH5XoABbamKDcIUBs8PamGLz7JAjVw7
	6ebsOavSUpPORUReU5zUgB6TkCh4xJyQYMPKW9znbu19pmdSA5GupswYNQzK0pilnfjBqphZgoXwZ
	EVdk5rHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcq3J-00000005Wsd-1zX9;
	Tue, 28 Jan 2025 18:11:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcq3G-00000005Wru-3OaF;
	Tue, 28 Jan 2025 18:11:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 364DB5C6072;
	Tue, 28 Jan 2025 18:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60226C4CED3;
	Tue, 28 Jan 2025 18:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738087866;
	bh=yEBiZ8mqq0tTSbFKxUO9y4M2n4j6xBmDLpLWSPRhhkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QEkA549Y5fkmYtnn7ptzhhyFhsQrseZR3e/LbzWl+7KNhkr77n+RWVreexc0LP00S
	 N7PFwTy5Lgp21ry6QiAzNh3UHRQTt4MgmSqBa2sLqm4a8OprvNrWH5QNYr9YGt0Mm6
	 ANZwLw/g7uwUPRW8H4kv+QlHNT339mehFFl5LgCfC1KO0gRDDGglWFjGTBjw7vY1s0
	 sNOZZFnYQ3rcuD4OcsXeQKiMUHl6SCZGV0NQ3kX8xlHdbbjnQaZWpnv0e27htyOCst
	 Jm9t3qkiVN0k1HOaSSM7YxAJ5TNFv1kocCO8/fa06nBzw5VBCN5jp9pvzeKoQB9VHY
	 UJTLRb1luEWCw==
Date: Tue, 28 Jan 2025 18:10:59 +0000
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
Subject: Re: [PATCH v3 09/21] RISC-V: Add Smcntrpmf extension parsing
Message-ID: <20250128-jubilance-mosaic-e3a81199aec8@spud>
References: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
 <20250127-counter_delegation-v3-9-64894d7e16d5@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20250127-counter_delegation-v3-9-64894d7e16d5@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_101106_936782_2B2DC641 
X-CRM114-Status: GOOD (  17.15  )
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
Content-Type: multipart/mixed; boundary="===============2124258560214266783=="
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org


--===============2124258560214266783==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AeQjYjsxiXla5jGt"
Content-Disposition: inline


--AeQjYjsxiXla5jGt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 08:59:50PM -0800, Atish Patra wrote:
> Smcntrpmf extension allows M-mode to enable privilege mode filtering
> for cycle/instret counters. However, the cyclecfg/instretcfg CSRs are
> only available only in Ssccfg only Smcntrpmf is present.
>=20
> That's why, kernel needs to detect presence of Smcntrpmf extension and
> enable privilege mode filtering for cycle/instret counters.
>=20
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 1 +
>  arch/riscv/kernel/cpufeature.c | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index 2f5ef1dee7ac..42b34e2f80e8 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -104,6 +104,7 @@
>  #define RISCV_ISA_EXT_SMCSRIND		95
>  #define RISCV_ISA_EXT_SSCCFG            96
>  #define RISCV_ISA_EXT_SMCDELEG          97
> +#define RISCV_ISA_EXT_SMCNTRPMF         98
> =20
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> =20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index b584aa2d5bc3..ec068c9130e5 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -394,6 +394,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
>  	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg=
_exts),
>  	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
> +	__RISCV_ISA_EXT_DATA(smcntrpmf, RISCV_ISA_EXT_SMCNTRPMF),
>  	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),

Isn't the order here wrong?
 * 3. Standard supervisor-level extensions (starting with 'S') must be list=
ed
 *    after standard unprivileged extensions.  If multiple supervisor-level
 *    extensions are listed, they must be ordered alphabetically.

--AeQjYjsxiXla5jGt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5kdswAKCRB4tDGHoIJi
0qZFAQCpe0QJ5o16AKk5zmb7bqYpmvMDoPRwL4regdLry1RudAD/UU5umiu7pC6H
GV2ayeNoIup+xEZqYsS9ZNY8zLhrTgs=
=5FZk
-----END PGP SIGNATURE-----

--AeQjYjsxiXla5jGt--


--===============2124258560214266783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

--===============2124258560214266783==--

