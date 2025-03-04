Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00694C021B8
	for <kvm-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 09:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OU1wipAu96QjRBQc5MBLbUP+jupp+TeymtAhlSajC3U=; b=wxnPEsq9M16/pU
	og0npPs8HfT8sDGxn6fxu5bFevBOFqmfGQu+MI2Fb7xOc+F9N4I3rroY7Kn4NDLFFtb4X6pXwH9s2
	dWfjfERUM2y9sffqhbu/28e/B1eaMpF7ebrNsBJF88mZvlGBRWY9U2Y3tlNmjP3+3mYhLbP5sKgJJ
	GhkZ7zWSBd2mg3rs48Hs+3uh+pAkWl6kPp4FhKQp4iqCBXcV48Kx3c/WItialoQmZFRxM+Jf9Yj3E
	+4zHh+D41P9fJDW5UQ4MBZErLUMIoFWPGGVhSgYrZk83rJv/jyFwvIInD6I++huYr1RslvN+ppEwz
	4qmF5u3Ft8ejqeJsx7AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOlI-00000003wC1-2tTm;
	Tue, 04 Mar 2025 09:40:28 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOfO-00000003uhQ-2iyC
	for kvm-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 09:34:24 +0000
Date: Tue, 4 Mar 2025 10:34:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741080860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=worB1FoktgRE3NIeCNzUiNXuDPq4XDgN3dL+ixmnZFY=;
	b=BMQVtuGnkazKxprpslLgXTU0amugiiM0JQIx2OfseFn0VR1dQulPOQXNDaEnfcOTAH9/wE
	vmu5SO60UeZfT4FdRQSTgiSCIG43W0u7LAO43aabdXDVGzbGMV+7ktEwD+yDsBej3I8aWg
	3qB8f8gTUlbx6/0v1erhuc7m88AIA20=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v3 0/2] Add support for SBI FWFT extension
 testing
Message-ID: <20250304-5e0b7b5bf691d3ba97621388@orel>
References: <20250128141543.1338677-1-cleger@rivosinc.com>
 <20250129-4e54cccfa2abab6dba9a608b@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250129-4e54cccfa2abab6dba9a608b@orel>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_013422_831840_ED844326 
X-CRM114-Status: GOOD (  17.72  )
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

On Wed, Jan 29, 2025 at 03:18:24PM +0100, Andrew Jones wrote:
> On Tue, Jan 28, 2025 at 03:15:40PM +0100, Cl=E9ment L=E9ger wrote:
> > This series adds a minimal set of tests for the FWFT extension. Reserved
> > range as well as misaligned exception delegation. A commit coming from
> > the SSE tests series is also included in this series to add -deps
> > makefile notation.
> > =

> > ---
> > =

> > V3:
> >  - Rebase on top of andrew/riscv/sbi
> >  - Use sbiret_report_error()
> >  - Add helpers for MISALIGNED_EXC_DELEG fwft set/get
> >  - Add a comment on misaligned trap handling
> > =

> > V2:
> >  - Added fwft_{get/set}_raw() to test invalid > 32 bits ids
> >  - Added test for invalid flags/value > 32 bits
> >  - Added test for lock feature
> >  - Use and enum for FWFT functions
> >  - Replace hardcoded 1 << with BIT()
> >  - Fix fwft_get/set return value
> >  - Split set/get tests for reserved ranges
> >  - Added push/pop to arch -c option
> >  - Remove leftover of manual probing code
> > =

> > Cl=E9ment L=E9ger (2):
> >   riscv: Add "-deps" handling for tests
> >   riscv: Add tests for SBI FWFT extension
> > =

> >  riscv/Makefile      |   8 +-
> >  lib/riscv/asm/sbi.h |  34 ++++++++
> >  riscv/sbi-fwft.c    | 190 ++++++++++++++++++++++++++++++++++++++++++++
> >  riscv/sbi.c         |   3 +
> >  4 files changed, 232 insertions(+), 3 deletions(-)
> >  create mode 100644 riscv/sbi-fwft.c
> > =

> > -- =

> > 2.47.1
> >
> =

> Applied to riscv/sbi
> =

> https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv/sbi
>

Merged.

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
