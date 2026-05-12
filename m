Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F48ACD4851
	for <kvm-riscv@archiver.kernel.org>; Tue, 12 May 2026 10:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KyTOqEVHClk3pFdI3M2oMwfKGxFdLees5D39VgLMRuU=; b=HIw2I0Iqh/aOcbTKi/EMo3bYcV
	OPoWThqJfiYJ9OGP8VZ3v/Wi7Wzt8Uco/jF4CDN4WN65G4Xn9laU+Aq88amKccurnrUI7rqvYGVCE
	xJhKbLK11i2wEUnlcgtiS8usHg/4O1E76P4W0a2UQV/XSHGaYP4A4XBRpKb4/LCId0KV2+6AsYGvH
	wHR9fmQ1Yhhkn83jWLZmGU47wHVVWy3jcpYbuhjI0MHWiU1nFzCi1Rwji2aLAUBS/HvEwHpAGyPEt
	Te4tIrhRXjZx3NYBjj4fiZClyAm1AF+C1C4hxiG2KfzSxZp9E/P3EbBCgzSLvtU/tG6pSma+/7s1g
	YzJCQPig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMkWy-0000000GSa4-2mfK;
	Tue, 12 May 2026 10:40:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMkWx-0000000GSZp-2243
	for kvm-riscv@lists.infradead.org;
	Tue, 12 May 2026 10:40:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A9FFD60103;
	Tue, 12 May 2026 10:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83F0FC2BCB0;
	Tue, 12 May 2026 10:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778582402;
	bh=kYqFLz3U39PZBxZjhz2PLB9qtZR7RBd7ohHmGtjENMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mrfVnXuQVDZj3BYyQk0wOYHU/YCeUmAQ5GA2TYHN+C08ICqyZBTVBl6KkpyVuSITz
	 jABGh0yXC4nOZ/ZTutUEUpSEP2vXwGJ77MLCYBvXAOCbSMjfNt08oY8yc2r0hzU2ma
	 IcUTcyt94g7BeMaD3e60Ynuy+3uXtsOL1DCvCG0B5MyvMlYSzalHp7HAoJPQu/mMjV
	 b2MzEcVbFv1CQo7RD7J2KlPYbnCGFRd6/V3oGYtDPOD0aIE8efLPTSBEkhrwfpUhMw
	 TRiIrpibMJrOtOcrEUJslf1qKDXZAoatetvr0hxdLSZ79dOoj7vwNbMQj9UlieE1C0
	 HgS0CifgWFAWA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 71B061AC58C2; Tue, 12 May 2026 11:39:56 +0100 (BST)
Date: Tue, 12 May 2026 19:39:56 +0900
From: Mark Brown <broonie@kernel.org>
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Shuah Khan <shuah@kernel.org>, Jiakai Xu <jiakaiPeanut@gmail.com>,
	kvm-riscv@lists.infradead.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] KVM: arm64: Add memslot for ST_GPA_BASE in
 check_steal_time_uapi()
Message-ID: <agMDfLbkYrqzsTXs@sirena.co.uk>
References: <20260501021639.2563219-1-xujiakai2025@iscas.ac.cn>
 <agKJnKOcvbPZ5cgA@sirena.co.uk>
 <fb12c011-27d5-09e2-14fb-ec1728bb6c81@huawei.com>
MIME-Version: 1.0
In-Reply-To: <fb12c011-27d5-09e2-14fb-ec1728bb6c81@huawei.com>
X-Cookie: Truckers welcome.
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
Content-Type: multipart/mixed; boundary="===============4690400497757383091=="
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org


--===============4690400497757383091==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lFONeCo13eLNI0mm"
Content-Disposition: inline


--lFONeCo13eLNI0mm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 12, 2026 at 10:49:23AM +0800, Zenghui Yu wrote:
> On 2026/5/12 9:59, Mark Brown wrote:

> > The regression in Linus' tree that is fixed by this patch is still
> > present today.  Adding Marc and Oliver since this bug manifests on
> > arm64, adding Anup and Atish since the patch introducing the regression
> > was merged via RISC-V.

> Does fc240715fc50 [1] fix the selftest regression? It has been included
> in the latest KVM/arm64 pull request [2].

Ah, yes - that looks like it should also do the trick.  Thanks for
making me aware of it!

--lFONeCo13eLNI0mm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoDA3sACgkQJNaLcl1U
h9CelAf/exz3ZWCcR/ICMXaL4rse7YblzjpNivBD7PRs5bmSp0BCBB2vga/84WFd
bb0PNM5ScIfQwD4jY9vqgJZdNt/ubQKaYDe7S+wIRkAuZbvb0bEEeMkLEOx7/waE
uiXmcT3jQmzK+1i1K4k/C+aBqGChJH0JAnhvTAw+L/BZybWqQHYaDaM8WU2Fj8D/
CBxbUvJyAxVQj3W80xh+xiwMUxSUjBNGHXAHhH5lWIu8z1POU2Ab+Cfv7Vxml2Gn
WH2PlBTtQENZ7xnHt3Ke3aIN39VQPF6/OfXaTl5faDn5wLyGsmI0g9W2C6ZDEP4n
jQ+L/brPIEtn577EaLq2+2i7Th4INQ==
=OEj5
-----END PGP SIGNATURE-----

--lFONeCo13eLNI0mm--


--===============4690400497757383091==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

--===============4690400497757383091==--

