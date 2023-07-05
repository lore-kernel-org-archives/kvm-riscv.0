From: Conor Dooley <conor@kernel.org>
Date: Wed, 5 Jul 2023 15:44:02 +0100
Subject: [PATCH] RISC-V: KVM: provide UAPI for host SATP mode
In-Reply-To: <20230705-602410a4b627f419f8f9936c@orel>
References: <20230705091535.237765-1-dbarboza@ventanamicro.com>
 <994ae720-b3a1-1e67-ca9c-ca00e6525488@ghiti.fr>
 <029b87e1-d4bc-9deb-316b-b93c5bd2a37f@ventanamicro.com>
 <20230705-602410a4b627f419f8f9936c@orel>
Message-ID: <20230705-fondue-bagginess-66c25f1a4135@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey,

On Wed, Jul 05, 2023 at 02:58:24PM +0200, Andrew Jones wrote:
> On Wed, Jul 05, 2023 at 09:33:26AM -0300, Daniel Henrique Barboza wrote:
> > On 7/5/23 09:18, Alexandre Ghiti wrote:
> > > On 05/07/2023 11:15, Daniel Henrique Barboza wrote:
> > > > KVM userspaces need to be aware of the host SATP to allow them to
> > > > advertise it back to the guest OS.
> > > > 
> > > > Since this information is used to build the guest FDT we can't wait for
> > > 
> > > 
> > > The thing is the "mmu-type" property in the FDT is never used:
> > > the kernel will probe the hardware and choose the largest
> > > available mode, or use "no4lvl"/"no5lvl" from the command line to
> > > restrict this mode. And FYI the current mode is exposed through
> > > cpuinfo. @Conor Can we deprecate this node or something similar?

I'd be loathe to deprecate it just because Linux doesn't use it. I know
nothing really of the BSDs or other operating systems, but from a quick
check of FreeBSD:

sys/riscv/riscv/mp_machdep.c
400-static bool
401-cpu_check_mmu(u_int id __unused, phandle_t node, u_int addr_size __unused,
402-    pcell_t *reg __unused)
403-{
404-	char type[32];
405-
406-	/* Check if this hart supports MMU. */
407:	if (OF_getprop(node, "mmu-type", (void *)type, sizeof(type)) == -1 ||
408-	    strncmp(type, "riscv,none", 10) == 0)
409-		return (false);
410-
411-	return (true);
412-}

Similarly in U-Boot:
	mmu = dev_read_string(dev, "mmu-type");
	if (mmu)
		info->features |= BIT(CPU_FEAT_MMU);

(@Drew, I remember why now that the property is optional - nommu exists)

Seems like you should indeed propagate this to the DT you give to
guests.

Cheers,
Conor.

> > > 
> > > Just a remark, not sure that helps :)
> > 
> > It does, thanks. I am aware that the current mode is exposed through cpuinfo.
> > mvendorid/marchid/mimpid is also exposed there. As far as I understand we should
> > rely on KVM to provide all CPU related info to configure a vcpu though.
> > 
> > A little background of where I'm coming from. One of the QEMU KVM cpu types (host)
> > doesn't have an assigned satp_mode. The FDT creation of the 'virt' board relies on
> > that info being present, and the result is that the board will segfault. I sent a
> > fix for it that I hope will be queued shortly:
> > 
> > https://lore.kernel.org/qemu-devel/20230630100811.287315-3-dbarboza at ventanamicro.com/
> > 
> > Thus, if it's decided that the satp_mode FDT is deprecated, we can ignore this
> > patch altogether. Thanks,
> 
> We'll eventually want the ability to get and set vsatp.mode from the VMM,
> so we'll want KVM_REG_RISCV_CONFIG_REG(satp_mode) anyway. For now, since
> we only support CPU passthrough with KVM, it's a convenient way to read
> the host's mode (while PPC qemu-kvm does read cpuinfo, I'm not aware of
> any other qemu-kvm doing that).
> 
> Thanks,
> drew
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230705/b0d88724/attachment.sig>
