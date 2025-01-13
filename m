Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E2AC02184
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 15:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rWfwc6iEBYwCm/NLsvoilVzuxSD7tnBQlSyryCrhTe4=; b=e8HNNsF3KzIV7R
	SQmwUCQohtPjPZDO6JJVFFqlRdbbyDBKLgVJs62iyZPgB22NP9rsYRfImaerNGEIux+8dgRH7rKcv
	30phXbtJ26n5d11FkjT7m/K/94LTRZxrkw7ogqCYNnYERQwMk0x5smGZ2PzdTwfIDK/q0Kh+oRlAE
	is1ttxSjgLYR2jqBdgJVLwqNdtchHGS6T4O4hjNOttbKDVv1+Osg5Ggm8k3wme+apGOiLEftluM5K
	4PJieP+J+vPhHhxNhoF7cXaQg4n0YiucwJJOL1vDPWMbx1UYiLZVm9h4r1DL6MUXBq7PaG/O4pO+l
	a9AyWH2WjebEktQqCulg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMkM-00000005jQX-12fx;
	Mon, 13 Jan 2025 15:52:58 +0000
Received: from out-175.mta0.migadu.com ([2001:41d0:1004:224b::af])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXM8T-00000005a1P-0682
	for kvm-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 15:13:50 +0000
Date: Mon, 13 Jan 2025 16:13:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736781224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hdLeZjgsxpTEb/ESjCgEojXnaXa6y+7iB6h33/Z6dms=;
	b=fXT1uUBoKArx52tPaWyXs+o2K25Q1zXgNMni985Mil56OjK89u7UWgd4+JToG7xCNI5AOE
	ItO1kOrctTaGYtt54+Sl82Hm/4Z1q1QjFH4kYR9z8T+xyBgaxDW/Pt4j0PHEbPWFsvz45b
	yMhV/l3rnHfZB2C1X6EVTCpchLdp9PI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v1 3/5] arm64: Implement the ./configure
 --processor option
Message-ID: <20250113-095d3fc41114359b246608e0@orel>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
 <20250110135848.35465-4-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250110135848.35465-4-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_071349_201553_A074DA08 
X-CRM114-Status: GOOD (  17.74  )
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

On Fri, Jan 10, 2025 at 01:58:46PM +0000, Alexandru Elisei wrote:
> The help text for the ./configure --processor option says:
> 
>     --processor=PROCESSOR  processor to compile for (cortex-a57)
> 
> but, unlike arm, the build system does not pass a -mcpu argument to the
> compiler. Fix it, and bring arm64 at parity with arm.
> 
> Note that this introduces a regression, which is also present on arm: if
> the --processor argument is something that the compiler doesn't understand,
> but qemu does (like 'max'), then compilation fails. This will be fixed in a
> following patch; another fix is to specify a CPU model that gcc implements
> by using --cflags=-mcpu=<cpu>.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  arm/Makefile.arm    | 1 -
>  arm/Makefile.common | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arm/Makefile.arm b/arm/Makefile.arm
> index 7fd39f3ada64..d6250b7fb686 100644
> --- a/arm/Makefile.arm
> +++ b/arm/Makefile.arm
> @@ -12,7 +12,6 @@ $(error Cannot build arm32 tests as EFI apps)
>  endif
>  
>  CFLAGS += $(machine)
> -CFLAGS += -mcpu=$(PROCESSOR)
>  CFLAGS += -mno-unaligned-access
>  
>  ifeq ($(TARGET),qemu)
> diff --git a/arm/Makefile.common b/arm/Makefile.common
> index f828dbe01d33..a5d97bcf477a 100644
> --- a/arm/Makefile.common
> +++ b/arm/Makefile.common
> @@ -25,6 +25,7 @@ AUXFLAGS ?= 0x0
>  # stack.o relies on frame pointers.
>  KEEP_FRAME_POINTER := y
>  
> +CFLAGS += -mcpu=$(PROCESSOR)
>  CFLAGS += -std=gnu99
>  CFLAGS += -ffreestanding
>  CFLAGS += -O2
> -- 
> 2.47.1
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
