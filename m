Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E343CC71155
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 10:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Mime-Version:
	Message-Id:Date:From:Cc:To:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=thZg1lSPCKKrkA+0QmKCrAu+4Lf7DzFI9W+Dhd922Eo=; b=oTxcvOEl51ZFsa
	DjzXYGMZdwnEkIJnQ5WT0gHH3uQhUPkjSC3+/NQ7WiveYNayEqLQrefcYnhOMQzMU4blzbRYZRIhI
	sQ9psSARYL5Eu1UcMGi8HkCpmb8B2s8bFVrpcrMwMvBhynjRA2Wzrdovan372TWlz35Q6Qj9ZM/1A
	IwFStC6TFk319dqaMIfglbhzEZfgy4zYRuTiMJI4+1710uN5p/yErgNTqg2hl1X7nvvS2rM5JNLoQ
	q7WIHk5fyphtTQy605cow4Skk5WRDlWf3lQEbPnSDpS2DctUwtGyB9ijNmtOEmTXCTtbHRLm+GMDf
	BCsbUiWThWXq4n9O7jVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZ70-0000000FLmM-1zMn;
	Fri, 20 Jun 2025 10:36:46 +0000
Received: from sg-3-18.ptr.tlmpb.com ([101.45.255.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSYBL-0000000FCpi-1GYg
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 09:37:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1750412220;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=oeXxAIqzohSWPmedTEZHs1J1ce2tPrIZS+IBTNkDcr8=;
 b=AF1ceC70Y+GV1+D5xXqF8udpzakQZUwAaNT0se6YcyniphkrwbqLYF07pg7LFWVsj6AXhn
 ucJsWNwhk0Pc2leTiU3TP4ZBO0g4f+bhz/5VpimV1wsuuPGV6k2pz9hDJGEoxrE7C7mDpo
 iBduWSrtu80KrA7BPBWMls5kAbnv8Md5ytYL/Jwu2SSRatUNpYL7ykWF4yEIdpdxAaQx/Q
 nVP91BdtnmUaNCozzGXNhqk3byAgjosMXepeX01JU7vEDOugHXFNEn50O1VHKIXNsR5YNo
 bOSZBeeGmtEeFPk5krB62IYteWYdUdyYO7h6qi2K/Bc48uRVg7XsYRo0eBo80w==
Subject: Re: [PATCH 1/5] RISC-V: KVM: Provide UAPI for Zicbop block size
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
X-Lms-Return-Path: <lba+268552bba+6dd456+lists.infradead.org+liujingqi@lanxincomputing.com>
Content-Language: en-US
User-Agent: Mozilla Thunderbird
To: <zhouquan@iscas.ac.cn>, <anup@brainfault.org>, <ajones@ventanamicro.com>, 
	<atishp@atishpatra.org>, <paul.walmsley@sifive.com>, 
	<palmer@dabbelt.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
Date: Fri, 20 Jun 2025 17:36:55 +0800
Message-Id: <193a6972-2498-4661-8b76-4303819ca0b2@lanxincomputing.com>
Mime-Version: 1.0
Received: from [127.0.0.1] ([180.165.3.105]) by smtp.feishu.cn with ESMTPS; Fri, 20 Jun 2025 17:36:57 +0800
In-Reply-To: <553bacc4f66e815975bb8ee0e4696397407b0a82.1750164414.git.zhouquan@iscas.ac.cn>
References: <cover.1750164414.git.zhouquan@iscas.ac.cn> <553bacc4f66e815975bb8ee0e4696397407b0a82.1750164414.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_023712_045109_B69F1191 
X-CRM114-Status: GOOD (  14.77  )
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

On 6/17/2025 9:10 PM, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
>
> We're about to allow guests to use the Zicbop extension.
> KVM userspace needs to know the cache block size in order to
> properly advertise it to the guest. Provide a virtual config
> register for userspace to get it with the GET_ONE_REG API, but
> setting it cannot be supported, so disallow SET_ONE_REG.
>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>   arch/riscv/include/uapi/asm/kvm.h |  1 +
>   arch/riscv/kvm/vcpu_onereg.c      | 11 +++++++++++
>   2 files changed, 12 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 5f59fd226cc5..0863ca178066 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -55,6 +55,7 @@ struct kvm_riscv_config {
>   	unsigned long mimpid;
>   	unsigned long zicboz_block_size;
>   	unsigned long satp_mode;
> +	unsigned long zicbop_block_size;
>   };
>   
>   /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index 2e1b646f0d61..b08a22eaa7a7 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -256,6 +256,11 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
>   			return -ENOENT;
>   		reg_val = riscv_cboz_block_size;
>   		break;
> +	case KVM_REG_RISCV_CONFIG_REG(zicbop_block_size):
> +		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOP))
> +			return -ENOENT;
> +		reg_val = riscv_cbop_block_size;
> +		break;
>   	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
>   		reg_val = vcpu->arch.mvendorid;
>   		break;
> @@ -347,6 +352,12 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
>   		if (reg_val != riscv_cboz_block_size)
>   			return -EINVAL;
>   		break;
> +	case KVM_REG_RISCV_CONFIG_REG(zicbop_block_size):
> +		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOP))
> +			return -ENOENT;
> +		if (reg_val != riscv_cbop_block_size)

Seems "riscv_cbop_block_size" has not been declared.
Otherwise,
Reviewed-by: Nutty Liu<liujingqi@lanxincomputing.com>

Thanks,
Nutty

> +			return -EINVAL;
> +		break;
>   	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
>   		if (reg_val == vcpu->arch.mvendorid)
>   			break;

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
