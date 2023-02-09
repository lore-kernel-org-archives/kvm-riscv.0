From: Conor Dooley <conor@kernel.org>
Date: Thu, 09 Feb 2023 17:45:59 -0000
Subject: [PATCH v4 0/8] RISC-V: Apply Zicboz to clear_page
In-Reply-To: <20230209152628.129914-1-ajones@ventanamicro.com>
References: <20230209152628.129914-1-ajones@ventanamicro.com>
Message-ID: <Y+UxTBmegHqqHDCQ@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Drew,

On Thu, Feb 09, 2023 at 04:26:20PM +0100, Andrew Jones wrote:
> When the Zicboz extension is available we can more rapidly zero naturally
> aligned Zicboz block sized chunks of memory. As pages are always page
> aligned and are larger than any Zicboz block size will be, then
> clear_page() appears to be a good candidate for the extension. While cycle
> count and energy consumption should also be considered, we can be pretty
> certain that implementing clear_page() with the Zicboz extension is a win
> by comparing the new dynamic instruction count with its current count[1].
> Doing so we see that the new count is just over a quarter of the old count
> (see patch4's commit message for more details).
> 
> For those of you who reviewed v1[2], you may be looking for the memset()
> patches. As pointed out in v1, and a couple follow-up emails, it's not
> clear that patching memset() is a win yet. When I get a chance to test
> on real hardware with a comprehensive benchmark collection then I can
> post the memset() patches separately (assuming the benchmarks show it's
> worthwhile).
> 
> Based on riscv-linux/for-next plus the dependencies listed below.
> 
> Dependencies:
> https://lore.kernel.org/all/20230108163356.3063839-1-conor at kernel.org/
> https://lore.kernel.org/all/20230105192610.1940841-1-heiko at sntech.de/

I've had a short (due to FOSDEM) & busy week since we discussed the
automagic dependency collection. I'll try to get to it in the next few
days.

> The patches are also available here
> https://github.com/jones-drew/linux/commits/riscv/zicboz-v4
> 
> To test over QEMU this branch may be used to enable Zicboz
> https://gitlab.com/jones-drew/qemu/-/commits/riscv/zicboz
> 
> To test running a KVM guest with Zicboz this kvmtool branch may be used
> https://github.com/jones-drew/kvmtool/commits/riscv/zicboz
> 
> Thanks,
> drew
> 
> [1] I ported the functions under test to userspace and linked them with
>     a test program. Then, I ran them under gdb with a script[3] which
>     counted instructions by single stepping.
> [2] https://lore.kernel.org/all/20221027130247.31634-1-ajones at ventanamicro.com/
> [3] https://gist.github.com/jones-drew/487791c956ceca8c18adc2847eec9c60
> 
> v4:
>   - Rebased on latest for-next which allowed dropping one dependency
>   - Added "RISC-V: alternatives: Support patching multiple insns in assembly"
>     since I needed to use more than one instruction in an ALTERNATIVE call
>     from assembly. I can post this patch separately as a fix if desired.
>   - Improved the dt-binding patch commit message [Conor]
>   - Picked up some tags from Conor and Rob (I kept Conor's a-b on the
>     clear_page patch, even though there are several changes to it, because
>     I interpreted the a-b as "OK by me to implement a Zicboz clear_page")

Yea, it was a "I am far from qualified to review your implementation,
but I am okay with it existing and the remainder of the patch".

Cheers,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230209/f2ef3df8/attachment-0001.sig>
