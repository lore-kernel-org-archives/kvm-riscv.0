From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 21 Feb 2024 21:08:19 +0800
Subject: [PATCH v5 11/12] KVM: riscv: selftests: Change vcpu_has_ext to a
 common function
In-Reply-To: <2c96c61a-2685-4cee-9cef-963ed833bf92@rivosinc.com>
References: <cover.1705916069.git.haibo1.xu@intel.com> <68856b86a93a4188558e5d0ebac0dd6aac8e404c.1705916069.git.haibo1.xu@intel.com>
 <CAOnJCULwRTSnrQkR2o1P53R=tJ3TAxX+y+XRBesW6OFEzgFv2g@mail.gmail.com>
 <CAJve8om2oOLg5-wKX7m7cBTgzwqiMcb35x=nDi1edY8evXjyMw@mail.gmail.com> <2c96c61a-2685-4cee-9cef-963ed833bf92@rivosinc.com>
Message-ID: <CAJve8omCZxsiP1jF0n5SBh0_U6q7Exj5A1ACFahWpdBoxohaMA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 21, 2024 at 4:37?PM Atish Patra <atishp@rivosinc.com> wrote:
>
> On 2/20/24 18:13, Haibo Xu wrote:
> > On Wed, Feb 21, 2024 at 7:03?AM Atish Patra <atishp@atishpatra.org> wrote:
> >>
> >> On Mon, Jan 22, 2024 at 1:48?AM Haibo Xu <haibo1.xu@intel.com> wrote:
> >>>
> >>> Move vcpu_has_ext to the processor.c and rename it to __vcpu_has_ext
> >>> so that other test cases can use it for vCPU extension check.
> >>>
> >>> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> >>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> >>> ---
> >>>   tools/testing/selftests/kvm/include/riscv/processor.h |  2 ++
> >>>   tools/testing/selftests/kvm/lib/riscv/processor.c     | 10 ++++++++++
> >>>   tools/testing/selftests/kvm/riscv/get-reg-list.c      | 11 +----------
> >>>   3 files changed, 13 insertions(+), 10 deletions(-)
> >>>
> >>> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> >>> index b68b1b731a34..bd27e1c67579 100644
> >>> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> >>> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> >>> @@ -42,6 +42,8 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t idx,
> >>>   #define RISCV_ISA_EXT_REG(idx) __kvm_reg_id(KVM_REG_RISCV_ISA_EXT, \
> >>>                                               idx, KVM_REG_SIZE_ULONG)
> >>>
> >>> +bool __vcpu_has_ext(struct kvm_vcpu *vcpu, int ext);
> >>> +
> >>>   struct ex_regs {
> >>>          unsigned long ra;
> >>>          unsigned long sp;
> >>> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
> >>> index 39a1e9902dec..dad73ce18164 100644
> >>> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> >>> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> >>> @@ -15,6 +15,16 @@
> >>>
> >>>   static vm_vaddr_t exception_handlers;
> >>>
> >>> +bool __vcpu_has_ext(struct kvm_vcpu *vcpu, int ext)
> >>> +{
> >>> +       unsigned long value = 0;
> >>> +       int ret;
> >>> +
> >>> +       ret = __vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(ext), &value);
> >>> +
> >>> +       return !ret && !!value;
> >>> +}
> >>> +
> >>
> >> Not sure what was the base patch on which this was rebased. The actual
> >> commit in the queue branch looks different.
> >>
> >
> > This patch set was based on 6.7-rc8.
> >
> >> https://github.com/kvm-riscv/linux/commit/5563517cc2012e3326411b360c9924d3f2706c8d
> >>
> >> Both seem to have the same bug though the tests fail now and require
> >> the following fix.
> >> The ext id should be uint64_t and we need to pass ext directly so that
> >> SBI extension tests can also pass.
> >>
> >
> > It's weird that 6.7-rc8 has already included Andrew's change on the ISA ext reg,
> > but this patch was not generated against his change.
> >
> > commit bdf6aa328f137e184b0fce607fd585354c3742f1
> > Author: Andrew Jones <ajones@ventanamicro.com>
> > Date:   Wed Dec 13 18:09:58 2023 +0100
> >
> >      RISC-V: KVM: selftests: Treat SBI ext regs like ISA ext regs
> >
> > Anyway, your changes were right. Please go ahead to include them when merging.
> >
>
> I am not sure what happened. Probably, a merge conflict issue.
>
> I just realized I forgot to copy paste another fix in arch timer
>
> +++ b/tools/testing/selftests/kvm/riscv/arch_timer.c
> @@ -85,7 +85,7 @@ struct kvm_vm *test_vm_create(void)
>          int nr_vcpus = test_args.nr_vcpus;
>
>          vm = vm_create_with_vcpus(nr_vcpus, guest_code, vcpus);
> -       __TEST_REQUIRE(__vcpu_has_ext(vcpus[0], KVM_RISCV_ISA_EXT_SSTC),
> +       __TEST_REQUIRE(__vcpu_has_ext(vcpus[0],
> RISCV_ISA_EXT_REG(KVM_RISCV_ISA_EXT_SSTC)),
>

Right Fix!
Please let me know if I need to rebase this patch series on your tree
and resent it.

Thanks,
Haibo

