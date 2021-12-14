From: Will Deacon <will@kernel.org>
Date: Tue, 14 Dec 2021 15:18:10 +0000
Subject: [PATCH v11 kvmtool 0/8] KVMTOOL RISC-V Support
In-Reply-To: <20211119124515.89439-1-anup.patel@wdc.com>
References: <20211119124515.89439-1-anup.patel@wdc.com>
Message-ID: <163949433071.4049230.18094387124072062307.b4-ty@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 19 Nov 2021 18:15:07 +0530, Anup Patel wrote:
> This series adds RISC-V support for KVMTOOL and it is based on the
> Linux-5.16-rc1. The KVM RISC-V patches have been merged in the Linux
> kernel since 5.16-rc1.
> 
> The KVMTOOL RISC-V patches can be found in riscv_master branch at:
> https//github.com/kvm-riscv/kvmtool.git
> 
> [...]

Applied to kvmtool (master), thanks!

[1/8] update_headers: Sync-up ABI headers with Linux-5.16-rc1
      https://git.kernel.org/will/kvmtool/c/5968b5ff26bb
[2/8] riscv: Initial skeletal support
      https://git.kernel.org/will/kvmtool/c/2e99678314c2
[3/8] riscv: Implement Guest/VM arch functions
      https://git.kernel.org/will/kvmtool/c/867159a7963b
[4/8] riscv: Implement Guest/VM VCPU arch functions
      https://git.kernel.org/will/kvmtool/c/42bfe448c1c3
[5/8] riscv: Add PLIC device emulation
      https://git.kernel.org/will/kvmtool/c/762224e47cc2
[6/8] riscv: Generate FDT at runtime for Guest/VM
      https://git.kernel.org/will/kvmtool/c/7c9aac003925
[7/8] riscv: Handle SBI calls forwarded to user space
      https://git.kernel.org/will/kvmtool/c/721da166a698
[8/8] riscv: Generate PCI host DT node
      https://git.kernel.org/will/kvmtool/c/cdd7d8cc0109

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

