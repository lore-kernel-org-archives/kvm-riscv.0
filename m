From: John Hubbard <jhubbard@nvidia.com>
Date: Wed, 8 May 2024 14:41:21 -0700
Subject: [PATCH v2 3/5] selftests: Include KHDR_INCLUDES in Makefile
In-Reply-To: <20240507214254.2787305-4-edliaw@google.com>
References: <20240507214254.2787305-1-edliaw@google.com>
 <20240507214254.2787305-4-edliaw@google.com>
Message-ID: <ec8ab737-a841-4cd5-8ec1-e0a777744262@nvidia.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 5/7/24 2:38 PM, Edward Liaw wrote:
> Add KHDR_INCLUDES to CFLAGS to pull in the kselftest harness
> dependencies (-D_GNU_SOURCE).
> 
> Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
> Signed-off-by: Edward Liaw <edliaw@google.com>
> ---
>   tools/testing/selftests/alsa/Makefile                  | 2 +-
>   tools/testing/selftests/arm64/signal/Makefile          | 2 +-
>   tools/testing/selftests/exec/Makefile                  | 2 +-
>   tools/testing/selftests/filesystems/overlayfs/Makefile | 2 +-
>   tools/testing/selftests/hid/Makefile                   | 2 +-
>   tools/testing/selftests/nci/Makefile                   | 2 +-
>   tools/testing/selftests/prctl/Makefile                 | 2 ++
>   tools/testing/selftests/proc/Makefile                  | 2 +-
>   tools/testing/selftests/riscv/mm/Makefile              | 2 +-
>   tools/testing/selftests/rtc/Makefile                   | 2 +-
>   tools/testing/selftests/tmpfs/Makefile                 | 2 +-
>   11 files changed, 12 insertions(+), 10 deletions(-)

Hi Edward,

Seeing as how these all include lib.mk, and all use CFLAGS, is there
any reason not to simply fix this in lib.mk instead? Like this:

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 7fa4a96e26ed..df72610e0d2b 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -170,6 +170,8 @@ clean: $(if $(TEST_GEN_MODS_DIR),clean_mods_dir)
  CFLAGS += $(USERCFLAGS)
  LDFLAGS += $(USERLDFLAGS)
  
+CFLAGS += $(KHDR_INCLUDES)
+
  # When make O= with kselftest target from main level
  # the following aren't defined.
  #


thanks,
-- 
John Hubbard
NVIDIA

