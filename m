Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D379D12694
	for <kvm-riscv@archiver.kernel.org>; Wed,  3 Dec 2025 10:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/2Qh5lFkdUmpzoM9/BTrlcEAQprHDCjhVVj+bx2Pt6g=; b=nLoeR0nPE1s/Vd
	d5WFqiCo7WIe4sEoAcozI1jqsXEROVQ7uje/witHuwQspF0caJLIycKOWgCRciWkkAQnec0Ml001J
	MxTdvrIPFOJIKhkcoIdSaD7gLjaSLSl5v8y8ViuB1zy+eEeOO+8iQ39dKO353o0DBvVwsQinRfj0Y
	Hj3/pk+ta0IOq/tUKL/ltglRtxWuFjO1Qmnp5hY5PuromC4Fcvz4PPlBTpfTSa0K1jK7EhWjELtjj
	mafebZrbALa5Wu2rum9lxSwbQ3Bi7ydXzv8VEHRxBiFzKcjAg4dXejaisyRZACu4Qdu6kHPYbIxSI
	O86/vN7ZxIaGDnvy6SYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQkUO-00000006TKy-2Oer;
	Wed, 03 Dec 2025 10:53:40 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQkUL-00000006TKT-3MBO;
	Wed, 03 Dec 2025 10:53:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764759218; x=1796295218;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/lMt6d6wt5EpklsqUXRg85Drw1rS3QE+lNt8vHdf2Do=;
  b=R9zMI1V/sj98zCRoRZpXYgJxnLn8pEQrLRQLTJa417/JLByGaBlNS6WZ
   kk5BnvhVSQMftl4Tn5OAv7hjHa2Jrv+4X7X5h07G0VYhuO4RRfLzWswVI
   mR2PDx5rAXwfVYXaRjk5FqOI1vH5NNRuoyLh+gJqsF2CHWqJghYiQY6BI
   xcp4anEiIWoPQ2obTDE6oqVgcwd4amTXxR72V7YcDUuwV0HZUHCq1CmJB
   dHI5zSK+q3mURI0PSUic0ha/fuRXaO04h+UGce4C3FLRRI8vrIaaS4Alg
   FzYdGxV2dNK2iBEWRdI3wlsHI4VQ/CsU1FEW7osS6jTgBI9uhT0eoGlte
   g==;
X-CSE-ConnectionGUID: Wsswd+OtRFmFANBwN+5Zow==
X-CSE-MsgGUID: 6X5d/uBxTEq5Fz0fBvsEOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77428990"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="77428990"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 02:53:35 -0800
X-CSE-ConnectionGUID: m/uL1YpIQeaVmK5xAQXRYg==
X-CSE-MsgGUID: D0vFuoSVTtCTr+d7xR1F3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="231989776"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Dec 2025 02:53:31 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQkUC-00000000AtZ-3diz;
	Wed, 03 Dec 2025 10:53:28 +0000
Date: Wed, 3 Dec 2025 18:52:48 +0800
From: kernel test robot <lkp@intel.com>
To: zhouquan@iscas.ac.cn, anup@brainfault.org, ajones@ventanamicro.com,
	atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, Quan Zhou <zhouquan@iscas.ac.cn>
Subject: Re: [PATCH 3/4] RISC-V: KVM: Add suuport for zicfiss/zicfilp/svadu
 FWFT features
