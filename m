Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BA9CCD1A5
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 19:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tBzk3YwH3SH3Y5GYcDbodkZMTK07gfWqbwLCElzUGFU=; b=CkU61IamxHGmHX
	2sAceJ5m7vckICO9IJTHjPykOzy1j1fnb7f/zjloARmUPwFsZFslsnBFWShD5LbeVevJdhjj8Y/S1
	sEurl0vRDnUEN1Uq3xA0xrXJoTFmrsESoewAuTKHZA8xWZpio1NW7ld1dOHC1pxMEN4KndBqars2X
	8V742tW/3+DMxBm/AiyjjIR9TPP5diOvb484E/2aAWnC4wXlFoeMjDeg6l+rqmxXrrvx6wimgKhpi
	1wVWPNPVhFFZV1X8bS1DmdCzIhYLoC9877n4Y96c5ibZG7auJjfvDuxAXDW4i+scrpfesZA2CVu1g
	VEqhfe6hu2AmmzTSgl/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvmt-0000000Eokn-1abK;
	Mon, 20 Oct 2025 19:43:23 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvmq-0000000Eojs-3yjk
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 19:43:22 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-781206cce18so4848724b3a.0
        for <kvm-riscv@lists.infradead.org>; Mon, 20 Oct 2025 12:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760989400; x=1761594200; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hM5MMLXsYM69EBdIPQteBCdcHt+2UMoOmn9dDxRhd44=;
        b=a2k2NmkcuVARtZh2tFVvBlfGQWG5uPkV3ZMdR17V/32CbWRzgG9U9NAp7EggcYiTSd
         lfSVs2wNWuaxRnQ3Xs5YgiAckXhy/dV25aZTIDvMdcJapKuBuY6EtHdAR1oH31M8XWuB
         dJJs19ovLwiv3kStKTJLo4G/GbSIBtI/IamJHUVQ+iPZQH4Wb88dsFWQSD3jg7v2PwoQ
         I1LPqSbwgvOv2/8E1PiGkz0G9ksM/6iWr8cVjTMmYAOkvoKtz288weOnwX58rRbUQFcw
         Quz+ZTER80rL4dTQKczI4hZ9qszvYwMq5vxa5qtR2oFZSmRwlMy6PUlJAR/OnncBHxpU
         5CWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760989400; x=1761594200;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hM5MMLXsYM69EBdIPQteBCdcHt+2UMoOmn9dDxRhd44=;
        b=rkNZF3i1d7gkV4aQyLidFEW4nlpm29QVCl/cTQu1zCoXLYqZQwhUZBPuCQ/wTUyE2E
         xzBrvHkZ5Mov2HnWK2WZF60dXz2sutG0D5ujIRja6mwK2A3E6p7+6iK5Zd5te9M3fVO/
         v+33oiuzygGPGsqQpXVG5dbYnGLikrRWE5EUgxYK3ka3IK+EHrlPITqHJ48qVj+dqijZ
         ijfsjTWf6qm5RHBJLv4p1xKsKgcfaxe9XcXKj7XlkLM9d4e18zLs8n3u/eCQT70pHMI3
         uUT+k5SmfoVnC8z6yS58i1G2nYB57wPCOZ6l/Jz1LgWKzzu7OEnY0gGtnpOHYsYEE4oO
         hfHA==
X-Forwarded-Encrypted: i=1; AJvYcCUl1cnp0QXddlyJjsLqNYJUhussTE7sRAa56hLgAuO/o+LPyQQkC/QMJwVPF7d55LoqyB/0GyRKk1I=@lists.infradead.org
X-Gm-Message-State: AOJu0YxjM+PQT3MGb6vPCmkqaq4nZSQCWatExXgrN6J00kGVd2FW9VKb
	PbzJ72E4IiQkWFmKWpj1HVeeyl5BPNTvK4oSr/BNzFiOS+R+C4GT4qTJwZ/vkoD9wls=
