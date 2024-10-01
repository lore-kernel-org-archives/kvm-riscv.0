From: patchwork-bot+linux-riscv@kernel.org <patchwork-bot+linux-riscv@kernel.org>
Date: Tue, 01 Oct 2024 11:35:15 +0000
Subject: [PATCH 0/2] Fixes for KVM PMU trap/emulation
In-Reply-To: <20240816-kvm_pmu_fixes-v1-0-cdfce386dd93@rivosinc.com>
References: <20240816-kvm_pmu_fixes-v1-0-cdfce386dd93@rivosinc.com>
Message-ID: <172778251574.314421.15171056255748157228.git-patchwork-notify@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello:

This series was applied to riscv/linux.git (fixes)
by Anup Patel <anup@brainfault.org>:

On Fri, 16 Aug 2024 00:08:07 -0700 you wrote:
> This series contains two small fixes to improve the KVM PMU trap/emulation
> code. The issue can be observed if SBI PMU is disabled or forced the kvm
> to use hpmcounter31.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
> Atish Patra (2):
>       RISC-V: KVM: Allow legacy PMU access from guest
>       RISC-V: KVM: Fix to allow hpmcounter31 from the guest
> 
> [...]

Here is the summary with links:
  - [1/2] RISC-V: KVM: Allow legacy PMU access from guest
    https://git.kernel.org/riscv/c/7d1ffc8b087e
  - [2/2] RISC-V: KVM: Fix to allow hpmcounter31 from the guest
    https://git.kernel.org/riscv/c/5aa09297a3dc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



