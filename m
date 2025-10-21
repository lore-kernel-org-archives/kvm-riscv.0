Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C65FCCD1A2
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 02:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9qBlmzwAT86jlxueYNjpV+MHdFnmhvtiZW1ooi/9apw=; b=WoYal99mBKT2eH
	Zh05vH9LeIYgoiO1PsptHuivgUT+Bw7JbQ+nBIDxQbOBYzI9/iAvC9r+Iaef84z9BRRau0peFZdLw
	Q1Gs81k1kKggvhVAaECM+emnQ2yQetc2skDQN6kkBiRsLsShNiTBWURzx+D0O+VhyfT4OQWxgID+G
	r83g88lbB4sl8BHMFSeMnhldrQy1dXbHOyiGCSsaYd3cNHk13/K2tgiGOLVGqtLpZC1qAnsMETto8
	6qqg7tkmW8vrO78NDBk4ph7q+WLDpF5CMdijccCtUh+JEBm0bCxfGy3X7xxgi6leSsWwnC8VVI6jv
	zYWeU5bAM9NhygXp+mMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB2HD-0000000Fb3r-1M6D;
	Tue, 21 Oct 2025 02:39:07 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB2HA-0000000Fb3R-2v6l;
	Tue, 21 Oct 2025 02:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761014345; x=1792550345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YelTUj/Itdkam8XSpN2bVMX//XFvL4Up4guJiyWU22A=;
  b=Tn9p4F/eM1lyfMshETyDihH/6NrYRmWHoKDjnHXoURX9djD1dBtOsbka
   I+JGk9TCnPbDfd+ORupye5oLPwkyRIHfC5qhwCJwp/0fVGOda8OaWnP5H
   jycFpPBTVZy7wPwgiqQEI755VBGybzfNaI+SROfyBXhijzbfERdzos5RU
   FZRHUBSijz0bsXB10oo2BaI9fkpwRfTyO7ImwwHBoULsg8VsvdYPpzime
   +Bo7UpjIdMnJuMu4u+oT3nDPQpvIPHXJffd1yU4YVCpGWWbCkVNRcPSz5
   3crHvHVKCJ28tBZ+9vzJxBkMwQQncbZ4lwGy3vdjeqM3ChiwU8r0H/j8P
   w==;
X-CSE-ConnectionGUID: 8T78YJNqQiuuiIApTrAi7Q==
X-CSE-MsgGUID: ItJigDe5QZipVvQV3pmlMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50709847"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="50709847"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 19:39:01 -0700
X-CSE-ConnectionGUID: WRGaFpn+QCyegQjI8CmtOQ==
X-CSE-MsgGUID: klALRghhR2mbbGPA9iCDaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="187743891"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 20 Oct 2025 19:38:58 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vB2H1-000AOP-1d;
	Tue, 21 Oct 2025 02:38:55 +0000
Date: Tue, 21 Oct 2025 10:38:33 +0800
From: kernel test robot <lkp@intel.com>
To: fangyu.yu@linux.alibaba.com, anup@brainfault.org, atish.patra@linux.dev,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, pbonzini@redhat.com, jiangyifei@huawei.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, guoren@kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: Re: [PATCH] RISC-V: KVM: Remove automatic I/O mapping for VM_PFNMAP
Message-ID: <202510211010.XRaEeuBa-lkp@intel.com>
References: <20251020130801.68356-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251020130801.68356-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_193904_749691_A7176BEB 
X-CRM114-Status: GOOD (  13.01  )
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
[also build test WARNING on kvm/next linus/master v6.18-rc2 next-20251020]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/fangyu-yu-linux-alibaba-com/RISC-V-KVM-Remove-automatic-I-O-mapping-for-VM_PFNMAP/20251020-210957
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20251020130801.68356-1-fangyu.yu%40linux.alibaba.com
patch subject: [PATCH] RISC-V: KVM: Remove automatic I/O mapping for VM_PFNMAP
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20251021/202510211010.XRaEeuBa-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510211010.XRaEeuBa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510211010.XRaEeuBa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/mmu.c:211:9: warning: variable 'vm_start' set but not used [-Wunused-but-set-variable]
     211 |                 hva_t vm_start, vm_end;
         |                       ^
