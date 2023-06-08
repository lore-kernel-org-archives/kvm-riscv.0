From: Vipin Sharma <vipinsh@google.com>
Date: Thu, 8 Jun 2023 13:17:08 -0700
Subject: [PATCH v2 09/16] KVM: arm64: Document the page table walker
 actions based on the callback's return value
In-Reply-To: <20230607203711.000054ae.zhi.wang.linux@gmail.com>
References: <20230602160914.4011728-1-vipinsh@google.com> <20230602160914.4011728-10-vipinsh@google.com>
 <20230605223520.00007fbd.zhi.wang.linux@gmail.com> <ZH9tQjQk7QLyhUQR@google.com>
 <20230607203711.000054ae.zhi.wang.linux@gmail.com>
Message-ID: <CAHVum0dtZ2wW+itsOE=a7wwATu4VcGN-dQH1zF7Pz1LYy7J4UQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 7, 2023 at 5:37?AM Zhi Wang <zhi.wang.linux@gmail.com> wrote:
>
> On Tue, 6 Jun 2023 10:30:42 -0700
> Vipin Sharma <vipinsh@google.com> wrote:
>
> > On Mon, Jun 05, 2023 at 10:35:20PM +0800, Zhi Wang wrote:
> > > On Fri,  2 Jun 2023 09:09:07 -0700
> > > Vipin Sharma <vipinsh@google.com> wrote:
> > >
> > > > Document what the page table walker do when walker callback function returns
> > > > a value.
> > > >
> > > > Current documentation is not correct as negative error of -EAGAIN on a
> > > > non-shared page table walker doesn't terminate the walker and continues
> > > > to the next step.
> > > >
> > > > There might be a better place to keep this information, for now this
> > > > documentation will work as a reference guide until a better way is
> > > > found.
> > > >
> > >
> > > After reading the whole patch series, I was thinking it might be a good
> > > time to improve the way how the visitor function and page table walker
> > > talk to each other. The error code is good enough before, but its meaning
> > > seems limited and vague when the visitor function wants to express more about
> > > what exactly happens inside. I am not sure if it is a good idea to continue
> > > that way: 1. found a new situation. 2. choosing a error code for visitor
> > > function. 3. walker translates the error code into the situation to
> > > handle. 4. document the error code and its actual meaning.
> > >
> > > Eventually I am afraid that we are going to abuse the error code.
> >
> > I agree that error numbers are not sufficient and this will become more
> > difficult and cumbersome for more cases in future if we need different
> > behavior based on different error codes for different visitor functions.
> >
> > >
> > > What about introducing a set of flags for the visitor function to express
> > > what happened and simplify the existing error code?
> > >
> >
> > If I understood correctly what you meant, I think this will also end up
> > having the same issue down the line, we are just switching errors with
> > flags as they might not be able to express everything.
> >
> > "Flags for visitor function to express what happened"  - This is what
> > ret val and errors do.
> >
>
> Thanks so much for the efforts of the sample code.
>
> But when the "ret val" is an error code for pgtable matters, It turns vague.
> We have -EAGAIN to represent "retry" and "-ENONET" to represent PTE not there,
> and they seems end up with different behaviors in different types of pgtable
> walk. That is what I feels off.
>
> visitor_cb has two different requirements of returning the status: 1)
> something wrong happens *not* related to the pgtable, e.g. failing to
> allocate memory. 2) something happens related to the pgtable. e.g PTE doesn't
> exists.
>
> For 1) It is natural to return an error code and the caller might just bail out
> via its error handling path.
>
> I think the core problem is: the two different usages are mixed and they don't
> actually fit with each other. 2) is requiring more details in the future other
> than a simple error code.
>
>
> For 2) I think it is better have a set of flags. the name of the flags can
> carry more explicit meanings than error code. E.g.:
>
> ------------------
>
> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> index 4cd6762bda80..b3f24b321cd7 100644
> --- a/arch/arm64/include/asm/kvm_pgtable.h
> +++ b/arch/arm64/include/asm/kvm_pgtable.h
> @@ -204,6 +204,15 @@ enum kvm_pgtable_walk_flags {
>         KVM_PGTABLE_WALK_HANDLE_FAULT           = BIT(4),
>  };
>
> +struct kvm_pgtable_walk_status {
> +       union {
> +               u8 raw;
> +               struct {
> +                       unsigned retry:1;
> +                       unsigned stop:1;
> +                       unsigned ignore:1;
> +                       /* more to come */
> +               };
> +       };
> +};
> +
>  struct kvm_pgtable_visit_ctx {
>         kvm_pte_t                               *ptep;
>         kvm_pte_t                               old;
> @@ -213,8 +222,10 @@ struct kvm_pgtable_visit_ctx {
>         u64                                     end;
>         u32                                     level;
>         enum kvm_pgtable_walk_flags             flags;
> +       struct kvm_pgtable_walk_status          *status;
>  };
>
>  typedef int (*kvm_pgtable_visitor_fn_t)(const struct kvm_pgtable_visit_ctx *ctx,
>                                         enum kvm_pgtable_walk_flags visit);
>
> ----------------
>
> Visitor functions sets the flags via ctx->status and kvm_pgtable_walk_xxx can
> check the bits in the ctx to decide what to do for the next.
>
> I can cook a patch for re-factoring this part if we think it is a good idea.
>

This can also be one option. I will wait till others also weigh in on
how to make walkers and callbacks work together for more use cases.