> 
> diff --git a/tools/testing/selftests/alsa/Makefile b/tools/testing/selftests/alsa/Makefile
> index 5af9ba8a4645..9a0ef194522c 100644
> --- a/tools/testing/selftests/alsa/Makefile
> +++ b/tools/testing/selftests/alsa/Makefile
> @@ -6,7 +6,7 @@ LDLIBS += $(shell pkg-config --libs alsa)
>   ifeq ($(LDLIBS),)
>   LDLIBS += -lasound
>   endif
> -CFLAGS += -L$(OUTPUT) -Wl,-rpath=./
> +CFLAGS += $(KHDR_INCLUDES) -L$(OUTPUT) -Wl,-rpath=./
>   
>   LDLIBS+=-lpthread
>   
> diff --git a/tools/testing/selftests/arm64/signal/Makefile b/tools/testing/selftests/arm64/signal/Makefile
> index 8f5febaf1a9a..ae682ade615d 100644
> --- a/tools/testing/selftests/arm64/signal/Makefile
> +++ b/tools/testing/selftests/arm64/signal/Makefile
> @@ -2,7 +2,7 @@
>   # Copyright (C) 2019 ARM Limited
>   
>   # Additional include paths needed by kselftest.h and local headers
> -CFLAGS += -D_GNU_SOURCE -std=gnu99 -I.
> +CFLAGS += $(KHDR_INCLUDES) -std=gnu99 -I.
>   
>   SRCS := $(filter-out testcases/testcases.c,$(wildcard testcases/*.c))
>   PROGS := $(patsubst %.c,%,$(SRCS))
> diff --git a/tools/testing/selftests/exec/Makefile b/tools/testing/selftests/exec/Makefile
> index fb4472ddffd8..15e78ec7c55e 100644
> --- a/tools/testing/selftests/exec/Makefile
> +++ b/tools/testing/selftests/exec/Makefile
> @@ -1,7 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0
>   CFLAGS = -Wall
>   CFLAGS += -Wno-nonnull
> -CFLAGS += -D_GNU_SOURCE
> +CFLAGS += $(KHDR_INCLUDES)
>   
>   TEST_PROGS := binfmt_script.py
>   TEST_GEN_PROGS := execveat load_address_4096 load_address_2097152 load_address_16777216 non-regular
> diff --git a/tools/testing/selftests/filesystems/overlayfs/Makefile b/tools/testing/selftests/filesystems/overlayfs/Makefile
> index 56b2b48a765b..6c29c963c7a8 100644
> --- a/tools/testing/selftests/filesystems/overlayfs/Makefile
> +++ b/tools/testing/selftests/filesystems/overlayfs/Makefile
> @@ -2,6 +2,6 @@
>   
>   TEST_GEN_PROGS := dev_in_maps
>   
> -CFLAGS := -Wall -Werror
> +CFLAGS := -Wall -Werror $(KHDR_INCLUDES)
>   
>   include ../../lib.mk
> diff --git a/tools/testing/selftests/hid/Makefile b/tools/testing/selftests/hid/Makefile
> index 2b5ea18bde38..0661b34488ef 100644
> --- a/tools/testing/selftests/hid/Makefile
> +++ b/tools/testing/selftests/hid/Makefile
> @@ -21,7 +21,7 @@ CXX ?= $(CROSS_COMPILE)g++
>   
>   HOSTPKG_CONFIG := pkg-config
>   
> -CFLAGS += -g -O0 -rdynamic -Wall -Werror -I$(OUTPUT)
> +CFLAGS += -g -O0 -rdynamic -Wall -Werror $(KHDR_INCLUDES) -I$(OUTPUT)
>   CFLAGS += -I$(OUTPUT)/tools/include
>   
>   LDLIBS += -lelf -lz -lrt -lpthread
> diff --git a/tools/testing/selftests/nci/Makefile b/tools/testing/selftests/nci/Makefile
> index 47669a1d6a59..bbc5b8ec3b17 100644
> --- a/tools/testing/selftests/nci/Makefile
> +++ b/tools/testing/selftests/nci/Makefile
> @@ -1,5 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0
> -CFLAGS += -Wl,-no-as-needed -Wall
> +CFLAGS += -Wl,-no-as-needed -Wall $(KHDR_INCLUDES)
>   LDFLAGS += -lpthread
>   
>   TEST_GEN_PROGS := nci_dev
> diff --git a/tools/testing/selftests/prctl/Makefile b/tools/testing/selftests/prctl/Makefile
> index 01dc90fbb509..1a0aefec9d6f 100644
> --- a/tools/testing/selftests/prctl/Makefile
> +++ b/tools/testing/selftests/prctl/Makefile
> @@ -6,6 +6,8 @@ ARCH ?= $(shell echo $(uname_M) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
>   ifeq ($(ARCH),x86)
>   TEST_PROGS := disable-tsc-ctxt-sw-stress-test disable-tsc-on-off-stress-test \
>   		disable-tsc-test set-anon-vma-name-test set-process-name
> +
> +CFLAGS += $(KHDR_INCLUDES)
>   all: $(TEST_PROGS)
>   
>   include ../lib.mk
> diff --git a/tools/testing/selftests/proc/Makefile b/tools/testing/selftests/proc/Makefile
> index cd95369254c0..9596014c10a0 100644
> --- a/tools/testing/selftests/proc/Makefile
> +++ b/tools/testing/selftests/proc/Makefile
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   CFLAGS += -Wall -O2 -Wno-unused-function
> -CFLAGS += -D_GNU_SOURCE
> +CFLAGS += $(KHDR_INCLUDES)
>   LDFLAGS += -pthread
>   
>   TEST_GEN_PROGS :=
> diff --git a/tools/testing/selftests/riscv/mm/Makefile b/tools/testing/selftests/riscv/mm/Makefile
> index c333263f2b27..715a21241113 100644
> --- a/tools/testing/selftests/riscv/mm/Makefile
> +++ b/tools/testing/selftests/riscv/mm/Makefile
> @@ -3,7 +3,7 @@
>   # Originally tools/testing/arm64/abi/Makefile
>   
>   # Additional include paths needed by kselftest.h and local headers
> -CFLAGS += -D_GNU_SOURCE -std=gnu99 -I.
> +CFLAGS += $(KHDR_INCLUDES) -std=gnu99 -I.
>   
>   TEST_GEN_FILES := mmap_default mmap_bottomup
>   
> diff --git a/tools/testing/selftests/rtc/Makefile b/tools/testing/selftests/rtc/Makefile
> index 55198ecc04db..654f9d58da3c 100644
> --- a/tools/testing/selftests/rtc/Makefile
> +++ b/tools/testing/selftests/rtc/Makefile
> @@ -1,5 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0
> -CFLAGS += -O3 -Wl,-no-as-needed -Wall
> +CFLAGS += -O3 -Wl,-no-as-needed -Wall $(KHDR_INCLUDES)
>   LDLIBS += -lrt -lpthread -lm
>   
>   TEST_GEN_PROGS = rtctest
> diff --git a/tools/testing/selftests/tmpfs/Makefile b/tools/testing/selftests/tmpfs/Makefile
> index aa11ccc92e5b..bcdc1bb6d2e6 100644
> --- a/tools/testing/selftests/tmpfs/Makefile
> +++ b/tools/testing/selftests/tmpfs/Makefile
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   CFLAGS += -Wall -O2
> -CFLAGS += -D_GNU_SOURCE
> +CFLAGS += $(KHDR_INCLUDES)
>   
>   TEST_GEN_PROGS :=
>   TEST_GEN_PROGS += bug-link-o-tmpfile



