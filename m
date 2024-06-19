From: Clément Léger <cleger@rivosinc.com>
Date: Wed, 19 Jun 2024 17:39:07 +0200
Subject: [PATCH 0/5] riscv: add support for Zaamo and Zalrsc extensions
Message-ID: <20240619153913.867263-1-cleger@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since commit e87412e621f1 ("integrate Zaamo and Zalrsc text (#1304)"),
the A extension has been described as a set of instructions provided by
Zaamo and Zalrsc. Add these two extensions.

This series is based on the Zc one [1].

Link: https://lore.kernel.org/linux-riscv/20240619113529.676940-1-cleger at rivosinc.com/

---

Cl?ment L?ger (5):
  dt-bindings: riscv: add Zaamo and Zalrsc ISA extension description
  riscv: add parsing for Zaamo and Zalrsc extensions
  riscv: hwprobe: export Zaamo and Zalrsc extensions
  RISC-V: KVM: Allow Zaamo/Zalrsc extensions for Guest/VM
  KVM: riscv: selftests: Add Zaamo/Zalrsc extensions to get-reg-list
    test

 Documentation/arch/riscv/hwprobe.rst          |  8 ++++++++
 .../devicetree/bindings/riscv/extensions.yaml | 19 +++++++++++++++++++
 arch/riscv/include/asm/hwcap.h                |  2 ++
 arch/riscv/include/uapi/asm/hwprobe.h         |  2 ++
 arch/riscv/include/uapi/asm/kvm.h             |  2 ++
 arch/riscv/kernel/cpufeature.c                |  9 ++++++++-
 arch/riscv/kernel/sys_hwprobe.c               |  2 ++
 arch/riscv/kvm/vcpu_onereg.c                  |  4 ++++
 .../selftests/kvm/riscv/get-reg-list.c        |  8 ++++++++
 9 files changed, 55 insertions(+), 1 deletion(-)

-- 
2.45.2


