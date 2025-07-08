Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D98C8303C
	for <kvm-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 09:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wivUHwicO/G4RhhhC63LvaK+FXfuKkD8c71e4ufgZmg=; b=KVzI2A1I+aTcLH
	eeG9yKVsOY/2tH3F/B8D8GewWHU8IuKd4BPgcF+Ly+tvezDVJ3qwblbiQ2Cf9/2P4frNXaKKbler2
	V49wcTassztpUTBYXs2jNZOFvT4UgLjUJnUTCWw3fLn3Dhv3tcMixtTTTeNP/kYqwSyNd6mWz6thk
	27BxdASW/0lYLVkwl4GQBQ+A0AtYo4AkeYNvVknWLY40bJWldU8OZ/fniebcUeAFNSxqYbr1PRZpB
	pQ0QPXuvR7khhIDbq6+9kUoFjNop4UuKT4EOcX6Aw2kv1ygGuVmAYVol7tfaTnreTNz6aU4AbEyBj
	C7yjLJ6wKbzt3d2YPCWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ4v1-00000004vVk-24Au;
	Tue, 08 Jul 2025 09:47:19 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ4Bf-00000004pUJ-01dN
	for kvm-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 09:00:28 +0000
Date: Tue, 8 Jul 2025 11:00:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751965224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AYV9Gt6GV7S1sBDMLX2bVdkgins9MvusBmTdZ9RaebQ=;
	b=cdRGwi3qrP6mufrMy4fWWBHQ3HqGIRKNF1wDZrd7mXiTELg0s6uKYWkcTWzAMTdOw/5BB2
	FlsHBIPnat+nXZ7FlUjM9MZ2wZZ4BRrDDP7IVwzglgU9jZbAuMsUJgMjTQFkj+Q6JGFYjQ
	xelBn8V3G41a0ravrFO21HNn58EtrWg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org
Cc: alexandru.elisei@arm.com, cleger@rivosinc.com, jesse@rivosinc.com, 
	jamestiotio@gmail.com, Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH 0/2] riscv: Add kvmtool support
Message-ID: <20250708-5524f73ffad755512205adc5@orel>
References: <20250704151254.100351-4-andrew.jones@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250704151254.100351-4-andrew.jones@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_020027_257874_1499FFC8 
X-CRM114-Status: GOOD (  10.68  )
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

On Fri, Jul 04, 2025 at 05:12:55PM +0200, Andrew Jones wrote:
> The first patch is for arm's scripts. It adds a check that I found
> useful on the riscv side. The second patch enables riscv to use
> kvmtool too.
> 
> Andrew Jones (2):
>   arm/arm64: Ensure proper host arch with kvmtool
>   riscv: Add kvmtool support
> 
>  README.md     |   7 ++--
>  arm/run       |   5 +++
>  configure     |  12 ++++--
>  riscv/efi/run |   6 +++
>  riscv/run     | 110 +++++++++++++++++++++++++++++++++++---------------
>  5 files changed, 101 insertions(+), 39 deletions(-)
> 
> -- 
> 2.49.0

Merged.


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
