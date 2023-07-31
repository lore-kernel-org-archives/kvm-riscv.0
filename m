From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Date: Mon, 31 Jul 2023 09:04:14 -0300
Subject: [PATCH 0/6] RISC-V: KVM: change get_reg/set_reg error codes
Message-ID: <20230731120420.91007-1-dbarboza@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

This work was motivated by the changes made in QEMU in commit df817297d7
("target/riscv: update multi-letter extension KVM properties") where it
was required to use EINVAL to try to assess whether a given extension is
available in the host.

It turns out that the RISC-V KVM module makes regular use of the EIVAL
error code in all kvm_get_one_reg() and kvm_set_one_reg() callbacks,
which is not ideal. For example, ENOENT is a better error code for the
case where a given register does not exist. While at it I decided to
take a look at other error codes from these callbacks, comparing them
with how other archs (ARM) handles the same error types, and changed
some of the EOPNOTSUPP instances to either ENOENT or EBUSY.

I am aware that changing error codes can be problematic to existing
userspaces. I took a look and no other major userspace (checked crosvm,
rust-vmm, QEMU, kvmtool), aside from QEMU now checking for EIVAL (and we
can't change that because of backwards compat for that particular case
we're covering), will be impacted by this kind of change since they're
all checking for "return < 0 then ..." instead of doing specific error
handling based on the error value. This means that we're still in good
time to make this kind of change while we're still in the initial steps
of the RISC-V KVM ecossystem support.

Patch 3 happens to also change the behavior of the set_reg() for
zicbom/zicboz block sizes. Instead of always erroring out we'll check if
userspace is writing the same value that the host uses. In this case,
allow the write to succeed (i.e. do nothing). This avoids the situation
in which userspace reads cbom_block_size, find out that it's set to X,
and then can't write the same value back to the register. It's a QOL
improvement to allow userspace to be lazier when reading/writing regs. A
similar change was also made in patch 4.

Patches are based on top of riscv_kvm_queue.

Daniel Henrique Barboza (6):
  RISC-V: KVM: return ENOENT in *_one_reg() when reg is unknown
  RISC-V: KVM: use ENOENT in *_one_reg() when extension is unavailable
  RISC-V: KVM: do not EOPNOTSUPP in set_one_reg() zicbo(m|z)
  RISC-V: KVM: do not EOPNOTSUPP in set KVM_REG_RISCV_TIMER_REG
  RISC-V: KVM: use EBUSY when !vcpu->arch.ran_atleast_once
  docs: kvm: riscv: document EBUSY in KVM_SET_ONE_REG

 Documentation/virt/kvm/api.rst |  2 ++
 arch/riscv/kvm/aia.c           |  4 +--
 arch/riscv/kvm/vcpu_fp.c       | 12 ++++----
 arch/riscv/kvm/vcpu_onereg.c   | 52 ++++++++++++++++++++--------------
 arch/riscv/kvm/vcpu_sbi.c      | 16 ++++++-----
 arch/riscv/kvm/vcpu_timer.c    | 11 +++----
 6 files changed, 55 insertions(+), 42 deletions(-)

-- 
2.41.0


