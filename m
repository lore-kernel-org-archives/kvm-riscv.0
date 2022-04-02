From: kernel test robot <lkp@intel.com>
Date: Sat, 2 Apr 2022 14:19:32 +0800
Subject: [PATCH v3 16/23] KVM: x86/mmu: Cache the access bits of shadowed
 translations
In-Reply-To: <20220401175554.1931568-17-dmatlack@google.com>
References: <20220401175554.1931568-17-dmatlack@google.com>
Message-ID: <202204021419.Rh6Pgcl9-lkp@intel.com>
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
config: x86_64-randconfig-a002 (https://download.01.org/0day-ci/archive/20220402/202204021419.Rh6Pgcl9-lkp at intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/5f7a06676291033d880081035c2efae13702a0c4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-Matlack/KVM-Extend-Eager-Page-Splitting-to-the-shadow-MMU/20220402-015911
        git checkout 5f7a06676291033d880081035c2efae13702a0c4
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:29,
                    from include/linux/cpumask.h:10,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from arch/x86/kvm/irq.h:13,
                    from arch/x86/kvm/mmu/mmu.c:18:
   arch/x86/kvm/mmu/mmu.c: In function 'kvm_mmu_page_set_access':
>> include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:418:25: note: in definition of macro 'printk_index_wrap'
     418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:640:17: note: in expansion of macro 'printk'
     640 |                 printk(fmt, ##__VA_ARGS__);                             \
         |                 ^~~~~~
   include/linux/printk.h:654:9: note: in expansion of macro 'printk_ratelimited'
     654 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:654:28: note: in expansion of macro 'KERN_ERR'
     654 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                            ^~~~~~~~
   arch/x86/kvm/mmu/mmu.c:763:17: note: in expansion of macro 'pr_err_ratelimited'
     763 |                 pr_err_ratelimited("access mismatch under direct page %llx "
         |                 ^~~~~~~~~~~~~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'u32' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:418:25: note: in definition of macro 'printk_index_wrap'
     418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:640:17: note: in expansion of macro 'printk'
     640 |                 printk(fmt, ##__VA_ARGS__);                             \
         |                 ^~~~~~
   include/linux/printk.h:654:9: note: in expansion of macro 'printk_ratelimited'
     654 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:654:28: note: in expansion of macro 'KERN_ERR'
     654 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                            ^~~~~~~~
   arch/x86/kvm/mmu/mmu.c:763:17: note: in expansion of macro 'pr_err_ratelimited'
     763 |                 pr_err_ratelimited("access mismatch under direct page %llx "
         |                 ^~~~~~~~~~~~~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a7 Joe Perches 2012-07-30  4  
04d2c8c83d0e3ac Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3ac Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3ac Joe Perches 2012-07-30  7  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

