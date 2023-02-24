From: kernel test robot <lkp@intel.com>
Date: Sat, 25 Feb 2023 05:35:01 +0800
Subject: [PATCH -next v14 19/19] riscv: Enable Vector code to be built
In-Reply-To: <20230224170118.16766-20-andy.chiu@sifive.com>
References: <20230224170118.16766-20-andy.chiu@sifive.com>
Message-ID: <202302250511.yaHzCeR1-lkp@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on next-20230224]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Chiu/riscv-Rename-__switch_to_aux-fpu/20230225-011059
patch link:    https://lore.kernel.org/r/20230224170118.16766-20-andy.chiu%40sifive.com
patch subject: [PATCH -next v14 19/19] riscv: Enable Vector code to be built
config: riscv-buildonly-randconfig-r002-20230222 (https://download.01.org/0day-ci/archive/20230225/202302250511.yaHzCeR1-lkp at intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/cd0ad21a9ef9d63f1eef80fd3b09ae6e0d884ce3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Chiu/riscv-Rename-__switch_to_aux-fpu/20230225-011059
        git checkout cd0ad21a9ef9d63f1eef80fd3b09ae6e0d884ce3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302250511.yaHzCeR1-lkp at intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/ptrace.c:10:
>> arch/riscv/include/asm/vector.h:88:3: error: instruction requires the following: 'V' (Vector Extension for Application Processors), 'Zve32x' or 'Zve64x' (Vector Extensions for Embedded Processors)
                   "vsetvli        t4, x0, e8, m8, ta, ma\n\t"
                   ^
   <inline asm>:1:2: note: instantiated into assembly here
           vsetvli t4, x0, e8, m8, ta, ma
           ^
   In file included from arch/riscv/kernel/ptrace.c:10:
   arch/riscv/include/asm/vector.h:88:36: error: instruction requires the following: 'V' (Vector Extension for Application Processors), 'Zve32x' or 'Zve64x' (Vector Extensions for Embedded Processors)
                   "vsetvli        t4, x0, e8, m8, ta, ma\n\t"
                                                           ^
   <inline asm>:2:2: note: instantiated into assembly here
           vse8.v          v0, (a1)
           ^
   In file included from arch/riscv/kernel/ptrace.c:10:
   arch/riscv/include/asm/vector.h:90:21: error: instruction requires the following: 'V' (Vector Extension for Application Processors), 'Zve32x' or 'Zve64x' (Vector Extensions for Embedded Processors)
                   "add            %0, %0, t4\n\t"
                                               ^
   <inline asm>:4:2: note: instantiated into assembly here
           vse8.v          v8, (a1)
           ^
   In file included from arch/riscv/kernel/ptrace.c:10:
   arch/riscv/include/asm/vector.h:92:21: error: instruction requires the following: 'V' (Vector Extension for Application Processors), 'Zve32x' or 'Zve64x' (Vector Extensions for Embedded Processors)
                   "add            %0, %0, t4\n\t"
                                               ^
   <inline asm>:6:2: note: instantiated into assembly here
           vse8.v          v16, (a1)
           ^
   In file included from arch/riscv/kernel/ptrace.c:10:
   arch/riscv/include/asm/vector.h:94:21: error: instruction requires the following: 'V' (Vector Extension for Application Processors), 'Zve32x' or 'Zve64x' (Vector Extensions for Embedded Processors)
                   "add            %0, %0, t4\n\t"
                                               ^
   <inline asm>:8:2: note: instantiated into assembly here
           vse8.v          v24, (a1)
           ^
   5 errors generated.
--
   In file included from arch/riscv/kernel/signal.c:20:
   In file included from arch/riscv/include/asm/switch_to.h:11:
   arch/riscv/include/asm/vector.h:105:3: error: instruction requires the following: 'V' (Vector Extension for Application Processors), 'Zve32x' or 'Zve64x' (Vector Extensions for Embedded Processors)
                   "vsetvli        t4, x0, e8, m8, ta, ma\n\t"
                   ^
   <inline asm>:1:2: note: instantiated into assembly here
           vsetvli t4, x0, e8, m8, ta, ma
           ^
   In file included from arch/riscv/kernel/signal.c:20:
   In file included from arch/riscv/include/asm/switch_to.h:11:
   arch/riscv/include/asm/vector.h:105:36: error: instruction requires the following: 'V' (Vector Extension for Application Processors), 'Zve32x' or 'Zve64x' (Vector Extensions for Embedded Processors)
                   "vsetvli        t4, x0, e8, m8, ta, ma\n\t"
                                                           ^
   <inline asm>:2:2: note: instantiated into assembly here
           vle8.v          v0, (a1)
           ^
   In file included from arch/riscv/kernel/signal.c:20:
   In file included from arch/riscv/include/asm/switch_to.h:11:
   arch/riscv/include/asm/vector.h:107:21: error: instruction requires the following: 'V' (Vector Extension for Application Processors), 'Zve32x' or 'Zve64x' (Vector Extensions for Embedded Processors)
                   "add            %0, %0, t4\n\t"
                                               ^
   <inline asm>:4:2: note: instantiated into assembly here
           vle8.v          v8, (a1)
           ^
   In file included from arch/riscv/kernel/signal.c:20:
   In file included from arch/riscv/include/asm/switch_to.h:11:
   arch/riscv/include/asm/vector.h:109:21: error: instruction requires the following: 'V' (Vector Extension for Application Processors), 'Zve32x' or 'Zve64x' (Vector Extensions for Embedded Processors)
                   "add            %0, %0, t4\n\t"
                                               ^
   <inline asm>:6:2: note: instantiated into assembly here
           vle8.v          v16, (a1)
           ^
   In file included from arch/riscv/kernel/signal.c:20:
   In file included from arch/riscv/include/asm/switch_to.h:11:
   arch/riscv/include/asm/vector.h:111:21: error: instruction requires the following: 'V' (Vector Extension for Application Processors), 'Zve32x' or 'Zve64x' (Vector Extensions for Embedded Processors)
                   "add            %0, %0, t4\n\t"
                                               ^
   <inline asm>:8:2: note: instantiated into assembly here
           vle8.v          v24, (a1)
           ^
   In file included from arch/riscv/kernel/signal.c:20:
   In file included from arch/riscv/include/asm/switch_to.h:11:
   arch/riscv/include/asm/vector.h:75:3: error: instruction requires the following: 'V' (Vector Extension for Application Processors), 'Zve32x' or 'Zve64x' (Vector Extensions for Embedded Processors)
                   "vsetvl  x0, %2, %1\n\t"
                   ^
   <inline asm>:1:2: note: instantiated into assembly here
           vsetvl   x0, a3, a2
           ^
   In file included from arch/riscv/kernel/signal.c:20:
   In file included from arch/riscv/include/asm/switch_to.h:11:
>> arch/riscv/include/asm/vector.h:88:3: error: instruction requires the following: 'V' (Vector Extension for Application Processors), 'Zve32x' or 'Zve64x' (Vector Extensions for Embedded Processors)
                   "vsetvli        t4, x0, e8, m8, ta, ma\n\t"
                   ^
   <inline asm>:1:2: note: instantiated into assembly here
           vsetvli t4, x0, e8, m8, ta, ma
           ^
   In file included from arch/riscv/kernel/signal.c:20:
   In file included from arch/riscv/include/asm/switch_to.h:11:
   arch/riscv/include/asm/vector.h:88:36: error: instruction requires the following: 'V' (Vector Extension for Application Processors), 'Zve32x' or 'Zve64x' (Vector Extensions for Embedded Processors)
                   "vsetvli        t4, x0, e8, m8, ta, ma\n\t"
                                                           ^
   <inline asm>:2:2: note: instantiated into assembly here
           vse8.v          v0, (a1)
           ^
   In file included from arch/riscv/kernel/signal.c:20:
   In file included from arch/riscv/include/asm/switch_to.h:11:
   arch/riscv/include/asm/vector.h:90:21: error: instruction requires the following: 'V' (Vector Extension for Application Processors), 'Zve32x' or 'Zve64x' (Vector Extensions for Embedded Processors)
                   "add            %0, %0, t4\n\t"
                                               ^
   <inline asm>:4:2: note: instantiated into assembly here
           vse8.v          v8, (a1)
           ^
   In file included from arch/riscv/kernel/signal.c:20:
   In file included from arch/riscv/include/asm/switch_to.h:11:
   arch/riscv/include/asm/vector.h:92:21: error: instruction requires the following: 'V' (Vector Extension for Application Processors), 'Zve32x' or 'Zve64x' (Vector Extensions for Embedded Processors)
                   "add            %0, %0, t4\n\t"
                                               ^
   <inline asm>:6:2: note: instantiated into assembly here
           vse8.v          v16, (a1)
           ^
   In file included from arch/riscv/kernel/signal.c:20:
   In file included from arch/riscv/include/asm/switch_to.h:11:
   arch/riscv/include/asm/vector.h:94:21: error: instruction requires the following: 'V' (Vector Extension for Application Processors), 'Zve32x' or 'Zve64x' (Vector Extensions for Embedded Processors)
                   "add            %0, %0, t4\n\t"
                                               ^
   <inline asm>:8:2: note: instantiated into assembly here
           vse8.v          v24, (a1)
           ^
   11 errors generated.
--
>> arch/riscv/kernel/vector.c:50:3: error: expected expression
                   u32 width = RVV_EXRACT_VL_VS_WIDTH(insn_buf);
                   ^
>> arch/riscv/kernel/vector.c:52:7: error: use of undeclared identifier 'width'
                   if (width == RVV_VL_VS_WIDTH_8 || width == RVV_VL_VS_WIDTH_16 ||
                       ^
   arch/riscv/kernel/vector.c:52:37: error: use of undeclared identifier 'width'
                   if (width == RVV_VL_VS_WIDTH_8 || width == RVV_VL_VS_WIDTH_16 ||
                                                     ^
   arch/riscv/kernel/vector.c:53:7: error: use of undeclared identifier 'width'
                       width == RVV_VL_VS_WIDTH_32 || width == RVV_VL_VS_WIDTH_64)
                       ^
   arch/riscv/kernel/vector.c:53:38: error: use of undeclared identifier 'width'
                       width == RVV_VL_VS_WIDTH_32 || width == RVV_VL_VS_WIDTH_64)
                                                      ^
   arch/riscv/kernel/vector.c:57:3: error: expected expression
                   u32 csr = RVG_EXTRACT_SYSTEM_CSR(insn_buf);
                   ^
>> arch/riscv/kernel/vector.c:59:8: error: use of undeclared identifier 'csr'
                   if ((csr >= CSR_VSTART && csr <= CSR_VCSR) ||
                        ^
   arch/riscv/kernel/vector.c:59:29: error: use of undeclared identifier 'csr'
                   if ((csr >= CSR_VSTART && csr <= CSR_VCSR) ||
                                             ^
   arch/riscv/kernel/vector.c:60:8: error: use of undeclared identifier 'csr'
                       (csr >= CSR_VL && csr <= CSR_VLENB))
                        ^
   arch/riscv/kernel/vector.c:60:25: error: use of undeclared identifier 'csr'
                       (csr >= CSR_VL && csr <= CSR_VLENB))
                                         ^
>> arch/riscv/kernel/vector.c:67:5: warning: no previous prototype for function 'riscv_v_thread_zalloc' [-Wmissing-prototypes]
   int riscv_v_thread_zalloc(void)
       ^
   arch/riscv/kernel/vector.c:67:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int riscv_v_thread_zalloc(void)
   ^
   static 
   1 warning and 10 errors generated.


vim +88 arch/riscv/include/asm/vector.h

27038c69020be5 Greentime Hu 2023-02-24  81  
e296a266de6c10 Greentime Hu 2023-02-24  82  static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
e296a266de6c10 Greentime Hu 2023-02-24  83  					 void *datap)
27038c69020be5 Greentime Hu 2023-02-24  84  {
27038c69020be5 Greentime Hu 2023-02-24  85  	riscv_v_enable();
27038c69020be5 Greentime Hu 2023-02-24  86  	__vstate_csr_save(save_to);
27038c69020be5 Greentime Hu 2023-02-24  87  	asm volatile (
27038c69020be5 Greentime Hu 2023-02-24 @88  		"vsetvli	t4, x0, e8, m8, ta, ma\n\t"
27038c69020be5 Greentime Hu 2023-02-24  89  		"vse8.v		v0, (%0)\n\t"
27038c69020be5 Greentime Hu 2023-02-24  90  		"add		%0, %0, t4\n\t"
27038c69020be5 Greentime Hu 2023-02-24  91  		"vse8.v		v8, (%0)\n\t"
27038c69020be5 Greentime Hu 2023-02-24  92  		"add		%0, %0, t4\n\t"
27038c69020be5 Greentime Hu 2023-02-24  93  		"vse8.v		v16, (%0)\n\t"
27038c69020be5 Greentime Hu 2023-02-24  94  		"add		%0, %0, t4\n\t"
27038c69020be5 Greentime Hu 2023-02-24  95  		"vse8.v		v24, (%0)\n\t"
27038c69020be5 Greentime Hu 2023-02-24  96  		: : "r" (datap) : "t4", "memory");
27038c69020be5 Greentime Hu 2023-02-24  97  	riscv_v_disable();
27038c69020be5 Greentime Hu 2023-02-24  98  }
27038c69020be5 Greentime Hu 2023-02-24  99  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

