From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 19 May 2021 15:58:05 +0200
Subject: [PATCH v18 00/18] KVM RISC-V Support
In-Reply-To: <daa30135-8757-8d33-a92e-8db4207168ff@redhat.com>
References: <20210519033553.1110536-1-anup.patel@wdc.com>
 <YKSa48cejI1Lax+/@kroah.com>
 <CAAhSdy18qySXbUdrEsUe-KtbtuEoYrys0TcmsV2UkEA2=7UQzw@mail.gmail.com>
 <YKSgcn5gxE/4u2bT@kroah.com> <YKTsyyVYsHVMQC+G@kroah.com>
 <d7d5ad76-aec3-3297-0fac-a9da9b0c3663@redhat.com>
 <YKUDWgZVj82/KiKw@kroah.com>
 <daa30135-8757-8d33-a92e-8db4207168ff@redhat.com>
Message-ID: <YKUZbb6OK+UYAq+t@kroah.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 19, 2021 at 03:29:24PM +0200, Paolo Bonzini wrote:
> On 19/05/21 14:23, Greg Kroah-Hartman wrote:
> > > - the code could be removed if there's no progress on either changing the
> > > RISC-V acceptance policy or ratifying the spec
> > 
> > I really do not understand the issue here, why can this just not be
> > merged normally?
> 
> Because the RISC-V people only want to merge code for "frozen" or "ratified"
> processor extensions, and the RISC-V foundation is dragging their feet in
> ratifying the hypervisor extension.
> 
> It's totally a self-inflicted pain on part of the RISC-V maintainers; see
> Documentation/riscv/patch-acceptance.rst:
> 
>   We'll only accept patches for new modules or extensions if the
>   specifications for those modules or extensions are listed as being
>   "Frozen" or "Ratified" by the RISC-V Foundation.  (Developers may, of
>   course, maintain their own Linux kernel trees that contain code for
>   any draft extensions that they wish.)
> 
> (Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/riscv/patch-acceptance.rst)

Lovely, and how is that going to work for code that lives outside of the
riscv "arch" layer?  Like all drivers?

And what exactly is "not ratified" that these patches take advantage of?
If there is hardware out there with these features, well, Linux needs to
run on it, so we need to support that.  No external committee rules
should be relevant here.

Now if this is for hardware that is not "real", then that's a different
story.  In that case, who cares, no one can use it, so why not take it?

So what exactly is this trying to "protect" Linux from?

> > All staging drivers need a TODO list that shows what needs to be done in
> > order to get it out of staging.  All I can tell so far is that the riscv
> > maintainers do not want to take this for "unknown reasons" so let's dump
> > it over here for now where we don't have to see it.
> > 
> > And that's not good for developers or users, so perhaps the riscv rules
> > are not very good?
> 
> I agree wholeheartedly.
> 
> I have heard contrasting opinions on conflict of interest where the
> employers of the maintainers benefit from slowing down the integration of
> code in Linus's tree.  I find these allegations believable, but even if that
> weren't the case, the policy is (to put it kindly) showing its limits.

Slowing down code merges is horrible, again, if there's hardware out
there, and someone sends code to support it, and wants to maintain it,
then we should not be rejecting it.

Otherwise we are not doing our job as an operating system kernel, our
role is to make hardware work.  We don't get to just ignore code because
we don't like the hardware (oh if only we could!), if a user wants to
use it, our role is to handle that.

> > > Of course there should have been a TODO file explaining the situation. But
> > > if you think this is not the right place, I totally understand; if my
> > > opinion had any weight in this, I would just place it in arch/riscv/kvm.
> > > 
> > > The RISC-V acceptance policy as is just doesn't work, and the fact that
> > > people are trying to work around it is proving it.  There are many ways to
> > > improve it:
> > 
> > What is this magical acceptance policy that is preventing working code
> > from being merged?  And why is it suddenly the rest of the kernel
> > developer's problems because of this?
> 
> It is my problem because I am trying to help Anup merging some perfectly
> good KVM code; when a new KVM port comes up, I coordinate merging the first
> arch/*/kvm bits with the arch/ maintainers and from that point on that
> directory becomes "mine" (or my submaintainers').

Agreed, but the riscv maintainers should not be forcing this "problem"
onto all of us, like it seems is starting to happen :(

Ok, so, Paul, Palmer, and Albert, what do we do here?  Why can't we take
working code like this into the kernel if someone is willing to support
and maintain it over time?

thanks,

greg k-h

