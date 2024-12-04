Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCF9E7716B
	for <kvm-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 10:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ose/KVT0IzQL17JrVtTzMqdFZqPS+wBPwMrN3H3RYok=; b=u2R6BZRUevqX5lNt3XhEV+nmrx
	6n4gGvYoJjwAPT73h9oT9nkb4N7AfBgITu+GhJEGTR0e7yn3mNnR9thKHWna1yYbgMIVOXL5t8mB4
	4Bjb0MJwi/rZfzoR4XoLY4Hv86xa9AdtA9C2cvSQXWj5jwPC/Z56vUOPpP1B1nfqdt8VrbK55oUBU
	FG0sjFpKZvBuLVglOuUNChMVIh0A0qYjan/0i85VmS/QtTEBBkruIDPoxLYVAMiyEnsflOL+DVeqp
	5uhabnJEPRfshNwI8xi7pYNcMjZGUfW+mvN2EujMZ87C+u/vO1gU3O2/0Bq2o7FO4hOR18Qw3h6LW
	GEfSLGqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImtB-0000000CG0w-2KBc;
	Wed, 04 Dec 2024 10:45:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tImf8-0000000CCwS-1V9p;
	Wed, 04 Dec 2024 10:31:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733308278; x=1764844278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r0YdPCfkW3WmeY7CSxvYSy9ijT0JApNn+evb9OV6AyY=;
  b=YbXZroQg0KGuraEXMV0zEkl+DGicdPTCJeAoggwG4oMK2eBdmYR1B+//
   mP5Negjmh32+otw2earBxEm9x1BGq4iTfpueInbH761DK1YjZdt1S/lMp
   MLUPxDAR/cG3uZagVyeEk5N+c+VRzkvEGzbAGqtrTmBRnWp+MRMyiOex2
   xlPC9gFZMvs2qEK1Burs7NuIr3BVyy8LxO53aIz2fMLm4nEHIzwZGd6Rj
   M0rT/dXUvA9u1Rx4owCoSF2vBcD94IxX8WFI6Rkuw0tiI6PT2AU7VHiXv
   +a/YH97ZsnhIkE2WSabNdSquIxv60WTX23qzaXA3tnne7AUwwIwHaY7UM
   w==;
X-CSE-ConnectionGUID: CZPZjHfUTDSgQz0WJMX9AQ==
X-CSE-MsgGUID: C7yECW8eSqCGXf/l/TDPkQ==
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="asc'?scan'208";a="38772663"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Dec 2024 03:31:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 4 Dec 2024 03:31:14 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Wed, 4 Dec 2024 03:31:12 -0700
Date: Wed, 4 Dec 2024 10:30:44 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Damien Le Moal
	<dlemoal@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra
	<atishp@atishpatra.org>, <linux-riscv@lists.infradead.org>,
	<kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: Remove duplicate CLINT_TIMER selections
Message-ID: <20241204-aliens-cover-66b60e058ca4@wendy>
References: <448dba3309fe341f4095b227b75ae5fc6b05f51a.1733242214.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <448dba3309fe341f4095b227b75ae5fc6b05f51a.1733242214.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_023118_483514_8EE10ACB 
X-CRM114-Status: GOOD (  13.59  )
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
Content-Type: multipart/mixed; boundary="===============3353904174064371914=="
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

--===============3353904174064371914==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g2aKOaNiiQhFm06t"
Content-Disposition: inline

--g2aKOaNiiQhFm06t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2024 at 05:15:53PM +0100, Geert Uytterhoeven wrote:
> Since commit f862bbf4cdca696e ("riscv: Allow NOMMU kernels to run in
> S-mode") in v6.10, CLINT_TIMER is selected by the main RISCV symbol when
> RISCV_M_MODE is enabled.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
and in case Palmer isn't sure if he should apply it or not:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  arch/riscv/Kconfig.socs | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index f51bb24bc84c6e47..d4ea91cdb2b138b2 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -53,7 +53,6 @@ config ARCH_THEAD
> =20
>  config ARCH_VIRT
>  	bool "QEMU Virt Machine"
> -	select CLINT_TIMER if RISCV_M_MODE
>  	select POWER_RESET
>  	select POWER_RESET_SYSCON
>  	select POWER_RESET_SYSCON_POWEROFF
> @@ -73,7 +72,6 @@ config ARCH_CANAAN
>  config SOC_CANAAN_K210
>  	bool "Canaan Kendryte K210 SoC"
>  	depends on !MMU && ARCH_CANAAN
> -	select CLINT_TIMER if RISCV_M_MODE
>  	select ARCH_HAS_RESET_CONTROLLER
>  	select PINCTRL
>  	select COMMON_CLK
> --=20
> 2.34.1
>=20

--g2aKOaNiiQhFm06t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ1AvNAAKCRB4tDGHoIJi
0vHtAQC82qG49EDSoaB2PeTLrfhjmint5mOs27szHVRiwtSjhgD8CTPFKDSZQ/N0
ltKkzalZOnfOWfs44+mL9vkAJURnBwQ=
=yxzy
-----END PGP SIGNATURE-----

--g2aKOaNiiQhFm06t--


--===============3353904174064371914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

--===============3353904174064371914==--

