From: Vitaly Kuznetsov <vkuznets@redhat.com>
Date: Thu, 11 Nov 2021 17:27:41 +0100
Subject: [PATCH 0/5] KVM: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS and
 re-purpose it on x86
Message-ID: <20211111162746.100598-1-vkuznets@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is a comtinuation of "KVM: x86: Drop arbitraty KVM_SOFT_MAX_VCPUS"
(https://lore.kernel.org/kvm/20211111134733.86601-1-vkuznets at redhat.com/)
work.

1) Enforce KVM_CAP_NR_VCPUS <= KVM_CAP_MAX_VCPUS rule on all 
 architectures. [Sean Christopherson]
2) Make KVM_CAP_NR_VCPUS return num_online_cpus() and not an arbitrary
 value of '710' on x86.

Everything but x86 was only 'eyeball tested', the change is trivial
but sorry in advance if I screwed up)

Vitaly Kuznetsov (5):
  KVM: arm64: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS
  KVM: MIPS: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS
  KVM: PPC: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS
  KVM: RISC-V: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS
  KVM: x86: Drop arbitraty KVM_SOFT_MAX_VCPUS

 arch/arm64/kvm/arm.c            | 7 ++++++-
 arch/mips/kvm/mips.c            | 2 +-
 arch/powerpc/kvm/powerpc.c      | 4 ++--
 arch/riscv/kvm/vm.c             | 2 +-
 arch/x86/include/asm/kvm_host.h | 1 -
 arch/x86/kvm/x86.c              | 2 +-
 6 files changed, 11 insertions(+), 7 deletions(-)

-- 
2.33.1


