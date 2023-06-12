From: Haibo Xu <xiaobo55x@gmail.com>
Date: Mon, 12 Jun 2023 17:44:27 +0800
Subject: [PATCH v3 09/10] KVM: riscv: selftests: Skip some registers set operation
In-Reply-To: <20230612-05314de3b73277af1ee729b0@orel>
References: <cover.1686275310.git.haibo1.xu@intel.com> <73045958d9ab71d5266d012f1e13061afa8c5331.1686275310.git.haibo1.xu@intel.com>
 <20230609-05521f954b0485c69612f00b@orel> <CAJve8omPV_XgCSvw8POZwisb6uTOFMJU4FyAKArryui2SAsqtw@mail.gmail.com>
 <20230612-05314de3b73277af1ee729b0@orel>
Message-ID: <CAJve8om8tjsXejtBWjuSg+kCUgfDdzq2AS2abC0qx9q2a7eSQw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 12, 2023 at 4:57?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Sat, Jun 10, 2023 at 10:35:24AM +0800, Haibo Xu wrote:
> > On Fri, Jun 9, 2023 at 5:24?PM Andrew Jones <ajones@ventanamicro.com> wrote:
> > >
> > > On Fri, Jun 09, 2023 at 10:12:17AM +0800, Haibo Xu wrote:
> > > > Set operation on some riscv registers(mostly pesudo ones) was not
> > > > supported and should be skipped in the get-reg-list test. Just
> > > > reuse the rejects_set utilities to handle it in riscv.
> > > >
> > > > Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> > > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > > > ---
> > > >  tools/testing/selftests/kvm/get-reg-list.c | 20 +++++++++++++-------
> > > >  1 file changed, 13 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
> > > > index c4bd5a5259da..abacb95c21c6 100644
> > > > --- a/tools/testing/selftests/kvm/get-reg-list.c
> > > > +++ b/tools/testing/selftests/kvm/get-reg-list.c
> > > > @@ -211,16 +211,22 @@ static void run_test(struct vcpu_reg_list *c)
> > > >                       ++failed_get;
> > > >               }
> > > >
> > > > -             /* rejects_set registers are rejected after KVM_ARM_VCPU_FINALIZE */
> > > > +             /*
> > > > +              * rejects_set registers are rejected after KVM_ARM_VCPU_FINALIZE on aarch64,
> > > > +              * or registers that should skip set operation on riscv.
> > > > +              */
> > > >               for_each_sublist(c, s) {
> > > >                       if (s->rejects_set && find_reg(s->rejects_set, s->rejects_set_n, reg.id)) {
> > > >                               reject_reg = true;
> > > > -                             ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> > > > -                             if (ret != -1 || errno != EPERM) {
> > > > -                                     printf("%s: Failed to reject (ret=%d, errno=%d) ", config_name(c), ret, errno);
> > > > -                                     print_reg(config_name(c), reg.id);
> > > > -                                     putchar('\n');
> > > > -                                     ++failed_reject;
> > > > +                             if ((reg.id & KVM_REG_ARCH_MASK) == KVM_REG_ARM64) {
> > > > +                                     ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> > > > +                                     if (ret != -1 || errno != EPERM) {
> > > > +                                             printf("%s: Failed to reject (ret=%d, errno=%d) ",
> > > > +                                                             config_name(c), ret, errno);
> > > > +                                             print_reg(config_name(c), reg.id);
> > > > +                                             putchar('\n');
> > > > +                                             ++failed_reject;
> > > > +                                     }
> > >
> > > Thinking about this some more, shouldn't we attempt the set ioctl for
> > > riscv reject registers as well, but look for different error numbers?
> > >
> >
> > Yes, we can. Currently, 2 different errno(EOPNOTSUPP/EINVAL) would be
> > reported for the rejected registers in risc-v.
> > These 2 errnos can be handled specially like below:
> >
> > diff --git a/tools/testing/selftests/kvm/get-reg-list.c
> > b/tools/testing/selftests/kvm/get-reg-list.c
> > index 73f40e0842b8..f3f2c4519318 100644
> > --- a/tools/testing/selftests/kvm/get-reg-list.c
> > +++ b/tools/testing/selftests/kvm/get-reg-list.c
> > @@ -255,6 +255,15 @@ static void run_test(struct vcpu_reg_list *c)
> >                                                 putchar('\n');
> >                                                 ++failed_reject;
> >                                         }
> > +                } else {
> > +                                       ret = __vcpu_ioctl(vcpu,
> > KVM_SET_ONE_REG, &reg);
> > +                                       if (ret != -1 || (errno !=
> > EINVAL && errno != EOPNOTSUPP)) {
> > +                                               printf("%s: Failed to
> > reject (ret=%d, errno=%d) ",
> > +
> > config_name(c), ret, errno);
> > +
> > print_reg(config_name(c), reg.id);
> > +                                               putchar('\n');
> > +                                               ++failed_reject;
> > +                                       }
>
> Instead of duplicating the code Arm uses, we just need an errno check
> function, preferably one that takes the register as an input, so we
> can check for specific errnos for specific registers.
>
> >
> > One possible issue for the above change is that when new registers
> > that don't support sets were added, we need
> > to add them to the reject registers list, or the test would fail.
> >
> > Initially, in the v1 patch, the design was to just skip the EOPNOTSUPP
> > errno in set operations for all registers
> > since it's a known errno for registers that don't support sets. This
> > change cover all the registers even for future
> > new ones.
> >
> > What's your opinion?
>
> I think we should only do the get/set tests on present, blessed list
> registers, since if it's a new register we don't know its capabilities.
>
> So, instead of
>
>   for_each_reg(i) {
>      /* get/set tests */
>   }
>
> we do
>
>   for_each_present_blessed_reg(i) {
>      /* get/set tests */
>   }
>
> where we have
>
>  #define for_each_present_blessed_reg(i) \
>      for ((i) = 0; (i) < blessed_n; ++(i)) \
>          if (find_reg(reg_list->reg, reg_list->n, blessed_reg[i]))
>
>
> Changing run_test() to work this way should be a separate patch.
>

Good idea! let me have a try.

Thanks,
Haibo

> Thanks,
> drew

