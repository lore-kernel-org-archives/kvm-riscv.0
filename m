From: Conor Dooley <conor@kernel.org>
Date: Thu, 12 Jan 2023 21:58:28 +0000
Subject: [PATCH v3 07/13] riscv: fpu: switch has_fpu() to
 riscv_has_extension_likely()
In-Reply-To: <20230111171027.2392-8-jszhang@kernel.org>
References: <20230111171027.2392-1-jszhang@kernel.org>
 <20230111171027.2392-8-jszhang@kernel.org>
Message-ID: <Y8CChK9XBXTcT9wn@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 12, 2023 at 01:10:21AM +0800, Jisheng Zhang wrote:
> Switch has_fpu() from statich branch to the new helper

s/statich/static

> riscv_has_extension_likely().
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Modulo whatever psuedo-cpufeature shenanigans require renaming the
function, you can tack my name onto this list also...
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  arch/riscv/include/asm/switch_to.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> index 11463489fec6..60f8ca01d36e 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -59,7 +59,8 @@ static inline void __switch_to_aux(struct task_struct *prev,
>  
>  static __always_inline bool has_fpu(void)
>  {
> -	return static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_FPU]);
> +	return riscv_has_extension_likely(RISCV_ISA_EXT_f) ||
> +		riscv_has_extension_likely(RISCV_ISA_EXT_d);
>  }
>  #else
>  static __always_inline bool has_fpu(void) { return false; }
> -- 
> 2.38.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230112/ddc4c7f7/attachment-0001.sig>
