From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 5 Nov 2024 10:14:48 +0100
Subject: [PATCH kvmtool] riscv: Pass correct size to snprintf()
In-Reply-To: <20241104192120.75841-1-bjorn@kernel.org>
References: <20241104192120.75841-1-bjorn@kernel.org>
Message-ID: <20241105-546ce4236046e9742cf081e7@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 04, 2024 at 08:21:19PM +0100, Bj?rn T?pel wrote:
> From: Bj?rn T?pel <bjorn@rivosinc.com>
> 
> The snprintf() function does not get the correct size argument passed,
> when the FDT ISA string is built. Instead of adjusting the size for
> each extension, the full size is passed for every iteration. Doing so
> will make __snprinf_chk() bail out on glibc.
> 
> Adjust size for each iteration.
> 
> Fixes: 8aff29e1dafe ("riscv: Append ISA extensions to the device tree")
> Signed-off-by: Bj?rn T?pel <bjorn@rivosinc.com>
> ---
>  riscv/fdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/riscv/fdt.c b/riscv/fdt.c
> index 8189601f46de..85c8f95604f6 100644
> --- a/riscv/fdt.c
> +++ b/riscv/fdt.c
> @@ -157,7 +157,7 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
>  					   isa_info_arr[i].name);
>  				break;
>  			}
> -			pos += snprintf(cpu_isa + pos, CPU_ISA_MAX_LEN, "_%s",
> +			pos += snprintf(cpu_isa + pos, CPU_ISA_MAX_LEN - pos, "_%s",

Just above this we confirm strlen(isa_info_arr[i].name) + pos + 1 is less
than CPU_ISA_MAX_LEN, which means we should be able to use anything for
size which is greater than or equal to strlen(isa_info_arr[i].name) + 1,
as snprintf won't write more anyway. But, it's understandable that
__snprinf_chk doesn't know that.

>  					isa_info_arr[i].name);
>  		}
>  		cpu_isa[pos] = '\0';

Not part of this patch, but part of the context, so I'll comment on it
anyway, this '\0' assignment could be removed. It looks like it's a left
over from commit 7c9aac003925 ("riscv: Generate FDT at runtime for
Guest/VM") which could have been removed with commit 8aff29e1dafe ("riscv:
Append ISA extensions to the device tree")

Anyway,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

