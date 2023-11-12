From: patchwork-bot+linux-riscv@kernel.org <patchwork-bot+linux-riscv@kernel.org>
Date: Sun, 12 Nov 2023 00:55:46 +0000
Subject: [PATCH v3 0/6] KVM RISC-V Conditional Operations
In-Reply-To: <20231003035226.1945725-1-apatel@ventanamicro.com>
References: <20231003035226.1945725-1-apatel@ventanamicro.com>
Message-ID: <169975054631.11360.10958982747975281844.git-patchwork-notify@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello:

This series was applied to riscv/linux.git (fixes)
by Anup Patel <anup@brainfault.org>:

On Tue,  3 Oct 2023 09:22:20 +0530 you wrote:
> This series extends KVM RISC-V to allow Guest/VM discover and use
> conditional operations related ISA extensions (namely XVentanaCondOps
> and Zicond).
> 
> To try these patches, use KVMTOOL from riscv_zbx_zicntr_smstateen_condops_v1
> branch at: https://github.com/avpatel/kvmtool.git
> 
> [...]

Here is the summary with links:
  - [v3,1/6] dt-bindings: riscv: Add Zicond extension entry
    https://git.kernel.org/riscv/c/00c6f39c8247
  - [v3,2/6] RISC-V: Detect Zicond from ISA string
    https://git.kernel.org/riscv/c/662a601aa355
  - [v3,3/6] RISC-V: KVM: Allow Zicond extension for Guest/VM
    https://git.kernel.org/riscv/c/df68f4d8cb49
  - [v3,4/6] KVM: riscv: selftests: Add senvcfg register to get-reg-list test
    https://git.kernel.org/riscv/c/4d554e0226e6
  - [v3,5/6] KVM: riscv: selftests: Add smstateen registers to get-reg-list test
    https://git.kernel.org/riscv/c/e1a8db0c9a0e
  - [v3,6/6] KVM: riscv: selftests: Add condops extensions to get-reg-list test
    https://git.kernel.org/riscv/c/2b3f2b78ec93

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



