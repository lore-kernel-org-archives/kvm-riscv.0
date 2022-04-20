From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 19 Apr 2022 18:32:56 -0700
Subject: [PATCH 0/2] Miscellenous ISA string fixup
Message-ID: <20220420013258.3639264-1-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series fixes few issues around ISA string generations for guests.
Earlier these patches were part of the sstc series[1] but I created
a separate series for these fixes as they can be applied separately
as a part of rc fixes.

[1] https://lore.kernel.org/lkml/20220304201020.810380-1-atishp at rivosinc.com/

Atish Patra (2):
RISC-V: KVM: Remove 's' & 'u' as valid ISA extension
RISC-V: KVM: Restrict the extensions that can be disabled

arch/riscv/kvm/vcpu.c | 23 +++++++++++++----------
1 file changed, 13 insertions(+), 10 deletions(-)

--
2.25.1


