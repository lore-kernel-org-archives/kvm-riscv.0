Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604AAC4451C
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 08:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TuWeiy7unSgVwJjA6wrJ+OZcI+klPS+AAPCofcptWE0=; b=ZPVzUZ1t+LTeIT
	eVH3Wfx1Zvr2I914y3wLfQnxFFDsAGlQi1mnzgZmH6j9y541KbkWuYOfV2hh/2mAogLwETgzDUJ0b
	XJqw79FjTujgtJPJb/VnffuOqhDrO9dLd67Cuhzb7E/3XwB5JarMc3YXTzMgI/RVc2/U4xrfSbAd+
	9YbXHLqkgZU3Idtrn1EIt9BJ1EFs2pA2jx+CVD7wHbHTmomxG6OvmTrKkFSSukm1PP8S9RvsDxhvn
	ZB+94gqXeQC5fXtJ2koufrIOk8FrBFA16YOolbK5xHRk1Mf6378jF80p84KGNGk6wpLMc6NxyX63N
	tXYfzd16+zQageawjt4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6Jk-00000008tt2-0IAd;
	Tue, 21 Jul 2026 08:59:12 +0000
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6Jh-00000008ts6-2RyB
	for kvm-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 08:59:11 +0000
Date: Tue, 21 Jul 2026 10:58:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784624345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QTGegFWNBEQm0YUeGI6qH59Pph3lrL6+2+bz/GFsUb4=;
	b=aVoW0tQcsQfcLNcGR0ONVznjbP11YRKKUWr/a3MyJBajXMrTu/kRfb9YXAXwjHE05257ow
	ElrQB8lygx+eliUHBAbPC0wXzwd9L9LuvyxrRxTTEjvJLAqQVVYdr8k5LTwg9J4mp6okKi
	ozoq1243jrYvUMf4Yss+XaXQ1ujmazI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Colton Lewis <coltonlewis@google.com>
Cc: pbonzini@redhat.com, alexandru.elisei@arm.com, eric.auger@redhat.com, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [kvm-unit-tests PATCH] Makefile: efi: preserve .dynstr section
 for LLVM objcopy compatibility
Message-ID: <lxhagolfvr6w5h5xujrhq33pzx7hb6db5ihga46z6qn3dba4nx@q5b2fdclitqs>
References: <20260716173315.2775989-1-coltonlewis@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260716173315.2775989-1-coltonlewis@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_015910_110407_2493B456 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jul 16, 2026 at 05:33:15PM +0000, Colton Lewis wrote:
> When building EFI binaries with llvm-objcopy, keeping sections with
> '-j .dynamic -j .dynsym' without '-j .dynstr' fails with:
> 
>   llvm-objcopy: error: 'arm/spinlock-test.so': section '.dynstr'
>   cannot be removed because it is referenced by the section '.dynamic'
> 
> Include '.dynstr' in the list of preserved sections across
> arm/Makefile.common, riscv/Makefile, and x86/Makefile.common so that
> EFI binaries can be built cleanly using llvm-objcopy.
> 
> Assisted-by: Gemini:gemini-next
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>  arm/Makefile.common | 2 +-
>  riscv/Makefile      | 2 +-
>  x86/Makefile.common | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>

Pushed.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
