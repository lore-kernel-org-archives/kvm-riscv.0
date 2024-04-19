From: Conor Dooley <conor@kernel.org>
Date: Fri, 19 Apr 2024 16:55:38 +0100
Subject: [PATCH v2 02/12] riscv: dts: enable Zc* extensions when needed
In-Reply-To: <20240418124300.1387978-3-cleger@rivosinc.com>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
 <20240418124300.1387978-3-cleger@rivosinc.com>
Message-ID: <20240419-pentagon-sabbath-c068399895b3@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 18, 2024 at 02:42:25PM +0200, Cl?ment L?ger wrote:
> The Zc* spec states that:
> 
> "The C extension is the superset of the following extensions:
>  - Zca
>  - Zcf if F is specified (RV32 only)
>  - Zcd if D is specified
>  As C defines the same instructions as Zca, Zcf and Zcd, the rule is that:
>  - C always implies Zca
>  - C+F implies Zcf (RV32 only)"
> 
> Add these extensions to existing device-trees that contains "c"
> extension in "riscv,isa-extensions".
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>

I don't wanna advocate this sort of churn whenever we add extensions
that are implied by some other existing extension, and I certainly don't
want to /have/ to do it because there'll be dbts_check warnings otherwise.
New subsets being defined do not invalidate the old descriptions and
they should remain valid.

>  arch/riscv/boot/dts/microchip/mpfs.dtsi       |  20 +-
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi    |  20 +-
>  arch/riscv/boot/dts/sifive/fu740-c000.dtsi    |  20 +-
>  arch/riscv/boot/dts/starfive/jh7100.dtsi      |   8 +-
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      |  20 +-
>  arch/riscv/boot/dts/thead/th1520.dtsi         |  16 +-

NAK for doing it to these 4 subdirs, even if the bindings are changed to
not warn about it anymore.

>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi |   4 +-

>  arch/riscv/boot/dts/renesas/r9a07g043f.dtsi   |   4 +-

>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi        |   4 +-
>  arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi   | 256 +++++++++---------

These go to other trees, so up to their maintainers what they want :)

Thanks,
Conor.

