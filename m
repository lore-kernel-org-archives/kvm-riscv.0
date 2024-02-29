From: cem@kernel.org <cem@kernel.org>
Date: Thu, 29 Feb 2024 13:42:06 +0100
Subject: [PATCH 0/6] Add riscv tests to cover the base extension specs 
Message-ID: <20240229124246.309304-1-cem@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Carlos Maiolino <cem@kernel.org>

Hi,

this is my first attempt to create tests to cover some functions of the riscv's
SBI base implementation spec. The series also includes a couple helpers to
reduce code duplication.

Carlos Maiolino (6):
  riscv: Add test to probe SBI Extension
  riscv: Factor out environment variable check
  riscv: Implement test for architecture ID register
  riscv: Enable gen_report() to print the wrong value in case of test
    failure
  riscv: Test for specific SBI implementation ID
  riscv: Test for a SBI implementation ID range

 riscv/sbi.c | 95 ++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 83 insertions(+), 12 deletions(-)

-- 
2.43.2


