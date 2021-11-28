From: Jisheng Zhang <jszhang@kernel.org>
Date: Mon, 29 Nov 2021 00:07:36 +0800
Subject: [PATCH 0/5] riscv: misc clean up
Message-ID: <20211128160741.2122-1-jszhang@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series is a misc clean up: clean up useless LoCs, or make some
functions static, or mark function pointer as __initdata, or remove
one function().

Jisheng Zhang (5):
  riscv: remove cpu_stop()
  riscv: head: make secondary_start_common() static
  riscv: kvm: make kvm_riscv_vcpu_fp_clean() static
  riscv: errata: alternative: mark vendor_patch_func __initdata
  riscv: head: remove useless __PAGE_ALIGNED_BSS and .balign

 arch/riscv/errata/alternative.c | 3 ++-
 arch/riscv/include/asm/smp.h    | 2 --
 arch/riscv/kernel/cpu-hotplug.c | 8 +-------
 arch/riscv/kernel/head.S        | 9 ++-------
 arch/riscv/kvm/vcpu_fp.c        | 2 +-
 5 files changed, 6 insertions(+), 18 deletions(-)

-- 
2.34.0


