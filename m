From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 Apr 2024 11:02:39 +0530
Subject: [PATCH v8 24/24] KVM: riscv: selftests: Add commandline option
 for SBI PMU test
In-Reply-To: <20240420151741.962500-25-atishp@rivosinc.com>
References: <20240420151741.962500-1-atishp@rivosinc.com> <20240420151741.962500-25-atishp@rivosinc.com>
Message-ID: <CAAhSdy0Bo1+SomNva+A_Phd=gu_+wcqXTV_-ioqCCVEr1cXJBA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Apr 20, 2024 at 5:18?AM Atish Patra <atishp@rivosinc.com> wrote:
>
> SBI PMU test comprises of multiple tests and user may want to run
> only a subset depending on the platform. The most common case would
> be to run all to validate all the tests. However, some platform may
> not support all events or all ISA extensions.
>
> The commandline option allows user to disable any set of tests if
> they want to.
>
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  .../selftests/kvm/riscv/sbi_pmu_test.c        | 73 ++++++++++++++++---
>  1 file changed, 64 insertions(+), 9 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> index 0fd9b76ae838..69bb94e6b227 100644
> --- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> @@ -33,6 +33,13 @@ static unsigned long counter_mask_available;
>
>  static bool illegal_handler_invoked;
>
> +#define SBI_PMU_TEST_BASIC     BIT(0)
> +#define SBI_PMU_TEST_EVENTS    BIT(1)
> +#define SBI_PMU_TEST_SNAPSHOT  BIT(2)
> +#define SBI_PMU_TEST_OVERFLOW  BIT(3)
> +
> +static int disabled_tests;
> +
>  unsigned long pmu_csr_read_num(int csr_num)
>  {
>  #define switchcase_csr_read(__csr_num, __val)          {\
> @@ -608,19 +615,67 @@ static void test_vm_events_overflow(void *guest_code)
>         test_vm_destroy(vm);
>  }
>
> -int main(void)
> +static void test_print_help(char *name)
> +{
> +       pr_info("Usage: %s [-h] [-d <test name>]\n", name);
> +       pr_info("\t-d: Test to disable. Available tests are 'basic', 'events', 'snapshot', 'overflow'\n");
> +       pr_info("\t-h: print this help screen\n");
> +}
> +
> +static bool parse_args(int argc, char *argv[])
> +{
> +       int opt;
> +
> +       while ((opt = getopt(argc, argv, "hd:")) != -1) {
> +               switch (opt) {
> +               case 'd':
> +                       if (!strncmp("basic", optarg, 5))
> +                               disabled_tests |= SBI_PMU_TEST_BASIC;
> +                       else if (!strncmp("events", optarg, 6))
> +                               disabled_tests |= SBI_PMU_TEST_EVENTS;
> +                       else if (!strncmp("snapshot", optarg, 8))
> +                               disabled_tests |= SBI_PMU_TEST_SNAPSHOT;
> +                       else if (!strncmp("overflow", optarg, 8))
> +                               disabled_tests |= SBI_PMU_TEST_OVERFLOW;
> +                       else
> +                               goto done;
> +                       break;
> +               case 'h':
> +               default:
> +                       goto done;
> +               }
> +       }
> +
> +       return true;
> +done:
> +       test_print_help(argv[0]);
> +       return false;
> +}
> +
> +int main(int argc, char *argv[])
>  {
> -       test_vm_basic_test(test_pmu_basic_sanity);
> -       pr_info("SBI PMU basic test : PASS\n");
> +       if (!parse_args(argc, argv))
> +               exit(KSFT_SKIP);
> +
> +       if (!(disabled_tests & SBI_PMU_TEST_BASIC)) {
> +               test_vm_basic_test(test_pmu_basic_sanity);
> +               pr_info("SBI PMU basic test : PASS\n");
> +       }
>
> -       test_vm_events_test(test_pmu_events);
> -       pr_info("SBI PMU event verification test : PASS\n");
> +       if (!(disabled_tests & SBI_PMU_TEST_EVENTS)) {
> +               test_vm_events_test(test_pmu_events);
> +               pr_info("SBI PMU event verification test : PASS\n");
> +       }
>
> -       test_vm_events_snapshot_test(test_pmu_events_snaphost);
> -       pr_info("SBI PMU event verification with snapshot test : PASS\n");
> +       if (!(disabled_tests & SBI_PMU_TEST_SNAPSHOT)) {
> +               test_vm_events_snapshot_test(test_pmu_events_snaphost);
> +               pr_info("SBI PMU event verification with snapshot test : PASS\n");
> +       }
>
> -       test_vm_events_overflow(test_pmu_events_overflow);
> -       pr_info("SBI PMU event verification with overflow test : PASS\n");
> +       if (!(disabled_tests & SBI_PMU_TEST_OVERFLOW)) {
> +               test_vm_events_overflow(test_pmu_events_overflow);
> +               pr_info("SBI PMU event verification with overflow test : PASS\n");
> +       }
>
>         return 0;
>  }
> --
> 2.34.1
>

