Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3CBCD5BD5
	for <kvm-riscv@archiver.kernel.org>; Thu, 28 May 2026 22:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3aq8aMsZVM1SJ/gkUruNwlw5FZspw987L+fMQtutgt8=; b=WMFAfk92iNa8hw
	1YzpP4tji7bU2BmZVSPkrYnUTR78eN2tmqc5eX9L0PkY/pV09I7/BVwN9PD2WRmqui7dH5R6/R2Bx
	mUWSyf1BqxHQK8SA9JH36/WDPzYJ3N21R8VZ8inzCZ8ub2ybioIEwC2yN2w5ChvF6CuVMjBvJow+I
	rVcEkh67fzVqiddYd1Bs31j5oX90QAxJDRYsrhP86ulf5ksv//PWEWilRyrsevS44DN15XgoAhBn9
	3XGcCbH2g/9EvSNvceDHZ9OKx4u7ippfrbF8y4jJT7LcdTp5ly1jYEvh04FuXrOAN76+yHm5evdip
	ZYVbWgflx2t93vM8ix2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSjKj-00000006UYi-45DE;
	Thu, 28 May 2026 22:36:09 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSjKh-00000006UXt-2rzC
	for kvm-riscv@lists.infradead.org;
	Thu, 28 May 2026 22:36:08 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2b788a98557so87803315ad.2
        for <kvm-riscv@lists.infradead.org>; Thu, 28 May 2026 15:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780007767; x=1780612567; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j6G7TGbV2srXAXSbKsGpAGcrEaEACN1hpS7t4zOGNfc=;
        b=e0CIJB2NNVVFWqW2PHWng6ArbmVHFxq4Q4E+zSD4uYqeCN8Thh7G439GvFeDoAwA8n
         Rrzr7MUmygNQVu/zLpkGVkS/L5sX7YzT+QRAqoljrKjXaFGyrnZcaUue+fWNMeSh6el4
         rjm6E3mtHrhxbI7b/r7ymUPqHv1Ofqcmg02hBzwDT86gFfRgtN3JZYItN4FK+TzKOrfY
         24z+civOEDIMJuyF+8nqVSEri9J+OXrII0GefpQiOxNRz8Pu3Mu1tlP3sAWCvZ1r6s0M
         nDdpjtodRzop+nIVh2JrjamnISoGlVtAwKd74RC6O2rbHGExPov5B7sR2zBMZTktsNJH
         Og+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780007767; x=1780612567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j6G7TGbV2srXAXSbKsGpAGcrEaEACN1hpS7t4zOGNfc=;
        b=RIl/DmjhYb5cD3B6WOjUDeNucAMHAjKu7YRIPs6PYNC6dn6guTG3fbfO3COmljHpKS
         IBbUfr+KM/86SUmYrKvgGzXxxK1VUTJKgxeCISgaJTZ2wxMtRtvn3yIop2Nvnr7lLn2a
         15n1cQaWSl5QgaPIQ6hH435PKZbaZIqUQkK1FbUAvV41/SuuSTCzwnwEc/mptbrQVk6t
         ckAHqRTvJubhloOS0DgriMqRYmM9hQ2cZrWyVy/arF/iWiNfGPR/6iKO4iggbVlwA8CB
         XEEBSENiyuwxQNw/NhWgbL79kf7ID/KOxszqDY6hjcqwd6V0WrvUTgyf9GBWm8DWRnUa
         igLw==
X-Forwarded-Encrypted: i=1; AFNElJ+fc7q27lC/VOVl3JIU6G3KO4UPOqKdCi+vG6GsbJPbZ4JbMmzdY4fsMRGlDdDJD9OsNUKfFBAcpCs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/5LO+b/fZsVUHPNTQUXQIuHYN80DKXeN1j/UjFAoT05N1vADa
	L/1WQlpzJ4ZyDr+xELJqb+RXvOn/Zevn67vunpvzjEPCuOwuapyyP3l5
X-Gm-Gg: Acq92OEDUKEcl5nAIKK1XVpI3pLhqRn+05oz/eOCI8y4Veyje7tBEBETuxwGQjVV91M
	TsaBauMs0VIFl86JygOZO99me0NxHzbO9PyNUIari5UtyvqQwkBlHB0a19iGMD3yuTwwz6IKJwD
	9EXcLeeukw+KY+qH0Y/3Zu82b/22UbD84pDSg3BCNmN4LDbKmKqssd/+ZonUhoIScJvliDuWNd+
	TPDkVefZDK3MVf250CTJmyLyaJtJ4XGVjBAqO5dQnyA0lhuDsue3nLhxYYvVm2KV9DV4jcOQtD0
	JWzFsysJHtPptutvWCc9I70oflmgQDRKpAFfJVqplUeMOYbX/maFfYI4MgYQ66s7r9poNBfN63F
	2Pl5EVjr1ve5dy6YgwsmXRZvmAx7IBVKIodKbXb3IMFoSer5bDEBZlpfJR04gY8vYYe+xIrTR0y
	bzDFslp1TbQWzaf0KNxTIB+0BQv5lXTLBwOg==
X-Received: by 2002:a17:902:fc8f:b0:2b9:ec37:2977 with SMTP id d9443c01a7336-2bf20cf15a1mr3611585ad.38.1780007766821;
        Thu, 28 May 2026 15:36:06 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf218a2535sm855155ad.29.2026.05.28.15.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 15:36:05 -0700 (PDT)
