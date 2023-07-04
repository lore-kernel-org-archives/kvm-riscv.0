From: Haibo Xu <xiaobo55x@gmail.com>
Date: Tue, 4 Jul 2023 09:09:56 +0800
Subject: [PATCH v5 10/13] KVM: selftests: Only do get/set tests on present
 blessed list
In-Reply-To: <20230702-49c5545eb1ae2d0cf11c7b95@orel>
References: <cover.1688010022.git.haibo1.xu@intel.com> <f44c3aa46971d524319c6340f9ce1b00c0182fd2.1688010022.git.haibo1.xu@intel.com>
 <20230702-49c5545eb1ae2d0cf11c7b95@orel>
Message-ID: <CAJve8om-r67p7WojymsfP0T3MdZWchhujCZMzGyQ8de2AbykBQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 3, 2023 at 4:18?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Sat, Jul 01, 2023 at 09:42:58PM +0800, Haibo Xu wrote:
> > Only do the get/set tests on present and blessed registers
> > since we don't know the capabilities of any new ones.
> >
> > Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> > Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  tools/testing/selftests/kvm/get-reg-list.c | 29 ++++++++++++++--------
> >  1 file changed, 18 insertions(+), 11 deletions(-)
> >
> > diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
> > index c61090806007..74fb6f6fdd09 100644
> > --- a/tools/testing/selftests/kvm/get-reg-list.c
> > +++ b/tools/testing/selftests/kvm/get-reg-list.c
> > @@ -49,6 +49,10 @@ extern int vcpu_configs_n;
> >       for_each_reg_filtered(i)                                                \
> >               if (!find_reg(blessed_reg, blessed_n, reg_list->reg[i]))
> >
> > +#define for_each_present_blessed_reg(i)                      \
> > +     for ((i) = 0; (i) < blessed_n; ++(i))           \
> > +             if (find_reg(reg_list->reg, reg_list->n, blessed_reg[i]))
>
> I just realized this is backwards. We need 'i' to index reg_list->reg in
> the body of the loop. That means we need to write this as
>
> #define for_each_present_blessed_reg(i)                                         \
>         for_each_reg(i)                                                         \
>                 if (find_reg(blessed_reg, blessed_n, reg_list->reg[i]))
>
> (Which, in hindsight, makes sense since we're replacing a for_each_reg()
> loop.)
>

Sure, I will update it in v6.

Thanks!

> Thanks,
> drew

