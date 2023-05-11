From: Palmer Dabbelt <palmer@dabbelt.com>
Date: Thu, 11 May 2023 15:56:41 -0700 (PDT)
Subject: [PATCH -next v19 07/24] riscv: Introduce Vector enable/disable helpers
In-Reply-To: <20230509103033.11285-8-andy.chiu@sifive.com>
Message-ID: <mhng-52a1b4c6-da8b-4f8c-8587-efd8fc294aa8@palmer-ri-x1c9a>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 09 May 2023 03:30:16 PDT (-0700), andy.chiu at sifive.com wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>
> These are small and likely to be frequently called so implement as
> inline routines (vs. function call).
>
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/vector.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index 427a3b51df72..dfe5a321b2b4 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -11,12 +11,23 @@
>  #ifdef CONFIG_RISCV_ISA_V
>
>  #include <asm/hwcap.h>
> +#include <asm/csr.h>
>
>  static __always_inline bool has_vector(void)
>  {
>  	return riscv_has_extension_likely(RISCV_ISA_EXT_v);
>  }
>
> +static __always_inline void riscv_v_enable(void)
> +{
> +	csr_set(CSR_SSTATUS, SR_VS);
> +}
> +
> +static __always_inline void riscv_v_disable(void)
> +{
> +	csr_clear(CSR_SSTATUS, SR_VS);
> +}
> +
>  #else /* ! CONFIG_RISCV_ISA_V  */
>
>  static __always_inline bool has_vector(void) { return false; }

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

