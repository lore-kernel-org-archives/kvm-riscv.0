From: kernel test robot <lkp@intel.com>
Date: Sat, 2 Apr 2022 15:01:16 +0800
Subject: [PATCH v3 16/23] KVM: x86/mmu: Cache the access bits of shadowed
 translations
In-Reply-To: <20220401175554.1931568-17-dmatlack@google.com>
References: <20220401175554.1931568-17-dmatlack@google.com>
Message-ID: <202204021411.oOhP2vFP-lkp@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi David,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 19164ad08bf668bca4f4bfbaacaa0a47c1b737a6]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Matlack/KVM-Extend-Eager-Page-Splitting-to-the-shadow-MMU/20220402-015911
base:   19164ad08bf668bca4f4bfbaacaa0a47c1b737a6
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220402/202204021411.oOhP2vFP-lkp at intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5f7a06676291033d880081035c2efae13702a0c4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-Matlack/KVM-Extend-Eager-Page-Splitting-to-the-shadow-MMU/20220402-015911
        git checkout 5f7a06676291033d880081035c2efae13702a0c4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/mmu/mmu.c:766:8: warning: format specifies type 'unsigned long long' but the argument has type 'int' [-Wformat]
                                      sp->role.access, access);
                                      ^~~~~~~~~~~~~~~
   include/linux/printk.h:654:45: note: expanded from macro 'pr_err_ratelimited'
           printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                              ~~~     ^~~~~~~~~~~
   include/linux/printk.h:640:17: note: expanded from macro 'printk_ratelimited'
                   printk(fmt, ##__VA_ARGS__);                             \
                          ~~~    ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
>> arch/x86/kvm/mmu/mmu.c:766:25: warning: format specifies type 'unsigned long long' but the argument has type 'u32' (aka 'unsigned int') [-Wformat]
                                      sp->role.access, access);
                                                       ^~~~~~
   include/linux/printk.h:654:45: note: expanded from macro 'pr_err_ratelimited'
           printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                              ~~~     ^~~~~~~~~~~
   include/linux/printk.h:640:17: note: expanded from macro 'printk_ratelimited'
                   printk(fmt, ##__VA_ARGS__);                             \
                          ~~~    ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   2 warnings generated.


vim +766 arch/x86/kvm/mmu/mmu.c

   754	
   755	static void kvm_mmu_page_set_access(struct kvm_mmu_page *sp, int index, u32 access)
   756	{
   757		if (!sp->role.direct) {
   758			sp->shadowed_translation[index].access = access;
   759			return;
   760		}
   761	
   762		if (WARN_ON(access != sp->role.access))
   763			pr_err_ratelimited("access mismatch under direct page %llx "
   764					   "(expected %llx, got %llx)\n",
   765					   kvm_mmu_page_get_gfn(sp, index),
 > 766					   sp->role.access, access);
   767	}
   768	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

