Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B7ECA0EE9
	for <kvm-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 15:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0pnh3mCS064hN7NqcZ2t91vg5bVSv4Vtvs/FI8GInBI=; b=ilxtndEuJyrTB+
	pIe2I0u+3yCsUGCd+uqbQDotspVwXilucEvDgWUl8VIrPfQUTfPbUbeBCiDEVnIt5DiOKxrW+2OQo
	VJn6w3vb5DSyGsYJ9+Qcp+/aTwnRZCjRZxvH3PrGOvzSNoqXi8lVMqDwuWSYbobm59yZglFRoPpAL
	Q2Z0EJZZ4nUonSOHWoMjTE7m2IKPvbMO+bYOyb3Xy1jV3UNgQTJPaFxolAcRbRoZRN/WpANgBv3Cw
	OHjiPeA1d9UKUB/XWib1fj6Zjl6EXmz+Z12snDVsRaIPZTrx9+ssi+ibIzoxYp9qrBK9uc+LaXQ1L
	oXiobys97lGmnmyiRODg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwTi-00000002r16-1bhG;
	Fri, 15 Aug 2025 15:36:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umu6r-00000002XA3-2Bsh;
	Fri, 15 Aug 2025 13:04:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Io7/GXj4Ah5f6/agCZ8UGExu5metz9Q7I/7GBoA/u94=; b=ZKKP5mMs2Zxf5m/v7uHZhDFsiX
	mp1GPKzLskGtDNbZrpBQ2yosQFTOZGFfxIhWK0w/s0KnIWcJMkl7XNy49lpeRsAThdqmQBZzJw2OU
	kFPVd0P7sSrjifBauCNhsIXqwJEKmMQD1S2cJp0lx1/GqizN0Huj77A6AnE20Z7oSdQY87jPYDsqT
	DRL06FaFojcPXdDQ1/ptaokHnsT3TLYWiP88zJpJeZwRIJBny6Xf9T4vXgE8R7j3tOf36Z1/bUCpH
	HBGUYwGq38df2bvnMtLj9UfwM882Yb0FJeLhwAKCV4uIaq3dAayrRxEsDRjBFuhrQZRAYkC8SqPdY
	NwyK31Lg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umu6n-0000000GiIQ-386b;
	Fri, 15 Aug 2025 13:04:38 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7C219300310; Fri, 15 Aug 2025 15:04:36 +0200 (CEST)
Date: Fri, 15 Aug 2025 15:04:36 +0200
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
Message-ID: <20250815130436.GA3289052@noisy.programming.kicks-ass.net>
References: <20250806195706.1650976-1-seanjc@google.com>
 <20250806195706.1650976-10-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250806195706.1650976-10-seanjc@google.com>
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

On Wed, Aug 06, 2025 at 12:56:31PM -0700, Sean Christopherson wrote:

> @@ -2727,6 +2739,21 @@ static struct pmu pmu = {
>  	.filter			= x86_pmu_filter,
>  };
>  
> +void arch_perf_load_guest_context(unsigned long data)
> +{
> +	u32 masked = data & APIC_LVT_MASKED;
> +
> +	apic_write(APIC_LVTPC,
> +		   APIC_DM_FIXED | PERF_GUEST_MEDIATED_PMI_VECTOR | masked);
> +	this_cpu_write(x86_guest_ctx_loaded, true);
> +}

I'm further confused, why would this ever be masked?

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
