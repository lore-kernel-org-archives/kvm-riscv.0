From: Conor Dooley <conor@kernel.org>
Date: Thu, 11 May 2023 23:48:08 +0100
Subject: [PATCH 1/2] riscv: kvm: Add KVM_GET_REG_LIST API support
In-Reply-To: <20230511-boozy-comic-5bc8f297dc8e@spud>
References: <cover.1683791148.git.haibo1.xu@intel.com>
 <921fc2e1a91887170e277acb1b52df57480a5736.1683791148.git.haibo1.xu@intel.com>
 <20230511-boozy-comic-5bc8f297dc8e@spud>
Message-ID: <20230511-leverage-backspin-34bcde885006@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 11, 2023 at 11:25:41PM +0100, Conor Dooley wrote:
> On Thu, May 11, 2023 at 05:22:48PM +0800, Haibo Xu wrote:
> > KVM_GET_REG_LIST API will return all registers that are available to
> > KVM_GET/SET_ONE_REG APIs. It's very useful to identify some platform
> > regression issue during VM migration.
> > 
> > Since this API was already supported on arm64, it'd be straightforward
> > to enable it on riscv with similar code structure.
> 
> Applied on top of v6.4-rc1 this breaks the build :/

I lied, I forgot W=1 is enabled for the allmodconfig builds in the
patchwork automation.
The warnings are trivial to fix, so you should fix them anyway!

> warning: Function parameter or member 'vcpu' not described in 'kvm_riscv_vcpu_num_regs'
> warning: Function parameter or member 'uindices' not described in 'kvm_riscv_vcpu_copy_reg_indices'
> warning: Function parameter or member 'vcpu' not described in 'kvm_riscv_vcpu_copy_reg_indices'
> 
> You have a bunch of kerneldoc comments (the ones with /**) that are not
> valid kerneldoc. Apparently allmodconfig catches that!
> 
> Cheers,
> Conor.


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230511/d5382f50/attachment-0001.sig>
