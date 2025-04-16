Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3ACC369BA
	for <kvm-riscv@archiver.kernel.org>; Wed, 16 Apr 2025 18:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GNPSfowahtUNbTq+5fEYDH80yx2wFlcav5jq/555NAc=; b=VcoK+Oupkde1Ng
	p8Q4nO8L2sPfKSoO2yZCyzlCzf6GncpadHZwUy/8Ky93oGWDdpb3/eT+phZ9NAovRI6uLyfhxsyiS
	9FgFhRyERUXYfuR73X3orV8KueSkpiSKGUBVla2zICgue2TROYpQB70SLVsf1HbBJzgXgnGLUnmS0
	NXDz3QntTtDp1um7G/AvWL+1kIfQBvTIaDcjBvQWXdmuLRxCv2Y+NLOkgh+03oDFRM3mZ+oHpDbZ3
	lazDBCL/EKZIKWyywevXbZDgOqgULe7K9FYRob7Q7tqJNxYgXP9obo8CROCIEmBwMJAHzKN0XMI0D
	Ui6B9e584lTnVUEtdauA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57qa-0000000AcJf-44ue;
	Wed, 16 Apr 2025 18:50:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57pr-0000000Ac9P-0KYJ;
	Wed, 16 Apr 2025 18:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KTKsrCEcIX5ae0bE8xFlYhfINNwEmMsrkM+sMUJjxX4=; b=lwWYNFN3LQfvU/nKF86KK96bYI
	hHovFbBPggpZJ0Av16mdwwhn/ZU9eIjouGd2Si4v64UCAuUoeOsgUQxJFAO55SVmM4ismsYMD8Sc/
	fW3rB5dNO2F+oSaNgks3NQC0gfm37iKxUAa6uM532hkcc9V/E5l/szAtkDLIb971SutmrUVvS2ehw
	yfHZOyetB8KFNMy9DoXC+myPTtnnzPmv2MxwDqlLtqlWZpyQfSNe2iEt5imratwuokO7cm4Uqfjas
	xSrULc0zgc52ieW+5sSv/ZmeJ5uzwsMkDPOyRAKClS22lpM6DcyXSzyc0IAbsaKXPzra343fwSJLs
	vZBaMlWQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u57pj-0000000A9Wi-1LS4;
	Wed, 16 Apr 2025 18:50:03 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A5D8F3003C4; Wed, 16 Apr 2025 20:50:01 +0200 (CEST)
Date: Wed, 16 Apr 2025 20:50:01 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org,
	Alexander Potapenko <glider@google.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	kvm-riscv@lists.infradead.org,
	Oliver Upton <oliver.upton@linux.dev>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jing Zhang <jingzhangos@google.com>,
	Waiman Long <longman@redhat.com>, x86@kernel.org,
	Kunkun Jiang <jiangkunkun@huawei.com>,
	Boqun Feng <boqun.feng@gmail.com>, Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Zenghui Yu <yuzenghui@huawei.com>,
	Borislav Petkov <bp@alien8.de>, Alexandre Ghiti <alex@ghiti.fr>,
	Keisuke Nishimura <keisuke.nishimura@inria.fr>,
	Sebastian Ott <sebott@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Randy Dunlap <rdunlap@infradead.org>, Will Deacon <will@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>, Ingo Molnar <mingo@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sean Christopherson <seanjc@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2 2/4] KVM: x86: move
 sev_lock/unlock_vcpus_for_migration to kvm_main.c
Message-ID: <20250416185001.GA38216@noisy.programming.kicks-ass.net>
References: <20250409014136.2816971-1-mlevitsk@redhat.com>
 <20250409014136.2816971-3-mlevitsk@redhat.com>
 <20250410081640.GX9833@noisy.programming.kicks-ass.net>
 <60b7607b-8ada-447d-9dcb-034d93b9abe8@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <60b7607b-8ada-447d-9dcb-034d93b9abe8@redhat.com>
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

On Wed, Apr 16, 2025 at 07:48:00PM +0200, Paolo Bonzini wrote:
> On 4/10/25 10:16, Peter Zijlstra wrote:
> > On Tue, Apr 08, 2025 at 09:41:34PM -0400, Maxim Levitsky wrote:
> > > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > > index 69782df3617f..71c0d8c35b4b 100644
> > > --- a/virt/kvm/kvm_main.c
> > > +++ b/virt/kvm/kvm_main.c
> > > @@ -1368,6 +1368,77 @@ static int kvm_vm_release(struct inode *inode, struct file *filp)
> > >   	return 0;
> > >   }
> > > +
> > > +/*
> > > + * Lock all VM vCPUs.
> > > + * Can be used nested (to lock vCPUS of two VMs for example)
> > > + */
> > > +int kvm_lock_all_vcpus_nested(struct kvm *kvm, bool trylock, unsigned int role)
> > > +{
> > > +	struct kvm_vcpu *vcpu;
> > > +	unsigned long i, j;
> > > +
> > > +	lockdep_assert_held(&kvm->lock);
> > > +
> > > +	kvm_for_each_vcpu(i, vcpu, kvm) {
> > > +
> > > +		if (trylock && !mutex_trylock_nested(&vcpu->mutex, role))
> > > +			goto out_unlock;
> > > +		else if (!trylock && mutex_lock_killable_nested(&vcpu->mutex, role))
> > > +			goto out_unlock;
> > > +
> > > +#ifdef CONFIG_PROVE_LOCKING
> > > +		if (!i)
> > > +			/*
> > > +			 * Reset the role to one that avoids colliding with
> > > +			 * the role used for the first vcpu mutex.
> > > +			 */
> > > +			role = MAX_LOCK_DEPTH - 1;
> > > +		else
> > > +			mutex_release(&vcpu->mutex.dep_map, _THIS_IP_);
> > > +#endif
> > > +	}
> > 
> > This code is all sorts of terrible.
> > 
> > Per the lockdep_assert_held() above, you serialize all these locks by
> > holding that lock, this means you can be using the _nest_lock()
> > annotation.
> > 
> > Also, the original code didn't have this trylock nonsense, and the
> > Changelog doesn't mention this -- in fact the Changelog claims no
> > change, which is patently false.
> > 
> > Anyway, please write like:
> > 
> > 	kvm_for_each_vcpu(i, vcpu, kvm) {
> > 		if (mutex_lock_killable_nest_lock(&vcpu->mutex, &kvm->lock))
> > 			goto unlock;
> > 	}
> > 
> > 	return 0;
> > 
> > unlock:
> > 
> > 	kvm_for_each_vcpu(j, vcpu, kvm) {
> > 		if (j == i)
> > 			break;
> > 
> > 		mutex_unlock(&vcpu->mutex);
> > 	}
> > 	return -EINTR;
> > 
> > And yes, you'll have to add mutex_lock_killable_nest_lock(), but that
> > should be trivial.
> 
> If I understand correctly, that would be actually
> _mutex_lock_killable_nest_lock() plus a wrapper macro.  But yes,
> that is easy so it sounds good.
> 
> For the ARM case, which is the actual buggy one (it was complaining
> about too high a depth) it still needs mutex_trylock_nest_lock();
> the nest_lock is needed to avoid bumping the depth on every
> mutex_trylock().

Got a link to the ARM code in question ? And I'm assuming you're talking
about task_struct::lockdep_depth ? The nest lock annotation does not
in fact increment depth beyond one of each type. It does a refcount like
thing.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
