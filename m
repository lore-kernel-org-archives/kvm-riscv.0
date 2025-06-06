Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDA6C5AE59
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 00:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ElPEO2B9Kj70jEiRzbaRpCkO2uRjgaRaHKusDpJTmVU=; b=OadawS5XknP/mU
	JPHZJv29SW//VYiRDNS2V+BZXc8KeEcujtYLFSiqkEd1AyT/f4dQY/RUCaD2OlQsefwMT3XP6ySnJ
	TjnFNUAmUcSdgihKQ+naX+N7kZiSTwxQfucAASEEjU1LnjdoZqQGYN9l2MkRmq2m1S2OI/Njmz/ne
	s76g9au0Waa0n7XJbNbCCiErquooxkAWY1PStB+58ZVO53ou8g5tG4j8aOQ857bR0u/MNE4YA71S+
	3mO7aKIiygI9hTtLZ+sGkS1coJcpNB6NDph7BS4m+DAOn9c7eQ49gSS1xvBKs1fINoH1dky2jNReQ
	ARev+KAApSnmONvqh0zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNKVt-0000000Gof1-37Lo;
	Fri, 06 Jun 2025 00:00:49 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNKVq-0000000God5-2txP
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 00:00:48 +0000
Message-ID: <cc2caf0b-7c2f-4793-9510-0dd6c391088a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749168040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ci1aLZP2uGDNNh5buVx4u3tAr7sY/YsrNm+RPVvB3I8=;
	b=Ro5Ve4iwh0itvA3O67QDkEdjRqdvpxYprJZQz0r8mJiDlH8Fowyn7uZRRcqoFN2cWVA2G9
	05P/KjWr7hz6phBLy4d9vgYX4DzrMZVmSI+d+A7kmLFHdrGpxMSdXLJzxiVXMRhOG/jvNK
	t2GzY3qBGgpqqiVubwPgdfji62Ge5TQ=
Date: Thu, 5 Jun 2025 17:00:35 -0700
MIME-Version: 1.0
Subject: Re: [PATCH 01/13] RISC-V: KVM: Fix the size parameter check in SBI
 SFENCE calls
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250605061458.196003-1-apatel@ventanamicro.com>
 <20250605061458.196003-2-apatel@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250605061458.196003-2-apatel@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_170046_938537_93834C9E 
X-CRM114-Status: GOOD (  15.26  )
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


On 6/4/25 11:14 PM, Anup Patel wrote:
> As-per the SBI specification, an SBI remote fence operation applies
> to the entire address space if either:
> 1) start_addr and size are both 0
> 2) size is equal to 2^XLEN-1
>
>  From the above, only #1 is checked by SBI SFENCE calls so fix the
> size parameter check in SBI SFENCE calls to cover #2 as well.
>
> Fixes: 13acfec2dbcc ("RISC-V: KVM: Add remote HFENCE functions based on VCPU requests")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   arch/riscv/kvm/vcpu_sbi_replace.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
> index 5fbf3f94f1e8..9752d2ffff68 100644
> --- a/arch/riscv/kvm/vcpu_sbi_replace.c
> +++ b/arch/riscv/kvm/vcpu_sbi_replace.c
> @@ -103,7 +103,7 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
>   		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_FENCE_I_SENT);
>   		break;
>   	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA:
> -		if (cp->a2 == 0 && cp->a3 == 0)
> +		if ((cp->a2 == 0 && cp->a3 == 0) || cp->a3 == -1UL)
>   			kvm_riscv_hfence_vvma_all(vcpu->kvm, hbase, hmask);
>   		else
>   			kvm_riscv_hfence_vvma_gva(vcpu->kvm, hbase, hmask,
> @@ -111,7 +111,7 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
>   		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_SENT);
>   		break;
>   	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID:
> -		if (cp->a2 == 0 && cp->a3 == 0)
> +		if ((cp->a2 == 0 && cp->a3 == 0) || cp->a3 == -1UL)
>   			kvm_riscv_hfence_vvma_asid_all(vcpu->kvm,
>   						       hbase, hmask, cp->a4);
>   		else


Thanks for the fix.
Reviewed-by: Atish Patra <atishp@rivosinc.com>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
