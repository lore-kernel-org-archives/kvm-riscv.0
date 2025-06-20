Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C48FC7EE24
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 10:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Date:Subject:From:
	In-Reply-To:References:Message-Id:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FaRJI9zPuQm4yVfHFo1IoolMDw9ZD9Xv+7oI+9JHXeA=; b=FPtcCuwXbnhM1JXOr6Rhh8aQPI
	wkQixqJaKgsP0PFrZtogQ/FS2oVvkzErQkn6J1nus1T9H+W8KC30ZuT694OE7jP8ESdyKapIL3ec7
	CJYxmzsz0qEuhcIY+t4ZFXBb/FU7a44SSQ7acMgxV04c57F0A/MAjCBfd+xLisIrk/omqBbsp54DP
	QtTMwGIZkSRBIrzqgUWpdt3sUgMFoVX99Yohs/6rnpguWtm+NTsNwG+0uQYBUaOoiT9anDxORjql0
	62IPAhmjTDIl66Jq4M+nnrsge87iZydZ866a3dcglGrlaZFZ37C4b2HndADyDPegDmZaTmwc7mD1s
	26Fr/i6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZHA-0000000FNxk-07uH;
	Fri, 20 Jun 2025 10:47:16 +0000
Received: from sg-3-19.ptr.tlmpb.com ([101.45.255.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSYNX-0000000FG9E-3Fte
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 09:49:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1750412979;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=RUHHvhpWyqtsBfoigWTcvYU+iHd7K6l5Yp1DjgDh7AU=;
 b=ahss/Lio4bMsKuefCMkJwlpMefSVD8gPXtmHvRyXbcDszSC7bouYBCIZ7fQr93OAEWZDWx
 tyDmQ9xx7xbkftZs0nW/bSFMccWTVrA9zn0hDUXai5Lj3V0uiqIFhofqVwaNFo/t2Hbwcq
 BmmrP5PpLwIhSivq4I8QpSabfYSQC6LxAOY1SO7n8uqE3pVozjY3pofWTadRDO8eq2Fxud
 8L05RyhYISrdlr90Q8X4K+d8zltgE7nMrwHusMlgBdVbc0P9P4ogx2vpI5sVC76T65omoj
 qsY0ubgG0/GTA606dKE+oVv+LWOG4yuzEt+875u0JWVfcyvZJz1UQswDlOtJFQ==
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
To: <zhouquan@iscas.ac.cn>, <anup@brainfault.org>, <ajones@ventanamicro.com>, 
	<atishp@atishpatra.org>, <paul.walmsley@sifive.com>, 
	<palmer@dabbelt.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>
Message-Id: <e2b5fcd8-cb72-43ff-802a-57983880e377@lanxincomputing.com>
User-Agent: Mozilla Thunderbird
References: <cover.1750164414.git.zhouquan@iscas.ac.cn> <effe218d368a37e397b6526f876b33322dbb6e20.1750164414.git.zhouquan@iscas.ac.cn>
In-Reply-To: <effe218d368a37e397b6526f876b33322dbb6e20.1750164414.git.zhouquan@iscas.ac.cn>
Content-Language: en-US
Received: from [127.0.0.1] ([180.165.3.105]) by smtp.feishu.cn with ESMTPS; Fri, 20 Jun 2025 17:49:36 +0800
X-Lms-Return-Path: <lba+268552eb1+4d77a0+lists.infradead.org+liujingqi@lanxincomputing.com>
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
Subject: Re: [PATCH 3/5] RISC-V: KVM: Allow bfloat16 extension for Guest/VM
Date: Fri, 20 Jun 2025 17:49:35 +0800
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_024948_191032_F44C9B9D 
X-CRM114-Status: UNSURE (   9.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On 6/17/2025 9:10 PM, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
>
> Extend the KVM ISA extension ONE_REG interface to allow KVM user space
> to detect and enable Zfbmin/Zvfbfmin/Zvfbfwma extension for Guest/VM.
>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>   arch/riscv/include/uapi/asm/kvm.h | 3 +++
>   arch/riscv/kvm/vcpu_onereg.c      | 6 ++++++
>   2 files changed, 9 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 56959d277e86..79a5ac86597c 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -186,6 +186,9 @@ enum KVM_RISCV_ISA_EXT_ID {
>   	KVM_RISCV_ISA_EXT_ZAAMO,
>   	KVM_RISCV_ISA_EXT_ZALRSC,
>   	KVM_RISCV_ISA_EXT_ZICBOP,
> +	KVM_RISCV_ISA_EXT_ZFBFMIN,
> +	KVM_RISCV_ISA_EXT_ZVFBFMIN,
> +	KVM_RISCV_ISA_EXT_ZVFBFWMA,
>   	KVM_RISCV_ISA_EXT_MAX,
>   };
>   
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index d444ec9e9e8e..2ba3f2c942ee 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -65,6 +65,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>   	KVM_ISA_EXT_ARR(ZCF),
>   	KVM_ISA_EXT_ARR(ZCMOP),
>   	KVM_ISA_EXT_ARR(ZFA),
> +	KVM_ISA_EXT_ARR(ZFBFMIN),
>   	KVM_ISA_EXT_ARR(ZFH),
>   	KVM_ISA_EXT_ARR(ZFHMIN),
>   	KVM_ISA_EXT_ARR(ZICBOM),
> @@ -89,6 +90,8 @@ static const unsigned long kvm_isa_ext_arr[] = {
>   	KVM_ISA_EXT_ARR(ZTSO),
>   	KVM_ISA_EXT_ARR(ZVBB),
>   	KVM_ISA_EXT_ARR(ZVBC),
> +	KVM_ISA_EXT_ARR(ZVFBFMIN),
> +	KVM_ISA_EXT_ARR(ZVFBFWMA),
>   	KVM_ISA_EXT_ARR(ZVFH),
>   	KVM_ISA_EXT_ARR(ZVFHMIN),
>   	KVM_ISA_EXT_ARR(ZVKB),
> @@ -170,6 +173,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>   	case KVM_RISCV_ISA_EXT_ZCF:
>   	case KVM_RISCV_ISA_EXT_ZCMOP:
>   	case KVM_RISCV_ISA_EXT_ZFA:
> +	case KVM_RISCV_ISA_EXT_ZFBFMIN:
>   	case KVM_RISCV_ISA_EXT_ZFH:
>   	case KVM_RISCV_ISA_EXT_ZFHMIN:
>   	case KVM_RISCV_ISA_EXT_ZICBOP:
> @@ -192,6 +196,8 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>   	case KVM_RISCV_ISA_EXT_ZTSO:
>   	case KVM_RISCV_ISA_EXT_ZVBB:
>   	case KVM_RISCV_ISA_EXT_ZVBC:
> +	case KVM_RISCV_ISA_EXT_ZVFBFMIN:
> +	case KVM_RISCV_ISA_EXT_ZVFBFWMA:
>   	case KVM_RISCV_ISA_EXT_ZVFH:
>   	case KVM_RISCV_ISA_EXT_ZVFHMIN:
>   	case KVM_RISCV_ISA_EXT_ZVKB:

Reviewed-by: Nutty Liu<liujingqi@lanxincomputing.com>

Thanks,
Nutty

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
