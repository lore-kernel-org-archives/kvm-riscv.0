Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0411CEFD01
	for <kvm-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 19:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=30ysgIOsU3eGGm3ABgZnNCkYCjPgD4ycrrorlrfQ4SE=; b=SavHHIsQbZP9od
	IJ2oZPPVFmWlqtLClp/KS6rVEN2cp4GGWCmzPWw4tapofKuBCoDkV95BWURCrxUgtJb0FJ5OYvu9J
	zvtUn4ZQ3A7a89aQe8RVotSVACWkCsgkUa4ZKrCWxrRZkotO8LLmdzdaqvGPZEpx6EODaL2rSMCgM
	tfCL2zpBQaoXeP55a1WdZiQtqz9QwtZndZ24GVtdvuw0I0DJ2egv4ua9pDQRRldIHl2EzIa0haWkR
	1fOQtwgbqIDGCDwPo7+/scWuTwyLWKHWsnHo71RID0EmpBklAoWkWKuRXK/aNug9IOfMp5ti1kVpQ
	ySULUM+msVFp56lcmUWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdD3h-0000000DmY1-2GDi;
	Tue, 06 Jan 2026 19:49:37 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdD3b-0000000DmWX-00tM
	for kvm-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 19:49:33 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4ee147baf7bso59741cf.1
        for <kvm-riscv@lists.infradead.org>; Tue, 06 Jan 2026 11:49:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767728969; cv=none;
        d=google.com; s=arc-20240605;
        b=I6zUZHv0nOUUAsc8xOHwUPfpQ4+x096LcyGan9w18YKx/qkiFfPspfSBZkB61/T4qG
         VNbunMlK1QvtawsWemCJDXKOpuCCHueOhGifuXVGGFoMVDHL9sWkwkpTXm3TOh9G+nql
         lSBEh+x9285UsQpVBGTl5B+LNmUl8YJMULkAkIxGHCjVduDwBmlejdnhwdop+1SOssFv
         loGo102+son2g2eesnA/0Zr+IOBsaqTDDLBC/BgfP4zWvD+1uGvxDg9XegFoUUBgzUeT
         cxRH+hAwCWAvlqIfUF4ILGc+Y7uZ81dzHvvIFSvljm+KNa6GLUsbrW3/Th49kHPH0O+T
         Wlyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k9+aHBxxyMm5uEUryvCGnluoRKqqLv7iqR1X9acm+vo=;
        fh=6kAgN+eUd5v7CjYPZjpSsZR5jQqwvoBGcPnZjAyovcY=;
        b=K1YW0q3d+jpLi9pPBWNeGmBn20HPVf33guMlPbx9jUMGeNHGF7Wp4ubmFh3czGhKbW
         BwdKhsCtLINLBWd+brJMHagl3vFUWs9/IAo11/9/FNwA7+QR9Vifa51BQPYQTPV/yv2f
         dFlVu4U8wUcHI3mDL4yD473VpzhlI1b3oL+JYjaA3SPTdiBIRKI1fotxuX0mb4GJ0/Mx
         Npf/QsjYbEstDtF3gXbZSSq5T4vY72BgDDdGaQoMqqsarct/q2OlDWyHdnKAo3mCs8dk
         Dwbr6PMJ5RERqDkviCY5y/h3iPp09v1aUoVlC6GhtP2UWZWLxs/RzhMLPz9kjpWAum67
         GPFw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767728969; x=1768333769; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k9+aHBxxyMm5uEUryvCGnluoRKqqLv7iqR1X9acm+vo=;
        b=HHmyZHr2ADeqr27tUkGGuW9b7EM4tFLTWclf6NvmqlSsQ4nOVPQJz7nHr8dV5U4Pso
         TzJrkrKJK4yypIEhYdCLOK6liTuWqMPAqxjGYDheoRo0t1xqPtSyIcRglHjZIDv++fSY
         zBdYOPvEvUJmJjr5KITbA2KZpOoqMKCJxvKA/AvPwYVEYVIyR8taGFHAupavIE65NmWO
         RxgBp5FsNVJf6aD0hzquI0jl5jwXpMvzx0ufs92ABv8MEJoli8TBazoPga35QhKR2Vr8
         cCN7OfRwSqcZRv+MXyw7gleTogoZhwtz3DTEL+xUTXkO1sKe9ihuM3R4Ku8PHyG+W+Ls
         0ZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767728969; x=1768333769;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9+aHBxxyMm5uEUryvCGnluoRKqqLv7iqR1X9acm+vo=;
        b=dsLb/mXUOP2l8DN/Ki0rz3JkeAJw0FUJcJpEjjeU5XCwTj5rImnFyHuSuw/HjNQw9d
         NB63boFRWa37FE310PZiySQK/8a5aTa2PtY3u74WO0WeXmwc2LhKoUSQa5twJ7iSn3VY
         sP7WVrvphrNcg5qUIYejYrSnP9nCPFYPfUya1kMHoiH3TMtBkDNrsbrHwtlrO8qtAXEK
         oCSjoXMXbJ89dR/kLk/pTMW0d2L6wmVq+gE68xyBAXGtcayUBZcB/2/KVm773JUm25sI
         RkHy1hj8oXB/4yDwAkm4BCLgwJDavpYlQ0Ef0mpSA6rO5nzJfg+bvCmoyi6b7occrX+c
         D5jA==
