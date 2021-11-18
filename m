From: Marc Zyngier <maz@kernel.org>
Date: Thu, 18 Nov 2021 10:13:28 +0000
Subject: [PATCH v10 kvmtool 5/8] riscv: Add PLIC device emulation
In-Reply-To: <20211116052130.173679-6-anup.patel@wdc.com>
References: <20211116052130.173679-1-anup.patel@wdc.com>
 <20211116052130.173679-6-anup.patel@wdc.com>
Message-ID: <87mtm17ovr.wl-maz@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 16 Nov 2021 05:21:27 +0000,
Anup Patel <anup.patel@wdc.com> wrote:
> 
> The PLIC (platform level interrupt controller) manages peripheral
> interrupts in RISC-V world. The per-CPU interrupts are managed
> using CPU CSRs hence virtualized in-kernel by KVM RISC-V.
> 
> This patch adds PLIC device emulation for KVMTOOL RISC-V.
> 
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> [For PLIC context CLAIM register emulation]
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  Makefile                     |   1 +
>  riscv/include/kvm/kvm-arch.h |   2 +
>  riscv/irq.c                  |   4 +-
>  riscv/plic.c                 | 518 +++++++++++++++++++++++++++++++++++
>  4 files changed, 523 insertions(+), 2 deletions(-)
>  create mode 100644 riscv/plic.c
>

[...]

> +static void plic__context_write(struct plic_state *s,
> +				struct plic_context *c,
> +				u64 offset, void *data)
> +{
> +	u32 val;
> +	bool irq_update = false;
> +
> +	mutex_lock(&c->irq_lock);
> +
> +	switch (offset) {
> +	case CONTEXT_THRESHOLD:
> +		val = ioport__read32(data);
> +		val &= ((1 << PRIORITY_PER_ID) - 1);
> +		if (val <= s->max_prio)
> +			c->irq_priority_threshold = val;
> +		else
> +			irq_update = true;
> +		break;
> +	case CONTEXT_CLAIM:
> +		val = ioport__read32(data);
> +		if (val < plic.num_irq) {
> +			c->irq_claimed[val / 32] &= ~(1 << (val % 32));
> +			irq_update = true;
> +		}

This seems to ignore the nasty bit of the PLIC spec where a write to
CLAIM is ignored if the interrupt is masked.

	M.

-- 
Without deviation from the norm, progress is not possible.

