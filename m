Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFEDCCD1AB
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 21:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OrYDrIurfo2xkszE08U/rNdqltAnYBUnlUD1w71oKGQ=; b=PMdiFBIXdTzECU
	nd8mfQvckkIjWSScxkMt+PYYIFZr07bOshhpCIeSJSaLhKleRHWeVcOZxetCKoo+vieoE4DAXh3Cx
	5cZDhAeympXYCOU3A4I2j2F0XsIVoQVOfVGo0i6DQQxrYCG+gJkyUnXVHkOJl3SEQU8bXhHB23dYq
	SByiZFTFkGso+I2p4pDkjIHESCOcCvMC//HNmzvzwU3FnfsLUeKuxEQs+qiZz2l1MqgE83cJCcq1F
	wqRqwI0QPkDOjFEp0Auwa2YX5wMuSvob1ebXlggvGqjovmfJNXbVmb8g2e8odX13UN+TqAVz4zuLv
	UQQH4kRUKaUOfoDHhntg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBgMj-00000004M7L-25jH;
	Wed, 22 Oct 2025 21:27:29 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBgMh-00000004M6s-2JEc;
	Wed, 22 Oct 2025 21:27:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761168448; x=1792704448;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WiMs1xpZodP+AahM3EmYiWvuRtlOth2p+dvocAU0+Ps=;
  b=dCrChvonepqMA8Vi9TLwBJBwQlV5sOsjPsLsYApjDGHGj6jwerhcci/2
   5pz/wlxMTFkRz1azNmERbNDkenT8iyG6eJoWxuPZU61KIlaVYuGdRMWUq
   KDFx1OY/jDSmE0Rhs+f6e/B9uaNcuHGdpShlWXe6NR8VEUFeE3cmHFqrG
   YdHcBbn6Hl+uqdXEe2X8ZP2bSSlhqW6gf3T3mkA/XlUldR6ov/dlZcPzf
   lh6ZW4ILmUxN6X19wAox73ue3xf8NZvY+i2Bxwe+5Oa+pvxfly786l9Uq
   /acbxp+Appp1974QPxRF1xVkGDuccG26pBSI5Z9fUHhnFHEmrRibonS6P
   w==;
X-CSE-ConnectionGUID: pca4+KkNSe2i1/hbRgZU2w==
X-CSE-MsgGUID: Vx6t8+NiRBCVTOKgqryDkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73619148"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="73619148"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 14:27:26 -0700
X-CSE-ConnectionGUID: Hn3uYEjxSHWXFpHLNJbY2w==
X-CSE-MsgGUID: IlNYzEUUQVWqYLMCZCVVfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="189102196"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 22 Oct 2025 14:27:22 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBgMa-000Ck1-07;
	Wed, 22 Oct 2025 21:27:20 +0000
Date: Thu, 23 Oct 2025 05:27:01 +0800
From: kernel test robot <lkp@intel.com>
To: Hui Min Mina Chou <minachou@andestech.com>, anup@brainfault.org,
	atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: oe-kbuild-all@lists.linux.dev, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, tim609@andestech.com,
	minachou@andestech.com, ben717@andestech.com, az70021@gmail.com
Subject: Re: [PATCH v2] RISC-V: KVM: flush VS-stage TLB after VCPU migration
 to prevent stale entries
Message-ID: <202510230552.uCekjUFE-lkp@intel.com>
References: <20251021083105.4029305-1-minachou@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251021083105.4029305-1-minachou@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_142727_640329_AC1067DD 
X-CRM114-Status: GOOD (  11.81  )
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

Hi Hui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[also build test WARNING on kvm/next mst-vhost/linux-next linus/master v6.18-rc2 next-20251022]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hui-Min-Mina-Chou/RISC-V-KVM-flush-VS-stage-TLB-after-VCPU-migration-to-prevent-stale-entries/20251021-163357
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20251021083105.4029305-1-minachou%40andestech.com
patch subject: [PATCH v2] RISC-V: KVM: flush VS-stage TLB after VCPU migration to prevent stale entries
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20251023/202510230552.uCekjUFE-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230552.uCekjUFE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230552.uCekjUFE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/vmid.c:126:6: warning: no previous prototype for function 'kvm_riscv_local_tlb_sanitize' [-Wmissing-prototypes]
     126 | void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu)
         |      ^
   arch/riscv/kvm/vmid.c:126:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     126 | void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu)
         | ^
         | static 
   1 warning generated.


vim +/kvm_riscv_local_tlb_sanitize +126 arch/riscv/kvm/vmid.c

   125	
 > 126	void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
