Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C03C02180
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 14:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4UGwmvLBKqEIysR3UUwo2Nhg+tPGsQa629yDwZonJg=; b=dc+g08klLbdZIh
	vfaSNyzRZD0Et4rg53v4c42YXKy9aL4cPdTeHlKtwFGJwnb2Jr80nbXDdNcme4FySw88ihmcyZIXU
	64z41TVcP596oKr9QKaU8lU7lGnFwqLOjjU6Cjb0khnPEC1nTP0vNdXDxNyBrK7OFGtavwypq7xGy
	2HvfvhRcppkPpC62JhJ57bJ712w+viTpX2lLQyuL4mMVzxyp/lznbSHq51zvIznfs1NoBzojZNESj
	ScZBj0ArPmgDavqk4kwVn9isLPHyZ/aa02M45MiLTa8AaH94a1GNZHKuCD+VQLVVl0u8t6jHVWch2
	EPGI37KSyLMS8j96MRFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLA0-00000005MTF-3kpW;
	Mon, 13 Jan 2025 14:11:20 +0000
Received: from out-185.mta1.migadu.com ([2001:41d0:203:375::b9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXL9y-00000005MSM-1Kwj
	for kvm-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 14:11:19 +0000
Date: Mon, 13 Jan 2025 15:11:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736777472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xTLLPDUXcmmZr7F3eNzvr+Ad2FEwFLBnrfQo7nonAUE=;
	b=PiM9USzvh9mC68PAZviyKKe4gSZqQ5ldBPsENPfcBUHYDhLGVS37YKMJdiS5Db59FFvUP0
	QtCDdr/Ago0zG/tvOfEQa20hfDzQ/VzcKd3eVvU7nb9ZS1dYyR1NLj3ZjBGDf3TyBeFC0P
	dTMmHRKGzMdVThC0lD2E3WZA+wJLW0s=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v6 0/5] riscv: add SBI SSE extension tests
Message-ID: <20250113-a733eb4cb209b57475bf5df2@orel>
References: <20250110111247.2963146-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250110111247.2963146-1-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_061118_650050_9D2E4D08 
X-CRM114-Status: GOOD (  16.47  )
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

I have comments on patch 5 of the v4 series drafted. I'll finish reviewing
that patch and send them. Hopefully they'll still mostly apply to v6 as
well.

Thanks,
drew

On Fri, Jan 10, 2025 at 12:12:39PM +0100, Cl=E9ment L=E9ger wrote:
> This series adds an individual test for SBI SSE extension as well as
> needed infrastructure for SSE support. It also adds test specific
> asm-offsets generation to use custom OFFSET and DEFINE from the test
> directory.
> =

> ---
> =

> V6:
>  - Add missing $(generated-file) dependencies for "-deps" objects
>  - Split SSE entry from sbi-asm.S to sse-asm.S and all SSE core functions
>    since it will be useful for other tests as well (dbltrp).
> =

> V5:
>  - Update event ranges based on latest spec
>  - Rename asm-offset-test.c to sbi-asm-offset.c
> =

> V4:
>  - Fix typo sbi_ext_ss_fid -> sbi_ext_sse_fid
>  - Add proper asm-offset generation for tests
>  - Move SSE specific file from lib/riscv to riscv/
> =

> V3:
>  - Add -deps variable for test specific dependencies
>  - Fix formatting errors/typo in sbi.h
>  - Add missing double trap event
>  - Alphabetize sbi-sse.c includes
>  - Fix a6 content after unmasking event
>  - Add SSE HART_MASK/UNMASK test
>  - Use mv instead of move
>  - move sbi_check_sse() definition in sbi.c
>  - Remove sbi_sse test from unitests.cfg
> =

> V2:
>  - Rebased on origin/master and integrate it into sbi.c tests
> =

> Cl=E9ment L=E9ger (5):
>   kbuild: allow multiple asm-offsets file to be generated
>   riscv: use asm-offsets to generate SBI_EXT_HSM values
>   riscv: Add "-deps" handling for tests
>   riscv: lib: Add SBI SSE extension definitions
>   riscv: sbi: Add SSE extension tests
> =

>  scripts/asm-offsets.mak |  22 +-
>  riscv/Makefile          |  12 +-
>  lib/riscv/asm/csr.h     |   2 +
>  lib/riscv/asm/sbi.h     |  89 ++++
>  riscv/sse.h             |  41 ++
>  riscv/sbi-asm.S         |   6 +-
>  riscv/sse-asm.S         | 104 +++++
>  riscv/sbi-asm-offsets.c |  20 +
>  riscv/sbi-sse.c         | 936 ++++++++++++++++++++++++++++++++++++++++
>  riscv/sbi.c             |   3 +
>  riscv/sse.c             | 132 ++++++
>  riscv/.gitignore        |   1 +
>  12 files changed, 1355 insertions(+), 13 deletions(-)
>  create mode 100644 riscv/sse.h
>  create mode 100644 riscv/sse-asm.S
>  create mode 100644 riscv/sbi-asm-offsets.c
>  create mode 100644 riscv/sbi-sse.c
>  create mode 100644 riscv/sse.c
>  create mode 100644 riscv/.gitignore
> =

> -- =

> 2.47.1
> =


-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
