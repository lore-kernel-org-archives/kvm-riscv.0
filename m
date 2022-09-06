From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue,  6 Sep 2022 10:35:52 +0200
Subject: [PATCH 0/3] riscv: KVM: Expose Zicbom to the guest
Message-ID: <20220906083555.931806-1-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add support for exposing the Zicbom extension to guests. This has been
tested over a QEMU including the Zicbom support [1] ([1] was rebased and
the Zicboz support from it was dropped.) QEMU was further modified to
ensure the cache block size was provided in the DT. kvmtool was also
modified [2] to test the new KVM API and provide the guest the cache
block size in its DT (The kvmtool patches are based on Anup's Svpbmt/Sstc
series [3]). These KVM patches are based on the riscv_init_cbom_blocksize()
cleanup patch from Palmer and the move and expose riscv_cbom_block_size
patch from Anup which were reposted [4]. This series is also available
here [5].

[1] https://gitlab.com/jones-drew/qemu/-/commits/riscv/zicbom
[2] https://github.com/jones-drew/kvmtool/commits/riscv/zicbom
[3] https://github.com/avpatel/kvmtool/commits/riscv_svpbmt_sstc_v1
[4] https://lore.kernel.org/linux-riscv/20220906074509.928865-1-ajones at ventanamicro.com/T/#u
[5] https://github.com/jones-drew/linux/commits/riscv/kvm/zicbom

Thanks,
drew

Andrew Jones (3):
  RISC-V: Output cbom-block-size
  RISC-V: KVM: Provide UAPI for Zicbom block size
  RISC-V: KVM: Expose Zicbom to the guest

 arch/riscv/include/uapi/asm/kvm.h |  2 ++
 arch/riscv/kvm/vcpu.c             | 11 +++++++++++
 arch/riscv/mm/cacheflush.c        |  5 ++++-
 3 files changed, 17 insertions(+), 1 deletion(-)

-- 
2.37.2


