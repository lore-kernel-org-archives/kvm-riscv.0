From: kernel test robot <lkp@intel.com>
Date: Sat, 22 Apr 2023 03:43:03 +0800
Subject: [PATCH 7/9] KVM: mmu: Move mmu lock/unlock to arch code for
 clear dirty log
In-Reply-To: <20230421165305.804301-8-vipinsh@google.com>
References: <20230421165305.804301-8-vipinsh@google.com>
Message-ID: <202304220315.bpwbgH5n-lkp@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Vipin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 95b9779c1758f03cf494e8550d6249a40089ed1c]

url:    https://github.com/intel-lab-lkp/linux/commits/Vipin-Sharma/KVM-selftests-Allow-dirty_log_perf_test-to-clear-dirty-memory-in-chunks/20230422-005708
base:   95b9779c1758f03cf494e8550d6249a40089ed1c
patch link:    https://lore.kernel.org/r/20230421165305.804301-8-vipinsh%40google.com
patch subject: [PATCH 7/9] KVM: mmu: Move mmu lock/unlock to arch code for clear dirty log
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20230422/202304220315.bpwbgH5n-lkp at intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e7505b53d53e3bb5e7f1c43233ef3644673edb75
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vipin-Sharma/KVM-selftests-Allow-dirty_log_perf_test-to-clear-dirty-memory-in-chunks/20230422-005708
        git checkout e7505b53d53e3bb5e7f1c43233ef3644673edb75
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304220315.bpwbgH5n-lkp at intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/kvm/mmu.c: In function 'kvm_arch_mmu_enable_log_dirty_pt_masked':
>> arch/riscv/kvm/mmu.c:399:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     399 |         phys_addr_t base_gfn = slot->base_gfn + gfn_offset;
         |         ^~~~~~~~~~~


vim +399 arch/riscv/kvm/mmu.c

c9d57373fc87a3 Anup Patel   2022-07-29  392  
9d05c1fee83757 Anup Patel   2021-09-27  393  void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
9d05c1fee83757 Anup Patel   2021-09-27  394  					     struct kvm_memory_slot *slot,
9d05c1fee83757 Anup Patel   2021-09-27  395  					     gfn_t gfn_offset,
9d05c1fee83757 Anup Patel   2021-09-27  396  					     unsigned long mask)
9d05c1fee83757 Anup Patel   2021-09-27  397  {
e7505b53d53e3b Vipin Sharma 2023-04-21  398  	spin_lock(&kvm->mmu_lock);
9d05c1fee83757 Anup Patel   2021-09-27 @399  	phys_addr_t base_gfn = slot->base_gfn + gfn_offset;
9d05c1fee83757 Anup Patel   2021-09-27  400  	phys_addr_t start = (base_gfn +  __ffs(mask)) << PAGE_SHIFT;
9d05c1fee83757 Anup Patel   2021-09-27  401  	phys_addr_t end = (base_gfn + __fls(mask) + 1) << PAGE_SHIFT;
9d05c1fee83757 Anup Patel   2021-09-27  402  
26708234eb12e7 Anup Patel   2022-05-09  403  	gstage_wp_range(kvm, start, end);
e7505b53d53e3b Vipin Sharma 2023-04-21  404  	spin_unlock(&kvm->mmu_lock);
9d05c1fee83757 Anup Patel   2021-09-27  405  }
99cdc6c18c2d81 Anup Patel   2021-09-27  406  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

