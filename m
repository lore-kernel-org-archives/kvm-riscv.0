Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB88C56207
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 14:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jTxumGBOok5NcY5nCnlBCuLDgyWeufFfd9jmNjMap2I=; b=GgtSaFOHWxXkEU
	uDKIajU2PZPEDfX7xZ6YdtkqDnLDzhPi4ySMqJLt6vcqFwfDa4qEXUjIeIq1Rvuejyq3JFFlHvF3r
	sOS49q939Ir8DSepbY2ScrEp/tJKQt763BMNtwji26RICdC4VX5rjskwnyVsOeqj+E+CwIljq32Qj
	sjfyYNoxNxbr2ioyXXLy2Yvo32pMpoOl4XEeZEhchGk8t27rhGyRo1BgfzFlF/3KVcRuyE9ifcna0
	04xpoWg4Xs+ClyixreNpa5sxTvOHJkyTuz1HQGE6acxofn1PUkWFE4tyPjdXjnJC5wUTKhyMXucKZ
	rE4+LX7rQf0+csRrzmuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzLb-000000061KG-1qvy;
	Thu, 06 Aug 2026 14:45:27 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzLW-000000061IV-0ukY;
	Thu, 06 Aug 2026 14:45:23 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786027515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V4IJ9dPDD7ujYacDqxd6wmTgSCWh3iQS9y0EGvh2GbM=;
	b=vvnHQqf3CT+6tyZkkqRjo305rMXFVOTYizwgBBjon871om9RhAeTKor7f16ybGiZ+IBB18
	j//jk43lis2FapI6XrbVQiTUneINt+CSUdeWA79iRIx7nohBHfl0oXGS3ZeUfF/fBET5t5
	ZV0pNtHwdGa1yUKt0p8occEA4Z7lrFoMVGCCLYUfm8/U+etH/UX6LdIjuPxAaBG5iN4PZi
	/vlQO6/szB68C/PhNXoOkmXve5oReOzuCWNWQYRKKmqkasuj7sSwsOZBt5QYya8PclYhCE
	FGQwlwqC07R0oO8lnDGKRlmnui8EKc7pws+AfZvngZTeRkUuKYTH1QM7pFLcYg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786027515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V4IJ9dPDD7ujYacDqxd6wmTgSCWh3iQS9y0EGvh2GbM=;
	b=AcpzuNgtrbHDTMJgMUKgJzmAcIDRwIgOVNK+kvTRFlFG7yIbIfSnNmqR4eeucGYkSFmgKw
	05ykDSXTKOFICLBQ==
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
Subject: Re: [PATCH v3 08/17] riscv: Use generated instruction headers for
 misaligned loads/stores
In-Reply-To: <20260707-riscv_insn_table-v3-8-3f8e5f75ba97@gmail.com>
References: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
 <20260707-riscv_insn_table-v3-8-3f8e5f75ba97@gmail.com>
Date: Thu, 06 Aug 2026 16:45:14 +0200
Message-ID: <87a4qzcnph.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_074522_403178_9C8C2CDE 
X-CRM114-Status: UNSURE (   8.32  )
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

Charlie Jenkins <thecharlesjenkins@gmail.com> writes:
> -static int handle_scalar_misaligned_load(struct pt_regs *regs)
> +static noinline int handle_scalar_misaligned_load(struct pt_regs *regs)

Why noinline? I heard that compilers are usually better than human at
deciding which functions to inline.

> +	if (rd) {
> +		if (!fp)
> +			*(unsigned long *)((unsigned long *)regs + rd) = (val.data_ulong << shift) >> shift;
> +		else if (len == 8)
> +			set_f64_rd(rd, regs, val.data_u64);
> +		else
> +			set_f32_rd(rd, regs, val.data_ulong);

Why if (rd) condition? What if the instruction is loading to f0?

> +		rd = (8 + riscv_insn_c_sh_extract_xs2(insn));

Having to remember when to +8 is error-prone. Does it make more sense to
do the +8 inside riscv_insn_c_sh_extract_xs2() and the likes?

> +	if (rd) {
> +		if (!fp)
> +			val.data_ulong = *(unsigned long *)((unsigned long *)regs + rd);
> +		else if (len == 8)
> +			val.data_u64 = get_f64_rs(rd, regs);
> +		else
> +			val.data_ulong = get_f32_rs(rd, regs);
> +
> +		if (user_mode(regs)) {
> +			if (copy_to_user((u8 __user *)addr, &val, len))
> +				return -1;
> +		} else {
> +			memcpy((u8 *)addr, &val, len);
> +		}
>  	}

Again, why the if (rd) condition? What if it is f0?

Nam

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
