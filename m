Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED3AC982E1
	for <kvm-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 14:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TObxXxnrurGo6xQyoNS7BMZE+hCShQj8SNt0afqBB7s=; b=ev+2cTvy/81Wvsyng9Ohit+LdB
	++aBQEqVR25XYQkHPH7anwUQWHEC/z5IwuwYIenjzOEbbZUxvi6FreYY4wUdjQIhgxHoB42V8IRDR
	6EhuX2d92v5nl/DSyLl6iO2T+QAdzaiAEDsYE+hzKvMDUVlPWYL6a0rsQ8d/FKJfrmxD6Y0TnmVau
	adpLTxfwQ7mR7DvzPCW6Z9t8sR4wJHptKjlnVryVdJczbp6kCcxqtuja8HkgreezRKesTNSom8a46
	nnmrW6ouxRFNdBv2RcFMAJjq40FwS9/Zf6pHQly0n3ELB4pJPdUZYzYuNmj2qQmj28hoWqqo2HQdI
	Qj8FFcpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8egb-00000002LSB-02kp;
	Mon, 21 Sep 2026 14:08:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8egZ-00000002LQm-2Uf3
	for kvm-riscv@bombadil.infradead.org;
	Mon, 21 Sep 2026 14:07:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GOYAH6R+ATW22r2VK1upIBbGsmi1bjog4cG/z3wfeFY=; b=ZZgBxsNyipfsqR2orWYwvuQktx
	IV95rNs4MdQoH0ttyqRYzp3YFSd7WRuFxbW2YQpL/uh5Eg49mJz0i5Yyi1MxgyeCLZWjOuftQfsko
	kICVWtkJonC62Ysn/+6xe0Nd7lpyh1E5Cxj538ygZYfUA/3y6rDQy+p42Fn/kKIrCdCmCfWgwvIdw
	X1HQ9vhdi6b5yDNg/gmIpPl8UpJMGpKfUxJRX/erVZALKXwQYVftaK26HdzH/9gzX/eptn9eTwtXX
	vT17cfU6MtEkJJbwpp9ix677jn9JWjYjzJQuyFlOxRS4vN6XEyyGEDx8Ur6k5mxcxvRKZUJOJHDLH
	7k8Fj25Q==;
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8egV-0000000CNrL-3YfO
	for kvm-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 14:07:58 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cc4922b7c31so3007937a12.1
        for <kvm-riscv@lists.infradead.org>; Mon, 21 Sep 2026 07:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789999673; x=1790604473; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GOYAH6R+ATW22r2VK1upIBbGsmi1bjog4cG/z3wfeFY=;
        b=ZRzDkw8xoVBYcdR/0y7eyJEdZuHDjmD3mgXEGkjNo80v+ywW/c+G26+ULGkCUP1hz4
         TpvVe7sEtrkqsM5Yduilxxy/DZGkFL83eV9sdbxKt+A1YvinwkSmRw6/xeubMRGhsEJu
         QGoY6CCwbumTiEp2ZmSaF1pWgUHt1C/LnoTJ+ZCzk5hsWo2Cm9pity/R+bmkhcL3lHPY
         5zQS0rxx4H67odE/IkhARl5qtD7t32+aVFaq6Kd2AXK5naXYiYm2GvUkHF6P7Pd00zru
         gNRj0cAcUJkC5EgoNvlJ/91a9jFoibUmgGb+AkhJx70irp0sgk8/1n/PDXJarDXVEvzP
         K9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999673; x=1790604473;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GOYAH6R+ATW22r2VK1upIBbGsmi1bjog4cG/z3wfeFY=;
        b=XO/bHKxW33A9sfQj2Z4+pt+vbdjAsvNVJ4z1QnhuI53fOYfhB6DFckzAgSoJYfd3ed
         EElQGvmLrDMxQcGffYDNXBQRVNNVIEHo/Y80rRWsslkqi6oBKZuiq0jYdBSW/f1egw7r
         3IL/wpfKklCJvvgy2y92/ge61QU9ADiVTxhUxMju5FtOqqc4EnmHj7k2+Kzx0UI7jBCf
         2p2aFmvC21K4Rpn/OKrc7ICWj6k4xKAfV9jw+NsELygtMAbbvRI38fK/TkeKcRnEwVIO
         ycDXiTapeFgOTMKr3J5dtnTC/1MKXBQMOY20mfeUW3NXpc2AaslmHL2vvn1o37QqdNXu
         4igQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/wsmSRg9P4Ye/2/qoVBvBRiZ5kbQ8krlKYLChJCEFvnpCwLrEk2rUp7gvVdqLDppPY3tFR/f+sPM=@lists.infradead.org
X-Gm-Message-State: AFuF++nSE+mQBCbNiSmjmlTqn6ESXC6nR22S4RsisfoQmeA8lWwYvHG0
	+015t4vCq+30DrNcZ4XMECCR5RBiYzOIpw/BZvPLSV6lWFmSpUvFPPq7F556mbUitpPc/DuAn6r
	7K1Ca7A==
