Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A08BCA0EDC
	for <kvm-riscv@archiver.kernel.org>; Sun, 17 Aug 2025 21:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ivVC/bhxbTayJt33oEecgMCcMF+YOp92DLLIlclFfA=; b=R/03JHaZzf4FqN
	DxFwJ1p2Ii7jy5HSJitTZyXdSSPt0NE1ly611OSmFdq5wHtfFbOM1l23GO049GLcPcJ8NEEdQ+Be3
	pw/Pb5sRFIxsPs0lNBUDuwkXkh2FL3vHAwH7OZ9A7CgICCuBlf433XIBttSgNGeXK6ml0LxBNUBiY
	S9p8ZoI4Hf4n61a5vuATNWGbZ9JNam72NxPfAsPxrHr6anS+aKM72D82o7VH5lRSHKR5YJ4ww5dgp
	ktpUAwSrIB/DEqqVG2KaXXPQ2inW+c46yLkpgaivvjuLFRhDkb4RI0+zqlXeV4vHvkHKGcRAJzWqF
	ANFYtOrlHexqVCFkcpjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unkXN-000000063BF-1pbQ;
	Sun, 17 Aug 2025 21:03:33 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unkXK-000000063Ao-2ziC;
	Sun, 17 Aug 2025 21:03:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755464611; x=1787000611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mXDm9pzQ2v2aMXQtgfLc6q6k54TIbxRQKNSFRAvlPm8=;
  b=K7AbOv2xHPUjoKY1zFbIw1/CvcG43d/5FkVX9ZqD6DsdHcl0FD7UQlHZ
   xGfxuXhyeuHaoL4pCwKbAjHRKAHUtfPeD0j1+Dy0tjlCM+I6AT7pGxTV2
   b+apnYjzypKa1IB7+GUlKiHM6sZTzcK4ga96sp3CfG70UscSA+DRBvKWa
   omtw60DfI3xzSpMg45XGMNbIjiD3nSpWx5ojf/HUOkwdv8QLKcLeP1hFF
   CrnTzXVRSOk+T5oS/c9GR0cQEBa/UKp8qn1Q/0kpEZAJtE4JG2LZhwKdN
   m5+aOic2i6toLtPXlN4a2Jt0vGVQFeORBI/aXamWSW09df9jgzREHS1i6
   w==;
X-CSE-ConnectionGUID: LSyjJBE+Q+uv1R2mgz4blA==
X-CSE-MsgGUID: RDONzPS+SfaVLvExogq+Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="69143675"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="69143675"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 14:03:25 -0700
X-CSE-ConnectionGUID: XDR8jl+CQ7mIMDSoIjuRUw==
X-CSE-MsgGUID: Itk0I8gxStyf6NnlXNz1YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="171644503"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 17 Aug 2025 14:03:21 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unkW4-000Dih-0l;
	Sun, 17 Aug 2025 21:02:41 +0000
Date: Mon, 18 Aug 2025 05:01:04 +0800
From: kernel test robot <lkp@intel.com>
To: fangyu.yu@linux.alibaba.com, anup@brainfault.org, atish.patra@linux.dev,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	guoren@linux.alibaba.com, guoren@kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: Re: [PATCH] RISC-V: KVM: Write hgatp register with valid mode bits
Message-ID: <202508180228.aJykn9j0-lkp@intel.com>
References: <20250816073234.77646-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250816073234.77646-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_140330_822733_EB738C66 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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
[also build test ERROR on kvm/next mst-vhost/linux-next linus/master v6.17-rc1 next-20250815]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/fangyu-yu-linux-alibaba-com/RISC-V-KVM-Write-hgatp-register-with-valid-mode-bits/20250816-153513
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20250816073234.77646-1-fangyu.yu%40linux.alibaba.com
patch subject: [PATCH] RISC-V: KVM: Write hgatp register with valid mode bits
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20250818/202508180228.aJykn9j0-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508180228.aJykn9j0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508180228.aJykn9j0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kvm/vmid.c:31:24: error: call to undeclared function 'kvm_riscv_gstage_mode'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           csr_write(CSR_HGATP, (kvm_riscv_gstage_mode() << HGATP_MODE_SHIFT) | HGATP_VMID);
                                 ^
   arch/riscv/kvm/vmid.c:31:48: warning: shift count >= width of type [-Wshift-count-overflow]
           csr_write(CSR_HGATP, (kvm_riscv_gstage_mode() << HGATP_MODE_SHIFT) | HGATP_VMID);
                                                         ^  ~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/csr.h:538:38: note: expanded from macro 'csr_write'
           unsigned long __v = (unsigned long)(val);               \
                                               ^~~
   1 warning and 1 error generated.


vim +/kvm_riscv_gstage_mode +31 arch/riscv/kvm/vmid.c

    24	
    25	void __init kvm_riscv_gstage_vmid_detect(void)
    26	{
    27		unsigned long old;
    28	
    29		/* Figure-out number of VMID bits in HW */
    30		old = csr_read(CSR_HGATP);
  > 31		csr_write(CSR_HGATP, (kvm_riscv_gstage_mode() << HGATP_MODE_SHIFT) | HGATP_VMID);
    32		vmid_bits = csr_read(CSR_HGATP);
    33		vmid_bits = (vmid_bits & HGATP_VMID) >> HGATP_VMID_SHIFT;
    34		vmid_bits = fls_long(vmid_bits);
    35		csr_write(CSR_HGATP, old);
    36	
    37		/* We polluted local TLB so flush all guest TLB */
    38		kvm_riscv_local_hfence_gvma_all();
    39	
    40		/* We don't use VMID bits if they are not sufficient */
    41		if ((1UL << vmid_bits) < num_possible_cpus())
    42			vmid_bits = 0;
    43	}
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
