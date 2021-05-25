From: Greg KH <gregkh@linuxfoundation.org>
Date: Tue, 25 May 2021 10:11:31 +0200
Subject: [PATCH v18 00/18] KVM RISC-V Support
In-Reply-To: <DM6PR04MB7081843419AFCECABA75AD74E7259@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <mhng-b093a5aa-ff9d-437f-a10b-47558f182639@palmerdabbelt-glaptop>
 <DM6PR04MB708173B754E145BC843C4123E7269@DM6PR04MB7081.namprd04.prod.outlook.com>
 <YKypJ5SJg2sDtn7/@kroah.com>
 <DM6PR04MB7081843419AFCECABA75AD74E7259@DM6PR04MB7081.namprd04.prod.outlook.com>
Message-ID: <YKyxMy+djlscUhr1@kroah.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 25, 2021 at 08:01:01AM +0000, Damien Le Moal wrote:
> On 2021/05/25 16:37, Greg KH wrote:
> > On Mon, May 24, 2021 at 11:08:30PM +0000, Damien Le Moal wrote:
> >> On 2021/05/25 7:57, Palmer Dabbelt wrote:
> >>> On Mon, 24 May 2021 00:09:45 PDT (-0700), guoren at kernel.org wrote:
> >>>> Thx Anup,
> >>>>
> >>>> Tested-by: Guo Ren <guoren@kernel.org> (Just on qemu-rv64)
> >>>>
> >>>> I'm following your KVM patchset and it's a great job for riscv
> >>>> H-extension. I think hardware companies hope Linux KVM ready first
> >>>> before the real chip. That means we can ensure the hardware could run
> >>>> mainline linux.
> >>>
> >>> I understand that it would be wonderful for hardware vendors to have a 
> >>> guarantee that their hardware will be supported by the software 
> >>> ecosystem, but that's not what we're talking about here.  Specifically, 
> >>> the proposal for this code is to track the latest draft extension which 
> >>> would specifically leave vendors who implement the current draft out in 
> >>> the cold was something to change.  In practice that is the only way to 
> >>> move forward with any draft extension that doesn't have hardware 
> >>> available, as the software RISC-V implementations rapidly deprecate 
> >>> draft extensions and without a way to test our code it is destined to 
> >>> bit rot.
> >>
> >> To facilitate the process of implementing, and updating, against draft
> >> specifications, I proposed to have arch/riscv/staging added. This would be the
> >> place to put code based on drafts. Some simple rules can be put in place:
> >> 1) The code and eventual ABI may change any time, no guarantees of backward
> >> compatibility
> >> 2) Once the specifications are frozen, the code is moved out of staging
> >> somewhere else.
> >> 3) The code may be removed any time if the specification proposal is dropped, or
> >> any other valid reason (can't think of any other right now)
> >> 4) ...
> >>
> >> This way, the implementation process would be greatly facilitated and
> >> interactions between different extensions can be explored much more easily.
> >>
> >> Thoughts ?
> > 
> > It will not work, unless you are mean and ruthless and people will get
> > mad at you.  I do not recommend it at all.
> > 
> > Once code shows up in the kernel tree, and people rely on it, you now
> > _have_ to support it.  Users don't know the difference between "staging
> > or not staging" at all.  We have reported problems of staging media
> > drivers breaking userspace apps and people having problems with that,
> > despite the media developers trying to tell the world, "DO NOT RELY ON
> > THESE!".
> > 
> > And if this can't be done with tiny simple single drivers, you are going
> > to have a world-of-hurt if you put arch/platform support into
> > arch/riscv/.  Once it's there, you will never be able to delete it,
> > trust me.
> 
> All very good points. Thank you for sharing.
> 
> > If you REALLY wanted to do this, you could create drivers/staging/riscv/
> > and try to make the following rules:
> > 
> > 	- stand-alone code only, can not depend on ANYTHING outside of
> > 	  the directory that is not also used by other in-kernel code
> > 	- does not expose any userspace apis
> > 	- interacts only with existing in-kernel code.
> > 	- can be deleted at any time, UNLESS someone is using it for
> > 	  functionality on a system
> > 
> > But what use would that be?  What could you put into there that anyone
> > would be able to actually use?
> 
> Yes, you already mentioned this and we were not thinking about this solution.
> drivers/staging really is for device drivers and does not apply to arch code.

Then you can not use the "staging model" anywhere else, especially in
arch code.  We tried that many years ago, and it instantly failed and we
ripped it out.  Learn from our mistakes please.

> > So back to the original issue here, what is the problem that you are
> > trying to solve?  Why do you want to have in-kernel code for hardware
> > that no one else can have access to, and that isn't part of a "finalized
> > spec" that ends up touching other subsystems and is not self-contained?
> 
> For the case at hand, the only thing that would be outside of the staging area
> would be the ABI definition, but that one depends only on the ratified riscv ISA
> specs. So having it outside of staging would be OK. The idea of the arch staging
> area is 2 fold:
> 1) facilitate the development work overall, both for Paolo and Anup on the KVM
> part, but also others to check that their changes do not break KVM support.

Who are the "others" here?  You can't force your code into the tree just
to keep it up to date with internal apis that others are changing, if
you have no real users for it yet.  That's asking others to do your work
for you :(

> 2) Provide feedback to the specs groups that their concerns are moot. E.g. one
> reason the hypervisor specs are being delayed is concerns with interrupt
> handling. With a working implementation based on current ratified specs for
> other components (e.g. interrupt controller), the hope is that the specs group
> can speed up freezing of the specs.

There is the issue of specs-without-working-code that can cause major
problems.  But you have code, it does not have to be merged into the
kernel tree to prove/disprove specs, so don't push the inability of your
standards group to come to an agreement to the kernel developer
community.  Again, you are making us do your work for you here :(

> But your points about how users will likely end up using this potentially
> creates a lot more problems than we are solving...

Thank you for understanding.

good luck with your standards meetings!

greg k-h

