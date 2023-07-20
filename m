From: Will Deacon <will@kernel.org>
Date: Thu, 20 Jul 2023 17:04:39 +0100
Subject: [kvmtool PATCH v4 0/9] RISC-V SBI enable/disable, Zbb, Zicboz, and Ssaia support
In-Reply-To: <20230712163501.1769737-1-apatel@ventanamicro.com>
References: <20230712163501.1769737-1-apatel@ventanamicro.com>
Message-ID: <168986517012.3086307.1888752231956269805.b4-ty@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 12 Jul 2023 22:04:52 +0530, Anup Patel wrote:
> The latest KVM in Linux-6.4 has support for:
> 1) Enabling/disabling SBI extensions from KVM user-space
> 2) Zbb ISA extension support
> 3) Zicboz ISA extension support
> 4) Ssaia ISA extension support
> 
> This series adds corresponding changes in KVMTOOL to use the above
> mentioned features for Guest/VM.
> 
> [...]

Applied to kvmtool (master), thanks!

[1/9] kvm tools: Add __DECLARE_FLEX_ARRAY() in include/linux/stddef.h
      https://git.kernel.org/will/kvmtool/c/d8343698df72
[2/9] Sync-up headers with Linux-6.4
      https://git.kernel.org/will/kvmtool/c/be98682486a0
[3/9] riscv: Allow setting custom mvendorid, marchid, and mimpid
      https://git.kernel.org/will/kvmtool/c/9e9cfde59dfe
[4/9] riscv: Allow disabling SBI extensions for Guest
      https://git.kernel.org/will/kvmtool/c/a416fdc2e664
[5/9] riscv: Sort the ISA extension array alphabetically
      https://git.kernel.org/will/kvmtool/c/b346fabe6d2c
[6/9] riscv: Add zbb extension support
      https://git.kernel.org/will/kvmtool/c/8c1584e776a4
[7/9] riscv: Add Zicboz extension support
      https://git.kernel.org/will/kvmtool/c/8f1e47ca04c9
[8/9] riscv: Add Ssaia extension support
      https://git.kernel.org/will/kvmtool/c/8659200f6931
[9/9] riscv: Fix guest RAM alloc size computation for RV32
      https://git.kernel.org/will/kvmtool/c/106e2ea7756d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

