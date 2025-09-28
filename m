Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3DDCAC5BB
	for <kvm-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 15:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3zUKLALVicfOeVGlX91+/rgN2Ri69WrV7zCcORmZf0=; b=Aq3WRcitSRKMR1
	5ZLY52mG+Yi/Dcr4tFUapwA5GyQ7NaMAxiRkGUTD5LmReZFzy6aEboU0i9fo1tzG37aeJKckFECdh
	tmmJIT5aoQLRlknr9nqQTpQAaLdvzO4iqBrBFkEt/jXGc2Vz+evEfmezkJHupwAreSgd3j7f9JyR9
	qc/XqPJJWeOz0BovdBpozLN1FBGJvOF/ez6V3tEn20oe2zMim5S927QkrqNsR1QBs+wNMRGCFhm8R
	lVqn2P02TJ5rwhyQ10TO9IiLFap8hTERwEqwLVK3o7pMnzHYsGtO5WuZ2eJvvaln1UG/Lfn2FJcdS
	U98knL8yvIEecBq/s//w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2tSL-0000000GLvB-0MVb;
	Sun, 28 Sep 2025 15:36:57 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2tSI-0000000GLuM-3CkO;
	Sun, 28 Sep 2025 15:36:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759073815; x=1790609815;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ps64nDklqamC6EV1MdTjLHaAg7vz5kbJKj7+3R+gE9M=;
  b=RV+55QZvxG5md1/vu7OCRlagNXFS/SNVNrH7c3+a4e6PhzR8bBD8drbG
   MnvjRWla7fr9QH2fb+IVUT6WCDMz9oMHsJm305KPz/3v8MARLiy5xSGly
   aSRC/EpTd9LEfsejx5wwkZAj1kPZ6rGRdNz2KCkbu581bZTDMUn+Itc26
   hk2UXrcMQRt0fLq+hVgqg9rDpz9PwHl/MhjDfq/yDjTlJetN6DwImix6u
   zCBCvaASGnGtcZlm/dG5my1yDslu6Dgl1zbwyi0SMiNjlcT2n5AqbQIQO
   jXS5T5/MrquYQ94mD45QwtiCP2yzaGdUp2NJXoCYoOu7JhyEfMty/mMF5
   w==;
X-CSE-ConnectionGUID: 3bBdt8aiSuq7KbnPgaIB8g==
X-CSE-MsgGUID: Z4f6m4Y2RzyGg1UiZb/eYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="83945358"
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; 
   d="scan'208";a="83945358"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2025 08:36:52 -0700
X-CSE-ConnectionGUID: F6YSfJnxTLOaywNqfs2gRQ==
X-CSE-MsgGUID: jMAzwS4qRquUF6Tp0XctNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; 
   d="scan'208";a="201703507"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 28 Sep 2025 08:36:49 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2tSA-0007t5-0s;
	Sun, 28 Sep 2025 15:36:46 +0000
Date: Sun, 28 Sep 2025 23:36:12 +0800
From: kernel test robot <lkp@intel.com>
To: liu.xuemei1@zte.com.cn, anup@brainfault.org
Cc: oe-kbuild-all@lists.linux.dev, atish.patra@linux.dev,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: KVM: Transparent huge page support
Message-ID: <202509282326.NFfcoD5h-lkp@intel.com>
References: <20250928154450701hRC3fm00QYFnGiM0_M1No@zte.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250928154450701hRC3fm00QYFnGiM0_M1No@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_083654_884403_095D083F 
X-CRM114-Status: GOOD (  13.71  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[also build test WARNING on kvm/next mst-vhost/linux-next linus/master v6.17-rc7 next-20250926]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/liu-xuemei1-zte-com-cn/RISC-V-KVM-Transparent-huge-page-support/20250928-154904
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20250928154450701hRC3fm00QYFnGiM0_M1No%40zte.com.cn
patch subject: [PATCH] RISC-V: KVM: Transparent huge page support
config: riscv-randconfig-001-20250928 (https://download.01.org/0day-ci/archive/20250928/202509282326.NFfcoD5h-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250928/202509282326.NFfcoD5h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509282326.NFfcoD5h-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/kvm/gstage.c: In function 'gstage_supports_huge_mapping':
>> arch/riscv/kvm/gstage.c:108:39: warning: left shift count >= width of type [-Wshift-count-overflow]
     108 |         gpa_start = memslot->base_gfn << PAGE_SIZE;
         |                                       ^~


vim +108 arch/riscv/kvm/gstage.c

    97	
    98	static bool gstage_supports_huge_mapping(struct kvm_memory_slot *memslot, unsigned long hva)
    99	{
   100		gpa_t gpa_start;
   101		hva_t uaddr_start, uaddr_end;
   102		size_t size;
   103	
   104		size = memslot->npages * PAGE_SIZE;
   105		uaddr_start = memslot->userspace_addr;
   106		uaddr_end = uaddr_start + size;
   107	
 > 108		gpa_start = memslot->base_gfn << PAGE_SIZE;
   109	
   110		/*
   111		 * Pages belonging to memslots that don't have the same alignment
   112		 * within a PMD for userspace and GPA cannot be mapped with g-stage
   113		 * PMD entries, because we'll end up mapping the wrong pages.
   114		 *
   115		 * Consider a layout like the following:
   116		 *
   117		 *    memslot->userspace_addr:
   118		 *    +-----+--------------------+--------------------+---+
   119		 *    |abcde|fgh  vs-stage block  |    vs-stage block tv|xyz|
   120		 *    +-----+--------------------+--------------------+---+
   121		 *
   122		 *    memslot->base_gfn << PAGE_SHIFT:
   123		 *      +---+--------------------+--------------------+-----+
   124		 *      |abc|def  g-stage block  |    g-stage block   |tvxyz|
   125		 *      +---+--------------------+--------------------+-----+
   126		 *
   127		 * If we create those g-stage blocks, we'll end up with this incorrect
   128		 * mapping:
   129		 *   d -> f
   130		 *   e -> g
   131		 *   f -> h
   132		 */
   133		if ((gpa_start & (PMD_SIZE - 1)) != (uaddr_start & (PMD_SIZE - 1)))
   134			return false;
   135	
   136		/*
   137		 * Next, let's make sure we're not trying to map anything not covered
   138		 * by the memslot. This means we have to prohibit block size mappings
   139		 * for the beginning and end of a non-block aligned and non-block sized
   140		 * memory slot (illustrated by the head and tail parts of the
   141		 * userspace view above containing pages 'abcde' and 'xyz',
   142		 * respectively).
   143		 *
   144		 * Note that it doesn't matter if we do the check using the
   145		 * userspace_addr or the base_gfn, as both are equally aligned (per
   146		 * the check above) and equally sized.
   147		 */
   148		return (hva >= ALIGN(uaddr_start, PMD_SIZE)) && (hva < ALIGN_DOWN(uaddr_end, PMD_SIZE));
   149	}
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
