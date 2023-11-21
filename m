From: Will Deacon <will@kernel.org>
Date: Tue, 21 Nov 2023 15:39:00 +0000
Subject: [kvmtool PATCH v3 0/6] RISC-V AIA irqchip and Svnapot support
In-Reply-To: <20231118132847.758785-1-apatel@ventanamicro.com>
References: <20231118132847.758785-1-apatel@ventanamicro.com>
Message-ID: <170058078885.653754.8772378567684754603.b4-ty@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 18 Nov 2023 18:58:41 +0530, Anup Patel wrote:
> The latest KVM in Linux-6.5 has support for:
> 1) Svnapot ISA extension support
> 2) AIA in-kernel irqchip support
> 
> This series adds corresponding changes in KVMTOOL to use the above
> mentioned features for Guest/VM.
> 
> [...]

Applied to kvmtool (master), thanks!

[1/6] Sync-up header with Linux-6.6 for KVM RISC-V
      https://git.kernel.org/will/kvmtool/c/26c85896bc3a
[2/6] riscv: Add Svnapot extension support
      https://git.kernel.org/will/kvmtool/c/56e2d678f578
[3/6] riscv: Make irqchip support pluggable
      https://git.kernel.org/will/kvmtool/c/0dff350174f8
[4/6] riscv: Add IRQFD support for in-kernel AIA irqchip
      https://git.kernel.org/will/kvmtool/c/17aab306ad14
[5/6] riscv: Use AIA in-kernel irqchip whenever KVM RISC-V supports
      https://git.kernel.org/will/kvmtool/c/328f0879eeae
[6/6] riscv: Fix guest/init linkage for multilib toolchain
      https://git.kernel.org/will/kvmtool/c/095773e707ae

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

