From: Andrew Jones <andrew.jones@linux.dev>
Date: Thu, 24 Oct 2024 14:28:40 +0200
Subject: [kvm-unit-tests PATCH 0/2] riscv: sbi: Add IPI tests
Message-ID: <20241024122839.71753-4-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Repost Cade's IPI test patch[1] with all the changes pointed out in the
last review and more.

Based-on: https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv/sbi

[1] https://lore.kernel.org/all/20240826065106.20281-1-cade.richard at berkeley.edu/

Andrew Jones (1):
  riscv: Add sbi_send_ipi_broadcast

Cade Richard (1):
  riscv: sbi: Add IPI extension tests

 lib/riscv/asm/sbi.h |   1 +
 lib/riscv/sbi.c     |   7 ++-
 riscv/sbi.c         | 149 +++++++++++++++++++++++++++++++++++++++++++-
 riscv/unittests.cfg |   1 +
 4 files changed, 155 insertions(+), 3 deletions(-)

-- 
2.47.0


