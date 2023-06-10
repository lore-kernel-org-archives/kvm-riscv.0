From: Haibo Xu <xiaobo55x@gmail.com>
Date: Sat, 10 Jun 2023 10:39:52 +0800
Subject: [PATCH v3 07/10] KVM: arm64: selftests: Finish generalizing get-reg-list
In-Reply-To: <20230609-b900162a66c26a004b751b1f@orel>
References: <cover.1686275310.git.haibo1.xu@intel.com> <450cb59db52ebeaa68f3d77f1bd995618f3612b8.1686275310.git.haibo1.xu@intel.com>
 <20230609-b900162a66c26a004b751b1f@orel>
Message-ID: <CAJve8ontMqvxyXWCY2DWziqti5umRuO+YOiWkXqLhyONWWsLKg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 9, 2023 at 8:30?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Fri, Jun 09, 2023 at 10:12:15AM +0800, Haibo Xu wrote:
> > From: Andrew Jones <ajones@ventanamicro.com>
> >
> > Add some unfortunate #ifdeffery to ensure the common get-reg-list.c
> > can be compiled and run with other architectures. The next
> > architecture to support get-reg-list should now only need to provide
> > $(ARCH_DIR)/get-reg-list.c where arch-specific print_reg() and
> > vcpu_configs[] get defined.
> >
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> > ---
> >  tools/testing/selftests/kvm/get-reg-list.c | 24 ++++++++++++++++++----
> >  1 file changed, 20 insertions(+), 4 deletions(-)
> >
> > diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
> > index 69bb91087081..c4bd5a5259da 100644
> > --- a/tools/testing/selftests/kvm/get-reg-list.c
> > +++ b/tools/testing/selftests/kvm/get-reg-list.c
> > @@ -98,6 +98,7 @@ void __weak print_reg(const char *prefix, __u64 id)
> >       printf("\t0x%llx,\n", id);
> >  }
> >
> > +#ifdef __aarch64__
> >  static void prepare_vcpu_init(struct vcpu_reg_list *c, struct kvm_vcpu_init *init)
> >  {
> >       struct vcpu_reg_sublist *s;
> > @@ -120,6 +121,24 @@ static void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
> >       }
> >  }
> >
> > +static struct kvm_vcpu *vcpu_config_get_vcpu(struct vcpu_reg_list *c, struct kvm_vm *vm)
> > +{
> > +     struct kvm_vcpu_init init = { .target = -1, };
> > +     struct kvm_vcpu *vcpu;
> > +
> > +     prepare_vcpu_init(c, &init);
> > +     vcpu = __vm_vcpu_add(vm, 0);
> > +     aarch64_vcpu_setup(vcpu, &init);
> > +
> > +     return vcpu;
> > +}
> > +#else
> > +static struct kvm_vcpu *vcpu_config_get_vcpu(struct vcpu_reg_list *c, struct kvm_vm *vm)
> > +{
> > +     return __vm_vcpu_add(vm, 0);
> > +}
> > +#endif
> > +
> >  static void check_supported(struct vcpu_reg_list *c)
> >  {
> >       struct vcpu_reg_sublist *s;
> > @@ -139,7 +158,6 @@ static bool print_filtered;
> >
> >  static void run_test(struct vcpu_reg_list *c)
> >  {
> > -     struct kvm_vcpu_init init = { .target = -1, };
> >       int new_regs = 0, missing_regs = 0, i, n;
> >       int failed_get = 0, failed_set = 0, failed_reject = 0;
> >       struct kvm_vcpu *vcpu;
> > @@ -149,9 +167,7 @@ static void run_test(struct vcpu_reg_list *c)
> >       check_supported(c);
> >
> >       vm = vm_create_barebones();
> > -     prepare_vcpu_init(c, &init);
> > -     vcpu = __vm_vcpu_add(vm, 0);
> > -     aarch64_vcpu_setup(vcpu, &init);
> > +     vcpu = vcpu_config_get_vcpu(c, vm);
> >       finalize_vcpu(vcpu, c);
>
> I just noticed that this has been modified from what I posted to leave
> the finalize_vcpu() call here, despite it now being inside the #ifdef
> __aarch64__. That breaks the purpose of the patch. Please make sure this
> file compiles for other architectures without requiring additional
> patches, which would keep the commit message honest. You can either
> revert this to what I posted, and then readd the finalize_vcpu() call in
> another patch, or you can add a finalize_vcpu() stub to the #else part
> of the ifdef in this patch.
>
> Also please don't modify patches authored by others without calling out
> the modifications somewhere, either the commit message or under the ---
> of the patch or in the cover letter.
>

Thanks for pointing it out! I will have a check about it.

> Thanks,
> drew

