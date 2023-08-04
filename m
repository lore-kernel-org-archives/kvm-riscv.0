From: kernel test robot <lkp@intel.com>
Date: Fri, 4 Aug 2023 13:16:55 +0800
Subject: [PATCH 10/10] RISC-V: Refactor bug and traps instructions
In-Reply-To: <20230803-master-refactor-instructions-v4-v1-10-2128e61fa4ff@rivosinc.com>
References: <20230803-master-refactor-instructions-v4-v1-10-2128e61fa4ff@rivosinc.com>
Message-ID: <202308041213.o49SRQWZ-lkp@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Charlie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4]

url:    https://github.com/intel-lab-lkp/linux/commits/Charlie-Jenkins/RISC-V-Expand-instruction-definitions/20230804-101437
base:   5d0c230f1de8c7515b6567d9afba1f196fb4e2f4
patch link:    https://lore.kernel.org/r/20230803-master-refactor-instructions-v4-v1-10-2128e61fa4ff%40rivosinc.com
patch subject: [PATCH 10/10] RISC-V: Refactor bug and traps instructions
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20230804/202308041213.o49SRQWZ-lkp at intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308041213.o49SRQWZ-lkp at intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308041213.o49SRQWZ-lkp at intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/elf_kexec.c:326: warning: "RV_X" redefined
     326 | #define RV_X(x, s, n)  (((x) >> (s)) & ((1 << (n)) - 1))
         | 
   In file included from arch/riscv/include/asm/bug.h:14,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/ipc.h:5,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/compat.h:14,
                    from arch/riscv/include/asm/elf.h:12,
                    from include/linux/elf.h:6,
                    from arch/riscv/kernel/elf_kexec.c:15:
   arch/riscv/include/asm/insn.h:1915: note: this is the location of the previous definition
    1915 | #define RV_X(X, s, mask)  (((X) >> (s)) & (mask))
         | 


vim +/RV_X +326 arch/riscv/kernel/elf_kexec.c

6261586e0c91db1 Liao Chang 2022-04-08  325  
838b3e28488f702 Li Zhengyu 2022-04-08 @326  #define RV_X(x, s, n)  (((x) >> (s)) & ((1 << (n)) - 1))
838b3e28488f702 Li Zhengyu 2022-04-08  327  #define RISCV_IMM_BITS 12
838b3e28488f702 Li Zhengyu 2022-04-08  328  #define RISCV_IMM_REACH (1LL << RISCV_IMM_BITS)
838b3e28488f702 Li Zhengyu 2022-04-08  329  #define RISCV_CONST_HIGH_PART(x) \
838b3e28488f702 Li Zhengyu 2022-04-08  330  	(((x) + (RISCV_IMM_REACH >> 1)) & ~(RISCV_IMM_REACH - 1))
838b3e28488f702 Li Zhengyu 2022-04-08  331  #define RISCV_CONST_LOW_PART(x) ((x) - RISCV_CONST_HIGH_PART(x))
838b3e28488f702 Li Zhengyu 2022-04-08  332  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

