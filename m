Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBF9C5AE59
	for <kvm-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 07:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5wvdR5vli2HkTlqv3B2xzaFdunvM2MUTXmaCSDwhK3M=; b=H+dTozIQhV4Q6f
	XfWpMyRDgZwNrrAKFMSdCJDVNn5v/FllYDWfImyhPFhMo2a9CVn4q+/KqCLn2G3xFGvUUlmFk+44N
	o6P2Df6Fl0y1qMxd73Sxm3sLkg0I833CN5oN9jKY8EZ9WmjFfyQm0KZeVPCkFtaeS3NCVX6BFnSLk
	yUmaSO7SwnoGampxK2dyj8B2jwlzakf9kz3Gukny8SPsiXQCqgRNUfka5mqlZGsMWQJQZFL80RIHv
	s7RH6NQRa4J4BfZZhIxg7ylxVoZqHUVG5a/U6mVkRZXb+sJIb3MnZafJZwBaxeKcgLBMymVhh1QFV
	izu2+d3cYZ+AEM0Vf2Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMLwG-0000000A6za-3xz5;
	Tue, 03 Jun 2025 07:20:00 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMLnR-0000000A4YU-3DrQ
	for kvm-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 07:10:55 +0000
Date: Tue, 3 Jun 2025 09:10:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748934638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TGPsKIcTmlOWEH5ktRv3z8GmqOkCSSJSkOu9iMxAxoA=;
	b=lXdXRGwphJKffE/ICKc1VNQZPTZWq0OzxQFtu62KSKMzc/0uf1a195MW4XVY2SZjO3trZa
	sqIPeP4lNad/CHt+HU0iS4QMWsI/uJqrbnYpZqJfkm9672s4FnNnORhRwDztoHZFqw59tq
	RZfow1Wx/etN43rcuYFySx5FkZKhCFY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Ved Shanbhogue <ved@rivosinc.com>
Subject: Re: [PATCH 0/3] riscv: Add double trap testing
Message-ID: <20250603-ae5b10c63b6ac83d206343fa@orel>
References: <20250523075341.1355755-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250523075341.1355755-1-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_001054_448503_D0593831 
X-CRM114-Status: GOOD (  12.21  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org


Hi Clement,

You may want to add format.subjectprefix =3D kvm-unit-tests to your git
config, since it's missing from this series.

On Fri, May 23, 2025 at 09:53:07AM +0200, Cl=E9ment L=E9ger wrote:
> Add a test that triggers double trap and verify that it's behavior
> conforms to the spec. Also use SSE to verify that an SSE event is
> correctly sent upon double trap.
> =

> In order to run this test, one can use the following command using an
> upstream version of OpenSBI:
> =

> $ qemu-system-riscv64 \
> 	-M virt \
> 	-cpu max \
> 	-nographic -serial mon:stdio \
> 	-bios <opensbi>/fw_dynamic.bin \
> 	-kernel riscv/isa-dbltrp.flat

You can also do

$ QEMU=3Dqemu-system-riscv64 FIRMWARE_OVERRIDE=3D<opensbi>/fw_dynamic.bin .=
/riscv-run riscv/isa-dbltrp.flat

Thanks,
drew

> =

> Cl=E9ment L=E9ger (3):
>   lib/riscv: export FWFT functions
>   lib/riscv: clear SDT when entering exception handling
>   riscv: Add ISA double trap extension testing
> =

>  riscv/Makefile      |   1 +
>  lib/riscv/asm/csr.h |   1 +
>  lib/riscv/asm/sbi.h |   5 ++
>  lib/riscv/sbi.c     |  20 +++++
>  riscv/cstart.S      |   9 ++-
>  riscv/isa-dbltrp.c  | 189 ++++++++++++++++++++++++++++++++++++++++++++
>  riscv/sbi-fwft.c    |  49 ++++--------
>  riscv/unittests.cfg |   5 ++
>  8 files changed, 240 insertions(+), 39 deletions(-)
>  create mode 100644 riscv/isa-dbltrp.c
> =

> -- =

> 2.49.0
> =


-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
