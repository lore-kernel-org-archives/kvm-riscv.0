From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 2 Aug 2023 12:06:07 +0300
Subject: [PATCH v2 0/9] RISC-V: KVM: change get_reg/set_reg error codes
In-Reply-To: <20230802-c76d712d088bc4b3057e3095@orel>
References: <20230801222629.210929-1-dbarboza@ventanamicro.com>
 <20230802-c76d712d088bc4b3057e3095@orel>
Message-ID: <20230802-7d4fdd5978afe6f5edbf9a01@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 02, 2023 at 12:04:25PM +0300, Andrew Jones wrote:
> On Tue, Aug 01, 2023 at 07:26:20PM -0300, Daniel Henrique Barboza wrote:
> > Hi,
> > 
> > In this new version 3 new patches (6, 7, 8) were added by Andrew's
> > request during the v1 review.
> > 
> > We're now avoiding throwing an -EBUSY error if a reg write is done after
> > the vcpu started spinning if the value being written is the same as KVM
> > already uses. This follows the design choice made in patch 3, allowing
> > for userspace 'lazy write' of registers.
> > 
> > I decided to add 3 patches instead of one because the no-op check made
> > in patches 6 and 8 aren't just a matter of doing reg_val = host_val.
> > They can be squashed in a single patch if required.
> > 
> > Please check the version 1 cover-letter [1] for the motivation behind
> > this work. Patches were based on top of riscv_kvm_queue.
> > 
> > Changes from v1:
> > - patches 6,7, 8 (new):
> >   - make reg writes a no-op, regardless of vcpu->arch.ran_atleast_once
> >     state, if the value being written is the same as the host
> > - v1 link: https://lore.kernel.org/kvm/20230731120420.91007-1-dbarboza at ventanamicro.com/
> > 
> > [1] https://lore.kernel.org/kvm/20230731120420.91007-1-dbarboza at ventanamicro.com/
> >
> 
> I found three missing conversions, which are in the diff below. Also, I
> saw that the vector registers were lacking good error returns, so I reworked
> that and attached a completely (not even compile) tested patch for them.
                                                   ^un


