Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1C9C369DC
	for <kvm-riscv@archiver.kernel.org>; Thu,  1 May 2025 13:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AE8MHS/WgpDgepXEq8dAJkNMvQQiS/pE+GaoAN9zO3s=; b=ruohRuTXXQZ5fG
	UCBUoioTS45R/B4fYbLSfBcxoyJ84kRXyS3vOvh2wlPk+fsNL2LUsHp+1rco9CtLN0iyU2BWcPFJJ
	x0uIVQUj+ikvGFTB92VXPYcXBV0nn6llrG/yJR5Qjvue1c61dRyrdbZomd3O1cwPVYw6B9a47yH0z
	rF22jXxcStnJysY7BvM4XCDBCw0jm2yFpwFxmMI0leqQR6oXaFvJil4jj4izT/V9Dmvst3ZjPowne
	1Y1KNiPzhYPo4NIuoBasSVAqkAVXMqAT++O6DGkt4lwCknKRcciAGM7FA/+yshdPJdcLBoXzKRILD
	HHijmUyJQd5w4ZBKt68g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAUAU-0000000FrBr-2Sqo;
	Thu, 01 May 2025 13:41:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAUAT-0000000FrBJ-12zt;
	Thu, 01 May 2025 13:41:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xowpOTNHZuGO7hdiOZBA1ktd0ANINI9wdxjSaNfAYr4=; b=Q9FCL2T2yxtlsZmsHNZUwJ8del
	DL8laA78CDwP4h6JIEK8DYCPbAEn5jqEbbLSZWIhOKuDrIy1I6OqTo9KD9RydEXs9LtTQP7JwdVeq
	4saOXLHsvs5AkFnJ22A0h3WN+8CgiXYNQ/0f8sG5/dYNuYkLxnqAaR+vvCg/5l2w8jZZCo7FHKQiW
	f288JWqa60gzVN2mzNjAgCr3QbhjMXdNy9WwPnwoi3VTWwB8wMrcCtefnZGM/Bk0zwdWtETejY/nF
	8yoxbchPCJPBA6ar0KmslCX7gVXF+rtiSA7clAWpkSlgnj6PDZkABXJr1Y2KN+tXGm4cSTkn3K4kE
	LaXMEXvg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uAUAJ-0000000E13k-38FL;
	Thu, 01 May 2025 13:41:28 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2B30630035E; Thu,  1 May 2025 15:41:27 +0200 (CEST)
Date: Thu, 1 May 2025 15:41:26 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Kunkun Jiang <jiangkunkun@huawei.com>,
	Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Boqun Feng <boqun.feng@gmail.com>, Borislav Petkov <bp@alien8.de>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Potapenko <glider@google.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Andre Przywara <andre.przywara@arm.com>, x86@kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>, kvm-riscv@lists.infradead.org,
	Atish Patra <atishp@atishpatra.org>, Ingo Molnar <mingo@redhat.com>,
	Jing Zhang <jingzhangos@google.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, kvmarm@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	Keisuke Nishimura <keisuke.nishimura@inria.fr>,
	Sebastian Ott <sebott@redhat.com>, Shusen Li <lishusen2@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sean Christopherson <seanjc@google.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v4 2/5] arm64: KVM: use mutex_trylock_nest_lock when
 locking all vCPUs
Message-ID: <20250501134126.GT4439@noisy.programming.kicks-ass.net>
References: <20250430203013.366479-1-mlevitsk@redhat.com>
 <20250430203013.366479-3-mlevitsk@redhat.com>
 <864iy4ivro.wl-maz@kernel.org>
 <20250501111552.GO4198@noisy.programming.kicks-ass.net>
 <861pt8ijpv.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <861pt8ijpv.wl-maz@kernel.org>
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

On Thu, May 01, 2025 at 01:44:28PM +0100, Marc Zyngier wrote:
> On Thu, 01 May 2025 12:15:52 +0100,
> Peter Zijlstra <peterz@infradead.org> wrote:
> > 
> > > > + */
> > > > +int kvm_trylock_all_vcpus(struct kvm *kvm)
> > > > +{
> > > > +	struct kvm_vcpu *vcpu;
> > > > +	unsigned long i, j;
> > > > +
> > > > +	kvm_for_each_vcpu(i, vcpu, kvm)
> > > > +		if (!mutex_trylock_nest_lock(&vcpu->mutex, &kvm->lock))
> > 
> > This one includes an assertion that kvm->lock is actually held.
> 
> Ah, cunning. Thanks.
> 
> > That said, I'm not at all sure what the purpose of all this trylock
> > stuff is here.
> > 
> > Can someone explain? Last time I asked someone said something about
> > multiple VMs, but I don't know enough about kvm to know what that means.
> 
> Multiple VMs? That'd be real fun. Not.
> 
> > Are those vcpu->mutex another class for other VMs? Or what gives?
> 
> Nah. This is firmly single VM.
> 
> The purpose of this contraption is that there are some rare cases
> where we need to make sure that if we update some global state, all
> the vcpus of a VM need to see, or none of them.
> 
> For these cases, the guarantee comes from luserspace, and it gives the
> pinky promise that none of the vcpus are running at that point. But
> being of a suspicious nature, we assert that this is true by trying to
> take all the vcpu mutexes in one go. This will fail if a vcpu is
> running, as KVM itself takes the vcpu mutex before doing anything.
> 
> Similar requirement exists if we need to synthesise some state for
> userspace from all the individual vcpu states.

Ah, okay. Because x86 is simply doing mutex_lock() instead of
mutex_trylock() -- which would end up waiting for this activity to
subside I suppose.

Hence the use of the killable variant I suppose, for when they get tired
of waiting.

If all the architectures are basically doing the same thing, it might
make sense to unify this particular behaviour. But what do I know.



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
