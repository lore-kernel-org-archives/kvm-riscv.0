From: Conor Dooley <conor.dooley@microchip.com>
Date: Mon, 20 Mar 2023 13:48:24 -0000
Subject: [PATCH -next v15 19/19] riscv: Enable Vector code to be built
In-Reply-To: <20230317154658.GA1122384@dev-arch.thelio-3990X>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
 <20230317113538.10878-20-andy.chiu@sifive.com>
 <20230317154658.GA1122384@dev-arch.thelio-3990X>
Message-ID: <8dba167d-5b68-472c-992f-05b80404f557@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 17, 2023 at 08:46:58AM -0700, Nathan Chancellor wrote:
> On Fri, Mar 17, 2023 at 11:35:38AM +0000, Andy Chiu wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> > 
> > This patch adds a config which enables vector feature from the kernel
> > space.
> > 
> > Support for RISC_V_ISA_V is limited to GNU-assembler for now, as LLVM
> > has not acquired the functionality to selectively change the arch option
> > in assembly code. This is still under review at
> >     https://reviews.llvm.org/D123515
> > 
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
> > Suggested-by: Atish Patra <atishp@atishpatra.org>
> > Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
> > Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> > ---
> >  arch/riscv/Kconfig  | 20 ++++++++++++++++++++
> >  arch/riscv/Makefile |  6 +++++-
> >  2 files changed, 25 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index c736dc8e2593..bf9aba2f2811 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -436,6 +436,26 @@ config RISCV_ISA_SVPBMT
> >  
> >  	   If you don't know what to do here, say Y.
> >  
> > +config TOOLCHAIN_HAS_V
> > +	bool
> > +	default y
> > +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64iv)
> > +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32iv)
> > +	depends on LLD_VERSION >= 140000 || LD_VERSION >= 23800
> > +	depends on AS_IS_GNU
> 
> Consider hoisting this 'depends on AS_IS_GNU' into its own configuration
> option, as the same dependency is present in CONFIG_TOOLCHAIN_HAS_ZBB
> for the exact same reason, with no comment as to why. By having a shared
> dependency configuration option, we can easily update it when that
> change is merged into LLVM proper and gain access to the current and
> future options that depend on it. I imagine something like:
> 
> config AS_HAS_OPTION_ARCH
>     bool
>     default y
>     # https://reviews.llvm.org/D123515
>     depends on AS_IS_GNU
> 
> config TOOLCHAIN_HAS_ZBB
>     bool
>     default y
>     depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbb)
>     depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
>     depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
>     depends on AS_HAS_OPTION_ARCH
> 
> config TOOLCHAIN_HAS_V
>     bool
>     default y
>     depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64iv)
>     depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32iv)
>     depends on LLD_VERSION >= 140000 || LD_VERSION >= 23800
>     depends on AS_HAS_OPTION_ARCH
> 
> It would be nice if it was a hard error for LLVM like GCC so that we
> could just dynamically check support via as-instr but a version check is
> not the end of the world when we know the versions.

Yah, this is a good idea Nathan, since we may end up having to do the
same thing for a decent number of extensions going forward. Could you
please implement this Andy?

> > +config RISCV_ISA_V
> > +	bool "VECTOR extension support"
> > +	depends on TOOLCHAIN_HAS_V
> > +	depends on FPU
> > +	select DYNAMIC_SIGFRAME
> > +	default y
> > +	help
> > +	  Say N here if you want to disable all vector related procedure
> > +	  in the kernel.
> > +
> > +	  If you don't know what to do here, say Y.
> > +
> >  config TOOLCHAIN_HAS_ZBB
> >  	bool
> >  	default y
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index 6203c3378922..84a50cfaedf9 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -56,6 +56,7 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
> >  riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
> >  riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
> >  riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
> > +riscv-march-$(CONFIG_RISCV_ISA_V)	:= $(riscv-march-y)v
> >  
> >  # Newer binutils versions default to ISA spec version 20191213 which moves some
> >  # instructions from the I extension to the Zicsr and Zifencei extensions.
> > @@ -65,7 +66,10 @@ riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
> >  # Check if the toolchain supports Zihintpause extension
> >  riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
> >  
> > -KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
> > +# Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
> > +# keep non-v and multi-letter extensions out with the filter ([^v_]*)
> > +KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed  -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
                                                                 ^
Is the extra space here intentional?

It's a shame that this had to become so complicated, but thanks for
adding a comment so that the rationale behind the complexity can be
understood.
Perhaps there's a case to be made for removing fd & v separately to make
things more understandable, but I think the removal of v is going to
look complex in both cases.
I'm happy with doing it like this now, but if, in the future, we need to
account for possibly having q too, I might advocate for the split rather
than adding more complexity.

With Nathan's suggestion of AS_HAS_OPTION_ARCH:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> > +
> >  KBUILD_AFLAGS += -march=$(riscv-march-y)
> >  
> >  KBUILD_CFLAGS += -mno-save-restore
> > -- 
> > 2.17.1
> > 
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230320/b1ab7297/attachment-0001.sig>
