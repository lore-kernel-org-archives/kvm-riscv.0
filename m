From: cem@kernel.org <cem@kernel.org>
Date: Wed, 13 Mar 2024 15:53:23 +0100
Subject: [PATCH V3 0/6] Add riscv tests to cover the base extension specs
Message-ID: <20240313145336.311611-1-cem@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Carlos Maiolino <cem@kernel.org>

Hi,

This is a new version of this series to create tests to cover functions
of the riscv's SBI base implementation spec. The series also includes a
a few helpers to reduce code duplication.

This new version includes updates related to Drew reviews, and extra
massage on the patches due to moving the __base_sbi_ecall() wrapper to
the beginninng of the series.
Detailed updates are specified on a patch-basis

Carlos Maiolino (6):
  riscv: Add a wrapper to call sbi_ecall for base extension
  riscv: Add test to probe SBI Extension
  riscv: Factor out environment variable check and report generation
  riscv: Implement test for architecture ID register
  riscv: Enable gen_report() to print the wrong value in case of failure
  riscv: Test for specific SBI implementation ID

 riscv/sbi.c | 82 +++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 70 insertions(+), 12 deletions(-)

-- 
2.44.0


