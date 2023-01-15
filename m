From: Conor Dooley <conor@kernel.org>
Date: Sun, 15 Jan 2023 16:29:04 +0000
Subject: [PATCH v4 06/13] riscv: introduce
 riscv_has_extension_[un]likely()
In-Reply-To: <20230115154953.831-7-jszhang@kernel.org>
References: <20230115154953.831-1-jszhang@kernel.org>
 <20230115154953.831-7-jszhang@kernel.org>
Message-ID: <Y8Qp0NcIPPGqUDGl@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Jisheng,

On Sun, Jan 15, 2023 at 11:49:46PM +0800, Jisheng Zhang wrote:
> Generally, riscv ISA extensions are fixed for any specific hardware
> platform, so a hart's features won't change after booting. This
> chacteristic makes it straightforward to use a static branch to check
> if a specific ISA extension is supported or not to optimize
> performance.
> 
> However, some ISA extensions such as SVPBMT and ZICBOM are handled
> via. the alternative sequences.
> 
> Basically, for ease of maintenance, we prefer to use static branches
> in C code, but recently, Samuel found that the static branch usage in
> cpu_relax() breaks building with CONFIG_CC_OPTIMIZE_FOR_SIZE[1]. As
> Samuel pointed out, "Having a static branch in cpu_relax() is
> problematic because that function is widely inlined, including in some
> quite complex functions like in the VDSO. A quick measurement shows
> this static branch is responsible by itself for around 40% of the jump
> table."
> 
> Samuel's findings pointed out one of a few downsides of static branches
> usage in C code to handle ISA extensions detected at boot time:
> static branch's metadata in the __jump_table section, which is not
> discarded after ISA extensions are finalized, wastes some space.
> 
> I want to try to solve the issue for all possible dynamic handling of
> ISA extensions at boot time. Inspired by Mark[2], this patch introduces
> riscv_has_extension_*() helpers, which work like static branches but
> are patched using alternatives, thus the metadata can be freed after
> patching.
> 
> Link: https://lore.kernel.org/linux-riscv/20220922060958.44203-1-samuel at sholland.org/ [1]
> Link: https://lore.kernel.org/linux-arm-kernel/20220912162210.3626215-8-mark.rutland at arm.com/ [2]
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

It'd be great, if, in the future, you would hold off on sending new
versions of patchsets where the previous version is still being
discussed [3].
~3 days between versions is not very much, especially when that includes
a weekend!
I know you replied there earlier today with your opinion, but please
give people a chance to read and respond, before resubmitting, so as not
to split discussion between several threads.

3 - https://lore.kernel.org/linux-riscv/2398293.3Lj2Plt8kZ at diego/

Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230115/7c8c8389/attachment-0001.sig>
