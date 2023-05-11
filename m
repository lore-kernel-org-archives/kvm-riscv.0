From: Palmer Dabbelt <palmer@dabbelt.com>
Date: Thu, 11 May 2023 15:56:34 -0700 (PDT)
Subject: [PATCH -next v19 01/24] riscv: Rename __switch_to_aux() -> fpu
In-Reply-To: <20230509103033.11285-2-andy.chiu@sifive.com>
Message-ID: <mhng-b8482399-b363-402b-b095-ce1b1dc1fe71@palmer-ri-x1c9a>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 09 May 2023 03:30:10 PDT (-0700), andy.chiu at sifive.com wrote:
> From: Guo Ren <ren_guo@c-sky.com>
>
> The name of __switch_to_aux() is not clear and rename it with the
> determine function: __switch_to_fpu(). Next we could add other regs'
> switch.
>
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/asm/switch_to.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> index 60f8ca01d36e..4b96b13dee27 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -46,7 +46,7 @@ static inline void fstate_restore(struct task_struct *task,
>  	}
>  }
>
> -static inline void __switch_to_aux(struct task_struct *prev,
> +static inline void __switch_to_fpu(struct task_struct *prev,
>  				   struct task_struct *next)
>  {
>  	struct pt_regs *regs;
> @@ -66,7 +66,7 @@ static __always_inline bool has_fpu(void)
>  static __always_inline bool has_fpu(void) { return false; }
>  #define fstate_save(task, regs) do { } while (0)
>  #define fstate_restore(task, regs) do { } while (0)
> -#define __switch_to_aux(__prev, __next) do { } while (0)
> +#define __switch_to_fpu(__prev, __next) do { } while (0)
>  #endif
>
>  extern struct task_struct *__switch_to(struct task_struct *,
> @@ -77,7 +77,7 @@ do {							\
>  	struct task_struct *__prev = (prev);		\
>  	struct task_struct *__next = (next);		\
>  	if (has_fpu())					\
> -		__switch_to_aux(__prev, __next);	\
> +		__switch_to_fpu(__prev, __next);	\
>  	((last) = __switch_to(__prev, __next));		\
>  } while (0)

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

