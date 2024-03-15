From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 15 Mar 2024 14:32:45 +0100
Subject: [kvm-unit-tests PATCH 0/2] riscv: sbi: Check spec version and test rest
Message-ID: <20240315133244.579425-4-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The base extension tests require spec version 0.2 or later, so check for
that, and also add the remaining function tests.

This is based on Carlos' series [1]

[1] http://lists.infradead.org/pipermail/kvm-riscv/2024-March/006047.html

Andrew Jones (2):
  riscv: sbi: Check and test spec version
  riscv: sbi: Test remaining base functions

 riscv/sbi.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

-- 
2.44.0


