Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3923FC71155
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 10:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:From:To:Subject:Cc:
	References:In-Reply-To:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aUXHhHLCbXGLRGg2Fj/iohni2qGt2Bz2tY2wxjjbpi4=; b=f+Bw/gvEC9oGAN
	+efJ9CkvY5OvYQ/xnVCxn7Xo+9e2AmmktFuyMuE2VBDDe5aKPOclaPr6EwAYbqNlkw45H+I1TNu83
	e51EZVdbtyzPa3ycPkE+f4RUVcgVOwXqcQ3rcwwdx5WgGJ6fugzsgOAZVkERHrJpp5oUDS1VySJDK
	a8n39nXHg597nua+d5Bp4wFOI0ISu3VRDlqBzIw/KoIF3/VlYX0N+i2ZXnxrxz5aU2EtxbYji+4UB
	LDkXwDjEpN0aZ0W8qtFHimL7MPYyuqYdKZOVS4tdauBQ0Nc8o8dHXWzv0eHkItxYTC//6Xe/d/a3V
	dLe/cDl4HZhLHSj594pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZHL-0000000FO8B-2Y1p;
	Fri, 20 Jun 2025 10:47:27 +0000
Received: from sg-3-14.ptr.tlmpb.com ([101.45.255.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSYVs-0000000FHG6-2O4f
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 09:58:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1750413498;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=FVhWcbFwI9NYT8NXzHPcEd8gEtJB2JUO9bsshkN9xEc=;
 b=Km4FNtyVFfhKs2cnZKAq8JiccVO1YIzAr6CensXwObqAJYs27KLkXKu4J9fFX2Nq8UXuRr
 SscAwL6yrbl7vdo/9Q9+p6cKnTBIYdxVKStFP22WAQEPCyVPESFsncrfQ1JGi/usqoslbN
 9/DUAblAB9wsTBJeGRNLNwxLtowjgPgLyQ1WZIAhncOTzmKlZVm1/RXbwfKJx3CvON+KR+
 +BlKOmgtuAJH/uoBoPbxC7TkrtD1rgYipyu3Rwwh7+yZjgMjmXb6+hzs2jngQd9qpUXlQc
 ubNCar8kPU5uWBjxWEQjecC7VV4xFjhSLTRl7nUSNSZlr8QUl0ZmxmEFRAkBIQ==
User-Agent: Mozilla Thunderbird
Mime-Version: 1.0
In-Reply-To: <3591f5aed544f9026d8375651936e006b57defdb.1750164414.git.zhouquan@iscas.ac.cn>
References: <cover.1750164414.git.zhouquan@iscas.ac.cn> <3591f5aed544f9026d8375651936e006b57defdb.1750164414.git.zhouquan@iscas.ac.cn>
Content-Language: en-US
Cc: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>
Subject: Re: [PATCH 4/5] KVM: riscv: selftests: Add Zicbop extension to get-reg-list test
To: <zhouquan@iscas.ac.cn>, <anup@brainfault.org>, <ajones@ventanamicro.com>, 
	<atishp@atishpatra.org>, <paul.walmsley@sifive.com>, 
	<palmer@dabbelt.com>
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
Message-Id: <ad888bc6-33c7-42d3-b5d1-be191dcded0e@lanxincomputing.com>
X-Lms-Return-Path: <lba+2685530b8+74e151+lists.infradead.org+liujingqi@lanxincomputing.com>
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
Date: Fri, 20 Jun 2025 17:58:13 +0800
Received: from [127.0.0.1] ([180.165.3.105]) by smtp.feishu.cn with ESMTPS; Fri, 20 Jun 2025 17:58:15 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_025824_980381_FBA74EAF 
X-CRM114-Status: GOOD (  11.21  )
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
> The KVM RISC-V allows Zicbop extension for Guest/VM
> so add them to get-reg-list test.
>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>   tools/testing/selftests/kvm/riscv/get-reg-list.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index a0b7dabb5040..ebdc34b58bad 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -83,6 +83,7 @@ bool filter_reg(__u64 reg)
>   	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFH:
>   	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFHMIN:
>   	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOP:
>   	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ:
>   	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICCRSE:
>   	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICNTR:
> @@ -253,6 +254,8 @@ static const char *config_id_to_str(const char *prefix, __u64 id)
>   		return "KVM_REG_RISCV_CONFIG_REG(isa)";
>   	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
>   		return "KVM_REG_RISCV_CONFIG_REG(zicbom_block_size)";
> +	case KVM_REG_RISCV_CONFIG_REG(zicbop_block_size):
> +		return "KVM_REG_RISCV_CONFIG_REG(zicbop_block_size)";
>   	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
>   		return "KVM_REG_RISCV_CONFIG_REG(zicboz_block_size)";
>   	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
> @@ -535,6 +538,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
>   		KVM_ISA_EXT_ARR(ZFH),
>   		KVM_ISA_EXT_ARR(ZFHMIN),
>   		KVM_ISA_EXT_ARR(ZICBOM),
> +		KVM_ISA_EXT_ARR(ZICBOP),
>   		KVM_ISA_EXT_ARR(ZICBOZ),
>   		KVM_ISA_EXT_ARR(ZICCRSE),
>   		KVM_ISA_EXT_ARR(ZICNTR),
> @@ -864,6 +868,11 @@ static __u64 zicbom_regs[] = {
>   	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM,
>   };
>   
> +static __u64 zicbop_regs[] = {
> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_REG_RISCV_CONFIG_REG(zicbop_block_size),
> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOP,
> +};
> +
>   static __u64 zicboz_regs[] = {
>   	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_REG_RISCV_CONFIG_REG(zicboz_block_size),
>   	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ,
> @@ -1012,6 +1021,8 @@ static __u64 vector_regs[] = {
>   	 .regs = sbi_sta_regs, .regs_n = ARRAY_SIZE(sbi_sta_regs),}
>   #define SUBLIST_ZICBOM \
>   	{"zicbom", .feature = KVM_RISCV_ISA_EXT_ZICBOM, .regs = zicbom_regs, .regs_n = ARRAY_SIZE(zicbom_regs),}
> +#define SUBLIST_ZICBOP \
> +	{"zicbop", .feature = KVM_RISCV_ISA_EXT_ZICBOP, .regs = zicbop_regs, .regs_n = ARRAY_SIZE(zicbop_regs),}
>   #define SUBLIST_ZICBOZ \
>   	{"zicboz", .feature = KVM_RISCV_ISA_EXT_ZICBOZ, .regs = zicboz_regs, .regs_n = ARRAY_SIZE(zicboz_regs),}
>   #define SUBLIST_AIA \
> @@ -1130,6 +1141,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zfa, ZFA);
>   KVM_ISA_EXT_SIMPLE_CONFIG(zfh, ZFH);
>   KVM_ISA_EXT_SIMPLE_CONFIG(zfhmin, ZFHMIN);
>   KVM_ISA_EXT_SUBLIST_CONFIG(zicbom, ZICBOM);
> +KVM_ISA_EXT_SUBLIST_CONFIG(zicbop, ZICBOP);
>   KVM_ISA_EXT_SUBLIST_CONFIG(zicboz, ZICBOZ);
>   KVM_ISA_EXT_SIMPLE_CONFIG(ziccrse, ZICCRSE);
>   KVM_ISA_EXT_SIMPLE_CONFIG(zicntr, ZICNTR);
> @@ -1204,6 +1216,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
>   	&config_zfh,
>   	&config_zfhmin,
>   	&config_zicbom,
> +	&config_zicbop,
>   	&config_zicboz,
>   	&config_ziccrse,
>   	&config_zicntr,

Reviewed-by: Nutty Liu<liujingqi@lanxincomputing.com>

Thanks,
Nutty

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
