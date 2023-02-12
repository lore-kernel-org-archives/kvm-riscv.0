From: Conor Dooley <conor@kernel.org>
Date: Sun, 12 Feb 2023 16:00:11 -0000
Subject: [PATCH v5 00/13] riscv: improve boot time isa extensions handling
In-Reply-To: <20230212154333.GA3760469@roeck-us.net>
References: <20230128172856.3814-1-jszhang@kernel.org>
 <20230212154333.GA3760469@roeck-us.net>
Message-ID: <Y+kM//nuDv29Z9qJ@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Guenter,

On Sun, Feb 12, 2023 at 07:43:33AM -0800, Guenter Roeck wrote:
> On Sun, Jan 29, 2023 at 01:28:43AM +0800, Jisheng Zhang wrote:
> > Generally, riscv ISA extensions are fixed for any specific hardware
> > platform, so a hart's features won't change after booting, this
> > chacteristic makes it straightforward to use a static branch to check
> > a specific ISA extension is supported or not to optimize performance.
> > 
> > However, some ISA extensions such as SVPBMT and ZICBOM are handled
> > via. the alternative sequences.
> > 
> > Basically, for ease of maintenance, we prefer to use static branches
> > in C code, but recently, Samuel found that the static branch usage in
> > cpu_relax() breaks building with CONFIG_CC_OPTIMIZE_FOR_SIZE[1]. As
> > Samuel pointed out, "Having a static branch in cpu_relax() is
> > problematic because that function is widely inlined, including in some
> > quite complex functions like in the VDSO. A quick measurement shows
> > this static branch is responsible by itself for around 40% of the jump
> > table."
> > 
> > Samuel's findings pointed out one of a few downsides of static branches
> > usage in C code to handle ISA extensions detected at boot time:
> > static branch's metadata in the __jump_table section, which is not
> > discarded after ISA extensions are finalized, wastes some space.
> > 
> > I want to try to solve the issue for all possible dynamic handling of
> > ISA extensions at boot time. Inspired by Mark[2], this patch introduces
> > riscv_has_extension_*() helpers, which work like static branches but
> > are patched using alternatives, thus the metadata can be freed after
> > patching.
> > 
> 
> This patch series results in boot failures when trying to boot the
> qemu sifive_u emulation. There are many log messages along the line of
> 
> [    0.000000] WARNING: CPU: 0 PID: 0 at arch/riscv/kernel/patch.c:63 patch_insn_write+0x222/0x2f6
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G        W          6.2.0-rc7-next-20230210 #1
> [    0.000000] Hardware name: SiFive HiFive Unleashed A00 (DT)
> [    0.000000] epc : patch_insn_write+0x222/0x2f6
> [    0.000000]  ra : patch_insn_write+0x21e/0x2f6
> [    0.000000] epc : ffffffff800068c6 ra : ffffffff800068c2 sp : ffffffff81803df0
> [    0.000000]  gp : ffffffff81a1ab78 tp : ffffffff81814f80 t0 : ffffffffffffe000
> [    0.000000]  t1 : 0000000000000001 t2 : 4c45203a76637369 s0 : ffffffff81803e40
> [    0.000000]  s1 : 0000000000000004 a0 : 0000000000000000 a1 : ffffffffffffffff
> [    0.000000]  a2 : 0000000000000004 a3 : 0000000000000000 a4 : 0000000000000001
> [    0.000000]  a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000052464e43
> [    0.000000]  s2 : ffffffff80b4889c s3 : 000000000000082c s4 : ffffffff80b48828
> [    0.000000]  s5 : 0000000000000828 s6 : ffffffff8131a0a0 s7 : 0000000000000fff
> [    0.000000]  s8 : 0000000008000200 s9 : ffffffff8131a520 s10: 0000000000000018
> [    0.000000]  s11: 000000000000000b t3 : 0000000000000001 t4 : 000000000000000d
> [    0.000000]  t5 : ffffffffd8180000 t6 : ffffffff81803bc8
> [    0.000000] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
> [    0.000000] [<ffffffff800068c6>] patch_insn_write+0x222/0x2f6
> [    0.000000] [<ffffffff80006a36>] patch_text_nosync+0xc/0x2a
> [    0.000000] [<ffffffff80003b86>] riscv_cpufeature_patch_func+0x52/0x98
> [    0.000000] [<ffffffff80003348>] _apply_alternatives+0x46/0x86
> [    0.000000] [<ffffffff80c02d36>] apply_boot_alternatives+0x3c/0xfa
> [    0.000000] [<ffffffff80c03ad8>] setup_arch+0x584/0x5b8
> [    0.000000] [<ffffffff80c0075a>] start_kernel+0xa2/0x8f8
> [    0.000000] irq event stamp: 0
> [    0.000000] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
> [    0.000000] hardirqs last disabled at (0): [<0000000000000000>] 0x0
> [    0.000000] softirqs last  enabled at (0): [<0000000000000000>] 0x0
> [    0.000000] softirqs last disabled at (0): [<0000000000000000>] 0x0
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000] ------------[ cut here ]------------
> 
> then qemu hangs until the session is aborted.

