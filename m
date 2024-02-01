From: Eric Auger <eric.auger@redhat.com>
Date: Thu, 1 Feb 2024 09:29:39 +0100
Subject: [kvm-unit-tests PATCH v2 01/24] configure: Add ARCH_LIBDIR
In-Reply-To: <20240126142324.66674-27-andrew.jones@linux.dev>
References: <20240126142324.66674-26-andrew.jones@linux.dev>
 <20240126142324.66674-27-andrew.jones@linux.dev>
Message-ID: <ded71dfc-0233-4f91-9c27-69845836ba44@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Drew,

On 1/26/24 15:23, Andrew Jones wrote:
> Prepare for an architecture which will share the same lib/$ARCH
> directory, but be configured with different arch names for different
> bit widths, i.e. riscv32 -> lib/riscv and riscv64 -> lib/riscv.
>
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  Makefile  | 2 +-
>  configure | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 602910dda11b..4f35fffc685b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -10,7 +10,7 @@ include config.mak
>  VPATH = $(SRCDIR)
>  
>  libdirs-get = $(shell [ -d "lib/$(1)" ] && echo "lib/$(1) lib/$(1)/asm")
> -ARCH_LIBDIRS := $(call libdirs-get,$(ARCH)) $(call libdirs-get,$(TEST_DIR))
> +ARCH_LIBDIRS := $(call libdirs-get,$(ARCH_LIBDIR)) $(call libdirs-get,$(TEST_DIR))
>  OBJDIRS := $(ARCH_LIBDIRS)
>  
>  DESTDIR := $(PREFIX)/share/kvm-unit-tests/
> diff --git a/configure b/configure
> index 6ee9b27a6af2..ada6512702a1 100755
> --- a/configure
> +++ b/configure
> @@ -198,6 +198,7 @@ fi
>  arch_name=$arch
>  [ "$arch" = "aarch64" ] && arch="arm64"
>  [ "$arch_name" = "arm64" ] && arch_name="aarch64"
> +arch_libdir=$arch
>  
>  if [ -z "$target" ]; then
>      target="qemu"
> @@ -391,6 +392,7 @@ PREFIX=$prefix
>  HOST=$host
>  ARCH=$arch
>  ARCH_NAME=$arch_name
> +ARCH_LIBDIR=$arch_libdir
>  PROCESSOR=$processor
>  CC=$cross_prefix$cc
>  CFLAGS=$cflags


