From: James Raphael Tiovalen <jamestiotio@gmail.com>
Date: Tue, 10 Sep 2024 23:08:40 +0800
Subject: [kvm-unit-tests PATCH 0/2] riscv: sbi: Clean up multiple report prefix popping
Message-ID: <20240910150842.156949-1-jamestiotio@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The first patch of this series adds a helper method to clear multiple
prefixes at once. The second patch then uses this new helper method to
tidy up the report prefix pops in the RISC-V SBI tests.

James Raphael Tiovalen (2):
  lib/report: Add helper method to clear multiple prefixes
  riscv: sbi: Tidy up report prefix pops

 lib/libcflat.h |  1 +
 lib/report.c   | 21 +++++++++++++++------
 riscv/sbi.c    | 17 +++++------------
 3 files changed, 21 insertions(+), 18 deletions(-)

--
2.43.0


