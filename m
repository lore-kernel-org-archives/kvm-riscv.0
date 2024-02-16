From: Thomas Huth <thuth@redhat.com>
Date: Fri, 16 Feb 2024 15:05:12 +0100
Subject: [kvm-unit-tests PATCH v4 8/8] migration: add a migration selftest
In-Reply-To: <20240209091134.600228-9-npiggin@gmail.com>
References: <20240209091134.600228-1-npiggin@gmail.com>
 <20240209091134.600228-9-npiggin@gmail.com>
Message-ID: <77d8fd0d-e2a9-42f7-9a76-08868ab95cb9@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 09/02/2024 10.11, Nicholas Piggin wrote:
> Add a selftest for migration support in  guest library and test harness
> code. It performs migrations in a tight loop to irritate races and bugs
> in the test harness code.
> 
> Include the test in arm, s390, powerpc.
> 
> Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com> (s390x)
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arm/Makefile.common          |  1 +
>   arm/selftest-migration.c     |  1 +
>   arm/unittests.cfg            |  6 ++++++
>   common/selftest-migration.c  | 34 ++++++++++++++++++++++++++++++++++
>   powerpc/Makefile.common      |  1 +
>   powerpc/selftest-migration.c |  1 +
>   powerpc/unittests.cfg        |  4 ++++
>   s390x/Makefile               |  1 +
>   s390x/selftest-migration.c   |  1 +
>   s390x/unittests.cfg          |  4 ++++
>   10 files changed, 54 insertions(+)
>   create mode 120000 arm/selftest-migration.c
>   create mode 100644 common/selftest-migration.c
>   create mode 120000 powerpc/selftest-migration.c
>   create mode 120000 s390x/selftest-migration.c
> 
> diff --git a/arm/Makefile.common b/arm/Makefile.common
> index f828dbe0..f107c478 100644
> --- a/arm/Makefile.common
> +++ b/arm/Makefile.common
> @@ -5,6 +5,7 @@
>   #
>   
>   tests-common  = $(TEST_DIR)/selftest.$(exe)
> +tests-common += $(TEST_DIR)/selftest-migration.$(exe)
>   tests-common += $(TEST_DIR)/spinlock-test.$(exe)
>   tests-common += $(TEST_DIR)/pci-test.$(exe)
>   tests-common += $(TEST_DIR)/pmu.$(exe)
> diff --git a/arm/selftest-migration.c b/arm/selftest-migration.c
> new file mode 120000
> index 00000000..bd1eb266
> --- /dev/null
> +++ b/arm/selftest-migration.c
> @@ -0,0 +1 @@
> +../common/selftest-migration.c
> \ No newline at end of file
> diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> index fe601cbb..db0e4c9b 100644
> --- a/arm/unittests.cfg
> +++ b/arm/unittests.cfg
> @@ -55,6 +55,12 @@ smp = $MAX_SMP
>   extra_params = -append 'smp'
>   groups = selftest
>   
> +# Test migration
> +[selftest-migration]
> +file = selftest-migration.flat
> +groups = selftest migration
> +arch = arm64
> +
>   # Test PCI emulation
>   [pci-test]
>   file = pci-test.flat
> diff --git a/common/selftest-migration.c b/common/selftest-migration.c
> new file mode 100644
> index 00000000..f70c505f
> --- /dev/null
> +++ b/common/selftest-migration.c
> @@ -0,0 +1,34 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Machine independent migration tests
> + *
> + * This is just a very simple test that is intended to stress the migration
> + * support in the test harness. This could be expanded to test more guest
> + * library code, but architecture-specific tests should be used to test
> + * migration of tricky machine state.
> + */
> +#include <libcflat.h>
> +#include <migrate.h>
> +
> +#if defined(__arm__) || defined(__aarch64__)
> +/* arm can only call getchar 15 times */
> +#define NR_MIGRATIONS 15
> +#else
> +#define NR_MIGRATIONS 100
> +#endif

FYI, I just wrote a patch that will hopefully fix the limitation to 15 times 
on arm:

  https://lore.kernel.org/kvm/20240216140210.70280-1-thuth at redhat.com/T/#u

  Thomas


