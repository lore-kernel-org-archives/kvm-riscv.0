Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A837C4450F
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 07:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hTopl2DuWm9+Uyw/qMNhyi/WsokwBG53O6ULVl3e3LA=; b=uX9xU7SjHsRjZ1
	G89S/03DFzDOtLvQc58CstO2NNzbfhLW+UD982C46nfJqMdudVdijqDl3EDb6hUy91ALd9UJDSJHB
	Wf3NtsMxPfC8yRIFW9gyg1iM1c+sN7SN15Dg5/VaIO2b+zdqqS+f2tuuXH4LmmLp59QH+6gn7J4wM
	d3cwxO4T7R2G0PHAceV9Y58sYYx648fXssHMRcpmG0qUEYevoPYCfCvQshJe3IMZsXtNROPl9BHkM
	xEmcSGwoD/NBUUHEojQcau36PYV6liP0qXSTZ/PfyBJf1HRYOSrY2Eh5S4ESR94M9KoudUD5dw7jk
	l6KTzn/BDM/9R4avWFAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcbz-00000001MGf-3iWC;
	Fri, 17 Jul 2026 07:03:55 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcbx-00000001MGA-2mpP;
	Fri, 17 Jul 2026 07:03:55 +0000
Date: Fri, 17 Jul 2026 09:03:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784271831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J6cmnfycj2KUStP4y16+55TqqyQRiz2ZkFVvw4HoG7s=;
	b=QVlMtu5oYdpL8vCova70McyDA8s5E6hK3ttlamnKs8onYsKMhOHnYX7VRxBnocTqVhhF0H
	YZovUehKcG5A7KjX2UWFrxPxICsdTHvCxUrD2aIso7davCtt3Og+9JMtEh5JFvPPb/B5dZ
	fOiLqvVO79+rP/7GQLKf4PKxtzuhyk+z5J80TUwR8M6tYB4ZSh6/H4NdSHg/pXU8afWWrB
	CHcQQDJbmh2VswojFQltLxyOZbJLdcF77KBceQNpOaliBGAa3+Mqewmg9WwZWdueKDsY0b
	81ILjNxGKhszt6stbpYZYSzYjXmthC/qBMzSrLS29z+uwZKOIwCfNYz1L6l0fw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784271831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J6cmnfycj2KUStP4y16+55TqqyQRiz2ZkFVvw4HoG7s=;
	b=zMb0AeHznCksJfhHizeScTwUKgpupuXMrqjA8KRtRqr68auHRoa9dm5yolBPkEmQY7XGzA
	pEzEK2nXlcMSniCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: anup@brainfault.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-riscv@lists.infradead.org, linux-rt-devel@lists.linux.dev,
	kvm-riscv@lists.infradead.org, dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com
Subject: Re: [PATCH v2 2/3] riscv: vector: allow non-preemptible kernel-mode
 vector with IRQs off
Message-ID: <20260717070350.Vw9N1GT-@linutronix.de>
References: <20260715051629.1169645-1-tchiu@tenstorrent.com>
 <20260715051629.1169645-3-tchiu@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260715051629.1169645-3-tchiu@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_000353_973139_4D63D269 
X-CRM114-Status: UNSURE (   9.14  )
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

On 2026-07-15 00:16:21 [-0500], Andy Chiu wrote:
> diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
> index 307ac369c3d4..6627e1a82e19 100644
> --- a/arch/riscv/kernel/kernel_mode_vector.c
> +++ b/arch/riscv/kernel/kernel_mode_vector.c
> @@ -55,13 +55,16 @@ void get_cpu_vector_context(void)
>  	 * disable softirqs so it is impossible for softirqs to nest
>  	 * get_cpu_vector_context() when kernel is actively using Vector.
>  	 */
> -	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
> -		local_bh_disable();
> -	else
> +	if (!IS_ENABLED(CONFIG_PREEMPT_RT)) {
> +		if (!irqs_disabled())
> +			local_bh_disable();
> +	} else {
>  		preempt_disable();
> +	}
>  
>  	riscv_v_start(RISCV_KERNEL_MODE_V);
>  }
> +EXPORT_SYMBOL_GPL(get_cpu_vector_context);

EXPORT_SYMBOL_FOR_KVM ?

Sebastian

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
