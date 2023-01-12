From: Conor Dooley <conor@kernel.org>
Date: Thu, 12 Jan 2023 21:59:42 +0000
Subject: [PATCH v3 11/13] riscv: cpu_relax: switch to
 riscv_has_extension_likely()
In-Reply-To: <20230111171027.2392-12-jszhang@kernel.org>
References: <20230111171027.2392-1-jszhang@kernel.org>
 <20230111171027.2392-12-jszhang@kernel.org>
Message-ID: <Y8CCzs4RpxcGqqqB@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 12, 2023 at 01:10:25AM +0800, Jisheng Zhang wrote:
> Switch cpu_relax() from static branch to the new helper
> riscv_has_extension_likely()
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Guo Ren <guoren@kernel.org>

With the same caveat here as with fpu, may as well join the
posse once more...
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  arch/riscv/include/asm/vdso/processor.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/vdso/processor.h b/arch/riscv/include/asm/vdso/processor.h
> index fa70cfe507aa..edf0e25e43d1 100644
> --- a/arch/riscv/include/asm/vdso/processor.h
> +++ b/arch/riscv/include/asm/vdso/processor.h
> @@ -10,7 +10,7 @@
>  
>  static inline void cpu_relax(void)
>  {
> -	if (!static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_ZIHINTPAUSE])) {
> +	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZIHINTPAUSE)) {
>  #ifdef __riscv_muldiv
>  		int dummy;
>  		/* In lieu of a halt instruction, induce a long-latency stall. */
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
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230112/a11bacbd/attachment-0001.sig>
