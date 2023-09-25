From: Conor Dooley <conor@kernel.org>
Date: Mon, 25 Sep 2023 16:36:56 +0100
Subject: [PATCH v2 0/9] KVM RISC-V Conditional Operations
In-Reply-To: <20230925-gorged-boxer-3804735e2d18@spud>
References: <20230925133859.1735879-1-apatel@ventanamicro.com>
 <20230925-gorged-boxer-3804735e2d18@spud>
Message-ID: <20230925-reappear-unkind-7f31acdd82de@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 25, 2023 at 04:33:15PM +0100, Conor Dooley wrote:
> On Mon, Sep 25, 2023 at 07:08:50PM +0530, Anup Patel wrote:
> > This series extends KVM RISC-V to allow Guest/VM discover and use
> > conditional operations related ISA extensions (namely XVentanaCondOps
> > and Zicond).
> > 
> > To try these patches, use KVMTOOL from riscv_zbx_zicntr_smstateen_condops_v1
> > branch at: https://github.com/avpatel/kvmtool.git
> > 
> > These patches are based upon the latest riscv_kvm_queue and can also be
> > found in the riscv_kvm_condops_v2 branch at:
> > https://github.com/avpatel/linux.git
> > 
> > Changes since v1:
> >  - Rebased the series on riscv_kvm_queue
> >  - Split PATCH1 and PATCH2 of v1 series into two patches
> >  - Added separate test configs for XVentanaCondOps and Zicond in PATCH7
> >    of v1 series.
> > 
> > Anup Patel (9):
> >   dt-bindings: riscv: Add XVentanaCondOps extension entry
> >   RISC-V: Detect XVentanaCondOps from ISA string
> >   dt-bindings: riscv: Add Zicond extension entry
> >   RISC-V: Detect Zicond from ISA string
> 
> For these 4:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Actually, now that I think of it, I'm going to temporarily un-review this.
From patch-acceptance.rst:
| Additionally, the RISC-V specification allows implementers to create
| their own custom extensions.  These custom extensions aren't required
| to go through any review or ratification process by the RISC-V
| Foundation.  To avoid the maintenance complexity and potential
| performance impact of adding kernel code for implementor-specific
| RISC-V extensions, we'll only consider patches for extensions that either:
| 
| - Have been officially frozen or ratified by the RISC-V Foundation, or
| - Have been implemented in hardware that is widely available, per standard
|   Linux practice.

The xventanacondops bits don't qualify under the first entry, and I
don't think they qualify under the second yet. Am I wrong?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230925/6a3609a7/attachment.sig>
