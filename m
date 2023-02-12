From: Guenter Roeck <linux@roeck-us.net>
Date: Sun, 12 Feb 2023 12:27:10 -0800
Subject: [PATCH v5 00/13] riscv: improve boot time isa extensions handling
In-Reply-To: <Y+kzy1y3Z3j3Ohs9@spud>
References: <20230128172856.3814-1-jszhang@kernel.org>
 <20230212154333.GA3760469@roeck-us.net> <Y+kM//nuDv29Z9qJ@spud>
 <Y+kU9nDBTttZRLLq@spud> <Y+kcgcncQO/2DNLo@spud> <Y+kqi8bQE+8hLfOF@spud>
 <a059a815-dcb0-c575-b5a4-f9433e268e9b@roeck-us.net> <Y+kt04c1iRlzUNLA@spud>
 <48d2ac96-abdd-23bc-b167-08dc2c1a1dbe@roeck-us.net> <Y+kzy1y3Z3j3Ohs9@spud>
Message-ID: <89c99d4a-8f0a-4e7e-9f93-2dc9f881ab9f@roeck-us.net>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2/12/23 10:45, Conor Dooley wrote:
...
> 
>> However, I still see that the patch series
>> results in boot hangs with the sifive_u qemu emulation, where
>> the log ends with "Oops - illegal instruction". Is that problem
>> being addressed as well ?
> 
> Hmm, if it died on the last commit in this series, then I am not sure.
> If you meant with riscv/for-next or linux-next that's fixed by a patch
> from Samuel:
> https://patchwork.kernel.org/project/linux-riscv/patch/20230212021534.59121-3-samuel at sholland.org/
> 

It failed after the merge, so it looks like it may have been merge damage.

Anyway, I applied

RISC-V: Don't check text_mutex during stop_machine
riscv: Fix early alternative patching
riscv: Fix Zbb alternative IDs

and the sifive_u emulation no longer crashes. However, I still get

[    0.000000] ------------[ cut here ]------------
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/riscv/kernel/patch.c:71 patch_insn_write+0x222/0x2f6

repeated several times.

I then also tested

riscv: patch: Fixup lockdep warning in stop_machine
riscv: Fix early alternative patching
riscv: Fix Zbb alternative IDs

which works fine (no warning backtrace) for sifive_u, but gives me

WARNING: CPU: 0 PID: 0 at kernel/trace/trace_events.c:433 trace_event_raw_init+0xde/0x642

and a whole lot of

event btrfs_clear_extent_bit has unsafe dereference of argument 1

and similar messages when running the "virt" emulation. That was there before,
but drowned in the noise. Ok, guess I'll need another round of bisect.

Guenter


