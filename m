From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 28 Feb 2024 13:13:14 +0100
Subject: [kvm-unit-tests PATCH 30/32] configure: Make arch_libdir a
 first-class entity
In-Reply-To: <20240226101218.1472843-31-npiggin@gmail.com>
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-31-npiggin@gmail.com>
Message-ID: <20240228-e9507071ef0c14477ba703ae@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 26, 2024 at 08:12:16PM +1000, Nicholas Piggin wrote:
> arch_libdir was brought in to improve the heuristic determination of
> the lib/ directory based on arch and testdir names, but it did not
> entirely clean that mess up.
> 
> Remove the arch_libdir->arch->testdir heuristic and just require
> everybody sets arch_libdir correctly. Fail if the lib/arch or
> lib/arch/asm directories can not be found.
> 
> Cc: Alexandru Elisei <alexandru.elisei@arm.com>
> Cc: Andrew Jones <andrew.jones@linux.dev>
> Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Eric Auger <eric.auger@redhat.com>
> Cc: Janosch Frank <frankja@linux.ibm.com>
> Cc: Laurent Vivier <lvivier@redhat.com>
> Cc: Nico B?hr <nrb@linux.ibm.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: kvm at vger.kernel.org
> Cc: linux-s390 at vger.kernel.org
> Cc: kvmarm at lists.linux.dev
> Cc: kvm-riscv at lists.infradead.org
> Cc: linuxppc-dev at lists.ozlabs.org
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  Makefile  |  2 +-
>  configure | 18 +++++++++++++-----
>  2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 4f35fffc6..4e0f54543 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -10,7 +10,7 @@ include config.mak
>  VPATH = $(SRCDIR)
>  
>  libdirs-get = $(shell [ -d "lib/$(1)" ] && echo "lib/$(1) lib/$(1)/asm")
> -ARCH_LIBDIRS := $(call libdirs-get,$(ARCH_LIBDIR)) $(call libdirs-get,$(TEST_DIR))
> +ARCH_LIBDIRS := $(call libdirs-get,$(ARCH_LIBDIR))
>  OBJDIRS := $(ARCH_LIBDIRS)
>  
>  DESTDIR := $(PREFIX)/share/kvm-unit-tests/
> diff --git a/configure b/configure
> index ae522c556..8c0e3506f 100755
> --- a/configure
> +++ b/configure
> @@ -199,7 +199,6 @@ fi
>  arch_name=$arch
>  [ "$arch" = "aarch64" ] && arch="arm64"
>  [ "$arch_name" = "arm64" ] && arch_name="aarch64"
> -arch_libdir=$arch
>  
>  if [ "$arch" = "riscv" ]; then
>      echo "riscv32 or riscv64 must be specified"
> @@ -264,8 +263,10 @@ fi
>  
>  if [ "$arch" = "i386" ] || [ "$arch" = "x86_64" ]; then
>      testdir=x86
> +    arch_libdir=x86
>  elif [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
>      testdir=arm
> +    arch_libdir=$arch
>      if [ "$target" = "qemu" ]; then
>          arm_uart_early_addr=0x09000000
>      elif [ "$target" = "kvmtool" ]; then
> @@ -314,6 +315,7 @@ elif [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
>      fi
>  elif [ "$arch" = "ppc64" ]; then
>      testdir=powerpc
> +    arch_libdir=ppc64
>      firmware="$testdir/boot_rom.bin"
>      if [ "$endian" != "little" ] && [ "$endian" != "big" ]; then
>          echo "You must provide endianness (big or little)!"
> @@ -324,6 +326,7 @@ elif [ "$arch" = "riscv32" ] || [ "$arch" = "riscv64" ]; then
>      arch_libdir=riscv
>  elif [ "$arch" = "s390x" ]; then
>      testdir=s390x
> +    arch_libdir=s390x

Probably could have left the arch_libdir=$arch above and only added the
ppc64 line, but either way.

>  else
>      echo "arch $arch is not supported!"
>      arch=
> @@ -333,6 +336,10 @@ if [ ! -d "$srcdir/$testdir" ]; then
>      echo "$srcdir/$testdir does not exist!"
>      exit 1
>  fi
> +if [ ! -d "$srcdir/lib/$arch_libdir" ]; then
> +    echo "$srcdir/lib/$arch_libdir does not exist!"
> +    exit 1
> +fi
>  
>  if [ "$efi" = "y" ] && [ -f "$srcdir/$testdir/efi/run" ]; then
>      ln -fs "$srcdir/$testdir/efi/run" $testdir-run
> @@ -395,10 +402,11 @@ fi
>  # link lib/asm for the architecture
>  rm -f lib/asm
>  asm="asm-generic"
> -if [ -d "$srcdir/lib/$arch/asm" ]; then
> -	asm="$srcdir/lib/$arch/asm"
> -elif [ -d "$srcdir/lib/$testdir/asm" ]; then
> -	asm="$srcdir/lib/$testdir/asm"
> +if [ -d "$srcdir/lib/$arch_libdir/asm" ]; then
> +    asm="$srcdir/lib/$arch_libdir/asm"
> +else
> +    echo "$srcdir/lib/$arch_libdir/asm does not exist"
> +    exit 1
>  fi
>  mkdir -p lib
>  ln -sf "$asm" lib/asm
> -- 
> 2.42.0
> 
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

Thanks,
drew

