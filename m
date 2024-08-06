From: patchwork-bot+linux-riscv@kernel.org <patchwork-bot+linux-riscv@kernel.org>
Date: Tue, 06 Aug 2024 20:28:50 +0000
Subject: [PATCH v8 0/5] Add Svade and Svadu Extensions Support
In-Reply-To: <20240726084931.28924-1-yongxuan.wang@sifive.com>
References: <20240726084931.28924-1-yongxuan.wang@sifive.com>
Message-ID: <172297613024.1692635.16557321392270733874.git-patchwork-notify@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello:

This series was applied to riscv/linux.git (fixes)
by Anup Patel <anup@brainfault.org>:

On Fri, 26 Jul 2024 16:49:25 +0800 you wrote:
> Svade and Svadu extensions represent two schemes for managing the PTE A/D
> bit. When the PTE A/D bits need to be set, Svade extension intdicates that
> a related page fault will be raised. In contrast, the Svadu extension
> supports hardware updating of PTE A/D bits. This series enables Svade and
> Svadu extensions for both host and guest OS.
> 
> Regrading the mailing thread[1], we have 4 possible combinations of
> these extensions in the device tree, the default hardware behavior for
> these possibilities are:
> 1) Neither Svade nor Svadu present in DT => It is technically
>    unknown whether the platform uses Svade or Svadu. Supervisor
>    software should be prepared to handle either hardware updating
>    of the PTE A/D bits or page faults when they need updated.
> 2) Only Svade present in DT => Supervisor must assume Svade to be
>    always enabled.
> 3) Only Svadu present in DT => Supervisor must assume Svadu to be
>    always enabled.
> 4) Both Svade and Svadu present in DT => Supervisor must assume
>    Svadu turned-off at boot time. To use Svadu, supervisor must
>    explicitly enable it using the SBI FWFT extension.
> 
> [...]

Here is the summary with links:
  - [v8,1/5] RISC-V: Add Svade and Svadu Extensions Support
    (no matching commit)
  - [v8,2/5] dt-bindings: riscv: Add Svade and Svadu Entries
    (no matching commit)
  - [v8,3/5] RISC-V: KVM: Add Svade and Svadu Extensions Support for Guest/VM
    (no matching commit)
  - [v8,4/5] KVM: riscv: selftests: Fix compile error
    https://git.kernel.org/riscv/c/dd4a799bcc13
  - [v8,5/5] KVM: riscv: selftests: Add Svade and Svadu Extension to get-reg-list test
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



