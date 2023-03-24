From: Conor Dooley <conor.dooley@microchip.com>
Date: Fri, 24 Mar 2023 11:52:37 -0000
Subject: [PATCH 0/2] RISC-V: KVM: Require alternatives
In-Reply-To: <20230324113259.jbfncctnclvkzjkz@orel>
References: <20230322192858.1189272-1-ajones@ventanamicro.com>
 <6d263b50-e2f0-4331-b930-c54e27f52fcc@spud>
 <427628e0-4c6d-4934-b873-fa1b81b7daa0@spud>
 <20230324113259.jbfncctnclvkzjkz@orel>
Message-ID: <a58c463e-a3f3-4a4c-8c6e-df707bbd76e0@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 24, 2023 at 12:32:59PM +0100, Andrew Jones wrote:
> On Thu, Mar 23, 2023 at 05:57:14PM +0000, Conor Dooley wrote:
> > On Wed, Mar 22, 2023 at 07:40:14PM +0000, Conor Dooley wrote:
> > > On Wed, Mar 22, 2023 at 08:28:56PM +0100, Andrew Jones wrote:
> > > > KVM makes use of riscv_has_extension_unlikely() to check for the
> > > > svinval extension. riscv_has_extension_unlikely() is built on
> > > > alternatives, which means KVM should ensure alternatives support
> > > > is available.
> > > > 
> > > > The first patch takes the opportunity to cleanup KVM's select
> > > > list. The second patch selects RISCV_ALTERNATIVE.
> > > 
> > > Reminds me, I need to re-submit my patch doing that for the top-level
> > > RISC-V Kconfig...
> > > For the pair:
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > 
> > Actually, I would like to take this back for patch 2.
> > Per the discussion on the other thread about XIP [1], I don't think
> > that KVM should be selecting alternatives like this.
> > Would you mind if I picked up these patches & submitted them as a v2,
> > alongside a patch trying to make sure that we do not clip the wings of
> > of XIP kernels by selecting RISCV_ALTERNATIVE?
> 
> Hi Conor,
> 
> I take it that resubmitting these patches is no longer part of the plan.

Ah crap, sorry. I meant to reply here after submitting and forgot.

> Should I rebase on "[PATCH v1 0/2] RISC-V: Fixes for
> riscv_has_extension[un]likely()'s alternative dependency" and change the
> select to a depends on?

I don't think you need to. Does KVM actually make use of alternatives,
other than for riscv_has_extension_unlikely(), that are not gated by
extension/erratum specific config options?

With my patch 2/2, alternatives are always enabled for !XIP_KERNEL
builds, and will fall back to the "slow" path in
riscv_has_extension_unlikely() otherwise.
If KVM doesn't need alternatives for another reason, I don't think you
need to introduce a dependency on them and just inherit the decision
made by CONFIG_RISCV.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230324/d18529fd/attachment-0001.sig>
