From: Conor Dooley <conor@kernel.org>
Date: Thu, 23 Mar 2023 17:57:21 -0000
Subject: [PATCH 0/2] RISC-V: KVM: Require alternatives
In-Reply-To: <6d263b50-e2f0-4331-b930-c54e27f52fcc@spud>
References: <20230322192858.1189272-1-ajones@ventanamicro.com>
 <6d263b50-e2f0-4331-b930-c54e27f52fcc@spud>
Message-ID: <427628e0-4c6d-4934-b873-fa1b81b7daa0@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 22, 2023 at 07:40:14PM +0000, Conor Dooley wrote:
> On Wed, Mar 22, 2023 at 08:28:56PM +0100, Andrew Jones wrote:
> > KVM makes use of riscv_has_extension_unlikely() to check for the
> > svinval extension. riscv_has_extension_unlikely() is built on
> > alternatives, which means KVM should ensure alternatives support
> > is available.
> > 
> > The first patch takes the opportunity to cleanup KVM's select
> > list. The second patch selects RISCV_ALTERNATIVE.
> 
> Reminds me, I need to re-submit my patch doing that for the top-level
> RISC-V Kconfig...
> For the pair:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Actually, I would like to take this back for patch 2.
Per the discussion on the other thread about XIP [1], I don't think
that KVM should be selecting alternatives like this.
Would you mind if I picked up these patches & submitted them as a v2,
alongside a patch trying to make sure that we do not clip the wings of
of XIP kernels by selecting RISCV_ALTERNATIVE?

Cheers,
Conor.

1 - https://lore.kernel.org/all/20230322120907.2968494-1-Jason at zx2c4.com/
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230323/c4a44a6e/attachment-0001.sig>
