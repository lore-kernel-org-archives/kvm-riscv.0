Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0064C71135
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 07:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qmaKIB64rM6L87TshbhDuRAPWo1ozlUTZdq3a4+w6mw=; b=f5T/mbDMB3WWUe
	j1RJG5CxDK7AHz7O3Yqaj1zSl9KyToaon10V4G9I2bnUFQF9gczIavL5WWRkLZSnUpOjXcOUeLobG
	W5KXpsdMmH7pq5+XwzA95UsEPONj3priG6PLI2U3XJvw/rWGi4+YOkl7m3UViQmAyjUtgX48cssq/
	WL5Ut+3b/8AfrpAA9q5Q+hi4uBb6wEI2PgtPS0Wd5818W5LcgWDNvFDM7XPD1Pu4+hCzoCFpBo6vo
	z3/AubQSVzEt5AZq3XkzOvZiCs3PIYEGO036aGoSimz6tszgOubvbX6g6CJw1yMg82DgAqkSe2p9B
	16iAQNJssLMeQN/5v99w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzHE-0000000FhlA-0cW4;
	Fri, 13 Jun 2025 07:56:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzDn-0000000FhKq-3g1p
	for kvm-riscv@bombadil.infradead.org;
	Fri, 13 Jun 2025 07:53:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TiGdYV7bOzsWj9YpYkDeFiIUmyn7YK9R6zHRZS1z8aM=; b=VjM3o6WMrmRI4PJtoF89spIWmq
	ZJGZpvMMqw9JYhNOBM4UwpEkSmeCnOtUgpW7DRHm/KSqWjF/nfvHzHPnrZBex9OwvD0uXkNvQhTHW
	ZD8RQr18o1WDvnNErV+/fW/05ggRwdR9BraWYbppl71r/S0tgMtk6l0WEM+Mv3dRI0ZwJ18FG7GJ7
	uq+H/lLrVnHNi5pVOKUijo+fg1FKHdWE9It8aQG8AX7DV0aI5XFrgryjVFqnm/xcEWB+IjH2kcPY0
	MXTDehELqScBPR/TQ4GkeqOwxmkhzfEfRDpSZBcSMEoXq9BmmJCKJfMrVISsEYToFQUEg9hWeoIma
	QGHnTw6w==;
Received: from out-171.mta1.migadu.com ([2001:41d0:203:375::ab])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzDk-00000002uKV-2lOm
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 07:53:07 +0000
Date: Fri, 13 Jun 2025 09:52:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749801174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TiGdYV7bOzsWj9YpYkDeFiIUmyn7YK9R6zHRZS1z8aM=;
	b=XrBZMe5AqJA0MZ4ohbAh1qMK1HaXdjEZVGpyEopRR0yMgenXC3lxBBZNL5tuhk6l70IGh3
	uxAGPho/XPF4vSkHtMDOpJi4/TsxIrEHcNNGwO/04KMVIZ7/hFdJ5aWvqBxDH0VF7WwPPO
	0p5FhwliRxXgGr0QdacfuQXHug0caqE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Jesse Taube <jesse@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, Atish Patra <atish.patra@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Himanshu Chauhan <hchauhan@ventanamicro.com>, 
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH 1/2] riscv: Allow SBI_CONSOLE with no uart
 in device tree
Message-ID: <20250613-68a39013932d854741a41c4c@orel>
References: <20250612200747.683635-1-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250612200747.683635-1-jesse@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_085305_385523_3F8622AA 
X-CRM114-Status: GOOD (  17.68  )
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

On Thu, Jun 12, 2025 at 01:07:47PM -0700, Jesse Taube wrote:
> When CONFIG_SBI_CONSOLE is enabled and there is no uart defined in the
> device tree kvm-unit-tests fails to start.
> 
> Only check if uart exists in device tree if SBI_CONSOLE is false.
> 
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
>  lib/riscv/io.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/lib/riscv/io.c b/lib/riscv/io.c
> index fb40adb7..96a3c048 100644
> --- a/lib/riscv/io.c
> +++ b/lib/riscv/io.c
> @@ -104,6 +104,7 @@ static void uart0_init_acpi(void)
>  
>  void io_init(void)
>  {
> +#ifndef CONFIG_SBI_CONSOLE
>  	if (dt_available())
>  		uart0_init_fdt();
>  	else
> @@ -114,6 +115,7 @@ void io_init(void)
>  		       "Found uart at %p, but early base is %p.\n",
>  		       uart0_base, UART_EARLY_BASE);
>  	}
> +#endif

Doesn't this generate uart0_init_fdt/acpi defined but not used types of
warnings? We need to put everything unused under the #ifndef
CONFIG_SBI_CONSOLE, just as uart0_read/write already are. Alternatively,
we can keep everything out of the #ifndef and export
 
void sbi_puts(const char *s);
void uart0_puts(const char *s);

then just have a single use of the #ifdef,

void puts(const char *s)
{
#ifdef CONFIG_SBI_CONSOLE
    sbi_puts(s);
#else
    uart0_puts(s);
#endif
}

I think I like that better since it will ensure all code gets compile
tested all the time and allow an SBI console using unit test to also
access its uart if it has one, just because...

Thanks,
drew


>  }
>  
>  #ifdef CONFIG_SBI_CONSOLE
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
