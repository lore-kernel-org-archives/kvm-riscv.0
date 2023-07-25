From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 25 Jul 2023 21:13:19 +0530
Subject: [PATCH v3 0/7] Risc-V Kvm Smstateen
In-Reply-To: <20230725-dwelled-obtain-24bf6a4e6964@wendy>
References: <20230724142033.306538-1-mchitale@ventanamicro.com>
 <20230724-scrap-pranker-7fd120078136@spud> <CAK9=C2XXnQWqJgES2iWjatG9SFeFEUXZzLXz1gTYQ0aAh=7KJg@mail.gmail.com>
 <20230725-dwelled-obtain-24bf6a4e6964@wendy>
Message-ID: <CAK9=C2UapxZewmW+dfctr7hOHZfNUhiPCx4mq08-j_vN5LFsWw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 25, 2023 at 3:37?PM Conor Dooley <conor.dooley@microchip.com> wrote:
>
> Hey Anup,
>
> On Tue, Jul 25, 2023 at 09:47:14AM +0530, Anup Patel wrote:
> > On Mon, Jul 24, 2023 at 10:08?PM Conor Dooley <conor@kernel.org> wrote:
> > > On Mon, Jul 24, 2023 at 07:50:26PM +0530, Mayuresh Chitale wrote:
> > > > This series adds support to detect the Smstateen extension for both, the
> > > > host and the guest vcpu. It also adds senvcfg and sstateen0 to the ONE_REG
> > > > interface and the vcpu context save/restore.
> > >
> > > There's not really an explanation in this series of where Smstateen is
> > > needed, or why it is only implemented for KVM. The spec mentions that this
> > > also applies to separate user threads, as well as to guests running in a
> > > hypervisor. As your first patch will lead to smstateen being set in
> > > /proc/cpuinfo, it could reasonably be assumed that the kernel itself
> > > supports the extension. Why does only KVM, and not the kernel, require
> > > support for smstateen?
> >
> > Here's the motivation behind Smstateen from the spec:
> > "The implementation of optional RISC-V extensions has the potential to open
> > covert channels between separate user threads, or between separate guest
> > OSes running under a hypervisor. The problem occurs when an extension
> > adds processor state---usually explicit registers, but possibly other forms of
> > state---that the main OS or hypervisor is unaware of (and hence won?t
> > context-switch) but that can be modified/written by one user thread or
> > guest OS and perceived/examined/read by another."
>
> This much I gathered from my (brief) reading of the spec.
>
> > Based on the above, Ssaia extension related CSRs need to be explicitly
> > enabled for HS-mode by M-mode (which OpenSBI already does) and
> > for VS-mode by HS-mode (which this series adds for KVM RISC-V).
>
> Ah right. Reading back through the patches, in [4/7] I see "Configure
> hstateen0 register so that the AIA state and envcfg are accessible to
> the vcpus". I would ask that, at least, [1/7] is updated to provide this
> motivation & the rationale for why only KVM needs to care. The
> motivation for the work should appear in the patchset somewhere, and
> probably in the cover too.

Yes, more details can be added to the commit description of PATCH1
and cover letter.

>
> > Currently, there are no new extensions addings CSRs for user-space
> > so RISC-V kernel does not need to set up sstateenX CSRs for processes
> > or tasks but in the future RISC-V kernel might touch sstateenX CSRs.
>
> Right, that is what I figured was going on, ignoring it for now, in the
> hopes that we remember to deal with it before some userspace visible
> side channel shows up.
>
> Dumb question maybe, but I find this to be quite -ENOPARSE:
> > Bit 0 of these registers is not custom state itself; it is a standard field of a standard CSR, either mstateen0,
> > hstateen0, or sstateen0. The requirements that non-standard extensions must meet to be conforming are not
> > relaxed due solely to changes in the value of this bit. In particular, if software sets this bit but does not execute
> > any custom instructions or access any custom state, the software must continue to execute as specified by all
> > relevant RISC-V standards, or the hardware is not standard-conforming.
> Does this mean that bit 0 of the CSRs mentioned in the quote controls all
> non-standard extensions at the respective privilege level? If so, does
> that not make the "ignore that we will now report the presence of this
> extension" approach flimsier, since we have little visibility into what
> may exist on that front?

Yes, bit0 of the stateen CSRs controls the access to custom registers
added by custom extensions. Of course, not all custom extensions
would add custom registers.

Higher privilege levels (such as hypervisors) should not enable
bit0 by default. It should be enabled only if higher privilege levels
knows what it is and how to context-switch the custom registers.

>
> Granted, it is not as if delaying this patchset would benefit anyone in
> that regard, since those attempting to exploit the side channel know that
> the side channel exists, whether the kernel reports having sstateen or
> not. This probably just boils down to /proc/cpuinfo being a terrible
> interface for detecting extension support in the kernel.
> I've got some other comments about it that came up on IRC yesterday, so
> I'll go complain about it elsewhere :)
>
> Thanks,
> Conor.

Regards,
Anup

