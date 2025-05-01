Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2A4C369DC
	for <kvm-riscv@archiver.kernel.org>; Thu,  1 May 2025 12:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sxs+JFzmifb2FtiHrzy6ifDq8StUwcn6lai+XFW7Pv8=; b=UerincdI+1XFPd
	AAiO1CM0TqPnTVbDVHDwKNJNAU5K61/I80PMUKRzP+UTnfUa/3IZa5bzDq5y/hPoPDz1dn6bBzPKL
	L74INiw3SHoLrXgshojbGFJAu7TTmtpyqUz/QXVQnszJP4xoiUd7qlxGubDlwTHzRIy1Gz8uOk1Pv
	b7473wEBYiOep/Xz5mDWev1ymxqyh4u0eR/dIvYhUkbKQ6zRekMZo+UjKdISh9ERRNo8oI2Kk4Z5F
	5A771rIbIt7udlM+TbUzAwtjLZ55hWzKp+W75ZK9zbv7Cx3IR/NNKeyobbANXOkojp8BJB7LEbTWz
	ZtQjZS2C3ZbQ+mIs1jWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATTq-0000000FkC0-2ROo;
	Thu, 01 May 2025 12:57:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATHF-0000000FiqG-21ZP;
	Thu, 01 May 2025 12:44:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B208261136;
	Thu,  1 May 2025 12:44:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D40FC4CEE3;
	Thu,  1 May 2025 12:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746103472;
	bh=WPG4ItA0UQzz9G5Wed/nsDRuYNB8SmpWf7d7wvrM4Ig=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QxDjMdGBaO7OILE121xxXL/ZOnOaqCLtEBXhMWqkB+3PJ/81e/MmSvY1wUToCrhj4
	 o09UND4kIgR1FXBbOv/55FCd/OzVBwRgoBGOKRqd4tO9c5cjsRV1GlGty2ybIey98M
	 Lg+nMO5pZgEPqvPhdAFXoifIaxQoyNf5AIQ+1z0cDZWJ9kRunCBuAPEBO/FXXum7lW
	 W1LmcTN82A52L8g5iIa5Ucd/iUs8WO+yyP/I650zIl0luAwZDGv+aVLdfXY2xUanJs
	 d03TuxAlnXfTT8Rtp+TeEMdJfupvUktoh6E1sLRqamQNoOxsDebivNk/cK+bAp+RnI
	 Bf6br0mFislfA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uATHB-00AZcw-3q;
	Thu, 01 May 2025 13:44:29 +0100
Date: Thu, 01 May 2025 13:44:28 +0100
Message-ID: <861pt8ijpv.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Maxim Levitsky <mlevitsk@redhat.com>,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Kunkun Jiang <jiangkunkun@huawei.com>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Potapenko <glider@google.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Andre Przywara <andre.przywara@arm.com>,
	x86@kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	kvm-riscv@lists.infradead.org,
	Atish Patra <atishp@atishpatra.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jing Zhang <jingzhangos@google.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	kvmarm@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	Keisuke Nishimura <keisuke.nishimura@inria.fr>,
	Sebastian Ott <sebott@redhat.com>,
	Shusen Li <lishusen2@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sean Christopherson <seanjc@google.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v4 2/5] arm64: KVM: use mutex_trylock_nest_lock when locking all vCPUs
In-Reply-To: <20250501111552.GO4198@noisy.programming.kicks-ass.net>
References: <20250430203013.366479-1-mlevitsk@redhat.com>
	<20250430203013.366479-3-mlevitsk@redhat.com>
	<864iy4ivro.wl-maz@kernel.org>
	<20250501111552.GO4198@noisy.programming.kicks-ass.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: peterz@infradead.org, mlevitsk@redhat.com, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, jiangkunkun@huawei.com, longman@redhat.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, bhelgaas@google.com, boqun.feng@gmail.com, bp@alien8.de, aou@eecs.berkeley.edu, anup@brainfault.org, paul.walmsley@sifive.com, suzuki.poulose@arm.com, palmer@dabbelt.com, alex@ghiti.fr, glider@google.com, oliver.upton@linux.dev, andre.przywara@arm.com, x86@kernel.org, joey.gouly@arm.com, tglx@linutronix.de, kvm-riscv@lists.infradead.org, atishp@atishpatra.org, mingo@redhat.com, jingzhangos@google.com, hpa@zytor.com, dave.hansen@linux.intel.com, kvmarm@lists.linux.dev, will@kernel.org, keisuke.nishimura@inria.fr, sebott@redhat.com, lishusen2@huawei.com, pbonzini@redhat.com, rdunlap@infradead.org, seanjc@google.com, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Thu, 01 May 2025 12:15:52 +0100,
Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > > + */
> > > +int kvm_trylock_all_vcpus(struct kvm *kvm)
> > > +{
> > > +	struct kvm_vcpu *vcpu;
> > > +	unsigned long i, j;
> > > +
> > > +	kvm_for_each_vcpu(i, vcpu, kvm)
> > > +		if (!mutex_trylock_nest_lock(&vcpu->mutex, &kvm->lock))
> 
> This one includes an assertion that kvm->lock is actually held.

Ah, cunning. Thanks.

> That said, I'm not at all sure what the purpose of all this trylock
> stuff is here.
> 
> Can someone explain? Last time I asked someone said something about
> multiple VMs, but I don't know enough about kvm to know what that means.

Multiple VMs? That'd be real fun. Not.

> Are those vcpu->mutex another class for other VMs? Or what gives?

Nah. This is firmly single VM.

The purpose of this contraption is that there are some rare cases
where we need to make sure that if we update some global state, all
the vcpus of a VM need to see, or none of them.

For these cases, the guarantee comes from luserspace, and it gives the
pinky promise that none of the vcpus are running at that point. But
being of a suspicious nature, we assert that this is true by trying to
take all the vcpu mutexes in one go. This will fail if a vcpu is
running, as KVM itself takes the vcpu mutex before doing anything.

Similar requirement exists if we need to synthesise some state for
userspace from all the individual vcpu states.

If the global locking fails, we return to userspace with a middle
finger indication, and all is well. Of course, this is pretty
expensive, which is why it is only done in setup phases, when the VMM
configures the guest.

The splat this is trying to address is that when you have more than 48
vcpus in a single VM, lockdep gets upset seeing up to 512 locks of a
similar class being taken.

Disclaimer: all the above is completely arm64-specific, and I didn't
even try to understand what other architectures are doing.

HTH,

	M.

-- 
Without deviation from the norm, progress is not possible.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
