From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 7 Dec 2023 15:44:33 +0100
Subject: [PATCH v1 03/14] RISC-V: paravirt: Implement steal-time support
In-Reply-To: <20231207-kindling-upgrade-22d29116ccf3@wendy>
References: <20231205181119.207204-16-ajones@ventanamicro.com>
 <20231205181119.207204-19-ajones@ventanamicro.com>
 <20231207-kindling-upgrade-22d29116ccf3@wendy>
Message-ID: <20231207-42f318822ee01650e550c663@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 07, 2023 at 02:06:37PM +0000, Conor Dooley wrote:
> On Tue, Dec 05, 2023 at 07:11:23PM +0100, Andrew Jones wrote:
> 
> > +static int sbi_sta_steal_time_set_shmem(unsigned long lo, unsigned long hi,
> > +					unsigned long flags)
> >  {
> > +	struct sbiret ret;
> > +
> > +	ret = sbi_ecall(SBI_EXT_STA, SBI_EXT_STA_STEAL_TIME_SET_SHMEM,
> > +			lo, hi, flags, 0, 0, 0);
> > +	if (ret.error) {
> > +		if (lo == SBI_STA_SHMEM_DISABLE && hi == SBI_STA_SHMEM_DISABLE)
> > +			pr_warn("Failed to disable steal-time shmem");
> > +		else
> > +			pr_warn("Failed to set steal-time shmem");
> > +		return -ENOMEM;
> 
> btw, how come this is an ENOMEM and not a propagation of the error from
> the ecall?

Hmm, I can't recall why I did that. I think I should have used
sbi_err_map_linux_errno() to convert the possible SBI_ERR_INVALID_PARAM
and SBI_ERR_INVALID_ADDRESS errors appropriately instead. I don't much
like how SBI_ERR_FAILURE gets converted to ENOTSUPP, but I don't suppose
it matters much in practice anyway, and at least, in this case, it has a
1-to-1 mapping which is good for debug.

I'll change this for v2.

Thanks,
drew

