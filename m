From: patchwork-bot+linux-riscv@kernel.org <patchwork-bot+linux-riscv@kernel.org>
Date: Sat, 18 Mar 2023 01:00:21 +0000
Subject: [PATCH v6 0/8] RISC-V: Apply Zicboz to clear_page
In-Reply-To: <20230224162631.405473-1-ajones@ventanamicro.com>
References: <20230224162631.405473-1-ajones@ventanamicro.com>
Message-ID: <167910122129.24496.10588514847374462522.git-patchwork-notify@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 24 Feb 2023 17:26:23 +0100 you wrote:
> When the Zicboz extension is available we can more rapidly zero naturally
> aligned Zicboz block sized chunks of memory. As pages are always page
> aligned and are larger than any Zicboz block size will be, then
> clear_page() appears to be a good candidate for the extension. While cycle
> count and energy consumption should also be considered, we can be pretty
> certain that implementing clear_page() with the Zicboz extension is a win
> by comparing the new dynamic instruction count with its current count[1].
> Doing so we see that the new count is just over a quarter of the old count
> (see patch6's commit message for more details).
> 
> [...]

Here is the summary with links:
  - [v6,1/8] RISC-V: alternatives: Support patching multiple insns in assembly
    https://git.kernel.org/riscv/c/0b2f658f5370
  - [v6,2/8] RISC-V: Factor out body of riscv_init_cbom_blocksize loop
    https://git.kernel.org/riscv/c/8b05e7d0408a
  - [v6,3/8] dt-bindings: riscv: Document cboz-block-size
    https://git.kernel.org/riscv/c/ea20f117ab99
  - [v6,4/8] RISC-V: Add Zicboz detection and block size parsing
    https://git.kernel.org/riscv/c/7ea5a73617e9
  - [v6,5/8] RISC-V: cpufeatures: Put the upper 16 bits of patch ID to work
    https://git.kernel.org/riscv/c/d25f256332cc
  - [v6,6/8] RISC-V: Use Zicboz in clear_page when available
    https://git.kernel.org/riscv/c/ab0f77465e3e
  - [v6,7/8] RISC-V: KVM: Provide UAPI for Zicboz block size
    https://git.kernel.org/riscv/c/665fd8862413
  - [v6,8/8] RISC-V: KVM: Expose Zicboz to the guest
    https://git.kernel.org/riscv/c/b20f67994f35

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



