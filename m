Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35569CCD1BE
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 05:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=54vjrkUMyHInu+veTBxN8m10Ln9SHKna9mcXd7TbUUc=; b=aR9kjx3qYxq99y
	AjCxhLVY3iCNpXbg8WyH+4kLXfsY80yfQWGFuMYk9Jm3BxeqBekeVfgzINM2QuOF3Yx2HGl+8N6nj
	6MszsQ5lHZlllbsI+QJquCUn+iGg+LDyd7FThAJ8dhmL/BV3JYf2oq3Y5gk+DK1/xBj+J8L2BUX3T
	rzzxDoHvfZlpHxEGWpcuW4WZE9Iz3OAsMGNJ/geeybERCmb5uI/CksWQ6yhPZiP/W1jkGjDywBkTU
	tPHllucTkCjEXh6xft4JrOV5oGIZuztHJd8nkLjqkjZdizcJKadzks2CHiZ3UZF0y196yWXHhWwTd
	R+s0pDLBaSTA9JHsciiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBRpw-00000001aXX-2WsP;
	Wed, 22 Oct 2025 05:56:40 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBRpr-00000001aWb-3ZF4;
	Wed, 22 Oct 2025 05:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761112596; x=1792648596;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=e0BNSEe8+JWm79ZsctEdZVSTDEu6ZAcAN5FVm7Wus1E=;
  b=fq9beKtZpSZ9xtF+1HtgOxXkuuxjT4aQcwDE1euEyeV7Srf9KEC3+Wkp
   N2HU5onhiIKNBycmOWo333J71u/xv0N8gUnRtNJokKeVJyn2u9b5JWOrf
   ULvKNp+Snf9bPgTr3OWDqvyYHcqC5iju7Jx/zzBdGeelzj2gMGSPOuyiT
   ySstzO4fXUxfPN7+M50NCYJ38POiG4+gc5+rLVt+Uf0P7itDQDwvV0izU
   YXrXf86y0I/2f9OJccsLMHRs3VavY0uDXlJAxJ93CTcZBVQGz8006BBC8
   PJ79/mKqSTUkt+PxuqCH5vQLdHmaFJEGOut9fksw+TVkHc0ihel32Ny9s
   w==;
X-CSE-ConnectionGUID: KO1MkNg5StudS2cBFr9/Kg==
X-CSE-MsgGUID: Qtq9cOyETvmYA96MBm7amA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="65866356"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="65866356"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 22:56:35 -0700
X-CSE-ConnectionGUID: oEyBARVoRTqxmx9FX15Ezg==
X-CSE-MsgGUID: iu37FNdWT/WUX/u/fUlTIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="184184586"
Received: from yinghaoj-desk.ccr.corp.intel.com (HELO [10.238.1.225]) ([10.238.1.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 22:56:28 -0700
Message-ID: <7aa86887-b499-4618-b174-96cb0cd17d24@linux.intel.com>
Date: Wed, 22 Oct 2025 13:56:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/25] Revert "KVM: x86/tdp_mmu: Add a helper function
 to walk down the TDP MMU"
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
 <20251017003244.186495-6-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251017003244.186495-6-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_225635_925834_8C88B1FD 
X-CRM114-Status: UNSURE (   6.73  )
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
> Remove the helper and exports that were added to allow TDX code to reuse
> kvm_tdp_map_page() for its gmem post-populate flow now that a dedicated
> TDP MMU API is provided to install a mapping given a gfn+pfn pair.
>
> This reverts commit 2608f105760115e94a03efd9f12f8fbfd1f9af4b.
>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
