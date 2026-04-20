Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D12AF5A8B9
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 20:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lTF+59JCNInhfuvzXtlkMpPn9gJPYYOZwzl+/m5+KCg=; b=YlRag8SzDt8wze7QHpHg/9HFcj
	maV1fjw17VcBcLEKVz5cmlxqOS5OtkN9LdPc34N175bu+miZ6KReN67tZpBAZBLaQg/CUc4UWHcrh
	gdvwpabGt2xk9oB5KUlKECw6bAzDVJTJ0QxR9QletPmtV+B4LiZDLIwOg2mpYKf6tgUbaozbYIyGB
	5SClj8WusOQI2wNFLqJGJacKvtntk/ee/Lyuw/iD/A/D0cv5/4tcxGbo8HkD4nPZWxehggfpysKqO
	5j6gy4UMb4bqfltRuXWr3Ng96C0yjwtvGYEGchm74emALqGICba6WLNXoRqXC/xRt9m1jr1cqRfcw
	ok+7eQHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEut2-00000007bmN-1PqO;
	Mon, 20 Apr 2026 20:06:28 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEusz-00000007blK-1npO
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 20:06:26 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-35da97f6a6dso3338807a91.0
        for <kvm-riscv@lists.infradead.org>; Mon, 20 Apr 2026 13:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776715583; x=1777320383; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TZxYUqD2nNuvPN56vUHQyfWGRkh1zwfXr7oE1wyS0SA=;
        b=wUloowvRrnlhU2SSlwVQyNXJtgDtcGzpq5PcWEK33lLzyX83WnEO/H/wjaWTQQMZ1e
         3mI3sMenr4X9LX+niV1n/Eoeb4l3jvIlF8aAAWK0+In04b9yhpFEoKob0sn+Uf7NeXKU
         iaJCUNK9sx50bNpBkuGp7wdFNOPW79kqk1XtI+l4NY6+WJImBhYroUQ0w+aFzeavpZKZ
         71j8kLryYvxiM9Io/paqIJX4jf00OIjTLWPpzbPw0YrsRmDw1xqmjjKza13HsfLzaCbH
         iVRH+IfNS8dE26cjheqIDToCGYIHqX9V/qsBfQlcN1VibssJT3jmpwssRK45pClClmii
         ThrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776715583; x=1777320383;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TZxYUqD2nNuvPN56vUHQyfWGRkh1zwfXr7oE1wyS0SA=;
        b=XH372QFgJiC4CZMhdvsY2axb2l7X9JGfJV5V7ubXse97PdJCqNBJim+lnOdQ4Jc61u
         hwo0MuaSrj2JfRMLOCiymZFcLh2qTvSN5yRBJ+HHpHnYJq2jrPqslfTJEIEodRo09JEG
         vKkqR3LRDq3yia0YIIUU3FJuiruaGn3jwDn/rnRTvKA+7dKTgA8C8ZQxZhRslG/v1jdZ
         tBwEDaf4Q5wbkc0g90QC1aKOzPdR7q5NUYBbhOkFU2aB1XhhAk/TTROAYWxqHsgdbITo
         /ixq1L+AyC7MmEqb/HB8IjNnM3LQrB1hE7tl6EWPpJBd+dAbfcECZQGH6jc5gQgz4k9I
         53nw==
X-Forwarded-Encrypted: i=1; AFNElJ+d7Y1Z3l9NdQjesZ2GRLCJ+wIDrTLhG3WxhwhO5fVxA1boZJpdrlkBLgzfZZtKWP6iacspt37v878=@lists.infradead.org
X-Gm-Message-State: AOJu0YzjB98BCfB7UxdRpSXbPQNvadUzOlonAk7vcLZAdTegX+RHP4YZ
	DiapeaiVgE1r8x4hyITamW8+Ilb7CoSeOq5TlwnLy8WeahbXrAO3Y7I+DDfKD1BByJMvrW2PfiU
	L+CV36A==
X-Received: from pjbkx16.prod.google.com ([2002:a17:90b:2290:b0:35f:c299:a451])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:164a:b0:35b:96bb:47ba
 with SMTP id 98e67ed59e1d1-361404c0ca8mr14786253a91.26.1776715583185; Mon, 20
 Apr 2026 13:06:23 -0700 (PDT)
