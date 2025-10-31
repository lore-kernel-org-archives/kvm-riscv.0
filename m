Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E002CCF9EE
	for <kvm-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 07:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HeROHVnYuj+/VFivR/IQE7kZK1YCWtN2K8+LOOXJ7O0=; b=W1wkiDDXQAZftc
	mizI8j0NyDb05FWdaSSLsKuTY+MNhIvZ+L9qjuvqOzQPlrGsWKhUIN103vGcXJQ4HSZJOrxImQc9A
	BXM3Rw9QhboRJtcv7lnxlXZg3x4A0PUGduy9R+PNw5GMx8gbujrxv4DgvP4qF+NsUnRnzhI938gKp
	QVQy+0qnFvVpFqDs5Iz5Y0fcMST/yQ60Z1XcczDhjkF5UdjZaTzcPAJPTf0/YYdticuMVzPRPivOO
	bKRBBR4e4a1XH7oRguPAs5mg3IEGjxl7JbSgA2OElmU23hPvxy/+rBjSrPGyuJvZDlWKFjmWwbvK+
	GiyIiMHlqHLdq3BUxYig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEk1u-00000005aQj-372J;
	Fri, 31 Oct 2025 07:58:38 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEk1p-00000005aP7-2ijY;
	Fri, 31 Oct 2025 07:58:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761897513; x=1793433513;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rzM0b8qPEYkMq5nIoO4tMjMsIEGrMoYlxde7BXZgKfY=;
  b=goZspn5dnwSdx0wnGIBedLEsVmCijQR8zOYDAJ9DYziwKsyIJyYBEysK
   9rmBTMXeIkJW8t94ZLfZGI/bH6NQh1aXyOtVQQF5K268be1bEl972jb1W
   DTTNvLO7voXC/gPxSFH4D9OEtIQb7Yby5JgOWBuJlsoKb0EIDZP3salof
   /EOu764ODGwOAYplkyRe5aUZuD4mrJZxspR9m5M70YBsCtdSyLayEWecp
   S13125gqwWd10Np1sqThsaEDwQPA8514P/Wfx4s8Bx9WoLObGJ67+jZ07
   jBp1f1sPtcuTqRWTYw6RCQrXTdE4Uk/m03NCvMApNYRK38lNbqpxKkeZa
   w==;
X-CSE-ConnectionGUID: 8EqcAGlwQiurG76xyQ3nNg==
X-CSE-MsgGUID: Selr6ap1TDufxyEf349Mog==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="74729288"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="74729288"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 00:58:32 -0700
X-CSE-ConnectionGUID: aelFfb7/T7+TXvXFUL/t7w==
X-CSE-MsgGUID: o2Ju4geKSZSKLBD3vX8YRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="186108753"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.240.28]) ([10.124.240.28])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 00:58:25 -0700
Message-ID: <7e43061a-b901-4e8f-8ee9-57d67aaf4f38@linux.intel.com>
Date: Fri, 31 Oct 2025 15:58:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/28] KVM: x86/mmu: Add dedicated API to map
 guest_memfd pfn into TDP MMU
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ackerley Tng <ackerleytng@google.com>
References: <20251030200951.3402865-1-seanjc@google.com>
 <20251030200951.3402865-5-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251030200951.3402865-5-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_005833_882312_109EBBC3 
X-CRM114-Status: GOOD (  12.51  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org



On 10/31/2025 4:09 AM, Sean Christopherson wrote:
> Add and use a new API for mapping a private pfn from guest_memfd into the
> TDP MMU from TDX's post-populate hook instead of partially open-coding the
> functionality into the TDX code.  Sharing code with the pre-fault path
> sounded good on paper, but it's fatally flawed as simulating a fault loses
> the pfn, and calling back into gmem to re-retrieve the pfn creates locking
> problems, e.g. kvm_gmem_populate() already holds the gmem invalidation
> lock.
>
> Providing a dedicated API will also removing several MMU exports that
> ideally would not be exposed outside of the MMU, let alone to vendor code.
> On that topic, opportunistically drop the kvm_mmu_load() export.  Leave
> kvm_tdp_mmu_gpa_is_mapped() alone for now; the entire commit that added
> kvm_tdp_mmu_gpa_is_mapped() will be removed in the near future.
>
> Gate the API on CONFIG_KVM_GUEST_MEMFD=y as private memory _must_ be backed
> by guest_memfd.  Add a lockdep-only assert to that the incoming pfn is
> indeed backed by guest_memfd, and that the gmem instance's invalidate lock
> is held (which, combined with slots_lock being held, obviates the need to
> check for a stale "fault").
>
> Cc: Michael Roth <michael.roth@amd.com>
> Cc: Yan Zhao <yan.y.zhao@intel.com>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Cc: Vishal Annapurve <vannapurve@google.com>
> Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Reviewed-by: Kai Huang <kai.huang@intel.com>
> Link: https://lore.kernel.org/all/20250709232103.zwmufocd3l7sqk7y@amd.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
