From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 26 May 2023 10:44:05 +0200
Subject: [PATCH v2 09/11] KVM: riscv: selftests: Make check_supported
 arch specific
In-Reply-To: <CAJve8onF9MFuaVsThFnhjWr6ZomB0Lhr9WXGvMiJDt5vrjeKLg@mail.gmail.com>
References: <cover.1684999824.git.haibo1.xu@intel.com>
 <26dea518fc5e8da51e61db279d175364bfecd009.1684999824.git.haibo1.xu@intel.com>
 <20230525-705ddcbcd43aa63e3fd356c8@orel>
 <CAJve8onF9MFuaVsThFnhjWr6ZomB0Lhr9WXGvMiJDt5vrjeKLg@mail.gmail.com>
Message-ID: <20230526-d8d768a23cd6bdc274bc165c@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 26, 2023 at 03:50:32PM +0800, Haibo Xu wrote:
> On Fri, May 26, 2023 at 12:40?AM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Thu, May 25, 2023 at 03:38:33PM +0800, Haibo Xu wrote:
> > > check_supported() was used to verify whether a feature/extension was
> > > supported in a guest in the get-reg-list test. Currently this info
> > > can be retrieved through the KVM_CAP_ARM_* API in aarch64, but in
> > > riscv, this info was only exposed through the KVM_GET_ONE_REG on
> > > KVM_REG_RISCV_ISA_EXT pseudo registers.
> > >
> > > Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> > > ---
> > >  tools/testing/selftests/kvm/get-reg-list.c | 32 +++++++++++-----------
> > >  1 file changed, 16 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
> > > index f6ad7991a812..f1fc113e9719 100644
> > > --- a/tools/testing/selftests/kvm/get-reg-list.c
> > > +++ b/tools/testing/selftests/kvm/get-reg-list.c
> > > @@ -99,6 +99,20 @@ void __weak print_reg(const char *prefix, __u64 id)
> > >  }
> > >
> > >  #ifdef __aarch64__
> > > +static void check_supported(struct vcpu_reg_list *c)
> > > +{
> > > +     struct vcpu_reg_sublist *s;
> > > +
> > > +     for_each_sublist(c, s) {
> > > +             if (!s->capability)
> > > +                     continue;
> >
> > I was going to say that making this function aarch64 shouldn't be
> > necessary, since riscv leaves capability set to zero and this function
> > doesn't do anything, but then looking ahead I see riscv is abusing
> > capability by putting isa extensions in it. IMO, capability should
> > only be set to KVM_CAP_* values. Since riscv doesn't use it, then it
> > should be left zero.
> >
> > If we're going to abuse something, then I'd rather abuse the 'feature'
> > member, but since it's only an int (not an unsigned long), then let's
> > just add an 'unsigned long extension' member.
> >
> 
> Good idea!
> 
> For the new 'extension' member in riscv, I think its use case should be
> identical to the 'feature' member in aarch64(KVM_RISCV_ISA_EXT_F
> was similar to KVM_ARM_VCPU_SVE)? If so, I think we can just reuse
> the 'feature' member since the data type was not a big deal.

You're right. An int is fine for the isa extension index, which is all we
need to represent.

Thanks,
drew

