From: patchwork-bot+linux-riscv@kernel.org <patchwork-bot+linux-riscv@kernel.org>
Date: Thu, 02 Feb 2023 23:40:35 +0000
Subject: [PATCH v5 00/13] riscv: improve boot time isa extensions handling
In-Reply-To: <20230128172856.3814-1-jszhang@kernel.org>
References: <20230128172856.3814-1-jszhang@kernel.org>
Message-ID: <167538123525.14322.1108858489360294941.git-patchwork-notify@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sun, 29 Jan 2023 01:28:43 +0800 you wrote:
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
  - [v5,01/13] riscv: move riscv_noncoherent_supported() out of ZICBOM probe
    https://git.kernel.org/riscv/c/abcc445acdbe
  - [v5,02/13] riscv: cpufeature: detect RISCV_ALTERNATIVES_EARLY_BOOT earlier
    https://git.kernel.org/riscv/c/191b27c7c0e8
  - [v5,03/13] riscv: hwcap: make ISA extension ids can be used in asm
    https://git.kernel.org/riscv/c/d8a3d8a75206
  - [v5,04/13] riscv: cpufeature: extend riscv_cpufeature_patch_func to all ISA extensions
    https://git.kernel.org/riscv/c/4bf8860760d9
  - [v5,05/13] riscv: introduce riscv_has_extension_[un]likely()
    https://git.kernel.org/riscv/c/bdda5d554e43
  - [v5,06/13] riscv: fpu: switch has_fpu() to riscv_has_extension_likely()
    https://git.kernel.org/riscv/c/702e64550b12
  - [v5,07/13] riscv: module: move find_section to module.h
    https://git.kernel.org/riscv/c/e0c267e03b0c
  - [v5,08/13] riscv: module: Add ADD16 and SUB16 rela types
    https://git.kernel.org/riscv/c/1bc400ffb52b
  - [v5,09/13] riscv: switch to relative alternative entries
    https://git.kernel.org/riscv/c/8d23e94a4433
  - [v5,10/13] riscv: alternative: patch alternatives in the vDSO
    https://git.kernel.org/riscv/c/cabfd146b371
  - [v5,11/13] riscv: cpu_relax: switch to riscv_has_extension_likely()
    https://git.kernel.org/riscv/c/95bc69a47be2
  - [v5,12/13] riscv: KVM: Switch has_svinval() to riscv_has_extension_unlikely()
    https://git.kernel.org/riscv/c/e8ad17d2b5f3
  - [v5,13/13] riscv: remove riscv_isa_ext_keys[] array and related usage
    https://git.kernel.org/riscv/c/03966594e117

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



