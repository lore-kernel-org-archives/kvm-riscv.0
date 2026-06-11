Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29505CD98C6
	for <kvm-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 05:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cAfjg0mT0JqLgjOBPKdDjikqtGCGQF+LL3F9LM9NQ3M=; b=qsTF3JHGQvViN+
	JkVKjYNQQh46Js2A/soTMBRo4y2w1w09poLGE8+OQT5YKrI+6Ayf7ZrGSf4sKgj8nnML19/OqbA3A
	bM+oknWo84DYQji7sWm1IGFGwbzfEmc9QkH0PtM93BQ9od+Gzrg8i4opZLaWUbYZ6hGdsgRz+b5Cp
	Y4Rt6Axwy6pL/JWitKb9EYSkO/SefRkvrWv5XnyDQHeagJeOJMwY1UX+k5/GUBE2hDBoyU7qutrFg
	c7zkvylUJHBfhM9Lsiyv2+N8h5uY/eLx6kL9HfFag5UmA2d0OGHbIKG/xWw/wWfnQKFpqm1CL+47I
	O6fYV9Sro3HDBYka74TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXXrO-00000008ioj-3A6y;
	Thu, 11 Jun 2026 05:21:46 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXXrM-00000008ioN-18mP;
	Thu, 11 Jun 2026 05:21:45 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781155298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pxZrj3HZL3fhz45xiVff8+rxIRxk0wNsp5NDbhPArlI=;
	b=aQzCTui0vIILvBLiJ6c+wEedWOf1pg+UetUx3mJQd/3OCbhPCyC/7p99cIGbjKgoJbxeMJ
	RvZqYgQwQFmC5CqTD+p42o+nd8/IV56U9kBsGlgsljW4/EmiHlyE08zJwlpzKtucjsQTH2
	rEJEjOzYg4y7RDE+33fQm7bKo99nmPtAfJtfGnHRx8CfIAXiBKPibOszPxJ5R9VMvrAzqv
	cRKzAmPGIbpXjmJYkNqeuRTchJRuKCXXrSf/oOJdgegFvGyzXK6jp82DFjbqWEtEXJ4e+C
	Ed5pEg0YR/GG/tIVoc+km7DO9PUvOfGDB+PARYYG7MGDLtyslxaUlED8pLbDSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781155298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pxZrj3HZL3fhz45xiVff8+rxIRxk0wNsp5NDbhPArlI=;
	b=fHWDIlZdzOiLKfXOL42qehPTjVZemfYb8XJAOT676l7OxGd2A/3JPDZzKUvv/Wqp1V95b2
	AtIF3KGM8zBcLRBw==
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: Charlie Jenkins via B4 Relay
 <devnull+thecharlesjenkins.gmail.com@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Atish Patra
 <atish.patra@linux.dev>, Conor Dooley <conor@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah
 Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 01/16] riscv: Introduce instruction table generation
In-Reply-To: <aioJ_5SIXdGQg55R@blinky>
References: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
 <20260407-riscv_insn_table-v1-1-54b4736a1e77@gmail.com>
 <878q8m1j9y.fsf@yellow.woof> <aioJ_5SIXdGQg55R@blinky>
Date: Thu, 11 Jun 2026 07:21:37 +0200
Message-ID: <87se6tejoe.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_222144_479110_88492435 
X-CRM114-Status: UNSURE (   9.49  )
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
> This is a weird one. The Ziclsd extension introduces it for RV32[1]. All
> of the data is generated from the riscv-unified-db and because it is in
> the Ziclsd extension, c.ld is included for 32-bit in the c.ld
> description [2]. 

Oh :( We probably should amend the base spec to mention that.

>> > +        compressed_name=${name##c.*}
>> 	   ^^^^^^^^^^^^^^^
>> 	   this name is misleading
>
> That's fair, I can rename it to be something like "compressed_inst"?

My issue is that "compressed_name" indicates that it holds the
compressed variant of the name. But it actually is empty if the
instruction is compressed, otherwise it is the original instruction name.

I am not sure what is a better name. Perhaps just inline this to the
usage below.

Nam

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