X-Received: from pgbfu4.prod.google.com ([2002:a05:6a02:4a84:b0:cc5:1d94:8e5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:4688:b0:3dd:a196:3094
 with SMTP id adf61e73a8af0-3dda1963396mr11496717637.68.1789999672947; Mon, 21
 Sep 2026 07:07:52 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:05:44 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <178999944766.761024.7401957242293009313.b4-ty@google.com>
Subject: Re: [PATCH v2 00/20] KVM: selftests: PPC pre-enabling
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_150756_412231_623DEBEC 
X-CRM114-Status: GOOD (  11.77  )
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

On Wed, 02 Sep 2026 09:41:03 -0700, Sean Christopherson wrote:
> This is a big pile of cleanups and refactoring to prepare for PPC support in
> KVM selftests.  PPC has paging modes that require multi-page page tables, and
> those page tables need to be naturally aligned.  The original proposal was to
> plumb in an @align param to the page allocators[*], but I didn't love the idea
> of adding another rarely used param to the allocators.
> 
> v2:
>  - Collect tags. [Itaru, Bibo]
>  - Use 0x180000 as the min GPA for page table pages on LoongArch, instead of
>    changing every other arch to use 0x200000. [Sashiko, Bibo]
>  - Opportunistically move the vGIC LPI stress test's global "gpa_base" variable
>    into setup_memslot(). [Sashiko]
> 
> [...]

Applied to kvm-x86 selftests, thanks!

[01/20] KVM: selftests: Use MEM_REGION_PT memslot instead of '0' for s390 regions/segments
        https://github.com/kvm-x86/linux/commit/73ac07325851
[02/20] KVM: selftests: Use the common minimum GPA for page tables on LoongArch
        https://github.com/kvm-x86/linux/commit/9886413e0466
[03/20] KVM: selftests: Use vm_alloc_page_table() to allocate LoongArch page tables
        https://github.com/kvm-x86/linux/commit/befd94805906
[04/20] KVM: selftests: Rename "num" param to "nr_pages" for physical page allocators
        https://github.com/kvm-x86/linux/commit/d220e33516fa
[05/20] KVM: selftests: Use goto instead of do-while to retry finding unused physical pages
        https://github.com/kvm-x86/linux/commit/2c0555c51e7c
[06/20] KVM: selftests: Extend page allocator to support naturally aligned allocations
        https://github.com/kvm-x86/linux/commit/2429ecf7ccd5
[07/20] KVM: selftests: Make the single-page allocator APIs static inline
        https://github.com/kvm-x86/linux/commit/54e83f729385
[08/20] KVM: selftests: Use the innermost page allocator API in the memslot perf test
        https://github.com/kvm-x86/linux/commit/b8d9e6ec747a
[09/20] KVM: selftests: Use the innermost page allocator API in s390's IRQ routing test
        https://github.com/kvm-x86/linux/commit/9c0061d2e7cd
[10/20] KVM: selftests: Add a wrapper API to allocate multiple page table pages
        https://github.com/kvm-x86/linux/commit/7f477ba0878e
[11/20] KVM: selftests: Initialize vm->memslots[] with invalid memslots during creation
        https://github.com/kvm-x86/linux/commit/9e4e2281df12
[12/20] KVM: selftests: Add APIs to override memory region types with custom memslots
        https://github.com/kvm-x86/linux/commit/d69b3e714265
[13/20] KVM: selftests: Add TEST_EXTRA memory region type for "special" memslots
        https://github.com/kvm-x86/linux/commit/9f035aca8765
[14/20] KVM: selftests: Use TEST_EXTRA region in arm64's vGIC LPI stress test
        https://github.com/kvm-x86/linux/commit/5d81014d3868
[15/20] KVM: selftests: Use TEST_EXTRA region in x86's smaller MAXPHYADDR test
        https://github.com/kvm-x86/linux/commit/00c37bfc5b4e
[16/20] KVM: selftests: Use TEST_EXTRA region in set memory region test
        https://github.com/kvm-x86/linux/commit/5ed16822bc45
[17/20] KVM: selftests: Take the memory region type, not memslot, in page allocators
        https://github.com/kvm-x86/linux/commit/36a062568ea8
[18/20] KVM: selftests: Use TEST_ASSERT(), not assert(), in vm_get_mem_region()
        https://github.com/kvm-x86/linux/commit/1856064afc9d
[19/20] KVM: selftests: Automatically pick min_gpa for allocations based on region type
        https://github.com/kvm-x86/linux/commit/6c28a0d7cf12
[20/20] KVM: selftests: Add arch hook to force page tables to be naturally aligned
        https://github.com/kvm-x86/linux/commit/1e59e5a3bdbe

--
https://github.com/kvm-x86/linux/tree/next

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