Date: Fri, 29 May 2026 06:35:54 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Jinyu Tang <tjytimi@163.com>, Anup Patel <apatel@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
	Nutty Liu <nutty.liu@hotmail.com>
Subject: Re: [PATCH 5/5] KVM: riscv: Fast-path dirty logging write faults
Message-ID: <ahjBHptPfNgDfncW@inochi.infowork>
References: <20260517153427.94889-1-tjytimi@163.com>
 <20260517153427.94889-6-tjytimi@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260517153427.94889-6-tjytimi@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_153607_729153_A99E2CFB 
X-CRM114-Status: GOOD (  28.74  )
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

On Sun, May 17, 2026 at 11:34:27PM +0800, Jinyu Tang wrote:
> With dirty logging enabled, guest writes often fault on an existing 4K
> G-stage leaf that was write-protected only for dirty tracking. The slow
> path still performs the full fault handling flow and takes mmu_lock for
> write, even though the page-table shape does not change.
> 
> x86 handles the analogous case in its fast page fault path by atomically
> making a writable SPTE writable again when the fault is only a
> write-protection fault. Add the same style of fast path for RISC-V. If a
> write fault hits an existing 4K leaf in a writable dirty-log memslot,
> mark the page dirty and atomically set the PTE writable and dirty under
> the read side of mmu_lock.
> 
> The dirty bitmap is updated before the PTE becomes writable again. The
> PTE D bit is also set so systems that trap on a clear D bit do not fall
> back to the slow path for a writable but clean PTE.
> 
> Signed-off-by: Jinyu Tang <tjytimi@163.com>
> ---
>  arch/riscv/kvm/mmu.c | 75 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 48f16e52f..980059e09 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -419,6 +419,77 @@ static unsigned long transparent_hugepage_adjust(struct kvm *kvm,
>  	return PAGE_SIZE;
>  }
>  
> +static bool kvm_riscv_mmu_dirty_log_write_fault_fast(struct kvm *kvm,
> +						     struct kvm_memory_slot *memslot,
> +						     gpa_t gpa,
> +						     struct kvm_gstage_mapping *out_map)
> +{
> +	struct kvm_gstage gstage;
> +	unsigned long mmu_seq;
> +	pte_t old_pte, new_pte;
> +	pte_t *ptep;
> +	gfn_t gfn = gpa >> PAGE_SHIFT;
> +	u32 ptep_level;
> +	bool dirty_marked = false;
> +	bool ret;
> +
> +	kvm_riscv_gstage_init(&gstage, kvm);
> +	mmu_seq = kvm->mmu_invalidate_seq;
> +
> +	read_lock(&kvm->mmu_lock);
> +
> +	if (mmu_invalidate_retry_gfn(kvm, mmu_seq, gfn)) {
> +		ret = false;
> +		goto out_unlock;
> +	}
> +

> +	if (!kvm_riscv_gstage_get_leaf(&gstage, gpa, &ptep, &ptep_level) ||
> +	    ptep_level) {
> +		ret = false;
> +		goto out_unlock;
> +	}
> +

Add a check here: if this is a huge page and is a logging page, 
we should fallback to slow path to apply page spltting.

> +	for (;;) {
> +		old_pte = ptep_get(ptep);
> +		if (!(pte_val(old_pte) & _PAGE_LEAF)) {

Use pmd_present() here.

> +			ret = false;
> +			break;
> +		}
> +

> +		if (!dirty_marked) {
> +			mark_page_dirty_in_slot(kvm, memslot, gfn);
> +			dirty_marked = true;
> +		}

Only log dirty entry when the updating is success, otherwise
the page could be record twice in both fast and slow path.

> +
> +		if ((pte_val(old_pte) & (_PAGE_WRITE | _PAGE_DIRTY)) ==
> +		    (_PAGE_WRITE | _PAGE_DIRTY)) {

I think only pte_write is required, for write-protected path,
only write permission is needed to be checked, as we always
set dirty bit. For the future dirty log hardware extension,
the Svadu will update the dirty bit so no need for this logic.

> +			new_pte = old_pte;
> +			ret = true;
> +			break;
> +		}
> +

> +		new_pte = pte_mkdirty(pte_mkwrite_novma(old_pte));

pte_mkyoung is also needed.

> +
> +		if (kvm_riscv_gstage_try_update_pte(&gstage, ptep_level, gpa,
> +						    ptep, old_pte, new_pte)) {
> +			ret = true;
> +			break;
> +		}
> +		cpu_relax();
> +	}
> +
> +out_unlock:
> +	read_unlock(&kvm->mmu_lock);
> +
> +	if (ret) {
> +		out_map->addr = gpa & PAGE_MASK;
> +		out_map->level = 0;
> +		out_map->pte = new_pte;
> +	}
> +
> +	return ret;
> +}
> +
>  int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
>  		      gpa_t gpa, unsigned long hva, bool is_write,
>  		      struct kvm_gstage_mapping *out_map)
> @@ -442,6 +513,10 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
>  	/* Setup initial state of output mapping */
>  	memset(out_map, 0, sizeof(*out_map));
>  
> +	if (is_write && logging &&
> +	    kvm_riscv_mmu_dirty_log_write_fault_fast(kvm, memslot, gpa, out_map))
> +		return 0;
> +
>  	/* We need minimum second+third level pages */
>  	ret = kvm_mmu_topup_memory_cache(pcache, kvm->arch.pgd_levels);
>  	if (ret) {
> -- 
> 2.43.0
> 

Regards,
Inochi

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
