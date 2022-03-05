From: Atish Patra <atishp@atishpatra.org>
Date: Sat, 5 Mar 2022 01:37:02 -0800
Subject: [RFC PATCH v2 7/7] RISC-V: KVM: Support sstc extension
In-Reply-To: <E7BF29AE-3633-47F0-8D8C-735743386370@jrtc27.com>
References: <20220304201020.810380-1-atishp@rivosinc.com>
 <20220304201020.810380-8-atishp@rivosinc.com>
 <E7BF29AE-3633-47F0-8D8C-735743386370@jrtc27.com>
Message-ID: <CAOnJCUJzPFJM7y63LcKk_-_XzW_JK0QjSH1ahHvjfJieruZYHg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 4, 2022 at 12:38 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 4 Mar 2022, at 20:10, Atish Patra <atishp@rivosinc.com> wrote:
> >
> > Sstc extension allows the guest to program the vstimecmp CSR directly
> > instead of making an SBI call to the hypervisor to program the next
> > event. The timer interrupt is also directly injected to the guest by
> > the hardware in this case. To maintain backward compatibility, the
> > hypervisors also update the vstimecmp in an SBI set_time call if
> > the hardware supports it. Thus, the older kernels in guest also
> > take advantage of the sstc extension.
>
> Same comment as the OpenSBI patch.

I have replied to your comment in OpenSBI.

> This changes the semantics of the
> SBI call from only touching M-mode (or HS-mode in this case) state
> (minus STIP as explicitly requested) to also touching S-mode (or
> VS-mode in this case) visible and controlled state, which to me goes
> against the spec as any clobbered state needs to be explicitly
> specified, but is not in the current frozen 0.3 spec. All this does is
> optimise for legacy systems by adding code complexity, anyway, so I
> fail to see why it?s really needed, if they want to go faster they can
> just adopt Sstc. You can?t get rid of the existing mechanism so long as
> you want to support non-Sstc hardware so it?s just adding a third
> poorly-motivated case that to me goes against the spec.
>

In hypervisor, STIP bit in hvip is still writable. Thus, hypervisor
can continue to use
the hrtimer and inject the guest timer interrupt via hvip even though
it is suboptimal.

But I agree with your point in general. To summarize, guest timer
interrupts can be managed
by the hypervisor for older guest kernel without sstc support on sstc
enabled hardware in
the following ways:

1. In SBI call handler, update vstimecmp directly so that guest can
receive timer interrupt directly
(as implemented in this patch)
or
2. In SBI call handler, hypervisor will setup an hrtimer and inject
the guest timer interrupt via hvip
when the hrtimer expired. (current behavior)

Personally, I am okay with either approach. Any other thoughts ?

