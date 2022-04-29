From: Oliver Upton <oupton@google.com>
Date: Fri, 29 Apr 2022 03:42:28 +0000
Subject: [PATCH v5 07/13] KVM: arm64: Add support for userspace to
 suspend a vCPU
In-Reply-To: <CAAeT=Fx5Nb0EJ+6825fYxAxF9bK5DHOXNmJiSVGP=JVSbWuCrQ@mail.gmail.com>
References: <20220409184549.1681189-1-oupton@google.com>
 <20220409184549.1681189-8-oupton@google.com>
 <CAAeT=FzURZmYfsLJnWMXufBiaZ6Wypan+xK4WxOSM=p=kEnYxA@mail.gmail.com>
 <CAOQ_Qsg2oNx8Ke7wGy1sU-5Ruq8uCWMKU5VkvTn=co6oRhhXww@mail.gmail.com>
 <CAAeT=Fx5Nb0EJ+6825fYxAxF9bK5DHOXNmJiSVGP=JVSbWuCrQ@mail.gmail.com>
Message-ID: <YmtepGWYckmUKln+@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 21, 2022 at 11:28:42PM -0700, Reiji Watanabe wrote:

[...]

> > > > +static void kvm_arm_vcpu_suspend(struct kvm_vcpu *vcpu)
> > > > +{
> > > > +       vcpu->arch.mp_state.mp_state = KVM_MP_STATE_SUSPENDED;
> > > > +       kvm_make_request(KVM_REQ_SUSPEND, vcpu);
> > > > +       kvm_vcpu_kick(vcpu);
> > >
> > > Considering the patch 8 will remove the call to kvm_vcpu_kick()
> > > (BTW, I wonder why you wanted to make that change in the patch-8
> > > instead of the patch-7),
> >
> > Squashed the diff into the wrong patch! Marc pointed out this is of
> > course cargo-culted as I was following the pattern laid down by
> > KVM_REQ_SLEEP :)
> 
> I see. Thanks for the clarification !
> 
> > > it looks like we could use the mp_state
> > > KVM_MP_STATE_SUSPENDED instead of using KVM_REQ_SUSPEND.
> > > What is the reason why you prefer to introduce KVM_REQ_SUSPEND
> > > rather than simply using KVM_MP_STATE_SUSPENDED ?
> >
> > I was trying to avoid any heavy refactoring in adding new
> > functionality here, as we handle KVM_MP_STATE_STOPPED similarly (make
> > a request). ARM is definitely a bit different than x86 in the way that
> > we handle the MP states, as x86 doesn't bounce through vCPU requests
> > to do it and instead directly checks the mp_state value.
> 
> The difference from KVM_MP_STATE_STOPPED is that kvm_arm_vcpu_power_off()
> calls kvm_vcpu_kick(), which made me think having KVM_REQ_SLEEP was
> reasonable (it appears kvm_vcpu_kick() won't be needed there due to
> the same reason as kvm_arm_vcpu_suspend).

Just to finish the thought on this before mailing out what I hope is the
last take on all of this. I'm going to leave the pointless call to
kvm_vcpu_kick() in place, if only to follow the pattern of other MP
states.

That will all get cleaned up later on, as discussed :)

--
Thanks,
Oliver

