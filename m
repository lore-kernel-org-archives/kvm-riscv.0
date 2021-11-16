From: Vitaly Kuznetsov <vkuznets@redhat.com>
Date: Tue, 16 Nov 2021 17:34:37 +0100
Subject: [PATCH v2 0/6] KVM: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS and
 re-purpose it on x86
Message-ID: <20211116163443.88707-1-vkuznets@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Changes since v1:
- PATCH6 for s390 added.
- On ARM64, do not make KVM_CAP_NR_VCPUS return value dependent on whether
  it is a system-wide ioctl or a per-VM one [Marc Zyngier].

Original description:

This is a continuation of "KVM: x86: Drop arbitraty KVM_SOFT_MAX_VCPUS"
(https://lore.kernel.org/kvm/20211111134733.86601-1-vkuznets at redhat.com/)
work.

1) Enforce KVM_CAP_NR_VCPUS <= KVM_CAP_MAX_VCPUS rule on all 
 architectures. [Sean Christopherson]
2) Make KVM_CAP_NR_VCPUS return num_online_cpus() and not an arbitrary
 value of '710' on x86.

Everything but x86 was only 'eyeball tested', the change is trivial
but sorry in advance if I screwed up)

Vitaly Kuznetsov (6):
  KVM: arm64: Cap KVM_CAP_NR_VCPUS by kvm_arm_default_max_vcpus()
  KVM: MIPS: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS
  KVM: PPC: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS
  KVM: RISC-V: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS
  KVM: s390: Cap KVM_CAP_NR_VCPUS by num_online_cpus()
  KVM: x86: Drop arbitraty KVM_SOFT_MAX_VCPUS

 arch/arm64/kvm/arm.c            | 9 ++++++++-
 arch/mips/kvm/mips.c            | 2 +-
 arch/powerpc/kvm/powerpc.c      | 4 ++--
 arch/riscv/kvm/vm.c             | 2 +-
 arch/s390/kvm/kvm-s390.c        | 2 ++
 arch/x86/include/asm/kvm_host.h | 1 -
 arch/x86/kvm/x86.c              | 2 +-
 7 files changed, 15 insertions(+), 7 deletions(-)

-- 
2.33.1


