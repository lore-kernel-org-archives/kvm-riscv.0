Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED67606A332
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 17:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gg/yVq7p;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jnYqXGhh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1Lsg/W4vognZLzwuw40aCLAyhzkCeKdABWwNOtja1Vs=; b=gg/yVq7pcUnc1zyxwNW7XCArqf
	Wp9GFUOOVapRAuwXxCFNFtr7FNYGyfYbeySKt5nClB49PaMyL4hbP7JhyV7UriZ+4OKEH+qft4+Bq
	a1SNs0nuWfMK69TTHp/LCfiSoyV1D3Dy3Z3aXvLhlgLiOVxRS86EJHfvN0rKPCZHU2Ox+ERgKzLsr
	a6bigOBmjAAi1jbKuW4MLXXT169vFFA13/bFm9TUNsflpaMatg16R5gKcH+E6Wed2WHOnmnsldFxY
	qyMZpahgMzKJ1WdVm/vyppSzZTbWNRV0Viq4JkaB/I7HKw+oaw35AFlZQ02R2pgMCk7jfSdpQUbSa
	5MKie2Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHHM-0000000AuAM-1oMH;
	Wed, 25 Nov 2026 17:59:36 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHH6-0000000Au2s-06XB;
	Wed, 25 Nov 2026 17:59:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795629560; x=1827165560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3Q0eWoH0hqjK/+AffASRnzPWdWve09RRdkIHSFgQxy4=;
  b=jnYqXGhhmXJ8BHq7/KPNjlc36O9TkkitxPtdTpnrAFLzh4trl5fVKmCK
   WRw5dgTFCQIofLwCmsmBGqZNwCaYh5roRfOPxrG9h/9aByF2hsRiOmqvm
   Vmk/qFoq9Ku0QQ5F1Il+m5h+6cZ49NMXz7mvmIFYMjyh1s0hu1eZA2S10
   xwZIssLH5xsqYL7wQVaUtUSlxC/En/aziyVTJHw0V9VyyxMbmuXb1IiJ7
   xaCd4u0iMTfMQn2ArtOAmH30T6x4DnYNG63LWX1i3UAVEY4gFiUfPYyNr
   KpPdpdbdnkP2M8ZJvbNXMP2hAEIzQjRzNHCg9Dlm7DqBSpIh7S9d1pUzw
   A==;
X-CSE-ConnectionGUID: GSHuaEvrSBeLan9F24KVnw==
X-CSE-MsgGUID: cALOGvh+QOKgh5/USLGB7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4462400"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4462400"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 09:59:19 -0800
X-CSE-ConnectionGUID: 6a6LIVAHRomgpZJMlg93nw==
X-CSE-MsgGUID: A0u+DZzIQwOjdpZxlfyO0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="13597397"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 25 Nov 2026 09:59:14 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWHGw-00000001SGM-3o5J;
	Wed, 25 Nov 2026 17:59:10 +0000
Date: Thu, 26 Nov 2026 01:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: Tan Chi <tanchi25@mails.ucas.ac.cn>, anup@brainfault.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, tj@kernel.org,
	hannes@cmpxchg.org, mkoutny@suse.com, corbet@lwn.net,
	skhan@linuxfoundation.org, rdunlap@infradead.org, yosry@kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, Tan Chi <tanchi25@mails.ucas.ac.cn>
Subject: Re: [PATCH] RISC-V: KVM: Account G-stage page table memory
Message-ID: <20261126015340.s7bzBtEB-lkp@intel.com>
References: <20261125125024.1983082-1-tanchi25@mails.ucas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261125125024.1983082-1-tanchi25@mails.ucas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_095920_149815_4BA26774 
X-CRM114-Status: GOOD (  11.74  )
X-Spam-Score: -4.4 (----)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Tan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm-riscv/riscv_kvm_next]
[also build test WARNING on linus/master next-20261124]
[cannot apply to tj-cgroup/for-next kvm/queue kvm/next mst-vhost/linux-next kvm/linux-next v7.4-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tan-Chi/RISC-V-KVM-Account-G-stage-page-table-memory/20261125-205023
base:   https://github.com/kvm-riscv/linux.git riscv_kvm_next
patch link:    https://lore.kernel.org/r/20261125125024.1983082-1-tanchi25%40mails.ucas.ac.cn
patch subject: [PATCH] RISC-V: KVM: Account G-stage page table memory
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20261126/20261126015340.s7bzBtEB-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2012344e5da8e03ea4b8283ecd6fad6e13f09d64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126015340.s7bzBtEB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126015340.s7bzBtEB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/mmu.c:850:5: warning: implicit conversion from 'unsigned long' to 'int' changes value from 18446744073709551612 to -4 [-Wconstant-conversion]
     849 |                 kvm_account_pgtable_pages(pgd,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~
     850 |                                 -(kvm_riscv_gstage_pgd_size >> PAGE_SHIFT));
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +850 arch/riscv/kvm/mmu.c

   827	
   828	void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
   829	{
   830		struct kvm_gstage gstage;
   831		void *pgd = NULL;
   832		bool flush = false;
   833	
   834		write_lock(&kvm->mmu_lock);
   835		if (kvm->arch.pgd) {
   836			kvm_riscv_gstage_init(&gstage, kvm);
   837			flush = kvm_riscv_gstage_unmap_all(&gstage);
   838			pgd = READ_ONCE(kvm->arch.pgd);
   839			kvm->arch.pgd = NULL;
   840			kvm->arch.pgd_phys = 0;
   841			kvm->arch.pgd_levels = 0;
   842		}
   843		write_unlock(&kvm->mmu_lock);
   844	
   845		if (flush)
   846			kvm_flush_remote_tlbs(kvm);
   847	
   848		if (pgd) {
   849			kvm_account_pgtable_pages(pgd,
 > 850					-(kvm_riscv_gstage_pgd_size >> PAGE_SHIFT));
   851			free_pages((unsigned long)pgd, get_order(kvm_riscv_gstage_pgd_size));
   852		}
   853	}
   854	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
