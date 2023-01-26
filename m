From: Conor Dooley <conor@kernel.org>
Date: Thu, 26 Jan 2023 21:06:49 +0000
Subject: [PATCH -next v13 06/19] riscv: Introduce Vector enable/disable
 helpers
In-Reply-To: <20230125142056.18356-7-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-7-andy.chiu@sifive.com>
Message-ID: <Y9LraUk0SZfYWu+O@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Andy,

On Wed, Jan 25, 2023 at 02:20:43PM +0000, Andy Chiu wrote:
> These are small and likely to be frequently called so implement as
> inline routines (vs. function call).
> 
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> [vineetg: create new patch from meshup, introduced asm variant]
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> [andy.chiu: remove calls from asm thus remove asm vaiant]

Again, these chains are odd but a reflection of the series' history I
guess.

> ---
>  arch/riscv/include/asm/vector.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index 917c8867e702..0fda0faf5277 100644
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
>  	return static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_VECTOR]);

This likely will need to drop the static branch due to Jisheng's series.
See here for what the equivalent change to has_fpu() was:
https://lore.kernel.org/all/20230115154953.831-1-jszhang at kernel.org/
Hopefully that series has been queued by the time you are resubmitting
this one.

>  }
>  
> +static __always_inline void rvv_enable(void)

I'm not keen on these function names. IMO, they should be
riscv_v_{en,dis}able() to match other riscv specific functions, like
those of zicbom or sbi stuff.
Other parts of this series use riscv_v_foo & riscv_vfoo. Some of the kvm
bits spell out vector rather than v. Consistent naming of functions etc
would be appreciated.

Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230126/53a3caaf/attachment-0001.sig>
