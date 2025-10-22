Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A96CCD1BE
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 20:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Lp3yfwnw2A84DBS8EF2U7+JCcB/AZ2tOwp2oOed/Lk=; b=lgtO3U0sVhkLBi
	LNV0UT8QvxzQFwVcJZWoN4G+QBBI1ksOcbELh1yY0w0SUqrrvMvbEusjJ46yc0B3NB57UDkRRZnKE
	XynJy81C+fWTKKjuNWQ0FMzun+nKFxvFmZGChpBdzeJ1rg2sPA+GjH+ndjnPXnKywjrqVZspOP6rG
	EgH+7HWEEJCiKLW9K9pDsv2oaGj0A/izOAZJytsbsYm0Wm0K1k0Zb4+brEsDEO+sigLmEuJhZbxi7
	SdQ3tE4lwkGsoDMJavV5ETXBvsEAIpu979rbKbJNO+EB00MfvuUmULlg7gtF9JuITQdXjTx5twrKZ
	tj5CTuMDbpksIXPVH0eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBfYL-00000004G5M-1HwZ;
	Wed, 22 Oct 2025 20:35:25 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBfYI-00000004G4o-1y79;
	Wed, 22 Oct 2025 20:35:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761165323; x=1792701323;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UVYE2m+dfTC8L+h8OkbpueMO00XTqC0cIJ5IUlC3jFI=;
  b=kzgb8sxuRS/t0GkQcJDoaQmuqrvqozmt+MwFQIx1nhHvUBn1YOIwtpXQ
   bLRHgzGW74Onz+fDYHIzUkXbhiktra0nyPVU7sRsXRiKFAi5cs8SxBpFW
   r+d+nfTfPw8w8AyK293A3C5YKX/TigdG7OLnjtqub/r4yq4j9/S1Ean7Z
   oSi+p3fVbBJxzdfLV3Jy5txrEbN27I7pdmsSNr29ENqQa7zfutlrJHmNh
   06A673ccJa7mSlJEzcSn21uJKuZJjBIT1Ar4BxOf0cTm/GBNOCMMBPhZH
   OX7CXZyKGdFdUlzxi6AH0B2xQxmsfCEcgX0ZHhSU9uU3H9pJ06YTFNyHl
   Q==;
X-CSE-ConnectionGUID: j5yPBOTJTiK2VsS+P8QuEg==
X-CSE-MsgGUID: bEAiQXyCSI+92ociW7VR8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63220190"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="63220190"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 13:35:21 -0700
X-CSE-ConnectionGUID: kwvg8BHhTeq3LPk10Ou7sg==
X-CSE-MsgGUID: hXOMDYU6RfmVGxNjnZQgDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="214906268"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Oct 2025 13:35:17 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBfYB-000CiH-1x;
	Wed, 22 Oct 2025 20:35:15 +0000
Date: Thu, 23 Oct 2025 04:34:39 +0800
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
Message-ID: <202510230412.vKIvCmwU-lkp@intel.com>
References: <20251021083105.4029305-1-minachou@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251021083105.4029305-1-minachou@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_133522_547663_D2329847 
X-CRM114-Status: GOOD (  10.56  )
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
config: riscv-randconfig-r072-20251023 (https://download.01.org/0day-ci/archive/20251023/202510230412.vKIvCmwU-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230412.vKIvCmwU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230412.vKIvCmwU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/vmid.c:126:6: warning: no previous prototype for 'kvm_riscv_local_tlb_sanitize' [-Wmissing-prototypes]
     126 | void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
