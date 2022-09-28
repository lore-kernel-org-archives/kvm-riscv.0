From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 28 Sep 2022 10:59:03 +0200
Subject: [PATCH v3 1/3] RISC-V: KVM: Record number of signal exits as a
 vCPU stat
In-Reply-To: <CAJF2gTRSb4f9rF_sTZ2hr9iOnvLYcQYu3CN7q8PCZQg4HvC_Gg@mail.gmail.com>
References: <20220925162400.1606-1-jszhang@kernel.org>
 <20220925162400.1606-2-jszhang@kernel.org>
 <CAJF2gTRSb4f9rF_sTZ2hr9iOnvLYcQYu3CN7q8PCZQg4HvC_Gg@mail.gmail.com>
Message-ID: <20220928085903.3b6nyyuphpeggsju@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 28, 2022 at 01:18:01PM +0800, Guo Ren wrote:
> Reviewed-by: Guo Ren <guoren@kernel.org>
> 
> ?  linux git:(master) grep signal_exits arch/arm64 -r
> arch/arm64/kvm/guest.c: STATS_DESC_COUNTER(VCPU, signal_exits),
> arch/arm64/include/asm/kvm_host.h:      u64 signal_exits;
> 
> By the way, do you know why arm64 is defined, but not used?

It is. arm64 uses generic xfer to guest mode work, like this series
introduces for riscv.

Thanks,
drew

> 
> 
> On Mon, Sep 26, 2022 at 12:33 AM Jisheng Zhang <jszhang@kernel.org> wrote:
> >
> > Record a statistic indicating the number of times a vCPU has exited
> > due to a pending signal.
> >
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  arch/riscv/include/asm/kvm_host.h | 1 +
> >  arch/riscv/kvm/vcpu.c             | 2 ++
> >  2 files changed, 3 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> > index 60c517e4d576..dbbf43d52623 100644
> > --- a/arch/riscv/include/asm/kvm_host.h
> > +++ b/arch/riscv/include/asm/kvm_host.h
> > @@ -67,6 +67,7 @@ struct kvm_vcpu_stat {
> >         u64 mmio_exit_kernel;
> >         u64 csr_exit_user;
> >         u64 csr_exit_kernel;
> > +       u64 signal_exits;
> >         u64 exits;
> >  };
> >
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index d0f08d5b4282..3da459fedc28 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -28,6 +28,7 @@ const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
> >         STATS_DESC_COUNTER(VCPU, mmio_exit_kernel),
> >         STATS_DESC_COUNTER(VCPU, csr_exit_user),
> >         STATS_DESC_COUNTER(VCPU, csr_exit_kernel),
> > +       STATS_DESC_COUNTER(VCPU, signal_exits),
> >         STATS_DESC_COUNTER(VCPU, exits)
> >  };
> >
> > @@ -973,6 +974,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
> >                 if (signal_pending(current)) {
> >                         ret = -EINTR;
> >                         run->exit_reason = KVM_EXIT_INTR;
> > +                       ++vcpu->stat.signal_exits;
> >                 }
> >
> >                 /*
> > --
> > 2.34.1
> >
> 
> 
> --
> Best Regards
>  Guo Ren
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

