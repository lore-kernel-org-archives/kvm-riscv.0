Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91834CC6B0E
	for <kvm-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 16:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NhX3RyKyJ3uzEVZgvA9yN3QxICYm7aTHD5n9hBn/zJI=; b=ptz8MjAw2Jc6is
	r9snyLBIm1C0JHGwASCMtFl7A4ICU5oHe+qTJOYqnE0XBzQW3OVrT8mzKDL+3YG9PNwLoeSuJk3Tj
	8lzqrDfYgyzMPpBfbaRKMwccYvEJ3USQE6K2cRNhmFIgZO5eALpZoKg/zDxCY9wHJgl03VmMSlc4w
	2O172NRWnkKHWY2CEl+Yt/ruNglh4BbBKV0nL1AFlPCUyYdZ1xp9dZ1BGICH0oVN4ogxmTc9DViNV
	FYaTjzIBLyBhM5va4+ISBrMglcd1NO67Pgw6OF1aFYSnkMiNlSfpVayN63K4fhYNT8VhDfx8zzjb6
	XW6fYG/pQOMHqUy8xQJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfqP-0000000DcDq-18iu;
	Tue, 13 Oct 2026 16:59:17 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfqN-0000000DcCs-0ruP
	for kvm-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 16:59:16 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-8ab8d96d02aso24994107b3.1
        for <kvm-riscv@lists.infradead.org>; Tue, 13 Oct 2026 09:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1791910754; x=1792515554; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mjPFoJ0mDKhZbg4j/RMY3/uLWUv+CViZqO8+0A6BckY=;
        b=d4a2cy8QXZCOpJK929kQfFErB/FQct5zrNHMQVaVfJjGTxU8Ft7ymqFdaY/vQ/rDai
         NxR0PT/ZIpz2g15Bg85pLbgjkCo9o4iW/UETge1xaTpHKagCwn7pLFJGAMg/B7uox8lE
         dz7RTxZyV2mBGUdpWpKEWhWIwkUcmZl/eTEGUUvOJKv5x2QLdjde3z9DiFvK5DnvGT+2
         FqGAtTnVVA8idDV+ZIMxICKxX0QSxmCekhhwNqXeqBDxXmm9zL8IlfO5+33ZfZsDPlQA
         D+CUnF52kyYR7SkG7wY5QHQfKYfoU2x1ziFGASy0gQTNYGdL1ef1AfQpIKlEZT8k7AUM
         8GSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791910754; x=1792515554;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mjPFoJ0mDKhZbg4j/RMY3/uLWUv+CViZqO8+0A6BckY=;
        b=gJojc4HDKp614CDRJ2jA+emzHz+J/sFDjgXERBSAEm+1dpM88p0SxXJYRLlqCr0I+c
         6IdpHU245i4IvUOXbYM9wl4vm3OBb0sYOP/UFlU+Rxaer90CxjpzNhQrhFl1VWOznT4I
         mQUmTYtsRmX67i8yB5NnbWtpJt1CJdWjKwoVz48TxUhjISA2xxmDQf49CPS/YteLCHK5
         Lh4d4D49mOiNzPnjMAh6NTTOJXmpPeFQRZWX8MYSccP1CozP/c1XFSFnfvsKzzWqj3A8
         6jyuiDfSp5ssC9w5hgB11I/v8rM9fwyeqe+pe/tF9USRBNyfQWYY3NfjTWNh/SpNJJW8
         ti5A==
X-Forwarded-Encrypted: i=1; AKwUvBwG1tWs9qRDBAqw7Nlty0XJYBWw5OhCIOhsL9RJYui3I9itI0QHt1dk5T9Gr+bu1XI68nnkdg0rCZE=@lists.infradead.org
X-Gm-Message-State: AFq9FYKH49UJKM7wJQQUHzhxglcmwVL+ej/VMlHjA/o3rFPtz+RlvnWl
	BzPkN/Xd4WS6Txg1e0qQKStni6kMkgAcx0e1iYH25vAk9z5sVl03H2u0jOfqRrvtrs8=
