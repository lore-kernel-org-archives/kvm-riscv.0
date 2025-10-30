Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AB4CCF9F8
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 08:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HD9xnSeMyZuBCO/XSmhklBnKC2rMp/NsnkLFDfehkDQ=; b=jYFnQ7/s4xqECE
	37mIj5ABBvM3fBCql2zNOXuXhRVx1N3t7AQAtXJNL1wcBdu0y/3CO1NIIhPW4yxH4oCxmhJQucXdo
	pXciAAXmd047a6rb9V7rJH/zyyIub+9y4U/MEAuMPpNqtiqNzdME9uh6W+WDKvBMKABdQyUrK5APF
	BiLyiUC2fLJ6D26oRBTbX25dXVeziCNiGRC/xApwoAeGzWEJOe2JeG9XOJ359TJOSlSM62jjhMpxl
	EBhoC5cXc8gxkKLtAmjXgHPBN6w7L5FnLLr7IxrPUDfR/L7Ii6D38LaeR92SGw8Rml29tx2Bl9yr2
	lO8+y4eMsAV/gtfs5CSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOIB-00000003mU4-14jJ;
	Thu, 30 Oct 2025 08:45:59 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOI6-00000003mQG-3ltE;
	Thu, 30 Oct 2025 08:45:56 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 59U8j0Ca025288
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Thu, 30 Oct 2025 16:45:00 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from atcsi01.andestech.com (10.0.15.32) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 Oct
 2025 16:45:00 +0800
Date: Thu, 30 Oct 2025 16:44:56 +0800
From: Mina Chou <minachou@andestech.com>
To: Anup Patel <apatel@ventanamicro.com>
CC: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <tim609@andestech.com>, <ben717@andestech.com>, <az70021@gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: flush VS-stage TLB after VCPU migration
 to prevent stale entries
Message-ID: <aQMliHDRpejqwOro@atcsi01.andestech.com>
References: <20251021083105.4029305-1-minachou@andestech.com>
 <CAK9=C2XjygELuUnQErbpVzh6-4wc4HHypf91aKUtUzMYGJwmtw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2XjygELuUnQErbpVzh6-4wc4HHypf91aKUtUzMYGJwmtw@mail.gmail.com>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-Originating-IP: [10.0.15.32]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 59U8j0Ca025288
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_014555_294185_111F07A7 
X-CRM114-Status: GOOD (  21.40  )
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

Hi Anup,

> 
> Here's what the non-normative text says about HFENCE.GVMA ...
> 
> "Conceptually, an implementation might contain two address-translation
> caches: one that
> maps guest virtual addresses to guest physical addresses, and another
> that maps guest
> physical addresses to supervisor physical addresses. HFENCE.GVMA need
> not flush the
> former cache, but it must flush entries from the latter cache that
> match the HFENCE.GVMA???s
> address and VMID arguments."
> "More commonly, implementations contain address-translation caches
> that map guest virtual
> addresses directly to supervisor physical addresses, removing a level
> of indirection. For such
> implementations, any entry whose guest virtual address maps to a guest
> physical address that
> matches the HFENCE.GVMA???s address and VMID arguments must be flushed.
> Selectively
> flushing entries in this fashion requires tagging them with the guest
> physical address, which is
> costly, and so a common technique is to flush all entries that match
> the HFENCE.GVMA???s
> VMID argument, regardless of the address argument."
> 
> This means ...
> 
> For implementations (most common) which have TLBs caching
> guest virtual address to supervisor physical address, the
> kvm_riscv_local_hfence_gvma_vmid_all() is sufficient upon
> VCPU migrating to a different host CPU.
> 
> For implementations (relatively uncommon) which have TLBs
> caching guest virtual address to guest physical address, the
> HFENCE.GVMA will not touch guest virtual address to guest
> physical address mapping and KVM must explicitly sanitize
> VS-stage mappings using HFENCE.VVMA (like this patch)
> when migrating VCPU to a different host CPU.
> 
> We should not penalize all implementations by explicitly calling
> kvm_riscv_local_hfence_vvma_all()  rather this should be only
> done on implementations where it is required using a static jump.
> One possible way of detecting whether the underlying implementation
> needs explicit HFENCE.VVMA upon VCPU is to use marchid,
> mimpid, and mvendorid. Another way is to use implementation
> specific CPU compatible strings.
> 
> Regards,
> Anup
> 
> 
> 

Thanks for the detailed explanation! Our implementation does require the
extra hfence.vvma, so we'll add a check to make sure it only runs on
the platforms that actually need it.

Thanks again for your feedback.

Best regards,
Mina

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
