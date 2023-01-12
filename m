From: Conor Dooley <conor@kernel.org>
Date: Thu, 12 Jan 2023 21:49:26 +0000
Subject: [PATCH v3 09/13] riscv: switch to relative alternative entries
In-Reply-To: <20230111171027.2392-10-jszhang@kernel.org>
References: <20230111171027.2392-1-jszhang@kernel.org>
 <20230111171027.2392-10-jszhang@kernel.org>
Message-ID: <Y8CAZiEnhiMmuiDK@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Jisheng,

On Thu, Jan 12, 2023 at 01:10:23AM +0800, Jisheng Zhang wrote:
> Instead of using absolute addresses for both the old instrucions and
> the alternative instructions, use offsets relative to the alt_entry
> values. So this not only cuts the size of the alternative entry, but
> also meets the prerequisite for patching alternatives in the vDSO,
> since absolute alternative entries are subject to dynamic relocation,
> which is incompatible with the vDSO building.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/errata/sifive/errata.c           |  4 +++-
>  arch/riscv/errata/thead/errata.c            | 11 ++++++++---
>  arch/riscv/include/asm/alternative-macros.h | 20 ++++++++++----------
>  arch/riscv/include/asm/alternative.h        | 12 ++++++------
>  arch/riscv/kernel/cpufeature.c              |  8 +++++---
>  5 files changed, 32 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
> index 1031038423e7..0e537cdfd324 100644
> --- a/arch/riscv/errata/sifive/errata.c
> +++ b/arch/riscv/errata/sifive/errata.c
> @@ -107,7 +107,9 @@ void __init_or_module sifive_errata_patch_func(struct alt_entry *begin,
>  
>  		tmp = (1U << alt->errata_id);
>  		if (cpu_req_errata & tmp) {
> -			patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> +			patch_text_nosync((void *)&alt->old_offset + alt->old_offset,
> +					  (void *)&alt->alt_offset + alt->alt_offset,
> +					  alt->alt_len);

I left a comment on v2 that went unanswered:
https://lore.kernel.org/all/Y4+3nJ53nvmmc8+z at spud/

The TL;DR is that I would like you to create a macro for this so that
this messy operation is done in a central location, with a nice comment
explaining the offsets. If my "analysis" there was correct, feel free to
use it as a starting point for said comment.

The macro would then reduce the above to something like:
patch_text_nosync(ALT_OFFSET_ADDRESS(alt->old_offset),
		  ALT_OFFSET_ADDRESS(alt->alt_offset),
		  alt->alt_len);

Which I think is easier to understand since this "concept" will show up
in several places & is less intuitive than what we currently have.
Nothing beats having this stuff well explained in the codebase IMO.

> diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> index 1bd4027d34ca..b6050a235f50 100644
> --- a/arch/riscv/include/asm/alternative.h
> +++ b/arch/riscv/include/asm/alternative.h
> @@ -31,12 +31,12 @@ void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
>  				   int patch_offset);
>  
>  struct alt_entry {
> -	void *old_ptr;		 /* address of original instruciton or data  */
> -	void *alt_ptr;		 /* address of replacement instruction or data */
> -	unsigned long vendor_id; /* cpu vendor id */
> -	unsigned long alt_len;   /* The replacement size */
> -	unsigned int errata_id;  /* The errata id */
> -} __packed;
> +	s32 old_offset;		/* offset relative to original instruciton or data  */
> +	s32 alt_offset;		/* offset relative to replacement instruction or data */

This wording is better, but you should fix the "instruciton" typo while
you are in the area.

> +	u16 vendor_id;		/* cpu vendor id */
> +	u16 alt_len;		/* The replacement size */
> +	u32 errata_id;		/* The errata id */
> +};

Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230112/45f685c6/attachment-0001.sig>
