From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 21 Jun 2023 09:30:02 +0200
Subject: [PATCH v3 10/10] KVM: riscv: selftests: Add get-reg-list test
In-Reply-To: <CAJve8onNFfHFcvAGkbtnxjzqgfq4geL1zOwJEc8Xzc=NHVDrFg@mail.gmail.com>
References: <cover.1686275310.git.haibo1.xu@intel.com>
 <8cd4ce50f5f4a639f4508085959aae222d4d4386.1686275310.git.haibo1.xu@intel.com>
 <20230609-fba04b424a4d46574e04e587@orel>
 <CAJve8okjRZEt6_6SB9EWm+6c7utpExzenfWo2T1N-J6G9w9czQ@mail.gmail.com>
 <20230620-95ce8ab70956a72b9da3a31a@orel>
 <CAJve8onNFfHFcvAGkbtnxjzqgfq4geL1zOwJEc8Xzc=NHVDrFg@mail.gmail.com>
Message-ID: <20230621-37ea9461250036cc2ec8c544@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 21, 2023 at 09:55:13AM +0800, Haibo Xu wrote:
> On Tue, Jun 20, 2023 at 6:44?PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Tue, Jun 20, 2023 at 06:05:59PM +0800, Haibo Xu wrote:
> > > On Fri, Jun 9, 2023 at 9:35?PM Andrew Jones <ajones@ventanamicro.com> wrote:
> > > >
> > > > On Fri, Jun 09, 2023 at 10:12:18AM +0800, Haibo Xu wrote:
> > > > > +static struct vcpu_reg_list aia_config = {
> > > > > +     .sublists = {
> > > > > +     BASE_SUBLIST,
> > > > > +     AIA_REGS_SUBLIST,
> > > > > +     {0},
> > > > > +     },
> > > > > +};
> > > > > +
> > > > > +static struct vcpu_reg_list fp_f_d_config = {
> > > > > +     .sublists = {
> > > > > +     BASE_SUBLIST,
> > > > > +     FP_F_REGS_SUBLIST,
> > > > > +     FP_D_REGS_SUBLIST,
> > > > > +     {0},
> > > > > +     },
> > > > > +};
> > > > > +
> > > > > +struct vcpu_reg_list *vcpu_configs[] = {
> > > > > +     &zicbo_config,
> > > > > +     &aia_config,
> > > > > +     &fp_f_d_config,
> > > > > +};
> > > > > +int vcpu_configs_n = ARRAY_SIZE(vcpu_configs);
> > > > > --
> > > > > 2.34.1
> > > > >
> > > >
> > > > I see we have a bit of a problem with the configs for riscv. Since we
> > > > don't disable anything we're not testing, then for any test that is
> > > > missing, for example, the f and d registers, we'll get output like
> > > > "There are 66 new registers. Consider adding them to the blessed reg
> > > > list with the following lines:" and then a dump of all the f and d
> > > > registers. The test doesn't fail, but it's messy and confusing. Ideally
> > > > we'd disable all registers of all sublists not in the config, probably
> > > > by starting by disabling everything and then only reenabling the ones
> > > > in the config.
> > > >
> > > > Anything that can't be disabled is either a KVM bug, i.e. we should
> > > > be able to disable it, because we can't expect every host to have it,
> > > > or it needs to be in the base register sublist (meaning every host
> > > > will always have it).
> > > >
> > >
> > > HI Andrew,
> > >
> > > I found several multi-letters ISA EXT(AIA/SSTC etc) were not allowed
> > > to be disabled.
> > > Is it a bug? shall we fix it?
> >
> > Extensions that a guest could use (regardless of whether or not the host
> > described it in the guest's isa string), because the instructions or CSR
> > accesses don't trap, can't truly be disabled. So, it's not a bug to
> > prohibit disabling them and indeed the test cases should actually ensure
> > disabling them fails.
> >
> 
> So these kinds of ISA_EXT_* regs should be in the base reg list, right?
>

Ah, this is getting a bit messy. We don't want all these extensions in a
"base", which represents extensions for all possible hosts, because the
extensions are optional, but, we can't remove them from get-reg-list
output by disabling them, since they can't be disabled. It seems we
need the concept of "base", which is the common set expected on all hosts,
and also the concept of "this host's base". I'm struggling to think of
a nice way to deal with that. A first thought is to both add these types
of registers to their own extension-specific sublists and to filter_reg().
I think that will keep them from being reported as new registers in every
test, but also allow detection of them going missing when they're
extension is present.

Thanks,
drew

