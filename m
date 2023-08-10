From: kernel test robot <lkp@intel.com>
Date: Thu, 10 Aug 2023 09:40:42 +0800
Subject: [PATCH v8 11/14] KVM: arm64: Implement
 kvm_arch_flush_remote_tlbs_range()
In-Reply-To: <20230808231330.3855936-12-rananta@google.com>
References: <20230808231330.3855936-12-rananta@google.com>
Message-ID: <202308100953.kGcDpe5z-lkp@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Raghavendra,

kernel test robot noticed the following build errors:

[auto build test ERROR on kvm/queue]
[also build test ERROR on kvmarm/next arm64/for-next/core linus/master v6.5-rc5 next-20230809]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raghavendra-Rao-Ananta/KVM-Rename-kvm_arch_flush_remote_tlb-to-kvm_arch_flush_remote_tlbs/20230809-071643
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20230808231330.3855936-12-rananta%40google.com
patch subject: [PATCH v8 11/14] KVM: arm64: Implement kvm_arch_flush_remote_tlbs_range()
config: arm64-randconfig-r023-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100953.kGcDpe5z-lkp at intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100953.kGcDpe5z-lkp at intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100953.kGcDpe5z-lkp at intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/mmu.c:179:5: error: use of undeclared identifier 'start_gfn'
                                   start_gfn << PAGE_SHIFT, nr_pages << PAGE_SHIFT);
                                   ^
   1 error generated.


vim +/start_gfn +179 arch/arm64/kvm/mmu.c

   174	
   175	int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
   176					      gfn_t gfn, u64 nr_pages)
   177	{
   178		kvm_tlb_flush_vmid_range(&kvm->arch.mmu,
 > 179					start_gfn << PAGE_SHIFT, nr_pages << PAGE_SHIFT);
   180		return 0;
   181	}
   182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

