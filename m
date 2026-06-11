Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC56CCD98CE
	for <kvm-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 06:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rzc83tyHDRXlokuRQumVPy+wJpVx6LxtStDVOLXzY+k=; b=f1weTWCRfLmky/
	3cZ0usq5RKqCwTuMM7jBUnvn7+DDDZR1jogjbfjsPNVRdEN2FdWJCjgxiVjgSZR3vZnp8nw940e+q
	7+HrK7yufWmqn2e8X4ZUSLi20snZ1UAzhqriCqj2HjW5H0sESCckeqQt8XZxFV7XsqFuRQPdM+z/c
	BfR6nYYu8TZ8LfhynBdgOf7k7QPrEWlyO3Iena5YLZyrXzER4pY9dWOqg/yMqXiaJb92i6JiiZGYf
	KQlGhMWb0jtFz65gB9ZkmhsYzGDgOcZq86zsjT+Rm+ClURFE78kurj16XYhuSe6hVdPsIFhwhXljo
	HEvFD0rExlN8LcsCRqDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXYan-00000008mVE-0x7Q;
	Thu, 11 Jun 2026 06:08:41 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXYal-00000008mUi-09Bj;
	Thu, 11 Jun 2026 06:08:40 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781158116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z2N870od5dbjdxJsDLvMUG2Jj7B/cBTMlD10x/Fp9YA=;
	b=U3P0PQAZcOs4DKD8mWRTVpkHZEs0WFNFuoLwloC7pnNcuqgYlw90J28+42/iuYQD2Dkee6
	ziCaCEKYimlTRTF06vVP+ebJU/T7LthjmujbqRF7j9shg6tiROyTKRAtWERJ6tkFHlorNX
	gBPUNWxz2L9By1mODgzY+MTNQxLQXPbTKRDSk+lkKJU2ZMXDG7k/qSS0HeEzJbYcDXuT93
	bAadlqxY0jkuDB+OJzhpaNiMwjrrJ5VxmdFxtOucyvr1JcpOhsHbuC/3DZdNhMiuyukJXc
	lWZBMzCMnp2rd8hpxnSAbUWyDlbl5dBY6mdbtPfk1IPkaHcFB29aaefLU/jzBQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781158116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z2N870od5dbjdxJsDLvMUG2Jj7B/cBTMlD10x/Fp9YA=;
	b=PDWstf/CDMJGJqVyGfRsqfzxtCs8JjSX1BNIaweI8CHW4iQ5o458ziY2pDQmMdOQEnYDuX
	7hxO8TvYay6RiPCQ==
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
Subject: Re: [PATCH 03/16] riscv: kgdb: Use generated instruction headers
In-Reply-To: <20260407-riscv_insn_table-v1-3-54b4736a1e77@gmail.com>
References: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
 <20260407-riscv_insn_table-v1-3-54b4736a1e77@gmail.com>
Date: Thu, 11 Jun 2026 08:08:35 +0200
Message-ID: <87pl1xehi4.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_230839_219416_AC9D9B6E 
X-CRM114-Status: UNSURE (   2.96  )
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
> +#define riscv_insn_branch(_insn, regs_ptr, _opcode, _pc, _comparison, type)     \
> +	({                                                                      \
> +		unsigned long _ret;                                             \
> +		if ((type)riscv_insn_reg_get_val(                               \
> +			    regs_ptr,                                           \
> +			    riscv_insn_##_insn##_extract_xs1(_opcode))          \
> +			    _comparison(type) riscv_insn_reg_get_val(           \
> +				    regs_ptr,                                   \
> +				    riscv_insn_##_insn##_extract_xs2(_opcode))) \
> +			_ret = riscv_insn_##_insn##_extract_imm(_opcode);       \

Should be
		_ret = _pc + riscv_insn_##_insn##_extract_imm(_opcode);

> +		else                                                            \
> +			_ret = _pc + 4;                                         \
> +		_ret;                                                           \
> +	})
> +

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
