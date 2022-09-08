From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 8 Sep 2022 09:43:37 +0200
Subject: [PATCH v2 1/2] RISC-V: KVM: Provide UAPI for Zicbom block size
In-Reply-To: <CAAhSdy3Bun6wE1wH=n9JejSwoMMzt5wPCMQD=GehQq0eD-Ni5Q@mail.gmail.com>
References: <20220906145842.965488-1-ajones@ventanamicro.com>
 <20220906145842.965488-2-ajones@ventanamicro.com>
 <CAOnJCUJDoAiDhavwisxj4QVGruTb67STb_WqQ5NuojzDwLLqng@mail.gmail.com>
 <CAAhSdy3Bun6wE1wH=n9JejSwoMMzt5wPCMQD=GehQq0eD-Ni5Q@mail.gmail.com>
Message-ID: <20220908074337.qsipcynxrvuj4fhg@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 08, 2022 at 08:24:32AM +0530, Anup Patel wrote:
> On Thu, Sep 8, 2022 at 4:19 AM Atish Patra <atishp@atishpatra.org> wrote:
> >
> >
> >
> > On Tue, Sep 6, 2022 at 7:58 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> >>
> >> We're about to allow guests to use the Zicbom extension. KVM
> >> userspace needs to know the cache block size in order to
> >> properly advertise it to the guest. Provide a virtual config
> >> register for userspace to get it with the GET_ONE_REG API, but
> >> setting it cannot be supported, so disallow SET_ONE_REG.
> >>
> >> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> >> ---
> >>  arch/riscv/include/uapi/asm/kvm.h | 1 +
> >>  arch/riscv/kvm/vcpu.c             | 6 ++++++
> >>  arch/riscv/mm/cacheflush.c        | 1 +
> >>  3 files changed, 8 insertions(+)
> >>
> >> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> >> index 7351417afd62..b9a4cf36be4b 100644
> >> --- a/arch/riscv/include/uapi/asm/kvm.h
> >> +++ b/arch/riscv/include/uapi/asm/kvm.h
> >> @@ -48,6 +48,7 @@ struct kvm_sregs {
> >>  /* CONFIG registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> >>  struct kvm_riscv_config {
> >>         unsigned long isa;
> >> +       unsigned long zicbom_block_size;
> >>  };
> >>
> >>  /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> >> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> >> index d0f08d5b4282..3f36e79876e7 100644
> >> --- a/arch/riscv/kvm/vcpu.c
> >> +++ b/arch/riscv/kvm/vcpu.c
> >> @@ -18,6 +18,7 @@
> >>  #include <linux/fs.h>
> >>  #include <linux/kvm_host.h>
> >>  #include <asm/csr.h>
> >> +#include <asm/cacheflush.h>
> >>  #include <asm/hwcap.h>
> >>
> >>  const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
> >> @@ -254,6 +255,9 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
> >>         case KVM_REG_RISCV_CONFIG_REG(isa):
> >>                 reg_val = vcpu->arch.isa[0] & KVM_RISCV_BASE_ISA_MASK;
> >>                 break;
> >> +       case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
> >> +               reg_val = riscv_cbom_block_size;
> >> +               break;
> >
> >
> > Don't we need CONFIG_RISCV_ISA_ZICBOM here ? This one reg interface should only return riscv_cbom_block_size if we enable the parsing. Isn't it ?
> 
> The riscv_cbom_block_size is in the wrong location. This global variable
> should always be available irrespective CONFIG_RISCV_ISA_ZICBOM
> is enabled or not.

Just to clarify, riscv_cbom_block_size *was* in the wrong location, but
after Anup's move patch, which this patch is based on, it's in the right
location.

> 
> Better to check ISA feature flag instead of CONFIG_RISCV_ISA_ZICBOM.

Good suggestion. It does seem reasonable that reading a virtual register,
which is dependent on an ISA feature, should return EINVAL when the ISA
feature isn't present. If that isn't yet documented somewhere, then I'll
add it to my TODO list to document it as well, but I'm not sure we want
to hold up this patch on a documentation patch. For now I'll just spin a
v3 which adds the check.

Thanks,
drew

