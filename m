From: Conor Dooley <conor.dooley@microchip.com>
Date: Thu, 7 Dec 2023 14:06:37 +0000
Subject: [PATCH v1 03/14] RISC-V: paravirt: Implement steal-time support
In-Reply-To: <20231205181119.207204-19-ajones@ventanamicro.com>
References: <20231205181119.207204-16-ajones@ventanamicro.com>
 <20231205181119.207204-19-ajones@ventanamicro.com>
Message-ID: <20231207-kindling-upgrade-22d29116ccf3@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 05, 2023 at 07:11:23PM +0100, Andrew Jones wrote:

> +static int sbi_sta_steal_time_set_shmem(unsigned long lo, unsigned long hi,
> +					unsigned long flags)
>  {
> +	struct sbiret ret;
> +
> +	ret = sbi_ecall(SBI_EXT_STA, SBI_EXT_STA_STEAL_TIME_SET_SHMEM,
> +			lo, hi, flags, 0, 0, 0);
> +	if (ret.error) {
> +		if (lo == SBI_STA_SHMEM_DISABLE && hi == SBI_STA_SHMEM_DISABLE)
> +			pr_warn("Failed to disable steal-time shmem");
> +		else
> +			pr_warn("Failed to set steal-time shmem");
> +		return -ENOMEM;

btw, how come this is an ENOMEM and not a propagation of the error from
the ecall?

> +	}
> +
>  	return 0;
>  }
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20231207/9a69294f/attachment-0001.sig>