>  10 files changed, 186 insertions(+), 186 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> index 64c3c2e6cbe0..05e0e5f0eed7 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -26,8 +26,8 @@ cpu0: cpu at 0 {
>  			operating-points-v2 = <&opp_table_cpu>;
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> -					       "zifencei", "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zca", "zcd", "zicntr",
> +					       "zicsr", "zifencei", "zihpm";
>  			#cooling-cells = <2>;
>  
>  			cpu0_intc: interrupt-controller {
> diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> index 9883ca3554c5..82ac84afdda7 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> @@ -24,8 +24,8 @@ cpu0: cpu at 0 {
>  			reg = <0>;
>  			riscv,isa = "rv64imac";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "c", "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "c", "zca", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			clocks = <&clkcfg CLK_CPU>;
>  			status = "disabled";
>  
> @@ -53,8 +53,8 @@ cpu1: cpu at 1 {
>  			reg = <1>;
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> -					       "zifencei", "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zca", "zcd", "zicntr",
> +					       "zicsr", "zifencei", "zihpm";
>  			clocks = <&clkcfg CLK_CPU>;
>  			tlb-split;
>  			next-level-cache = <&cctrllr>;
> @@ -84,8 +84,8 @@ cpu2: cpu at 2 {
>  			reg = <2>;
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> -					       "zifencei", "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zca", "zcd", "zicntr",
> +					       "zicsr", "zifencei", "zihpm";
>  			clocks = <&clkcfg CLK_CPU>;
>  			tlb-split;
>  			next-level-cache = <&cctrllr>;
> @@ -115,8 +115,8 @@ cpu3: cpu at 3 {
>  			reg = <3>;
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> -					       "zifencei", "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zca", "zcd", "zicntr",
> +					       "zicsr", "zifencei", "zihpm";
>  			clocks = <&clkcfg CLK_CPU>;
>  			tlb-split;
>  			next-level-cache = <&cctrllr>;
> @@ -146,8 +146,8 @@ cpu4: cpu at 4 {
>  			reg = <4>;
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> -					       "zifencei", "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zca", "zcd", "zicntr",
> +					       "zicsr", "zifencei", "zihpm";
>  			clocks = <&clkcfg CLK_CPU>;
>  			tlb-split;
>  			next-level-cache = <&cctrllr>;
> diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> index f35324b9173c..b5e06fbfdf65 100644
> --- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> +++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> @@ -26,8 +26,8 @@ cpu0: cpu at 0 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm", "xandespmu";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm", "xandespmu";
>  			mmu-type = "riscv,sv39";
>  			i-cache-size = <0x8000>;
>  			i-cache-line-size = <0x40>;
> diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> index 156330a9bbf3..2872515dab17 100644
> --- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> +++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> @@ -31,8 +31,8 @@ cpu0: cpu at 0 {
>  			reg = <0>;
>  			riscv,isa = "rv64imac";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "c", "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "c", "zca", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			status = "disabled";
>  			cpu0_intc: interrupt-controller {
>  				#interrupt-cells = <1>;
> @@ -57,8 +57,8 @@ cpu1: cpu at 1 {
>  			reg = <1>;
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> -					       "zifencei", "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zca", "zcd", "zicntr",
> +					       "zicsr", "zifencei", "zihpm";
>  			tlb-split;
>  			next-level-cache = <&l2cache>;
>  			cpu1_intc: interrupt-controller {
> @@ -84,8 +84,8 @@ cpu2: cpu at 2 {
>  			reg = <2>;
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> -					       "zifencei", "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zca", "zcd", "zicntr",
> +					       "zicsr", "zifencei", "zihpm";
>  			tlb-split;
>  			next-level-cache = <&l2cache>;
>  			cpu2_intc: interrupt-controller {
> @@ -111,8 +111,8 @@ cpu3: cpu at 3 {
>  			reg = <3>;
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> -					       "zifencei", "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zca", "zcd", "zicntr",
> +					       "zicsr", "zifencei", "zihpm";
>  			tlb-split;
>  			next-level-cache = <&l2cache>;
>  			cpu3_intc: interrupt-controller {
> @@ -138,8 +138,8 @@ cpu4: cpu at 4 {
>  			reg = <4>;
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> -					       "zifencei", "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zca", "zcd", "zicntr",
> +					       "zicsr", "zifencei", "zihpm";
>  			tlb-split;
>  			next-level-cache = <&l2cache>;
>  			cpu4_intc: interrupt-controller {
> diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> index 6150f3397bff..4336ed11db9a 100644
> --- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> +++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> @@ -32,8 +32,8 @@ cpu0: cpu at 0 {
>  			reg = <0x0>;
>  			riscv,isa = "rv64imac";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "c", "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "c", "zca", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			status = "disabled";
>  			cpu0_intc: interrupt-controller {
>  				#interrupt-cells = <1>;
> @@ -59,8 +59,8 @@ cpu1: cpu at 1 {
>  			reg = <0x1>;
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> -					       "zifencei", "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zca", "zcd", "zicntr",
> +					       "zicsr", "zifencei", "zihpm";
>  			tlb-split;
>  			cpu1_intc: interrupt-controller {
>  				#interrupt-cells = <1>;
> @@ -86,8 +86,8 @@ cpu2: cpu at 2 {
>  			reg = <0x2>;
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> -					       "zifencei", "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zca", "zcd", "zicntr",
> +					       "zicsr", "zifencei", "zihpm";
>  			tlb-split;
>  			cpu2_intc: interrupt-controller {
>  				#interrupt-cells = <1>;
> @@ -113,8 +113,8 @@ cpu3: cpu at 3 {
>  			reg = <0x3>;
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> -					       "zifencei", "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zca", "zcd", "zicntr",
> +					       "zicsr", "zifencei", "zihpm";
>  			tlb-split;
>  			cpu3_intc: interrupt-controller {
>  				#interrupt-cells = <1>;
> @@ -140,8 +140,8 @@ cpu4: cpu at 4 {
>  			reg = <0x4>;
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> -					       "zifencei", "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zca", "zcd", "zicntr",
> +					       "zicsr", "zifencei", "zihpm";
>  			tlb-split;
>  			cpu4_intc: interrupt-controller {
>  				#interrupt-cells = <1>;
> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> index 2d6f4a4b1e58..1fa5c57acf48 100644
> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> @@ -28,8 +28,8 @@ cpu0: cpu at 0 {
>  			mmu-type = "riscv,sv39";
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> -					       "zifencei", "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zca", "zcd", "zicntr",
> +					       "zicsr", "zifencei", "zihpm";
>  
>  			cpu0_intc: interrupt-controller {
>  				compatible = "riscv,cpu-intc";
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> index b136b6c4128c..6d03076314aa 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> @@ -259,8 +259,8 @@ cpu0: cpu at 0 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <0>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -284,8 +284,8 @@ cpu1: cpu at 1 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <1>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -309,8 +309,8 @@ cpu2: cpu at 2 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <2>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -334,8 +334,8 @@ cpu3: cpu at 3 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <3>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -359,8 +359,8 @@ cpu4: cpu at 4 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <4>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -384,8 +384,8 @@ cpu5: cpu at 5 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <5>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -409,8 +409,8 @@ cpu6: cpu at 6 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <6>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -434,8 +434,8 @@ cpu7: cpu at 7 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <7>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -459,8 +459,8 @@ cpu8: cpu at 8 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <8>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -484,8 +484,8 @@ cpu9: cpu at 9 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <9>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -509,8 +509,8 @@ cpu10: cpu at 10 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <10>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -534,8 +534,8 @@ cpu11: cpu at 11 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <11>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -559,8 +559,8 @@ cpu12: cpu at 12 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <12>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -584,8 +584,8 @@ cpu13: cpu at 13 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <13>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -609,8 +609,8 @@ cpu14: cpu at 14 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <14>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -634,8 +634,8 @@ cpu15: cpu at 15 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <15>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -659,8 +659,8 @@ cpu16: cpu at 16 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <16>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -684,8 +684,8 @@ cpu17: cpu at 17 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <17>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -709,8 +709,8 @@ cpu18: cpu at 18 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <18>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -734,8 +734,8 @@ cpu19: cpu at 19 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <19>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -759,8 +759,8 @@ cpu20: cpu at 20 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <20>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -784,8 +784,8 @@ cpu21: cpu at 21 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <21>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -809,8 +809,8 @@ cpu22: cpu at 22 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <22>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -834,8 +834,8 @@ cpu23: cpu at 23 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <23>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -859,8 +859,8 @@ cpu24: cpu at 24 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <24>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -884,8 +884,8 @@ cpu25: cpu at 25 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <25>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -909,8 +909,8 @@ cpu26: cpu at 26 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <26>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -934,8 +934,8 @@ cpu27: cpu at 27 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <27>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -959,8 +959,8 @@ cpu28: cpu at 28 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <28>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -984,8 +984,8 @@ cpu29: cpu at 29 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <29>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1009,8 +1009,8 @@ cpu30: cpu at 30 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <30>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1034,8 +1034,8 @@ cpu31: cpu at 31 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <31>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1059,8 +1059,8 @@ cpu32: cpu at 32 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <32>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1084,8 +1084,8 @@ cpu33: cpu at 33 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <33>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1109,8 +1109,8 @@ cpu34: cpu at 34 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <34>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1134,8 +1134,8 @@ cpu35: cpu at 35 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <35>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1159,8 +1159,8 @@ cpu36: cpu at 36 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <36>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1184,8 +1184,8 @@ cpu37: cpu at 37 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <37>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1209,8 +1209,8 @@ cpu38: cpu at 38 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <38>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1234,8 +1234,8 @@ cpu39: cpu at 39 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <39>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1259,8 +1259,8 @@ cpu40: cpu at 40 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <40>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1284,8 +1284,8 @@ cpu41: cpu at 41 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <41>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1309,8 +1309,8 @@ cpu42: cpu at 42 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <42>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1334,8 +1334,8 @@ cpu43: cpu at 43 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <43>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1359,8 +1359,8 @@ cpu44: cpu at 44 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <44>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1384,8 +1384,8 @@ cpu45: cpu at 45 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <45>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1409,8 +1409,8 @@ cpu46: cpu at 46 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <46>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1434,8 +1434,8 @@ cpu47: cpu at 47 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <47>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1459,8 +1459,8 @@ cpu48: cpu at 48 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <48>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1484,8 +1484,8 @@ cpu49: cpu at 49 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <49>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1509,8 +1509,8 @@ cpu50: cpu at 50 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <50>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1534,8 +1534,8 @@ cpu51: cpu at 51 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <51>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1559,8 +1559,8 @@ cpu52: cpu at 52 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <52>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1584,8 +1584,8 @@ cpu53: cpu at 53 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <53>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1609,8 +1609,8 @@ cpu54: cpu at 54 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <54>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1634,8 +1634,8 @@ cpu55: cpu at 55 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <55>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1659,8 +1659,8 @@ cpu56: cpu at 56 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <56>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1684,8 +1684,8 @@ cpu57: cpu at 57 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <57>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1709,8 +1709,8 @@ cpu58: cpu at 58 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <58>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1734,8 +1734,8 @@ cpu59: cpu at 59 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <59>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1759,8 +1759,8 @@ cpu60: cpu at 60 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <60>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1784,8 +1784,8 @@ cpu61: cpu at 61 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <61>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1809,8 +1809,8 @@ cpu62: cpu at 62 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <62>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -1834,8 +1834,8 @@ cpu63: cpu at 63 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> -					       "zihpm";
> +					       "zca", "zcd", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			reg = <63>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> index 9a2e9583af88..7e53c539c871 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> @@ -35,8 +35,8 @@ U74_0: cpu at 0 {
>  			next-level-cache = <&ccache>;
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> -					       "zifencei", "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zca", "zcd", "zicntr",
> +					       "zicsr", "zifencei", "zihpm";
>  			tlb-split;
>  
>  			cpu0_intc: interrupt-controller {
> @@ -64,8 +64,8 @@ U74_1: cpu at 1 {
>  			next-level-cache = <&ccache>;
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> -					       "zifencei", "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zca", "zcd", "zicntr",
> +					       "zicsr", "zifencei", "zihpm";
>  			tlb-split;
>  
>  			cpu1_intc: interrupt-controller {
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 4a5708f7fcf7..f01024f50561 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -29,8 +29,8 @@ S7_0: cpu at 0 {
>  			next-level-cache = <&ccache>;
>  			riscv,isa = "rv64imac_zba_zbb";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "c", "zba", "zbb", "zicntr", "zicsr",
> -					       "zifencei", "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "c", "zba", "zbb", "zca", "zicntr",
> +					       "zicsr", "zifencei", "zihpm";
>  			status = "disabled";
>  
>  			cpu0_intc: interrupt-controller {
> @@ -58,8 +58,8 @@ U74_1: cpu at 1 {
>  			next-level-cache = <&ccache>;
>  			riscv,isa = "rv64imafdc_zba_zbb";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zicntr",
> -					       "zicsr", "zifencei", "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zca",
> +					       "zcd", "zicntr", "zicsr", "zifencei", "zihpm";
>  			tlb-split;
>  			operating-points-v2 = <&cpu_opp>;
>  			clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>;
> @@ -91,8 +91,8 @@ U74_2: cpu at 2 {
>  			next-level-cache = <&ccache>;
>  			riscv,isa = "rv64imafdc_zba_zbb";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zicntr",
> -					       "zicsr", "zifencei", "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zca",
> +					       "zcd", "zicntr", "zicsr", "zifencei", "zihpm";
>  			tlb-split;
>  			operating-points-v2 = <&cpu_opp>;
>  			clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>;
> @@ -124,8 +124,8 @@ U74_3: cpu at 3 {
>  			next-level-cache = <&ccache>;
>  			riscv,isa = "rv64imafdc_zba_zbb";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zicntr",
> -					       "zicsr", "zifencei", "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zca",
> +					       "zcd", "zicntr", "zicsr", "zifencei", "zihpm";
>  			tlb-split;
>  			operating-points-v2 = <&cpu_opp>;
>  			clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>;
> @@ -157,8 +157,8 @@ U74_4: cpu at 4 {
>  			next-level-cache = <&ccache>;
>  			riscv,isa = "rv64imafdc_zba_zbb";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zicntr",
> -					       "zicsr", "zifencei", "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zca",
> +					       "zcd", "zicntr", "zicsr", "zifencei", "zihpm";
>  			tlb-split;
>  			operating-points-v2 = <&cpu_opp>;
>  			clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>;
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 8b915e206f3a..530355bda7c1 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -21,8 +21,8 @@ c910_0: cpu at 0 {
>  			device_type = "cpu";
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> -					       "zifencei", "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zca", "zcd", "zicntr",
> +					       "zicsr", "zifencei", "zihpm";
>  			reg = <0>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -45,8 +45,8 @@ c910_1: cpu at 1 {
>  			device_type = "cpu";
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> -					       "zifencei", "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zca", "zcd", "zicntr",
> +					       "zicsr", "zifencei", "zihpm";
>  			reg = <1>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -69,8 +69,8 @@ c910_2: cpu at 2 {
>  			device_type = "cpu";
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> -					       "zifencei", "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zca", "zcd", "zicntr",
> +					       "zicsr", "zifencei", "zihpm";
>  			reg = <2>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> @@ -93,8 +93,8 @@ c910_3: cpu at 3 {
>  			device_type = "cpu";
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
> -			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> -					       "zifencei", "zihpm";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zca", "zcd", "zicntr",
> +					       "zicsr", "zifencei", "zihpm";
>  			reg = <3>;
>  			i-cache-block-size = <64>;
>  			i-cache-size = <65536>;
> -- 
> 2.43.0
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240419/7356e445/attachment-0001.sig>
