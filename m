From: James Raphael Tiovalen <jamestiotio@gmail.com>
Date: Sun, 27 Oct 2024 00:18:12 +0800
Subject: [kvm-unit-tests PATCH v6 0/1] riscv: sbi: Add support to test HSM extension
Message-ID: <20241026161813.17189-1-jamestiotio@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch series adds support for testing all 4 functions of the HSM
extension as defined in the RISC-V SBI specification. The only patch in
version 6 of this series adds the actual test for the HSM extension.
The changes are based on the riscv/sbi branch.

v6:
- Rebased on top of the latest commit of the riscv/sbi branch.
- Removed unnecessary cleanup code in the HSM tests after improvements
  to the on-cpus API were made by Andrew.

v5:
- Addressed all of Andrew's comments.
- Added 2 new patches to clear on_cpu_info[cpu].func and to set the
  cpu_started mask, which are used to perform cleanup after running the
  HSM tests.
- Added some new tests to validate suspension on RV64 with the high
  bits set for suspend_type.
- Picked up the hartid_to_cpu rewrite patch from Andrew's branch.
- Moved the variables declared in riscv/sbi.c in patch 2 to group it
  together with the other HSM test variables declared in patch 5.

v4:
- Addressed all of Andrew's comments.
- Included the 2 patches from Andrew's branch that refactored some
  functions.
- Added timers to all of the waiting activities in the HSM tests.

v3:
- Addressed all of Andrew's comments.
- Split the report_prefix_pop patch into its own series.
- Added a new environment variable to specify the maximum number of
  CPUs supported by the SBI implementation.

v2:
- Addressed all of Andrew's comments.
- Added a new patch to add helper routines to clear multiple prefixes.
- Reworked the approach to test the HSM extension by using cpumask and
  on-cpus.

James Raphael Tiovalen (1):
  riscv: sbi: Add tests for HSM extension

 riscv/sbi.c | 663 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 663 insertions(+)

--
2.43.0


