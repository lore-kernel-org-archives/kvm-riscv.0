Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A447C624D3
	for <kvm-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 13:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bc/hqkOHD/MJrxZGFRPZIZnv37HunEKdYYawoMX3RZw=; b=0IB8khXvT1VRYO
	AbNfBr6rfBGaxhrBWf8A0fRrED9Ykt7tFBEp2pczQMfdeWXjpdFpOIlDOjphlm5yAqPQFxYEb9ThM
	ctfqLEmywUSDnRRi7CbSev7HmcdWdJ7orBWiL8VYcQl8KJdqBEwIToK0w3phUiv/y+XwcVOT40GRf
	LNo6wVAakU+7vZdfiwj1knZlBZbjQMrGFEFzbrRe/Hf3tfaSvJFWjww8NGiIUJcbZ5i0Inn/Mrsj9
	tCVplrf6M89nQYMSAI8It2/er335AP1pK4Pz5+AOv1gZM1UxMBrJVhEse8Z/IOk9BMek/B2IuhbRh
	7+T6fMDOaob2CQ7JzUHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2U1Y-00000002ELM-08TG;
	Fri, 04 Sep 2026 13:32:08 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2U1V-00000002EJV-0IkK
	for kvm-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 13:32:07 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so1178713a91.2
        for <kvm-riscv@lists.infradead.org>; Fri, 04 Sep 2026 06:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788528724; x=1789133524; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gE9P4GObqZliYweF8gHdbLVlqBxBO1frIJ8W7HGnk/w=;
        b=B4iFs3K2aKZTN0IMEqYzMyLkOxsoJAXBebAypvCf4ETxvNj3lBj4kx9BCwvwBCQoIF
         kzoAbM6QOutcalX2jatvq/ns2MU1kQtvwkZvOlenG+zXEeARHJaasE2YIbdnTTGYrDjd
         4zWQ4DJ8cd4SfvmKSrI/rwWu6/eGcWQId1vOIjBh3IGJw/DeVdtkmhgVI+G95imIjAbv
         2UmAbutuM6lDzE+7k9/R2GSov1ITbPLEmTgKE3aSfCRRC7sO0/yUwLLnUPh0ZLdlO9Iz
         1p8IK8zZ0zf3UR1OfNNMJd7zyX8aI+cEC1jxSqWwPEFYY4Skydc2wcWjKPpgQ8fj2gMq
         Yhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788528724; x=1789133524;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gE9P4GObqZliYweF8gHdbLVlqBxBO1frIJ8W7HGnk/w=;
        b=FSNc64gD9HYsnz0wnhocgOTBOw+AsYY/Y6OWprraAL4UaAWPbRV1PvFD9OPEp/0GPl
         Zcr0/jtCrDZPpbNkmsU418zDtYQ9aXa6WKSKnk6FXYspD+Nz07UdPAI+TpoxC8u5Wd14
         J2mDsgKJ+9d5RWW4xvE7yl3GajmjhNMZJlXDqfQS4pqtrnj0Pw7Ctm/GuU/8NtXoB62d
         zohqJQ71nNKhMowIIhM+2+LNaDVYLZUS8ZTUivW6PT1cIgxweWrqCBM+uuSAgk0dl+sb
         TigS3XrONt7wnLb7zOVx2dWMf3hPgrfRBX+Zn4LN/5wSp4Iyh4ZKiXZTvE9Ksx/KqD9N
         vfvg==
X-Forwarded-Encrypted: i=1; AKwUvBzK0Ie/1h2P99EctktY8YZyOkhJZDcwOOfc1Af+HeccOY/6R5jxaPZKeeOzdTnMlEovD+sFNSV6cKg=@lists.infradead.org
X-Gm-Message-State: AFuF++nTlYOiNMJm3RVR8Ihn9CDBbs07U5hIXVAbwAH5072OSrT1tjxc
	eGH/KNQw+FRaBrqO/UgE1oEGXnO9dsyPkV26XoD1y22eOobWzJwIv5He
