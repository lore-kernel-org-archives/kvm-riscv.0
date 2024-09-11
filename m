From: Nicholas Piggin <npiggin@gmail.com>
Date: Wed, 11 Sep 2024 10:24:34 +1000
Subject: [kvm-unit-tests PATCH v2 3/4] configure: Support cross
 compiling with clang
In-Reply-To: <20240904105020.1179006-9-andrew.jones@linux.dev>
References: <20240904105020.1179006-6-andrew.jones@linux.dev>
 <20240904105020.1179006-9-andrew.jones@linux.dev>
Message-ID: <D430ZV4FP2GE.3B7VE2I37RPXX@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed Sep 4, 2024 at 8:50 PM AEST, Andrew Jones wrote:
> When a user specifies the compiler with --cc assume it's already
> fully named, even if the user also specifies a cross-prefix. This
> allows clang to be selected for the compiler, which doesn't use
> prefixes, but also still provide a cross prefix for binutils. If
> a user needs a prefix on the compiler that they specify with --cc,
> then they'll just have to specify it with the prefix prepended.

Makes sense.

> Also ensure user provided cflags are used when testing the compiler,
> since the flags may drastically change behavior, such as the --target
> flag for clang.

Could be a separate patch but no big deal.

>
> With these changes it's possible to cross compile for riscv with
> clang after configuring with
>
>  ./configure --arch=riscv64 --cc=clang --cflags='--target=riscv64' \
>              --cross-prefix=riscv64-linux-gnu-

Nice. Perhaps add a recipe to README?

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick

>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>  configure | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/configure b/configure
> index 27ae9cc89657..337af07374df 100755
> --- a/configure
> +++ b/configure
> @@ -130,6 +130,7 @@ while [[ "$1" = -* ]]; do
>  	    ;;
>  	--cc)
>  	    cc="$arg"
> +	    cc_selected=yes
>  	    ;;
>  	--cflags)
>  	    cflags="$arg"
> @@ -200,6 +201,10 @@ while [[ "$1" = -* ]]; do
>      esac
>  done
>  
> +if [ -z "$cc_selected" ] && [ "$cross_prefix" ]; then
> +    cc="$cross_prefix$cc"
> +fi
> +
>  if [ -z "$efi" ] || [ "$efi" = "n" ]; then
>      [ "$efi_direct" = "y" ] && efi_direct=
>  fi
> @@ -370,7 +375,7 @@ fi
>  cat << EOF > lib-test.c
>  __UINT32_TYPE__
>  EOF
> -u32_long=$("$cross_prefix$cc" -E lib-test.c | grep -v '^#' | grep -q long && echo yes)
> +u32_long=$("$cc" $cflags -E lib-test.c | grep -v '^#' | grep -q long && echo yes)
>  rm -f lib-test.c
>  
>  # check if slash can be used for division
> @@ -379,7 +384,7 @@ if [ "$arch" = "i386" ] || [ "$arch" = "x86_64" ]; then
>  foo:
>      movl (8 / 2), %eax
>  EOF
> -  wa_divide=$("$cross_prefix$cc" -c lib-test.S >/dev/null 2>&1 || echo yes)
> +  wa_divide=$("$cc" $cflags -c lib-test.S >/dev/null 2>&1 || echo yes)
>    rm -f lib-test.{o,S}
>  fi
>  
> @@ -442,7 +447,7 @@ ARCH=$arch
>  ARCH_NAME=$arch_name
>  ARCH_LIBDIR=$arch_libdir
>  PROCESSOR=$processor
> -CC=$cross_prefix$cc
> +CC=$cc
>  CFLAGS=$cflags
>  LD=$cross_prefix$ld
>  OBJCOPY=$cross_prefix$objcopy


