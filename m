From: Will Deacon <will@kernel.org>
Date: Thu, 22 Sep 2022 13:45:38 +0100
Subject: [PATCH kvmtool 0/5] KVMTOOL RISC-V Svpbmt and Sstc Support
In-Reply-To: <20220815101325.477694-1-apatel@ventanamicro.com>
References: <20220815101325.477694-1-apatel@ventanamicro.com>
Message-ID: <166384971661.148293.7516865524083963807.b4-ty@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 15 Aug 2022 15:43:20 +0530, Anup Patel wrote:
> The latest Linux-6.0-rc1 has support for Svpbmt and Sstc extensions
> in KVM RISC-V. This series adds corresponding changes in KVMTOOL to
> allow Guest/VM use these new RISC-V extensions.
> 
> The PATCH5 is an unrelated fix which was discovered while developing
> this series.
> 
> [...]

Applied to kvmtool (master), thanks!

[1/5] Update UAPI headers based on Linux-6.0-rc1
      https://git.kernel.org/will/kvmtool/c/8d0facec06ae
[2/5] riscv: Append ISA extensions to the device tree
      https://git.kernel.org/will/kvmtool/c/8aff29e1dafe
[3/5] riscv: Add Svpbmt extension support
      https://git.kernel.org/will/kvmtool/c/2b4fe0f8cff1
[4/5] riscv: Add Sstc extension support
      https://git.kernel.org/will/kvmtool/c/3c07aeaf993a
[5/5] riscv: Fix serial0 alias path
      https://git.kernel.org/will/kvmtool/c/ed805be52f57

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

