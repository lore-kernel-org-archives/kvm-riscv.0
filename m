Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368EBC02180
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 15:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m17TmE5+eVvft1QG2lI/mq61jFMVWcqtECI0sW/TVHw=; b=Tr0P1z+792W1/G
	Wlo+YfVFbyrvtzkgQfCRHz5DrQZRvYKj/SVjIGMJOpAB21U46fTZ9YZFIHD9EA+GYrRKLFQP8UsD0
	FwaSp9zvODzt+ZoD78M8viblJ9xWvxFJckHu+sxuoArASFS/BYM14u2lxFS5QTtHm6G3u0osRxXPr
	ELnt16MoWLZPEtB6MRS4rySztorkJuhrqUB0nrbmlHUek4mHWTyTRViv+xoi3+vsWsOm/0d9VaqbO
	nkyWzToYaP1HrFaxv9l5YrX8mfuwTgvEkc1EkNOOYwjBN0eoDYbZJBvAf9V3q5QjAV1BtVKuXuNtn
	kZPQzWg3emm15+h/E0EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMlT-00000005k1C-3pDk;
	Mon, 13 Jan 2025 15:54:07 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMGH-00000005c43-2TUS
	for kvm-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 15:21:55 +0000
Date: Mon, 13 Jan 2025 16:21:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736781711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S+csKsh3Lg7wrpCs4Aw/UvMnqMM5F3l+RfYbkKy7EYM=;
	b=UjLtIJEJqjbkAT36AMpiAe0fD9h+BuKq8WrfC8ZgnnfMKd7Nc4EDfAce3ipS7uSByGds+v
	FPOfxYRI2mn+Ou1KYtzN4wBPzc60mj76w4nF1c5Qi4gFd2ZJpG5K0VdSH0tHXY1qDE13Wg
	SJaTYVp8yxhDXi0xtO10SmV/D5z/LIs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v1 4/5] arm/arm64: Add support for
 --processor=max
Message-ID: <20250113-8711bc93ade1e8c83dfe3582@orel>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
 <20250110135848.35465-5-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250110135848.35465-5-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_072153_777244_C8EB6F99 
X-CRM114-Status: GOOD (  30.07  )
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

On Fri, Jan 10, 2025 at 01:58:47PM +0000, Alexandru Elisei wrote:
> For arm64, newer architecture features are supported only on newer CPUs.
> Instead of expecting the user to know which CPU model supports which
> feature when using the TCG accelerator for qemu, let's make it easier and
> add support for the --processor 'max' value.
> 
> The --processor value is passed to the compiler's -mcpu argument and to
> qemu's -cpu argument. 'max' is a special value that only qemu understands -
> it means that all CPU features that qemu implements are supported by the
> guest CPU, and passing it to the compiler causes a build error. So omit the
> -mcpu argument when $PROCESSOR=max.
> 
> This affects only the TCG accelerator; when using KVM or HVF,
> kvm-unit-tests sets the cpu model to 'host'.
> 
> Note that using --processor=max with a 32 bit compiler will cause a build
> error: the CPU model that the compiler defaults to when the -mcpu argument
> is missing lacks support for some of the instructions that kvm-unit-tests
> uses. The solution in the case is to specify a CPU model for the compiler
> using --cflags:
> 
>   ./configure --arch=arm --processor=max --cflags=-mcpu=<cpu>
> 
> This patch doesn't introduce a regression for arm when --processor=max is
> used, it's only the error that changes: from an unknown processor type to
> using instructions that are not available on the processor.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  arm/Makefile.common | 2 ++
>  configure           | 5 ++++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arm/Makefile.common b/arm/Makefile.common
> index a5d97bcf477a..b757250dc9ae 100644
> --- a/arm/Makefile.common
> +++ b/arm/Makefile.common
> @@ -25,7 +25,9 @@ AUXFLAGS ?= 0x0
>  # stack.o relies on frame pointers.
>  KEEP_FRAME_POINTER := y
>  
> +ifneq ($(PROCESSOR),max)
>  CFLAGS += -mcpu=$(PROCESSOR)
> +endif
>  CFLAGS += -std=gnu99
>  CFLAGS += -ffreestanding
>  CFLAGS += -O2
> diff --git a/configure b/configure
> index 138840c3f76d..46964d36a7d8 100755
> --- a/configure
> +++ b/configure
> @@ -67,7 +67,10 @@ usage() {
>  	Options include:
>  	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
>  	                           arm, arm64/aarch64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> -	    --processor=PROCESSOR  processor to compile for ($default_processor)
> +	    --processor=PROCESSOR  processor to compile for ($default_processor). For arm and arm64, the
> +	                           value 'max' is special and it will be passed directly to
> +	                           qemu, bypassing the compiler. In this case, --cflags can be
> +	                           used to compile for a specific processor.
>  	    --target=TARGET        target platform that the tests will be running on (qemu or
>  	                           kvmtool, default is qemu) (arm/arm64 only)
>  	    --cross-prefix=PREFIX  cross compiler prefix
> -- 
> 2.47.1
>

I don't think we want to overload processor this way. While mcpu and QEMU
could both understand the same cpu names, then it was mostly fine
(although it probably shouldn't have been overloaded before either). Now
that we want one name for compiling and another for running, then I think
we need another configure parameter, something like --qemu-cpu.

Thanks,
drew

> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
