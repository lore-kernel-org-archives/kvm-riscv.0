From: Heiko Stübner <heiko@sntech.de>
Date: Fri, 31 Mar 2023 15:33:59 +0200
Subject: [PATCH -next v17 19/20] riscv: detect assembler support for .option arch
In-Reply-To: <20230327164941.20491-20-andy.chiu@sifive.com>
References: <20230327164941.20491-1-andy.chiu@sifive.com>
 <20230327164941.20491-20-andy.chiu@sifive.com>
Message-ID: <1936189.yKVeVyVuyW@diego>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Am Montag, 27. M?rz 2023, 18:49:39 CEST schrieb Andy Chiu:
> Some extensions use .option arch directive to selectively enable certain
> extensions in parts of its assembly code. For example, Zbb uses it to
> inform assmebler to emit bit manipulation instructions. However,
> supporting of this directive only exist on GNU assembler and has not
> landed on clang at the moment, making TOOLCHAIN_HAS_ZBB depend on
> AS_IS_GNU.
> 
> While it is still under review at https://reviews.llvm.org/D123515, the
> upcoming Vector patch also requires this feature in assembler. Thus,
> provide Kconfig AS_HAS_OPTION_ARCH to detect such feature. Then
> TOOLCHAIN_HAS_XXX will be turned on automatically when the feature land.
> 
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>



