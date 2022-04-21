From: Oliver Upton <oupton@google.com>
Date: Wed, 20 Apr 2022 20:31:18 -0700
Subject: [PATCH v5 03/13] KVM: arm64: Track vCPU power state using MP
 state values
In-Reply-To: <CAAeT=FxQ5qBMrYZpGbDT7i+bGFCyfoV32ddKeeprj7mEemnbEA@mail.gmail.com>
References: <20220409184549.1681189-1-oupton@google.com>
 <20220409184549.1681189-4-oupton@google.com>
 <CAAeT=FxQ5qBMrYZpGbDT7i+bGFCyfoV32ddKeeprj7mEemnbEA@mail.gmail.com>
Message-ID: <CAOQ_QsjzfWH=UV0hemGt5jeSrYrpzzcVLVPdOBe7LV__RkDT+Q@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Reiji,

Sorry for the late reply.

On Wed, Apr 13, 2022 at 10:26 PM Reiji Watanabe <reijiw@google.com> wrote:

[...]

> > @@ -457,7 +459,7 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
> >
> >         switch (mp_state->mp_state) {
> >         case KVM_MP_STATE_RUNNABLE:
> > -               vcpu->arch.power_off = false;
> > +               vcpu->arch.mp_state = *mp_state;
>
> Nit: It might be a bit odd that KVM_MP_STATE_STOPPED case only copies
> the 'mp_state' field of kvm_mp_state from userspace (that's not a 'copy'
> operation though), while KVM_MP_STATE_RUNNABLE case copies entire
> kvm_mp_state from user space.
> ('mp_state' is the only field of kvm_mp_state though)

I tried my best to leave this all as-is. I hinted at it in another
thread, but I really do think a refactoring would be good to make ARM
actually use the mp_state value instead of relying on vCPU requests. I
completely agree with the nit, but think it might be better to
collapse all of the weirdness around mp_state in a separate
patch/series which will drag the vCPU run loop along.

> Reviewed-by: Reiji Watanabe <reijiw@google.com>

Much appreciated :)

--
Best,
Oliver

