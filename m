From: Conor Dooley <conor@kernel.org>
Date: Thu, 26 Jan 2023 21:32:15 +0000
Subject: [PATCH -next v13 08/19] riscv: Introduce struct/helpers to
 save/restore per-task Vector state
In-Reply-To: <20230125142056.18356-9-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-9-andy.chiu@sifive.com>
Message-ID: <Y9LxXwzaDDS/Ny7F@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 25, 2023 at 02:20:45PM +0000, Andy Chiu wrote:
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
> __riscv_v_state.
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
> index 16cb4a1c1230..842a859609b5 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -12,6 +12,9 @@
>  
>  #include <asm/hwcap.h>
>  #include <asm/csr.h>
> +#include <asm/asm.h>
> +
> +#define CSR_STR(x) __ASM_STR(x)
>  
>  extern unsigned long riscv_vsize;
>  
> @@ -20,6 +23,26 @@ static __always_inline bool has_vector(void)
>  	return static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_VECTOR]);
>  }
>  
> +static inline void __vstate_clean(struct pt_regs *regs)

Consistent prefixes here too please, riscv_v_vstate_clean() or similar
and so on for the rest of the patch.

Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230126/fa94b982/attachment-0001.sig>
