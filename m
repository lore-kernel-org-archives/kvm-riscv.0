From: Conor Dooley <conor@kernel.org>
Date: Tue, 06 Dec 2022 21:44:05 -0000
Subject: [PATCH v2 09/13] riscv: switch to relative alternative entries
In-Reply-To: <Y49WvYWIsFAIeabH@xhacker>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <20221204174632.3677-10-jszhang@kernel.org>
 <CAJF2gTRxm7LJFtups5fexJ5ishm9_j3e+yzfKv3nTtQqUtXPtA@mail.gmail.com>
 <Y44LuRcQYPnVnFje@xhacker>
 <CAJF2gTQ98fyTNc6d3PJrkMjUjUstN8s1FcRNyZQCLiN5CV5NCw@mail.gmail.com>
 <Y49WvYWIsFAIeabH@xhacker>
Message-ID: <Y4+3nJ53nvmmc8+z@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Jisheng, Guo Ren,

On Tue, Dec 06, 2022 at 10:50:37PM +0800, Jisheng Zhang wrote:
> On Tue, Dec 06, 2022 at 12:34:40PM +0800, Guo Ren wrote:
> > On Mon, Dec 5, 2022 at 11:28 PM Jisheng Zhang <jszhang@kernel.org> wrote:
> > > On Mon, Dec 05, 2022 at 08:51:41AM +0800, Guo Ren wrote:
> > > > On Mon, Dec 5, 2022 at 1:57 AM Jisheng Zhang <jszhang@kernel.org> wrote:
> > > > >
> > > > > Instead of using absolute addresses for both the old instrucions and
> > > > > the alternative instructions, use offsets relative to the alt_entry
> > > > > values. So we can not only cut the size of the alternative entry, but

"This not only cuts"

> > > > > also meet the prerequisite for patching alternatives in the vDSO,
> > > > > since absolute alternative entries are subject to dynamic relocation,
> > > > > which is incompatible with the vDSO building.

I do this this is in the wrong order though, saving on size is
secondary to enabling their use in the vdso?

> > > > >
> > > > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > > > ---
> > > > >  arch/riscv/errata/sifive/errata.c           |  4 +++-
> > > > >  arch/riscv/errata/thead/errata.c            | 11 ++++++++---
> > > > >  arch/riscv/include/asm/alternative-macros.h | 20 ++++++++++----------
> > > > >  arch/riscv/include/asm/alternative.h        | 12 ++++++------
> > > > >  arch/riscv/kernel/cpufeature.c              | 13 ++++++-------
> > > > >  5 files changed, 33 insertions(+), 27 deletions(-)
> > > > >
> > > > > diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
> > > > > index 1031038423e7..0e537cdfd324 100644
> > > > > --- a/arch/riscv/errata/sifive/errata.c
> > > > > +++ b/arch/riscv/errata/sifive/errata.c
> > > > > @@ -107,7 +107,9 @@ void __init_or_module sifive_errata_patch_func(struct alt_entry *begin,
> > > > >
> > > > >                 tmp = (1U << alt->errata_id);
> > > > >                 if (cpu_req_errata & tmp) {
> > > > > -                       patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> > > > > +                       patch_text_nosync((void *)&alt->old_offset + alt->old_offset,
> > > > > +                                         (void *)&alt->alt_offset + alt->alt_offset,
> > > >  (void *)&alt->alt_offset + alt->alt_offset. ??!!
> > >
> > > Hi Guo,
> > >
> > > what's the problem? I can't catch your meaning, could you please proide
> > > more details?
> > Can you explain why:
> > 
> > alt->old_ptr = (void *)&alt->old_offset + alt->old_offset
> 
> Hi,
> 
> when constructing the alt entry, we save the offset in
> then entry as below:
> 
> .long \oldptr - .
> 
> So we can restore the old_ptr by &alt->old_offset + alt->old_offset

Please correct me if I have misunderstood, but for stuff like this I
find it useful to kinda summarise a bit and figure out for myself what
is going on..

As things stand, we have absolute "locations" for the alternative and
"old" instructions/data/functions. Your commit is converting us over to
use offsets. The code that patches in the alternatives needs to have
absolute addresses though, so you need to be able to, effectively,
reverse engineer those from the offset.
You do this by taking the address of the offset & adding the offset to
the address before casting to (void *). This works, because the offset
is the offset from the alt_entry data structure to the alternative?

I hope I am in the right ballpark there haha, but I do think that this
really needs a comment explaining what it is doing. Maybe extract that
operation into some sort of macro in alternatives.h so the operation is
done in a central location & you can leave the comment there?

That'd make it at least more manageable for us mere mortals who can just
do something like
patch_text_nosync(ALT_OFFSET_ADDRESS(alt->old_offset),
		  ALT_OFFSET_ADDRESS(alt->alt_offset),
		  alt->alt_len);

when we have to go an add some alternatives..

> > 
> > | offset | <- &offset
> > | ...       |
> > | value | <- ptr = &offset + offset
> > 
> > I don't make sense of the above.
> > 
> > >
> > > Thanks
> > >
> > > >
> > > > > +                                         alt->alt_len);
> > > > >                         cpu_apply_errata |= tmp;
> > > > >                 }
> > > > >         }
> > > > > diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> > > > > index 21546937db39..2a6e335b5a32 100644
> > > > > --- a/arch/riscv/errata/thead/errata.c
> > > > > +++ b/arch/riscv/errata/thead/errata.c
> > > > > @@ -68,6 +68,7 @@ void __init_or_module thead_errata_patch_func(struct alt_entry *begin, struct al
> > > > >         struct alt_entry *alt;
> > > > >         u32 cpu_req_errata = thead_errata_probe(stage, archid, impid);
> > > > >         u32 tmp;
> > > > > +       void *oldptr, *updptr;

Why mix the terminology with "upd" instead of "alt"?

> > > > >
> > > > >         for (alt = begin; alt < end; alt++) {
> > > > >                 if (alt->vendor_id != THEAD_VENDOR_ID)

> > > > >  struct alt_entry {
> > > > > -       void *old_ptr;           /* address of original instruciton or data  */
> > > > > -       void *alt_ptr;           /* address of replacement instruction or data */
> > > > > -       unsigned long vendor_id; /* cpu vendor id */
> > > > > -       unsigned long alt_len;   /* The replacement size */
> > > > > -       unsigned int errata_id;  /* The errata id */
> > > > > -} __packed;
> > > > > +       s32 old_offset;         /* offset to original instruciton or data */
> > > > > +       s32 alt_offset;         /* offset to replacement instruction or data */

Perhaps also this comment could be expanded on to specify what it is an
offset *from* as well as to?

> > > > > +       u16 vendor_id;          /* cpu vendor id */
> > > > > +       u16 alt_len;            /* The replacement size */
> > > > > +       u32 errata_id;          /* The errata id */
> > > > > +};

I hope I didn't make a hames of trying to understand what you were
doing, but please let me know what I have undoubtedly got mixed up on!
Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20221206/fc08ff0d/attachment-0001.sig>