X-Gm-Gg: ASbGncsJy+tp7Ih1Po9p12CqvfSLh81gJ+j8t7jGxvpIavmUox/SaMjT0YvSpFvwDU+
	8pTDY7YmHSK0FworTN3D4bTnmMehmRhLSyrPFTCvDbanTJIlWpGV67yzVp4//xZsexI5ZvvR4G+
	f3LZld1WCbYXxsSLn7BL1vYKzUR9Nem+aPjXw1YLliPfSenV6eLG+H8LrRz4Ll9mHOcOsa2R1r2
	T4aovkJkOqvlSqa4e8/gqn+xcd2BPVuqFfbfjbU4UV+7IS/B3a584uJ7Q+hqdJTPYqa/7ikg69L
	cQxi1GNx4iwnzGjdJM+NUptZA1g7qhZMzf8qjDihKlmQ0Hus76evf7ofTVsfWewjuuFGvFtgfba
	DtjnvfNw9HaXwaFWzYfsnwvDUbZhIgThm9nLZL1IjbdAqcxniaa5N9q6+Cpsuc2XxO1rW7A6UAP
	9p7J4M/qBZCcMiAWrGGJr7e+RSh+4elV3bQvBbxI6+gAX4vc3tMWMVTA==
X-Google-Smtp-Source: AGHT+IEz0c9auRC0TwjskGJJcvcC5ayj8gqgof4QV51C8KuJdIiqhiUNN8QL7OYGY673kk8y9oGq8A==
X-Received: by 2002:a05:6a00:784:b0:77d:c625:f5d3 with SMTP id d2e1a72fcca58-7a210d8ffd0mr15317951b3a.1.1760989399677;
        Mon, 20 Oct 2025 12:43:19 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc1:8cb8:dfc4:4af0:d7c6:a030? ([2804:7f0:bcc1:8cb8:dfc4:4af0:d7c6:a030])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff158f8sm9251975b3a.8.2025.10.20.12.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:43:19 -0700 (PDT)
Message-ID: <ca6a8e5a-f14d-4017-90dc-be566d594eee@ventanamicro.com>
Date: Mon, 20 Oct 2025 16:43:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: KVM: Remove automatic I/O mapping for VM_PFNMAP
To: fangyu.yu@linux.alibaba.com, anup@brainfault.org, atish.patra@linux.dev,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 pbonzini@redhat.com, jiangyifei@huawei.com
Cc: guoren@kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251020130801.68356-1-fangyu.yu@linux.alibaba.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20251020130801.68356-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_124320_996709_ECD08FEF 
X-CRM114-Status: GOOD (  19.08  )
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



On 10/20/25 10:08 AM, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> As of commit aac6db75a9fc ("vfio/pci: Use unmap_mapping_range()"),
> vm_pgoff may no longer guaranteed to hold the PFN for VM_PFNMAP
> regions. Using vma->vm_pgoff to derive the HPA here may therefore
> produce incorrect mappings.
> 
> Instead, I/O mappings for such regions can be established on-demand
> during g-stage page faults, making the upfront ioremap in this path
> is unnecessary.
> 
> Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programming")
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---

Hi,

This patch fixes the issue observed by Drew in [1]. I was helping Drew
debug it using a QEMU guest inside an emulated risc-v host with the
'virt' machine + IOMMU enabled.

Using the patches from [2], without the workaround patch (18), booting a
guest with a passed-through PCI device fails with a store amo fault and a
kernel oops:

