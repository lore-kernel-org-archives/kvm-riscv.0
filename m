From: Conor Dooley <mail@conchuod.ie>
Date: Sun, 14 Aug 2022 15:12:34 +0100
Subject: [PATCH 0/4] misc warning cleanup in arch/risc-v
Message-ID: <20220814141237.493457-1-mail@conchuod.ie>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Conor Dooley <conor.dooley@microchip.com>

Hey all,
Couple fixes here for most of what's left of the {sparse,} warnings in
arch/riscv that are still in need of patches. Ben has sent patches
for the VDSO issue already (although they seem to need rework).

VDSO aside, With this patchset applied, we are left with:
- cpuinfo_ops missing prototype: this likely needs to go into an
  asm-generic header & I'll send a separate patch for that.
- Complaints about an error in mm/init.c:
  "error inarch/riscv/mm/init.c:819:2: error: "setup_vm() is <trunc>
  I think this can be ignored.
- 600+ -Woverride-init warnings for syscall table setup where
  overriding seems to be the whole point of the macro.
- Warnings about imported kvm core code.
- Flexible array member warnings that look like common KVM code
  patterns
- An unexpected unlock in kvm_riscv_check_vcpu_requests that was added
  intentionally:
  https://lore.kernel.org/all/20220710151105.687193-1-apatel at ventanamicro.com/
  Is it worth looking into whether that's a false positive or not?

Thanks,
Conor.

Conor Dooley (4):
  riscv: kvm: vcpu_timer: fix unused variable warnings
  riscv: kvm: move extern sbi_ext declarations to a header
  riscv: signal: fix missing prototype warning
  riscv: traps: add missing prototype

 arch/riscv/include/asm/kvm_vcpu_sbi.h | 12 ++++++++++++
 arch/riscv/include/asm/signal.h       | 12 ++++++++++++
 arch/riscv/include/asm/thread_info.h  |  2 ++
 arch/riscv/kernel/signal.c            |  1 +
 arch/riscv/kernel/traps.c             |  3 ++-
 arch/riscv/kvm/vcpu_sbi.c             | 12 +-----------
 arch/riscv/kvm/vcpu_timer.c           |  4 ----
 7 files changed, 30 insertions(+), 16 deletions(-)
 create mode 100644 arch/riscv/include/asm/signal.h

-- 
2.37.1


