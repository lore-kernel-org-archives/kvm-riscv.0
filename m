From: Vipin Sharma <vipinsh@google.com>
Date: Thu, 22 Aug 2024 13:55:54 -0700
Subject: [RFC PATCH 0/1] KVM selftests runner for running more than just default
In-Reply-To: <20240821223012.3757828-1-vipinsh@google.com>
References: <20240821223012.3757828-1-vipinsh@google.com>
Message-ID: <CAHVum0eSxCTAme8=oV9a=cVaJ9Jzu3-W-3vgbubVZ2qAWVjfJA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Oops! Adding archs mailing list and maintainers which have arch folder
in tool/testing/selftests/kvm

On Wed, Aug 21, 2024 at 3:30?PM Vipin Sharma <vipinsh@google.com> wrote:
>
> This series is introducing a KVM selftests runner to make it easier to
> run selftests with some interesting configurations and provide some
> enhancement over existing kselftests runner.
>
> I would like to get an early feedback from the community and see if this
> is something which can be useful for improving KVM selftests coverage
> and worthwhile investing time in it. Some specific questions:
>
> 1. Should this be done?
> 2. What features are must?
> 3. Any other way to write test configuration compared to what is done here?
>
> Note, python code written for runner is not optimized but shows how this
> runner can be useful.
>
> What are the goals?
> - Run tests with more than just the default settings of KVM module
>   parameters and test itself.
> - Capture issues which only show when certain combination of module
>   parameter and tests options are used.
> - Provide minimum testing which can be standardised for KVM patches.
> - Run tests parallely.
> - Dump output in a hierarchical folder structure for easier tracking of
>   failures/success output
> - Feel free to add yours :)
>
> Why not use/extend kselftests?
> - Other submodules goal might not align and its gonna be difficult to
>   capture broader set of requirements.
> - Instead of test configuration we will need separate shell scripts
>   which will act as tests for each test arg and module parameter
>   combination. This will easily pollute the KVM selftests directory.
> - Easier to enhance features using Python packages than shell scripts.
>
> What this runner do?
> - Reads a test configuration file (tests.json in patch 1).
>   Configuration in json are written in hierarchy where multiple suites
>   exist and each suite contains multiple tests.
> - Provides a way to execute tests inside a suite parallelly.
> - Provides a way to dump output to a folder in a hierarchical manner.
> - Allows to run selected suites, or tests in a specific suite.
> - Allows to do some setup and teardown for test suites and tests.
> - Timeout can be provided to limit test execution duration.
> - Allows to run test suites or tests on specific architecture only.
>
> Runner is written in python and goal is to only use standard library
> constructs. This runner will work on Python 3.6 and up
>
> What does a test configuration file looks like?
> Test configuration are written in json as it is easier to read and has
> inbuilt package support in Python. Root level is a json array denoting
> suites and each suite can multiple tests in it using json array.
>
> [
>   {
>     "suite": "dirty_log_perf_tests",
>     "timeout_s": 300,
>     "arch": "x86_64",
>     "setup": "echo Setting up suite",
>     "teardown": "echo tearing down suite",
>     "tests": [
>       {
>         "name": "dirty_log_perf_test_max_vcpu_no_manual_protect",
>         "command": "./dirty_log_perf_test -v $(grep -c ^processor /proc/cpuinfo) -g",
>         "arch": "x86_64",
>         "setup": "echo Setting up test",
>         "teardown": "echo tearing down test",
>         "timeout_s": 5
>       }
>     ]
>   }
> ]
>
> Usage:
> Runner "runner.py" and test configuration "tests.json" lives in
> tool/testing/selftests/kvm directory.
>
> To run serially:
> ./runner.py tests.json
>
> To run specific test suites:
> ./runner.py tests.json dirty_log_perf_tests x86_sanity_tests
>
> To run specific test in a suite:
> ./runner.py tests.json x86_sanity_tests/vmx_msrs_test
>
> To run everything parallely (runs tests inside a suite parallely):
> ./runner.py -j 10 tests.json
>
> To dump output to disk:
> ./runner.py -j 10 tests.json -o sample_run
>
> Sample output (after removing timestamp, process ID, and logging
> level columns):
>
>   ./runner.py tests.json  -j 10 -o sample_run
>   PASSED: dirty_log_perf_tests/dirty_log_perf_test_max_vcpu_no_manual_protect
>   PASSED: dirty_log_perf_tests/dirty_log_perf_test_max_vcpu_manual_protect
>   PASSED: dirty_log_perf_tests/dirty_log_perf_test_max_vcpu_manual_protect_random_access
>   PASSED: dirty_log_perf_tests/dirty_log_perf_test_max_10_vcpu_hugetlb
>   PASSED: x86_sanity_tests/vmx_msrs_test
>   SKIPPED: x86_sanity_tests/private_mem_conversions_test
>   FAILED: x86_sanity_tests/apic_bus_clock_test
>   PASSED: x86_sanity_tests/dirty_log_page_splitting_test
>   --------------------------------------------------------------------------
>   Test runner result:
>   1) dirty_log_perf_tests:
>      1) PASSED: dirty_log_perf_test_max_vcpu_no_manual_protect
>      2) PASSED: dirty_log_perf_test_max_vcpu_manual_protect
>      3) PASSED: dirty_log_perf_test_max_vcpu_manual_protect_random_access
>      4) PASSED: dirty_log_perf_test_max_10_vcpu_hugetlb
>   2) x86_sanity_tests:
>      1) PASSED: vmx_msrs_test
>      2) SKIPPED: private_mem_conversions_test
>      3) FAILED: apic_bus_clock_test
>      4) PASSED: dirty_log_page_splitting_test
>   --------------------------------------------------------------------------
>
> Directory structure created:
>
> sample_run/
> |-- dirty_log_perf_tests
> |   |-- dirty_log_perf_test_max_10_vcpu_hugetlb
> |   |   |-- command.stderr
> |   |   |-- command.stdout
> |   |   |-- setup.stderr
> |   |   |-- setup.stdout
> |   |   |-- teardown.stderr
> |   |   `-- teardown.stdout
> |   |-- dirty_log_perf_test_max_vcpu_manual_protect
> |   |   |-- command.stderr
> |   |   `-- command.stdout
> |   |-- dirty_log_perf_test_max_vcpu_manual_protect_random_access
> |   |   |-- command.stderr
> |   |   `-- command.stdout
> |   `-- dirty_log_perf_test_max_vcpu_no_manual_protect
> |       |-- command.stderr
> |       `-- command.stdout
> `-- x86_sanity_tests
>     |-- apic_bus_clock_test
>     |   |-- command.stderr
>     |   `-- command.stdout
>     |-- dirty_log_page_splitting_test
>     |   |-- command.stderr
>     |   |-- command.stdout
>     |   |-- setup.stderr
>     |   |-- setup.stdout
>     |   |-- teardown.stderr
>     |   `-- teardown.stdout
>     |-- private_mem_conversions_test
>     |   |-- command.stderr
>     |   `-- command.stdout
>     `-- vmx_msrs_test
>         |-- command.stderr
>         `-- command.stdout
>
>
> Some other features for future:
> - Provide "precheck" command option in json, which can filter/skip tests if
>   certain conditions are not met.
> - Iteration option in the runner. This will allow the same test suites to
>   run again.
>
> Vipin Sharma (1):
>   KVM: selftestsi: Create KVM selftests runnner to run interesting tests
>
>  tools/testing/selftests/kvm/runner.py  | 282 +++++++++++++++++++++++++
>  tools/testing/selftests/kvm/tests.json |  60 ++++++
>  2 files changed, 342 insertions(+)
>  create mode 100755 tools/testing/selftests/kvm/runner.py
>  create mode 100644 tools/testing/selftests/kvm/tests.json
>
>
> base-commit: de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed
> --
> 2.46.0.184.g6999bdac58-goog
>

