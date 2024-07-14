From: patchwork-bot+linux-riscv@kernel.org <patchwork-bot+linux-riscv@kernel.org>
Date: Sun, 14 Jul 2024 20:30:33 +0000
Subject: [PATCH v3 0/6] riscv: Apply Zawrs when available
In-Reply-To: <20240426100820.14762-8-ajones@ventanamicro.com>
References: <20240426100820.14762-8-ajones@ventanamicro.com>
Message-ID: <172098903362.7439.8760600001594796975.git-patchwork-notify@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 26 Apr 2024 12:08:20 +0200 you wrote:
> Zawrs provides two instructions (wrs.nto and wrs.sto), where both are
> meant to allow the hart to enter a low-power state while waiting on a
> store to a memory location. The instructions also both wait an
> implementation-defined "short" duration (unless the implementation
> terminates the stall for another reason). The difference is that while
> wrs.sto will terminate when the duration elapses, wrs.nto, depending on
> configuration, will either just keep waiting or an ILL exception will be
> raised. Linux will use wrs.nto, so if platforms have an implementation
> which falls in the "just keep waiting" category (which is not expected),
> then it should _not_ advertise Zawrs in the hardware description.
> 
> [...]

Here is the summary with links:
  - [v3,1/6] riscv: Provide a definition for 'pause'
    https://git.kernel.org/riscv/c/6da111574baf
  - [v3,2/6] dt-bindings: riscv: Add Zawrs ISA extension description
    https://git.kernel.org/riscv/c/6d5852811600
  - [v3,3/6] riscv: Add Zawrs support for spinlocks
    https://git.kernel.org/riscv/c/b8ddb0df30f9
  - [v3,4/6] riscv: hwprobe: export Zawrs ISA extension
    https://git.kernel.org/riscv/c/244c18fbf64a
  - [v3,5/6] KVM: riscv: Support guest wrs.nto
    https://git.kernel.org/riscv/c/86d6a86e59e3
  - [v3,6/6] KVM: riscv: selftests: Add Zawrs extension to get-reg-list test
    https://git.kernel.org/riscv/c/f2c43c61160e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



