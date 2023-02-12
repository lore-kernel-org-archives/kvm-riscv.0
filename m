From: Guenter Roeck <linux@roeck-us.net>
Date: Sun, 12 Feb 2023 10:14:13 -0800
Subject: [PATCH v5 00/13] riscv: improve boot time isa extensions handling
In-Reply-To: <Y+kqi8bQE+8hLfOF@spud>
References: <20230128172856.3814-1-jszhang@kernel.org>
 <20230212154333.GA3760469@roeck-us.net> <Y+kM//nuDv29Z9qJ@spud>
 <Y+kU9nDBTttZRLLq@spud> <Y+kcgcncQO/2DNLo@spud> <Y+kqi8bQE+8hLfOF@spud>
Message-ID: <a059a815-dcb0-c575-b5a4-f9433e268e9b@roeck-us.net>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2/12/23 10:06, Conor Dooley wrote:
> On Sun, Feb 12, 2023 at 05:06:09PM +0000, Conor Dooley wrote:
>> On Sun, Feb 12, 2023 at 04:33:58PM +0000, Conor Dooley wrote:
>>> On Sun, Feb 12, 2023 at 03:59:59PM +0000, Conor Dooley wrote:
>>
>> So as not to lead anyone up the garden path, let me correct myself:
>>
>>> Hmm, so this appears to be us attempting to patch in alternatives where
>>> none actually exists - seemingly F & D.
>>
>> And of course that's not true, riscv_has_extension_likely() now uses
>> alternatives as of:
>> bdda5d554e43 ("riscv: introduce riscv_has_extension_[un]likely()")
>>
>>  From a quick look, it just happens that the only users are F & D.
>>
> 
> Samuel pointed out that this is a lockdep splat on irc.
> There's a patch on the list that removes the lockdep annotation
> entirely:
> https://patchwork.kernel.org/project/linux-riscv/patch/20230202114116.3695793-1-changbin.du at huawei.com/
> 
> So ye, no surprises that it was config based!
> 
> Palmer posted a "better" fix for that lockdep warning a while ago:
> https://lore.kernel.org/all/20220322022331.32136-1-palmer at rivosinc.com/
> 
> So we'd have to duplicate/reuse that for cpufeature/errata patching.
> 
> 

This does not (only) happen in stop_machine().

[    0.000000] ------------[ cut here ]------------
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/riscv/kernel/patch.c:63 patch_insn_write+0x222/0x2f6
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 6.2.0-rc7-next-20230210 #1
[    0.000000] Hardware name: riscv-virtio,qemu (DT)
[    0.000000] epc : patch_insn_write+0x222/0x2f6
[    0.000000]  ra : patch_insn_write+0x21e/0x2f6
[    0.000000] epc : ffffffff800068c6 ra : ffffffff800068c2 sp : ffffffff81803df0
[    0.000000]  gp : ffffffff81a1ab78 tp : ffffffff81814f80 t0 : ffffffffffffe000
[    0.000000]  t1 : fffffffffafdfb03 t2 : 4c45203a76637369 s0 : ffffffff81803e40
[    0.000000]  s1 : 0000000000000004 a0 : 0000000000000000 a1 : ffffffffffffffff
[    0.000000]  a2 : 0000000000000004 a3 : 0000000000000000 a4 : 0000000000000001
[    0.000000]  a5 : 0000000000000000 a6 : 0000000000000006 a7 : 0000000000000010
[    0.000000]  s2 : ffffffff8000431a s3 : 00000000000000b2 s4 : ffffffff800040ae
[    0.000000]  s5 : 00000000000000ae s6 : ffffffff8131a0a0 s7 : 0000000000000fff
[    0.000000]  s8 : 0000000008000200 s9 : ffffffff8131a520 s10: 0000000000000018
[    0.000000]  s11: 0000000000000008 t3 : 0000000022e125d2 t4 : 000000000000000d
[    0.000000]  t5 : ffffffffd8180000 t6 : ffffffff81803bc8
[    0.000000] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
[    0.000000] [<ffffffff800068c6>] patch_insn_write+0x222/0x2f6
[    0.000000] [<ffffffff80006a36>] patch_text_nosync+0xc/0x2a
[    0.000000] [<ffffffff80003b86>] riscv_cpufeature_patch_func+0x52/0x98
[    0.000000] [<ffffffff80003348>] _apply_alternatives+0x46/0x86
[    0.000000] [<ffffffff80c02d36>] apply_boot_alternatives+0x3c/0xfa
[    0.000000] [<ffffffff80c03ad8>] setup_arch+0x584/0x5b8
[    0.000000] [<ffffffff80c0075a>] start_kernel+0xa2/0x8f8
[    0.000000] irq event stamp: 0
[    0.000000] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
[    0.000000] hardirqs last disabled at (0): [<0000000000000000>] 0x0
[    0.000000] softirqs last  enabled at (0): [<0000000000000000>] 0x0
[    0.000000] softirqs last disabled at (0): [<0000000000000000>] 0x0
[    0.000000] ---[ end trace 0000000000000000 ]---

Guenter


