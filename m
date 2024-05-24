From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Fri, 24 May 2024 18:33:00 +0800
Subject: [RFC PATCH v4 0/5] Add Svadu Extension Support
Message-ID: <20240524103307.2684-1-yongxuan.wang@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Svadu is a RISC-V extension for hardware updating of PTE A/D bits. This
patch set adds support to enable Svadu extension for both host and guest
OS.

For backward-compatibility, Svadu extension should be enabled through the
SBI FWFT extension. This patchset is based on the Linux implementation of
FWFT extension branch by Cl?ment L?ger [1], and can be verified with the
OpenSBI FWFT patchset [2].

[1] https://github.com/rivosinc/linux/commits/dev/cleger/fwft/
[2] https://lists.infradead.org/pipermail/opensbi/2024-May/006927.html

---
v4:
- fix 32bit kernel build error in PATCH1 (Conor)
- update the status of Svadu extension to ratified in PATCH2
- add the PATCH4 to suporrt SBI_FWFT_PTE_AD_HW_UPDATING for guest OS
- update the PATCH1 and PATCH3 to integrate with FWFT extension
- rebase PATCH5 on the lastest get-reg-list test (Andrew)

v3:
- fix the control bit name to ADUE in PATCH1 and PATCH3
- update get-reg-list in PATCH4

v2:
- add Co-developed-by: in PATCH1
- use riscv_has_extension_unlikely() to runtime patch the branch in PATCH1
- update dt-binding

Yong-Xuan Wang (5):
  RISC-V: Detect and Enable Svadu Extension Support
  dt-bindings: riscv: Add Svadu Entry
  RISC-V: KVM: Add Svadu Extension Support for Guest/VM
  RISC-V: KVM: add support for SBI_FWFT_PTE_AD_HW_UPDATING
  KVM: riscv: selftests: Add Svadu Extension to get-reg-list testt

 .../devicetree/bindings/riscv/extensions.yaml |  6 +++
 arch/riscv/Kconfig                            |  1 +
 arch/riscv/include/asm/csr.h                  |  1 +
 arch/riscv/include/asm/hwcap.h                |  1 +
 arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h    |  2 +-
 arch/riscv/include/asm/pgtable.h              |  8 +++-
 arch/riscv/include/uapi/asm/kvm.h             |  1 +
 arch/riscv/kernel/cpufeature.c                | 11 ++++++
 arch/riscv/kvm/vcpu_onereg.c                  |  1 +
 arch/riscv/kvm/vcpu_sbi_fwft.c                | 38 ++++++++++++++++++-
 .../selftests/kvm/riscv/get-reg-list.c        |  4 ++
 11 files changed, 71 insertions(+), 3 deletions(-)

-- 
2.17.1


