Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F40CA0ED1
	for <kvm-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 21:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zC9waX/SLOTEvoGTMb43VJ/AUyChodU8MJOQaaUr8kU=; b=k2jNXpNWGs0Tnf
	U/YQe4klN4yDvgwFvsTLKR6OQerM5D9cajgJFtR21KTVRd/NsJslbkyN4vi4SGOL0NIMq3e/81MTI
	tZQxmPCKrsN7UD+nTMby4/8kXB/TvDUGonsw6sXlLDYOPL0fvsYIg3cucG2bPQ9ZH61PCVoE0tK1Z
	cmxpZn0BDI3nxirOGzPfBX3Xoq/bOujFJ+XZfEtkaK3OCZM9kKBcrVeeFYlkapcSpB7acqTOlZRxT
	0yIiiXA+TLs+6NzTGWRB7f8ICIlbF5mDGlU27GMoAwSNLjzXey4OJNwqkGnnZWLEtUdmOybo2rzdM
	FNZxxsnnl+gwkR8EATtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7QR-00000008k1r-1REZ;
	Mon, 18 Aug 2025 21:29:55 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo6nA-00000008fDk-3yyS
	for kvm-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 20:49:23 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3e671afa78bso6850785ab.1
        for <kvm-riscv@lists.infradead.org>; Mon, 18 Aug 2025 13:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755550160; x=1756154960; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yTx0AGgPrDbS3KcN6ga5NW90Vwf9DBfaoRIUpUUDTXY=;
        b=pWtzoege8PeURuZP1hNV/qOvekeq8/lCJCrmYrBesflWz2D+0Zw07us6kIKo5rhqlq
         oR4gSNMLokliKt7ByVHPlHFWydvpmvQY+OwVomIs6uCJfkMXYWlPwzBuYBoflej1OxjG
         MUqysoRhvjE9SmpocmyWmqiN2elClRi3wsx8z0rqoW2drq639oNXiqegYRFF9tMi7d36
         dC3AEf3jKGCwlH8spdynrjL8U3v+DTssmCLljRDWG5oEmFfCSa5vN/SzkdvArao4WIJi
         TndcSBSBk1eBcmKR5T79NqqdcIaqNgfk+WmhM880rqhOPA6OaM/VjvzBk2Z6cEYY+gIX
         kHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755550160; x=1756154960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTx0AGgPrDbS3KcN6ga5NW90Vwf9DBfaoRIUpUUDTXY=;
        b=D3EfeKxI44BwYuXhNwTUdP/eGvZFIY5pbrQhWSdIA0ar8gLIbmhHa2oyrgcjHwi9qC
         NgEh1Oyo5fKUtyYU7Z1Wow5uPdKQaE7JaZKqVEUKbbkv8YAXUilWDxdeBuQUjQci+FG9
         gnhiDc/8hehZmdljLjU6b8yoATFmZKNJaRSmzd1WB1eJjSEn797uGuGzDUMuiqE+8dIY
         0PGvo0LZsBEH1J1/z7/ib94DaLfhoWG+y5rF1vQJcl0Y7sNyA9jeG70Api8Hy/t+VUmo
         2lFyhH/JZXXKgBDtkxe6ROT6TZwsSuLsgGztprk1LCNV+MlwTd3/4Eh+mmZVS3ySjTnL
         uXYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbujyvk5CrzPq2cNgVnlwfjRj5cXKkgyb43fIlWP4U5GS1LxHAOk50vs8nqPvw43zOB0EudxkIDGs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwtniAisJvJZZFbzuqEhg8ez/qxu+Jf6KkoGy9Crd8iNa9BpwNl
	UMN5e+l6honu/5+oNsQkmEYRCnCv/R758Ww9fvi//9ZSjv1QoN8uQIDtFKI/lnBbZ14=
