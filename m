From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 11 Sep 2024 13:33:39 +0200
Subject: [kvm-unit-tests PATCH 0/2] riscv: sbi: Improve DBCN and BASE
Message-ID: <20240911113338.156844-4-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Improve the tests for DBCN and BASE. For DBCN, use xfail when for failed
highmem tests when we know the SBI implementation doesn't support
highmem (such as 32-bit OpenSBI). For BASE, per the spec, ensure the bit
31 is zero and ensure we always treat bits 63:32 as UNKNOWN.


Andrew Jones (2):
  riscv: sbi: Highmem isn't always supported
  riscv: sbi: Improve spec version test

 lib/riscv/sbi.c |  2 +-
 riscv/sbi.c     | 38 ++++++++++++++++++++++++++------------
 2 files changed, 27 insertions(+), 13 deletions(-)

-- 
2.46.0


