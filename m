From: Conor Dooley <conor@kernel.org>
Date: Thu, 09 Feb 2023 19:05:10 -0000
Subject: [PATCH v4 5/8] RISC-V: cpufeature: Put vendor_id to work
In-Reply-To: <20230209152628.129914-6-ajones@ventanamicro.com>
References: <20230209152628.129914-1-ajones@ventanamicro.com>
 <20230209152628.129914-6-ajones@ventanamicro.com>
Message-ID: <Y+VD2/owMIvqzOx8@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Drew,

On Thu, Feb 09, 2023 at 04:26:25PM +0100, Andrew Jones wrote:
> When [ab]using alternatives as cpufeature "static keys", which can
> be used in assembly, also put vendor_id to work as application-
> specific data. This will be initially used in Zicboz's application to
> clear_page(), as Zicboz's block size must also be considered. In that
> case, vendor_id's role will be to convey the maximum block size which
> the Zicboz clear_page() implementation supports.
> 
> cpufeature alternative applications which need to check for the
> existence or absence of other cpufeatures may also be able to make
> use of this.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 0d2db03cf167..74736b4f0624 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -278,6 +278,11 @@ void __init riscv_fill_hwcap(void)
>  }
>  
>  #ifdef CONFIG_RISCV_ALTERNATIVE

I think a comment here about what "application check" means would be
nice.
That wording just feels clunky & the meaning is not immediately
graspable?

/*
 * riscv_cpufeature_application_check() - Check if a cpufeature applies.
 * The presence of a cpufeature does not mean it is necessarily
 * useable. This function is used to apply the alternative on a
 * case-by-case basis.
 */

Dunno, does something like that convey the intent?

> +static bool riscv_cpufeature_application_check(u32 feature, u16 data)
> +{
> +	return data == 0;
> +}
> +
>  void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
>  						  struct alt_entry *end,
>  						  unsigned int stage)
> @@ -289,8 +294,6 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
>  		return;
>  
>  	for (alt = begin; alt < end; alt++) {
> -		if (alt->vendor_id != 0)
> -			continue;

Can you remind me what makes this "safe"?
My understanding was that a vendor_id of zero was safe, as zero is
reserved in JEDEC.
What is stopping someone stuffing this with a given value and
colliding with a real vendor's errata?

	for (alt = begin; alt < end; alt++) {
		if (alt->vendor_id != A_VENDOR_ID)
			continue;
		if (alt->errata_id >= ERRATA_A_NUMBER)
			continue;

		tmp = (1U << alt->errata_id);
		if (cpu_req_errata & tmp) {
			oldptr = ALT_OLD_PTR(alt);
			altptr = ALT_ALT_PTR(alt);

			/* On vm-alternatives, the mmu isn't running yet */
			if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
				memcpy((void *)__pa_symbol(oldptr),
				       (void *)__pa_symbol(altptr),
				       alt->alt_len);
			else
				patch_text_nosync(oldptr, altptr, alt->alt_len);
		}
	}

I've probably just missing something, my brain swapped out alternatives
the other week. Hopefully whatever I missed isn't embarrassingly obvious!

Cheers,
Conor.

>  		if (alt->errata_id >= RISCV_ISA_EXT_MAX) {
>  			WARN(1, "This extension id:%d is not in ISA extension list",
>  				alt->errata_id);
> @@ -300,6 +303,9 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
>  		if (!__riscv_isa_extension_available(NULL, alt->errata_id))
>  			continue;
>  
> +		if (!riscv_cpufeature_application_check(alt->errata_id, alt->vendor_id))
> +			continue;
> +
>  		oldptr = ALT_OLD_PTR(alt);
>  		altptr = ALT_ALT_PTR(alt);
>  		patch_text_nosync(oldptr, altptr, alt->alt_len);
> -- 
> 2.39.1
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230209/affc4079/attachment-0001.sig>
