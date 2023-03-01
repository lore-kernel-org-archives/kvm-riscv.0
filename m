From: Conor Dooley <conor@kernel.org>
Date: Wed, 1 Mar 2023 18:44:38 +0000
Subject: [PATCH -next v14 19/19] riscv: Enable Vector code to be built
In-Reply-To: <Y/+SoGfspjGwlH7g@dev-arch.thelio-3990X>
References: <20230224170118.16766-20-andy.chiu@sifive.com>
 <202302250924.ukv4ZxOc-lkp@intel.com>
 <Y/+SoGfspjGwlH7g@dev-arch.thelio-3990X>
Message-ID: <Y/+dFpdbOdLRUmY5@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 01, 2023 at 11:00:00AM -0700, Nathan Chancellor wrote:
> Hi Andy,
> 
> On Sat, Feb 25, 2023 at 09:33:30AM +0800, kernel test robot wrote:
> > Hi Andy,
> > 
> > I love your patch! Perhaps something to improve:
> > 
> > [auto build test WARNING on next-20230224]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Chiu/riscv-Rename-__switch_to_aux-fpu/20230225-011059
> > patch link:    https://lore.kernel.org/r/20230224170118.16766-20-andy.chiu%40sifive.com
> > patch subject: [PATCH -next v14 19/19] riscv: Enable Vector code to be built
> > config: riscv-randconfig-r014-20230222 (https://download.01.org/0day-ci/archive/20230225/202302250924.ukv4ZxOc-lkp at intel.com/config)
> > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install riscv cross compiling tool for clang build
> >         # apt-get install binutils-riscv64-linux-gnu
> >         # https://github.com/intel-lab-lkp/linux/commit/cd0ad21a9ef9d63f1eef80fd3b09ae6e0d884ce3
> >         git remote add linux-review https://github.com/intel-lab-lkp/linux
> >         git fetch --no-tags linux-review Andy-Chiu/riscv-Rename-__switch_to_aux-fpu/20230225-011059
> >         git checkout cd0ad21a9ef9d63f1eef80fd3b09ae6e0d884ce3
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash lib/zstd/
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Link: https://lore.kernel.org/oe-kbuild-all/202302250924.ukv4ZxOc-lkp at intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
> 
> Please consider adding the following diff to patch 19 to avoid this
> issue (see the upstream bug report for more details):
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index eb691dd8ee4f..187cd6c1d8c9 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -423,6 +423,8 @@ config TOOLCHAIN_HAS_V
>  	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64iv)
>  	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32iv)
>  	depends on LLD_VERSION >= 140000 || LD_VERSION >= 23800
> +	# https://github.com/llvm/llvm-project/issues/61096
> +	depends on !(CC_IS_CLANG && CLANG_VERSION >= 160000 && KASAN)

Please don't! As far as I can tell, this is what I was warning about in:
https://lore.kernel.org/linux-riscv/20230224170118.16766-1-andy.chiu at sifive.com/T/#m2c0e6128230d407c843e10406305da9ff5dca902

The randconfig has RISCV_ISA_C enabled, so you're getting an ISA string
containing "fdcv" and `fdv,,$(riscv-march-y)` fails to remove either fd,
or v.

The below is very much valid though, please test v15 with clang/llvm
Andy!

> Additionally, with older versions of clang 15.x and older, I see:
> 
>   arch/riscv/kernel/vector.c:50:3: error: expected expression
>                   u32 width = RVV_EXRACT_VL_VS_WIDTH(insn_buf);
>                   ^
>   arch/riscv/kernel/vector.c:52:7: error: use of undeclared identifier 'width'
>                   if (width == RVV_VL_VS_WIDTH_8 || width == RVV_VL_VS_WIDTH_16 ||
>                       ^
>   arch/riscv/kernel/vector.c:52:37: error: use of undeclared identifier 'width'
>                   if (width == RVV_VL_VS_WIDTH_8 || width == RVV_VL_VS_WIDTH_16 ||
>                                                     ^
>   arch/riscv/kernel/vector.c:53:7: error: use of undeclared identifier 'width'
>                       width == RVV_VL_VS_WIDTH_32 || width == RVV_VL_VS_WIDTH_64)
>                       ^
>   arch/riscv/kernel/vector.c:53:38: error: use of undeclared identifier 'width'
>                       width == RVV_VL_VS_WIDTH_32 || width == RVV_VL_VS_WIDTH_64)
>                                                      ^
>   arch/riscv/kernel/vector.c:57:3: error: expected expression
>                   u32 csr = RVG_EXTRACT_SYSTEM_CSR(insn_buf);
>                   ^
>   arch/riscv/kernel/vector.c:59:8: error: use of undeclared identifier 'csr'
>                   if ((csr >= CSR_VSTART && csr <= CSR_VCSR) ||
>                        ^
>   arch/riscv/kernel/vector.c:59:29: error: use of undeclared identifier 'csr'
>                   if ((csr >= CSR_VSTART && csr <= CSR_VCSR) ||
>                                             ^
>   arch/riscv/kernel/vector.c:60:8: error: use of undeclared identifier 'csr'
>                       (csr >= CSR_VL && csr <= CSR_VLENB))
>                        ^
>   arch/riscv/kernel/vector.c:60:25: error: use of undeclared identifier 'csr'
>                       (csr >= CSR_VL && csr <= CSR_VLENB))
>                                         ^
>   10 errors generated.
> 
> which is fixed by:
> 
> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index 585e2c51b28e..8c98db9c0ae1 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -46,14 +46,15 @@ static bool insn_is_vector(u32 insn_buf)
>  		is_vector = true;
>  		break;
>  	case RVV_OPCODE_VL:
> -	case RVV_OPCODE_VS:
> +	case RVV_OPCODE_VS: {
>  		u32 width = RVV_EXRACT_VL_VS_WIDTH(insn_buf);
>  
>  		if (width == RVV_VL_VS_WIDTH_8 || width == RVV_VL_VS_WIDTH_16 ||
>  		    width == RVV_VL_VS_WIDTH_32 || width == RVV_VL_VS_WIDTH_64)
>  			is_vector = true;
>  		break;
> -	case RVG_OPCODE_SYSTEM:
> +	}
> +	case RVG_OPCODE_SYSTEM: {
>  		u32 csr = RVG_EXTRACT_SYSTEM_CSR(insn_buf);
>  
>  		if ((csr >= CSR_VSTART && csr <= CSR_VCSR) ||
> @@ -61,6 +62,7 @@ static bool insn_is_vector(u32 insn_buf)
>  			is_vector = true;
>  		break;
>  	}
> +	}
>  	return is_vector;
>  }
>  
> ---
> 
> Cheers,
> Nathan
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230301/06500313/attachment-0001.sig>
