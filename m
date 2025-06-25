Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB9BC7115C
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 08:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Message-Id:Subject:From:
	In-Reply-To:Cc:To:References:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=404nDBDoeZCYjc91uprBu4nGFwmlkVWfuC8ZEvfr78I=; b=Vy4WmrbU5scq/3
	vD2cQfPXH4TszRQP26116q6SiCi97F3M3UO4nB2h3KdG9zQ8BURUoKEgCAB9Z54/cWdDTtDU+KNOI
	1y/wukiVCPVgQlZaPdUVafBWrDm0LbBsTTxp8F4gmKsyATUXX15XSd5p5fr/2W+Bzon7Zi1uOny/L
	9ngF6McuqAkMgw4mC0w8cT1Sf+mxSISz0apSD3h1bpE03opX6LnyPEbPD5zi56r8uftjRqOiag0Ya
	k+GEg+23yQXGx+rtNmXlMFpGrJMID7liDv+c06bNdZP8KCa1O4iHDJPUg9P5kgt7PUUkCrdrrjuKa
	V9TiGQ7eKiEknTzacS0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULck-00000007yav-0Rwn;
	Wed, 25 Jun 2025 08:36:54 +0000
Received: from sg-1-13.ptr.blmpb.com ([118.26.132.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKjM-00000007qZG-0x5q
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 07:39:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1750837105;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=23blSFdrb8/fbPehCaYr2JhyqpZwpwwsJFLPuTL/tn4=;
 b=USqBzc7sxYVUbueSjJ/yzfbbkLm/Z/zcL6hJVpmKZ1qWYj2gzVJiLmmAL5Y0kJ3PLDTfgy
 6c4hvJQs5X2UMuAC54IeoJii2QDymw04t0g0rrHlup/f+lw80S5z1kCW8ZbR7ovHy1O/j1
 8iE9liV1XQcqSs/rU3/kp+gUB1FiWgjr1DSX0+4mrHaOKB1uZIMTEt4vVRgL54icSELKX4
 yBquXc3a3uevZc7x4u0uTsc3CltsYSaRHBSGEeSWlOD2i5m0yoJTsXBvUPm+vQeZqYPsCT
 wOhGIKsm3iFa8mRjI0NuXAuf/uN/w2UGZaOj5Fyl6BdEYlAfAG7BuUSGkeBXKg==
User-Agent: Mozilla Thunderbird
X-Lms-Return-Path: <lba+2685ba76e+28e308+lists.infradead.org+liujingqi@lanxincomputing.com>
Content-Language: en-US
Date: Wed, 25 Jun 2025 15:38:20 +0800
References: <20250618113532.471448-1-apatel@ventanamicro.com> <20250618113532.471448-6-apatel@ventanamicro.com>
Received: from [127.0.0.1] ([139.226.59.215]) by smtp.feishu.cn with ESMTPS; Wed, 25 Jun 2025 15:38:21 +0800
To: "Anup Patel" <apatel@ventanamicro.com>, 
	"Atish Patra" <atish.patra@linux.dev>
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, 
	"Andrew Jones" <ajones@ventanamicro.com>, 
	"Anup Patel" <anup@brainfault.org>, <kvm@vger.kernel.org>, 
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, "Atish Patra" <atishp@rivosinc.com>
In-Reply-To: <20250618113532.471448-6-apatel@ventanamicro.com>
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
Subject: Re: [PATCH v3 05/12] RISC-V: KVM: Don't flush TLB when PTE is unchanged
Message-Id: <adb4afad-19a1-404d-bec0-d0dc535d98c4@lanxincomputing.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_003940_442645_A3A03752 
X-CRM114-Status: GOOD (  12.60  )
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

On 6/18/2025 7:35 PM, Anup Patel wrote:
> The gstage_set_pte() and gstage_op_pte() should flush TLB only when
> a leaf PTE changes so that unnecessary TLB flushes can be avoided.
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   arch/riscv/kvm/mmu.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 1087ea74567b..29f1bd853a66 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -167,9 +167,11 @@ static int gstage_set_pte(struct kvm *kvm, u32 level,
>   		ptep = &next_ptep[gstage_pte_index(addr, current_level)];
>   	}
>   
> -	set_pte(ptep, *new_pte);
> -	if (gstage_pte_leaf(ptep))
> -		gstage_remote_tlb_flush(kvm, current_level, addr);
> +	if (pte_val(*ptep) != pte_val(*new_pte)) {
> +		set_pte(ptep, *new_pte);
> +		if (gstage_pte_leaf(ptep))
> +			gstage_remote_tlb_flush(kvm, current_level, addr);
> +	}
>   
>   	return 0;
>   }
> @@ -229,7 +231,7 @@ static void gstage_op_pte(struct kvm *kvm, gpa_t addr,
>   			  pte_t *ptep, u32 ptep_level, enum gstage_op op)
>   {
>   	int i, ret;
> -	pte_t *next_ptep;
> +	pte_t old_pte, *next_ptep;
>   	u32 next_ptep_level;
>   	unsigned long next_page_size, page_size;
>   
> @@ -258,11 +260,13 @@ static void gstage_op_pte(struct kvm *kvm, gpa_t addr,
>   		if (op == GSTAGE_OP_CLEAR)
>   			put_page(virt_to_page(next_ptep));
>   	} else {
> +		old_pte = *ptep;
>   		if (op == GSTAGE_OP_CLEAR)
>   			set_pte(ptep, __pte(0));
>   		else if (op == GSTAGE_OP_WP)
>   			set_pte(ptep, __pte(pte_val(ptep_get(ptep)) & ~_PAGE_WRITE));
> -		gstage_remote_tlb_flush(kvm, ptep_level, addr);
> +		if (pte_val(*ptep) != pte_val(old_pte))
> +			gstage_remote_tlb_flush(kvm, ptep_level, addr);
>   	}
>   }
>   

Reviewed-by: Nutty Liu <liujingqi@lanxincomputing.com>

Thanks,
Nutty

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
