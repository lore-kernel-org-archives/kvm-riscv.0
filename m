From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 13 Dec 2023 14:52:15 +0100
Subject: [PATCH v4 03/11] KVM: selftests: Add CONFIG_64BIT definition for
 the build
In-Reply-To: <227b86955b24583b5cacedc8480e8f5d7e4fabf8.1702371136.git.haibo1.xu@intel.com>
References: <cover.1702371136.git.haibo1.xu@intel.com>
 <227b86955b24583b5cacedc8480e8f5d7e4fabf8.1702371136.git.haibo1.xu@intel.com>
Message-ID: <20231213-b7a894416841716b792da2d5@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 12, 2023 at 05:31:12PM +0800, Haibo Xu wrote:
> Since only 64bit KVM selftests were supported on all architectures,
> add the CONFIG_64BIT definition in kvm/Makefile to ensure only 64bit
> definitions were available in the corresponding included files.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/testing/selftests/kvm/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> index 4838ea899bbb..bb03e278a163 100644
> --- a/tools/testing/selftests/kvm/Makefile
> +++ b/tools/testing/selftests/kvm/Makefile
> @@ -225,7 +225,7 @@ else
>  LINUX_TOOL_ARCH_INCLUDE = $(top_srcdir)/tools/arch/$(ARCH)/include
>  endif
>  CFLAGS += -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99 \
> -	-Wno-gnu-variable-sized-type-not-at-end -MD\
> +	-Wno-gnu-variable-sized-type-not-at-end -MD -DCONFIG_64BIT \
>  	-fno-builtin-memcmp -fno-builtin-memcpy -fno-builtin-memset \
>  	-fno-builtin-strnlen \
>  	-fno-stack-protector -fno-PIE -I$(LINUX_TOOL_INCLUDE) \
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

