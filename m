Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDDE606F1C9
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lG39dKg0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LYpXUomc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8vrmvJ0L29kQ+lwuVAutiT47070vbYtOmSUTNlPpvG8=; b=lG39dKg0o4f1ARA3r24vL/M1QN
	QZitGFmCowOK7VoeEcuiglZwH24CO+idqh7hUgNaAgM60r4hqZg1xY0/JEPl7RSloxitjInV2Jlht
	pYBMc/rr1def6X+uc7lzyJ8mMFcj7/S0lyVDbJF1oAIrzWfifR/t/zEofb3i8e2OZ/3fwSC8NRQu8
	aDtQP3MryJ6aCtwCEeSG4SAcvRsjofS4wrskfrz0vloOPOj61PdnYt9L+aEfFLRpHbPI0K2pu0woJ
	f5ajNc8Ff0Z1WlFoerAw2QQuaqysjnqWtDHOlhRDvvhX6v6zhKvIP9sZ00hwdR4HZMJ40YihhjepP
	XPVVyS2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoz-0000000DsC0-2GNA;
	Fri, 13 Nov 2026 18:16:21 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoj-0000000DrbN-0S8b;
	Fri, 13 Nov 2026 18:16:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794593765; x=1826129765;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+EdMLnRI4DvU7CemabUqWgmvJ8PvY87bMeAtmHXl08o=;
  b=LYpXUomc+TdxVTmHwoEMwPhFIEbvDRlui5vFK/OCCG30zf9Q7G43RNBk
   yNSBpD3kNyoT9/552JCeq1w9XtC68nDILxngDWldMMiX/8Ol3uJKb7jhZ
   5Y/CjtTjVtIKFurquDH1bAgdAOJ72DsdRsuMYPg1VueGRaU1YOiLLoMmj
   DuTGE0O/oT6S6vSDMS7Z3NFDfIUanRuoYe7vwPP+Wkd62V3P3GkzCIitx
   hcwLbZeA+ZgVf3i7g8+FlNpSy+gOJJaOVZFUnhnE99upDuiAFJCYlsCc7
   a4pbXGwRxWV/fPXLyhhgMXKmX3MP4PJMwcGe0tc7yO/vzj9JDdTan2nXt
   A==;
X-CSE-ConnectionGUID: azguKjuuRbGlzRdH/WBMSg==
X-CSE-MsgGUID: uGRtRylXROy35JCK8tIWtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3308788"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3308788"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 10:16:03 -0800
X-CSE-ConnectionGUID: rEaKjM9uRNqRgcaAXeodEg==
X-CSE-MsgGUID: e9o4fhDoTa6auUYtZN584g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="8791867"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Nov 2026 10:16:00 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRvoa-000000013dH-2RtK;
	Fri, 13 Nov 2026 18:15:56 +0000
Date: Sat, 14 Nov 2026 02:15:48 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <tchiu@tenstorrent.com>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, andybnac@gmail.com,
	Andy Chiu <tchiu@tenstorrent.com>, dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com, Aurelien Jarno <aurelien@aurel32.net>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	daichengrong <daichengrong@iscas.ac.cn>,
	Troy Mitchell <troy.mitchell@linux.dev>
