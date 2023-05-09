From: kernel test robot <lkp@intel.com>
Date: Wed, 10 May 2023 06:14:45 +0800
Subject: [PATCH -next v19 23/24] riscv: Enable Vector code to be built
In-Reply-To: <20230509103033.11285-24-andy.chiu@sifive.com>
References: <20230509103033.11285-24-andy.chiu@sifive.com>
Message-ID: <202305100615.JXidADRN-lkp@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230509]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Chiu/riscv-Rename-__switch_to_aux-fpu/20230509-183621
base:   next-20230509
patch link:    https://lore.kernel.org/r/20230509103033.11285-24-andy.chiu%40sifive.com
patch subject: [PATCH -next v19 23/24] riscv: Enable Vector code to be built
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230510/202305100615.JXidADRN-lkp at intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/cacd7c504c93b48a44b87516cfdbe417dca4d007
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Chiu/riscv-Rename-__switch_to_aux-fpu/20230509-183621
        git checkout cacd7c504c93b48a44b87516cfdbe417dca4d007
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305100615.JXidADRN-lkp at intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "riscv_v_user_allowed" [arch/riscv/kvm/kvm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

