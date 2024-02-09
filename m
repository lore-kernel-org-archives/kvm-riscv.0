From: Thomas Huth <thuth@redhat.com>
Date: Fri, 9 Feb 2024 09:32:23 +0100
Subject: [kvm-unit-tests PATCH v3 8/8] migration: add a migration selftest
In-Reply-To: <20240209070141.421569-9-npiggin@gmail.com>
References: <20240209070141.421569-1-npiggin@gmail.com>
 <20240209070141.421569-9-npiggin@gmail.com>
Message-ID: <32a940e0-2b6d-489d-b987-41d640d04dd0@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 09/02/2024 08.01, Nicholas Piggin wrote:
> Add a selftest for migration support in  guest library and test harness
> code. It performs migrations a tight loop to irritate races and bugs in

"*in* a tight loop" ?

> the test harness code.
> 
> Include the test in arm, s390, powerpc.
> 
> Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com> (s390x)
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> This has flushed out several bugs in developing the multi migration test
> harness code already.
> 
> Thanks,
> Nick
> 
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
> index fe601cbb..1ffd9a82 100644
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
> +
> +arch = arm64

Please swap the last two lines!

>   # Test PCI emulation
>   [pci-test]
>   file = pci-test.flat

With the nits fixed:
Reviewed-by: Thomas Huth <thuth@redhat.com>


