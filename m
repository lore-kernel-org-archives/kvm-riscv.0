From: cem@kernel.org <cem@kernel.org>
Date: Wed, 13 Mar 2024 09:46:18 +0100
Subject: [PATCH V2 0/6] Add riscv tests to cover the base extension specs
Message-ID: <20240313084644.277426-1-cem@kernel.org>
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
Detailed updates are specified on a patch-basis

Carlos Maiolino (6):
  riscv: Add test to probe SBI Extension
  riscv: Factor out environment variable check and report generation
  riscv: Implement test for architecture ID register
  riscv: Enable gen_report() to print the wrong value in case of failure
  riscv: Test for specific SBI implementation ID
  riscv: Add a wrapper to call sbi_ecall for base extension

 riscv/sbi.c | 79 +++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 67 insertions(+), 12 deletions(-)

-- 
2.44.0


