Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DAAC561E6
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 08:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tLpUuZ9T2kuM9i+PSf1Lw5fY4x22lqQxs6Pp89WarzI=; b=242Q8EH1Rf/u3Z
	ruoOkFHFT/ytkbt3QFndRJ+AG2gxszL4omvxFzRtdEDX8gyMwis/zkCbHRaFArGWOJLdtTGxHE285
	thDPvw1RbEjVaayGnkMCT6O6RaurfBHxH1Vn4KJaArylRHB9mouIM7ac+YFVBrBXWymULO8ASW49T
	hBM2u2JaVZu1vgUuEMV7dXyd9Q2FHqo4k6/xhNqer1FC8vlV2GPrwrdhyO7XZEaB96brFVlRncIlI
	Iz/MtGFul2L8sZoj0HhYef7c3j3EP9CIwakUGsu61mBGqCzFelwCx27fD6WM5mRTtzhrD5iMdIrbk
	WixJHeTMjm4Y25aHYEag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtNn-00000005DeM-0gMt;
	Thu, 06 Aug 2026 08:23:19 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtNk-00000005Ddi-3I2S;
	Thu, 06 Aug 2026 08:23:18 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786004594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i1hzS6FheJp1n77P4UsaZHsQqZI4eItJ8gjMhgc47M8=;
	b=3FYghH40fpnYDZWlmZ5jI+mrrcv4UDui7sPgWAvIGC1R+RhqVEyN+IbSoWLF0eyD98/kOH
	NuidWmexSUOfU4h69r3BwVXpNWdoGqOc8OWkIz0unT68FIEfo2lKjlOlwXoDr7vpARGaQJ
	wL8JFewZjCbNum2G97CR/niKt320DOlzcaMDY0rp3l4nXLywF+D7JXMSbn1ixNGs0XUhCG
	Not+bog+FU4+SX+LM9gS/JBeLX7bZ6sBy3NAjj0wpuFzj+vx/DlHybx3589cWD9Krwbduh
	pHeMfFiM0/fbR/IIqhGD+R3CUFjOEmEXM87fuqAcqCxhcNXeFnyHYhDBiTJsiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786004594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i1hzS6FheJp1n77P4UsaZHsQqZI4eItJ8gjMhgc47M8=;
	b=hKbqMjrj7aHywt4MUgZoaZH3RBSlIY18taYCwQo7M8SVh8PvJzopR45pwn3et1EjPw6KUK
	RBnBkYeqRVOBLVAg==
To: Charlie Jenkins <thecharlesjenkins@gmail.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Atish Patra
 <atish.patra@linux.dev>, Conor Dooley <conor@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah
 Khan <shuah@kernel.org>, Radim =?utf-8?B?S3LEjW3DocWZ?=
 <radim.krcmar@oss.qualcomm.com>,
 Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Charlie Jenkins
 <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH v3 04/17] riscv: Add kprobes instruction simulation KUnit
In-Reply-To: <20260707-riscv_insn_table-v3-4-3f8e5f75ba97@gmail.com>
References: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
 <20260707-riscv_insn_table-v3-4-3f8e5f75ba97@gmail.com>
Date: Thu, 06 Aug 2026 10:23:12 +0200
Message-ID: <87ldajd5e7.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_012316_959825_69709A62 
X-CRM114-Status: UNSURE (   7.89  )
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

> +		} else if (riscv_insn_is_c_jr(i)) {
> +			u32 rs1_index = riscv_insn_c_jr_extract_xs1(i);
> +
> +			simulate_c_jr(i, addr, &regs);
> +
> +			KUNIT_EXPECT_EQ_MSG(test, regs.epc,
> +					    riscv_insn_reg_get_val((unsigned long *)&regs,
> +								   rs1_index),
> +					    "c.jr instruction (0x%x) incorrectly simulated", i);

Should we set a value to rs1, just like everything else?

> diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes.h b/arch/riscv/kernel/tests/kprobes/test-kprobes.h
> index 537f44aa9d3f..7a672de8f130 100644
> --- a/arch/riscv/kernel/tests/kprobes/test-kprobes.h
> +++ b/arch/riscv/kernel/tests/kprobes/test-kprobes.h
> @@ -19,6 +19,12 @@ extern void *test_kprobes_addresses[];
>  /* array of functions that return KPROBE_TEST_MAGIC */
>  extern long (*test_kprobes_functions[])(void);
>  
> +void test_kprobes_arbitrary(void);
> +
> +extern unsigned int *test_kprobes_arbitrary_addr;
> +
> +extern unsigned int *test_kprobes_c_bnez_addr1;
> +

Are these declarations used somewhere?

Nam

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
