Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB883C54F30
	for <kvm-riscv@archiver.kernel.org>; Fri, 30 May 2025 06:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8rgTT0JYTFcajYNsrZNakhmE0OiV2fPI8QfYPlV94zM=; b=EC09owFlcMqb/H
	ti0dwo48ovytSdh+tSCHnq2ZwrpktEYGBLIGtJvYyt2sgb9v5zOtkZNR1kq3CuiZUdfNc5I4oagvE
	qqSYi5zeMYr2+UXylhV/s1SxyrUpRnptmuptW43Ochr0H1UAdj0iZvf7imLpgujC96+7qqIbmRpfn
	YsRmnOOOmE2hEihm5SOy7yin/pSAp6NDnLunSzveqrAxGh2bUBvEFMVd824eSA4PVGCQBPI6SgbBa
	Cf6MZKaH9tLmJJ8fjcJ7nByktlIKgLT7HOhpdGXhTKy1ElopZdqPLAfGouqEu5UvU3gSPiJzngAuM
	xNbW8HZFFt/a8JSwPZdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKssM-0000000HKZP-1fsV;
	Fri, 30 May 2025 06:05:54 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKsqZ-0000000HKQo-0Poc
	for kvm-riscv@lists.infradead.org;
	Fri, 30 May 2025 06:04:04 +0000
Date: Fri, 30 May 2025 08:03:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748585039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kt+Vc3qTvvhvRuKl8DLuOB5hRxkIZdLx7zBcCNyOWIg=;
	b=KwCSC3mc9hChL91h8ijG31sFo6JZLkOHVU3kPqunRa9nvZkRj9H/0XekGqrcYFI8mMTOXx
	74DS+TacKbnBgQ57OMcvSQ3yCBOT18ruxjWgXZ40tWNPnWyApnUZEyw3Xde839qzuQPDpx
	/dKeHpvhzaPHRVmJGD1AfWNgR1Pj3zQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Nico =?utf-8?B?QsO2aHI=?= <nrb@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org
Subject: Re: [kvm-unit-tests PATCH 01/16] lib: Add and use static_assert()
 convenience wrappers
Message-ID: <20250530-02c84c0db9cd2199b2cf6d28@orel>
References: <20250529221929.3807680-1-seanjc@google.com>
 <20250529221929.3807680-2-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250529221929.3807680-2-seanjc@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_230403_288657_35B9B499 
X-CRM114-Status: GOOD (  10.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Thu, May 29, 2025 at 03:19:14PM -0700, Sean Christopherson wrote:
> Add static_assert() to wrap _Static_assert() with stringification of the
> tested expression as the assert message.  In most cases, the failed
> expression is far more helpful than a human-generated message (usually
> because the developer is forced to add _something_ for the message).
> 
> For API consistency, provide a double-underscore variant for specifying a
> custom message.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  lib/riscv/asm/isa.h      | 4 +++-
>  lib/s390x/asm/arch_def.h | 6 ++++--
>  lib/s390x/fault.c        | 3 ++-
>  lib/util.h               | 3 +++
>  x86/lam.c                | 4 ++--
>  5 files changed, 14 insertions(+), 6 deletions(-)
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
