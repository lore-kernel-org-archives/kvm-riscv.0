From: Clément Léger <cleger@rivosinc.com>
Date: Thu, 18 Apr 2024 14:42:23 +0200
Subject: [PATCH v2 00/12] Add support for a few Zc* extensions as well as Zcmop
Message-ID: <20240418124300.1387978-1-cleger@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add support for (yet again) more RVA23U64 missing extensions. Add
support for Zcmop, Zca, Zcf, Zcd and Zcb extensions isa string parsing,
hwprobe and kvm support. Zce, Zcmt and Zcmp extensions have been left
out since they target microcontrollers/embedded CPUs and are not needed
by RVA23U64

This series is based on the Zimop one [1].

Link: https://lore.kernel.org/linux-riscv/20240404103254.1752834-1-cleger at rivosinc.com/ [1]

---
v2:
 - Add Zc* dependencies validation in dt-bindings
 - v1: https://lore.kernel.org/lkml/20240410091106.749233-1-cleger at rivosinc.com/

Cl?ment L?ger (12):
  dt-bindings: riscv: add Zca, Zcf, Zcd and Zcb ISA extension
    description
  riscv: dts: enable Zc* extensions when needed
  dt-bindings: riscv: add Zc* extension rules implied by C extension
  riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
  riscv: hwprobe: export Zca, Zcf, Zcd and Zcb ISA extensions
  RISC-V: KVM: Allow Zca, Zcf, Zcd and Zcb extensions for Guest/VM
  KVM: riscv: selftests: Add some Zc* extensions to get-reg-list test
  dt-bindings: riscv: add Zcmop ISA extension description
  riscv: add ISA extension parsing for Zcmop
  riscv: hwprobe: export Zcmop ISA extension
  RISC-V: KVM: Allow Zcmop extension for Guest/VM
  KVM: riscv: selftests: Add Zcmop extension to get-reg-list test

 Documentation/arch/riscv/hwprobe.rst          |  24 ++
 .../devicetree/bindings/riscv/cpus.yaml       |   8 +-
 .../devicetree/bindings/riscv/extensions.yaml | 124 +++++++++
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi |   4 +-
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |  20 +-
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi   |   4 +-
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi    |  20 +-
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi    |  20 +-
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi        |   4 +-
 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi   | 256 +++++++++---------
 arch/riscv/boot/dts/starfive/jh7100.dtsi      |   8 +-
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  20 +-
 arch/riscv/boot/dts/thead/th1520.dtsi         |  16 +-
 arch/riscv/include/asm/hwcap.h                |   5 +
 arch/riscv/include/uapi/asm/hwprobe.h         |   5 +
 arch/riscv/include/uapi/asm/kvm.h             |   5 +
 arch/riscv/kernel/cpufeature.c                |   5 +
 arch/riscv/kernel/sys_hwprobe.c               |   5 +
 arch/riscv/kvm/vcpu_onereg.c                  |  10 +
 .../selftests/kvm/riscv/get-reg-list.c        |  20 ++
 20 files changed, 394 insertions(+), 189 deletions(-)

-- 
2.43.0


