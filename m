Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91911C02180
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 16:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HXrzfMbY9V1hsgOoKnjpaymArIOdwoLKqH+c9+qUzS8=; b=4OM1NXIoCmlHE5
	6NIKhJ0DOtT4ZqQYp1H3vfqv47aXpjXRGw3W3s3e7oHu6Yb0zaGR2ljpNQIuPmL3f64ynvpAncKAN
	9iNwEIb3MwfCZoJ8Zrwo1CxwAXvNKeEmJEZ6GuBUUOSIASjI7feL2B100+zP1xKhbbwiQddezplNw
	evez9wez6hSM9MrVYyEWXyf/6AJQvbAunJVh8vjhDDSBo95o0IhndHO48Ux/YmLgLaJbBz8He6ceb
	cOh9RZ4pQk+ZqsyWC4VVj19nGGhEtblqE7SPGx4GrUFn1IJMY6Lb+iy0VgzDTsBdEfbHPPXachMlt
	jtIhnCEFzWcIYmrGYPlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMtu-00000005lrs-1C6Z;
	Mon, 13 Jan 2025 16:02:50 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMNc-00000005dhC-083T
	for kvm-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 15:29:29 +0000
Date: Mon, 13 Jan 2025 16:29:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736782164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rSA+hNOyAkcLqPBtZ57pM1gCyD3g1ELMOtUcZw34bIg=;
	b=UQEGUKFI8PzrtF1awGKC1+UN8EXl+LliNVAFCiprEQoOfIHy5va7+W4MlnEdWWNcLmpDsz
	wYZNGBL+YidgdfYdiBT/c/xX40vXVBQ9PUZcUtGG+3YpfU++G1qEUPptM+FXTwU6n4cito
	z3guQdmmPa9/29n366iCvVlmeT2WITc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v1 5/5] configure: arm64: Make 'max' the
 default for --processor
Message-ID: <20250113-f6e1c55d5200410161aa61b5@orel>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
 <20250110135848.35465-6-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250110135848.35465-6-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_072928_224872_291BE08F 
X-CRM114-Status: GOOD (  19.52  )
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

On Fri, Jan 10, 2025 at 01:58:48PM +0000, Alexandru Elisei wrote:
> Newer architecture features are supported by qemu TCG on newer CPUs. When
> writing a test for such architecture features, it is necessary to pass the
> correct -cpu argument to qemu. Make it easier on users and test authors
> alike by making 'max' the default value for --processor. The 'max' CPU
> model contains all the features of the cortex-a57 CPU (the old default), so
> no regression should be possible.
> 
> A side effect is that, by default, the compiler will not receive a -mcpu
> argument for compiling the code. The expectation is that this is fine,
> since support for -mcpu=$PROCESSOR has only been added for arm64 in the
> last commit.
> 
> The default for arm (cortex-a15) has been kept unchanged, because passing
> --processor=max will cause compilation to break. If the user wants the qemu
> CPU model to be 'max', the user will also have to supply a suitable compile
> CPU target via --cflags=-mcpu=<cpu> configure option.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 46964d36a7d8..3ab0ec208e10 100755
> --- a/configure
> +++ b/configure
> @@ -14,7 +14,7 @@ function get_default_processor()
>          default_processor="cortex-a15"
>          ;;
>      "arm64" | "aarch64")
> -        default_processor="cortex-a57"
> +        default_processor="max"
>          ;;
>      *)
>          default_processor=$arch
> -- 
> 2.47.1
>

Another reason to introduce a new parameter (qemu_cpu) is that we can also
change arm32 to 'max', reducing divergence between arm32 and arm64.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
