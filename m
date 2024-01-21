From: Palmer Dabbelt <palmer@dabbelt.com>
Date: Sat, 20 Jan 2024 18:55:12 -0800 (PST)
Subject: [PATCH -next v21 23/27] riscv: detect assembler support for .option arch
In-Reply-To: <20240121011341.GA97368@sol.localdomain>
Message-ID: <mhng-e4b5de69-859d-43ea-b35d-b568e6a621ef@palmer-ri-x1c9>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 20 Jan 2024 17:13:41 PST (-0800), ebiggers at kernel.org wrote:
> Hi Andy,
>
> On Mon, Jun 05, 2023 at 11:07:20AM +0000, Andy Chiu wrote:
>> +config AS_HAS_OPTION_ARCH
>> +	# https://reviews.llvm.org/D123515
>> +	def_bool y
>> +	depends on $(as-instr, .option arch$(comma) +m)
>> +	depends on !$(as-instr, .option arch$(comma) -i)
>
> With tip-of-tree clang (llvm-project commit 85a8e5c3e0586e85), I'm seeing
> AS_HAS_OPTION_ARCH be set to n.  It's the second "depends on" that makes it be
> set to n, so apparently clang started accepting ".option arch -i".  What was
> your intent here for checking that ".option arch -i" is not supported?  I'd
> think that just the first "depends on" would be sufficient.

I'm not sure what Andy's rationale was, but de3a913df6e ("RISC-V: 
Clarify the behavior of .option arch directive.") in binutils-gdb 
stopped accepting `.option arch, -i` along with fixing a handful of 
other oddities in our `.option arch` handling.

If that's all this is testing for then we should probably add some sort 
of version check for old binutils (or maybe just ignore it, looks like 
it was a bugfix and the old version was never released).

+Nelson, as he probably knows better than I do.

That said: what does LLVM do if you ask it to turn the "I" base ISA off?  
I'd argue there's no instructions left at that point...

