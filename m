Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F07C71155
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 10:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Message-Id:Mime-Version:Date
	:From:In-Reply-To:Subject:Cc:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=78EXv4Uhbk3yEcOLrxQ06Vnjloro1d21Fj0NqIwy2jU=; b=Iq+Y3U+1nKBnjf
	/aryf86NIKJc8LKFmTkJ9me1Co1jlnwM2FDB3pwnWRYJ4yfu6Qao86iFqgNMU2el5Gg6oCVTUJeL0
	42K6Zak0z7P2Tg+qK3KtejO+sJ57e1XDHuQycAu0KoIqERNJK2S23hFMdXmlNE96uOp0pugMmvfTM
	W2s/5NPzMV10FZ9flct90mAiveEzV3jKNvv1jzzCInmt98ojzTLEP983q2yAj5CxmamsBEcWLPmS/
	PhTxYvrwrFkUXcKk2fbIO4zzXd2skTTHnZrJSv3uiGjMuQt87Km8VJkiuYo2fDeCbNdMDELXjmaIo
	kPVgr7Gl91aaFYXhZyBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZHQ-0000000FOEN-2CJb;
	Fri, 20 Jun 2025 10:47:32 +0000
Received: from sg-3-13.ptr.tlmpb.com ([101.45.255.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSYWH-0000000FHKB-1jUj
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 09:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1750413523;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=lva+y9NB39YGFOB+2A2HkG7HC06lS3LbJWgBT7uypq8=;
 b=Yeyt9eQCUIPOIMBgdiTlkn39j5upI7p97RnORCsqR3eq1k4XsnU5SMeULErSGmHZ606uAS
 6wIjfQ3Vt1Yme4fclC/oHjfUQK/2wtd6WpyQuXvuptrGS3BYNfHDD7ut3HynILEmzTT/1T
 rrnYyqUxwWx0gI2HqhG1qsRIe/533Cvd36qzwiymqHd3jwUMp58SkO6zqJ/SAKChpGQL4F
 c7gXZp0jLjUn2bORe3+IV5R2t50OQwMyuDsg7mVslvHUJye7bdQhFmQ4WS2jaSL/F1v6HV
 ED9JqaK8TCk+w/66wOS1hSfLGWGsJW17KqZLJ2BwleuG7fS30iMZqAz9YZcABw==
To: <zhouquan@iscas.ac.cn>, <anup@brainfault.org>, <ajones@ventanamicro.com>, 
	<atishp@atishpatra.org>, <paul.walmsley@sifive.com>, 
	<palmer@dabbelt.com>
User-Agent: Mozilla Thunderbird
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
X-Lms-Return-Path: <lba+2685530d1+ce1f2b+lists.infradead.org+liujingqi@lanxincomputing.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>
Subject: Re: [PATCH 5/5] KVM: riscv: selftests: Add bfloat16 extension to get-reg-list test
In-Reply-To: <65752029ed1ae331a9ac867a6fef2e63a797569e.1750164414.git.zhouquan@iscas.ac.cn>
Received: from [127.0.0.1] ([180.165.3.105]) by smtp.feishu.cn with ESMTPS; Fri, 20 Jun 2025 17:58:40 +0800
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
Date: Fri, 20 Jun 2025 17:58:38 +0800
Mime-Version: 1.0
Content-Language: en-US
Message-Id: <2acb706f-fb20-45ef-a8c8-762e193ca548@lanxincomputing.com>
References: <cover.1750164414.git.zhouquan@iscas.ac.cn> <65752029ed1ae331a9ac867a6fef2e63a797569e.1750164414.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_025849_813185_8BFBB29D 
X-CRM114-Status: UNSURE (   8.88  )
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
> The KVM RISC-V allows Zfbfmin/Zvfbfmin/Zvfbfwma extensions for Guest/VM
> so add them to get-reg-list test.
>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>   tools/testing/selftests/kvm/riscv/get-reg-list.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index ebdc34b58bad..e5a07e000b66 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -80,6 +80,7 @@ bool filter_reg(__u64 reg)
>   	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZCF:
>   	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZCMOP:
>   	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFA:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFBFMIN:
>   	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFH:
>   	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFHMIN:
>   	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM:
> @@ -104,6 +105,8 @@ bool filter_reg(__u64 reg)
>   	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZTSO:
>   	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVBB:
>   	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVBC:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVFBFMIN:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVFBFWMA:
>   	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVFH:
>   	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVFHMIN:
>   	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVKB:
> @@ -535,6 +538,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
>   		KVM_ISA_EXT_ARR(ZCF),
>   		KVM_ISA_EXT_ARR(ZCMOP),
>   		KVM_ISA_EXT_ARR(ZFA),
> +		KVM_ISA_EXT_ARR(ZFBFMIN),
>   		KVM_ISA_EXT_ARR(ZFH),
>   		KVM_ISA_EXT_ARR(ZFHMIN),
>   		KVM_ISA_EXT_ARR(ZICBOM),
> @@ -559,6 +563,8 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
>   		KVM_ISA_EXT_ARR(ZTSO),
>   		KVM_ISA_EXT_ARR(ZVBB),
>   		KVM_ISA_EXT_ARR(ZVBC),
> +		KVM_ISA_EXT_ARR(ZVFBFMIN),
> +		KVM_ISA_EXT_ARR(ZVFBFWMA),
>   		KVM_ISA_EXT_ARR(ZVFH),
>   		KVM_ISA_EXT_ARR(ZVFHMIN),
>   		KVM_ISA_EXT_ARR(ZVKB),
> @@ -1138,6 +1144,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zcd, ZCD);
>   KVM_ISA_EXT_SIMPLE_CONFIG(zcf, ZCF);
>   KVM_ISA_EXT_SIMPLE_CONFIG(zcmop, ZCMOP);
>   KVM_ISA_EXT_SIMPLE_CONFIG(zfa, ZFA);
> +KVM_ISA_EXT_SIMPLE_CONFIG(zfbfmin, ZFBFMIN);
>   KVM_ISA_EXT_SIMPLE_CONFIG(zfh, ZFH);
>   KVM_ISA_EXT_SIMPLE_CONFIG(zfhmin, ZFHMIN);
>   KVM_ISA_EXT_SUBLIST_CONFIG(zicbom, ZICBOM);
> @@ -1162,6 +1169,8 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zkt, ZKT);
>   KVM_ISA_EXT_SIMPLE_CONFIG(ztso, ZTSO);
>   KVM_ISA_EXT_SIMPLE_CONFIG(zvbb, ZVBB);
>   KVM_ISA_EXT_SIMPLE_CONFIG(zvbc, ZVBC);
> +KVM_ISA_EXT_SIMPLE_CONFIG(zvfbfmin, ZVFBFMIN);
> +KVM_ISA_EXT_SIMPLE_CONFIG(zvfbfwma, ZVFBFWMA);
>   KVM_ISA_EXT_SIMPLE_CONFIG(zvfh, ZVFH);
>   KVM_ISA_EXT_SIMPLE_CONFIG(zvfhmin, ZVFHMIN);
>   KVM_ISA_EXT_SIMPLE_CONFIG(zvkb, ZVKB);
> @@ -1213,6 +1222,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
>   	&config_zcf,
>   	&config_zcmop,
>   	&config_zfa,
> +	&config_zfbfmin,
>   	&config_zfh,
>   	&config_zfhmin,
>   	&config_zicbom,
> @@ -1237,6 +1247,8 @@ struct vcpu_reg_list *vcpu_configs[] = {
>   	&config_ztso,
>   	&config_zvbb,
>   	&config_zvbc,
> +	&config_zvfbfmin,
> +	&config_zvfbfwma,
>   	&config_zvfh,
>   	&config_zvfhmin,
>   	&config_zvkb,

Reviewed-by: Nutty Liu<liujingqi@lanxincomputing.com>

Thanks,
Nutty

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
