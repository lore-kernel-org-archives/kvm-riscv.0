Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18277FEE4C5
	for <kvm-riscv@archiver.kernel.org>; Sat, 28 Feb 2026 04:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6TxkI10Fx2Z2yaCWuB7lUtpH/hcRT2kU2g0bxYO4crM=; b=bu0iHMYmznfvas
	+jcPfiAU65b97904d8w8e4iS4pRYMVmAeu9wsyDm7NOCnlXA69K/rqTgqlDT1cRjcs97gc2XRPdmO
	1kPGwmuQiB3bNeRcVyJt2ZCOFuKXYFpVVrryCZUHNiatxPsh2Z62F4unmpaxa6bDFjOZj+flKZE8z
	2iKwy/gmPk72nzx2QWYF6dasroa5q7pxPrvHbiR3qqczIzg8Uhfk5pHUpn4N2HSjEczyPqFj6r5Wo
	bnefNqsB33Hx1vppecuOtMUwcHsIUhD+sqHQdaQI4G+lnwHfxDM69ucu4xsTPW6Y1mRBe5yzt70sp
	7bwhs8LY8JuhlWknLldA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwC7I-00000009UUm-2hTc;
	Sat, 28 Feb 2026 04:39:48 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwC7D-00000009UU9-1gMv;
	Sat, 28 Feb 2026 04:39:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772253583; x=1803789583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S9F20WCWh4WNQT9heMZVPcCyAc2mdy+zssVY544bAXg=;
  b=BHosO+YtcDzHFjTDSZBmHTyIgD5Yqzn+HJSw5nbAmrGzpXOvJHblIBbg
   zFol7eaLJja+Q8xXWjV8LfnOAuxp4Wwh0QGMru3+fPlago40TVmpvI5/D
   MrXGAuSNZKhXOBznsNWvZm7vUWuf5T/GemvK2uApBLjbNM/WP8oQNIBpF
   DR3mhnmV3RCxgfGlKhvEcKkQEZn2n5UJaZP/0P3XYihmAPcXwVFMu152c
   GuFvIpeywWG1bY3BpTCnYn7UrSO6gTZVtLD8nwHHtJ6bx5qb9o3uU/fhE
   CgFXgwCL2A2XdnPc7ThmyivP8YLLOnVPYT+N+uZIJroNxeD0+p5pNcbCe
   A==;
X-CSE-ConnectionGUID: p76sKq+ZQxaLn+ycU/ALPw==
X-CSE-MsgGUID: fmsnT7XcRjelkT87Og+Q5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="84044899"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="84044899"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 20:39:42 -0800
X-CSE-ConnectionGUID: Dg/4g3fLTWuVI4rhLvzZ1A==
X-CSE-MsgGUID: PZz/gNCrR6+n+zwnOxmA4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="216991849"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 27 Feb 2026 20:39:38 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwC76-000000000hd-1TaT;
	Sat, 28 Feb 2026 04:39:36 +0000
Date: Sat, 28 Feb 2026 05:38:50 +0100
From: kernel test robot <lkp@intel.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org, kvm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>
Subject: Re: [PATCH v9 2/3] KVM: selftests: Refactor UAPI tests into
 dedicated function
Message-ID: <202602280523.Y5Q8Pdft-lkp@intel.com>
References: <20260228005355.823048-3-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260228005355.823048-3-xujiakai2025@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_203943_451406_334A020A 
X-CRM114-Status: GOOD (  10.45  )
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

Hi Jiakai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.19]
[cannot apply to kvm/queue kvm/next linus/master kvm/linux-next v7.0-rc1 next-20260227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiakai-Xu/RISC-V-KVM-Validate-SBI-STA-shmem-alignment-in-kvm_sbi_ext_sta_set_reg/20260228-085648
base:   v6.19
patch link:    https://lore.kernel.org/r/20260228005355.823048-3-xujiakai2025%40iscas.ac.cn
patch subject: [PATCH v9 2/3] KVM: selftests: Refactor UAPI tests into dedicated function
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260228/202602280523.Y5Q8Pdft-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260228/202602280523.Y5Q8Pdft-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602280523.Y5Q8Pdft-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> steal_time.c:207:13: warning: function declaration isn't a prototype [-Wstrict-prototypes]
     207 | static void check_steal_time_uapi()
         |             ^~~~~~~~~~~~~~~~~~~~~
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
