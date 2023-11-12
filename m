From: patchwork-bot+linux-riscv@kernel.org <patchwork-bot+linux-riscv@kernel.org>
Date: Sun, 12 Nov 2023 00:55:46 +0000
Subject: [PATCH v3 0/9] RISC-V SBI debug console extension support
In-Reply-To: <20231020072140.900967-1-apatel@ventanamicro.com>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
Message-ID: <169975054624.11360.10545081285064306783.git-patchwork-notify@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello:

This series was applied to riscv/linux.git (fixes)
by Anup Patel <anup@brainfault.org>:

On Fri, 20 Oct 2023 12:51:31 +0530 you wrote:
> The SBI v2.0 specification is now frozen. The SBI v2.0 specification defines
> SBI debug console (DBCN) extension which replaces the legacy SBI v0.1
> functions sbi_console_putchar() and sbi_console_getchar().
> (Refer v2.0-rc5 at https://github.com/riscv-non-isa/riscv-sbi-doc/releases)
> 
> This series adds support for SBI debug console (DBCN) extension in KVM RISC-V
> and Linux RISC-V.
> 
> [...]

Here is the summary with links:
  - [v3,1/9] RISC-V: Add defines for SBI debug console extension
    https://git.kernel.org/riscv/c/dadf7886993c
  - [v3,2/9] RISC-V: KVM: Change the SBI specification version to v2.0
    https://git.kernel.org/riscv/c/b88e87a0a1ec
  - [v3,3/9] RISC-V: KVM: Allow some SBI extensions to be disabled by default
    https://git.kernel.org/riscv/c/56d8a385b605
  - [v3,4/9] RISC-V: KVM: Forward SBI DBCN extension to user-space
    https://git.kernel.org/riscv/c/c667ad229d13
  - [v3,5/9] KVM: riscv: selftests: Add SBI DBCN extension to get-reg-list test
    https://git.kernel.org/riscv/c/d9c00f44e5de
  - [v3,6/9] RISC-V: Add stubs for sbi_console_putchar/getchar()
    (no matching commit)
  - [v3,7/9] tty/serial: Add RISC-V SBI debug console based earlycon
    (no matching commit)
  - [v3,8/9] tty: Add SBI debug console support to HVC SBI driver
    (no matching commit)
  - [v3,9/9] RISC-V: Enable SBI based earlycon support
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



