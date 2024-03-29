From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 29 Mar 2024 17:26:16 +0800
Subject: [PATCH RFC 00/11] riscv: support Sdtrig extension
 hcontext/scontext CSRs
Message-ID: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

riscv-debug-spec [1] Chapter 5: Sdtrig extension introduces
trigger CSRs which can cause a breakpoint exception,
entry into Debug Mode, or a trace action without having to
execute a special instruction.

The focus in the following patches is on the two CSRs from
the Sdtrig extension: hcontext and scontext.

These two CSRs are optional according to the spec, apart from
the Smstateen extension [2], which has bit 57 to control the
accessbility of the hcontext/scontext CSRs.
We also introduce dt-binding in the CPU DTS for the existence of
the CSRs in situations where the Smstaten extension is not available.

The hcontext/scontext CSRs can help to raise triggers with the
textra32/textra64 CSRs set up correctly. (Chapter 5.7.17/ 5.7.18 [1])

Therefore, as part of Linux awareness debugging. 
We propose the scontext CSR be filled by the Linux PID,
And the hcontext CSR be filled with a self-maintained Guest OS ID.

The reason for using the self-maintained Guest OS ID instead of VMID is
that VMID might change over time, and the user setting up the trigger
might enter the previous value, invoking the wrong VM for debugging.

The tests have been done on QEMU with Sdtrig CSRs
(mcontext/hcontext/scontext implemented) [3] boot on virt machine
and also run the Guest OS as virt machine with KVM enabled,
the two hcontext/scontext CSRs can be written correctly.

This patch series is based on v6.9-rc1.

Link: https://github.com/riscv/riscv-debug-spec/releases/download/ar20231208/riscv-debug-stable.pdf [1]
Link: https://github.com/riscvarchive/riscv-state-enable/releases/download/v1.0.0/Smstateen.pdf [2]
Link: https://github.com/sifive/qemu/tree/dev/maxh/sdtrig_ISA [3]

Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
Max Hsu (7):
      dt-bindings: riscv: Add Sdtrig ISA extension
      dt-bindings: riscv: Add Sdtrig optional CSRs existence on DT
      riscv: Add ISA extension parsing for Sdtrig
      riscv: Add Sdtrig CSRs definition, Smstateen bit to access Sdtrig CSRs
      riscv: cpufeature: Add Sdtrig optional CSRs checks
      riscv: suspend: add Smstateen CSRs save/restore
      riscv: Add task switch support for scontext CSR

Yong-Xuan Wang (4):
      riscv: KVM: Add Sdtrig Extension Support for Guest/VM
      riscv: KVM: Add scontext to ONE_REG
      riscv: KVM: Add hcontext support
      KVM: riscv: selftests: Add Sdtrig Extension to get-reg-list test

 Documentation/devicetree/bindings/riscv/cpus.yaml  |  18 +++
 .../devicetree/bindings/riscv/extensions.yaml      |   7 +
 arch/riscv/include/asm/csr.h                       |   6 +
 arch/riscv/include/asm/hwcap.h                     |   1 +
 arch/riscv/include/asm/kvm_host.h                  |  14 ++
 arch/riscv/include/asm/kvm_vcpu_debug.h            |  24 +++
 arch/riscv/include/asm/suspend.h                   |   7 +
 arch/riscv/include/asm/switch_to.h                 |  15 ++
 arch/riscv/include/uapi/asm/kvm.h                  |   9 ++
 arch/riscv/kernel/cpufeature.c                     | 162 +++++++++++++++++++++
 arch/riscv/kernel/suspend.c                        |  25 ++++
 arch/riscv/kvm/Makefile                            |   1 +
 arch/riscv/kvm/main.c                              |   4 +
 arch/riscv/kvm/vcpu.c                              |   8 +
 arch/riscv/kvm/vcpu_debug.c                        | 107 ++++++++++++++
 arch/riscv/kvm/vcpu_onereg.c                       |  63 +++++++-
 arch/riscv/kvm/vm.c                                |   4 +
 tools/testing/selftests/kvm/riscv/get-reg-list.c   |  27 ++++
 18 files changed, 500 insertions(+), 2 deletions(-)
---
base-commit: 317c7bc0ef035d8ebfc3e55c5dde0566fd5fb171
change-id: 20240329-dev-maxh-lin-452-6-9-c6209e6db67f

Best regards,
-- 
Max Hsu <max.hsu@sifive.com>


