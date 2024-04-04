From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 4 Apr 2024 14:01:58 +0200
Subject: [PATCH v5 06/22] drivers/perf: riscv: Implement SBI PMU snapshot
 function
In-Reply-To: <20240403080452.1007601-7-atishp@rivosinc.com>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-7-atishp@rivosinc.com>
Message-ID: <20240404-bbfb02e3aec944f9e11745ae@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 03, 2024 at 01:04:35AM -0700, Atish Patra wrote:
...
> +static int pmu_sbi_snapshot_disable(void)
> +{
> +	struct sbiret ret;
> +
> +	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_SNAPSHOT_SET_SHMEM, -1,
> +			-1, 0, 0, 0, 0);

The "Rename the SBI_STA_SHMEM_DISABLE" patch should come before this
patch so SBI_SHMEM_DISABLE can be used instead of the -1's here.

Thanks,
drew

