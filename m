Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AFCCCD199
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 17:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RMD/lrAo0wl3hh6/ct4UXVKGuekFtNOPshMPapV3d1M=; b=rnaSiKtunG1VSqdWoX+XfsJxgG
	0FoNmD7r5hWgv69K8Q3pBG7thT/lJZP2loqd9Inba6CNjq25FRYzagYeo3rgC+qU9Dt4mjO6tW7SY
	xjqKpXn5KEk9STTRVTDxP74kgO283yogz7OmTbkG0Z6jQek4firsktMgOf2Iw6MhhNpJioJl62rwV
	zM77JKy4Md7qZqeajacvgcYnWduMJz9stD3QZs7LJaUNyaN5PU39LyhQZX/tfW5h3YQiKcdB1TsHf
	kPKhbg1pyHFcLMxW8cwql82+FnzEv9IP3oYKlJmmr4pkXDoodhd2g3OPSCVJdBExeCc8mTvm3SAKP
	rz5GC2gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAta5-0000000ETUr-36qo;
	Mon, 20 Oct 2025 17:22:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAta5-0000000ETUN-07Gy;
	Mon, 20 Oct 2025 17:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=C8eG7PMjUaKTBS6LaCf8Tbd0+/VSPq+6Aua09Qgzo+I=; b=b+Wm6ykGVZ9tE2QnqSx65rUVCA
	ngwomhctyR0qWnZ2zoAckQLPLUz2Rgj6jzFGv6oTYYhhwHVMHOJNT47zR4ts3Bk2HiOAUyq6wG1uu
	QFCQWXXMtO9pK2UAMEBOauyYZwGZsySbxY97simYD8h8sLzOHABf2jCEciUMS+cd2mk8IOVR5A7sm
	4sgmUbL2TeZmaoNAQ3i1ib4f0vai/kDAQbK+0YR0dCGpK9KkclRFz8N3+Tdu9TFDKKNVRqfkLcyB0
	nQeIiisofCWM/VnZWAhGrM62zk2WXWMkkFal8GOImlD/epIfsre8Hm+soQtE3CkqF2fencDIcrkWy
	hR4AUEhg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAsiL-000000002cb-3VX0;
	Mon, 20 Oct 2025 16:26:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ECBA74548C;
	Mon, 20 Oct 2025 17:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63F6AC4CEF9;
	Mon, 20 Oct 2025 17:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760980912;
	bh=C8eG7PMjUaKTBS6LaCf8Tbd0+/VSPq+6Aua09Qgzo+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U2t9lGOfNY6Lkx20w2fVB4DPLQ7RNQAT5k/Gy1bRzoMuCqKvcONn9R5Q8SaF6Mp0u
	 k5ouH3HNB9g4K8O+zH6Hok3sFRVzqmySNOvidRwN0G43JXPWbn08n/8sTz8wOFY0Od
	 cjmgS652cobnqMLIWBdx7bjZ9VFEwQX1vJW79Ew9BTcGy9P35lRWrtRMlCuW+fZx+U
	 /ARWcluXqvCoCLKKW805/Q/cvcm2UAjm6fgf8slnos9VTFSrAZ+Dy17ywAtwrJc4tQ
	 iBD9KrheD9J7RLnfsiuBJzsqz2En0BSGlcfaxC3mFJhPUDuC3z5PYgP5svbn7Fktoa
	 NNayKWfubeVcw==
Date: Mon, 20 Oct 2025 18:21:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, will@kernel.org,
	peterz@infradead.org, boqun.feng@gmail.com, mark.rutland@arm.com,
	anup@brainfault.org, atish.patra@linux.dev, pbonzini@redhat.com,
	shuah@kernel.org, parri.andrea@gmail.com, ajones@ventanamicro.com,
	brs@rivosinc.com, guoren@kernel.org, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
	apw@canonical.com, joe@perches.com, lukas.bulwahn@gmail.com
Subject: Re: [PATCH v4 02/10] dt-bindings: riscv: Add Zalasr ISA extension
 description
Message-ID: <20251020-kelp-trustful-1c07c69cd534@spud>
References: <20251020042056.30283-1-luxu.kernel@bytedance.com>
 <20251020042056.30283-3-luxu.kernel@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20251020042056.30283-3-luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_172630_144884_23CD30E1 
X-CRM114-Status: UNSURE (   5.10  )
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
Content-Type: multipart/mixed; boundary="===============4712929465729355642=="
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org


--===============4712929465729355642==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BFPQpvVg8gUO11Ws"
Content-Disposition: inline


--BFPQpvVg8gUO11Ws
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--BFPQpvVg8gUO11Ws
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPZvqQAKCRB4tDGHoIJi
0hvXAP9MBxNLwQ6EaW26x/57UgbQ5Ohba3hlU7D3bJB9ReuoPwEA89307tQnz5Yg
euZ/obSdJwA33QQLg4HfL//+TgpQAwM=
=orfO
-----END PGP SIGNATURE-----

--BFPQpvVg8gUO11Ws--


--===============4712929465729355642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

--===============4712929465729355642==--