X-Gm-Gg: ASbGnctxDG35EZoVrew7bewjhMEzPr7PnmWzFRMEbr0LIGTGxSYnCXelFo9BelOQ0dC
	XvIOit68q+ERImuK3bdeiTKenA013PiD0eHcI8I+oZXD06Ok+1ub+iiZFiJrYPhUCJuDNHA/RPQ
	x44Ocl1RBYS4YqxvuIJbzkRyyQwMRbF5gHmlzsaLmrzURMkD0vOqPT1NRYh4jUScOvgWEUAwqsO
	YA51kgLj2PaSRh4R1oR5ZKb10+o385f1/KivjFgvRK3WG0I6OkKf+P//SDHChw77t+gBuRskz0P
	W6bS9FJerws9wFVaCbMZFmX9aootVTLUVhyzbP0N+pd3xwOzy641VeHHBCzHEQqjUNdkRemSc3h
	yh4qPxTOvQw+HGSOUndpO/0kqOG5cId96tBU=
X-Google-Smtp-Source: AGHT+IHxcwWqm3fjBflzgEs6NvcilbQYpbaH0XAlN7Sox/42b5vyAZqiL/BamV9P4rahkCtx7tHI7Q==
X-Received: by 2002:a05:6e02:18ce:b0:3e5:6696:202d with SMTP id e9e14a558f8ab-3e67665caeemr2588935ab.20.1755550159855;
        Mon, 18 Aug 2025 13:49:19 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50c949f68eesm2778428173.77.2025.08.18.13.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 13:49:19 -0700 (PDT)
Date: Mon, 18 Aug 2025 15:49:18 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: dayss1224@gmail.com
Cc: kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Quan Zhou <zhouquan@iscas.ac.cn>
Subject: Re: [PATCH v2 2/3] KVM: riscv: selftests: Use the existing
 RISCV_FENCE macro in `rseq-riscv.h`
Message-ID: <20250818-617bdc4613bfa02c291a6b47@orel>
References: <cover.1754308799.git.dayss1224@gmail.com>
 <7de4aedb44be3166a6568c28da70c0d2d4850571.1754308799.git.dayss1224@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7de4aedb44be3166a6568c28da70c0d2d4850571.1754308799.git.dayss1224@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_134920_987840_EC6E0C2A 
X-CRM114-Status: GOOD (  15.13  )
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

On Thu, Aug 07, 2025 at 10:59:29PM +0800, dayss1224@gmail.com wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> To avoid redefinition issues with RISCV_FENCE,
>  directly reference the existing macro in `rseq-riscv.h`.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Dong Yang <dayss1224@gmail.com>
> ---
>  tools/testing/selftests/rseq/rseq-riscv.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/rseq/rseq-riscv.h b/tools/testing/selftests/rseq/rseq-riscv.h
> index 67d544aaa..06c840e81 100644
> --- a/tools/testing/selftests/rseq/rseq-riscv.h
> +++ b/tools/testing/selftests/rseq/rseq-riscv.h
> @@ -8,6 +8,7 @@
>   * exception when executed in all modes.
>   */
>  #include <endian.h>
> +#include <asm/fence.h>
>  
>  #if defined(__BYTE_ORDER) ? (__BYTE_ORDER == __LITTLE_ENDIAN) : defined(__LITTLE_ENDIAN)
>  #define RSEQ_SIG   0xf1401073  /* csrr mhartid, x0 */
> @@ -24,8 +25,6 @@
>  #define REG_L	__REG_SEL("ld ", "lw ")
>  #define REG_S	__REG_SEL("sd ", "sw ")
>  
> -#define RISCV_FENCE(p, s) \
> -	__asm__ __volatile__ ("fence " #p "," #s : : : "memory")
>  #define rseq_smp_mb()	RISCV_FENCE(rw, rw)
>  #define rseq_smp_rmb()	RISCV_FENCE(r, r)
>  #define rseq_smp_wmb()	RISCV_FENCE(w, w)
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
