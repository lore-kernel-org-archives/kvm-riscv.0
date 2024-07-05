From: Will Deacon <will@kernel.org>
Date: Fri,  5 Jul 2024 11:54:16 +0100
Subject: [kvmtool PATCH 0/3] Add RISC-V ISA extensions based on Linux-6.9
In-Reply-To: <20240514054928.854419-1-apatel@ventanamicro.com>
References: <20240514054928.854419-1-apatel@ventanamicro.com>
Message-ID: <172017577880.496851.16044176986107595814.b4-ty@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 14 May 2024 11:19:25 +0530, Anup Patel wrote:
> This series adds support for new ISA extensions based on Linux-6.9 namely:
> Ztso and Zacas.
> 
> These patches can also be found in the riscv_more_exts_round2_v1 branch
> at: https://github.com/avpatel/kvmtool.git
> 
> Anup Patel (3):
>   Sync-up headers with Linux-6.9 kernel
>   riscv: Add Ztso extensiona support
>   riscv: Add Zacas extensiona support
> 
> [...]

Applied to kvmtool (master), thanks!

[1/3] Sync-up headers with Linux-6.9 kernel
      https://git.kernel.org/will/kvmtool/c/85aaadf64649
[2/3] riscv: Add Ztso extensiona support
      https://git.kernel.org/will/kvmtool/c/a20adc64b4ea
[3/3] riscv: Add Zacas extensiona support
      https://git.kernel.org/will/kvmtool/c/32f810364df0

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

