Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06B8CCFA00
	for <kvm-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 09:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XvxrowFbfYyG8qgU3gr+vZ+gbE40q5lp8IUwWhwZL/k=; b=2g/kAzu/B3HlnM
	pY9jZ6cxOoCNxxhUEI8cCLR9pBbX5QE4DISUOiSCbS5AFGZIW1ldHhs94drm2qTIoATZ/dSIgbr79
	SoBuV8hgz0LEPMXOcNBkGm541SPYgIFudIIFZUTg+ftkbLxwJAm83uX4FrbtJe8WbmtgmpBLXUEpU
	bnV5EqjbpS7s5c3NMQzQd1IU56xAT309wE6q/N5avM26KlSkPsIkNnAC/OkGbkpleEv0jAXkJP6KB
	mzx+Yr0rg2KwqdHlXAZYjpNunoShtsYDuBGJ6y7LOdHSwebpb0LT0A8jHVc1w9Xkl4eKqnTfOon5v
	XwbA6Qxs4lTKM3fEyawA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElAF-00000005mNg-1Kg4;
	Fri, 31 Oct 2025 09:11:19 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElAC-00000005mMi-3Vpj;
	Fri, 31 Oct 2025 09:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761901877; x=1793437877;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nVFcr7cSAivJ3kX3Ong+t5W82ll2lBVB0+D6Fy+f66w=;
  b=HQCZO9vTEpjJxjl/WaTCvT+awRwcTymmY5VKXIyecuwkdXGSQ4CdTnUI
   I+SrED/yK0H0+LUQlpaR8xRryORZOVL1URSehS1vyIaEvzTNXIcsTgOaH
   tdeT6vlFUshLs8u11njnrWwIo6ImhQlkoUHf7wDQ7H2h3/oCBBwIMMSdV
   ajxLSEMH9BbPzsF+p5NWMQ1TFqL3cp0KcQswEkWcN50GI+PFF8wH1sBsT
   HbD5HCUpsLuHLF3Cia/l8G5NOIlTYr9Cxnu2hexEzm33E+kjxoTct31c1
   32154/Mipa40drH93kHLEL9tV4E5ELqv45Hl4q3z5INSOrK4ZKbJ9HvRI
   g==;
X-CSE-ConnectionGUID: 0lJdMZqtTvyWYvAtTFoI0g==
X-CSE-MsgGUID: P7eqIzj4RTKUnhc/NyCxvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="74350454"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="74350454"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:11:16 -0700
X-CSE-ConnectionGUID: mtRCVhiuRGSbh+b9MLYkrw==
X-CSE-MsgGUID: naB5mn6dRoCATJ8bJWh6cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186124007"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.240.28]) ([10.124.240.28])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:11:08 -0700
Message-ID: <709166ed-2102-46f2-807b-3d8139a386f0@linux.intel.com>
Date: Fri, 31 Oct 2025 17:11:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/28] KVM: TDX: Add tdx_get_cmd() helper to get and
 validate sub-ioctl command
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
 <20251030200951.3402865-23-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251030200951.3402865-23-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_021116_972976_6565129E 
X-CRM114-Status: UNSURE (   5.16  )
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



On 10/31/2025 4:09 AM, Sean Christopherson wrote:
> Add a helper to copy a kvm_tdx_cmd structure from userspace and verify
> that must-be-zero fields are indeed zero.
>
> No functional change intended.
>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Reviewed-by: Kai Huang <kai.huang@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
