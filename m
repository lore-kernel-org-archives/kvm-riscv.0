From: Muhammad Usama Anjum <usama.anjum@collabora.com>
Date: Wed, 8 May 2024 12:49:23 +0500
Subject: [PATCH v2 2/5] selftests/sgx: Include KHDR_INCLUDES in Makefile
In-Reply-To: <20240507214254.2787305-3-edliaw@google.com>
References: <20240507214254.2787305-1-edliaw@google.com>
 <20240507214254.2787305-3-edliaw@google.com>
Message-ID: <b36d9d60-1ef5-4f61-be40-127b46a138eb@collabora.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 5/8/24 2:38 AM, Edward Liaw wrote:
> Add KHDR_INCLUDES to the CFLAGS to pull in the kselftest harness
> dependencies (-D_GNU_SOURCE).
> 
> Also, remove redefinitions of _GNU_SOURCE in the source code.
> 
> Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202404301040.3bea5782-oliver.sang at intel.com
> Signed-off-by: Edward Liaw <edliaw@google.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

> ---
>  tools/testing/selftests/sgx/Makefile    | 2 +-
>  tools/testing/selftests/sgx/sigstruct.c | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/sgx/Makefile b/tools/testing/selftests/sgx/Makefile
> index 867f88ce2570..26ea30fae23c 100644
> --- a/tools/testing/selftests/sgx/Makefile
> +++ b/tools/testing/selftests/sgx/Makefile
> @@ -12,7 +12,7 @@ OBJCOPY := $(CROSS_COMPILE)objcopy
>  endif
>  
>  INCLUDES := -I$(top_srcdir)/tools/include
> -HOST_CFLAGS := -Wall -Werror -g $(INCLUDES) -fPIC
> +HOST_CFLAGS := -Wall -Werror $(KHDR_INCLUDES) -g $(INCLUDES) -fPIC
>  HOST_LDFLAGS := -z noexecstack -lcrypto
>  ENCL_CFLAGS += -Wall -Werror -static-pie -nostdlib -ffreestanding -fPIE \
>  	       -fno-stack-protector -mrdrnd $(INCLUDES)
> diff --git a/tools/testing/selftests/sgx/sigstruct.c b/tools/testing/selftests/sgx/sigstruct.c
> index d73b29becf5b..200034a0fee5 100644
> --- a/tools/testing/selftests/sgx/sigstruct.c
> +++ b/tools/testing/selftests/sgx/sigstruct.c
> @@ -1,7 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*  Copyright(c) 2016-20 Intel Corporation. */
>  
> -#define _GNU_SOURCE
>  #include <assert.h>
>  #include <getopt.h>
>  #include <stdbool.h>

-- 
BR,
Muhammad Usama Anjum

