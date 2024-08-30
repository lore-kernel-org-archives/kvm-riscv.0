From: Will Deacon <will@kernel.org>
Date: Fri, 30 Aug 2024 17:12:08 +0100
Subject: [kvmtool PATCH v3 0/4] Add RISC-V ISA extensions based on Linux-6.10
In-Reply-To: <20240821142610.3297483-1-apatel@ventanamicro.com>
References: <20240821142610.3297483-1-apatel@ventanamicro.com>
Message-ID: <172501224711.999016.8569782963205598241.b4-ty@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 21 Aug 2024 19:56:06 +0530, Anup Patel wrote:
> This series adds support for new ISA extensions based on Linux-6.10 namely:
> Sscofpmf.
> 
> These patches can also be found in the riscv_more_exts_round3_v3 branch
> at: https://github.com/avpatel/kvmtool.git
> 
> Changes since v2:
>  - Include a fix to correct number of hart bits for AIA
> 
> [...]

Applied to kvmtool (master), thanks!

[1/4] Sync-up headers with Linux-6.10 kernel
      https://git.kernel.org/will/kvmtool/c/01171537bcc0
[2/4] riscv: Add Sscofpmf extensiona support
      https://git.kernel.org/will/kvmtool/c/fa958fb68cfb
[3/4] riscv: Set SBI_SUCCESS on successful DBCN call
      https://git.kernel.org/will/kvmtool/c/027784f4c67e
[4/4] riscv: Correct number of hart bits
      https://git.kernel.org/will/kvmtool/c/100fade1ac13

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

