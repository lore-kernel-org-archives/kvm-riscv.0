From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Tue, 25 Jun 2024 18:37:53 +0800
Subject: [PATCH v5 1/4] RISC-V: Add Svade and Svadu Extensions Support
In-Reply-To: <20240621-a69c8f97e566ebd3a82654c1@orel>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-2-yongxuan.wang@sifive.com> <20240621-d1b77d43adacaa34337238c2@orel>
 <20240621-nutty-penknife-ca541ee5108d@wendy> <20240621-b22a7c677a8d61c26feaa75b@orel>
 <20240621-pushpin-exclude-1b4f38ae7e8d@wendy> <20240621-a69c8f97e566ebd3a82654c1@orel>
Message-ID: <CAMWQL2jWPD77f2gz_N8HM+YdKev-8RvOCOUgm5-uxq-5VTvCXw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Conor, Andrew and Alexandre,

On Fri, Jun 21, 2024 at 8:06?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Fri, Jun 21, 2024 at 12:00:32PM GMT, Conor Dooley wrote:
> > On Fri, Jun 21, 2024 at 12:42:32PM +0200, Andrew Jones wrote:
> > > On Fri, Jun 21, 2024 at 11:24:19AM GMT, Conor Dooley wrote:
> > > > On Fri, Jun 21, 2024 at 10:43:58AM +0200, Andrew Jones wrote:
> ...
> > > > > It's hard to guess what is, or will be, more likely to be the correct
> > > > > choice of call between the _unlikely and _likely variants. But, while we
> > > > > assume svade is most prevalent right now, it's actually quite unlikely
> > > > > that 'svade' will be in the DT, since DTs haven't been putting it there
> > > > > yet. Anyway, it doesn't really matter much and maybe the _unlikely vs.
> > > > > _likely variants are better for documenting expectations than for
> > > > > performance.
> > > >
> > > > binding hat off, and kernel hat on, what do we actually do if there's
> > > > neither Svadu or Svade in the firmware's description of the hardware?
> > > > Do we just arbitrarily turn on Svade, like we already do for some
> > > > extensions:
> > > >   /*
> > > >    * These ones were as they were part of the base ISA when the
> > > >    * port & dt-bindings were upstreamed, and so can be set
> > > >    * unconditionally where `i` is in riscv,isa on DT systems.
> > > >    */
> > > >   if (acpi_disabled) {
> > > >           set_bit(RISCV_ISA_EXT_ZICSR, isainfo->isa);
> > > >           set_bit(RISCV_ISA_EXT_ZIFENCEI, isainfo->isa);
> > > >           set_bit(RISCV_ISA_EXT_ZICNTR, isainfo->isa);
> > > >           set_bit(RISCV_ISA_EXT_ZIHPM, isainfo->isa);
> > > >   }
> > > >
> > >
> > > Yes, I think that's reasonable, assuming we do it in the final "pass",
> > > where we're sure svadu isn't present.
> >
> > I haven't thought about specifically when to do it, but does it need to
> > be in the final pass? If we were to, on each CPU, enable it if Svadu
> > isn't there, we'd either end up with a system that I suspect we're not
> > going to be supporting or the correct result. Or am I misunderstanding,
> > and it will be valid to have a subset of CPUs that have Svadu enabled
> > from the bootloader?
> >
> > Note that it would not be problematic to have 3 CPUs with Svade + Svadu
> > and a 4th with only Svade in the DT because we would just not use the
> > FWFT mechanism to enable Svadu. It's just the Svadu in isolation case
> > that I'm asking about.
>
> I wasn't thinking about the potential of mixmatched A/D udpating. I'm
> pretty sure this will be one of those things that is all or none. I
> was more concerned with getting the result right and I had just been
> too lazy to double check that the block of code you pointed out is
> in the right place to be sure there's no svadu. Now that I look, I
> believe it is.
>
> >
> > > Doing this is a good idea since
> > > we'll be able to simplify conditions, as we can just use 'if (svade)'
> > > since !svade would imply svadu. With FWFT and both, we'll want to remove
> > > svade from the isa bitmap when enabling svadu.
> >
> > Right I would like to move the various extension stuff in this
> > direction, where they have a bit more intelligence to them, and don't
> > just reflect the state in DT/ACPI directly.
> > I've got some patches in mind once Clement's Zca etc patchset
> > is merged, think I posted one or two as replies to conversations on
> > the list already. An example would be disabling the vector crypto
> > extensions if we've had to disable vector, or as you suggest here,
> > dropping Svade if we have turned on Svadu using FWFT. I think that makes
> > the APIs more understandable to developers and more useful than they are
> > at the moment, where to use vector crypto you also need to check vector
> > itself for the code to be correct. If I call
> > riscv_isa_extension_available(), and it returns true, the extension
> > should be usable IMO.

Thank you all very much! I will update the code so that
riscv_isa_extension_available()
can reflect the platform's behavior.

Regards,
Yong-Xuan

>
> Sounds good to me.
>
> Thanks,
> drew

