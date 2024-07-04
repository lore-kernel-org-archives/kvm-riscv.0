From: patchwork-bot+linux-riscv@kernel.org <patchwork-bot+linux-riscv@kernel.org>
Date: Thu, 04 Jul 2024 13:10:56 +0000
Subject: [PATCH v4 0/3] Assorted fixes in RISC-V PMU driver
In-Reply-To: <20240628-misc_perf_fixes-v4-0-e01cfddcf035@rivosinc.com>
References: <20240628-misc_perf_fixes-v4-0-e01cfddcf035@rivosinc.com>
Message-ID: <172009865667.17306.8198164921917389320.git-patchwork-notify@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello:

This series was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 28 Jun 2024 00:51:40 -0700 you wrote:
> This series contains 3 fixes out of which the first one is a new fix
> for invalid event data reported in lkml[2]. The last two are v3 of Samuel's
> patch[1]. I added the RB/TB/Fixes tag and moved 1 unrelated change
> to its own patch. I also changed an error message in kvm vcpu_pmu from
> pr_err to pr_debug to avoid redundant failure error messages generated
> due to the boot time quering of events implemented in the patch[1]
> 
> [...]

Here is the summary with links:
  - [v4,1/3] drivers/perf: riscv: Do not update the event data if uptodate
    https://git.kernel.org/riscv/c/a3f24e83d11d
  - [v4,2/3] drivers/perf: riscv: Reset the counter to hpmevent mapping while starting cpus
    https://git.kernel.org/riscv/c/7dd646cf745c
  - [v4,3/3] perf: RISC-V: Check standard event availability
    https://git.kernel.org/riscv/c/16d3b1af0944

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



