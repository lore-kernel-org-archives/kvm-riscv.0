From: Greg KH <gregkh@linuxfoundation.org>
Date: Tue, 25 May 2021 09:37:11 +0200
Subject: [PATCH v18 00/18] KVM RISC-V Support
In-Reply-To: <DM6PR04MB708173B754E145BC843C4123E7269@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <mhng-b093a5aa-ff9d-437f-a10b-47558f182639@palmerdabbelt-glaptop>
 <DM6PR04MB708173B754E145BC843C4123E7269@DM6PR04MB7081.namprd04.prod.outlook.com>
Message-ID: <YKypJ5SJg2sDtn7/@kroah.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 24, 2021 at 11:08:30PM +0000, Damien Le Moal wrote:
> On 2021/05/25 7:57, Palmer Dabbelt wrote:
> > On Mon, 24 May 2021 00:09:45 PDT (-0700), guoren at kernel.org wrote:
> >> Thx Anup,
> >>
> >> Tested-by: Guo Ren <guoren@kernel.org> (Just on qemu-rv64)
> >>
> >> I'm following your KVM patchset and it's a great job for riscv
> >> H-extension. I think hardware companies hope Linux KVM ready first
> >> before the real chip. That means we can ensure the hardware could run
> >> mainline linux.
> > 
> > I understand that it would be wonderful for hardware vendors to have a 
> > guarantee that their hardware will be supported by the software 
> > ecosystem, but that's not what we're talking about here.  Specifically, 
> > the proposal for this code is to track the latest draft extension which 
> > would specifically leave vendors who implement the current draft out in 
> > the cold was something to change.  In practice that is the only way to 
> > move forward with any draft extension that doesn't have hardware 
> > available, as the software RISC-V implementations rapidly deprecate 
> > draft extensions and without a way to test our code it is destined to 
> > bit rot.
> 
> To facilitate the process of implementing, and updating, against draft
> specifications, I proposed to have arch/riscv/staging added. This would be the
> place to put code based on drafts. Some simple rules can be put in place:
> 1) The code and eventual ABI may change any time, no guarantees of backward
> compatibility
> 2) Once the specifications are frozen, the code is moved out of staging
> somewhere else.
> 3) The code may be removed any time if the specification proposal is dropped, or
> any other valid reason (can't think of any other right now)
> 4) ...
> 
> This way, the implementation process would be greatly facilitated and
> interactions between different extensions can be explored much more easily.
> 
> Thoughts ?

It will not work, unless you are mean and ruthless and people will get
mad at you.  I do not recommend it at all.

Once code shows up in the kernel tree, and people rely on it, you now
_have_ to support it.  Users don't know the difference between "staging
or not staging" at all.  We have reported problems of staging media
drivers breaking userspace apps and people having problems with that,
despite the media developers trying to tell the world, "DO NOT RELY ON
THESE!".

And if this can't be done with tiny simple single drivers, you are going
to have a world-of-hurt if you put arch/platform support into
arch/riscv/.  Once it's there, you will never be able to delete it,
trust me.

If you REALLY wanted to do this, you could create drivers/staging/riscv/
and try to make the following rules:

	- stand-alone code only, can not depend on ANYTHING outside of
	  the directory that is not also used by other in-kernel code
	- does not expose any userspace apis
	- interacts only with existing in-kernel code.
	- can be deleted at any time, UNLESS someone is using it for
	  functionality on a system

But what use would that be?  What could you put into there that anyone
would be able to actually use?

Remember the rule we made to our user community over 15 years ago:

	We will not break userspace functionality*

With the caveat of "* - in a way that you notice".

That means we can remove and change things that no one relies on
anymore, as long as if someone pops up that does rely on it, we put it
back.

We do this because we never want anyone to be afraid to drop in a new
kernel, because they know we did not break their existing hardware and
userspace workloads.  And if we did, we will work quickly to fix it.

So back to the original issue here, what is the problem that you are
trying to solve?  Why do you want to have in-kernel code for hardware
that no one else can have access to, and that isn't part of a "finalized
spec" that ends up touching other subsystems and is not self-contained?

Why not take the energy here and go get that spec ratified so we aren't
having this argument anymore?  What needs to be done to make that happen
and why hasn't anyone done that?  There's nothing keeping kernel
developers from working on spec groups, right?

thanks,

greg k-h

