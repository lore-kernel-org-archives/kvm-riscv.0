From: Will Deacon <will@kernel.org>
Date: Tue,  8 Nov 2022 17:38:38 +0000
Subject: [PATCH kvmtool 0/6] RISC-V Svinval, Zihintpause, anad Zicbom support
In-Reply-To: <20221018140854.69846-1-apatel@ventanamicro.com>
References: <20221018140854.69846-1-apatel@ventanamicro.com>
Message-ID: <166792166159.1914852.10387116696255694350.b4-ty@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 18 Oct 2022 19:38:48 +0530, Anup Patel wrote:
> The latest Linux-6.1-rc1 has support for Svinval, Zihintpause and Zicbom
> extensions in KVM RISC-V. This series adds corresponding changes in KVMTOOL
> to allow Guest/VM use these new RISC-V extensions.
> 
> These patches can also be found in the riscv_svinval_zihintpause_zicbom_v1
> branch at: https://github.com/avpatel/kvmtool.git
> 
> [...]

Applied to kvmtool (master), thanks!

[1/6] Update UAPI headers based on Linux-6.1-rc1
      https://git.kernel.org/will/kvmtool/c/76dfc0cf2d6b
[2/6] riscv: Add Svinval extension support
      https://git.kernel.org/will/kvmtool/c/ac16e9430627
[3/6] riscv: Add zihintpause extension support
      https://git.kernel.org/will/kvmtool/c/23a8ed907331
[4/6] riscv: Move reg encoding helpers to kvm-cpu-arch.h
      https://git.kernel.org/will/kvmtool/c/b721ac0ad88a
[5/6] riscv: Add Zicbom extension support
      https://git.kernel.org/will/kvmtool/c/798398f40a16
[6/6] riscv: Add --disable-<xyz> options to allow user disable extensions
      https://git.kernel.org/will/kvmtool/c/e17d182ad3f7

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

