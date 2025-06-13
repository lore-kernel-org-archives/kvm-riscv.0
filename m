Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128DFC71136
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 21:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BCuqSqqV+yp7bF1wZEIzByO4B/LLEJscvDqtYclWO7k=; b=t7eXbbd5EvlyVg
	4P0K2JdAufXPL7rVOlilax3Nm8jdcZjY+Mk42HR0LvoPuAn4GjpBQyDL4VQUnyZBlJlEh6je3jbIU
	IsOs2R1Mifi0YogEztaTj+jAoJstt9GewAuc9aQjXQ/3HVWkIZaHBPFjKpno4Uq+vvvGNPKvEiJGw
	ofWhrNMU4jvPFh3YbzV40E9yxlgt/rUCo+QCV26tFKv1BW2MHPx8c8954TbEHrZbnJMcy/lR+Gfxg
	DQBT3fK/f289x13YpafcYXx0iwlznE1BkIqFp3KJeP+L9yOG3zn1A6tQ/KC6nHdKzQSfsySIV0pIG
	q7lY7ByfpW4i/9htGqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBaD-000000003yR-2uRR;
	Fri, 13 Jun 2025 21:05:05 +0000
Received: from out-176.mta1.migadu.com ([2001:41d0:203:375::b0])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBYG-000000003ac-41Wl;
	Fri, 13 Jun 2025 21:03:07 +0000
Date: Fri, 13 Jun 2025 14:02:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749848582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UYPjxyG6Lkdruehl3Wfp/fvOgutsisDdZvGlZZakKgQ=;
	b=Kc8nPVhlXgf6TePD1ArgM60c5dmNUT/R1JjVbnGxN7TexwkvkpcVz2WLId55A9oZ/CDUE5
	FbP2i2FSaWw7NAS2SkcnbcgK6HWEZ0xCShW/gxdnuC/LY4NPQptRcXYiWmJk0yYg54tCZA
	FkggVzxEL64vxvaUGTfILfyirGgdhDI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Anish Ghulati <aghulati@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/8] KVM: Remove include/kvm, standardize includes
Message-ID: <aEyR_bixN696F1sP@linux.dev>
References: <20250611001042.170501-1-seanjc@google.com>
 <125bfa5b-4727-4998-a0da-fb50feec6df6@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <125bfa5b-4727-4998-a0da-fb50feec6df6@redhat.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_140306_096754_3CDE62C3 
X-CRM114-Status: GOOD (  11.56  )
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

On Thu, Jun 12, 2025 at 06:56:53AM +0200, Paolo Bonzini wrote:
> On 6/11/25 02:10, Sean Christopherson wrote:
> > Kill off include/kvm (through file moves/renames), and standardize the set of
> > KVM includes across all architectures.
> > 
> > This conflicts with Colton's partioned PMU series[1], but this should work as
> > a nice prepatory cleanup for the partitioned PMU work (and hopefully can land
> > sooner).
> > 
> > Note, these patches were originally posted as part of a much larger and more
> > agressive RFC[1].  We've effectively abandoned upstreaming the multi-KVM idea,
> > but I'm trying to (slowly) upstream the bits and pieces that I think/hope are
> > generally beneficial.
> > 
> > [1] https://lore.kernel.org/all/20250602192702.2125115-1-coltonlewis@google.com
> > [2] https://lore.kernel.org/all/20230916003118.2540661-1-seanjc@google.com
> 
> Marc, Oliver, I'd like to commit this to kvm/next sometime soon; I'll wait
> for your ack since most of the meat here is in arch/arm64.

Let it rip, just to get ahead of potential conflicts can you push out a
topic branch?

Acked-by: Oliver Upton <oliver.upton@linux.dev>

Thanks,
Oliver

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
