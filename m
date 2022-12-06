From: Conor Dooley <conor@kernel.org>
Date: Tue, 06 Dec 2022 22:04:33 -0000
Subject: [PATCH v2 11/13] riscv: cpu_relax: switch to
 riscv_has_extension_likely()
In-Reply-To: <20221204174632.3677-12-jszhang@kernel.org>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <20221204174632.3677-12-jszhang@kernel.org>
Message-ID: <Y4+8ZY8xb2nMRCD6@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 05, 2022 at 01:46:30AM +0800, Jisheng Zhang wrote:
> Switch cpu_relax() from statich branch to the new helper

The tiniest nit: static

> riscv_has_extension_likely()
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
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
> 2.37.2
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20221206/908d1260/attachment-0001.sig>
