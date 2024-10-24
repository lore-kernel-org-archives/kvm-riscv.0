From: patchwork-bot+linux-riscv@kernel.org <patchwork-bot+linux-riscv@kernel.org>
Date: Thu, 24 Oct 2024 17:50:39 +0000
Subject: [PATCH v5 00/10] riscv: Userspace pointer masking and tagged address
 ABI
In-Reply-To: <20241016202814.4061541-1-samuel.holland@sifive.com>
References: <20241016202814.4061541-1-samuel.holland@sifive.com>
Message-ID: <172979223949.2327357.12698642185375267636.git-patchwork-notify@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 16 Oct 2024 13:27:41 -0700 you wrote:
> RISC-V defines three extensions for pointer masking[1]:
>  - Smmpm: configured in M-mode, affects M-mode
>  - Smnpm: configured in M-mode, affects the next lower mode (S or U-mode)
>  - Ssnpm: configured in S-mode, affects the next lower mode (VS, VU, or U-mode)
> 
> This series adds support for configuring Smnpm or Ssnpm (depending on
> which privilege mode the kernel is running in) to allow pointer masking
> in userspace (VU or U-mode), extending the PR_SET_TAGGED_ADDR_CTRL API
> from arm64. Unlike arm64 TBI, userspace pointer masking is not enabled
> by default on RISC-V. Additionally, the tag width (referred to as PMLEN)
> is variable, so userspace needs to ask the kernel for a specific tag
> width, which is interpreted as a lower bound on the number of tag bits.
> 
> [...]

Here is the summary with links:
  - [v5,01/10] dt-bindings: riscv: Add pointer masking ISA extensions
    https://git.kernel.org/riscv/c/8946ad26c0e2
  - [v5,02/10] riscv: Add ISA extension parsing for pointer masking
    https://git.kernel.org/riscv/c/12749546293e
  - [v5,03/10] riscv: Add CSR definitions for pointer masking
    https://git.kernel.org/riscv/c/1edd6226877b
  - [v5,04/10] riscv: Add support for userspace pointer masking
    https://git.kernel.org/riscv/c/871aba681a0d
  - [v5,05/10] riscv: Add support for the tagged address ABI
    https://git.kernel.org/riscv/c/c4d16116bd11
  - [v5,06/10] riscv: Allow ptrace control of the tagged address ABI
    https://git.kernel.org/riscv/c/cebce87fb04e
  - [v5,07/10] riscv: selftests: Add a pointer masking test
    https://git.kernel.org/riscv/c/5e9f1ee1c523
  - [v5,08/10] riscv: hwprobe: Export the Supm ISA extension
    https://git.kernel.org/riscv/c/d250050aae4f
  - [v5,09/10] RISC-V: KVM: Allow Smnpm and Ssnpm extensions for guests
    https://git.kernel.org/riscv/c/e27f468bcf14
  - [v5,10/10] KVM: riscv: selftests: Add Smnpm and Ssnpm to get-reg-list test
    https://git.kernel.org/riscv/c/814779461d84

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



