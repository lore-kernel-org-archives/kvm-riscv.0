From: kernel test robot <lkp@intel.com>
Date: Sun, 24 Apr 2022 23:21:22 +0800
Subject: [PATCH v4 19/20] KVM: Allow for different capacities in
 kvm_mmu_memory_cache structs
In-Reply-To: <20220422210546.458943-20-dmatlack@google.com>
References: <20220422210546.458943-20-dmatlack@google.com>
Message-ID: <202204242355.T1SzNT9S-lkp@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi David,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on 150866cd0ec871c765181d145aa0912628289c8a]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Matlack/KVM-Extend-Eager-Page-Splitting-to-the-shadow-MMU/20220423-062108
base:   150866cd0ec871c765181d145aa0912628289c8a
config: riscv-randconfig-r016-20220424 (https://download.01.org/0day-ci/archive/20220424/202204242355.T1SzNT9S-lkp at intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/871c5afc76a6f414c03f433d06bacfd928910b1b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-Matlack/KVM-Extend-Eager-Page-Splitting-to-the-shadow-MMU/20220423-062108
        git checkout 871c5afc76a6f414c03f433d06bacfd928910b1b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/riscv/kvm/mmu.c:364:43: error: no member named 'cache' in 'struct kvm_mmu_memory_cache'
                   ret = kvm_mmu_topup_memory_cache(&cache.cache, stage2_pgd_levels);
                                                     ~~~~~ ^
   arch/riscv/kvm/mmu.c:369:39: error: no member named 'cache' in 'struct kvm_mmu_memory_cache'
                   ret = stage2_set_pte(kvm, 0, &cache.cache, addr, &pte);
                                                 ~~~~~ ^
   arch/riscv/kvm/mmu.c:378:35: error: no member named 'cache' in 'struct kvm_mmu_memory_cache'
           kvm_mmu_free_memory_cache(&cache.cache);
                                      ~~~~~ ^
   3 errors generated.


vim +364 arch/riscv/kvm/mmu.c

   342	
   343	static int stage2_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
   344				  unsigned long size, bool writable)
   345	{
   346		pte_t pte;
   347		int ret = 0;
   348		unsigned long pfn;
   349		phys_addr_t addr, end;
   350		struct kvm_mmu_memory_cache cache = {
   351			.capacity = KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE,
   352			.gfp_zero = __GFP_ZERO,
   353		};
   354	
   355		end = (gpa + size + PAGE_SIZE - 1) & PAGE_MASK;
   356		pfn = __phys_to_pfn(hpa);
   357	
   358		for (addr = gpa; addr < end; addr += PAGE_SIZE) {
   359			pte = pfn_pte(pfn, PAGE_KERNEL);
   360	
   361			if (!writable)
   362				pte = pte_wrprotect(pte);
   363	
 > 364			ret = kvm_mmu_topup_memory_cache(&cache.cache, stage2_pgd_levels);
   365			if (ret)
   366				goto out;
   367	
   368			spin_lock(&kvm->mmu_lock);
   369			ret = stage2_set_pte(kvm, 0, &cache.cache, addr, &pte);
   370			spin_unlock(&kvm->mmu_lock);
   371			if (ret)
   372				goto out;
   373	
   374			pfn++;
   375		}
   376	
   377	out:
   378		kvm_mmu_free_memory_cache(&cache.cache);
   379		return ret;
   380	}
   381	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