I have come across the same issue on PolarFire SoC while looking at
Samuel's fixes for Zbb & the D1:
https://lore.kernel.org/all/20230212021534.59121-1-samuel at sholland.org/

Boot over NFS still works, which I think points to a hole in how my CI
is operating - it assumed the completed boot + bootrr being happy to
mean that there was nothing wrong!

On the VisionFive 2 & D1 Nezha I don't see these splats though.
It appears to be config related as the config I build for Icicle sees
these splats in QEMU but the D1 config does not.
I'll go do some digging!

> 
> Similar messages are also seen with the "virt" emulation, but there the boot
> does not hang but fails to find a root device.
> 
> Guenter
> 
> 
> 
> ---
> bisect:
> 
> # bad: [6ba8a227fd19d19779005fb66ad7562608e1df83] Add linux-next specific files for 20230210
> # good: [4ec5183ec48656cec489c49f989c508b68b518e3] Linux 6.2-rc7
> git bisect start 'HEAD' 'v6.2-rc7'
> # bad: [94613f0efc69ed41f9229ef5c294db3ec37145da] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
> git bisect bad 94613f0efc69ed41f9229ef5c294db3ec37145da
> # bad: [8928ece68de4371dc6e1d3336d3029c1e18ae3b4] Merge branch 'for_next' of git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git
> git bisect bad 8928ece68de4371dc6e1d3336d3029c1e18ae3b4
> # good: [78a9f460e33d103256f3abb38f02f4759710c7dc] soc: document merges
> git bisect good 78a9f460e33d103256f3abb38f02f4759710c7dc
> # good: [b35b2472ebafa29d0bbe79fbee1da6ef3c4ec619] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
> git bisect good b35b2472ebafa29d0bbe79fbee1da6ef3c4ec619
> # bad: [57a87a64b520c37dd49f5fde84d09a4adb391180] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
> git bisect bad 57a87a64b520c37dd49f5fde84d09a4adb391180
> # good: [cfc8ba01cc84b24ec6eb293ec9fba893f7cd4581] Merge branch 'clk-next' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
> git bisect good cfc8ba01cc84b24ec6eb293ec9fba893f7cd4581
> # good: [6acecfa485d3de955c35a18730c106ddf1e7600e] powerpc/kcsan: Add KCSAN Support
> git bisect good 6acecfa485d3de955c35a18730c106ddf1e7600e
> # good: [8a16dea453dbc3e834b162640028e505882cd11e] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
> git bisect good 8a16dea453dbc3e834b162640028e505882cd11e
> # good: [6be1ff430dab9fc047762b10b2c9669399ea1f37] riscv: pgtable: Fixup comment for KERN_VIRT_SIZE
> git bisect good 6be1ff430dab9fc047762b10b2c9669399ea1f37
> # good: [e0c267e03b0c77c9ac79ac08eada41ba8eb1b95f] riscv: module: move find_section to module.h
> git bisect good e0c267e03b0c77c9ac79ac08eada41ba8eb1b95f
> # good: [e8ad17d2b5f38e595d597a3e2419d6d7cc727b17] riscv: KVM: Switch has_svinval() to riscv_has_extension_unlikely()
> git bisect good e8ad17d2b5f38e595d597a3e2419d6d7cc727b17
> # good: [75ab93a244a516d1d3c03c4e27d5d0deff76ebfb] Merge patch series "Zbb string optimizations"
> git bisect good 75ab93a244a516d1d3c03c4e27d5d0deff76ebfb
> # bad: [9daca9a5b9ac35361ce2d8d5ec10b19b7048d6cd] Merge patch series "riscv: improve boot time isa extensions handling"
> git bisect bad 9daca9a5b9ac35361ce2d8d5ec10b19b7048d6cd
> # good: [03966594e1170303c037b0cded35c464a13a4a45] riscv: remove riscv_isa_ext_keys[] array and related usage
> git bisect good 03966594e1170303c037b0cded35c464a13a4a45
> # first bad commit: [9daca9a5b9ac35361ce2d8d5ec10b19b7048d6cd] Merge patch series "riscv: improve boot time isa extensions handling"
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230212/3b8e55fb/attachment-0001.sig>
