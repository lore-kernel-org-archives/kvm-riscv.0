From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 May 2022 11:03:34 +0530
Subject: [PATCH v2 5/7] RISC-V: KVM: Reduce KVM_MAX_VCPUS value
In-Reply-To: <CAOnJCU+yd7hqauHRYwnPqNKEgfy5FK06ezR64aH0Hm2AcNNadw@mail.gmail.com>
References: <20220420112450.155624-1-apatel@ventanamicro.com>
 <20220420112450.155624-6-apatel@ventanamicro.com>
 <CAOnJCU+yd7hqauHRYwnPqNKEgfy5FK06ezR64aH0Hm2AcNNadw@mail.gmail.com>
Message-ID: <CAAhSdy1vwQ6BmjzvSuJHc8V37U78PPjGS19+XEQHHqE1=nQRpg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 4, 2022 at 7:45 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Wed, Apr 20, 2022 at 4:25 AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > Currently, the KVM_MAX_VCPUS value is 16384 for RV64 and 128
> > for RV32.
> >
> > The KVM_MAX_VCPUS value is too high for RV64 and too low for
> > RV32 compared to other architectures (e.g. x86 sets it to 1024
> > and ARM64 sets it to 512). The too high value of KVM_MAX_VCPUS
> > on RV64 also leads to VCPU mask on stack consuming 2KB.
> >
> > We set KVM_MAX_VCPUS to 1024 for both RV64 and RV32 to be
> > aligned other architectures.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/kvm_host.h | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> > index 806f74dc0bfc..61d8b40e3d82 100644
> > --- a/arch/riscv/include/asm/kvm_host.h
> > +++ b/arch/riscv/include/asm/kvm_host.h
> > @@ -16,8 +16,7 @@
> >  #include <asm/kvm_vcpu_fp.h>
> >  #include <asm/kvm_vcpu_timer.h>
> >
> > -#define KVM_MAX_VCPUS                  \
> > -       ((HGATP_VMID_MASK >> HGATP_VMID_SHIFT) + 1)
> > +#define KVM_MAX_VCPUS                  1024
> >
> >  #define KVM_HALT_POLL_NS_DEFAULT       500000
> >
> > --
> > 2.25.1
> >
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Queued this patch for 5.19

Thanks,
Anup

>
> --
> Regards,
> Atish

