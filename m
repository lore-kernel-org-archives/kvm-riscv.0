Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C68CC7115B
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 21:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LPe0x3rVzsTScf8F4OkwTw3pwmfC5iDm/am36WrUtTY=; b=iIOu31T2IqrfGH
	9p/oipAxXMN0CiCVvv7sW7zH722VQlqaPhJar768jspRFIHfpdF8khrvVYm97bLuKWlv3ZU6jlLiN
	dtSaGO6I/aCb4yiSfptKG6sOkzAGTRaG9qHB6kwZoky4gdUAwoCtqfw+Nn7hhInS8E/nYZiA5+NBU
	WUCO1SJudiH2R2EV3BIQvUlfhyK/7xOlwqUc/n8TelMCSYd9tf7ofdt7Vr52UHZU8KslsjUI8x/zD
	Bv/FVpk1SwC/35CKPxDIO4w57qpBRLI5zccQp9OfOyhyArkQDO8+NoJWzClHy5DGTxaQuVoSanMig
	Td1UBszESEAcay41y1GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTov4-000000041t9-15r5;
	Mon, 23 Jun 2025 21:41:38 +0000
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTkXf-00000003V8K-2ifE
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 17:01:13 +0000
Date: Mon, 23 Jun 2025 19:01:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750698069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tTE7I/KO8H35amQtJL/anmk4SKSD+jA1F2S0AsyESUo=;
	b=PP5hhr3wB6JmmQ6qEiog3eYoJv/oEWsi8ERj4nQhYPItLzopEtHk7ouTbsJOIe9xoYVLZH
	sUDUwU4xmxtfmziuV2KTrmCmf/EuxwER3jwPvNrtudOmXW7kBzwzRnAzfQxerGmjGy2ajg
	ixxQ8F1gc5Sl7TmBKqK6jlSPCflOLSk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Jesse Taube <jesse@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, James Raphael Tiovalen <jamestiotio@gmail.com>, 
	Sean Christopherson <seanjc@google.com>, Cade Richard <cade.richard@gmail.com>
Subject: Re: [kvm-unit-tests PATCH] riscv: lib: sbi_shutdown add exit code.
Message-ID: <20250623-c4c3115e6402176024bac6ea@orel>
References: <20250620155051.68377-1-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250620155051.68377-1-jesse@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_100111_910030_A828C578 
X-CRM114-Status: GOOD (  17.76  )
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

On Fri, Jun 20, 2025 at 08:50:51AM -0700, Jesse Taube wrote:
> When exiting it may be useful for the sbi implementation to know the
> exit code.
> Add exit code to sbi_shutdown, and use it in exit().
> 
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
>  lib/riscv/asm/sbi.h | 2 +-
>  lib/riscv/io.c      | 2 +-
>  lib/riscv/sbi.c     | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
> index a5738a5c..de11c109 100644
> --- a/lib/riscv/asm/sbi.h
> +++ b/lib/riscv/asm/sbi.h
> @@ -250,7 +250,7 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>  			unsigned long arg3, unsigned long arg4,
>  			unsigned long arg5);
>  
> -void sbi_shutdown(void);
> +void sbi_shutdown(unsigned int code);
>  struct sbiret sbi_hart_start(unsigned long hartid, unsigned long entry, unsigned long sp);
>  struct sbiret sbi_hart_stop(void);
>  struct sbiret sbi_hart_get_status(unsigned long hartid);
> diff --git a/lib/riscv/io.c b/lib/riscv/io.c
> index fb40adb7..02231268 100644
> --- a/lib/riscv/io.c
> +++ b/lib/riscv/io.c
> @@ -150,7 +150,7 @@ void halt(int code);
>  void exit(int code)
>  {
>  	printf("\nEXIT: STATUS=%d\n", ((code) << 1) | 1);
> -	sbi_shutdown();
> +	sbi_shutdown(code & 1);
>  	halt(code);
>  	__builtin_unreachable();
>  }
> diff --git a/lib/riscv/sbi.c b/lib/riscv/sbi.c
> index 2959378f..9dd11e9d 100644
> --- a/lib/riscv/sbi.c
> +++ b/lib/riscv/sbi.c
> @@ -107,9 +107,9 @@ struct sbiret sbi_sse_inject(unsigned long event_id, unsigned long hart_id)
>  	return sbi_ecall(SBI_EXT_SSE, SBI_EXT_SSE_INJECT, event_id, hart_id, 0, 0, 0, 0);
>  }
>  
> -void sbi_shutdown(void)
> +void sbi_shutdown(unsigned int code)
>  {
> -	sbi_ecall(SBI_EXT_SRST, 0, 0, 0, 0, 0, 0, 0);
> +	sbi_ecall(SBI_EXT_SRST, 0, 0, code, 0, 0, 0, 0);

We can't do this because a kvm-unit-tests exit code is not an
SRST::reset_reason[1]. This could result in the SBI implementation
returning an error, or doing something else, rather than shutting
down.

If this is a custom kvm-unit-tests-specific SBI implementation, then
we could pass in a reset_reason in the 0xE0000000 - 0xEFFFFFFF range.

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-sys-reset.adoc#table_srst_system_reset_reasons

Thanks,
drew
 

>  	puts("SBI shutdown failed!\n");
>  }
>  
> -- 
> 2.43.0
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
