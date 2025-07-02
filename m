Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43A7C83F07
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 16:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HXnHLGNLPdDlLIcT/ORVktK/181Qx1cwrHbiEcP7p60=; b=DrHq40OvxW646O
	yl1or1lI0B83P/LG2qTEjL4EHznnaAJOI6gjaqgsuEWGOH1WQ4LIm9+/nH/+jwctmRiZCLm+qNRcU
	7VRhrcqT8nd6mU2MtTqzIjOo2yRA0RbRwGJFrGtMPYvSnaDcpEJmeC3pOO/42r2zsgHlCoA/IZN0+
	N8loXGIYqNtcH7k3leXWHXAz+v2QguMbImKhe2uwIQL0FNUPtZBqNWAkpKhrbIoMo2kGWsJBcuxmZ
	nRPzogW1i7qsfRHs7Yuw5Se6U2jbTREDzTHkGvi7/MJYkRXQaEXoG6MLMApM+25YEfSFpB8nqemsD
	OUs/GhwwYP4z1YPXMJ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0fz-000000091gk-2cyu;
	Wed, 02 Jul 2025 16:51:15 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyl2-00000008fko-0ljO
	for kvm-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 14:48:21 +0000
Date: Wed, 2 Jul 2025 16:48:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751467698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nbthkilk4rhYuupR8Kp07gxh/gsc1k1JOjY3FMC3GPc=;
	b=rf4N3HWQkxxe5DJLjjnRwD9Zxx4HaeHVSxbcNwfxa6d6na1f8a172ZYP/+p3DTec4MBFh+
	iUopalXvAoLNLQW7JXJkHOeS+SV0fCXldF6b6LRNoTTlSp/4i2jjgd66OrT002ZbdXn/8O
	XUEXxDzB6nFdjie7st6ZvbihlGyKn8A=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [kvm-unit-tests v3 0/2] riscv: Add double trap testing
Message-ID: <20250702-f69602380b206713b2711f79@orel>
References: <20250616115900.957266-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250616115900.957266-1-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_074820_367758_3472D003 
X-CRM114-Status: GOOD (  14.53  )
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

On Mon, Jun 16, 2025 at 01:58:58PM +0200, Cl=E9ment L=E9ger wrote:
> Add a test that triggers double trap and verify that it's behavior
> conforms to the spec. Also use SSE to verify that an SSE event is
> correctly sent upon double trap.
> =

> In order to run this test, one can use the following command using an
> upstream version of OpenSBI:
> =

> $ QEMU=3Dqemu-system-riscv64 \
>   FIRMWARE_OVERRIDE=3D<opensbi>/fw_dynamic.bin \
>   ./riscv-run riscv/isa-dbltrp.flat
> =

> ---
> =

> v3:
>  - Return an error only if SSE event wasn't unregistered successfully
> =

> v2:
>  - Use WRITE_ONCE/READ_ONCE for shared variables
>  - Remove locking flag for last test
>  - Fix a few typos
>  - Skip crash test if env var DOUBLE_TRAP_TEST_CRASH isn't set
>  - Skip crash test if SSE event unregistering failed
>  - Remove SDT clearing patch
>  - Fix wrong check using ret.value nstead of ret.error
> =

> Cl=E9ment L=E9ger (2):
>   lib/riscv: export FWFT functions
>   riscv: Add ISA double trap extension testing
> =

>  riscv/Makefile            |   1 +
>  lib/riscv/asm/csr.h       |   1 +
>  lib/riscv/asm/processor.h |  10 ++
>  lib/riscv/asm/sbi.h       |   5 +
>  lib/riscv/sbi.c           |  20 ++++
>  riscv/isa-dbltrp.c        | 210 ++++++++++++++++++++++++++++++++++++++
>  riscv/sbi-fwft.c          |  49 +++------
>  riscv/unittests.cfg       |   4 +
>  8 files changed, 265 insertions(+), 35 deletions(-)
>  create mode 100644 riscv/isa-dbltrp.c
> =

> -- =

> 2.49.0
>

Merged. Thanks

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