> Jess
>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> > arch/riscv/include/asm/kvm_host.h       |   1 +
> > arch/riscv/include/asm/kvm_vcpu_timer.h |   8 +-
> > arch/riscv/include/uapi/asm/kvm.h       |   1 +
> > arch/riscv/kvm/main.c                   |  12 ++-
> > arch/riscv/kvm/vcpu.c                   |   4 +-
> > arch/riscv/kvm/vcpu_timer.c             | 138 +++++++++++++++++++++++-
> > 6 files changed, 158 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> > index 99ef6a120617..2ed93cdb334f 100644
> > --- a/arch/riscv/include/asm/kvm_host.h
> > +++ b/arch/riscv/include/asm/kvm_host.h
> > @@ -135,6 +135,7 @@ struct kvm_vcpu_csr {
> >       unsigned long hvip;
> >       unsigned long vsatp;
> >       unsigned long scounteren;
> > +     u64 vstimecmp;
> > };
> >
> > struct kvm_vcpu_arch {
> > diff --git a/arch/riscv/include/asm/kvm_vcpu_timer.h b/arch/riscv/include/asm/kvm_vcpu_timer.h
> > index 375281eb49e0..a24a265f3ccb 100644
> > --- a/arch/riscv/include/asm/kvm_vcpu_timer.h
> > +++ b/arch/riscv/include/asm/kvm_vcpu_timer.h
> > @@ -28,6 +28,11 @@ struct kvm_vcpu_timer {
> >       u64 next_cycles;
> >       /* Underlying hrtimer instance */
> >       struct hrtimer hrt;
> > +
> > +     /* Flag to check if sstc is enabled or not */
> > +     bool sstc_enabled;
> > +     /* A function pointer to switch between stimecmp or hrtimer at runtime */
> > +     int (*timer_next_event)(struct kvm_vcpu *vcpu, u64 ncycles);
> > };
> >
> > int kvm_riscv_vcpu_timer_next_event(struct kvm_vcpu *vcpu, u64 ncycles);
> > @@ -39,6 +44,7 @@ int kvm_riscv_vcpu_timer_init(struct kvm_vcpu *vcpu);
> > int kvm_riscv_vcpu_timer_deinit(struct kvm_vcpu *vcpu);
> > int kvm_riscv_vcpu_timer_reset(struct kvm_vcpu *vcpu);
> > void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu);
> > +void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu);
> > int kvm_riscv_guest_timer_init(struct kvm *kvm);
> > -
> > +bool kvm_riscv_vcpu_timer_pending(struct kvm_vcpu *vcpu);
> > #endif
> > diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> > index 92bd469e2ba6..d2f02ba1947a 100644
> > --- a/arch/riscv/include/uapi/asm/kvm.h
> > +++ b/arch/riscv/include/uapi/asm/kvm.h
> > @@ -96,6 +96,7 @@ enum KVM_RISCV_ISA_EXT_ID {
> >       KVM_RISCV_ISA_EXT_H,
> >       KVM_RISCV_ISA_EXT_I,
> >       KVM_RISCV_ISA_EXT_M,
> > +     KVM_RISCV_ISA_EXT_SSTC,
> >       KVM_RISCV_ISA_EXT_MAX,
> > };
> >
> > diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> > index 2e5ca43c8c49..83c4db7fc35f 100644
> > --- a/arch/riscv/kvm/main.c
> > +++ b/arch/riscv/kvm/main.c
> > @@ -32,7 +32,7 @@ int kvm_arch_hardware_setup(void *opaque)
> >
> > int kvm_arch_hardware_enable(void)
> > {
> > -     unsigned long hideleg, hedeleg;
> > +     unsigned long hideleg, hedeleg, henvcfg;
> >
> >       hedeleg = 0;
> >       hedeleg |= (1UL << EXC_INST_MISALIGNED);
> > @@ -51,6 +51,16 @@ int kvm_arch_hardware_enable(void)
> >
> >       csr_write(CSR_HCOUNTEREN, -1UL);
> >
> > +     if (riscv_isa_extension_available(NULL, SSTC)) {
> > +#ifdef CONFIG_64BIT
> > +             henvcfg = csr_read(CSR_HENVCFG);
> > +             csr_write(CSR_HENVCFG, henvcfg | 1UL<<HENVCFG_STCE);
> > +#else
> > +             henvcfg = csr_read(CSR_HENVCFGH);
> > +             csr_write(CSR_HENVCFGH, henvcfg | 1UL<<HENVCFGH_STCE);
> > +#endif
> > +     }
> > +
> >       csr_write(CSR_HVIP, 0);
> >
> >       return 0;
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index a3ae7042c696..f7c08a182e3a 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -143,7 +143,7 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
> >
> > int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
> > {
> > -     return kvm_riscv_vcpu_has_interrupts(vcpu, 1UL << IRQ_VS_TIMER);
> > +     return kvm_riscv_vcpu_timer_pending(vcpu);
> > }
> >
> > void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu)
> > @@ -374,6 +374,7 @@ static unsigned long kvm_isa_ext_arr[] = {
> >       RISCV_ISA_EXT_h,
> >       RISCV_ISA_EXT_i,
> >       RISCV_ISA_EXT_m,
> > +     RISCV_ISA_EXT_SSTC,
> > };
> >
> > static int kvm_riscv_vcpu_get_reg_isa_ext(struct kvm_vcpu *vcpu,
> > @@ -757,6 +758,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
> >                                    vcpu->arch.isa);
> >       kvm_riscv_vcpu_host_fp_restore(&vcpu->arch.host_context);
> >
> > +     kvm_riscv_vcpu_timer_save(vcpu);
> >       csr_write(CSR_HGATP, 0);
> >
> >       csr->vsstatus = csr_read(CSR_VSSTATUS);
> > diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
> > index 5c4c37ff2d48..d226a931de92 100644
> > --- a/arch/riscv/kvm/vcpu_timer.c
> > +++ b/arch/riscv/kvm/vcpu_timer.c
> > @@ -69,7 +69,18 @@ static int kvm_riscv_vcpu_timer_cancel(struct kvm_vcpu_timer *t)
> >       return 0;
> > }
> >
> > -int kvm_riscv_vcpu_timer_next_event(struct kvm_vcpu *vcpu, u64 ncycles)
> > +static int kvm_riscv_vcpu_update_vstimecmp(struct kvm_vcpu *vcpu, u64 ncycles)
> > +{
> > +#if __riscv_xlen == 32
> > +             csr_write(CSR_VSTIMECMP, ncycles & 0xFFFFFFFF);
> > +             csr_write(CSR_VSTIMECMPH, ncycles >> 32);
> > +#else
> > +             csr_write(CSR_VSTIMECMP, ncycles);
> > +#endif
> > +             return 0;
> > +}
> > +
> > +static int kvm_riscv_vcpu_update_hrtimer(struct kvm_vcpu *vcpu, u64 ncycles)
> > {
> >       struct kvm_vcpu_timer *t = &vcpu->arch.timer;
> >       struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
> > @@ -88,6 +99,68 @@ int kvm_riscv_vcpu_timer_next_event(struct kvm_vcpu *vcpu, u64 ncycles)
> >       return 0;
> > }
> >
> > +int kvm_riscv_vcpu_timer_next_event(struct kvm_vcpu *vcpu, u64 ncycles)
> > +{
> > +     struct kvm_vcpu_timer *t = &vcpu->arch.timer;
> > +
> > +     return t->timer_next_event(vcpu, ncycles);
> > +}
> > +
> > +static enum hrtimer_restart kvm_riscv_vcpu_vstimer_expired(struct hrtimer *h)
> > +{
> > +     u64 delta_ns;
> > +     struct kvm_vcpu_timer *t = container_of(h, struct kvm_vcpu_timer, hrt);
> > +     struct kvm_vcpu *vcpu = container_of(t, struct kvm_vcpu, arch.timer);
> > +     struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
> > +
> > +     if (kvm_riscv_current_cycles(gt) < t->next_cycles) {
> > +             delta_ns = kvm_riscv_delta_cycles2ns(t->next_cycles, gt, t);
> > +             hrtimer_forward_now(&t->hrt, ktime_set(0, delta_ns));
> > +             return HRTIMER_RESTART;
> > +     }
> > +
> > +     t->next_set = false;
> > +     kvm_vcpu_kick(vcpu);
> > +
> > +     return HRTIMER_NORESTART;
> > +}
> > +
> > +bool kvm_riscv_vcpu_timer_pending(struct kvm_vcpu *vcpu)
> > +{
> > +     struct kvm_vcpu_timer *t = &vcpu->arch.timer;
> > +     struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
> > +     u64 vstimecmp_val = vcpu->arch.guest_csr.vstimecmp;
> > +
> > +     if (!kvm_riscv_delta_cycles2ns(vstimecmp_val, gt, t) ||
> > +         kvm_riscv_vcpu_has_interrupts(vcpu, 1UL << IRQ_VS_TIMER))
> > +             return true;
> > +     else
> > +             return false;
> > +}
> > +
> > +static void kvm_riscv_vcpu_timer_blocking(struct kvm_vcpu *vcpu)
> > +{
> > +     struct kvm_vcpu_timer *t = &vcpu->arch.timer;
> > +     struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
> > +     u64 delta_ns;
> > +     u64 vstimecmp_val = vcpu->arch.guest_csr.vstimecmp;
> > +
> > +     if (!t->init_done)
> > +             return;
> > +
> > +     delta_ns = kvm_riscv_delta_cycles2ns(vstimecmp_val, gt, t);
> > +     if (delta_ns) {
> > +             t->next_cycles = vstimecmp_val;
> > +             hrtimer_start(&t->hrt, ktime_set(0, delta_ns), HRTIMER_MODE_REL);
> > +             t->next_set = true;
> > +     }
> > +}
> > +
> > +static void kvm_riscv_vcpu_timer_unblocking(struct kvm_vcpu *vcpu)
> > +{
> > +     kvm_riscv_vcpu_timer_cancel(&vcpu->arch.timer);
> > +}
> > +
> > int kvm_riscv_vcpu_get_reg_timer(struct kvm_vcpu *vcpu,
> >                                const struct kvm_one_reg *reg)
> > {
> > @@ -180,10 +253,20 @@ int kvm_riscv_vcpu_timer_init(struct kvm_vcpu *vcpu)
> >               return -EINVAL;
> >
> >       hrtimer_init(&t->hrt, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> > -     t->hrt.function = kvm_riscv_vcpu_hrtimer_expired;
> >       t->init_done = true;
> >       t->next_set = false;
> >
> > +     /* Enable sstc for every vcpu if available in hardware */
> > +     if (riscv_isa_extension_available(NULL, SSTC)) {
> > +             t->sstc_enabled = true;
> > +             t->hrt.function = kvm_riscv_vcpu_vstimer_expired;
> > +             t->timer_next_event = kvm_riscv_vcpu_update_vstimecmp;
> > +     } else {
> > +             t->sstc_enabled = false;
> > +             t->hrt.function = kvm_riscv_vcpu_hrtimer_expired;
> > +             t->timer_next_event = kvm_riscv_vcpu_update_hrtimer;
> > +     }
> > +
> >       return 0;
> > }
> >
> > @@ -202,7 +285,7 @@ int kvm_riscv_vcpu_timer_reset(struct kvm_vcpu *vcpu)
> >       return kvm_riscv_vcpu_timer_cancel(&vcpu->arch.timer);
> > }
> >
> > -void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
> > +static void kvm_riscv_vcpu_update_timedelta(struct kvm_vcpu *vcpu)
> > {
> >       struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
> >
> > @@ -214,6 +297,55 @@ void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
> > #endif
> > }
> >
> > +void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
> > +{
> > +     struct kvm_vcpu_csr *csr;
> > +     struct kvm_vcpu_timer *t = &vcpu->arch.timer;
> > +
> > +     kvm_riscv_vcpu_update_timedelta(vcpu);
> > +
> > +     if (!t->sstc_enabled)
> > +             return;
> > +
> > +     csr = &vcpu->arch.guest_csr;
> > +#ifdef CONFIG_64BIT
> > +     csr_write(CSR_VSTIMECMP, csr->vstimecmp);
> > +#else
> > +     csr_write(CSR_VSTIMECMP, (u32)csr->vstimecmp);
> > +     csr_write(CSR_VSTIMECMPH, (u32)(csr->vstimecmp >> 32));
> > +#endif
> > +
> > +     /* timer should be enabled for the remaining operations */
> > +     if (unlikely(!t->init_done))
> > +             return;
> > +
> > +     kvm_riscv_vcpu_timer_unblocking(vcpu);
> > +}
> > +
> > +void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu)
> > +{
> > +     struct kvm_vcpu_csr *csr;
> > +     struct kvm_vcpu_timer *t = &vcpu->arch.timer;
> > +
> > +     if (!t->sstc_enabled)
> > +             return;
> > +
> > +     csr = &vcpu->arch.guest_csr;
> > +     t = &vcpu->arch.timer;
> > +#ifdef CONFIG_64BIT
> > +     csr->vstimecmp = csr_read(CSR_VSTIMECMP);
> > +#else
> > +     csr->vstimecmp = csr_read(CSR_VSTIMECMP);
> > +     csr->vstimecmp |= (u64)csr_read(CSR_VSTIMECMPH) << 32;
> > +#endif
> > +     /* timer should be enabled for the remaining operations */
> > +     if (unlikely(!t->init_done))
> > +             return;
> > +
> > +     if (kvm_vcpu_is_blocking(vcpu))
> > +             kvm_riscv_vcpu_timer_blocking(vcpu);
> > +}
> > +
> > int kvm_riscv_guest_timer_init(struct kvm *kvm)
> > {
> >       struct kvm_guest_timer *gt = &kvm->arch.timer;
> > --
> > 2.30.2
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>


--
Regards,
Atish

