From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 17 Aug 2023 18:23:44 +0200
Subject: [PATCH 0/2] RISC-V: KVM: A couple kselftests improvements
Message-ID: <20230817162344.17076-4-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add the riscv kselftests test dir to MAINTAINERS and improve the
maintainability of the arrays in the get-reg-list test.

These tests are based on kvm-riscv/riscv_kvm_queue.

Andrew Jones (2):
  MAINTAINERS: RISC-V: KVM: Add another kselftests path
  KVM: selftests: Add array order helpers to riscv get-reg-list

 MAINTAINERS                                   |  1 +
 .../selftests/kvm/riscv/get-reg-list.c        | 76 ++++++++++---------
 2 files changed, 42 insertions(+), 35 deletions(-)

-- 
2.41.0


