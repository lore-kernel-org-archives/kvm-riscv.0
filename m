From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 22 Jan 2024 15:29:18 -0700
Subject: [PATCH -next v21 23/27] riscv: detect assembler support for
 .option arch
In-Reply-To: <20240121181009.GA1469@sol.localdomain>
References: <20240121011341.GA97368@sol.localdomain>
 <mhng-e4b5de69-859d-43ea-b35d-b568e6a621ef@palmer-ri-x1c9>
 <CABgGipW0pZCESu7dyiUdta2JtrpeMsJ3EABNjj_0GO9fbbTwQg@mail.gmail.com>
 <20240121181009.GA1469@sol.localdomain>
Message-ID: <20240122222918.GA141255@dev-fedora.aadp>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jan 21, 2024 at 10:10:09AM -0800, Eric Biggers wrote:
> On Sun, Jan 21, 2024 at 10:32:59PM +0800, Andy Chiu wrote:
> > 
> > Maybe what we really should do is to upgrade the condition check to a
> > one liner shell script and grep if "Warning" is being printed. Sadly
> > this warning is not failing the compilation with -Werror.
> > 
> > I can try forming a patch on this if it feels alright to people.
> 
> What about -Wa,--fatal-warnings ?

I suspect that would work, the following diff appears to work for me
with a version of clang that does and does not support '.option arch',
(although I am not sure if adding -Wa,--fatal-warnings will have any
other consequences):

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bffbd869a068..e3142ce531a0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -315,7 +315,6 @@ config AS_HAS_OPTION_ARCH
 	# https://reviews.llvm.org/D123515
 	def_bool y
 	depends on $(as-instr, .option arch$(comma) +m)
-	depends on !$(as-instr, .option arch$(comma) -i)
 
 source "arch/riscv/Kconfig.socs"
 source "arch/riscv/Kconfig.errata"
diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 5a84b6443875..3ee8ecfb8c04 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -33,7 +33,7 @@ ld-option = $(success,$(LD) -v $(1))
 
 # $(as-instr,<instr>)
 # Return y if the assembler supports <instr>, n otherwise
-as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler-with-cpp -o /dev/null -)
+as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -Wa$(comma)--fatal-warnings -c -x assembler-with-cpp -o /dev/null -)
 
 # check if $(CC) and $(LD) exist
 $(error-if,$(failure,command -v $(CC)),C compiler '$(CC)' not found)

