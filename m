From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Wed, 20 Apr 2022 07:36:57 +0300
Subject: [PATCH 3/3] KVM: Add helpers to wrap vcpu->srcu_idx and yell if
 it's abused
In-Reply-To: <Yl7ZMJ/takmHh7tY@google.com>
References: <20220415004343.2203171-1-seanjc@google.com>
 <20220415004343.2203171-4-seanjc@google.com>
 <5b561bf1a0bbf140ea09d516f946a4e8fee8dd2d.camel@redhat.com>
 <Yl7ZMJ/takmHh7tY@google.com>
Message-ID: <ad0023fd2ea0297e7bfb8a6a9535b2b8b8f56093.camel@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2022-04-19 at 15:45 +0000, Sean Christopherson wrote:
> On Tue, Apr 19, 2022, Maxim Levitsky wrote:
> > On Fri, 2022-04-15 at 00:43 +0000, Sean Christopherson wrote:
> > > Add wrappers to acquire/release KVM's SRCU lock when stashing the index
> > > in vcpu->src_idx, along with rudimentary detection of illegal usage,
> > > e.g. re-acquiring SRCU and thus overwriting vcpu->src_idx.  Because the
> > > SRCU index is (currently) either 0 or 1, illegal nesting bugs can go
> > > unnoticed for quite some time and only cause problems when the nested
> > > lock happens to get a different index.
> > > 
> > > Wrap the WARNs in PROVE_RCU=y, and make them ONCE, otherwise KVM will
> > > likely yell so loudly that it will bring the kernel to its knees.
> > > 
> > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > ---
> 
> ...
> 
> > Looks good to me overall.
> > 
> > Note that there are still places that acquire the lock and store the idx into
> > a local variable, for example kvm_xen_vcpu_set_attr and such.
> > I didn't check yet if these should be converted as well.
> 
> Using a local variable is ok, even desirable.  Nested/multiple readers is not an
> issue, the bug fixed by patch 1 is purely that kvm_vcpu.srcu_idx gets corrupted.

Makes sense. I still recal *that* bug in AVIC inhibition where that srcu lock was
a major PITA, but now I remember that it was not due to nesting of the lock,
but rather fact that we attempted to call syncronize_srcu or something like that
with it held.


> 
> In an ideal world, KVM would _only_ track the SRCU index in local variables, but
> that would require plumbing the local variable down into vcpu_enter_guest() and
> kvm_vcpu_block() so that SRCU can be unlocked prior to entering the guest or
> scheduling out the vCPU.
> 
It all makes sense now - thanks.

Best regards,
	Maxim Levistky


