From: Guo Ren <guoren@kernel.org>
Date: Thu, 1 Jun 2023 12:46:10 +0800
Subject: [PATCH -next v20 03/26] riscv: hwprobe: Add support for probing V
 in RISCV_HWPROBE_KEY_IMA_EXT_0
In-Reply-To: <20230518161949.11203-4-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com> <20230518161949.11203-4-andy.chiu@sifive.com>
Message-ID: <CAJF2gTRpTdXeDXczaVCmZdd0fNQADBPpd3+VMnYsd+XcudHSXg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 19, 2023 at 12:20?AM Andy Chiu <andy.chiu@sifive.com> wrote:
>
> Probing kernel support for Vector extension is available now. This only
> add detection for V only. Extenions like Zvfh, Zk are not in this scope.
>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Guo Ren <guoren@kernel.org>

> ---
> Changelog v20:
>  - Fix a typo in document, and remove duplicated probes (Heiko)
>  - probe V extension in RISCV_HWPROBE_KEY_IMA_EXT_0 key only (Palmer,
>    Evan)
> ---
>  Documentation/riscv/hwprobe.rst       | 3 +++
>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>  arch/riscv/kernel/sys_riscv.c         | 4 ++++
>  3 files changed, 8 insertions(+)
>
> diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
> index 9f0dd62dcb5d..7431d9d01c73 100644
> --- a/Documentation/riscv/hwprobe.rst
> +++ b/Documentation/riscv/hwprobe.rst
> @@ -64,6 +64,9 @@ The following keys are defined:
>    * :c:macro:`RISCV_HWPROBE_IMA_C`: The C extension is supported, as defined
>      by version 2.2 of the RISC-V ISA manual.
>
> +  * :c:macro:`RISCV_HWPROBE_IMA_V`: The V extension is supported, as defined by
> +    version 1.0 of the RISC-V Vector extension manual.
> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
>    information about the selected set of processors.
>
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index 8d745a4ad8a2..7c6fdcf7ced5 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -25,6 +25,7 @@ struct riscv_hwprobe {
>  #define RISCV_HWPROBE_KEY_IMA_EXT_0    4
>  #define                RISCV_HWPROBE_IMA_FD            (1 << 0)
>  #define                RISCV_HWPROBE_IMA_C             (1 << 1)
> +#define                RISCV_HWPROBE_IMA_V             (1 << 2)
>  #define RISCV_HWPROBE_KEY_CPUPERF_0    5
>  #define                RISCV_HWPROBE_MISALIGNED_UNKNOWN        (0 << 0)
>  #define                RISCV_HWPROBE_MISALIGNED_EMULATED       (1 << 0)
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> index 5db29683ebee..88357a848797 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -10,6 +10,7 @@
>  #include <asm/cpufeature.h>
>  #include <asm/hwprobe.h>
>  #include <asm/sbi.h>
> +#include <asm/vector.h>
>  #include <asm/switch_to.h>
>  #include <asm/uaccess.h>
>  #include <asm/unistd.h>
> @@ -171,6 +172,9 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>                 if (riscv_isa_extension_available(NULL, c))
>                         pair->value |= RISCV_HWPROBE_IMA_C;
>
> +               if (has_vector())
> +                       pair->value |= RISCV_HWPROBE_IMA_V;
> +
>                 break;
>
>         case RISCV_HWPROBE_KEY_CPUPERF_0:
> --
> 2.17.1
>


-- 
Best Regards
 Guo Ren