Date: Mon, 20 Apr 2026 13:06:21 -0700
In-Reply-To: <20260220004223.4168331-2-dmatlack@google.com>
Mime-Version: 1.0
References: <20260220004223.4168331-1-dmatlack@google.com> <20260220004223.4168331-2-dmatlack@google.com>
Message-ID: <aeaHPYwzs0dhwX9-@google.com>
Subject: Re: [PATCH v2 01/10] KVM: selftests: Use gva_t instead of vm_vaddr_t
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Bibo Mao <maobibo@loongson.cn>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Colin Ian King <colin.i.king@gmail.com>, David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Houghton <jthoughton@google.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lisa Wang <wyihan@google.com>, loongarch@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Oliver Upton <oupton@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Pratik R. Sampat" <prsampat@amd.com>, Rahul Kumar <rk0006818@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_130625_464374_A2F7BD85 
X-CRM114-Status: GOOD (  11.83  )
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

On Fri, Feb 20, 2026, David Matlack wrote:
> Replace all occurrences of vm_vaddr_t with gva_t to align with KVM code
> and with the conversion helpers (e.g. addr_gva2hva()). Also replace
> vm_vaddr in function names with gva to align with the new type name.

...

> @@ -716,22 +716,22 @@ void vm_mem_region_move(struct kvm_vm *vm, uint32_t slot, uint64_t new_gpa);
>  void vm_mem_region_delete(struct kvm_vm *vm, uint32_t slot);
>  struct kvm_vcpu *__vm_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id);
>  void vm_populate_vaddr_bitmap(struct kvm_vm *vm);
> -vm_vaddr_t vm_vaddr_unused_gap(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_min);
> -vm_vaddr_t vm_vaddr_alloc(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_min);
> -vm_vaddr_t __vm_vaddr_alloc(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_min,
> -			    enum kvm_mem_region_type type);
> -vm_vaddr_t vm_vaddr_alloc_shared(struct kvm_vm *vm, size_t sz,
> -				 vm_vaddr_t vaddr_min,
> -				 enum kvm_mem_region_type type);
> -vm_vaddr_t vm_vaddr_alloc_pages(struct kvm_vm *vm, int nr_pages);
> -vm_vaddr_t __vm_vaddr_alloc_page(struct kvm_vm *vm,
> -				 enum kvm_mem_region_type type);
> -vm_vaddr_t vm_vaddr_alloc_page(struct kvm_vm *vm);
> +gva_t gva_unused_gap(struct kvm_vm *vm, size_t sz, gva_t vaddr_min);
> +gva_t gva_alloc(struct kvm_vm *vm, size_t sz, gva_t vaddr_min);
> +gva_t __gva_alloc(struct kvm_vm *vm, size_t sz, gva_t vaddr_min,
> +		  enum kvm_mem_region_type type);
> +gva_t gva_alloc_shared(struct kvm_vm *vm, size_t sz,
> +		       gva_t vaddr_min,
> +		       enum kvm_mem_region_type type);
> +gva_t gva_alloc_pages(struct kvm_vm *vm, int nr_pages);
> +gva_t __gva_alloc_page(struct kvm_vm *vm,
> +		       enum kvm_mem_region_type type);
> +gva_t gva_alloc_page(struct kvm_vm *vm);

The existing vm_vaddr_alloc() and friends are pretty bad names.  gva_alloc() is
far, far worse.  The APIs aren't just allocation a guest virtual address, they're
allocating guest physical memory, finding a usable virtual address, and creating
mappings.

I don't see any reason to have vaddr or gva in the name.  E.g. malloc() isn't
virt_malloc().  But I do think they need to be explicitly scoped to KVM, and to
a VM.  I'll drop API renames from this patch, and rename them to vm_alloc() and
friends in a separate patch.  Amusingly, that naming scheme will still work if
"vm" is misconstrued as "virtual memory" instead of "virtual machine".

P.S. This is a great example of why I insist on one logical change per patch, with
judicious exemptions for opportunistic cleanups/changes.  If this has been a
separate patch, it would have taken me all of two seconds to unwind.  As it was,
I spent a good 10-15 minutes dealing with this.  In large part because I kept
making goofs, but that's the whole point: there was no reason to put me in a
position to make goofs.

The other argument against these sorts of "Also do xyz" add-ons is that of a
slippery slope.  Why rename these APIs in this patch, but not the myriad vaddr
variables?  Then after a few "I'll just clean this up too" changes, there's an
entire series in what is purportedly just a typedef rename.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
