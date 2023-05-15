From: Haibo Xu <xiaobo55x@gmail.com>
Date: Mon, 15 May 2023 14:24:28 +0800
Subject: [PATCH 1/2] riscv: kvm: Add KVM_GET_REG_LIST API support
In-Reply-To: <20230511-leverage-backspin-34bcde885006@spud>
References: <cover.1683791148.git.haibo1.xu@intel.com> <921fc2e1a91887170e277acb1b52df57480a5736.1683791148.git.haibo1.xu@intel.com>
 <20230511-boozy-comic-5bc8f297dc8e@spud> <20230511-leverage-backspin-34bcde885006@spud>
Message-ID: <CAJve8okYNEbk2PwXVzx+dMSq+uci=W_tpShNv3FER=pWRUymWw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 12, 2023 at 6:48?AM Conor Dooley <conor@kernel.org> wrote:
>
> On Thu, May 11, 2023 at 11:25:41PM +0100, Conor Dooley wrote:
> > On Thu, May 11, 2023 at 05:22:48PM +0800, Haibo Xu wrote:
> > > KVM_GET_REG_LIST API will return all registers that are available to
> > > KVM_GET/SET_ONE_REG APIs. It's very useful to identify some platform
> > > regression issue during VM migration.
> > >
> > > Since this API was already supported on arm64, it'd be straightforward
> > > to enable it on riscv with similar code structure.
> >
> > Applied on top of v6.4-rc1 this breaks the build :/
>
> I lied, I forgot W=1 is enabled for the allmodconfig builds in the
> patchwork automation.
> The warnings are trivial to fix, so you should fix them anyway!
>

sure, I will fix them in the next version.

Thanks,
Haibo

> > warning: Function parameter or member 'vcpu' not described in 'kvm_riscv_vcpu_num_regs'
> > warning: Function parameter or member 'uindices' not described in 'kvm_riscv_vcpu_copy_reg_indices'
> > warning: Function parameter or member 'vcpu' not described in 'kvm_riscv_vcpu_copy_reg_indices'
> >
> > You have a bunch of kerneldoc comments (the ones with /**) that are not
> > valid kerneldoc. Apparently allmodconfig catches that!
> >
> > Cheers,
> > Conor.
>
>

