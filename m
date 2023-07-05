From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 5 Jul 2023 14:58:24 +0200
Subject: [PATCH] RISC-V: KVM: provide UAPI for host SATP mode
In-Reply-To: <029b87e1-d4bc-9deb-316b-b93c5bd2a37f@ventanamicro.com>
References: <20230705091535.237765-1-dbarboza@ventanamicro.com>
 <994ae720-b3a1-1e67-ca9c-ca00e6525488@ghiti.fr>
 <029b87e1-d4bc-9deb-316b-b93c5bd2a37f@ventanamicro.com>
Message-ID: <20230705-602410a4b627f419f8f9936c@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 05, 2023 at 09:33:26AM -0300, Daniel Henrique Barboza wrote:
> 
> 
> On 7/5/23 09:18, Alexandre Ghiti wrote:
> > 
> > On 05/07/2023 11:15, Daniel Henrique Barboza wrote:
> > > KVM userspaces need to be aware of the host SATP to allow them to
> > > advertise it back to the guest OS.
> > > 
> > > Since this information is used to build the guest FDT we can't wait for
> > 
> > 
> > The thing is the "mmu-type" property in the FDT is never used: the kernel will probe the hardware and choose the largest available mode, or use "no4lvl"/"no5lvl" from the command line to restrict this mode. And FYI the current mode is exposed through cpuinfo. @Conor Can we deprecate this node or something similar?
> > 
> > Just a remark, not sure that helps :)
> 
> It does, thanks. I am aware that the current mode is exposed through cpuinfo.
> mvendorid/marchid/mimpid is also exposed there. As far as I understand we should
> rely on KVM to provide all CPU related info to configure a vcpu though.
> 
> A little background of where I'm coming from. One of the QEMU KVM cpu types (host)
> doesn't have an assigned satp_mode. The FDT creation of the 'virt' board relies on
> that info being present, and the result is that the board will segfault. I sent a
> fix for it that I hope will be queued shortly:
> 
> https://lore.kernel.org/qemu-devel/20230630100811.287315-3-dbarboza at ventanamicro.com/
> 
> Thus, if it's decided that the satp_mode FDT is deprecated, we can ignore this
> patch altogether. Thanks,

We'll eventually want the ability to get and set vsatp.mode from the VMM,
so we'll want KVM_REG_RISCV_CONFIG_REG(satp_mode) anyway. For now, since
we only support CPU passthrough with KVM, it's a convenient way to read
the host's mode (while PPC qemu-kvm does read cpuinfo, I'm not aware of
any other qemu-kvm doing that).

Thanks,
drew

