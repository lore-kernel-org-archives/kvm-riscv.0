Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8286CD98C6
	for <kvm-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 06:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1zr4yB1emaCS9D8RfRiMP6MWkYsCPpcZW02QOR4gC1c=; b=oqjR8YqboPAl38
	0raErNm443LhiaHus5gnJ5dThswJQ59xGsH8SNi7C8MqcL332mejkKW6Z4st4zzl71zF0DC+JF1rL
	ZISkuqBwVZR8GhKTwNdtov2eQ92D14jQWfWUjS/CQEq78psJeVnMXPDXnuqfOp2pFfNUmJfz+SaOb
	eijRROZbB+NRB8msjHzqq35IG/L1+mr+uxOXhVkiZn7TUafJgoy1iUF145hfEgZlboIRL5GlUCvmz
	d/+sOby0FLRLc4xMdsTNUQBn6NZe4Sz1bB+EUPU6DmAR5NTj5UHyQBGa7vGLDNomRL7Ei9djHX/sj
	Xpnq66Pzz3STwcqpv9cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXYgT-00000008nA2-1TML;
	Thu, 11 Jun 2026 06:14:33 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXYgR-00000008n8E-0WLE;
	Thu, 11 Jun 2026 06:14:32 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781158467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ss4V+l8mnf5i6k0R0ef1MTFl+m/Q+uH7niX45ju74q8=;
	b=nC9ssiMZmnQB6q7mxt5yHOD7QsdEgPh4KOBC5Xna6Mjmncguu3o9gTtbX397mar8EeQbpq
	A4mrcHazAwdML7cK23gnWfcMikiz5i9mY28doaaai1hRVTJrNOjIHEfFKqicVuXERTvLxb
	EWqci5bzGHyn/NZmMInhQPCeWaVTfZSurfpvdMJVGyp2Y7N+qIeyHsfLmtuHk+lrjZgA/4
	XLwcQHiEHteW6AgqEKOUxvo9ALYvmnjebokamnNPtWg7XGTEhWWNPNZwxtLyJ74rn+pa6u
	rOLAERS9eBoD2xfYVv/f9ifT1Mk2EUrBOhbN3cN1GQm3FW7Q8abOPDVBl4vV4w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781158467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ss4V+l8mnf5i6k0R0ef1MTFl+m/Q+uH7niX45ju74q8=;
	b=92MTl0joGPKBzVCUhKureETnSLTs8TgOxwiZ2SswSn11pFUs68rtFOWFnCH8FoE4CC1xVC
	BCV9Js8kTIHAygDw==
To: Charlie Jenkins via B4 Relay
 <devnull+thecharlesjenkins.gmail.com@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Atish Patra
 <atish.patra@linux.dev>, Conor Dooley <conor@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah
 Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Charlie Jenkins
 <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH 04/16] riscv: kprobes: Use generated instruction headers
In-Reply-To: <20260407-riscv_insn_table-v1-4-54b4736a1e77@gmail.com>
References: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
 <20260407-riscv_insn_table-v1-4-54b4736a1e77@gmail.com>
Date: Thu, 11 Jun 2026 08:14:27 +0200
Message-ID: <87mrx1eh8c.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_231431_299245_A25016FA 
X-CRM114-Status: UNSURE (   3.65  )
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

Charlie Jenkins via B4 Relay
<devnull+thecharlesjenkins.gmail.com@kernel.org> writes:
>  bool __kprobes simulate_c_jr(u32 opcode, unsigned long addr, struct pt_regs *regs)
>  {
> -	return simulate_c_jr_jalr(opcode, addr, regs, false);
> +	unsigned long next_addr;
> +	unsigned long *regs_ptr = (unsigned long *)regs;
> +
> +	next_addr = regs_ptr[riscv_insn_c_jr_extract_xs1(opcode)];
> +	instruction_pointer_set(regs, next_addr);
> +
> +	regs->ra = addr + 2;

c.jr does not change ra.

> +	return true;
>  }

We have CONFIG_RISCV_KPROBES_KUNIT now, please try that.

Nam

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
