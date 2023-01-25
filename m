From: patchwork-bot+linux-riscv@kernel.org <patchwork-bot+linux-riscv@kernel.org>
Date: Wed, 25 Jan 2023 03:50:18 +0000
Subject: [PATCH v4 00/13] riscv: improve boot time isa extensions handling
In-Reply-To: <20230115154953.831-1-jszhang@kernel.org>
References: <20230115154953.831-1-jszhang@kernel.org>
Message-ID: <167461861886.411.4529941581273369452.git-patchwork-notify@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sun, 15 Jan 2023 23:49:40 +0800 you wrote:
> Generally, riscv ISA extensions are fixed for any specific hardware
> platform, so a hart's features won't change after booting, this
> chacteristic makes it straightforward to use a static branch to check
> a specific ISA extension is supported or not to optimize performance.
> 
> However, some ISA extensions such as SVPBMT and ZICBOM are handled
> via. the alternative sequences.
> 
> [...]

Here is the summary with links:
  - [v4,01/13] riscv: fix jal offsets in patched alternatives
    https://git.kernel.org/riscv/c/9d5567ccf96f
  - [v4,02/13] riscv: move riscv_noncoherent_supported() out of ZICBOM probe
    (no matching commit)
  - [v4,03/13] riscv: cpufeature: detect RISCV_ALTERNATIVES_EARLY_BOOT earlier
    (no matching commit)
  - [v4,04/13] riscv: hwcap: make ISA extension ids can be used in asm
    (no matching commit)
  - [v4,05/13] riscv: cpufeature: extend riscv_cpufeature_patch_func to all ISA extensions
    (no matching commit)
  - [v4,06/13] riscv: introduce riscv_has_extension_[un]likely()
    (no matching commit)
  - [v4,07/13] riscv: fpu: switch has_fpu() to riscv_has_extension_likely()
    (no matching commit)
  - [v4,08/13] riscv: module: move find_section to module.h
    (no matching commit)
  - [v4,09/13] riscv: switch to relative alternative entries
    (no matching commit)
  - [v4,10/13] riscv: alternative: patch alternatives in the vDSO
    (no matching commit)
  - [v4,11/13] riscv: cpu_relax: switch to riscv_has_extension_likely()
    (no matching commit)
  - [v4,12/13] riscv: KVM: Switch has_svinval() to riscv_has_extension_unlikely()
    (no matching commit)
  - [v4,13/13] riscv: remove riscv_isa_ext_keys[] array and related usage
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



