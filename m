From: Conor Dooley <conor@kernel.org>
Date: Wed, 25 Jan 2023 22:24:00 +0000
Subject: [PATCH -next v13 19/19] riscv: Enable Vector code to be built
In-Reply-To: <08DF16C6-1D76-4FBE-871C-3A37C5349C87@jrtc27.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-20-andy.chiu@sifive.com>
 <Y9GZbVrZxEZAraVu@spud>
 <08DF16C6-1D76-4FBE-871C-3A37C5349C87@jrtc27.com>
Message-ID: <Y9GsAOPMVX4qGero@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 25, 2023 at 09:38:00PM +0000, Jessica Clarke wrote:
> On 25 Jan 2023, at 21:04, Conor Dooley <conor@kernel.org> wrote:
> > On Wed, Jan 25, 2023 at 02:20:56PM +0000, Andy Chiu wrote:
> > 
> >> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> >> index 12d91b0a73d8..67411cdc836f 100644
> >> --- a/arch/riscv/Makefile
> >> +++ b/arch/riscv/Makefile
> >> @@ -52,6 +52,13 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
> >> riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
> >> riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
> >> riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
> >> +riscv-march-$(CONFIG_RISCV_ISA_V)	:= $(riscv-march-y)v
> >> +
> >> +ifeq ($(CONFIG_RISCV_ISA_V), y)
> >> +ifeq ($(CONFIG_CC_IS_CLANG), y)
> >> +        riscv-march-y += -mno-implicit-float -menable-experimental-extensions
> >> +endif
> >> +endif
> > 
> > Uh, so I don't think this was actually tested with (a recent version of)
> > clang:
> > clang-15: error: unknown argument: '-menable-experimental-extensions_zicbom_zihintpause'
> > 
> > Firstly, no-implicit-float is a CFLAG, so why add it to march?
> > There is an existing patch on the list for enabling this flag, but I
> > recall Palmer saying that it was not actually needed?
> > Palmer, do you remember why that was?
> > 
> > I dunno what enable-experimental-extensions is, but I can guess. Do we
> > really want to enable vector for toolchains where the support is
> > considered experimental? I'm not au fait with the details of clang
> > versions nor versions of the Vector spec, so take the following with a
> > bit of a pinch of salt...
> > Since you've allowed this to be built with anything later than clang 13,
> > does that mean that different versions of clang may generate vector code
> > that are not compatible?
> > I'm especially concerned by:
> > https://github.com/riscv/riscv-v-spec/releases/tag/0.9
> > which appears to be most recently released version of the spec, prior to
> > clang/llvm 13 being released.
> 
> For implementations of unratified extensions you both have to enable
> them with -menable-experimental-extensions and have to explicitly
> specify the version in the -march string specifically so this isn?t a
> concern. Only once ratified can you use the unversioned extension,
> which is implicitly the ratified version (ignoring the whole i2p0 vs
> i2p1 fiasco).

Ahh, thanks for the clarification Jess.

> But no, you probably don?t want experimental implementations, which can
> exist when the ratified version is implemented in theory (so there?s no
> compatibility concern based on ISA changes) but isn?t deemed
> production-ready (e.g. potential ABI instability in the case of
> something like V).

And I guess, if you turn it on for one, it's on for all.
While the vector extension might be okay in that regard, another
extension well not be okay to use the "unversioned" experimental version
of. Sounds like removing that option and picking the version of clang
that adds the actual implementation is a better approach, at least IMO.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230125/a31ba3da/attachment-0001.sig>
