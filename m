From: patchwork-bot+linux-riscv@kernel.org <patchwork-bot+linux-riscv@kernel.org>
Date: Mon, 08 May 2023 14:41:56 +0000
Subject: [PATCH v4 0/9] RISC-V KVM virtualize AIA CSRs
In-Reply-To: <20230404153452.2405681-1-apatel@ventanamicro.com>
References: <20230404153452.2405681-1-apatel@ventanamicro.com>
Message-ID: <168355691612.25692.18026597841875424784.git-patchwork-notify@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello:

This series was applied to riscv/linux.git (fixes)
by Anup Patel <anup@brainfault.org>:

On Tue,  4 Apr 2023 21:04:43 +0530 you wrote:
> The RISC-V AIA specification is now frozen as-per the RISC-V international
> process. The latest frozen specifcation can be found at:
> https://github.com/riscv/riscv-aia/releases/download/1.0-RC3/riscv-interrupts-1.0-RC3.pdf
> 
> This series implements first phase of AIA virtualization which targets
> virtualizing AIA CSRs. This also provides a foundation for the second
> phase of AIA virtualization which will target in-kernel AIA irqchip
> (including both IMSIC and APLIC).
> 
> [...]

Here is the summary with links:
  - [v4,1/9] RISC-V: Add AIA related CSR defines
    https://git.kernel.org/riscv/c/d6f5f6e904be
  - [v4,2/9] RISC-V: Detect AIA CSRs from ISA string
    https://git.kernel.org/riscv/c/8fe6f7e14c7e
  - [v4,3/9] RISC-V: KVM: Drop the _MASK suffix from hgatp.VMID mask defines
    (no matching commit)
  - [v4,4/9] RISC-V: KVM: Initial skeletal support for AIA
    (no matching commit)
  - [v4,5/9] RISC-V: KVM: Implement subtype for CSR ONE_REG interface
    (no matching commit)
  - [v4,6/9] RISC-V: KVM: Add ONE_REG interface for AIA CSRs
    (no matching commit)
  - [v4,7/9] RISC-V: KVM: Use bitmap for irqs_pending and irqs_pending_mask
    (no matching commit)
  - [v4,8/9] RISC-V: KVM: Virtualize per-HART AIA CSRs
    (no matching commit)
  - [v4,9/9] RISC-V: KVM: Implement guest external interrupt line management
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



