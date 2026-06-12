Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76765CD4F2C
	for <kvm-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 08:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PCKwz1rdvLJAaoOBxAoMqkNfAc2Yd9ZegO8RVx4NmHs=; b=WPa+trHS/JgQ20EpofrH/W5osb
	OsJjra26tx7VYSHRkZsQKTeLTuoFo91l9nJ5N25x7YO7grLSaZ3jFN3Z9i0eVYxaf7HDp2IHf+Pby
	1eAVy4iphHy7MAslEIIFelZhkLraPinFAlR4ZjdX5yNRBFa/rDvfd6UuVDeJqU0Wnt2c7xQlo+r8g
	G/wuYPkyAJvznnJpr2oR6EIhT7p4sYLr1IDH8oX5JR63E/XTCJQmt35pWgPiNlKz5zC/fkxiNPI8v
	JW+ObZU/fNWLAM5iNoDoxLkOfsL1b3xFNc8yFiM1uzodlI/+y7cobK8QtVU1rWIq8eLXdOOhfWgpN
	0mKI6Qqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXx13-0000000AYrg-0K4a;
	Fri, 12 Jun 2026 08:13:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXx11-0000000AYrD-0wjf;
	Fri, 12 Jun 2026 08:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1781252003; x=1812788003;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EtJZAYs6E/WZgQq7Sg+kISDy17uxy7ak03wdp/fu4Ik=;
  b=flrv6BBroa09S8MtaPcglDtTAvyNg+Hc3j2E7nPWZRDdfoZYeu+yLQtX
   Ql+u/bT/54fK4G1yJyIEfXG2mUxhxtZtf/ni5/kN0oGBOtEvM+RAWe763
   tKLBKDg7/Z7c+p1kMXKgcMFeUemyjvQZh4UJGVQwwzO4S1+oPyRSBDgs+
   dPqTQjB7xkQqYaWUEcMrvvJMDFldG9XZruprr2qmg1N1FbcGX+Y583UJA
   e2iNXrLNEGevZBYpW5gpgULPMXZg06kYKFY8+t26mrF4qsM/ZnHE7v5h1
   r4dHtBRaB1uN2l42JBi8PA7ZX5amyKhwPdJj+21NSneumJQkm++yPBlEp
   Q==;
X-CSE-ConnectionGUID: pgiZR6tuTNqjfYasAurGdA==
X-CSE-MsgGUID: DLJWxWdJR4OYwN1yOiQ8Ow==
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="asc'?scan'208";a="290396387"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:13:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Fri, 12 Jun 2026 01:13:21 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 12 Jun 2026 01:13:16 -0700
Date: Fri, 12 Jun 2026 09:12:30 +0100
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
	<linux-kselftest@vger.kernel.org>, Palmer Dabbelt <palmer@sifive.com>, Andrew
 Jones <andrew.jones@oss.qualcomm.com>
Subject: Re: [PATCH v4 07/16] riscv: Add B to hwcap and hwprobe
Message-ID: <20260612-unsorted-sequester-6a4ec6b9d583@wendy>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
 <20260611-rva23u64-hwprobe-v2-v4-7-3f01a2449488@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-7-3f01a2449488@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_011323_269956_86012BFE 
X-CRM114-Status: UNSURE (   9.69  )
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
Content-Type: multipart/mixed; boundary="===============0567920115367048740=="
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

--===============0567920115367048740==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PQqI/ma7D3SyX7fS"
Content-Disposition: inline

--PQqI/ma7D3SyX7fS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 04:12:44PM -0400, Guodong Xu wrote:
> From: Andrew Jones <andrew.jones@oss.qualcomm.com>
>=20
> Add B to hwcap and ensure when B is present that Zba, Zbb, and Zbs
> are all set. Also expose B via hwprobe (RISCV_HWPROBE_EXT_B in
> RISCV_HWPROBE_KEY_IMA_EXT_1) so that userspace can probe B directly,
> mirroring the F/D/C/V pattern where each is reported via both hwcap
> and hwprobe.
>=20
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> [Add B to hwprobe]
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--PQqI/ma7D3SyX7fS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiu/bgAKCRB4tDGHoIJi
0qW0AP4zDRXj0LcaBFyBnGq6O7UoIBzoElEBlRQMmlD1lzUdDAD/WDVIu88sPWvA
kcQWsFvqgBTiL+CUQBbWI3amTlmHgQI=
=nHj3
-----END PGP SIGNATURE-----

--PQqI/ma7D3SyX7fS--


--===============0567920115367048740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

--===============0567920115367048740==--

