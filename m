From: Conor Dooley <conor@kernel.org>
Date: Wed, 1 Mar 2023 16:53:58 +0000
Subject: [PATCH -next v14 10/19] riscv: Allocate user's vector context in
 the first-use trap
In-Reply-To: <20230224170118.16766-11-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-11-andy.chiu@sifive.com>
Message-ID: <Y/+DJmmZSFIgmEem@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Andy,

On Fri, Feb 24, 2023 at 05:01:09PM +0000, Andy Chiu wrote:
> Vector unit is disabled by default for all user processes. Thus, a
> process will take a trap (illegal instruction) into kernel at the first
> time when it uses Vector. Only after then, the kernel allocates V
> context and starts take care of the context for that user process.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Link: https://lore.kernel.org/r/3923eeee-e4dc-0911-40bf-84c34aee962d at linaro.org
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---

> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index 082baf2a061f..585e2c51b28e 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -4,9 +4,19 @@
>   * Author: Andy Chiu <andy.chiu@sifive.com>
>   */
>  #include <linux/export.h>
> +#include <linux/sched/signal.h>
> +#include <linux/types.h>
> +#include <linux/slab.h>
> +#include <linux/sched.h>
> +#include <linux/uaccess.h>
>  
> +#include <asm/thread_info.h>
> +#include <asm/processor.h>
> +#include <asm/insn.h>
>  #include <asm/vector.h>
>  #include <asm/csr.h>
> +#include <asm/ptrace.h>
> +#include <asm/bug.h>
>  
>  unsigned long riscv_v_vsize __read_mostly;
>  EXPORT_SYMBOL_GPL(riscv_v_vsize);
> @@ -19,3 +29,84 @@ void riscv_v_setup_vsize(void)
>  	riscv_v_disable();
>  }
>  
> +static bool insn_is_vector(u32 insn_buf)
> +{
> +	u32 opcode = insn_buf & __INSN_OPCODE_MASK;
> +	bool is_vector = false;
> +
> +	/*
> +	 * All V-related instructions, including CSR operations are 4-Byte. So,
> +	 * do not handle if the instruction length is not 4-Byte.
> +	 */
> +	if (unlikely(GET_INSN_LENGTH(insn_buf) != 4))
> +		return false;
> +
> +	switch (opcode) {
> +	case RVV_OPCODE_VECTOR:
> +		is_vector = true;
> +		break;
> +	case RVV_OPCODE_VL:

> +	case RVV_OPCODE_VS:
> +		u32 width = RVV_EXRACT_VL_VS_WIDTH(insn_buf);
> +
> +		if (width == RVV_VL_VS_WIDTH_8 || width == RVV_VL_VS_WIDTH_16 ||
> +		    width == RVV_VL_VS_WIDTH_32 || width == RVV_VL_VS_WIDTH_64)
> +			is_vector = true;
> +		break;
> +	case RVG_OPCODE_SYSTEM:
> +		u32 csr = RVG_EXTRACT_SYSTEM_CSR(insn_buf);
> +
> +		if ((csr >= CSR_VSTART && csr <= CSR_VCSR) ||
> +		    (csr >= CSR_VL && csr <= CSR_VLENB))
> +			is_vector = true;
> +		break;
> +	}

Unfortunately, this is not valid code:
/stuff/linux/arch/riscv/kernel/vector.c:50:3: error: expected expression
                u32 width = RVV_EXRACT_VL_VS_WIDTH(insn_buf);
                ^
/stuff/linux/arch/riscv/kernel/vector.c:52:7: error: use of undeclared identifier 'width'
                if (width == RVV_VL_VS_WIDTH_8 || width == RVV_VL_VS_WIDTH_16 ||
                    ^
/stuff/linux/arch/riscv/kernel/vector.c:52:37: error: use of undeclared identifier 'width'
                if (width == RVV_VL_VS_WIDTH_8 || width == RVV_VL_VS_WIDTH_16 ||
                                                  ^
/stuff/linux/arch/riscv/kernel/vector.c:53:7: error: use of undeclared identifier 'width'
                    width == RVV_VL_VS_WIDTH_32 || width == RVV_VL_VS_WIDTH_64)
                    ^
/stuff/linux/arch/riscv/kernel/vector.c:53:38: error: use of undeclared identifier 'width'
                    width == RVV_VL_VS_WIDTH_32 || width == RVV_VL_VS_WIDTH_64)
                                                   ^
/stuff/linux/arch/riscv/kernel/vector.c:57:3: error: expected expression
                u32 csr = RVG_EXTRACT_SYSTEM_CSR(insn_buf);
                ^
/stuff/linux/arch/riscv/kernel/vector.c:59:8: error: use of undeclared identifier 'csr'
                if ((csr >= CSR_VSTART && csr <= CSR_VCSR) ||
                     ^
/stuff/linux/arch/riscv/kernel/vector.c:59:29: error: use of undeclared identifier 'csr'
                if ((csr >= CSR_VSTART && csr <= CSR_VCSR) ||
                                          ^
/stuff/linux/arch/riscv/kernel/vector.c:60:8: error: use of undeclared identifier 'csr'
                    (csr >= CSR_VL && csr <= CSR_VLENB))
                     ^
/stuff/linux/arch/riscv/kernel/vector.c:60:25: error: use of undeclared identifier 'csr'
                    (csr >= CSR_VL && csr <= CSR_VLENB))
                                      ^
10 errors generated.
make[5]: *** [/stuff/linux/scripts/Makefile.build:252: arch/riscv/kernel/vector.o] Error 1

:/
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230301/82b9b561/attachment-0001.sig>
