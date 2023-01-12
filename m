From: Conor Dooley <conor@kernel.org>
Date: Thu, 12 Jan 2023 21:55:52 +0000
Subject: [PATCH v3 10/13] riscv: alternative: patch alternatives in the
 vDSO
In-Reply-To: <Y7+7TRv7+V0nKNiZ@wendy>
References: <20230111171027.2392-1-jszhang@kernel.org>
 <20230111171027.2392-11-jszhang@kernel.org>
 <Y7+7TRv7+V0nKNiZ@wendy>
Message-ID: <Y8CB6Cy5ZrTMIkFL@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 12, 2023 at 07:48:29AM +0000, Conor Dooley wrote:
> Hey Jisheng,
> 
> On Thu, Jan 12, 2023 at 01:10:24AM +0800, Jisheng Zhang wrote:
> > Make it possible to use alternatives in the vDSO, so that better
> > implementations can be used if possible.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > Reviewed-by: Guo Ren <guoren@kernel.org>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> FYI, from this patch onwards the rv32 build is broken.
> Should be reproduceable with the in-tree rv32_defconfig.
> 
> Unfortunately no logs for you, I've got a CI bug to fix!

Here's the error:

../arch/riscv/kernel/alternative.c:174:21: error: incompatible pointer types passing 'const struct elf64_hdr *' to parameter of type 'const Elf32_Ehdr *' (aka 'const struct elf32_hdr *') [-Werror,-Wincompatible-pointer-types]
        alt = find_section(hdr, shdr, ".alternative");
                           ^~~
../arch/riscv/include/asm/module.h:115:60: note: passing argument to parameter 'hdr' here
static inline const Elf_Shdr *find_section(const Elf_Ehdr *hdr,
                                                           ^
../arch/riscv/kernel/alternative.c:174:26: error: incompatible pointer types passing 'const struct elf64_shdr *' to parameter of type 'const Elf32_Shdr *' (aka 'const struct elf32_shdr *') [-Werror,-Wincompatible-pointer-types]
        alt = find_section(hdr, shdr, ".alternative");
                                ^~~~
../arch/riscv/include/asm/module.h:116:25: note: passing argument to parameter 'sechdrs' here
                                           const Elf_Shdr *sechdrs,
                                                           ^
../arch/riscv/kernel/alternative.c:174:6: error: incompatible pointer types assigning to 'const struct elf64_shdr *' from 'const Elf32_Shdr *' (aka 'const struct elf32_shdr *') [-Werror,-Wincompatible-pointer-types]
        alt = find_section(hdr, shdr, ".alternative");
            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
3 errors generated.

Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230112/005392ab/attachment-0001.sig>
