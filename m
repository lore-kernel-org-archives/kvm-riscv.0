From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 6 Sep 2023 18:10:24 +0800
Subject: [PATCH v2 7/8] KVM: riscv: selftest: Change vcpu_has_ext to a
 common function
In-Reply-To: <20230904-aa8b0d8d23d391586686038a@orel>
References: <cover.1693659382.git.haibo1.xu@intel.com> <b6ef1b031e3a581f481cf19a26623388163444b4.1693659382.git.haibo1.xu@intel.com>
 <20230904-aa8b0d8d23d391586686038a@orel>
Message-ID: <CAJve8ok5cU+h1K+WJ+aDpB+u+PBo8XosUyyVbMGy-xR0XiWFdw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 4, 2023 at 10:04?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Sat, Sep 02, 2023 at 08:59:29PM +0800, Haibo Xu wrote:
> > diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > index d8ecacd03ecf..c4028bf32e3f 100644
> > --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > @@ -44,20 +44,6 @@ bool check_reject_set(int err)
> >       return err == EINVAL;
> >  }
> >
> > -static inline bool vcpu_has_ext(struct kvm_vcpu *vcpu, int ext)
> > -{
> > -     int ret;
> > -     unsigned long value;
> > -
> > -     ret = __vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(ext), &value);
> > -     if (ret) {
> > -             printf("Failed to get ext %d", ext);
> > -             return false;
> > -     }
> > -
> > -     return !!value;
>
> get-reg-list will now assert on get-reg when an extension isn't present,
> rather than failing the __TEST_REQUIRE(), which would do a skip instead.
> We need both the return false version and the assert version.
>

Ok, Will keep this one for get-reg-list and add another one for
arch-timer specific usage.

> > -}
> > -
> >  void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
> >  {
> >       struct vcpu_reg_sublist *s;
> > --
> > 2.34.1
> >
>
> Thanks,
> drew

