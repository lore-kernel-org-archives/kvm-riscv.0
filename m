Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFA0C55174
	for <kvm-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 05:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V1LVwR+XyDeFDiEOpwEnpWZb7W1Jh0J3eNtUUv9jKgM=; b=213hgVOZfkJQ2u
	rYzQkJMH2M5g2yJ5AxdWBYQ3y0jmdMwjBQCATE5ek9bzBXA718DfpkdLvXvc+a33k9sPIc13SWyda
	77CxFpJYscpvR6FEelIZQyDVzqHDtmHkSlgxBPH7P14MqdcW4Ees0hqvfW7UgeKwJ08nnlbhxPkO2
	c+/yORyjFYFkbfseLyD8mEHHOZ1fVi5yF9pDwZ3ApyNJFNdBOXLvUmAjc8Oca6WAsivouWwvKz93e
	eQVyx6HRUhwxL/+zEMvIY3pncUO6BgPUtgiu58v55piuhfYUK7CIppAV+S8DoPd/vUnft11izKytF
	Zs+n33do4qB2rv6Y//VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrTum-00000003FMH-20Xw;
	Wed, 05 Aug 2026 05:11:40 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrTuj-00000003FLi-2veN;
	Wed, 05 Aug 2026 05:11:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785906697; x=1817442697;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tqBGZ8a6QCjVzDpBTVmGzHyX+FhioNp1HRZLPvbKiWM=;
  b=Ivdrmb1DUzd0dL4J2e5iwjANByLs0fZuGY2MDT4YMq7fmMlfvDqYQd12
   zGsTjzlHdZ+xVc3vTYuPfEbdwa+rKslKiBcO9AJzyZKcS7AHBaY5GH04v
   kQ00h7C4xY/aY2yLN5nDFQhKyW7oA5k3p6wf6yHjaiwBALaUt7q2rm6p/
   HOD/r0CCoZRM+EnOP2kX79+a7AVLoYohqce+9zxBXfc3mFm9QNB4mw6Zn
   6yKmk1usfT7NbTgjM+q8Cb8A1RyEpHhwEL47LellXKX30xXnPEI9QMlfn
   eGf4DYt2HE8749Ic8uDZtwEpShCEtvvfOpL26yyYaEtthlxufyUQgfQfM
   A==;
X-CSE-ConnectionGUID: /SF14e+vSZ2cZZzmSA50Rg==
X-CSE-MsgGUID: nSptb3YvS3KVHLovrGIDwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="74007181"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="74007181"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 22:11:34 -0700
X-CSE-ConnectionGUID: pSs3JMSkToOze32GLjQk2g==
X-CSE-MsgGUID: 1bvSYkESQb+loZNv3D8xNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="265950761"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Aug 2026 22:11:31 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrTua-00000000Bbl-1jrS;
	Wed, 05 Aug 2026 05:11:28 +0000
Date: Wed, 5 Aug 2026 13:11:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Yuhang.Chen" <yhchen312@gmail.com>, Anup Patel <anup@brainfault.org>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Quan Zhou <zhouquan@iscas.ac.cn>, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: KVM: Add kvm-riscv.wfi_trap_policy to control
 VS-mode WFI trapping
Message-ID: <202608051354.KYOXP5po-lkp@intel.com>
References: <20260804024707.2400404-1-yhchen312@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260804024707.2400404-1-yhchen312@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_221137_796505_970A50BF 
X-CRM114-Status: GOOD (  12.16  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Hi Yuhang.Chen,

kernel test robot noticed the following build errors:

[auto build test ERROR on kvm/queue]
[also build test ERROR on kvm/next mst-vhost/linux-next linus/master v7.2-rc6 next-20260804]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuhang-Chen/RISC-V-KVM-Add-kvm-riscv-wfi_trap_policy-to-control-VS-mode-WFI-trapping/20260805-030043
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20260804024707.2400404-1-yhchen312%40gmail.com
patch subject: [PATCH v2] RISC-V: KVM: Add kvm-riscv.wfi_trap_policy to control VS-mode WFI trapping
config: riscv-randconfig-001-20260805 (https://download.01.org/0day-ci/archive/20260805/202608051354.KYOXP5po-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608051354.KYOXP5po-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608051354.KYOXP5po-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu.c:60:13: error: expected declaration specifiers or '...' before string constant
    early_param("kvm-riscv.wfi_trap_policy", early_kvm_riscv_wfi_trap_policy_cfg);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kvm/vcpu.c:60:42: error: expected declaration specifiers or '...' before 'early_kvm_riscv_wfi_trap_policy_cfg'
    early_param("kvm-riscv.wfi_trap_policy", early_kvm_riscv_wfi_trap_policy_cfg);
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kvm/vcpu.c:43:19: warning: 'early_kvm_riscv_wfi_trap_policy_cfg' defined but not used [-Wunused-function]
    static int __init early_kvm_riscv_wfi_trap_policy_cfg(char *arg)
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +60 arch/riscv/kvm/vcpu.c

    39	
    40	static enum kvm_riscv_wfi_trap_policy kvm_riscv_wfi_trap_policy __read_mostly =
    41		KVM_RISCV_WFI_TRAP;
    42	
  > 43	static int __init early_kvm_riscv_wfi_trap_policy_cfg(char *arg)
    44	{
    45		if (!arg)
    46			return -EINVAL;
    47	
    48		if (strcmp(arg, "trap") == 0) {
    49			kvm_riscv_wfi_trap_policy = KVM_RISCV_WFI_TRAP;
    50			return 0;
    51		}
    52	
    53		if (strcmp(arg, "auto") == 0) {
    54			kvm_riscv_wfi_trap_policy = KVM_RISCV_WFI_AUTO;
    55			return 0;
    56		}
    57	
    58		return -EINVAL;
    59	}
  > 60	early_param("kvm-riscv.wfi_trap_policy", early_kvm_riscv_wfi_trap_policy_cfg);
    61	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
