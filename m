Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8E1CA0FF2
	for <kvm-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 17:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwsV9BA4AF1QaC2S2rGFd1fNpjk9cwylf4EARYdjpyU=; b=Jc05PLx/vOQuc6Qei6WPilq6Qw
	5Tgs1mgiMHAY8UQ67NHbLTgMAkfM+T5WdoPvTsDV9yoXRbvP5kHmf6ItAm1/BLOf1aaSA2OywJBiH
	Sn4N5cc3yWv4xF6FHTq+DLv+2botcKLHMh9R0l+wUmj3MnDeckswpqA2SW/s1Jc8B+SgahomoKB4w
	+tAETVPTdRKr/F0stUyPyMMNklpD2jNp4dulKo2g2Rf2FocsPIG4JQ3qoWtFRlYXy++YOSf9EREUr
	9AAfnfF6WGRaOSCZfar1Ji/a4p5sHl381ejzYhbG31rjlC6Mpq+Clj/pKJQtUMmfVKCmAyTBd87lN
	7O2GRV5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqxeM-0000000CmnM-0j80;
	Tue, 26 Aug 2025 17:40:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqxeJ-0000000Cmma-2K9k;
	Tue, 26 Aug 2025 17:40:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DE25B407DA;
	Tue, 26 Aug 2025 17:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E39C4CEF1;
	Tue, 26 Aug 2025 17:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756229998;
	bh=pzp/1YNnhuAlM0ZR7J+bD9wVkHtRAHZ81g8KyslciX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BVayjwHOdmvCCqW1IgjHYAkllOmujNCCDJN+m9bTiqzrSNKwbUgxbJPjkeCvFBdgz
	 uJd0vvcMUKyL6f1yVQ7AZzQaAOiIKk5dfvT1gbNmDkOItxlhY+AP4Mj0R3g4yf6rhI
	 qp3nRtAFsNjzYYNm+cKh0Ws//QEIPSQTm8kmOyV1VAdGlSZ6XBT9+i0xS0Wk8ziqVO
	 flKAevQ8L6TuYQKe7uo/TPfMb+sVisM7OYJaEASvuLdFFhf3bfzKBhdcUnM21TQQgo
	 vEQ9t1YhCNESddF40c2WfgaRFh11wI17LaNlnb+vqSiC1Ecre6t/AsgQ9aOL3ugzw2
	 THiaBvyaAShSA==
Date: Tue, 26 Aug 2025 18:39:50 +0100
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
Subject: Re: [PATCH v2 1/5] dt-bindings: riscv: add Zilsd and Zclsd extension
 descriptions
Message-ID: <20250826-clothes-vowel-1f0963fc42ff@spud>
References: <20250826162939.1494021-1-pincheng.plct@isrc.iscas.ac.cn>
 <20250826162939.1494021-2-pincheng.plct@isrc.iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20250826162939.1494021-2-pincheng.plct@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_103959_612938_241DE1F0 
X-CRM114-Status: UNSURE (   8.86  )
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
Content-Type: multipart/mixed; boundary="===============3454474740779150885=="
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org


--===============3454474740779150885==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="27ZJqi86mMpq/eWJ"
Content-Disposition: inline


--27ZJqi86mMpq/eWJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 12:29:35AM +0800, Pincheng Wang wrote:
> Add descriptions for the Zilsd (Load/Store pair instructions) and
> Zclsd (Compressed Load/Store pair instructions) ISA extensions
> which were ratified in commit f88abf1 ("Integrating load/store
> pair for RV32 with the main manual") of the riscv-isa-manual.
>=20
> Signed-off-by: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--27ZJqi86mMpq/eWJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaK3xZgAKCRB4tDGHoIJi
0mOhAP9F45h1Fcetvk8xlRYVErmo8gP1m35XC/DSjzThbs9vFgD+IpewfSzYBb4f
A1hymZOEsi3/p/jDLggWKB/ISwmfYQg=
=xIh1
-----END PGP SIGNATURE-----

--27ZJqi86mMpq/eWJ--


--===============3454474740779150885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

--===============3454474740779150885==--