>> arch/riscv/kvm/mmu.c:174:8: warning: variable 'base_gpa' set but not used [-Wunused-but-set-variable]
     174 |         gpa_t base_gpa;
         |               ^
   2 warnings generated.


vim +/vm_start +211 arch/riscv/kvm/mmu.c

99cdc6c18c2d815 Anup Patel          2021-09-27  167  
99cdc6c18c2d815 Anup Patel          2021-09-27  168  int kvm_arch_prepare_memory_region(struct kvm *kvm,
537a17b31493009 Sean Christopherson 2021-12-06  169  				const struct kvm_memory_slot *old,
537a17b31493009 Sean Christopherson 2021-12-06  170  				struct kvm_memory_slot *new,
99cdc6c18c2d815 Anup Patel          2021-09-27  171  				enum kvm_mr_change change)
99cdc6c18c2d815 Anup Patel          2021-09-27  172  {
d01495d4cffb327 Sean Christopherson 2021-12-06  173  	hva_t hva, reg_end, size;
d01495d4cffb327 Sean Christopherson 2021-12-06 @174  	gpa_t base_gpa;
d01495d4cffb327 Sean Christopherson 2021-12-06  175  	bool writable;
9d05c1fee837572 Anup Patel          2021-09-27  176  	int ret = 0;
9d05c1fee837572 Anup Patel          2021-09-27  177  
9d05c1fee837572 Anup Patel          2021-09-27  178  	if (change != KVM_MR_CREATE && change != KVM_MR_MOVE &&
9d05c1fee837572 Anup Patel          2021-09-27  179  			change != KVM_MR_FLAGS_ONLY)
99cdc6c18c2d815 Anup Patel          2021-09-27  180  		return 0;
9d05c1fee837572 Anup Patel          2021-09-27  181  
9d05c1fee837572 Anup Patel          2021-09-27  182  	/*
9d05c1fee837572 Anup Patel          2021-09-27  183  	 * Prevent userspace from creating a memory region outside of the GPA
9d05c1fee837572 Anup Patel          2021-09-27  184  	 * space addressable by the KVM guest GPA space.
9d05c1fee837572 Anup Patel          2021-09-27  185  	 */
537a17b31493009 Sean Christopherson 2021-12-06  186  	if ((new->base_gfn + new->npages) >=
dd82e35638d67f4 Anup Patel          2025-06-18  187  	    (kvm_riscv_gstage_gpa_size >> PAGE_SHIFT))
9d05c1fee837572 Anup Patel          2021-09-27  188  		return -EFAULT;
9d05c1fee837572 Anup Patel          2021-09-27  189  
d01495d4cffb327 Sean Christopherson 2021-12-06  190  	hva = new->userspace_addr;
d01495d4cffb327 Sean Christopherson 2021-12-06  191  	size = new->npages << PAGE_SHIFT;
d01495d4cffb327 Sean Christopherson 2021-12-06  192  	reg_end = hva + size;
d01495d4cffb327 Sean Christopherson 2021-12-06  193  	base_gpa = new->base_gfn << PAGE_SHIFT;
d01495d4cffb327 Sean Christopherson 2021-12-06  194  	writable = !(new->flags & KVM_MEM_READONLY);
d01495d4cffb327 Sean Christopherson 2021-12-06  195  
9d05c1fee837572 Anup Patel          2021-09-27  196  	mmap_read_lock(current->mm);
9d05c1fee837572 Anup Patel          2021-09-27  197  
9d05c1fee837572 Anup Patel          2021-09-27  198  	/*
9d05c1fee837572 Anup Patel          2021-09-27  199  	 * A memory region could potentially cover multiple VMAs, and
b35152e0fb35983 Fangyu Yu           2025-10-20  200  	 * any holes between them, so iterate over all of them.
9d05c1fee837572 Anup Patel          2021-09-27  201  	 *
9d05c1fee837572 Anup Patel          2021-09-27  202  	 *     +--------------------------------------------+
9d05c1fee837572 Anup Patel          2021-09-27  203  	 * +---------------+----------------+   +----------------+
9d05c1fee837572 Anup Patel          2021-09-27  204  	 * |   : VMA 1     |      VMA 2     |   |    VMA 3  :    |
9d05c1fee837572 Anup Patel          2021-09-27  205  	 * +---------------+----------------+   +----------------+
9d05c1fee837572 Anup Patel          2021-09-27  206  	 *     |               memory region                |
9d05c1fee837572 Anup Patel          2021-09-27  207  	 *     +--------------------------------------------+
9d05c1fee837572 Anup Patel          2021-09-27  208  	 */
9d05c1fee837572 Anup Patel          2021-09-27  209  	do {
fce11b667022766 Quan Zhou           2025-06-17  210  		struct vm_area_struct *vma;
9d05c1fee837572 Anup Patel          2021-09-27 @211  		hva_t vm_start, vm_end;
9d05c1fee837572 Anup Patel          2021-09-27  212  
fce11b667022766 Quan Zhou           2025-06-17  213  		vma = find_vma_intersection(current->mm, hva, reg_end);
fce11b667022766 Quan Zhou           2025-06-17  214  		if (!vma)
9d05c1fee837572 Anup Patel          2021-09-27  215  			break;
9d05c1fee837572 Anup Patel          2021-09-27  216  
9d05c1fee837572 Anup Patel          2021-09-27  217  		/*
9d05c1fee837572 Anup Patel          2021-09-27  218  		 * Mapping a read-only VMA is only allowed if the
9d05c1fee837572 Anup Patel          2021-09-27  219  		 * memory region is configured as read-only.
9d05c1fee837572 Anup Patel          2021-09-27  220  		 */
9d05c1fee837572 Anup Patel          2021-09-27  221  		if (writable && !(vma->vm_flags & VM_WRITE)) {
9d05c1fee837572 Anup Patel          2021-09-27  222  			ret = -EPERM;
9d05c1fee837572 Anup Patel          2021-09-27  223  			break;
9d05c1fee837572 Anup Patel          2021-09-27  224  		}
9d05c1fee837572 Anup Patel          2021-09-27  225  
9d05c1fee837572 Anup Patel          2021-09-27  226  		/* Take the intersection of this VMA with the memory region */
9d05c1fee837572 Anup Patel          2021-09-27  227  		vm_start = max(hva, vma->vm_start);
9d05c1fee837572 Anup Patel          2021-09-27  228  		vm_end = min(reg_end, vma->vm_end);
9d05c1fee837572 Anup Patel          2021-09-27  229  
9d05c1fee837572 Anup Patel          2021-09-27  230  		if (vma->vm_flags & VM_PFNMAP) {
9d05c1fee837572 Anup Patel          2021-09-27  231  			/* IO region dirty page logging not allowed */
537a17b31493009 Sean Christopherson 2021-12-06  232  			if (new->flags & KVM_MEM_LOG_DIRTY_PAGES) {
9d05c1fee837572 Anup Patel          2021-09-27  233  				ret = -EINVAL;
9d05c1fee837572 Anup Patel          2021-09-27  234  				goto out;
9d05c1fee837572 Anup Patel          2021-09-27  235  			}
9d05c1fee837572 Anup Patel          2021-09-27  236  		}
9d05c1fee837572 Anup Patel          2021-09-27  237  		hva = vm_end;
9d05c1fee837572 Anup Patel          2021-09-27  238  	} while (hva < reg_end);
9d05c1fee837572 Anup Patel          2021-09-27  239  
9d05c1fee837572 Anup Patel          2021-09-27  240  out:
9d05c1fee837572 Anup Patel          2021-09-27  241  	mmap_read_unlock(current->mm);
9d05c1fee837572 Anup Patel          2021-09-27  242  	return ret;
99cdc6c18c2d815 Anup Patel          2021-09-27  243  }
99cdc6c18c2d815 Anup Patel          2021-09-27  244  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
