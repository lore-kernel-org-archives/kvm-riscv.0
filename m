From: Will Deacon <will@kernel.org>
Date: Tue,  9 Apr 2024 17:59:33 +0100
Subject: [kvmtool PATCH v2 00/10] More ISA extensions
In-Reply-To: <20240325153141.6816-1-apatel@ventanamicro.com>
References: <20240325153141.6816-1-apatel@ventanamicro.com>
Message-ID: <171267491912.3164891.14888329040291157885.b4-ty@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 25 Mar 2024 21:01:31 +0530, Anup Patel wrote:
> This series adds support more ISA extensions namely: Zbc, scalar crypto,
> vector crypto, Zfh[min], Zihintntl, Zvfh[min], and Zfa. The series also
> adds a command-line option to disable SBI STA extension for Guest/VM.
> 
> These patches can also be found in the riscv_more_exts_v2 branch at:
> https://github.com/avpatel/kvmtool.git
> 
> [...]

Applied to kvmtool (master), thanks!

[01/10] Sync-up headers with Linux-6.8 for KVM RISC-V
        https://git.kernel.org/will/kvmtool/c/9968468141fc
[02/10] kvmtool: Fix absence of __packed definition
        https://git.kernel.org/will/kvmtool/c/f8c9614c4696
[03/10] riscv: Add Zbc extension support
        https://git.kernel.org/will/kvmtool/c/8b4cc7051393
[04/10] riscv: Add scalar crypto extensions support
        https://git.kernel.org/will/kvmtool/c/d9052a965a22
[05/10] riscv: Add vector crypto extensions support
        https://git.kernel.org/will/kvmtool/c/65b58f723ec3
[06/10] riscv: Add Zfh[min] extensions support
        https://git.kernel.org/will/kvmtool/c/bd7f13c1a19f
[07/10] riscv: Add Zihintntl extension support
        https://git.kernel.org/will/kvmtool/c/fce2865286b5
[08/10] riscv: Add Zvfh[min] extensions support
        https://git.kernel.org/will/kvmtool/c/5a64c1eadf79
[09/10] riscv: Add Zfa extensiona support
        https://git.kernel.org/will/kvmtool/c/9cf213d609bc
[10/10] riscv: Allow disabling SBI STA extension for Guest
        https://git.kernel.org/will/kvmtool/c/d38c8f76ebe2

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

