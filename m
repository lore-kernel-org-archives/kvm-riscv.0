From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 15 Apr 2024 15:06:35 +0200
Subject: [PATCH v6 07/24] RISC-V: Use the minor version mask while
 computing sbi version
In-Reply-To: <20240411000752.955910-8-atishp@rivosinc.com>
References: <20240411000752.955910-1-atishp@rivosinc.com>
 <20240411000752.955910-8-atishp@rivosinc.com>
Message-ID: <20240415-e229bb33ad53ce43e3534f5a@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 10, 2024 at 05:07:35PM -0700, Atish Patra wrote:
> As per the SBI specification, minor version is encoded in the
> lower 24 bits only. Make sure that the SBI version is computed
> with the appropriate mask.
> 
> Currently, there is no minor version in use. Thus, it doesn't
> change anything functionality but it is good to be compliant with
> the specification.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index f31650b10899..935b082d6a6c 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -367,8 +367,8 @@ static inline unsigned long sbi_minor_version(void)
>  static inline unsigned long sbi_mk_version(unsigned long major,
>  					    unsigned long minor)
>  {
> -	return ((major & SBI_SPEC_VERSION_MAJOR_MASK) <<
> -		SBI_SPEC_VERSION_MAJOR_SHIFT) | minor;
> +	return ((major & SBI_SPEC_VERSION_MAJOR_MASK) << SBI_SPEC_VERSION_MAJOR_SHIFT
> +		| (minor & SBI_SPEC_VERSION_MINOR_MASK));

The previous version had ((major & major_mask) << major_shift) | minor
(parentheses around all the major bits before the OR). Now we have
parentheses around everything, which aren't necessary, and no longer
have them around all the major bits before the OR. We don't need the
parentheses around the major bits, since shift has higher precedence
than OR, but I'd probably keep them.

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

>  }
>  
>  int sbi_err_map_linux_errno(int err);
> -- 
> 2.34.1
> 

