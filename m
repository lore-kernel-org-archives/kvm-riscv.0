From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 11 Nov 2024 16:10:14 +0100
Subject: [kvm-unit-tests PATCH v7 0/2] riscv: sbi: Add support to test
 HSM extension
In-Reply-To: <20241110171633.113515-1-jamestiotio@gmail.com>
References: <20241110171633.113515-1-jamestiotio@gmail.com>
Message-ID: <20241111-dc706a3f0c07d4c49ec77d0c@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 11, 2024 at 01:16:31AM +0800, James Raphael Tiovalen wrote:
> This patch series adds support for testing all 4 functions of the HSM
> extension as defined in the RISC-V SBI specification. The first patch
> in version 7 of this series fixes the entry point of the HSM tests,
> while the second patch adds the actual test for the HSM extension.
> 
> Based-on: https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv/sbi

I've gone ahead and fixed up the patches per my comments and HSM tests
are now merged!

Thanks,
drew

> 
> v7:
> - Addressed all of Andrew's comments.
> - Fixed the entry point of the HSM tests to follow the SUSP tests.
> 
> v6:
> - Rebased on top of the latest commit of the riscv/sbi branch.
> - Removed unnecessary cleanup code in the HSM tests after improvements
>   to the on-cpus API were made by Andrew.
> 
> v5:
> - Addressed all of Andrew's comments.
> - Added 2 new patches to clear on_cpu_info[cpu].func and to set the
>   cpu_started mask, which are used to perform cleanup after running the
>   HSM tests.
> - Added some new tests to validate suspension on RV64 with the high
>   bits set for suspend_type.
> - Picked up the hartid_to_cpu rewrite patch from Andrew's branch.
> - Moved the variables declared in riscv/sbi.c in patch 2 to group it
>   together with the other HSM test variables declared in patch 5.
> 
> v4:
> - Addressed all of Andrew's comments.
> - Included the 2 patches from Andrew's branch that refactored some
>   functions.
> - Added timers to all of the waiting activities in the HSM tests.
> 
> v3:
> - Addressed all of Andrew's comments.
> - Split the report_prefix_pop patch into its own series.
> - Added a new environment variable to specify the maximum number of
>   CPUs supported by the SBI implementation.
> 
> v2:
> - Addressed all of Andrew's comments.
> - Added a new patch to add helper routines to clear multiple prefixes.
> - Reworked the approach to test the HSM extension by using cpumask and
>   on-cpus.
> 
> James Raphael Tiovalen (2):
>   riscv: sbi: Fix entry point of HSM tests
>   riscv: sbi: Add tests for HSM extension
> 
>  riscv/sbi-tests.h |  13 +-
>  riscv/sbi-asm.S   |  33 +--
>  riscv/sbi.c       | 613 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 642 insertions(+), 17 deletions(-)
> 
> --
> 2.43.0
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