Message-ID: <202512031835.rfeAWiCJ-lkp@intel.com>
References: <1793aa636969da0a09d27c9c12f6d5f8f0d1cd21.1764509485.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1793aa636969da0a09d27c9c12f6d5f8f0d1cd21.1764509485.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_025337_884535_5765014C 
X-CRM114-Status: GOOD (  11.03  )
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

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on kvm/queue]
[also build test ERROR on kvm/next linus/master v6.18 next-20251203]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zhouquan-iscas-ac-cn/RISC-V-KVM-Allow-zicfiss-zicfilp-exts-for-Guest-VM/20251201-094857
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/1793aa636969da0a09d27c9c12f6d5f8f0d1cd21.1764509485.git.zhouquan%40iscas.ac.cn
patch subject: [PATCH 3/4] RISC-V: KVM: Add suuport for zicfiss/zicfilp/svadu FWFT features
config: riscv-randconfig-001-20251203 (https://download.01.org/0day-ci/archive/20251203/202512031835.rfeAWiCJ-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031835.rfeAWiCJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512031835.rfeAWiCJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu_sbi_fwft.c:345:30: error: 'kvm_sbi_fwft_landing_pad_supported' undeclared here (not in a function)
     345 |                 .supported = kvm_sbi_fwft_landing_pad_supported,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kvm/vcpu_sbi_fwft.c:346:26: error: 'kvm_sbi_fwft_reset_landing_pad' undeclared here (not in a function)
     346 |                 .reset = kvm_sbi_fwft_reset_landing_pad,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kvm/vcpu_sbi_fwft.c:347:24: error: 'kvm_sbi_fwft_set_landing_pad' undeclared here (not in a function)
     347 |                 .set = kvm_sbi_fwft_set_landing_pad,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kvm/vcpu_sbi_fwft.c:348:24: error: 'kvm_sbi_fwft_get_landing_pad' undeclared here (not in a function)
     348 |                 .get = kvm_sbi_fwft_get_landing_pad,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kvm/vcpu_sbi_fwft.c:354:30: error: 'kvm_sbi_fwft_shadow_stack_supported' undeclared here (not in a function)
     354 |                 .supported = kvm_sbi_fwft_shadow_stack_supported,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kvm/vcpu_sbi_fwft.c:355:26: error: 'kvm_sbi_fwft_reset_shadow_stack' undeclared here (not in a function)
     355 |                 .reset = kvm_sbi_fwft_reset_shadow_stack,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kvm/vcpu_sbi_fwft.c:356:24: error: 'kvm_sbi_fwft_set_shadow_stack' undeclared here (not in a function)
     356 |                 .set = kvm_sbi_fwft_set_shadow_stack,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kvm/vcpu_sbi_fwft.c:357:24: error: 'kvm_sbi_fwft_get_shadow_stack' undeclared here (not in a function)
     357 |                 .get = kvm_sbi_fwft_get_shadow_stack,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kvm/vcpu_sbi_fwft.c:363:30: error: 'kvm_sbi_fwft_pte_ad_hw_updating_supported' undeclared here (not in a function)
     363 |                 .supported = kvm_sbi_fwft_pte_ad_hw_updating_supported,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kvm/vcpu_sbi_fwft.c:364:26: error: 'kvm_sbi_fwft_reset_pte_ad_hw_updating' undeclared here (not in a function)
     364 |                 .reset = kvm_sbi_fwft_reset_pte_ad_hw_updating,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kvm/vcpu_sbi_fwft.c:365:24: error: 'kvm_sbi_fwft_set_pte_ad_hw_updating' undeclared here (not in a function)
     365 |                 .set = kvm_sbi_fwft_set_pte_ad_hw_updating,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kvm/vcpu_sbi_fwft.c:366:24: error: 'kvm_sbi_fwft_get_pte_ad_hw_updating' undeclared here (not in a function)
     366 |                 .get = kvm_sbi_fwft_get_pte_ad_hw_updating,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kvm_sbi_fwft_landing_pad_supported +345 arch/riscv/kvm/vcpu_sbi_fwft.c

   319	
   320	static const struct kvm_sbi_fwft_feature features[] = {
   321		{
   322			.id = SBI_FWFT_MISALIGNED_EXC_DELEG,
   323			.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, misaligned_deleg.enable) /
   324					 sizeof(unsigned long),
   325			.supported = kvm_sbi_fwft_misaligned_delegation_supported,
   326			.reset = kvm_sbi_fwft_reset_misaligned_delegation,
   327			.set = kvm_sbi_fwft_set_misaligned_delegation,
   328			.get = kvm_sbi_fwft_get_misaligned_delegation,
   329		},
   330	#ifndef CONFIG_32BIT
   331		{
   332			.id = SBI_FWFT_POINTER_MASKING_PMLEN,
   333			.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, pointer_masking.enable) /
   334					 sizeof(unsigned long),
   335			.supported = kvm_sbi_fwft_pointer_masking_pmlen_supported,
   336			.reset = kvm_sbi_fwft_reset_pointer_masking_pmlen,
   337			.set = kvm_sbi_fwft_set_pointer_masking_pmlen,
   338			.get = kvm_sbi_fwft_get_pointer_masking_pmlen,
   339		},
   340	#endif
   341		{
   342			.id = SBI_FWFT_LANDING_PAD,
   343			.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, landing_pad.enable) /
   344					 sizeof(unsigned long),
 > 345			.supported = kvm_sbi_fwft_landing_pad_supported,
 > 346			.reset = kvm_sbi_fwft_reset_landing_pad,
 > 347			.set = kvm_sbi_fwft_set_landing_pad,
 > 348			.get = kvm_sbi_fwft_get_landing_pad,
   349		},
   350		{
   351			.id = SBI_FWFT_SHADOW_STACK,
   352			.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, shadow_stack.enable) /
   353					 sizeof(unsigned long),
 > 354			.supported = kvm_sbi_fwft_shadow_stack_supported,
 > 355			.reset = kvm_sbi_fwft_reset_shadow_stack,
 > 356			.set = kvm_sbi_fwft_set_shadow_stack,
 > 357			.get = kvm_sbi_fwft_get_shadow_stack,
   358		},
   359		{
   360			.id = SBI_FWFT_PTE_AD_HW_UPDATING,
   361			.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, pte_ad_hw_updating.enable) /
   362					 sizeof(unsigned long),
 > 363			.supported = kvm_sbi_fwft_pte_ad_hw_updating_supported,
 > 364			.reset = kvm_sbi_fwft_reset_pte_ad_hw_updating,
 > 365			.set = kvm_sbi_fwft_set_pte_ad_hw_updating,
 > 366			.get = kvm_sbi_fwft_get_pte_ad_hw_updating,
   367		},
   368	};
   369	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
