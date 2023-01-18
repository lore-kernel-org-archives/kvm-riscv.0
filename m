From: Conor Dooley <conor@kernel.org>
Date: Wed, 18 Jan 2023 22:11:04 +0000
Subject: [PATCH v4 09/13] riscv: switch to relative alternative entries
In-Reply-To: <20230115154953.831-10-jszhang@kernel.org>
References: <20230115154953.831-1-jszhang@kernel.org>
 <20230115154953.831-10-jszhang@kernel.org>
Message-ID: <Y8hueOxeSzF6MT2+@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jan 15, 2023 at 11:49:49PM +0800, Jisheng Zhang wrote:
> Instead of using absolute addresses for both the old instrucions and
> the alternative instructions, use offsets relative to the alt_entry
> values. So this not only cuts the size of the alternative entry, but
> also meets the prerequisite for patching alternatives in the vDSO,
> since absolute alternative entries are subject to dynamic relocation,
> which is incompatible with the vDSO building.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

> +/* add the relative offset to the address of the offset to get the absolute address */
> +#define __ALT_PTR(a, f)			((void *)&(a)->f + (a)->f)
> +#define ALT_OLD_PTR(a)			__ALT_PTR(a, old_offset)
> +#define ALT_ALT_PTR(a)			__ALT_PTR(a, alt_offset)

LGTM, thanks for doing that! Certainly makes things more understandable.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> +		oldptr = ALT_OLD_PTR(alt);
> +		altptr = ALT_ALT_PTR(alt);
>  		if (!__riscv_isa_extension_available(NULL, alt->errata_id))
>  			continue;
>  

One minor nit, the oldptr/altptr assignments could go down here, below
the if/continue, right? Obviously don't respin for that though!

> -		patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> -		riscv_alternative_fix_offsets(alt->old_ptr, alt->alt_len,
> -					      alt->old_ptr - alt->alt_ptr);
> +		patch_text_nosync(oldptr, altptr, alt->alt_len);
> +		riscv_alternative_fix_offsets(oldptr, alt->alt_len, oldptr - altptr);
>  	}
>  }
>  #endif

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230118/a18e39cb/attachment-0001.sig>
