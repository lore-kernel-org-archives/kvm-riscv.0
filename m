From: Palmer Dabbelt <palmer@dabbelt.com>
Date: Thu, 28 Dec 2023 16:16:07 -0800 (PST)
Subject: [PATCH v4 02/13] RISC-V: Add SBI STA extension definitions
In-Reply-To: <20231220160012.40184-17-ajones@ventanamicro.com>
Message-ID: <mhng-00bc7d81-742f-49cb-8f3f-c4b0bd83c6c7@palmer-ri-x1c9a>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 20 Dec 2023 08:00:15 PST (-0800), ajones at ventanamicro.com wrote:
> The SBI STA extension enables steal-time accounting. Add the
> definitions it specifies.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/sbi.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 0892f4421bc4..b6f898c56940 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -31,6 +31,7 @@ enum sbi_ext_id {
>  	SBI_EXT_SRST = 0x53525354,
>  	SBI_EXT_PMU = 0x504D55,
>  	SBI_EXT_DBCN = 0x4442434E,
> +	SBI_EXT_STA = 0x535441,
>
>  	/* Experimentals extensions must lie within this range */
>  	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
> @@ -243,6 +244,22 @@ enum sbi_ext_dbcn_fid {
>  	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE = 2,
>  };
>
> +/* SBI STA (steal-time accounting) extension */
> +enum sbi_ext_sta_fid {
> +	SBI_EXT_STA_STEAL_TIME_SET_SHMEM = 0,
> +};
> +
> +struct sbi_sta_struct {
> +	__le32 sequence;
> +	__le32 flags;
> +	__le64 steal;
> +	u8 preempted;
> +	u8 pad[47];
> +} __packed;
> +
> +#define SBI_STA_SHMEM_DISABLE		-1
> +
> +/* SBI spec version fields */
>  #define SBI_SPEC_VERSION_DEFAULT	0x1
>  #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
>  #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

