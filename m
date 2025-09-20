Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09C1CAC5A5
	for <kvm-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 14:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=497daCRDIxz1toRBk6u0PDztF0oJHdVAL39wKADzKa4=; b=1fCXsjn4ErJMmi
	x6vRtmtqpRT8mlPmO9jOZLcuKpzkXKtp5/eEOvSVFyw+7tKn6jA+sXHQdVbMysG/LBLasAJYAFWmI
	iMPaiy/ouTEvBuKdiSMnYNAgM9/VSI8OpgFkSgpUgb7f/HoETvaiURhLKXTMbe1PCdz0gKVfPav3F
	u8QMTLSNNpTlh82uhWdmN1eTk8DfmBKTm9s06znw8gnX5FniPm91jArTXxTNjsBR41j3XdkrDapgA
	2BNwFf0pVWyycfwmpVhrf0dBGPbn8JrQuDygqZKJaxcH6Qq/61eaw/b7EiDj+9HyamAIrmYqSS3iV
	osltIzxfnQ757g4qbM3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzywo-00000005UJi-1EUV;
	Sat, 20 Sep 2025 14:52:22 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzywl-00000005UIs-0Bx2;
	Sat, 20 Sep 2025 14:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758379937; x=1789915937;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UUc100DiH5QSCSSktpUYXl2/8ztlxI58qE2abR1pwAo=;
  b=ie2mMMAUy5FZvgXGnOkcsekVrOI0UE6yj7SUZHo4ZSD8/z8FXDSm6CGG
   cipMmYsRqRHo4u142ENU8tqNQUqoHS4sulL3OyeunPJezNWmcNIxg/4sv
   ZN49A3Oes+H7ObJqMFINBMqF2qJ8LEQs2Rrk1rSX5HroJe1bF4IDQD/zL
   8PW/1SXh12/hmeoHcPmQw1NaRgRmfeq6bcfS2cvBbLQaAbCUdxrHWQHCF
   pxiK/175b3ie+cioZ8LEQD7655bxO50hvTsRBfI+Ga8ZMa/xsrVj+W+Cv
   NIPNq8jcH4SJqLXiJYNIJcieb7hdByUYET6Jyy1V6SQvXl51imi9mSoG1
   g==;
X-CSE-ConnectionGUID: XhvLuZzSSmCDSFv+CpVvsA==
X-CSE-MsgGUID: N+xpnzTPQcKBODSyDAqseg==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="64342015"
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="64342015"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 07:52:13 -0700
X-CSE-ConnectionGUID: 6OvbacEKTU2c8vyfRuSxaQ==
X-CSE-MsgGUID: 1lrjLAWUTZmK37vpom/sQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="181236519"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Sep 2025 07:52:08 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzywX-0005ON-01;
	Sat, 20 Sep 2025 14:52:05 +0000
Date: Sat, 20 Sep 2025 22:52:01 +0800
From: kernel test robot <lkp@intel.com>
To: Xu Lu <luxu.kernel@bytedance.com>, corbet@lwn.net, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com,
	mark.rutland@arm.com, parri.andrea@gmail.com,
	ajones@ventanamicro.com, brs@rivosinc.com, anup@brainfault.org,
	atish.patra@linux.dev, pbonzini@redhat.com, shuah@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, apw@canonical.com, joe@perches.com,
	linux-doc@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: Re: [PATCH v3 6/8] riscv: Apply acquire/release semantics to
 arch_xchg/arch_cmpxchg operations
Message-ID: <202509202249.rOR3GJbT-lkp@intel.com>
References: <20250919073714.83063-7-luxu.kernel@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250919073714.83063-7-luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_075219_166274_364E2D13 
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

