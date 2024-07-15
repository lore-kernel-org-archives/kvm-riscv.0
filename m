From: Palmer Dabbelt <palmer@dabbelt.com>
Date: Mon, 15 Jul 2024 08:45:32 -0700 (PDT)
Subject: [PATCH v3 4/6] riscv: hwprobe: export Zawrs ISA extension
In-Reply-To: <20240426100820.14762-12-ajones@ventanamicro.com>
Message-ID: <mhng-fca2e1e4-385d-4210-8814-680be3a2ee4d@palmer-ri-x1c9>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 26 Apr 2024 03:08:24 PDT (-0700), ajones at ventanamicro.com wrote:
> Export Zawrs ISA extension through hwprobe.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 4 ++++
>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>  arch/riscv/kernel/sys_hwprobe.c       | 1 +
>  3 files changed, 6 insertions(+)
>
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index b2bcc9eed9aa..e072ce8285d8 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -188,6 +188,10 @@ The following keys are defined:
>         manual starting from commit 95cf1f9 ("Add changes requested by Ved
>         during signoff")
>
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZAWRS`: The Zawrs extension is supported as
> +       ratified in commit 98918c844281 ("Merge pull request #1217 from
> +       riscv/zawrs") of riscv-isa-manual.
> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
>    information about the selected set of processors.
>
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index 9f2a8e3ff204..a5fca3878a32 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -59,6 +59,7 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
>  #define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
>  #define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
> +#define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 36)

I bumped this to a non-conflicting key when I picked up the patch, I 
figured that'd be better as then we don't have a uABI hiccup.  There 
were some other merge coflicts that looked easy to be, but LMK if I 
screwed something up as I'm not operating on a ton of sleep...

>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 8cae41a502dd..b86e3531a45a 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -111,6 +111,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
>  		EXT_KEY(ZTSO);
>  		EXT_KEY(ZACAS);
>  		EXT_KEY(ZICOND);
> +		EXT_KEY(ZAWRS);
>
>  		if (has_vector()) {
>  			EXT_KEY(ZVBB);

