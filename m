From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed,  6 Nov 2024 12:38:15 +0100
Subject: [kvm-unit-tests PATCH v2 0/3] riscv: sbi: Add IPI tests
Message-ID: <20241106113814.42992-5-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Repost Cade's IPI test patch[1] with all the changes pointed out in the
last review and more.

Based-on: https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv/sbi

[1] https://lore.kernel.org/all/20240826065106.20281-1-cade.richard at berkeley.edu/

v2:
 - Rebased on latest riscv/sbi
 - Improved ipi done checking by introducing cpumask_equal
 - Added a patch for another IPI test case


Andrew Jones (2):
  riscv: Add sbi_send_ipi_broadcast
  riscv: sbi: Add two in hart_mask IPI test

Cade Richard (1):
  riscv: sbi: Add IPI extension tests

 lib/cpumask.h       |  13 ++++
 lib/riscv/asm/sbi.h |   1 +
 lib/riscv/sbi.c     |   7 +-
 riscv/sbi.c         | 184 +++++++++++++++++++++++++++++++++++++++++++-
 riscv/unittests.cfg |   1 +
 5 files changed, 203 insertions(+), 3 deletions(-)

-- 
2.47.0