Hi Xu,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on kvm/queue kvm/next linus/master v6.17-rc6]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xu-Lu/riscv-add-ISA-extension-parsing-for-Zalasr/20250919-154304
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250919073714.83063-7-luxu.kernel%40bytedance.com
patch subject: [PATCH v3 6/8] riscv: Apply acquire/release semantics to arch_xchg/arch_cmpxchg operations
config: riscv-randconfig-002-20250920 (https://download.01.org/0day-ci/archive/20250920/202509202249.rOR3GJbT-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509202249.rOR3GJbT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509202249.rOR3GJbT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/objpool.c:3:
>> include/linux/objpool.h:156:7: error: invalid .org offset '1528' (at offset '1532')
     156 |                 if (try_cmpxchg_release(&slot->head, &head, head + 1))
         |                     ^
   include/linux/atomic/atomic-instrumented.h:4899:2: note: expanded from macro 'try_cmpxchg_release'
    4899 |         raw_try_cmpxchg_release(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:228:9: note: expanded from macro 'raw_try_cmpxchg_release'
     228 |         ___r = raw_cmpxchg_release((_ptr), ___o, (_new)); \
         |                ^
   include/linux/atomic/atomic-arch-fallback.h:77:29: note: expanded from macro 'raw_cmpxchg_release'
      77 | #define raw_cmpxchg_release arch_cmpxchg_release
         |                             ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/riscv/include/asm/alternative-macros.h:104:2: note: expanded from macro '_ALTERNATIVE_CFG'
     104 |         __ALTERNATIVE_CFG(old_c, new_c, vendor_id, patch_id, IS_ENABLED(CONFIG_k))
         |         ^
   arch/riscv/include/asm/alternative-macros.h:94:2: note: expanded from macro '__ALTERNATIVE_CFG'
      94 |         ALT_NEW_CONTENT(vendor_id, patch_id, enable, new_c)
         |         ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
      81 |         ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
         |          ^
   <inline asm>:27:6: note: instantiated into assembly here
      27 | .org    . - (887b - 886b) + (889b - 888b)
         |         ^
   In file included from lib/objpool.c:3:
>> include/linux/objpool.h:156:7: error: invalid .org offset '1528' (at offset '1532')
     156 |                 if (try_cmpxchg_release(&slot->head, &head, head + 1))
         |                     ^
   include/linux/atomic/atomic-instrumented.h:4899:2: note: expanded from macro 'try_cmpxchg_release'
    4899 |         raw_try_cmpxchg_release(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:228:9: note: expanded from macro 'raw_try_cmpxchg_release'
     228 |         ___r = raw_cmpxchg_release((_ptr), ___o, (_new)); \
         |                ^
   include/linux/atomic/atomic-arch-fallback.h:77:29: note: expanded from macro 'raw_cmpxchg_release'
      77 | #define raw_cmpxchg_release arch_cmpxchg_release
         |                             ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/riscv/include/asm/alternative-macros.h:104:2: note: expanded from macro '_ALTERNATIVE_CFG'
     104 |         __ALTERNATIVE_CFG(old_c, new_c, vendor_id, patch_id, IS_ENABLED(CONFIG_k))
         |         ^
   arch/riscv/include/asm/alternative-macros.h:94:2: note: expanded from macro '__ALTERNATIVE_CFG'
      94 |         ALT_NEW_CONTENT(vendor_id, patch_id, enable, new_c)
         |         ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
      81 |         ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
         |          ^
   <inline asm>:27:6: note: instantiated into assembly here
      27 | .org    . - (887b - 886b) + (889b - 888b)
         |         ^
   2 errors generated.
--
>> lib/generic-radix-tree.c:53:12: error: invalid .org offset '1850' (at offset '1854')
      53 |                 if ((v = cmpxchg_release(&radix->root, r, new_root)) == r) {
         |                          ^
   include/linux/atomic/atomic-instrumented.h:4803:2: note: expanded from macro 'cmpxchg_release'
    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:77:29: note: expanded from macro 'raw_cmpxchg_release'
      77 | #define raw_cmpxchg_release arch_cmpxchg_release
         |                             ^
   arch/riscv/include/asm/cmpxchg.h:265:2: note: expanded from macro 'arch_cmpxchg_release'
     265 |         _arch_cmpxchg((ptr), (o), (n),                                  \
         |         ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/riscv/include/asm/alternative-macros.h:104:2: note: expanded from macro '_ALTERNATIVE_CFG'
     104 |         __ALTERNATIVE_CFG(old_c, new_c, vendor_id, patch_id, IS_ENABLED(CONFIG_k))
         |         ^
   arch/riscv/include/asm/alternative-macros.h:94:2: note: expanded from macro '__ALTERNATIVE_CFG'
      94 |         ALT_NEW_CONTENT(vendor_id, patch_id, enable, new_c)
         |         ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
      81 |         ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
         |          ^
   <inline asm>:27:6: note: instantiated into assembly here
      27 | .org    . - (887b - 886b) + (889b - 888b)
         |         ^
   lib/generic-radix-tree.c:74:14: error: invalid .org offset '1862' (at offset '1866')
      74 |                         if (!(n = cmpxchg_release(p, NULL, new_node)))
         |                                   ^
   include/linux/atomic/atomic-instrumented.h:4803:2: note: expanded from macro 'cmpxchg_release'
    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:77:29: note: expanded from macro 'raw_cmpxchg_release'
      77 | #define raw_cmpxchg_release arch_cmpxchg_release
         |                             ^
   arch/riscv/include/asm/cmpxchg.h:265:2: note: expanded from macro 'arch_cmpxchg_release'
     265 |         _arch_cmpxchg((ptr), (o), (n),                                  \
         |         ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/riscv/include/asm/alternative-macros.h:104:2: note: expanded from macro '_ALTERNATIVE_CFG'
     104 |         __ALTERNATIVE_CFG(old_c, new_c, vendor_id, patch_id, IS_ENABLED(CONFIG_k))
         |         ^
   arch/riscv/include/asm/alternative-macros.h:94:2: note: expanded from macro '__ALTERNATIVE_CFG'
      94 |         ALT_NEW_CONTENT(vendor_id, patch_id, enable, new_c)
         |         ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
      81 |         ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
         |          ^
   <inline asm>:27:6: note: instantiated into assembly here
      27 | .org    . - (887b - 886b) + (889b - 888b)
         |         ^
>> lib/generic-radix-tree.c:53:12: error: invalid .org offset '1850' (at offset '1854')
      53 |                 if ((v = cmpxchg_release(&radix->root, r, new_root)) == r) {
         |                          ^
   include/linux/atomic/atomic-instrumented.h:4803:2: note: expanded from macro 'cmpxchg_release'
    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:77:29: note: expanded from macro 'raw_cmpxchg_release'
      77 | #define raw_cmpxchg_release arch_cmpxchg_release
         |                             ^
   arch/riscv/include/asm/cmpxchg.h:265:2: note: expanded from macro 'arch_cmpxchg_release'
     265 |         _arch_cmpxchg((ptr), (o), (n),                                  \
         |         ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/riscv/include/asm/alternative-macros.h:104:2: note: expanded from macro '_ALTERNATIVE_CFG'
     104 |         __ALTERNATIVE_CFG(old_c, new_c, vendor_id, patch_id, IS_ENABLED(CONFIG_k))
         |         ^
   arch/riscv/include/asm/alternative-macros.h:94:2: note: expanded from macro '__ALTERNATIVE_CFG'
      94 |         ALT_NEW_CONTENT(vendor_id, patch_id, enable, new_c)
         |         ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
      81 |         ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
         |          ^
   <inline asm>:27:6: note: instantiated into assembly here
      27 | .org    . - (887b - 886b) + (889b - 888b)
         |         ^
   lib/generic-radix-tree.c:74:14: error: invalid .org offset '1862' (at offset '1866')
      74 |                         if (!(n = cmpxchg_release(p, NULL, new_node)))
         |                                   ^
   include/linux/atomic/atomic-instrumented.h:4803:2: note: expanded from macro 'cmpxchg_release'
    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:77:29: note: expanded from macro 'raw_cmpxchg_release'
      77 | #define raw_cmpxchg_release arch_cmpxchg_release
         |                             ^
   arch/riscv/include/asm/cmpxchg.h:265:2: note: expanded from macro 'arch_cmpxchg_release'
     265 |         _arch_cmpxchg((ptr), (o), (n),                                  \
         |         ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/riscv/include/asm/alternative-macros.h:104:2: note: expanded from macro '_ALTERNATIVE_CFG'
     104 |         __ALTERNATIVE_CFG(old_c, new_c, vendor_id, patch_id, IS_ENABLED(CONFIG_k))
         |         ^
   arch/riscv/include/asm/alternative-macros.h:94:2: note: expanded from macro '__ALTERNATIVE_CFG'
      94 |         ALT_NEW_CONTENT(vendor_id, patch_id, enable, new_c)
         |         ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
      81 |         ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
         |          ^
   <inline asm>:27:6: note: instantiated into assembly here
      27 | .org    . - (887b - 886b) + (889b - 888b)
         |         ^
   4 errors generated.
--
   In file included from lib/refcount.c:6:
   In file included from include/linux/mutex.h:17:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:13:
   In file included from include/linux/cpumask.h:14:
   In file included from include/linux/atomic.h:80:
>> include/linux/atomic/atomic-arch-fallback.h:2083:9: error: invalid .org offset '528' (at offset '532')
    2083 |         return raw_cmpxchg_release(&v->counter, old, new);
         |                ^
   include/linux/atomic/atomic-arch-fallback.h:77:29: note: expanded from macro 'raw_cmpxchg_release'
      77 | #define raw_cmpxchg_release arch_cmpxchg_release
         |                             ^
   arch/riscv/include/asm/cmpxchg.h:265:2: note: expanded from macro 'arch_cmpxchg_release'
     265 |         _arch_cmpxchg((ptr), (o), (n),                                  \
         |         ^
   arch/riscv/include/asm/cmpxchg.h:238:3: note: expanded from macro '_arch_cmpxchg'
     238 |                 __arch_cmpxchg(".w" lr_sfx, ".w" sc_sfx, ".w" cas_sfx,  \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/riscv/include/asm/alternative-macros.h:104:2: note: expanded from macro '_ALTERNATIVE_CFG'
     104 |         __ALTERNATIVE_CFG(old_c, new_c, vendor_id, patch_id, IS_ENABLED(CONFIG_k))
         |         ^
   arch/riscv/include/asm/alternative-macros.h:94:2: note: expanded from macro '__ALTERNATIVE_CFG'
      94 |         ALT_NEW_CONTENT(vendor_id, patch_id, enable, new_c)
         |         ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
      81 |         ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
         |          ^
   <inline asm>:27:6: note: instantiated into assembly here
      27 | .org    . - (887b - 886b) + (889b - 888b)
         |         ^
   In file included from lib/refcount.c:6:
   In file included from include/linux/mutex.h:17:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:13:
   In file included from include/linux/cpumask.h:14:
   In file included from include/linux/atomic.h:80:
   include/linux/atomic/atomic-arch-fallback.h:2083:9: error: invalid .org offset '540' (at offset '544')
    2083 |         return raw_cmpxchg_release(&v->counter, old, new);
         |                ^
   include/linux/atomic/atomic-arch-fallback.h:77:29: note: expanded from macro 'raw_cmpxchg_release'
      77 | #define raw_cmpxchg_release arch_cmpxchg_release
         |                             ^
   arch/riscv/include/asm/cmpxchg.h:265:2: note: expanded from macro 'arch_cmpxchg_release'
     265 |         _arch_cmpxchg((ptr), (o), (n),                                  \
         |         ^
   arch/riscv/include/asm/cmpxchg.h:238:3: note: expanded from macro '_arch_cmpxchg'
     238 |                 __arch_cmpxchg(".w" lr_sfx, ".w" sc_sfx, ".w" cas_sfx,  \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/riscv/include/asm/alternative-macros.h:104:2: note: expanded from macro '_ALTERNATIVE_CFG'
     104 |         __ALTERNATIVE_CFG(old_c, new_c, vendor_id, patch_id, IS_ENABLED(CONFIG_k))
         |         ^
   arch/riscv/include/asm/alternative-macros.h:94:2: note: expanded from macro '__ALTERNATIVE_CFG'
      94 |         ALT_NEW_CONTENT(vendor_id, patch_id, enable, new_c)
         |         ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
      81 |         ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
         |          ^
   <inline asm>:27:6: note: instantiated into assembly here
      27 | .org    . - (887b - 886b) + (889b - 888b)
         |         ^
   In file included from lib/refcount.c:6:
   In file included from include/linux/mutex.h:17:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:13:
   In file included from include/linux/cpumask.h:14:
   In file included from include/linux/atomic.h:80:
>> include/linux/atomic/atomic-arch-fallback.h:2083:9: error: invalid .org offset '528' (at offset '532')
    2083 |         return raw_cmpxchg_release(&v->counter, old, new);
         |                ^
   include/linux/atomic/atomic-arch-fallback.h:77:29: note: expanded from macro 'raw_cmpxchg_release'
      77 | #define raw_cmpxchg_release arch_cmpxchg_release
         |                             ^
   arch/riscv/include/asm/cmpxchg.h:265:2: note: expanded from macro 'arch_cmpxchg_release'
     265 |         _arch_cmpxchg((ptr), (o), (n),                                  \
         |         ^
   arch/riscv/include/asm/cmpxchg.h:238:3: note: expanded from macro '_arch_cmpxchg'
     238 |                 __arch_cmpxchg(".w" lr_sfx, ".w" sc_sfx, ".w" cas_sfx,  \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/riscv/include/asm/alternative-macros.h:104:2: note: expanded from macro '_ALTERNATIVE_CFG'
     104 |         __ALTERNATIVE_CFG(old_c, new_c, vendor_id, patch_id, IS_ENABLED(CONFIG_k))
         |         ^
   arch/riscv/include/asm/alternative-macros.h:94:2: note: expanded from macro '__ALTERNATIVE_CFG'
      94 |         ALT_NEW_CONTENT(vendor_id, patch_id, enable, new_c)
         |         ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
      81 |         ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
         |          ^
   <inline asm>:27:6: note: instantiated into assembly here
      27 | .org    . - (887b - 886b) + (889b - 888b)
         |         ^
   In file included from lib/refcount.c:6:
   In file included from include/linux/mutex.h:17:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:13:
   In file included from include/linux/cpumask.h:14:
   In file included from include/linux/atomic.h:80:
   include/linux/atomic/atomic-arch-fallback.h:2083:9: error: invalid .org offset '540' (at offset '544')
    2083 |         return raw_cmpxchg_release(&v->counter, old, new);
         |                ^
   include/linux/atomic/atomic-arch-fallback.h:77:29: note: expanded from macro 'raw_cmpxchg_release'
      77 | #define raw_cmpxchg_release arch_cmpxchg_release
         |                             ^
   arch/riscv/include/asm/cmpxchg.h:265:2: note: expanded from macro 'arch_cmpxchg_release'
     265 |         _arch_cmpxchg((ptr), (o), (n),                                  \
         |         ^
   arch/riscv/include/asm/cmpxchg.h:238:3: note: expanded from macro '_arch_cmpxchg'
     238 |                 __arch_cmpxchg(".w" lr_sfx, ".w" sc_sfx, ".w" cas_sfx,  \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/riscv/include/asm/alternative-macros.h:104:2: note: expanded from macro '_ALTERNATIVE_CFG'
     104 |         __ALTERNATIVE_CFG(old_c, new_c, vendor_id, patch_id, IS_ENABLED(CONFIG_k))
         |         ^
   arch/riscv/include/asm/alternative-macros.h:94:2: note: expanded from macro '__ALTERNATIVE_CFG'
      94 |         ALT_NEW_CONTENT(vendor_id, patch_id, enable, new_c)
         |         ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
      81 |         ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
         |          ^
   <inline asm>:27:6: note: instantiated into assembly here
      27 | .org    . - (887b - 886b) + (889b - 888b)
         |         ^
   4 errors generated.
--
>> fs/overlayfs/file.c:147:10: error: invalid .org offset '3640' (at offset '3644')
     147 |                         old = cmpxchg_release(&of->upperfile, NULL, upperfile);
         |                               ^
   include/linux/atomic/atomic-instrumented.h:4803:2: note: expanded from macro 'cmpxchg_release'
    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:77:29: note: expanded from macro 'raw_cmpxchg_release'
      77 | #define raw_cmpxchg_release arch_cmpxchg_release
         |                             ^
   arch/riscv/include/asm/cmpxchg.h:265:2: note: expanded from macro 'arch_cmpxchg_release'
     265 |         _arch_cmpxchg((ptr), (o), (n),                                  \
         |         ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/riscv/include/asm/alternative-macros.h:104:2: note: expanded from macro '_ALTERNATIVE_CFG'
     104 |         __ALTERNATIVE_CFG(old_c, new_c, vendor_id, patch_id, IS_ENABLED(CONFIG_k))
         |         ^
   arch/riscv/include/asm/alternative-macros.h:94:2: note: expanded from macro '__ALTERNATIVE_CFG'
      94 |         ALT_NEW_CONTENT(vendor_id, patch_id, enable, new_c)
         |         ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
      81 |         ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
         |          ^
   <inline asm>:27:6: note: instantiated into assembly here
      27 | .org    . - (887b - 886b) + (889b - 888b)
         |         ^
>> fs/overlayfs/file.c:147:10: error: invalid .org offset '3640' (at offset '3644')
     147 |                         old = cmpxchg_release(&of->upperfile, NULL, upperfile);
         |                               ^
   include/linux/atomic/atomic-instrumented.h:4803:2: note: expanded from macro 'cmpxchg_release'
    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:77:29: note: expanded from macro 'raw_cmpxchg_release'
      77 | #define raw_cmpxchg_release arch_cmpxchg_release
         |                             ^
   arch/riscv/include/asm/cmpxchg.h:265:2: note: expanded from macro 'arch_cmpxchg_release'
     265 |         _arch_cmpxchg((ptr), (o), (n),                                  \
         |         ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/riscv/include/asm/alternative-macros.h:104:2: note: expanded from macro '_ALTERNATIVE_CFG'
     104 |         __ALTERNATIVE_CFG(old_c, new_c, vendor_id, patch_id, IS_ENABLED(CONFIG_k))
         |         ^
   arch/riscv/include/asm/alternative-macros.h:94:2: note: expanded from macro '__ALTERNATIVE_CFG'
      94 |         ALT_NEW_CONTENT(vendor_id, patch_id, enable, new_c)
         |         ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
      81 |         ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
         |          ^
   <inline asm>:27:6: note: instantiated into assembly here
      27 | .org    . - (887b - 886b) + (889b - 888b)
         |         ^
   2 errors generated.
..


vim +156 include/linux/objpool.h

b4edb8d2d4647a wuqiang.matt    2023-10-17  100  
b4edb8d2d4647a wuqiang.matt    2023-10-17  101  /**
b4edb8d2d4647a wuqiang.matt    2023-10-17  102   * objpool_init() - initialize objpool and pre-allocated objects
b4edb8d2d4647a wuqiang.matt    2023-10-17  103   * @pool:    the object pool to be initialized, declared by caller
b4edb8d2d4647a wuqiang.matt    2023-10-17  104   * @nr_objs: total objects to be pre-allocated by this object pool
b4edb8d2d4647a wuqiang.matt    2023-10-17  105   * @object_size: size of an object (should be > 0)
b4edb8d2d4647a wuqiang.matt    2023-10-17  106   * @gfp:     flags for memory allocation (via kmalloc or vmalloc)
b4edb8d2d4647a wuqiang.matt    2023-10-17  107   * @context: user context for object initialization callback
b4edb8d2d4647a wuqiang.matt    2023-10-17  108   * @objinit: object initialization callback for extra setup
b4edb8d2d4647a wuqiang.matt    2023-10-17  109   * @release: cleanup callback for extra cleanup task
b4edb8d2d4647a wuqiang.matt    2023-10-17  110   *
b4edb8d2d4647a wuqiang.matt    2023-10-17  111   * return value: 0 for success, otherwise error code
b4edb8d2d4647a wuqiang.matt    2023-10-17  112   *
b4edb8d2d4647a wuqiang.matt    2023-10-17  113   * All pre-allocated objects are to be zeroed after memory allocation.
b4edb8d2d4647a wuqiang.matt    2023-10-17  114   * Caller could do extra initialization in objinit callback. objinit()
b4edb8d2d4647a wuqiang.matt    2023-10-17  115   * will be called just after slot allocation and called only once for
b4edb8d2d4647a wuqiang.matt    2023-10-17  116   * each object. After that the objpool won't touch any content of the
b4edb8d2d4647a wuqiang.matt    2023-10-17  117   * objects. It's caller's duty to perform reinitialization after each
b4edb8d2d4647a wuqiang.matt    2023-10-17  118   * pop (object allocation) or do clearance before each push (object
b4edb8d2d4647a wuqiang.matt    2023-10-17  119   * reclamation).
b4edb8d2d4647a wuqiang.matt    2023-10-17  120   */
b4edb8d2d4647a wuqiang.matt    2023-10-17  121  int objpool_init(struct objpool_head *pool, int nr_objs, int object_size,
b4edb8d2d4647a wuqiang.matt    2023-10-17  122  		 gfp_t gfp, void *context, objpool_init_obj_cb objinit,
b4edb8d2d4647a wuqiang.matt    2023-10-17  123  		 objpool_fini_cb release);
b4edb8d2d4647a wuqiang.matt    2023-10-17  124  
a3b00f10da808b Andrii Nakryiko 2024-04-24  125  /* try to retrieve object from slot */
a3b00f10da808b Andrii Nakryiko 2024-04-24  126  static inline void *__objpool_try_get_slot(struct objpool_head *pool, int cpu)
a3b00f10da808b Andrii Nakryiko 2024-04-24  127  {
a3b00f10da808b Andrii Nakryiko 2024-04-24  128  	struct objpool_slot *slot = pool->cpu_slots[cpu];
a3b00f10da808b Andrii Nakryiko 2024-04-24  129  	/* load head snapshot, other cpus may change it */
a3b00f10da808b Andrii Nakryiko 2024-04-24  130  	uint32_t head = smp_load_acquire(&slot->head);
a3b00f10da808b Andrii Nakryiko 2024-04-24  131  
a3b00f10da808b Andrii Nakryiko 2024-04-24  132  	while (head != READ_ONCE(slot->last)) {
a3b00f10da808b Andrii Nakryiko 2024-04-24  133  		void *obj;
a3b00f10da808b Andrii Nakryiko 2024-04-24  134  
a3b00f10da808b Andrii Nakryiko 2024-04-24  135  		/*
a3b00f10da808b Andrii Nakryiko 2024-04-24  136  		 * data visibility of 'last' and 'head' could be out of
a3b00f10da808b Andrii Nakryiko 2024-04-24  137  		 * order since memory updating of 'last' and 'head' are
a3b00f10da808b Andrii Nakryiko 2024-04-24  138  		 * performed in push() and pop() independently
a3b00f10da808b Andrii Nakryiko 2024-04-24  139  		 *
a3b00f10da808b Andrii Nakryiko 2024-04-24  140  		 * before any retrieving attempts, pop() must guarantee
a3b00f10da808b Andrii Nakryiko 2024-04-24  141  		 * 'last' is behind 'head', that is to say, there must
a3b00f10da808b Andrii Nakryiko 2024-04-24  142  		 * be available objects in slot, which could be ensured
a3b00f10da808b Andrii Nakryiko 2024-04-24  143  		 * by condition 'last != head && last - head <= nr_objs'
a3b00f10da808b Andrii Nakryiko 2024-04-24  144  		 * that is equivalent to 'last - head - 1 < nr_objs' as
a3b00f10da808b Andrii Nakryiko 2024-04-24  145  		 * 'last' and 'head' are both unsigned int32
a3b00f10da808b Andrii Nakryiko 2024-04-24  146  		 */
a3b00f10da808b Andrii Nakryiko 2024-04-24  147  		if (READ_ONCE(slot->last) - head - 1 >= pool->nr_objs) {
a3b00f10da808b Andrii Nakryiko 2024-04-24  148  			head = READ_ONCE(slot->head);
a3b00f10da808b Andrii Nakryiko 2024-04-24  149  			continue;
a3b00f10da808b Andrii Nakryiko 2024-04-24  150  		}
a3b00f10da808b Andrii Nakryiko 2024-04-24  151  
a3b00f10da808b Andrii Nakryiko 2024-04-24  152  		/* obj must be retrieved before moving forward head */
a3b00f10da808b Andrii Nakryiko 2024-04-24  153  		obj = READ_ONCE(slot->entries[head & slot->mask]);
a3b00f10da808b Andrii Nakryiko 2024-04-24  154  
a3b00f10da808b Andrii Nakryiko 2024-04-24  155  		/* move head forward to mark it's consumption */
a3b00f10da808b Andrii Nakryiko 2024-04-24 @156  		if (try_cmpxchg_release(&slot->head, &head, head + 1))
a3b00f10da808b Andrii Nakryiko 2024-04-24  157  			return obj;
a3b00f10da808b Andrii Nakryiko 2024-04-24  158  	}
a3b00f10da808b Andrii Nakryiko 2024-04-24  159  
a3b00f10da808b Andrii Nakryiko 2024-04-24  160  	return NULL;
a3b00f10da808b Andrii Nakryiko 2024-04-24  161  }
a3b00f10da808b Andrii Nakryiko 2024-04-24  162  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
