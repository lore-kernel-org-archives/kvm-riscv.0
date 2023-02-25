From: kernel test robot <lkp@intel.com>
Date: Sat, 25 Feb 2023 16:28:02 +0800
Subject: [PATCH -next v14 19/19] riscv: Enable Vector code to be built
In-Reply-To: <20230224170118.16766-20-andy.chiu@sifive.com>
References: <20230224170118.16766-20-andy.chiu@sifive.com>
Message-ID: <202302251633.Tsr3ebfs-lkp@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Andy,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20230224]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Chiu/riscv-Rename-__switch_to_aux-fpu/20230225-011059
patch link:    https://lore.kernel.org/r/20230224170118.16766-20-andy.chiu%40sifive.com
patch subject: [PATCH -next v14 19/19] riscv: Enable Vector code to be built
config: riscv-randconfig-r042-20230223 (https://download.01.org/0day-ci/archive/20230225/202302251633.Tsr3ebfs-lkp at intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/cd0ad21a9ef9d63f1eef80fd3b09ae6e0d884ce3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Chiu/riscv-Rename-__switch_to_aux-fpu/20230225-011059
        git checkout cd0ad21a9ef9d63f1eef80fd3b09ae6e0d884ce3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302251633.Tsr3ebfs-lkp at intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/vector.c:67:5: warning: no previous prototype for 'riscv_v_thread_zalloc' [-Wmissing-prototypes]
      67 | int riscv_v_thread_zalloc(void)
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/riscv_v_thread_zalloc +67 arch/riscv/kernel/vector.c

b57b7b7279ef75 Andy Chiu 2023-02-24  66  
b57b7b7279ef75 Andy Chiu 2023-02-24 @67  int riscv_v_thread_zalloc(void)
b57b7b7279ef75 Andy Chiu 2023-02-24  68  {
b57b7b7279ef75 Andy Chiu 2023-02-24  69  	void *datap;
b57b7b7279ef75 Andy Chiu 2023-02-24  70  
b57b7b7279ef75 Andy Chiu 2023-02-24  71  	datap = kzalloc(riscv_v_vsize, GFP_KERNEL);
b57b7b7279ef75 Andy Chiu 2023-02-24  72  	if (!datap)
b57b7b7279ef75 Andy Chiu 2023-02-24  73  		return -ENOMEM;
b57b7b7279ef75 Andy Chiu 2023-02-24  74  	current->thread.vstate.datap = datap;
b57b7b7279ef75 Andy Chiu 2023-02-24  75  	memset(&current->thread.vstate, 0, offsetof(struct __riscv_v_ext_state,
b57b7b7279ef75 Andy Chiu 2023-02-24  76  						    datap));
b57b7b7279ef75 Andy Chiu 2023-02-24  77  	return 0;
b57b7b7279ef75 Andy Chiu 2023-02-24  78  }
b57b7b7279ef75 Andy Chiu 2023-02-24  79  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