[    3.304776] Oops - store (or AMO) access fault [#1]
[    3.305159] Modules linked in:
[    3.305603] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0-rc4 #39
[    3.305988] Hardware name: riscv-virtio,qemu (DT)
[    3.306140] epc : __ew32+0x34/0xba
[    3.307910]  ra : e1000_irq_disable+0x1e/0x9a
[    3.307984] epc : ffffffff806ebfbe ra : ffffffff806ee3f8 sp : ff2000000000baf0
[    3.308022]  gp : ffffffff81719938 tp : ff600000018b8000 t0 : ff60000002c3b480
[    3.308055]  t1 : 0000000000000065 t2 : 3030206530303031 s0 : ff2000000000bb30
[    3.308086]  s1 : ff60000002a50a00 a0 : ff60000002a50fb8 a1 : 00000000000000d8
[    3.308118]  a2 : ffffffffffffffff a3 : 0000000000000002 a4 : 0000000000003000
[    3.308161]  a5 : ff200000001e00d8 a6 : 0000000000000008 a7 : 0000000000000038
[    3.308195]  s2 : ff60000002a50fb8 s3 : ff60000001865000 s4 : 00000000000000d8
[    3.308226]  s5 : ffffffffffffffff s6 : ff60000002a50a00 s7 : ffffffff812d2760
[    3.308258]  s8 : 0000000000000a00 s9 : 0000000000001000 s10: ff60000002a51000
[    3.308288]  s11: ff60000002a54000 t3 : ffffffff8172ec4f t4 : ffffffff8172ec4f
[    3.308475]  t5 : ffffffff8172ec50 t6 : ff2000000000b848
[    3.308763] status: 0000000200000120 badaddr: ff200000001e00d8 cause: 0000000000000007
[    3.308975] [<ffffffff806ebfbe>] __ew32+0x34/0xba
[    3.309196] [<ffffffff806ee3f8>] e1000_irq_disable+0x1e/0x9a
[    3.309241] [<ffffffff806f1e12>] e1000_probe+0x3b6/0xb50
[    3.309279] [<ffffffff80510554>] pci_device_probe+0x7e/0xf8
[    3.310001] [<ffffffff80610344>] really_probe+0x82/0x202
[    3.310409] [<ffffffff80610520>] __driver_probe_device+0x5c/0xd0
[    3.310622] [<ffffffff806105c0>] driver_probe_device+0x2c/0xb0
(...)


Further debugging showed that, as far as QEMU goes, the store fault happens in an
"unassigned io region", i.e. a region where there's no IO memory region mapped by
any device. There is no IOMMU faults being logged and, at least as far as I've
observed, no IOMMU translation bugs in the QEMU side as well.


Thanks for the fix!


Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>



[1] https://lore.kernel.org/all/20250920203851.2205115-38-ajones@ventanamicro.com/
[2] https://lore.kernel.org/all/20250920203851.2205115-20-ajones@ventanamicro.com/




>   arch/riscv/kvm/mmu.c | 20 +-------------------
>   1 file changed, 1 insertion(+), 19 deletions(-)
> 
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 525fb5a330c0..84c04c8f0892 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -197,8 +197,7 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>   
>   	/*
>   	 * A memory region could potentially cover multiple VMAs, and
> -	 * any holes between them, so iterate over all of them to find
> -	 * out if we can map any of them right now.
> +	 * any holes between them, so iterate over all of them.
>   	 *
>   	 *     +--------------------------------------------+
>   	 * +---------------+----------------+   +----------------+
> @@ -229,32 +228,15 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>   		vm_end = min(reg_end, vma->vm_end);
>   
>   		if (vma->vm_flags & VM_PFNMAP) {
> -			gpa_t gpa = base_gpa + (vm_start - hva);
> -			phys_addr_t pa;
> -
> -			pa = (phys_addr_t)vma->vm_pgoff << PAGE_SHIFT;
> -			pa += vm_start - vma->vm_start;
> -
>   			/* IO region dirty page logging not allowed */
>   			if (new->flags & KVM_MEM_LOG_DIRTY_PAGES) {
>   				ret = -EINVAL;
>   				goto out;
>   			}
> -
> -			ret = kvm_riscv_mmu_ioremap(kvm, gpa, pa, vm_end - vm_start,
> -						    writable, false);
> -			if (ret)
> -				break;
>   		}
>   		hva = vm_end;
>   	} while (hva < reg_end);
>   
> -	if (change == KVM_MR_FLAGS_ONLY)
> -		goto out;
> -
> -	if (ret)
> -		kvm_riscv_mmu_iounmap(kvm, base_gpa, size);
> -
>   out:
>   	mmap_read_unlock(current->mm);
>   	return ret;


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
