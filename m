From: Conor Dooley <conor@kernel.org>
Date: Tue, 28 Feb 2023 23:00:50 -0000
Subject: [PATCH -next v14 08/19] riscv: Introduce struct/helpers to
 save/restore per-task Vector state
In-Reply-To: <20230224170118.16766-9-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-9-andy.chiu@sifive.com>
Message-ID: <Y/6HmORLbsFWsEbu@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 24, 2023 at 05:01:07PM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> Add vector state context struct to be added later in thread_struct. And
> prepare low-level helper functions to save/restore vector contexts.
> 
> This include Vector Regfile and CSRs holding dynamic configuration state
> (vstart, vl, vtype, vcsr). The Vec Register width could be implementation
> defined, but same for all processes, so that is saved separately.
> 
> This is not yet wired into final thread_struct - will be done when
> __switch_to actually starts doing this in later patches.
> 
> Given the variable (and potentially large) size of regfile, they are
> saved in dynamically allocated memory, pointed to by datap pointer in
> __riscv_v_ext_state.
> 
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> [vineetg: merged bits from 2 different patches]
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> [andy.chiu: use inline asm to save/restore context, remove asm vaiant]
> ---
>  arch/riscv/include/asm/vector.h      | 84 ++++++++++++++++++++++++++++
>  arch/riscv/include/uapi/asm/ptrace.h | 17 ++++++
>  2 files changed, 101 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index 692d3ee2d2d3..9c025f2efdc3 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -12,6 +12,9 @@
>  
>  #include <asm/hwcap.h>
>  #include <asm/csr.h>
> +#include <asm/asm.h>
> +
> +#define CSR_STR(x) __ASM_STR(x)

TBH, I'm not really sure what this definition adds.

>  extern unsigned long riscv_v_vsize;
>  void riscv_v_setup_vsize(void);
> @@ -21,6 +24,26 @@ static __always_inline bool has_vector(void)
>  	return riscv_has_extension_likely(RISCV_ISA_EXT_v);
>  }
>  
> +static inline void __riscv_v_vstate_clean(struct pt_regs *regs)
> +{
> +	regs->status = (regs->status & ~(SR_VS)) | SR_VS_CLEAN;
> +}
> +
> +static inline void riscv_v_vstate_off(struct pt_regs *regs)
> +{
> +	regs->status = (regs->status & ~SR_VS) | SR_VS_OFF;

Inconsistent use of brackets here compared to the other items.
They're not actually needed anywhere here, are they?

> +}
> +
> +static inline void riscv_v_vstate_on(struct pt_regs *regs)
> +{
> +	regs->status = (regs->status & ~(SR_VS)) | SR_VS_INITIAL;
> +}

Other than that, this seems fine? I only really had a quick check of the
asm though, so with the brackets thing fixed up:
Acked-by: Conor Dooley <conor.dooley@microchip.com>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230228/fbe9a099/attachment-0001.sig>
