From: kernel test robot <lkp@intel.com>
Date: Sat, 25 Feb 2023 01:34:28 -0000
Subject: [PATCH -next v14 19/19] riscv: Enable Vector code to be built
In-Reply-To: <20230224170118.16766-20-andy.chiu@sifive.com>
References: <20230224170118.16766-20-andy.chiu@sifive.com>
Message-ID: <202302250924.ukv4ZxOc-lkp@intel.com>
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
config: riscv-randconfig-r014-20230222 (https://download.01.org/0day-ci/archive/20230225/202302250924.ukv4ZxOc-lkp at intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/cd0ad21a9ef9d63f1eef80fd3b09ae6e0d884ce3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Chiu/riscv-Rename-__switch_to_aux-fpu/20230225-011059
        git checkout cd0ad21a9ef9d63f1eef80fd3b09ae6e0d884ce3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash lib/zstd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302250924.ukv4ZxOc-lkp at intel.com/

All warnings (new ones prefixed by >>):

>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
--
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
--
   lib/zstd/compress/huf_compress.c:471:16: warning: unused function 'HUF_isSorted' [-Wunused-function]
   MEM_STATIC int HUF_isSorted(nodeElt huffNode[], U32 const maxSymbolValue1) {
                  ^
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   1 warning generated.
--
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
--
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
--
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
--
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
--
   lib/zstd/compress/zstd_lazy.c:835:16: warning: unused function 'ZSTD_isAligned' [-Wunused-function]
   MEM_STATIC int ZSTD_isAligned(void const* ptr, size_t align) {
                  ^
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
>> warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   warning: Invalid size request on a scalable vector; Cannot implicitly convert a scalable size to a fixed-width size in `TypeSize::operator ScalarTy()`
   1 warning generated.
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