X-Gm-Gg: AYBFou0fKMgywpwzEvJ2o368VC6IbtirAUF55u56Vg2Lcd59BYCeZWZ6fPPbByXcywU
	0wVifSejRrXM//Dr7GhevUaS0bRYqsCxm9yPs0yXydqOHwkJD3VtRHbL1PZCduXDXNb8Hc0VSxF
	pr0bTw9NAdj0CYLfc7GmnSHSHrpN9DhgEmTbmhKbKQRcRl+jjLb2tQEXzyNFXNz/Uv4U/MloC1+
	fa5eObNhV/o7Qozk6LEhwNMmGtCj31GxUuS65TZFeKFmViGrky+ZVSv9RIxcruNnH2tVPzw/zZq
	SwxIYEd6IjWb6iJPwxJRTdTxUJF4PuyQYayOVu4hgecbyALzvtPzPVDtx6jEpqKilDXFh9pk2aP
	KBxXvj3GHKXJQFgzKWx+0l3M4wuIv2Z3+teXJvYU/7gk0ZlE+rg6ZVeUvJz1TBs/QLO5wQAoXfS
	Zvxi14JKBE4Laz42Wy4yUxSNh1zH4b/Ia49PoICYVTwalsT51LZ1S676J6f2dT2EGsYYpJEumcA
	hV52iBwrkroo8L9Fqn5xsgrfrdA5Srco1KxOQXz9C+g
X-Received: by 2002:a17:90b:3a50:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-39b26101576mr10859346a91.11.1788528723581;
        Fri, 04 Sep 2026 06:32:03 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534d25sm7083483eec.5.2026.09.04.06.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:32:02 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 04/20] KVM: selftests: Rename "num" param to "nr_pages" for physical page allocators
In-Reply-To: <20260902164123.2546762-5-seanjc@google.com>
Date: Fri, 04 Sep 2026 19:00:16 +0530
Message-ID: <ecf9ta8n.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-5-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_063205_112309_5237C61F 
X-CRM114-Status: GOOD (  14.63  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Sean Christopherson <seanjc@google.com> writes:

> Rename the "num" param in the physical page allocator APIs to "nr_pages" to
> make the unit and role of the param more obvious.
>
> Opportunistically rework the function comment to drop the superfluous
> kerneldoc style, and to very explicitly call out that success is guaranteed.
>
> No functional change intended.
>
> Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../testing/selftests/kvm/include/kvm_util.h  |  6 ++--
>  tools/testing/selftests/kvm/lib/kvm_util.c    | 35 ++++++-------------
>  2 files changed, 14 insertions(+), 27 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> index 5a7a455b5387..95bc0a78d2bc 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -991,11 +991,11 @@ void kvm_gsi_routing_write(struct kvm_vm *vm, struct kvm_irq_routing *routing);
>  const char *exit_reason_str(unsigned int exit_reason);
>  
>  gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa, u32 memslot);
> -gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t num, gpa_t min_gpa,
> +gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
>  			   u32 memslot, bool protected);
>  gpa_t vm_alloc_page_table(struct kvm_vm *vm);
>  
> -static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
> +static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
>  				       gpa_t min_gpa, u32 memslot)
>  {
>  	/*
> @@ -1003,7 +1003,7 @@ static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
>  	 * protected memory, as the majority of memory for such VMs is
>  	 * protected, i.e. using shared memory is effectively opt-in.
>  	 */
> -	return __vm_phy_pages_alloc(vm, num, min_gpa, memslot,
> +	return __vm_phy_pages_alloc(vm, nr_pages, min_gpa, memslot,
>  				    vm_arch_has_protected_memory(vm));
>  }
>  
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index 9ddc047d5c27..b071d77dd301 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -2025,33 +2025,20 @@ const char *exit_reason_str(unsigned int exit_reason)
>  }
>  
>  /*
> - * Physical Contiguous Page Allocator
> + * Allocate contiguous (guest) physical pages in a given memory region, at or
> + * the minimum specific GPA.  If the memory is protected/private, also add the

at or "above" the minimum ...

Otherwise looks good. Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
