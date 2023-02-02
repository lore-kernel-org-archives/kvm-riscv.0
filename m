From: Palmer Dabbelt <palmer@rivosinc.com>
Date: Thu, 02 Feb 2023 15:39:09 -0800
Subject: [PATCH v5 00/13] riscv: improve boot time isa extensions handling
In-Reply-To: <20230128172856.3814-1-jszhang@kernel.org>
References: <20230128172856.3814-1-jszhang@kernel.org>
Message-ID: <167538114995.11760.15499865647132420589.b4-ty@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 29 Jan 2023 01:28:43 +0800, Jisheng Zhang wrote:
> Generally, riscv ISA extensions are fixed for any specific hardware
> platform, so a hart's features won't change after booting, this
> chacteristic makes it straightforward to use a static branch to check
> a specific ISA extension is supported or not to optimize performance.
> 
> However, some ISA extensions such as SVPBMT and ZICBOM are handled
> via. the alternative sequences.
> 
> [...]

Applied, thanks!

[01/13] riscv: move riscv_noncoherent_supported() out of ZICBOM probe
        https://git.kernel.org/palmer/c/abcc445acdbe
[02/13] riscv: cpufeature: detect RISCV_ALTERNATIVES_EARLY_BOOT earlier
        https://git.kernel.org/palmer/c/191b27c7c0e8
[03/13] riscv: hwcap: make ISA extension ids can be used in asm
        https://git.kernel.org/palmer/c/d8a3d8a75206
[04/13] riscv: cpufeature: extend riscv_cpufeature_patch_func to all ISA extensions
        https://git.kernel.org/palmer/c/4bf8860760d9
[05/13] riscv: introduce riscv_has_extension_[un]likely()
        https://git.kernel.org/palmer/c/bdda5d554e43
[06/13] riscv: fpu: switch has_fpu() to riscv_has_extension_likely()
        https://git.kernel.org/palmer/c/702e64550b12
[07/13] riscv: module: move find_section to module.h
        https://git.kernel.org/palmer/c/e0c267e03b0c
[08/13] riscv: module: Add ADD16 and SUB16 rela types
        https://git.kernel.org/palmer/c/1bc400ffb52b
[09/13] riscv: switch to relative alternative entries
        https://git.kernel.org/palmer/c/8d23e94a4433
[10/13] riscv: alternative: patch alternatives in the vDSO
        https://git.kernel.org/palmer/c/cabfd146b371
[11/13] riscv: cpu_relax: switch to riscv_has_extension_likely()
        https://git.kernel.org/palmer/c/95bc69a47be2
[12/13] riscv: KVM: Switch has_svinval() to riscv_has_extension_unlikely()
        https://git.kernel.org/palmer/c/e8ad17d2b5f3
[13/13] riscv: remove riscv_isa_ext_keys[] array and related usage
        https://git.kernel.org/palmer/c/03966594e117

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

