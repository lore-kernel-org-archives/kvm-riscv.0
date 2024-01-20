From: patchwork-bot+linux-riscv@kernel.org <patchwork-bot+linux-riscv@kernel.org>
Date: Sat, 20 Jan 2024 21:09:55 +0000
Subject: [PATCH v4 00/13] RISC-V: Add steal-time support
In-Reply-To: <20231220160012.40184-15-ajones@ventanamicro.com>
References: <20231220160012.40184-15-ajones@ventanamicro.com>
Message-ID: <170578499524.24348.16462593200054070695.git-patchwork-notify@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello:

This series was applied to riscv/linux.git (fixes)
by Anup Patel <anup@brainfault.org>:

On Wed, 20 Dec 2023 17:00:13 +0100 you wrote:
> One frequently touted benefit of virtualization is the ability to
> consolidate machines, increasing resource utilization.  It may even be
> desirable to overcommit, at the risk of one or more VCPUs having to wait.
> Hypervisors which have interfaces for guests to retrieve the amount of
> time each VCPU had to wait give observers within the guests ways to
> account for less progress than would otherwise be expected. The SBI STA
> extension[1] provides a standard interface for guest VCPUs to retrieve
> the amount of time "stolen".
> 
> [...]

Here is the summary with links:
  - [v4,01/13] RISC-V: paravirt: Add skeleton for pv-time support
    (no matching commit)
  - [v4,02/13] RISC-V: Add SBI STA extension definitions
    https://git.kernel.org/riscv/c/6cfc624576a6
  - [v4,03/13] RISC-V: paravirt: Implement steal-time support
    (no matching commit)
  - [v4,04/13] RISC-V: KVM: Add SBI STA extension skeleton
    (no matching commit)
  - [v4,05/13] RISC-V: KVM: Add steal-update vcpu request
    (no matching commit)
  - [v4,06/13] RISC-V: KVM: Add SBI STA info to vcpu_arch
    (no matching commit)
  - [v4,07/13] RISC-V: KVM: Add support for SBI extension registers
    (no matching commit)
  - [v4,08/13] RISC-V: KVM: Add support for SBI STA registers
    (no matching commit)
  - [v4,09/13] RISC-V: KVM: Implement SBI STA extension
    (no matching commit)
  - [v4,10/13] RISC-V: KVM: selftests: Move sbi_ecall to processor.c
    (no matching commit)
  - [v4,11/13] RISC-V: KVM: selftests: Add guest_sbi_probe_extension
    (no matching commit)
  - [v4,12/13] RISC-V: KVM: selftests: Add steal_time test support
    (no matching commit)
  - [v4,13/13] RISC-V: KVM: selftests: Add get-reg-list test for STA registers
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