Subject: Re: [PATCH v7 1/6] riscv: vector: refactor vector context operations
Message-ID: <202611140219.tkhKWAca-lkp@intel.com>
References: <20261111184359.1239821-2-tchiu@tenstorrent.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261111184359.1239821-2-tchiu@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101605_204427_937C5477 
X-CRM114-Status: GOOD (  12.76  )
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

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on d1a8d411533d6be16ac79796c02a9bfc7d7958f1]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Chiu/riscv-vector-refactor-vector-context-operations/20261111-124323
base:   d1a8d411533d6be16ac79796c02a9bfc7d7958f1
patch link:    https://lore.kernel.org/r/20261111184359.1239821-2-tchiu%40tenstorrent.com
patch subject: [PATCH v7 1/6] riscv: vector: refactor vector context operations
config: riscv-randconfig-1001-20261113 (https://download.01.org/0day-ci/archive/20261114/202611140219.tkhKWAca-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611140219.tkhKWAca-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611140219.tkhKWAca-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu.c:828:3: error: call to undeclared function 'kvm_riscv_vector_restore'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     828 |                 kvm_riscv_vector_restore(gcntx);
         |                 ^
   arch/riscv/kvm/vcpu.c:828:3: note: did you mean '__kvm_riscv_vector_restore'?
   arch/riscv/include/asm/kvm_vcpu_vector.h:62:29: note: '__kvm_riscv_vector_restore' declared here
      62 | static __always_inline void __kvm_riscv_vector_restore(struct kvm_cpu_context *context)
         |                             ^
   1 error generated.


vim +/kvm_riscv_vector_restore +828 arch/riscv/kvm/vcpu.c

   798	
   799	/*
   800	 * Actually run the vCPU, entering an RCU extended quiescent state (EQS) while
   801	 * the vCPU is running.
   802	 *
   803	 * This must be noinstr as instrumentation may make use of RCU, and this is not
   804	 * safe during the EQS.
   805	 */
   806	static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu,
   807						      struct kvm_cpu_trap *trap)
   808	{
   809		void *nsh;
   810		struct kvm_cpu_context *gcntx = &vcpu->arch.guest_context;
   811		struct kvm_cpu_context *hcntx = &vcpu->arch.host_context;
   812	
   813		/*
   814		 * We save trap CSRs (such as SEPC, SCAUSE, STVAL, HTVAL, and
   815		 * HTINST) here because we do local_irq_enable() after this
   816		 * function in kvm_arch_vcpu_ioctl_run() which can result in
   817		 * an interrupt immediately after local_irq_enable() and can
   818		 * potentially change trap CSRs.
   819		 */
   820	
   821		kvm_riscv_vcpu_swap_in_guest_state(vcpu);
   822		guest_state_enter_irqoff();
   823	
   824		/* sstatus.VS != SR_VS_OFF is guaranteed when NEED_RESTORE is set */
   825		if (current->thread.riscv_v_flags & RISCV_V_VCPU_NEED_RESTORE) {
   826			current->thread.riscv_v_flags &= ~RISCV_V_VCPU_NEED_RESTORE;
   827			current->thread.riscv_v_flags |= RISCV_V_VCPU_CTX;
 > 828			kvm_riscv_vector_restore(gcntx);
   829			gcntx->sstatus = (gcntx->sstatus & ~SR_VS) | SR_VS_CLEAN;
   830		}
   831	
   832		if (kvm_riscv_nacl_sync_sret_available()) {
   833			nsh = nacl_shmem();
   834	
   835			if (kvm_riscv_nacl_autoswap_csr_available()) {
   836				hcntx->hstatus =
   837					nacl_csr_read(nsh, CSR_HSTATUS);
   838				nacl_scratch_write_long(nsh,
   839							SBI_NACL_SHMEM_AUTOSWAP_OFFSET +
   840							SBI_NACL_SHMEM_AUTOSWAP_HSTATUS,
   841							gcntx->hstatus);
   842				nacl_scratch_write_long(nsh,
   843							SBI_NACL_SHMEM_AUTOSWAP_OFFSET,
   844							SBI_NACL_SHMEM_AUTOSWAP_FLAG_HSTATUS);
   845			} else if (kvm_riscv_nacl_sync_csr_available()) {
   846				hcntx->hstatus = nacl_csr_swap(nsh,
   847							       CSR_HSTATUS, gcntx->hstatus);
   848			} else {
   849				hcntx->hstatus = csr_swap(CSR_HSTATUS, gcntx->hstatus);
   850			}
   851	
   852			nacl_scratch_write_longs(nsh,
   853						 SBI_NACL_SHMEM_SRET_OFFSET +
   854						 SBI_NACL_SHMEM_SRET_X(1),
   855						 &gcntx->ra,
   856						 SBI_NACL_SHMEM_SRET_X_LAST);
   857	
   858			__kvm_riscv_nacl_switch_to(&vcpu->arch, SBI_EXT_NACL,
   859						   SBI_EXT_NACL_SYNC_SRET);
   860	
   861			if (kvm_riscv_nacl_autoswap_csr_available()) {
   862				nacl_scratch_write_long(nsh,
   863							SBI_NACL_SHMEM_AUTOSWAP_OFFSET,
   864							0);
   865				gcntx->hstatus = nacl_scratch_read_long(nsh,
   866									SBI_NACL_SHMEM_AUTOSWAP_OFFSET +
   867									SBI_NACL_SHMEM_AUTOSWAP_HSTATUS);
   868			} else {
   869				gcntx->hstatus = csr_swap(CSR_HSTATUS, hcntx->hstatus);
   870			}
   871	
   872			trap->htval = nacl_csr_read(nsh, CSR_HTVAL);
   873			trap->htinst = nacl_csr_read(nsh, CSR_HTINST);
   874		} else {
   875			hcntx->hstatus = csr_swap(CSR_HSTATUS, gcntx->hstatus);
   876	
   877			__kvm_riscv_switch_to(&vcpu->arch);
   878	
   879			gcntx->hstatus = csr_swap(CSR_HSTATUS, hcntx->hstatus);
   880	
   881			trap->htval = csr_read(CSR_HTVAL);
   882			trap->htinst = csr_read(CSR_HTINST);
   883		}
   884	
   885		trap->sepc = gcntx->sepc;
   886		trap->scause = csr_read(CSR_SCAUSE);
   887		trap->stval = csr_read(CSR_STVAL);
   888	
   889		vcpu->arch.last_exit_cpu = vcpu->cpu;
   890		guest_state_exit_irqoff();
   891		kvm_riscv_vcpu_swap_in_host_state(vcpu);
   892	}
   893	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
