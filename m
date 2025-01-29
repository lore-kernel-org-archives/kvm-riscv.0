Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1F9C02190
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jan 2025 14:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=99nGdHqhxk3OOUwMg4sHiwLuJv+GsJaLKcPMGGEV3J8=; b=OrVKy2Mbz8ec6+
	Nm8wvEth5SlTW+CS5tAC9uzttCA+iO24Hvav0paK7Y+E0YyfSV/KvTNeXRORpQAK7Q/un/I1f917x
	Pgz4XnLCL6bpPtnnyzYT+pWQkN+QxS08hR1Ito9aZK3sTkISUuBWLvX5NNnS7FEdgwqpmBjw8WS0o
	WyUC26nF+lXMsl5MVsFw3PVs58atmzTzwqCb9wZmkrvSemB/I2ymgiIFRXhuK91olckNKTEgjaBCc
	kjZMOPnIk5iOn5CKPYgzLlHMdoQOR9KE5Zo0ADim93Cfd5Khzc61XWdoF57gUx1M8aeqT3YuRKJ9d
	YXR/KvuuLNhn0z1D9mlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td8tl-000000076mc-1Edt;
	Wed, 29 Jan 2025 14:18:33 +0000
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td8ti-000000076m9-31I9
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jan 2025 14:18:32 +0000
Date: Wed, 29 Jan 2025 15:18:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738160307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=++BNsZx6jximv5tpFJZo63qAT9e5Cd/B0w65SFE0nYw=;
	b=rFqNfleoEUxa3QZR/Og0RHExNr5sKMOiaZYiC6LNrIs7uI3q0SxlcrFl0iKTV6pW+mENVJ
	iQTk+uJWy+E4khujZ+F3vXbNojBJPqaAonpueyo6NaCvU8sLfkz1vFC9WErLVDulrBtYoW
	TAcDEQR2Yx7Wb1Po0Cl4h5hmDPDZTjA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v3 0/2] Add support for SBI FWFT extension
 testing
Message-ID: <20250129-4e54cccfa2abab6dba9a608b@orel>
References: <20250128141543.1338677-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250128141543.1338677-1-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_061830_902642_15A54537 
X-CRM114-Status: GOOD (  13.95  )
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

On Tue, Jan 28, 2025 at 03:15:40PM +0100, Cl=E9ment L=E9ger wrote:
> This series adds a minimal set of tests for the FWFT extension. Reserved
> range as well as misaligned exception delegation. A commit coming from
> the SSE tests series is also included in this series to add -deps
> makefile notation.
> =

> ---
> =

> V3:
>  - Rebase on top of andrew/riscv/sbi
>  - Use sbiret_report_error()
>  - Add helpers for MISALIGNED_EXC_DELEG fwft set/get
>  - Add a comment on misaligned trap handling
> =

> V2:
>  - Added fwft_{get/set}_raw() to test invalid > 32 bits ids
>  - Added test for invalid flags/value > 32 bits
>  - Added test for lock feature
>  - Use and enum for FWFT functions
>  - Replace hardcoded 1 << with BIT()
>  - Fix fwft_get/set return value
>  - Split set/get tests for reserved ranges
>  - Added push/pop to arch -c option
>  - Remove leftover of manual probing code
> =

> Cl=E9ment L=E9ger (2):
>   riscv: Add "-deps" handling for tests
>   riscv: Add tests for SBI FWFT extension
> =

>  riscv/Makefile      |   8 +-
>  lib/riscv/asm/sbi.h |  34 ++++++++
>  riscv/sbi-fwft.c    | 190 ++++++++++++++++++++++++++++++++++++++++++++
>  riscv/sbi.c         |   3 +
>  4 files changed, 232 insertions(+), 3 deletions(-)
>  create mode 100644 riscv/sbi-fwft.c
> =

> -- =

> 2.47.1
>

Applied to riscv/sbi

https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv/sbi

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
