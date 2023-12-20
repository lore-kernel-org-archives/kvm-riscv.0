From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 20 Dec 2023 07:28:51 +0100
Subject: [PATCH v3 11/13] RISC-V: KVM: selftests: Add
 guest_sbi_probe_extension
In-Reply-To: <CAOnJCUKu1069YXRWopFDjRobF4jjskdFJMQH1oD2wPc+9JoBmg@mail.gmail.com>
References: <20231217204019.36492-15-ajones@ventanamicro.com>
 <20231217204019.36492-26-ajones@ventanamicro.com>
 <CAOnJCUKu1069YXRWopFDjRobF4jjskdFJMQH1oD2wPc+9JoBmg@mail.gmail.com>
Message-ID: <20231220-3a173b8727d455756f691508@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 19, 2023 at 01:57:21PM -0800, Atish Patra wrote:
> On Sun, Dec 17, 2023 at 12:40?PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > Add guest_sbi_probe_extension(), allowing guest code to probe for
> > SBI extensions. As guest_sbi_probe_extension() needs
> > SBI_ERR_NOT_SUPPORTED, take the opportunity to bring in all SBI
> > error codes. We don't bring in all current extension IDs or base
> > extension function IDs though, even though we need one of each,
> > because we'd prefer to bring those in as necessary.
> >
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  .../selftests/kvm/include/riscv/processor.h   | 21 +++++++++++++++++++
> >  .../selftests/kvm/lib/riscv/processor.c       | 19 +++++++++++++++++
> >  2 files changed, 40 insertions(+)
> >
> > diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> > index e70ccda2011b..dc50ad62e150 100644
> > --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> > +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> > @@ -108,6 +108,17 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t subtype,
> >  #define SATP_ASID_SHIFT                                44
> >  #define SATP_ASID_MASK                         _AC(0xFFFF, UL)
> >
> > +/* SBI return error codes */
> > +#define SBI_SUCCESS                            0
> > +#define SBI_ERR_FAILURE                                -1
> > +#define SBI_ERR_NOT_SUPPORTED                  -2
> > +#define SBI_ERR_INVALID_PARAM                  -3
> > +#define SBI_ERR_DENIED                         -4
> > +#define SBI_ERR_INVALID_ADDRESS                        -5
> > +#define SBI_ERR_ALREADY_AVAILABLE              -6
> > +#define SBI_ERR_ALREADY_STARTED                        -7
> > +#define SBI_ERR_ALREADY_STOPPED                        -8
> > +
> 
> Add SBI_ERR_NO_SHMEM as well ?

I can add it now to selftests, but it won't get used (steal-time doesn't
use it since it doesn't have any SBI functions that use an already set up
shared memory region). It's also not yet in Linux, so KVM selftests would
be "ahead" of Linux in this regard. And, while the naming shouldn't be
controversial, I suppose we should commit the name to Linux first to be sure
we port it correctly here. So let's wait until we have a KVM selftests
user, which means it'll also be in Linux.

> 
> >  #define SBI_EXT_EXPERIMENTAL_START             0x08000000
> >  #define SBI_EXT_EXPERIMENTAL_END               0x08FFFFFF
> >
> > @@ -115,6 +126,14 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t subtype,
> >  #define KVM_RISCV_SELFTESTS_SBI_UCALL          0
> >  #define KVM_RISCV_SELFTESTS_SBI_UNEXP          1
> >
> > +enum sbi_ext_id {
> > +       SBI_EXT_BASE = 0x10,
> > +};
> > +
> > +enum sbi_ext_base_fid {
> > +       SBI_EXT_BASE_PROBE_EXT = 3,
> > +};
> > +
> >  struct sbiret {
> >         long error;
> >         long value;
> > @@ -125,4 +144,6 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
> >                         unsigned long arg3, unsigned long arg4,
> >                         unsigned long arg5);
> >
> > +bool guest_sbi_probe_extension(int extid, long *out_val);
> > +
> >  #endif /* SELFTEST_KVM_PROCESSOR_H */
> > diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
> > index 6905a4348380..7ca736fb4194 100644
> > --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> > +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> > @@ -393,3 +393,22 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
> >
> >         return ret;
> >  }
> > +
> > +bool guest_sbi_probe_extension(int extid, long *out_val)
> > +{
> > +       struct sbiret ret;
> > +
> > +       ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, extid,
> > +                       0, 0, 0, 0, 0);
> > +
> > +       __GUEST_ASSERT(!ret.error || ret.error == SBI_ERR_NOT_SUPPORTED,
> > +                      "ret.error=%ld, ret.value=%ld\n", ret.error, ret.value);
> > +
> > +       if (ret.error == SBI_ERR_NOT_SUPPORTED)
> > +               return false;
> > +
> > +       if (out_val)
> > +               *out_val = ret.value;
> > +
> > +       return true;
> > +}
> > --
> > 2.43.0
> >
> 
> 
> Apart from that, LGTM.
> 
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Thanks,
drew

> 
> -- 
> Regards,
> Atish

