Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127C3C021B8
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 16:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=opWE5WmJpRmw8L5gZwscwmXUmi0Dx1kdeJ35URpXi7Y=; b=QPBk/+Tad41Hwt
	mGrjZY4E5AQ1v52LaIIt4/7g6TrWPX24gdYsLMIjHI1gLhdbQbRsF+GbhIRs/x2KD59AQYwZcUK6o
	gokG5kGzmVb9Ay/lZGB/zxR2UX0OrM1vxIBWLhbl5hvZSK4tseGgqxeA7N1bF6tRAbJz1TQA2G8n2
	a+UyRhflBftgfLhyKshdByp71Di4syoZtKvY3FF1fM2ZMOIgA59P80ue9xPqhKz0kyB6sf+WDtWjv
	x9h+NSp7uXaAj8h1AAHAqBax0RhEPhZd+VSCMrXyAc4tfr/McZzTC7IhCGF6czydcyK/ppqFWMM48
	bO+sGBWQdavLdhHlvW4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxx7-00000000Fj5-2wqW;
	Tue, 25 Feb 2025 16:38:37 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmv85-0000000HOme-3h7K
	for kvm-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 13:37:47 +0000
Date: Tue, 25 Feb 2025 14:37:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740490661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+ixqOC12lcUbO8F8o140WgK+Y55hHmyICfLfrpYnuPM=;
	b=wH+xhjsRmvhrhpxvrfoccwgz9vk4ycI7xJw3NIyc5a0Cnhjg34RUCnfdqBfFCOGenODEy4
	mNmIL02lvg+cKWngs6CywduekBe+7s9leXhvNgdLmd/IyG5MmwUslcfu2ORydBCklhQp32
	SvBxreXHRruBA0wHnBtaIVkApGPpBH8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [RFC kvm-unit-tests PATCH] lib: Use __ASSEMBLER__ instead of
 __ASSEMBLY__
Message-ID: <20250225-f474d056a12e6b23cc05f9e7@orel>
References: <20250222014526.2302653-1-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250222014526.2302653-1-seanjc@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_053746_213190_4DE23513 
X-CRM114-Status: GOOD (  10.43  )
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

On Fri, Feb 21, 2025 at 05:45:26PM -0800, Sean Christopherson wrote:
> Convert all non-x86 #ifdefs from __ASSEMBLY__ to __ASSEMBLER__, and remove
> all manual __ASSEMBLY__ #defines.  __ASSEMBLY_ was inherited blindly from
> the Linux kernel, and must be manually defined, e.g. through build rules
> or with the aforementioned explicit #defines in assembly code.
> 
> __ASSEMBLER__ on the other hand is automatically defined by the compiler
> when preprocessing assembly, i.e. doesn't require manually #defines for
> the code to function correctly.
> 
> Ignore x86, as x86 doesn't actually rely on __ASSEMBLY__ at the moment,
> and is undergoing a parallel cleanup.

With ignoring x86, I see just one other instance of ASSEMBLY, which is in
a comment and is mispelled to only have the leading underscores

lib/libfdt/fdt.h:48:#endif /* !__ASSEMBLY */

With that replaced, for riscv and arm

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
