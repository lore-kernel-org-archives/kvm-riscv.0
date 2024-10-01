From: patchwork-bot+linux-riscv@kernel.org <patchwork-bot+linux-riscv@kernel.org>
Date: Tue, 01 Oct 2024 11:35:17 +0000
Subject: [PATCH] RISC-V: KVM: Fix sbiret init before forwarding to userspace
In-Reply-To: <20240807154943.150540-2-ajones@ventanamicro.com>
References: <20240807154943.150540-2-ajones@ventanamicro.com>
Message-ID: <172778251701.314421.6304053721280906896.git-patchwork-notify@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello:

This patch was applied to riscv/linux.git (fixes)
by Anup Patel <anup@brainfault.org>:

On Wed,  7 Aug 2024 17:49:44 +0200 you wrote:
> When forwarding SBI calls to userspace ensure sbiret.error is
> initialized to SBI_ERR_NOT_SUPPORTED first, in case userspace
> neglects to set it to anything. If userspace neglects it then we
> can't be sure it did anything else either, so we just report it
> didn't do or try anything. Just init sbiret.value to zero, which is
> the preferred value to return when nothing special is specified.
> 
> [...]

Here is the summary with links:
  - RISC-V: KVM: Fix sbiret init before forwarding to userspace
    https://git.kernel.org/riscv/c/6b7b282e6bae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



