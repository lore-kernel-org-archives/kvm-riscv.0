Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A8FCA0ED1
	for <kvm-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 18:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mepwO351IA2LHZvRJe4dmWDuv+CA0zpd5kTwcU+oMCg=; b=0LGNhdb1+CDEHu
	FgLs7RU5U8m59vqvmoM8sOp4xHsba1GDLVXFzaUl40iQ486byPfTzXr85WZZVp+slSexqpL67gVBi
	t78c9f7E2BVMPRSoiLZmlhusBxfHj/KYjZl6z6h/T/wh2Jz2vrXh1bTWn6dOAbq+xiRW/v9SKZ98z
	2VeLv10sbLi41S1JH92XKCqchTTZl9y+iJlWQ5cE1X/S6W7HZzx0fj0t/5IPLsfohxDzmWkSRMWwl
	f27PfSI91oNUYIRJlvmdfm/YU/f4JlPHJRkaY7OBnw1i5wkIlYnUUkZkwuqpOceBidAYnFj231QD/
	LlUmUxSA4+mCgTFChpWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4fs-00000008Mvj-057F;
	Mon, 18 Aug 2025 18:33:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo2T1-000000080EB-3Mlb;
	Mon, 18 Aug 2025 16:12:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KmfCSi8O/XddsGKdRcKOqeDj7Pe6vE7Gax1joOuFhh4=; b=bwEc88kumrWiUkBPFis3R2xC8x
	1VSU964ojxy4pizILXyaiupvjmCF+9S/j3hMn/7+0O6Nq5XCPfRh9SWhm98h0t2UFUjmA1dzWRZgt
	tbkFmQuB/mZqY6ky3oZFaXzKbsxU61JtKuUNYn7rd7psdx+2eesyLw8rFRzpJQ1Win9JV+gpfxIJX
	B0ERXsVVo7c2wl1HSeiIdqRZ4++3ImaZyhHbocKrxLR1Y5j1GlmqWCDYwxZ0RlMOOcuzzqa8ePrTH
	qkSXaxaLa6fA1jK8eqoW/9WZ9mA8to8qlNfcQ4735MGvUb9ThF8/IOfNGNvoRXzwQSiekxnBpg4fR
	SmVuRZ6Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo2Sx-0000000HRhy-0oaa;
	Mon, 18 Aug 2025 16:12:11 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7731030029B; Mon, 18 Aug 2025 18:12:10 +0200 (CEST)
Date: Mon, 18 Aug 2025 18:12:10 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, loongarch@lists.linux.dev,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Kan Liang <kan.liang@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	Mingwei Zhang <mizhang@google.com>,
	Xiong Zhang <xiong.y.zhang@linux.intel.com>,
	Sandipan Das <sandipan.das@amd.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Subject: Re: [PATCH v5 09/44] perf/x86: Switch LVTPC to/from mediated PMI
 vector on guest load/put context
Message-ID: <20250818161210.GJ3289052@noisy.programming.kicks-ass.net>
References: <20250806195706.1650976-1-seanjc@google.com>
 <20250806195706.1650976-10-seanjc@google.com>
 <20250815113951.GC4067720@noisy.programming.kicks-ass.net>
 <aJ9VQH87ytkWf1dH@google.com>
 <aJ9YbZTJAg66IiVh@google.com>
 <20250818143204.GH3289052@noisy.programming.kicks-ass.net>
 <aKNF7jc4qr9ab-Es@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aKNF7jc4qr9ab-Es@google.com>
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

On Mon, Aug 18, 2025 at 08:25:34AM -0700, Sean Christopherson wrote:

> > OK, so *IF* doing the VM-exit during PMI is sound, this is something
> > that needs a comment somewhere. 
> 
> I'm a bit lost here.  Are you essentially asking if it's ok to take a VM-Exit
> while the guest is handling a PMI?  If so, that _has_ to work, because there are
> myriad things that can/will trigger a VM-Exit at any point while the guest is
> active.

Yes, that's what I'm asking. Why is this VM-exit during PMI nonsense not
subject to the same failures that mandates the mid/late PMI ACK.

And yes, I realize this needs to work. But so far I'm not sure I
understand why that is a safe thing to do.

Like I wrote, I suspect writing all the PMU MSRs serializes things
sufficiently, but if that is the case, that needs to be explicitly
mentioned. Because that also doesn't explain why we needs mid-ack
instead of late-ack on ADL e-cores for instance.

Could it perhaps be that we don't let the guests do PEBS because DS
doesn't virtualize? And thus we don't have the malformed PEBS record?

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
