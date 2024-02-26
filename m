From: Haibo Xu <xiaobo55x@gmail.com>
Date: Mon, 26 Feb 2024 13:47:42 +0800
Subject: [PATCH v5 11/12] KVM: riscv: selftests: Change vcpu_has_ext to a
 common function
In-Reply-To: <CAAhSdy2TVSt=gCJRf78AzXNVFKy8MGJ+QspSEHeedT7GPAYkUQ@mail.gmail.com>
References: <cover.1705916069.git.haibo1.xu@intel.com> <68856b86a93a4188558e5d0ebac0dd6aac8e404c.1705916069.git.haibo1.xu@intel.com>
 <CAOnJCULwRTSnrQkR2o1P53R=tJ3TAxX+y+XRBesW6OFEzgFv2g@mail.gmail.com>
 <CAJve8om2oOLg5-wKX7m7cBTgzwqiMcb35x=nDi1edY8evXjyMw@mail.gmail.com>
 <2c96c61a-2685-4cee-9cef-963ed833bf92@rivosinc.com> <CAAhSdy2TVSt=gCJRf78AzXNVFKy8MGJ+QspSEHeedT7GPAYkUQ@mail.gmail.com>
Message-ID: <CAJve8onL5YB2w6duAr2H=8yJMh=SPsZCvgu+suhd=9U1_egHOg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 26, 2024 at 1:20?PM Anup Patel <anup@brainfault.org> wrote:
>
> On Wed, Feb 21, 2024 at 2:07?PM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > On 2/20/24 18:13, Haibo Xu wrote:
> > > On Wed, Feb 21, 2024 at 7:03?AM Atish Patra <atishp@atishpatra.org> wrote:
> > >>
> > >> On Mon, Jan 22, 2024 at 1:48?AM Haibo Xu <haibo1.xu@intel.com> wrote:
> > >>>
> > >>> Move vcpu_has_ext to the processor.c and rename it to __vcpu_has_ext
> > >>> so that other test cases can use it for vCPU extension check.
> > >>>
> > >>> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> > >>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > >>> ---
> > >>>   tools/testing/selftests/kvm/include/riscv/processor.h |  2 ++
> > >>>   tools/testing/selftests/kvm/lib/riscv/processor.c     | 10 ++++++++++
> > >>>   tools/testing/selftests/kvm/riscv/get-reg-list.c      | 11 +----------
> > >>>   3 files changed, 13 insertions(+), 10 deletions(-)
> > >>>
> > >>> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> > >>> index b68b1b731a34..bd27e1c67579 100644
> > >>> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> > >>> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> > >>> @@ -42,6 +42,8 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t idx,
> > >>>   #define RISCV_ISA_EXT_REG(idx) __kvm_reg_id(KVM_REG_RISCV_ISA_EXT, \
> > >>>                                               idx, KVM_REG_SIZE_ULONG)
> > >>>
> > >>> +bool __vcpu_has_ext(struct kvm_vcpu *vcpu, int ext);
> > >>> +
> > >>>   struct ex_regs {
> > >>>          unsigned long ra;
> > >>>          unsigned long sp;
> > >>> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
> > >>> index 39a1e9902dec..dad73ce18164 100644
> > >>> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> > >>> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> > >>> @@ -15,6 +15,16 @@
> > >>>
> > >>>   static vm_vaddr_t exception_handlers;
> > >>>
> > >>> +bool __vcpu_has_ext(struct kvm_vcpu *vcpu, int ext)
> > >>> +{
> > >>> +       unsigned long value = 0;
> > >>> +       int ret;
> > >>> +
> > >>> +       ret = __vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(ext), &value);
> > >>> +
> > >>> +       return !ret && !!value;
> > >>> +}
> > >>> +
> > >>
> > >> Not sure what was the base patch on which this was rebased. The actual
> > >> commit in the queue branch looks different.
> > >>
> > >
> > > This patch set was based on 6.7-rc8.
> > >
> > >> https://github.com/kvm-riscv/linux/commit/5563517cc2012e3326411b360c9924d3f2706c8d
> > >>
> > >> Both seem to have the same bug though the tests fail now and require
> > >> the following fix.
> > >> The ext id should be uint64_t and we need to pass ext directly so that
> > >> SBI extension tests can also pass.
> > >>
> > >
> > > It's weird that 6.7-rc8 has already included Andrew's change on the ISA ext reg,
> > > but this patch was not generated against his change.
> > >
> > > commit bdf6aa328f137e184b0fce607fd585354c3742f1
> > > Author: Andrew Jones <ajones@ventanamicro.com>
> > > Date:   Wed Dec 13 18:09:58 2023 +0100
> > >
> > >      RISC-V: KVM: selftests: Treat SBI ext regs like ISA ext regs
> > >
> > > Anyway, your changes were right. Please go ahead to include them when merging.
> > >
> >
> > I am not sure what happened. Probably, a merge conflict issue.
> >
> > I just realized I forgot to copy paste another fix in arch timer
> >
> > +++ b/tools/testing/selftests/kvm/riscv/arch_timer.c
> > @@ -85,7 +85,7 @@ struct kvm_vm *test_vm_create(void)
> >          int nr_vcpus = test_args.nr_vcpus;
> >
> >          vm = vm_create_with_vcpus(nr_vcpus, guest_code, vcpus);
> > -       __TEST_REQUIRE(__vcpu_has_ext(vcpus[0], KVM_RISCV_ISA_EXT_SSTC),
> > +       __TEST_REQUIRE(__vcpu_has_ext(vcpus[0],
> > RISCV_ISA_EXT_REG(KVM_RISCV_ISA_EXT_SSTC)),
>
> I have squashed this change into an existing commit in riscv_kvm_queue.
>
> Thanks,
> Anup
>

Thanks a lot, Anup!

> >
> >
> > > Thanks,
> > > Haibo
> > >
> > >>
> > >> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> > >> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> > >> @@ -48,7 +48,7 @@ static inline uint64_t __kvm_reg_id(uint64_t type,
> > >> uint64_t subtype,
> > >> KVM_REG_RISCV_SBI_SINGLE, \
> > >> idx, KVM_REG_SIZE_ULONG)
> > >>
> > >> -bool __vcpu_has_ext(struct kvm_vcpu *vcpu, int ext);
> > >> +bool __vcpu_has_ext(struct kvm_vcpu *vcpu, uint64_t ext);
> > >>
> > >> struct ex_regs {
> > >> unsigned long ra;
> > >> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c
> > >> b/tools/testing/selftests/kvm/lib/riscv/processor.c
> > >> index 282587cd4bbc..ec66d331a127 100644
> > >> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> > >> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> > >> @@ -15,12 +15,12 @@
> > >>
> > >> static vm_vaddr_t exception_handlers;
> > >>
> > >> -bool __vcpu_has_ext(struct kvm_vcpu *vcpu, int ext)
> > >> +bool __vcpu_has_ext(struct kvm_vcpu *vcpu, uint64_t ext)
> > >> {
> > >> unsigned long value = 0;
> > >> int ret;
> > >>
> > >> - ret = __vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(ext), &value);
> > >> + ret = __vcpu_get_reg(vcpu, ext, &value);
> > >>
> > >> return !ret && !!value;
> > >> }
> > >>
> > >> With the above the fix, Both SBI/ISA extension tests pass.
> > >> # ./get-reg-list
> > >> sbi-base: PASS
> > >> sbi-sta: PASS
> > >> sbi-pmu: PASS
> > >> sbi-dbcn: PASS
> > >> aia: PASS
> > >> fp_f: PASS
> > >> fp_d: PASS
> > >> 1..0 # SKIP - h not available, skipping tests
> > >> smstateen: PASS
> > >> sscofpmf: PASS
> > >> sstc: PASS
> > >> 1..0 # SKIP - svinval not available, skipping tests
> > >> 1..0 # SKIP - svnapot not available, skipping tests
> > >> 1..0 # SKIP - svpbmt not available, skipping tests
> > >> zba: PASS
> > >> zbb: PASS
> > >> zbc: PASS
> > >> 1..0 # SKIP - zbkb not available, skipping tests
> > >> 1..0 # SKIP - zbkc not available, skipping tests
> > >> 1..0 # SKIP - zbkx not available, skipping tests
> > >> zbs: PASS
> > >> zfa: PASS
> > >> 1..0 # SKIP - zfh not available, skipping tests
> > >> 1..0 # SKIP - zfhmin not available, skipping tests
> > >> zicbom: PASS
> > >> zicboz: PASS
> > >> zicntr: PASS
> > >> 1..0 # SKIP - zicond not available, skipping tests
> > >> zicsr: PASS
> > >> zifencei: PASS
> > >> zihintntl: PASS
> > >> zihintpause: PASS
> > >> zihpm: PASS
> > >>
> > >>
> > >>>   static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
> > >>>   {
> > >>>          return (v + vm->page_size) & ~(vm->page_size - 1);
> > >>> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > >>> index 25de4b8bc347..ed29ba45588c 100644
> > >>> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > >>> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > >>> @@ -75,15 +75,6 @@ bool check_reject_set(int err)
> > >>>          return err == EINVAL;
> > >>>   }
> > >>>
> > >>> -static inline bool vcpu_has_ext(struct kvm_vcpu *vcpu, int ext)
> > >>> -{
> > >>> -       int ret;
> > >>> -       unsigned long value;
> > >>> -
> > >>> -       ret = __vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(ext), &value);
> > >>> -       return (ret) ? false : !!value;
> > >>> -}
> > >>> -
> > >>>   void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
> > >>>   {
> > >>>          unsigned long isa_ext_state[KVM_RISCV_ISA_EXT_MAX] = { 0 };
> > >>> @@ -111,7 +102,7 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
> > >>>                  __vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(s->feature), 1);
> > >>>
> > >>>                  /* Double check whether the desired extension was enabled */
> > >>> -               __TEST_REQUIRE(vcpu_has_ext(vcpu, s->feature),
> > >>> +               __TEST_REQUIRE(__vcpu_has_ext(vcpu, s->feature),
> > >>>                                 "%s not available, skipping tests\n", s->name);
> > >>>          }
> > >>>   }
> > >>> --
> > >>> 2.34.1
> > >>>
> > >>
> > >>
> > >> --
> > >> Regards,
> > >> Atish
> >