X-Gm-Gg: AYBFou0u1bbioF6EStpmhUrp/91PtnS4qUJu/KnJDoVZDvFAemOzpEHrBpgSsssp/X5
	/ktgaGTdAOd7Rnr9nvf1x+7kR3LBk5Jfqal/GyqEFZ8qujIzd4bZ+3xhBtjk7/pgn9CFLWPe/1S
	nZbXRUH5WAQSiA/QhzACTyBxGBCInnc8z2vsDfK0vSZiSlqaoPMGVnRJxPLQhjUpq2OjNN7UDLe
	niHHSxnDQjcoDXZ4JLD8RuaGwB4hkyF8WY+xbhsDHWIhmPhDoNM8VCmHzHedHJ02nnYWNC8XpnJ
	iTh8IFw699OTeszIrrTeCOo5M5t/jCZvR8PcAjgc4tXII1RHO4R/6bB3c1qaZOJFoD0up3rHMB8
	N9maUCik8UcI8eB3j4I2phc54d0EtTcVcv0qiykA8wTMqf0e1ugE+rnHzAXqz9kCL+WEMcl8/jb
	MrKgfluENRmD1TcE1TKnWh8w8TM9sT3CiEMe8MgwMPBCNywsqlYsnhaAH+GSjw6KCbv60twmYpW
	9u4x2X3irprRd0WQWDl
X-Received: by 2002:a05:690c:5310:b0:8ae:1acc:ad33 with SMTP id 00721157ae682-8b07ee0118fmr31810657b3.58.1791910753585;
        Tue, 13 Oct 2026 09:59:13 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:d01e:ebe9:3ad:261f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07ee8a075sm49030607b3.5.2026.10.13.09.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 09:59:13 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:59:12 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <pjw@kernel.org>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] riscv: Drop CONFIG_RISCV_ISA_V_DEFAULT_ENABLE
Message-ID: <as5jYIDw-VVi_tuT@Tao-Chiu's-Mac>
References: <20261007085126.222688-1-samuel.holland@sifive.com>
 <20261007085126.222688-2-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261007085126.222688-2-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_095915_245472_8AD2F21C 
X-CRM114-Status: GOOD (  22.82  )
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

On Wed, Oct 07, 2026 at 01:51:16AM -0700, Samuel Holland wrote:
> The ability to prevent userspace from executing vector instructions was
> provided as a escape hatch for software that was broken by adding vector
> state to the signal context. This appears to be unused in practice, and
> creates confusion in the extension support returned by hwprobe(), as in
> this one special case an extension reported as present by hwprobe() is
> unusable.
> 
> Since we believe it is safe to always allow vector usage, start removing
> this functionality by dropping the Kconfig option. It is possible to get
> equivalent behavior by setting the sysctl at boot via the kernel command
> line, but that method will also soon be deprecated.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>

Thanks!

> ---
> 
>  arch/riscv/Kconfig         | 11 -----------
>  arch/riscv/kernel/vector.c |  2 +-
>  2 files changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d6c2dbf8455ce..e26450f0d38fb 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -650,17 +650,6 @@ config RISCV_ISA_V
>  
>  	  If you don't know what to do here, say Y.
>  
> -config RISCV_ISA_V_DEFAULT_ENABLE
> -	bool "Enable userspace Vector by default"
> -	depends on RISCV_ISA_V
> -	default y
> -	help
> -	  Say Y here if you want to enable Vector in userspace by default.
> -	  Otherwise, userspace has to make explicit prctl() call to enable
> -	  Vector, or enable it via the sysctl interface.
> -
> -	  If you don't know what to do here, say Y.
> -
>  config RISCV_ISA_V_UCOPY_THRESHOLD
>  	int "Threshold size for vectorized user copies"
>  	depends on RISCV_ISA_V
> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index b112166d51e9f..9641343732782 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -20,7 +20,7 @@
>  #include <asm/ptrace.h>
>  #include <asm/bug.h>
>  
> -static bool riscv_v_implicit_uacc = IS_ENABLED(CONFIG_RISCV_ISA_V_DEFAULT_ENABLE);
> +static bool riscv_v_implicit_uacc = true;
>  static struct kmem_cache *riscv_v_user_cachep;
>  #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
>  static struct kmem_cache *riscv_v_kernel_cachep;
> -- 
> 2.52.0
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
