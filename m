Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AE7606A325
	for <kvm-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 07:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yTgtSedi;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=wLzpbgMd;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=i7OvvaGZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iFM5SKiCAugtSaP5n08v+MjVc4UNfxRObcmOrYbioz8=; b=yTgtSediKRnoWwy8kjWGCF8QmN
	crwo4BSRp8UJ/W6u6oNhtx3ZagRe3XtAoZiMA9/4/5JAiVtJfJHG0L/pfj5iLy9diFBBrXsRef6qM
	xTeq759voc7jaJrH18YGoLqkohW5SVw0O/Nvzr2EewOR/nWtor9gzsX+ORauGE4IQeZWDoUSxxpYb
	Vj9grvPNoQVQ7TI6cQc3COJ8ZJc1Kshl4afZVv7eit9R5RkDLhWkNRHIrkvwE0ZwcUsaJeSympBV9
	t6SRAhli8aSA9U+RBF+xBX2EjxMVM7s0DDrIKYfI0KvR3TjhXH9U1p/N9A/ilkJwPIv2TPOxebxXT
	xZ0GghQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZrB-00000007yrn-2kq5;
	Wed, 18 Nov 2026 07:13:25 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZr8-00000007yqX-2PzU;
	Wed, 18 Nov 2026 07:13:24 +0000
Date: Wed, 18 Nov 2026 08:13:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794985997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8pB+MXPNtH9n1jK/JmpiYpmW0motvJ1fOUd08yC+k48=;
	b=wLzpbgMdmN1snhABK51fJE0hhG87MbcpKkOXh8RBHFftRMW2bTofPHTFD4FNmaEpkOG84N
	tOyICaCBvc+wl88K1KiwhCyg9W4NOpxL81mmWTnYhJOExB8rWr7Dvv4nOTpLc5JspN9xaq
	0UTXkvQ+VT3PgET8DALpawp+ef/JQ4YuJZQK8sNXJAd+Z+qjL4B2Um6pWU3gg7q6CAFOOw
	A6eo+E4PXAjgTbmsh5Hr1EitsrL13B1q6aSfTQ5pINc36L8qfSGIOCUj31MbKrh271VGdn
	bgRi2Cu907bpMvs6yZt+7Om5P/Dytc/UCbmsWFLsllwI2TsN+rmxa7cBq7xZhQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794985997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8pB+MXPNtH9n1jK/JmpiYpmW0motvJ1fOUd08yC+k48=;
	b=i7OvvaGZhMMfJFYOaboeajhrsvueAErjBNBKv+3b9msb0fwcQnWLXZ2yUaOa1lHyP9M3/I
	8Jr+H67IMA0LulAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Koichiro Den <den@valinux.co.jp>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] RISC-V: KVM: Run vCPU timer callbacks in hardirq context
 on RT
Message-ID: <20261118071314.NJWhnli-@linutronix.de>
References: <20261118062104.2912910-1-den@valinux.co.jp>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261118062104.2912910-1-den@valinux.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_231322_790088_31573730 
X-CRM114-Status: UNSURE (   8.06  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-18 15:21:04 [+0900], Koichiro Den wrote:
> On hosts with Sstc, kvm_arch_vcpu_load() cancels the vCPU wakeup hrtimer
> with preemption disabled, including when called from sched-in preemption
> notifier. The vCPU reset path also cancels the timer under get_cpu(),
> with or without Sstc.
> 
> On PREEMPT_RT, these callbacks run in softirq thread context, so
> hrtimer_cancel() may sleep waiting for a running callback, which is
> invalid with preemption disabled.
> 
> Let the callbacks run in hardirq context on -RT. They only rearm the
> timer, update interrupt state under a raw spinlock, and kick the vCPU.
> Similar to commit 9090825fa997 ("KVM: arm/arm64: Let the timer expire in
> hardirq context on RT").
> 
> Cc: stable@vger.kernel.org
> Fixes: 3e1d86569c21 ("RISC-V: KVM: Add SBI HSM extension in KVM")
> Fixes: 8f5cb44b1bae ("RISC-V: KVM: Support sstc extension")
> Signed-off-by: Koichiro Den <den@valinux.co.jp>

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
