From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Wed, 17 Apr 2024 15:45:24 +0800
Subject: [PATCH v2 0/2] RISCV: KVM: Avoid lock inversion in SBI_EXT_HSM_HART_START
Message-ID: <20240417074528.16506-1-yongxuan.wang@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Documentation/virt/kvm/locking.rst advises that kvm->lock should be
acquired outside vcpu->mutex and kvm->srcu. However, when KVM/RISC-V
handling SBI_EXT_HSM_HART_START, the lock ordering is vcpu->mutex,
kvm->srcu then kvm->lock.

The use of kvm->lock over there ensures that only one VCPU can update
the reset context and call SBI_EXT_HSM_HART_START for the target VCPU
simultaneously. This patchset divides it into 2 separate spinlock, and
replace vcpu->power_off with vcpu->mp_state.

---
v2:
- rename the hsm_start_lock to mp_state_lock
- replace vcpu->power_off with vcpu->mp_state in PATCH1
- add vcpu->reset_cntx_lock in PATCH2

Yong-Xuan Wang (2):
  RISCV: KVM: Introduce mp_state_lock to avoid lock inversion in
    SBI_EXT_HSM_HART_START
  RISCV: KVM: Introduce vcpu->reset_cntx_lock

 arch/riscv/include/asm/kvm_host.h |  8 +++-
 arch/riscv/kvm/vcpu.c             | 62 ++++++++++++++++++++++++-------
 arch/riscv/kvm/vcpu_sbi.c         |  7 +++-
 arch/riscv/kvm/vcpu_sbi_hsm.c     | 26 +++++++++----
 4 files changed, 78 insertions(+), 25 deletions(-)

-- 
2.17.1


