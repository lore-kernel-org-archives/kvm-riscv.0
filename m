From: Jisheng Zhang <jszhang@kernel.org>
Date: Wed, 17 Aug 2022 22:30:07 +0800
Subject: [PATCH] riscv: Ensure isa-ext static keys are writable
In-Reply-To: <mhng-dd00cb27-4162-48aa-834d-30fb90e194cf@palmer-mbp2014>
References: <CAOnJCU+Gx44ESHWyku7Kb6u5QnzjXiZcat5XmVWjksdFpcQ6nA@mail.gmail.com>
 <mhng-dd00cb27-4162-48aa-834d-30fb90e194cf@palmer-mbp2014>
Message-ID: <Yvz7byY9F0ow1bgf@xhacker>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 16, 2022 at 09:29:36PM -0700, Palmer Dabbelt wrote:
> On Tue, 16 Aug 2022 16:41:46 PDT (-0700), atishp at atishpatra.org wrote:
> > On Tue, Aug 16, 2022 at 9:31 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> > > 
> > > riscv_isa_ext_keys[] is an array of static keys used in the unified
> > > ISA extension framework. The keys added to this array may be used
> > > anywhere, including in modules. Ensure the keys remain writable by
> > > placing them in the data section.
> > > 
> > > The need to change riscv_isa_ext_keys[]'s section was found when the
> > > kvm module started failing to load. Commit 8eb060e10185 ("arch/riscv:
> > > add Zihintpause support") adds a static branch check for a newly
> > > added isa-ext key to cpu_relax(), which kvm uses.
> >> > > 
> > > Fixes: c360cbec3511 ("riscv: introduce unified static key mechanism for ISA extensions")
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > > > ---
> > >  arch/riscv/kernel/cpufeature.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > > index 553d755483ed..3b5583db9d80 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -28,7 +28,7 @@ unsigned long elf_hwcap __read_mostly;
> > >  /* Host ISA bitmap */
> > >  static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
> > > 
> > > -__ro_after_init DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
> > > +DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
> > >  EXPORT_SYMBOL(riscv_isa_ext_keys);
> > > 
> > >  /**
> > > --
> > > 2.37.1
> > > 
> > > 
> > > --
> > > kvm-riscv mailing list
> > > kvm-riscv at lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/kvm-riscv
> > 
> > Thanks for the quick fix. Tested with kvm guests booting in Qemu.
> > 
> > Tested-by: Atish Patra <atishp@rivosinc.com>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

Thanks for catching the bug in my code.

> 
> Thanks, I hadn't realized how static keys work but looks like having them as
> __ro_after_init was always bogus.  Sorry to break stuff, looks like I should be

Sorry for breaking the static isa extension key usage in modules.
It's a good idea to make them readonly, but need to cope with the usage
in module properly. This may be a good improvement item.

> loading some module (probably KVM, as it's in the defconfig) during testing.
> 
> This is on fixes, I'm planning on sending it up later this week.

