From: Greg KH <gregkh@linuxfoundation.org>
Date: Fri, 21 May 2021 20:25:23 +0200
Subject: [PATCH v18 00/18] KVM RISC-V Support
In-Reply-To: <mhng-122345f7-47d9-4509-8ae6-ce1da912fc00@palmerdabbelt-glaptop>
References: <YKfyR5jUu3HMvYg5@kroah.com>
 <mhng-122345f7-47d9-4509-8ae6-ce1da912fc00@palmerdabbelt-glaptop>
Message-ID: <YKf7E4YfLrcfgCoi@kroah.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 21, 2021 at 11:08:15AM -0700, Palmer Dabbelt wrote:
> On Fri, 21 May 2021 10:47:51 PDT (-0700), Greg KH wrote:
> > On Fri, May 21, 2021 at 07:21:12PM +0200, Paolo Bonzini wrote:
> > > On 21/05/21 19:13, Palmer Dabbelt wrote:
> > > > >
> > > >
> > > > I don't view this code as being in a state where it can be
> > > > maintained, at least to the standards we generally set within the
> > > > kernel.  The ISA extension in question is still subject to change, it
> > > > says so right at the top of the H extension <https://github.com/riscv/riscv-isa-manual/blob/master/src/hypervisor.tex#L4>
> > > >
> > > >   {\bf Warning! This draft specification may change before being
> > > > accepted as standard by the RISC-V Foundation.}
> > > 
> > > To give a complete picture, the last three relevant changes have been in
> > > August 2019, November 2019 and May 2020.  It seems pretty frozen to me.
> > > 
> > > In any case, I think it's clear from the experience with Android that
> > > the acceptance policy cannot succeed.  The only thing that such a policy
> > > guarantees, is that vendors will use more out-of-tree code.  Keeping a
> > > fully-developed feature out-of-tree for years is not how Linux is run.
> > > 
> > > > I'm not sure where exactly the line for real hardware is, but for
> > > > something like this it would at least involve some chip that is
> > > > widely availiable and needs the H extension to be useful
> > > 
> > > Anup said that "quite a few people have already implemented RISC-V
> > > H-extension in hardware as well and KVM RISC-V works on real HW as well".
> > > Those people would benefit from having KVM in the Linus tree.
> > 
> > Great, but is this really true?  If so, what hardware has this?  I have
> > a new RISC-V device right here next to me, what would I need to do to
> > see if this is supported in it or not?
> 
> You can probe the misa register, it should have the H bit set if it supports
> the H extension.

To let everyone know, based on our private chat we had off-list, no, the
device I have does not support this extension, so unless someone can
point me at real hardware, I don't think this code needs to be
considered for merging anywhere just yet.

thanks,

greg k-h

