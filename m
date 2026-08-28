Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC40C61DBD
	for <kvm-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 18:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=miOSXTa7zG3u1BP8gW6hAG9qF5TbEaBDXkqH5u2mjKs=; b=xDa6MwIP5WcdUWb+kwTD+EEHLg
	u1JwlMmsl9F/28tWTyAi0zzqY38Rnsdb3nwcJR69UcxHhuFrBr/sUev6xnZkXUehjm29SdVR6FLpi
	ft7TxIP1Hf/oMBzColMGtUaxkRHQAeC97UQ7QuIU5UduNh2KdPcBUOVoAihXn4WLLgKUu9Ri5scKd
	fX15VerCfYm4MFKY4MEFKL3Qum5feU57JEwOwgz2t4uqILdVpNGZP+PhiH2gsAGo2PD0Q2sPK0dtN
	sVw/Z7MpWrs1CHyWSxPcnzkGpTWpOW/wuj2eb0Fdwuf4Cld1aY6joSxRLdaJgj7OPU79M8xGA0raT
	FTqttSoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x00zN-00000006I8d-1s29;
	Fri, 28 Aug 2026 18:07:41 +0000
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x00zJ-00000006I7J-3Mqa
	for kvm-riscv@lists.infradead.org;
	Fri, 28 Aug 2026 18:07:40 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso1192223a12.1
        for <kvm-riscv@lists.infradead.org>; Fri, 28 Aug 2026 11:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787940456; x=1788545256; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lD64MUyngIsCQv9tUBdkcgzvyMQxFZ53ZEBy5BtZu7g=;
        b=CI+Bwg10kzQthQa8PgfS7UlqGE0nHQutKDb6isKQRPQI04w59y3NZljcxPtirvf56l
         XFo6BS2JUnt+ZJarMu9HwNu+r6b26WnMA/u6hkes2VnBI05C6IT/NfisNSYzPyWyDbGw
         3B91V5PQb1A+ivwP4N8mH7yt2G80GyLgw7o5UbXLfyR4MSnWiBOieO7QerERFvD0ZLt3
         LasNCBBPIK7XQ2aJgbGUqqYa4YT+F972NlRfD8loeY2WEzDV7QtHnlQLuMdxe1XPGKvN
         lJXS8zlUd/igCpPhgoJDmuMZX2lL9XXuVXRzH6pgDaMAKAF7Ll9moi3vP7WWiGpV0Uf8
         YUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787940456; x=1788545256;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lD64MUyngIsCQv9tUBdkcgzvyMQxFZ53ZEBy5BtZu7g=;
        b=DKnM2AQftBz8CQYjUNOdMUchPaFRe/miGEa2cKzzhteSvf0jQh+MiHBkM1rxmZ3c7+
         mwPCN3YCs+BAgjhmx1H44MF4Nls71XQ+F8yWXN0HoTnGp/+7UfPEu1d/ZkV8iL0VsdpM
         ekY76/47BIwkpjKMV+jXOSQuiRoOoLXSJ28fbHYKvt25bMbnNUDhHxzXMy6PF6T0AmP5
         f2CXqomyKIpFF9mVDCSnf+wG7yoYtYDniYSnrz0Ah5mgWbWZx6FSjT3HvBPHvYcBx7wr
         kPruXA1Wuas+l0xiYJVi6aaLsak9mOUtmGoPP0lXfrYeSkyz8oT6qH2tlzeRKrZFa2sZ
         tRtQ==
X-Forwarded-Encrypted: i=1; AHgh+RoWyilFCDbsM9j9FdZOm7+ALnCSQ+waD0L00IdFSf3XtGXZXTDir+HlS6LuYrEbky9ABUAP1YSKLa8=@lists.infradead.org
X-Gm-Message-State: AFuF++kdZc6ep9IfglhnWdCW0oh0TmEsFDrSwDnPdPVxvcl7Hq+J51H0
	lxPxiGvytP3Y6XO1jrPsG3tb/Y+7GKdIkHXf7lHvb4zeKNKUlRQ7FNdYufzrG6gNh8K4agpGRx6
	YFe6bmA==
X-Received: from pgtk26.prod.google.com ([2002:a65:68da:0:b0:cc1:4794:1471])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:160e:b0:3d0:e034:a26f
 with SMTP id adf61e73a8af0-3d2688bd551mr19120799637.17.1787940455451; Fri, 28
 Aug 2026 11:07:35 -0700 (PDT)
Date: Fri, 28 Aug 2026 11:07:34 -0700
In-Reply-To: <20260828195848.2d14e9aa@p-imbrenda>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com> <20260826230511.972824-3-seanjc@google.com>
 <20260828195848.2d14e9aa@p-imbrenda>
Message-ID: <apHOZouaLKs5CgpI@google.com>
Subject: Re: [PATCH 02/20] KVM: selftests: Bump the minimum GPA for page
 tables to 0x200000
From: Sean Christopherson <seanjc@google.com>
To: Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Ritesh Harjani <ritesh.list@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_110737_837219_0C76604A 
X-CRM114-Status: GOOD (  19.88  )
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

On Fri, Aug 28, 2026, Claudio Imbrenda wrote:
> On Wed, 26 Aug 2026 16:04:53 -0700
> Sean Christopherson <seanjc@google.com> wrote:
> 
> > Bump selftests completely arbitrary minimum GPA for page tables from
> > 0x180000 to 0x200000 (LoongArch's minimum), so that LoongArch can use
> > vm_alloc_page_table() instead of open coding a rough equivalent.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  tools/testing/selftests/kvm/include/kvm_util.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> > index 5a7a455b5387..70906a0d1003 100644
> > --- a/tools/testing/selftests/kvm/include/kvm_util.h
> > +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> > @@ -175,7 +175,7 @@ static inline struct userspace_mem_region *vm_get_mem_region(struct kvm_vm *vm,
> >  
> >  /* Minimum allocated guest virtual and physical addresses */
> >  #define KVM_UTIL_MIN_VADDR		0x2000
> > -#define KVM_GUEST_PAGE_TABLE_MIN_PADDR	0x180000
> > +#define KVM_GUEST_PAGE_TABLE_MIN_PADDR	0x200000
> >  
> >  #define DEFAULT_GUEST_STACK_VADDR_MIN	0xab6000
> >  #define DEFAULT_STACK_PGS		5
> 
> this breaks s390/cmma_test
> 
> I tried a quick fix, but nope... I will need to actually invest some
> time (i.e. next week) to understand why the quick fix is not enough,
> and come up with a proper fix
> 
> the good news is: it seems like cmma_test is the only test that is
> negatively affected by this series.

Is it this change specifically that's problematic?  Because if so, you can probably
just do nothing, because Sashiko (argh, just remembered that Sashiko doesn't Cc
everyone) pointed out that this will likely break some arm64 tests as well[*].

The LoongArch folks confirmed that using KVM_GUEST_PAGE_TABLE_MIN_PADDR as-is
should be a-ok, so my plan is to drop this patch and instead have LoongArch use
KVM_GUEST_PAGE_TABLE_MIN_PADDR.  I.e. make LoongArch match everyone else, instead
of making everyone else match LoongArch.

[*] https://lore.kernel.org/all/20260826232224.782021F000E9@smtp.kernel.org


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
