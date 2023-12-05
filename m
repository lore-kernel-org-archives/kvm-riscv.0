From: kernel test robot <lkp@intel.com>
Date: Tue, 5 Dec 2023 21:22:10 +0800
Subject: [PATCH 3/3] RISC-V: KVM: add vector CSRs in KVM_GET_REG_LIST
In-Reply-To: <20231204182905.2163676-4-dbarboza@ventanamicro.com>
References: <20231204182905.2163676-4-dbarboza@ventanamicro.com>
Message-ID: <202312052128.oBSS3Uus-lkp@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[also build test WARNING on mst-vhost/linux-next linus/master v6.7-rc4 next-20231205]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Henrique-Barboza/RISC-V-KVM-set-vlenb-in-kvm_riscv_vcpu_alloc_vector_context/20231205-023109
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20231204182905.2163676-4-dbarboza%40ventanamicro.com
patch subject: [PATCH 3/3] RISC-V: KVM: add vector CSRs in KVM_GET_REG_LIST
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20231205/202312052128.oBSS3Uus-lkp at intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312052128.oBSS3Uus-lkp at intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312052128.oBSS3Uus-lkp at intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/kvm/vcpu_onereg.c: In function 'num_vector_regs':
>> arch/riscv/kvm/vcpu_onereg.c:991:39: warning: unused variable 'cntx' [-Wunused-variable]
     991 |         const struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
         |                                       ^~~~


vim +/cntx +991 arch/riscv/kvm/vcpu_onereg.c

   988	
   989	static inline unsigned long num_vector_regs(const struct kvm_vcpu *vcpu)
   990	{
 > 991		const struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
   992	
   993		if (!riscv_isa_extension_available(vcpu->arch.isa, v))
   994			return 0;
   995	
   996		/* vstart, vl, vtype, vcsr, vlenb; */
   997		return 5;
   998	}
   999	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

