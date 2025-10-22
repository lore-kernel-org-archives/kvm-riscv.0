Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F72CCCD1AB
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 05:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0S6e2urkok2shpbZVqC61T0ibb1vO69sqMysgvmmlwI=; b=IPtdNIZnlddXzV
	L78P458C7aqxdl3wL09QS5X2uneqU25rdLoImXg+2Wnw00egRoKO3weuzKXVBP3BmZ1HXY+TlOFCg
	aUN3ZvejZLszTHH0vefaOPHraEPuaedQ9llyxaaA7UJKiFs/VSNdCRSSY/6jkT651lrnwbcr3PAIZ
	WxmPr95pah0nPYuMxjHkbhNPTomdHUYt7MSEhuLpm0JExx2j8SYgxPqfkrNkJ184eZ10Xz0oA3B51
	IJWcqYHViKnojsxE3yHwV5JH4EcRBhQunqYZU/ld85mp1MjgrwGWXzfXYlnn9SqANd5GujUfZuLtY
	40v4cZxiO5nYoj1klX1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBRqT-00000001ahK-2zlE;
	Wed, 22 Oct 2025 05:57:13 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBRqQ-00000001agZ-2xSY;
	Wed, 22 Oct 2025 05:57:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761112631; x=1792648631;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Oq4fzkS01zCv2I4qOypTEqukIE12MkuzMGCj+rV1CCw=;
  b=E7Jfqqcdu7VQT1dxrFmwMMNAG5K7CoSj6nOrzt4x7aIA+SIH9WASa5dI
   i1AP78MKcZ87csLhzI+funJzjC1R+n7awfOxP2gYyMUNU5k7rgJeaoXVB
   wpzZ9yfNenup1BpwBpvRAcoDhSzIBCK1Mv+q0Mi3bF1clrloQOrP/k1Is
   4csnRM4NjzKFLc4rvl4RRjtrGgtf/Oq3nTGydaLfxZKovYO6Mk+b90t5s
   5Tfw9lBgIXzkp9TYnhE/1rZ8st4YLBIfEoGkS2L7mKs/TBQGyySTzMzi5
   4WixOG036XIQOZ7TvC27lkSBtBke8uDHVqoQeSmNEfGfvVnRYzBuLN6z0
   A==;
X-CSE-ConnectionGUID: kxnOYL+oTt2GAusw+D3Yfw==
X-CSE-MsgGUID: Zid8ajUNTge+Ts5R8O3QVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63146729"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="63146729"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 22:57:11 -0700
X-CSE-ConnectionGUID: jQ221r4UTleoxdP+jV1Nkg==
X-CSE-MsgGUID: d9hLZVuOTp+rHjN7swLSrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="184184728"
Received: from yinghaoj-desk.ccr.corp.intel.com (HELO [10.238.1.225]) ([10.238.1.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 22:57:02 -0700
Message-ID: <bfe00290-6ab3-4c09-b0bf-46bb7af09d60@linux.intel.com>
Date: Wed, 22 Oct 2025 13:57:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/25] KVM: x86/mmu: Rename kvm_tdp_map_page() to
 kvm_tdp_page_prefault()
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
References: <20251017003244.186495-1-seanjc@google.com>
 <20251017003244.186495-7-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251017003244.186495-7-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_225710_798287_9C538B38 
X-CRM114-Status: UNSURE (   5.30  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org



On 10/17/2025 8:32 AM, Sean Christopherson wrote:
> Rename kvm_tdp_map_page() to kvm_tdp_page_prefault() now that it's used
> only by kvm_arch_vcpu_pre_fault_memory().
>
> No functional change intended.
>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
