From: Muhammad Usama Anjum <usama.anjum@collabora.com>
Date: Wed, 8 May 2024 12:58:20 +0500
Subject: [PATCH v2 5/5] selftests: Drop duplicate -D_GNU_SOURCE
In-Reply-To: <20240507214254.2787305-6-edliaw@google.com>
References: <20240507214254.2787305-1-edliaw@google.com>
 <20240507214254.2787305-6-edliaw@google.com>
Message-ID: <e3f6bb2a-a9bd-43c2-9468-85242eab0390@collabora.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 5/8/24 2:38 AM, Edward Liaw wrote:
> -D_GNU_SOURCE can be de-duplicated here, as it is added by
> KHDR_INCLUDES.
> 
> Signed-off-by: Edward Liaw <edliaw@google.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

> ---
>  tools/testing/selftests/futex/functional/Makefile | 2 +-
>  tools/testing/selftests/iommu/Makefile            | 2 --
>  tools/testing/selftests/net/tcp_ao/Makefile       | 2 +-
>  tools/testing/selftests/resctrl/Makefile          | 2 +-
>  4 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/futex/functional/Makefile b/tools/testing/selftests/futex/functional/Makefile
> index a392d0917b4e..f79f9bac7918 100644
> --- a/tools/testing/selftests/futex/functional/Makefile
> +++ b/tools/testing/selftests/futex/functional/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  INCLUDES := -I../include -I../../ $(KHDR_INCLUDES)
> -CFLAGS := $(CFLAGS) -g -O2 -Wall -D_GNU_SOURCE -pthread $(INCLUDES) $(KHDR_INCLUDES)
> +CFLAGS := $(CFLAGS) -g -O2 -Wall -pthread $(INCLUDES) $(KHDR_INCLUDES)
>  LDLIBS := -lpthread -lrt
>  
>  LOCAL_HDRS := \
> diff --git a/tools/testing/selftests/iommu/Makefile b/tools/testing/selftests/iommu/Makefile
> index 32c5fdfd0eef..fd6477911f24 100644
> --- a/tools/testing/selftests/iommu/Makefile
> +++ b/tools/testing/selftests/iommu/Makefile
> @@ -2,8 +2,6 @@
>  CFLAGS += -Wall -O2 -Wno-unused-function
>  CFLAGS += $(KHDR_INCLUDES)
>  
> -CFLAGS += -D_GNU_SOURCE
> -
>  TEST_GEN_PROGS :=
>  TEST_GEN_PROGS += iommufd
>  TEST_GEN_PROGS += iommufd_fail_nth
> diff --git a/tools/testing/selftests/net/tcp_ao/Makefile b/tools/testing/selftests/net/tcp_ao/Makefile
> index 522d991e310e..c608b1ec02e6 100644
> --- a/tools/testing/selftests/net/tcp_ao/Makefile
> +++ b/tools/testing/selftests/net/tcp_ao/Makefile
> @@ -26,7 +26,7 @@ LIB	:= $(LIBDIR)/libaotst.a
>  LDLIBS	+= $(LIB) -pthread
>  LIBDEPS	:= lib/aolib.h Makefile
>  
> -CFLAGS	:= -Wall -O2 -g -D_GNU_SOURCE -fno-strict-aliasing
> +CFLAGS	:= -Wall -O2 -g -fno-strict-aliasing
>  CFLAGS	+= $(KHDR_INCLUDES)
>  CFLAGS	+= -iquote ./lib/ -I ../../../../include/
>  
> diff --git a/tools/testing/selftests/resctrl/Makefile b/tools/testing/selftests/resctrl/Makefile
> index 2deac2031de9..5073dbc96125 100644
> --- a/tools/testing/selftests/resctrl/Makefile
> +++ b/tools/testing/selftests/resctrl/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -CFLAGS = -g -Wall -O2 -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE
> +CFLAGS = -g -Wall -O2 -D_FORTIFY_SOURCE=2
>  CFLAGS += $(KHDR_INCLUDES)
>  
>  TEST_GEN_PROGS := resctrl_tests

-- 
BR,
Muhammad Usama Anjum

