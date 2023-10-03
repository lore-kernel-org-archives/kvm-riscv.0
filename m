From: kernel test robot <lkp@intel.com>
Date: Tue, 3 Oct 2023 14:25:42 +0800
Subject: [PATCH 2/5] mm: Introduce pudp/p4dp/pgdp_get() functions
In-Reply-To: <20231002151031.110551-3-alexghiti@rivosinc.com>
References: <20231002151031.110551-3-alexghiti@rivosinc.com>
Message-ID: <202310031431.NkMgiRBL-lkp@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Alexandre,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6-rc4 next-20231003]
[cannot apply to efi/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Use-WRITE_ONCE-when-setting-page-table-entries/20231002-231725
base:   linus/master
patch link:    https://lore.kernel.org/r/20231002151031.110551-3-alexghiti%40rivosinc.com
patch subject: [PATCH 2/5] mm: Introduce pudp/p4dp/pgdp_get() functions
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20231003/202310031431.NkMgiRBL-lkp at intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310031431.NkMgiRBL-lkp at intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310031431.NkMgiRBL-lkp at intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/mm.h:29,
                    from arch/arm/kernel/asm-offsets.c:12:
>> include/linux/pgtable.h:310:21: error: 'pgdp_get' declared as function returning an array
     310 | static inline pgd_t pgdp_get(pgd_t *pgdp)
         |                     ^~~~~~~~
   In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:246,
                    from arch/arm/kernel/asm-offsets.c:10:
   include/linux/pgtable.h: In function 'pgdp_get':
>> include/asm-generic/rwonce.h:48:2: warning: returning 'const volatile pmdval_t *' {aka 'const volatile unsigned int *'} from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
      48 | ({                                                                      \
         | ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |         __READ_ONCE(x);                                                 \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      51 | })
         | ~~
   include/linux/pgtable.h:312:16: note: in expansion of macro 'READ_ONCE'
     312 |         return READ_ONCE(*pgdp);
         |                ^~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/arm/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/pgdp_get +310 include/linux/pgtable.h

   308	
   309	#ifndef pgdp_get
 > 310	static inline pgd_t pgdp_get(pgd_t *pgdp)
   311	{
   312		return READ_ONCE(*pgdp);
   313	}
   314	#endif
   315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

