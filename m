Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246C8CCF9FA
	for <kvm-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 09:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jvhXGBzz9Dw/lIVdeOIl83cJs46qHla6I24Pr6+GMSI=; b=gY5nItVD0ItRq/
	MWxihMpQUdwYPtF5KZf8DRXAsROU6T5xKERPhHYLhNBOPoqKp/jp+NcA468M6ESI1xBLKRuRtwnha
	uKoZNoX7Dr7a94Ki3y9zKEs7TvkxehrsYVd7oHnRYEo2NsVqv8uAzvTd8EIjjR2WWiLq2gsaSYLo+
	fCGChHK2oJhzvtXEwiSZX5lQ+zP4YNdRyQ98IAa+ktGVX5FDjU9n5wMdqr8kZ6cgkndseE3gRhanC
	AMenBwyDjr8/5vtbsZ1B4se8e4yyHpRctLaLKrP0wOkC4uHgIm3DWuBGbhzVGkmystzZncipRFLTo
	zJGAzAPmdZ9LJLE8B9pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElEC-00000005myc-3hBV;
	Fri, 31 Oct 2025 09:15:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElEB-00000005my5-3GVR;
	Fri, 31 Oct 2025 09:15:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PEZyjCEAirGsnd1ualshLT165jeP3bC2ATQpTmkSqys=; b=HKefvg7EDXbPfBs+iJg6JYbc2e
	jnq2ouAp//9vvt29M6RoqH20eb1KlV1AY9FwyQLyclhAgNxdbGgR7nJwTxn0CuGMWDrteFOC3bnkK
	bXQBJ3IkDCm1oR+KW5TFC9fZrtj5TaMSnu8JBJ3n4Hf+aFBkU6qltx6K4UMkhC5XODSZFjngyCR9B
	k/sJHpsB7LIUV0HF4tvgzEvBKakrkOuHh1VU+Ss43L3st5R5EW1kSfMDzccxuv3FzuZm9HpPK6AJc
	PeS1BbVRLhe22CldJJJyMF30fpgW3xy0O8LqEJOmoZW6EPq3mmVV4YE1AsAM2GJ5ajLcDPq9zftxV
	f9ufiNWA==;
Received: from mgamail.intel.com ([198.175.65.9])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkMP-0000000AsVG-24uA;
	Fri, 31 Oct 2025 08:19:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761902120; x=1793438120;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PEZyjCEAirGsnd1ualshLT165jeP3bC2ATQpTmkSqys=;
  b=WcCj5oD0u3zhbShu6vPwdHnGv45HkFutP4XpTLr9oQ+lqdLQ/nb6DySR
   uVUvXaiD/VpZiPDt96Mkgl65WCWkb45dA10EAbNra0ic8m7tQqSKH7ZS7
   xxSOgkk7UHhGeQPye025TecTI1ONC0WvNiQ3ElThXIgT0+C5JGG+k5wdi
   EM+XVIvSThBDvxmc3KaEqqJ+2aSFGZiJ/U6RgQBYNWb6y9/jKi/UL8D9C
   j2DJVFbUVI25vFVZ2fefHwONQCyGAg7JE+WVhuxSN+NBwbqZuo/eJLqYo
   CxiY1T6UETb+ozqpZVi8Pe67mwn9RK8ROVIPXqNeobovDjpe5AER8fbq1
   g==;
X-CSE-ConnectionGUID: 3s/SO0FiS6uvvHQTkJryvA==
X-CSE-MsgGUID: CFDetKpPTfajPX7W5VXg3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="86683964"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="86683964"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:15:18 -0700
X-CSE-ConnectionGUID: /aUTuTUZR1CXvXYAACxkEg==
X-CSE-MsgGUID: 8/kgW76KTTCO7UxJ6gCbbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186125404"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.240.28]) ([10.124.240.28])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:15:09 -0700
Message-ID: <fd65c501-296a-4f77-86fc-7de61a7c5eeb@linux.intel.com>
Date: Fri, 31 Oct 2025 17:15:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/28] KVM: TDX: Convert INIT_MEM_REGION and INIT_VCPU
 to "unlocked" vCPU ioctl
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
 <20251030200951.3402865-24-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251030200951.3402865-24-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_081950_174619_4CFA0253 
X-CRM114-Status: UNSURE (   4.97  )
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
> Handle the KVM_TDX_INIT_MEM_REGION and KVM_TDX_INIT_VCPU vCPU sub-ioctls
> in the unlocked variant, i.e. outside of vcpu->mutex, in anticipation of
> taking kvm->lock along with all other vCPU mutexes, at which point the
> sub-ioctls _must_ start without vcpu->mutex held.
>
> No functional change intended.
>
> Reviewed-by: Kai Huang <kai.huang@intel.com>
> Co-developed-by: Yan Zhao <yan.y.zhao@intel.com>
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
