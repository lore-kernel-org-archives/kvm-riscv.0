Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D987CA0ED1
	for <kvm-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 17:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=T3foFmBNQddV1m4sNjiZRxXa+iTDHfNvR5bKNmENwm0=; b=NLWbpya54zscdShv6XWNh2Fr2G
	7OJx4N28/aJOnCq2BrkbGTQOA1FI8Rimql3xfEaFU3B2GsIAGDCu9cbTuCSLyGCJa2toM0EzlHKNF
	qQLphUqQL6I2Rr2pgiMT0VdG5kZOgbWaEIxmxqlBCogr/Ym1TiiTIhM9qHUtR8BxcaVIIJj4MOBhy
	z3m9btXoM9Spshyawp0Zdjxs0Altq+A3FImbHaqbdTthEV9gaKYLHtQlsQ7A5+eqXDkPWssKdABNd
	e0ovyg/9krr/H3Od9RFJaDzGhSXCtmEVsvNJiVQ1FfVy4K8aJ6suuoWm/WbvkExRewF1uV4gXzYx+
	eYGHOGFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umyAt-000000036um-394n;
	Fri, 15 Aug 2025 17:25:07 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwiR-00000002t3h-0hmu
	for kvm-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 15:51:40 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-244570600a1so24406785ad.1
        for <kvm-riscv@lists.infradead.org>; Fri, 15 Aug 2025 08:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755273098; x=1755877898; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yLuuQdqXBRGyu60+ieS//bbxP+3AVwFN22YqAdloirM=;
        b=F4mzm3Lxw/Tj8v2La2Id+HmSTCUEITsVpZi32bBnyjpIBebdPlU4fT8Ei1WvnQMSs/
         wmXg2SxAFecEnUZ7KM8IXVTMbq2GJzg7285Mb4HOEr4n7sI79RWP5lDvf/PYweY+jg8f
         Cuc2uaIqyMfettuUw5WngL23J98ptqJE3SpyUIc/Bq0iBw4RXLqXqOpQ7McpdD2Di6KS
         CJZXzbTNgp2BKpDDsIFygBjNp1Li7c67Z1482vnyoYPdrh5nRZXa6lJOmmqqxAIWtuAz
         YDYQfNOqsiEqf4/pSMNnhBkz7EofKh7t9T5Oli6aMbuabLVENjxDJcesVfut1GP9e4LZ
         lMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755273098; x=1755877898;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yLuuQdqXBRGyu60+ieS//bbxP+3AVwFN22YqAdloirM=;
        b=vlyci/sigdV3a2rHDPTlPS30sxcfA+RQRdejxUilCy9bD2s3o2AnMUqeeP2QQZvlSG
         5pTrXC7hwI8APWL8ZLt3MI41LH+5VeC7wh1zaDi/EuKwzmfVAnWVumTTRI0kQz5CvVEp
         hRMjaRL4/SzlYwcenJe6p7iMmxYuBaIDJCvkoW8C11fWdmeOOBnrRkCMD4IZTvIheSY0
         eM4SlF/mh08dYzP7PNvG1p+uFzK4Zana2R4WrEaRLQnvOTzGororuHbILmF281eKNNwX
         3qYJdeNTeqXsHRzJ7R1EH2PI4DlKmnUP661ksdJsn8CdckhgIpq3y1Cs1IGVbRUHv74T
         qyFA==
X-Forwarded-Encrypted: i=1; AJvYcCVI0Rb9Fd0ttiHX0AhDeCTsPRKQlTgdNTo0A66by+2LooMpwKs+9KjbgTCTwcLBDWGBJZIoE2PLPO8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yznci2P6bAGc03640bO3A20gC42SvU+WcfaldMihDqOg7HiLfO6
	L44yY83HEninee7n+5KUgSlwrJ728GUOiiwXI3HKuno7cT3BFjYDihFbzA+RJ4vCk766GHfvJDC
	tUNq63Q==
X-Google-Smtp-Source: AGHT+IEixUUF/+ontXG1UvvxuaP113HP3iSlTpnTS0Og0gwZnRo8djp+nSrKI0cvN3mMbDgB4JtBQNij17k=
X-Received: from pjee7.prod.google.com ([2002:a17:90b:5787:b0:321:c2d6:d1c3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cec3:b0:244:5aa5:a8b
 with SMTP id d9443c01a7336-2445aa50e20mr99042625ad.27.1755273098085; Fri, 15
 Aug 2025 08:51:38 -0700 (PDT)
Date: Fri, 15 Aug 2025 08:51:36 -0700
In-Reply-To: <20250815130436.GA3289052@noisy.programming.kicks-ass.net>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com> <20250806195706.1650976-10-seanjc@google.com>
 <20250815130436.GA3289052@noisy.programming.kicks-ass.net>
Message-ID: <aJ9XiAa58oMs55Ky@google.com>
Subject: Re: [PATCH v5 09/44] perf/x86: Switch LVTPC to/from mediated PMI
 vector on guest load/put context
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Kan Liang <kan.liang@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>, 
	Mingwei Zhang <mizhang@google.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Sandipan Das <sandipan.das@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_085139_209851_EDC7AEE0 
X-CRM114-Status: GOOD (  13.22  )
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

On Fri, Aug 15, 2025, Peter Zijlstra wrote:
> On Wed, Aug 06, 2025 at 12:56:31PM -0700, Sean Christopherson wrote:
> 
> > @@ -2727,6 +2739,21 @@ static struct pmu pmu = {
> >  	.filter			= x86_pmu_filter,
> >  };
> >  
> > +void arch_perf_load_guest_context(unsigned long data)
> > +{
> > +	u32 masked = data & APIC_LVT_MASKED;
> > +
> > +	apic_write(APIC_LVTPC,
> > +		   APIC_DM_FIXED | PERF_GUEST_MEDIATED_PMI_VECTOR | masked);
> > +	this_cpu_write(x86_guest_ctx_loaded, true);
> > +}
> 
> I'm further confused, why would this ever be masked?

The idea is to match the guest's LVTPC state so that KVM doesn't trigger IRQ
VM-Exits on counter overflow when the guest's LVTPC is masked.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
