Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A2FCCF9E0
	for <kvm-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 13:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+tnSRtcyFl7YnYFj+XR7GNmLfwLOX///XdY/4rLsXg8=; b=dMCz4HHLiGKMX8
	8R4StB3g1hj8f/sOF2fObfxd439/TXdojXnQSq7v+pm5PscS/UBmpYVSmQ4dCGcGuAU+N6Mhdq7wl
	bEGRS3tgr8QQAZfsZ9/knF8sL2wdzm5LNe8Acqgrye6hUCCc5cLTFV36J7ikujcWy0DGb08tQ1s8O
	BD8z8d/+2cuKBVpYfVMg6oLe9FR5PimuRFQXT3g+1RVNXR2lZ2ILBM7pLybO4UQzl7krOcHjnzxzM
	Y6ZQUHcuHrZszgsX+Dfg/TPOeD4wL0i7AK0QUGuZlRinyZX/ajBtUC6XmL6327O33ugbgrMNMHBCA
	2944c73NyQ6I9XA0eX7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCHtE-00000009Y1r-3nEd;
	Fri, 24 Oct 2025 13:31:32 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCHtC-00000009Y1A-00OE;
	Fri, 24 Oct 2025 13:31:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1761312685; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=u39F8WLNvyq44vB4xSRWGu/rMtKru1JoTVTHXDxB/aY=;
	b=EFjiYyCZa45xyHqQOJrSYbMbhs/PZjzN37YusTRPc+JKs01jrjl09jOFPpzznmYbQ+HIiT40k6Ng2DwqUBFptqqko4kQ4JsQ1ZL0R/myuPR/oG03ZcDYr0TLhD0zUNWBdTCvLvYd83IS/lPFEsySTrD/bhHaIncvFSbFnTtETlY=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WquOQXL_1761312681 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 24 Oct 2025 21:31:22 +0800
From: fangyu.yu@linux.alibaba.com
To: anup@brainfault.org
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	jiangyifei@huawei.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pbonzini@redhat.com,
	pjw@kernel.org
Subject: Re: Re: [PATCH] RISC-V: KVM: Remove automatic I/O mapping for VM_PFNMAP 
Date: Fri, 24 Oct 2025 21:31:16 +0800
Message-Id: <20251024133116.73803-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <CAAhSdy1fCCdciZLqmoeWDG_QoOHDi9j0_ZZKYkpGJmWrf14Q-g@mail.gmail.com>
References: <CAAhSdy1fCCdciZLqmoeWDG_QoOHDi9j0_ZZKYkpGJmWrf14Q-g@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_063130_694522_3C0EF4BB 
X-CRM114-Status: UNSURE (   6.15  )
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

>> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>>
>> As of commit aac6db75a9fc ("vfio/pci: Use unmap_mapping_range()"),
>> vm_pgoff may no longer guaranteed to hold the PFN for VM_PFNMAP
>> regions. Using vma->vm_pgoff to derive the HPA here may therefore
>> produce incorrect mappings.
>>
>> Instead, I/O mappings for such regions can be established on-demand
>> during g-stage page faults, making the upfront ioremap in this path
>> is unnecessary.
>>
>> Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programming")
>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
>LGTM.
>
>Queued it as fix for Linux-6.18
>
>Reviewed-by: Anup Patel <anup@brainfault.org>
>
>Thanks,
>Anup
>

Hi Anup:

Thanks for the review.

Please note that this patch has two build warnings, and I have fixed
on patch V2:
https://lore.kernel.org/linux-riscv/20251021142131.78796-1-fangyu.yu@linux.alibaba.com/

Thanks,
Fangyu

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