X-Forwarded-Encrypted: i=1; AJvYcCUvIK4n369IweeL9cJ4FE3REt/S/vummiePTRloSy50MerOBtw8wkTTf5ErOY+6kwBYqnESTx3uIMg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyLIuYK/okLZkpJ/RuTcQfV+VjvtfGSDdvne5NTqmGctePmk5tI
	8cZJlCQvExAzkLp5L301oD9sPb7yHJI1gy6lKkoWviW4RuSgmYUkW8w1wE1kzIaI/ZX8YBArx/C
	NK/BMx4wrkXfSmg94lYHJcQ/bvBwtn5v0pOwrN6Qv
X-Gm-Gg: AY/fxX55D030/HubrZHkzFY24iyVXMqaULPVs6XFGbUQPpt8LM+VR2NAwyVEnd4vvn9
	3xEoYyoUQFpmBfbnGy6IOTP/8wyPZvlrCz93i8iq3kSfcKi8tvEBeiOBTuwz4cDmyHgw8Oj+v7M
	Rck6TsXs80MoV8tFxNwz3t5LWaEfpfJAPPZGlHoxy1E/EmB+3+RIDQKQ2YYBtKN7c6L/CmwahXV
	d3JKmKa2ODlyHp27bhDeHMaIEt7faCK8j/1fRyP/Y2IC0SRl5v1AH8QVRhc2bG8S8N3tUV0
X-Received: by 2002:ac8:58d3:0:b0:4ff:a98b:c33e with SMTP id
 d75a77b69052e-4ffb3c9bfd7mr1612321cf.6.1767728969218; Tue, 06 Jan 2026
 11:49:29 -0800 (PST)
MIME-Version: 1.0
References: <20260106092425.1529428-1-tabba@google.com> <20260106092425.1529428-5-tabba@google.com>
 <aV1mqQtALFIUBHVM@google.com>
In-Reply-To: <aV1mqQtALFIUBHVM@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 6 Jan 2026 19:48:52 +0000
X-Gm-Features: AQt7F2oD6imhUH1-IKtVcA97OhzMLb8nSqzV2q_rb-md0NTxT87GehM6m6PIMYQ
Message-ID: <CA+EHjTw3YBG9HNateXEAYsSUJ625eWGu2OHt-2=Y0=-qzbObWw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] KVM: selftests: Move page_align() to shared header
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	will@kernel.org, pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, 
	itaru.kitayama@fujitsu.com, andrew.jones@linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_114931_935679_C47CEE65 
X-CRM114-Status: GOOD (  17.92  )
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

On Tue, 6 Jan 2026 at 19:46, Sean Christopherson <seanjc@google.com> wrote:
>
> On Tue, Jan 06, 2026, Fuad Tabba wrote:
> > To avoid code duplication, move page_align() to the shared `kvm_util.h`
> > header file.
> >
> > No functional change intended.
> >
> > Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  tools/testing/selftests/kvm/include/kvm_util.h    | 5 +++++
> >  tools/testing/selftests/kvm/lib/arm64/processor.c | 5 -----
> >  tools/testing/selftests/kvm/lib/riscv/processor.c | 5 -----
> >  3 files changed, 5 insertions(+), 10 deletions(-)
> >
> > diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> > index 81f4355ff28a..dabbe4c3b93f 100644
> > --- a/tools/testing/selftests/kvm/include/kvm_util.h
> > +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> > @@ -1258,6 +1258,11 @@ static inline int __vm_disable_nx_huge_pages(struct kvm_vm *vm)
> >       return __vm_enable_cap(vm, KVM_CAP_VM_DISABLE_NX_HUGE_PAGES, 0);
> >  }
> >
> > +static inline uint64_t page_align(struct kvm_vm *vm, uint64_t v)
>
> Maybe vm_page_align()?  So that it's a bit more obvious when reading call sites
> that the alignment is done with respect to the guest's "base" page size, not the
> host's page size.

Yes, that's clearer. I'll fix this.

Thanks,
/fuad

> > +{
> > +     return (v + vm->page_size - 1) & ~(vm->page_size - 1);
> > +}
> > +
> >  /*
> >   * Arch hook that is invoked via a constructor, i.e. before exeucting main(),
> >   * to allow for arch-specific setup that is common to all tests, e.g. computing
> > diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
> > index 607a4e462984..143632917766 100644
> > --- a/tools/testing/selftests/kvm/lib/arm64/processor.c
> > +++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
> > @@ -21,11 +21,6 @@
> >
> >  static vm_vaddr_t exception_handlers;
> >
> > -static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
> > -{
> > -     return (v + vm->page_size - 1) & ~(vm->page_size - 1);
> > -}
> > -
> >  static uint64_t pgd_index(struct kvm_vm *vm, vm_vaddr_t gva)
> >  {
> >       unsigned int shift = (vm->pgtable_levels - 1) * (vm->page_shift - 3) + vm->page_shift;
> > diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
> > index d5e8747b5e69..f8ff4bf938d9 100644
> > --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> > +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> > @@ -26,11 +26,6 @@ bool __vcpu_has_ext(struct kvm_vcpu *vcpu, uint64_t ext)
> >       return !ret && !!value;
> >  }
> >
> > -static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
> > -{
> > -     return (v + vm->page_size - 1) & ~(vm->page_size - 1);
> > -}
> > -
> >  static uint64_t pte_addr(struct kvm_vm *vm, uint64_t entry)
> >  {
> >       return ((entry & PGTBL_PTE_ADDR_MASK) >> PGTBL_PTE_ADDR_SHIFT) <<
> > --
> > 2.52.0.351.gbe84eed79e-goog
> >

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
