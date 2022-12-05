From: Conor Dooley <conor@kernel.org>
Date: Mon, 5 Dec 2022 19:37:53 +0000
Subject: [PATCH v2 05/13] riscv: cpufeature: extend
 riscv_cpufeature_patch_func to all ISA extensions
In-Reply-To: <20221204174632.3677-6-jszhang@kernel.org>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <20221204174632.3677-6-jszhang@kernel.org>
Message-ID: <Y45IkVXYshIciACY@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 05, 2022 at 01:46:24AM +0800, Jisheng Zhang wrote:
> make the riscv_cpufeature_patch_func() scan all ISA extensions rather
> than limited feature macros.

Certainly looks like a nice cleanup. Perhaps for the changelog,
something along the lines of:

"riscv_cpufeature_patch_func() currently only scans a limited set of
cpufeatures, explicitly defined with macros. Extend it to probe for all
ISA extensions"

> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/include/asm/errata_list.h |  9 ++--
>  arch/riscv/kernel/cpufeature.c       | 73 +++++-----------------------
>  2 files changed, 15 insertions(+), 67 deletions(-)

> @@ -311,25 +264,23 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
>  	for (alt = begin; alt < end; alt++) {
>  		if (alt->vendor_id != 0)
>  			continue;
> -		if (alt->errata_id >= CPUFEATURE_NUMBER) {
> -			WARN(1, "This feature id:%d is not in kernel cpufeature list",
> +		if (alt->errata_id >= RISCV_ISA_EXT_MAX) {
> +			WARN(1, "This extension id:%d is not in ISA extension list",
>  				alt->errata_id);
>  			continue;
>  		}
>  
> -		tmp = (1U << alt->errata_id);
> -		if (cpu_req_feature & tmp) {
> -			/* do the basic patching */
> -			patch_text_nosync(alt->old_ptr, alt->alt_ptr,
> -					  alt->alt_len);
> +		if (!__riscv_isa_extension_available(NULL, alt->errata_id))
> +			continue;
>  
> -			riscv_alternative_fix_auipc_jalr(alt->old_ptr,
> -							 alt->alt_len,
> -							 alt->old_ptr - alt->alt_ptr);
> -			riscv_alternative_fix_jal(alt->old_ptr,
> -						  alt->alt_len,
> -						  alt->old_ptr - alt->alt_ptr);
> -		}
> +		/* do the basic patching */
> +		patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> +		riscv_alternative_fix_auipc_jalr(alt->old_ptr,
> +						 alt->alt_len,
> +						 alt->old_ptr - alt->alt_ptr);
> +		riscv_alternative_fix_jal(alt->old_ptr,
> +					  alt->alt_len,
> +					  alt->old_ptr - alt->alt_ptr);

nit:
Now that you've dropped a level of indent, can alt->alt_len move up a
line?

Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20221205/a8392d07/attachment.sig>
