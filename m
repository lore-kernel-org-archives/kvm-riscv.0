Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CCECCF9FF
	for <kvm-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 09:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1sGrvM0InSapyHJz0xOx4FHk3TuixCFuI75GEWnXgPo=; b=LEtkUb1sD+BXwS
	/EKzc9kCpLZccxU7XcIbo1p043PYrjiJjw5xbTWx5lfHwCqTxmKISBk0Hud3YLpXIFuIrE1W1XSrw
	hdKDXA7GaMwv2J228ejBSwCepESKWV+xe4x2VteVq9BtIqxO7W6EyDWTBc6H6JSj2BHs5AoRF0+44
	Q8PtwpUMGsFXSqH4b72zLpNWfANFl4P0qpLU12GtTJYcVMZEIY+JUpDPqZVvvy6i8P1cGfpQAx0Gx
	97qRJeMM8NPbBdtekyxG6SaYbqYB09JzzFjgfFxfWxw3Gmf0oit/WMKIISzq4mcU9fIezrXpwinyE
	JrqUk6z/psmnu6g7+O6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEl0G-00000005jc6-3xgb;
	Fri, 31 Oct 2025 09:01:00 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEl0E-00000005jb9-3aYK;
	Fri, 31 Oct 2025 09:01:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761901259; x=1793437259;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WrRAkZWX2mY1Sn4BYh8lP0+Uv8J4x4xta8TyjbzO6EM=;
  b=lHHI6V6F4lInmIzBAzP9xBv0MJ92EhLMiOkZKunq8JEjUeLG9qoG9qKh
   9aVspXKQpPfzDjssOffE4UrcG4jH7fnpjAggV6WG+G17NgQlZZGQqd1Zu
   5RVyI0EhSAKgZcMcDewhKWx/61IRC9MuKQdD8RXJYlNwykkFzKhOrixF8
   QeXARLcHfwd1DC25oXsWmUKbIaamp2dl5rL8hQm2bq/xifOy9r8kq0QMd
   okzwWAeM+bSKOm4hznYvEc1yKJLjj8S0zqiyelPTkHvg6es0Mkz5qmkWp
   UZWDwkUcNwQMH3DYF7xGuEuwPqgzItDtb+CuQrGXiaLue6901jQLR8vkR
   g==;
X-CSE-ConnectionGUID: 2tqFAF0iQ+uVokxrwkEcrw==
X-CSE-MsgGUID: i18R2IoSTEaCr5oukkrhZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="86681040"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="86681040"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:00:58 -0700
X-CSE-ConnectionGUID: Dd9eBStPTB2R+zNgqb0uKQ==
X-CSE-MsgGUID: AT1MnrH1RWGItLZni9BlRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186120016"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.240.28]) ([10.124.240.28])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:00:50 -0700
Message-ID: <326290aa-def6-478c-9ef3-1649e027e5d5@linux.intel.com>
Date: Fri, 31 Oct 2025 17:00:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/28] KVM: TDX: Derive error argument names from the
 local variable names
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
 <20251030200951.3402865-20-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251030200951.3402865-20-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_020058_962867_D23F410D 
X-CRM114-Status: GOOD (  10.57  )
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
> When printing SEAMCALL errors, use the name of the variable holding an
> error parameter instead of the register from whence it came, so that flows
> which use descriptive variable names will similarly print descriptive
> error messages.
>
> Suggested-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

> ---
>   arch/x86/kvm/vmx/tdx.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index 5e6f2d8b6014..63d4609cc3bc 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -41,14 +41,15 @@
>   #define TDX_BUG_ON(__err, __fn, __kvm)				\
>   	__TDX_BUG_ON(__err, #__fn, __kvm, "%s", "")
>   
> -#define TDX_BUG_ON_1(__err, __fn, __rcx, __kvm)			\
> -	__TDX_BUG_ON(__err, #__fn, __kvm, ", rcx 0x%llx", __rcx)
> +#define TDX_BUG_ON_1(__err, __fn, a1, __kvm)			\
> +	__TDX_BUG_ON(__err, #__fn, __kvm, ", " #a1 " 0x%llx", a1)
>   
> -#define TDX_BUG_ON_2(__err, __fn, __rcx, __rdx, __kvm)		\
> -	__TDX_BUG_ON(__err, #__fn, __kvm, ", rcx 0x%llx, rdx 0x%llx", __rcx, __rdx)
> +#define TDX_BUG_ON_2(__err, __fn, a1, a2, __kvm)	\
> +	__TDX_BUG_ON(__err, #__fn, __kvm, ", " #a1 " 0x%llx, " #a2 " 0x%llx", a1, a2)
>   
> -#define TDX_BUG_ON_3(__err, __fn, __rcx, __rdx, __r8, __kvm)	\
> -	__TDX_BUG_ON(__err, #__fn, __kvm, ", rcx 0x%llx, rdx 0x%llx, r8 0x%llx", __rcx, __rdx, __r8)
> +#define TDX_BUG_ON_3(__err, __fn, a1, a2, a3, __kvm)	\
> +	__TDX_BUG_ON(__err, #__fn, __kvm, ", " #a1 " 0x%llx, " #a2 ", 0x%llx, " #a3 " 0x%llx", \
> +		     a1, a2, a3)
>   
>   
>   bool enable_tdx __ro_after_init;


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
