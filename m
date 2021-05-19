From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 19 May 2021 14:23:54 +0200
Subject: [PATCH v18 00/18] KVM RISC-V Support
In-Reply-To: <d7d5ad76-aec3-3297-0fac-a9da9b0c3663@redhat.com>
References: <20210519033553.1110536-1-anup.patel@wdc.com>
 <YKSa48cejI1Lax+/@kroah.com>
 <CAAhSdy18qySXbUdrEsUe-KtbtuEoYrys0TcmsV2UkEA2=7UQzw@mail.gmail.com>
 <YKSgcn5gxE/4u2bT@kroah.com> <YKTsyyVYsHVMQC+G@kroah.com>
 <d7d5ad76-aec3-3297-0fac-a9da9b0c3663@redhat.com>
Message-ID: <YKUDWgZVj82/KiKw@kroah.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 19, 2021 at 01:18:44PM +0200, Paolo Bonzini wrote:
> On 19/05/21 12:47, Greg Kroah-Hartman wrote:
> > > It is not a dumping ground for stuff that arch maintainers can not seem
> > > to agree on, and it is not a place where you can just randomly play
> > > around with user/kernel apis with no consequences.
> > > 
> > > So no, sorry, not going to take this code at all.
> > 
> > And to be a bit more clear about this, having other subsystem
> > maintainers drop their unwanted code on this subsystem,_without_  even
> > asking me first is just not very nice. All of a sudden I am now > responsible for this stuff, without me even being asked about it.
> > Should I start throwing random drivers into the kvm subsystem for them
> > to maintain because I don't want to?:)
> 
> (I did see the smiley), I'm on board with throwing random drivers in
> arch/riscv. :)
> 
> The situation here didn't seem very far from what process/2.Process.rst says
> about staging:
> 
> - "a way to keep track of drivers that aren't up to standards", though in
> this case the issue is not coding standards or quality---the code is very
> good---and which people "may want to use"

Exactly, this is different.  And it's not self-contained, which is
another requirement for staging code that we have learned to enforce
over the years (makes it easier to rip out if no one is willing to
maintain it.)

> - the code could be removed if there's no progress on either changing the
> RISC-V acceptance policy or ratifying the spec

I really do not understand the issue here, why can this just not be
merged normally?

Is the code somehow not ok?  Is it relying on hardware in ways that
breaks other users?  Does it cause problems for different users?  Is it
a user api that you don't like or think is the "proper" one?

All staging drivers need a TODO list that shows what needs to be done in
order to get it out of staging.  All I can tell so far is that the riscv
maintainers do not want to take this for "unknown reasons" so let's dump
it over here for now where we don't have to see it.

And that's not good for developers or users, so perhaps the riscv rules
are not very good?

> Of course there should have been a TODO file explaining the situation. But
> if you think this is not the right place, I totally understand; if my
> opinion had any weight in this, I would just place it in arch/riscv/kvm.
> 
> The RISC-V acceptance policy as is just doesn't work, and the fact that
> people are trying to work around it is proving it.  There are many ways to
> improve it:

What is this magical acceptance policy that is preventing working code
from being merged?  And why is it suddenly the rest of the kernel
developer's problems because of this?

thanks,

greg k-h

