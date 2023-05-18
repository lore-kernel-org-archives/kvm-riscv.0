From: Haibo Xu <xiaobo55x@gmail.com>
Date: Thu, 18 May 2023 16:10:33 +0800
Subject: [PATCH 2/2] KVM: selftests: Add riscv get-reg-list test
In-Reply-To: <20230518-60da3b82641bdaccec589b8b@orel>
References: <cover.1683791148.git.haibo1.xu@intel.com> <751a84a9691c86df0e65cdb02abf1e073892d1ca.1683791148.git.haibo1.xu@intel.com>
 <20230511-28ec368a8168342c68ca2187@orel> <CAJve8okVFr-m6go6dCg7Cf=Uq3Yt9Xmxi0Z3B2vbWvahvx4GgA@mail.gmail.com>
 <20230518-60da3b82641bdaccec589b8b@orel>
Message-ID: <CAJve8on1qzEZ6MsaV4ZOJoKHwymeEPtd_vmY6ki1Nq9bnUPT2g@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 18, 2023 at 3:32?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Thu, May 18, 2023 at 12:17:18PM +0800, Haibo Xu wrote:
> ...
> > > The idea of these *to_str functions is to dump output that can be
> > > copy+pasted into a reg array (hence the trailing commas in print_reg
> > > lines). So we can't just print random lines here or return '##UNKOWN##',
> > > as that won't compile. Instead, the default should return
> > >
> > >   str_with_index("KVM_REG_RISCV_CONFIG_REG(##)", reg_off)
> > >
> >
> > Thanks for sharing the detailed idea, will fix it in next version!
>
> I guess we could also return a string like,
>
> "KVM_REG_RISCV_CONFIG_REG(##) /* UNKNOWN */"
>
> as that would still compile and also convey the message that this
> register doesn't have a name because the test doesn't know it yet.
>

Yes, that's more friendly and self explanatory. Thanks for the suggestion!

> ...
> > > We should share all the code above, except print_reg(), with aarch64.
> > > I'll send a patch series that splits the arch-neutral code out of
> > > the aarch64 test that you can base this test on.
> > >
> >
> > Good idea! I will rebase the patch based on your work.
> >
>
> Ok, I've pushed patches to [1]. This series introduces two things to KVM
> selftests. Primarily it splits the aarch64/get-reg-list test into a
> cross-arch get-reg-list test and an $ARCH_DIR/get-reg-list.o object file,
> which the cross-arch test depends on. To do that, it also introduces the
> concept of a "split test", a test that has a cross-arch part which depends
> on an arch-specific part. Using a split test is cleaner than the
> #ifdeffery we usually do for cross-arch tests.
>
> I've added kvmarm at lists.linux.dev, Marc, Oliver, and Sean to the CC of
> this message. You'll want to add them when you post v2 as well.
>

Sure, I will rebase your patch in v2. Thanks for your review!

> [1] https://github.com/jones-drew/linux/commits/arm64/kself/get-reg-list
>
> Thanks,
> drew

