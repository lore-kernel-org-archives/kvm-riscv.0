Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0D4CD8CA8
	for <kvm-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 08:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7J78AaNLIB3B6Pe93BsMw4WhT3lG0yFUvW1jXhMzgh8=; b=hZrIaT6xjSHOlMfuvT9/Y6MSpX
	EO7nOKrWfSK5TgsagKybCKpg62vQJJclYz2EAni9hUFT1sBBKqc7/xTfvtT496T+S8NLcT2Ed1sYz
	HP4NIXxsIV7w0LInGn5orTJH6yyrh63Q/P5K9IPO6QzZBY95qkWvOxsO8YGim9ppm3/ePLi9l9W4V
	B2zJr51SSi17lETr9dOqBRlMpMdPi/8tDbMbp+bY7nUD2NrsNt4pcxi7P4jIfO39uhDQh3FoUBJA6
	AesjPRi2CLe7oOCrnGPiTOAtcdRnOPh0U/wQmN2jGxRjqbjVHdEG0+RY3wO64FFYMamp2lJ85sIQX
	U4JaHiRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwrT-0000000AXZl-2loA;
	Fri, 12 Jun 2026 08:03:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwrQ-0000000AXZ6-2JKJ;
	Fri, 12 Jun 2026 08:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1781251408; x=1812787408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P4iVxiPDmbhbJzaqrUHlLYRHYp3weiZW/it8LSxUNyk=;
  b=NICDeVqnmq1oaYpoCXTeM8ElhmYI+kVm7N7uhlAaB2xLkCTaxanA7sXs
   0mG8GNcI9T2dsGFnDFPMx4M3ttRbZeea6gW4hFiyFqEAofmzNuNUUkrQn
   /Y05E/cxUT0zIXIgEOFSu7CDd5U14Ui/FhhesnvMG/IV+l+G+saWKydV4
   KnvgQEL2k5ypWVd+6ovFGl66SwnQRVSzJdkHVieJQuX3zGRdHaLmMbsAA
   nHZEZoSjO7kixLrJOVal4C2sqf6POa1yhRMAhE2xcYqrQbnrEHxHoRBiw
   UngxtHXB6UkCKFE6V/jc4ACSkr+sx+ERepmARW0gr8UK5JKguXR8G0v5v
   Q==;
X-CSE-ConnectionGUID: OS0RNmxnQE6XK0OgLov9Ng==
X-CSE-MsgGUID: l5iiYcgQRueWpaWqOIGeaQ==
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="asc'?scan'208";a="68064594"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:03:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Fri, 12 Jun 2026 01:03:25 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 12 Jun 2026 01:03:20 -0700
Date: Fri, 12 Jun 2026 09:02:34 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Guodong Xu <docular.xu@gmail.com>
CC: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Zong Li
	<zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>, Anup Patel
	<anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Chen Wang
	<unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>,
	<linux-doc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
	<kvm-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>, <devicetree@vger.kernel.org>,
	<spacemit@lists.linux.dev>, <sophgo@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH v4 01/16] dt-bindings: riscv: sort multi-letter Z
 extensions alphanumerically
Message-ID: <20260612-strength-body-303e6a57218d@wendy>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
 <20260611-rva23u64-hwprobe-v2-v4-1-3f01a2449488@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-1-3f01a2449488@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_010328_606087_FE29C216 
X-CRM114-Status: UNSURE (   9.17  )
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
Content-Type: multipart/mixed; boundary="===============1155981924179105541=="
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

--===============1155981924179105541==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/HoYz/XLHMn+tyAX"
Content-Disposition: inline

--/HoYz/XLHMn+tyAX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 04:12:38PM -0400, Guodong Xu wrote:
> The multi-letter extension enum is documented as being sorted
> alphanumerically (see the "multi-letter extensions, sorted
> alphanumerically" comment), but several Z entries have drifted out of
> order.
>=20
> Reorder the affected entries so the multi-letter Z list is sorted
> alphanumerically again.
>=20
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: na

--/HoYz/XLHMn+tyAX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiu9GgAKCRB4tDGHoIJi
0v7zAQDekEYV7GQZKWhpOKggyOP7/VEDaNNIVjsPa4Gj++QaKwD/VvZF9CIz96Nk
FWyOnzPaRHO4UyHIBXkZHWJO29UlYA0=
=WZTL
-----END PGP SIGNATURE-----

--/HoYz/XLHMn+tyAX--


--===============1155981924179105541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

--===============1155981924179105541==--

