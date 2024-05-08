From: Muhammad Usama Anjum <usama.anjum@collabora.com>
Date: Wed, 8 May 2024 12:48:57 +0500
Subject: [PATCH v2 1/5] selftests: Compile kselftest headers with
 -D_GNU_SOURCE
In-Reply-To: <20240507214254.2787305-2-edliaw@google.com>
References: <20240507214254.2787305-1-edliaw@google.com>
 <20240507214254.2787305-2-edliaw@google.com>
Message-ID: <546aaaa7-d796-46af-8805-1612759aaaa5@collabora.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Thanks for patches

On 5/8/24 2:38 AM, Edward Liaw wrote:
> Add the -D_GNU_SOURCE flag to KHDR_INCLUDES so that it is defined in a
> central location.
> 
> 809216233555 ("selftests/harness: remove use of LINE_MAX") introduced
> asprintf into kselftest_harness.h, which is a GNU extension and needs
> _GNU_SOURCE to either be defined prior to including headers or with the
> -D_GNU_SOURCE flag passed to the compiler.
> 
> Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202404301040.3bea5782-oliver.sang at intel.com
> Signed-off-by: Edward Liaw <edliaw@google.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

> ---
>  tools/testing/selftests/Makefile            | 4 ++--
>  tools/testing/selftests/kselftest_harness.h | 2 +-
>  tools/testing/selftests/lib.mk              | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
> index e1504833654d..ed012a7f0786 100644
> --- a/tools/testing/selftests/Makefile
> +++ b/tools/testing/selftests/Makefile
> @@ -161,11 +161,11 @@ ifneq ($(KBUILD_OUTPUT),)
>    # $(realpath ...) resolves symlinks
>    abs_objtree := $(realpath $(abs_objtree))
>    BUILD := $(abs_objtree)/kselftest
> -  KHDR_INCLUDES := -isystem ${abs_objtree}/usr/include
> +  KHDR_INCLUDES := -D_GNU_SOURCE -isystem ${abs_objtree}/usr/include
>  else
>    BUILD := $(CURDIR)
>    abs_srctree := $(shell cd $(top_srcdir) && pwd)
> -  KHDR_INCLUDES := -isystem ${abs_srctree}/usr/include
> +  KHDR_INCLUDES := -D_GNU_SOURCE -isystem ${abs_srctree}/usr/include
>    DEFAULT_INSTALL_HDR_PATH := 1
>  endif
>  
> diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
> index d98702b6955d..b2a1b6343896 100644
> --- a/tools/testing/selftests/kselftest_harness.h
> +++ b/tools/testing/selftests/kselftest_harness.h
> @@ -51,7 +51,7 @@
>  #define __KSELFTEST_HARNESS_H
>  
>  #ifndef _GNU_SOURCE
> -#define _GNU_SOURCE
> +static_assert(0, "kselftest harness requires _GNU_SOURCE to be defined");
>  #endif
>  #include <asm/types.h>
>  #include <ctype.h>
> diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
> index da2cade3bab0..2503dc732b4d 100644
> --- a/tools/testing/selftests/lib.mk
> +++ b/tools/testing/selftests/lib.mk
> @@ -45,7 +45,7 @@ selfdir = $(realpath $(dir $(filter %/lib.mk,$(MAKEFILE_LIST))))
>  top_srcdir = $(selfdir)/../../..
>  
>  ifeq ($(KHDR_INCLUDES),)
> -KHDR_INCLUDES := -isystem $(top_srcdir)/usr/include
> +KHDR_INCLUDES := -D_GNU_SOURCE -isystem $(top_srcdir)/usr/include
>  endif
>  
>  # The following are built by lib.mk common compile rules.

-- 
BR,
Muhammad Usama Anjum

