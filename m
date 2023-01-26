From: Conor Dooley <conor@kernel.org>
Date: Thu, 26 Jan 2023 23:19:22 +0000
Subject: [PATCH -next v13 14/19] riscv: signal: Report signal frame size
 to userspace via auxv
In-Reply-To: <20230125142056.18356-15-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-15-andy.chiu@sifive.com>
Message-ID: <Y9MKeqtT+PEe7KTY@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 25, 2023 at 02:20:51PM +0000, Andy Chiu wrote:
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index 44d2eb381ca6..4f36c553605e 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -7,6 +7,7 @@
>  #define _ASM_RISCV_PROCESSOR_H
>  
>  #include <linux/const.h>
> +#include <linux/cache.h>

What have I missed that is the reason for adding this header?

>  #include <vdso/processor.h>
>  
> @@ -203,8 +205,10 @@ static size_t cal_rt_frame_size(void)
>  
>  	frame_size = sizeof(*frame);
>  
> -	if (has_vector() && vstate_query(task_pt_regs(current)))
> -		total_context_size += rvv_sc_size;

Usual naming comment here about rvv.

Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230126/b8eb60e6/attachment-0001.sig>
