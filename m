From: Will Deacon <will@kernel.org>
Date: Wed, 23 Oct 2024 17:21:20 +0100
Subject: [kvmtool PATCH v2 0/8] Add RISC-V ISA extensions based on Linux-6.11
In-Reply-To: <20241005080024.11927-1-apatel@ventanamicro.com>
References: <20241005080024.11927-1-apatel@ventanamicro.com>
Message-ID: <172969896377.3484512.14673006863985843861.b4-ty@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 05 Oct 2024 13:30:16 +0530, Anup Patel wrote:
> This series adds support for new ISA extensions based on Linux-6.11
> namely: Zawrs, Zca, Zcb, Zcd, Zcf, Zcmop, and Zimop.
> 
> These patches can also be found in the riscv_more_exts_round4_v2 branch
> at: https://github.com/avpatel/kvmtool.git
> 
> Changes since v1:
> - Updated PATCH1 to sync-up header with released Linux-6.11 kernel
> 
> [...]

Applied to kvmtool (master), thanks!

[1/8] Sync-up headers with Linux-6.11 kernel
      https://git.kernel.org/will/kvmtool/c/b862ed4bbe34
[2/8] riscv: Add Zawrs extension support
      https://git.kernel.org/will/kvmtool/c/c7a4bd93833f
[3/8] riscv: Add Zca extension support
      https://git.kernel.org/will/kvmtool/c/4b8b352b0c25
[4/8] riscv: Add Zcb extension support
      https://git.kernel.org/will/kvmtool/c/78bafd5691be
[5/8] riscv: Add Zcd extension support
      https://git.kernel.org/will/kvmtool/c/80d2e0cd1496
[6/8] riscv: Add Zcf extension support
      https://git.kernel.org/will/kvmtool/c/9f50870b2701
[7/8] riscv: Add Zcmop extension support
      https://git.kernel.org/will/kvmtool/c/1f0e5ba9e458
[8/8] riscv: Add Zimop extension support
      https://git.kernel.org/will/kvmtool/c/3040b298156e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

