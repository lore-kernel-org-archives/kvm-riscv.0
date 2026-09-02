Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD71C624D9
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 16:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=puziYl5k7IWLLZG9oGSbfEW6E605SCFsXGcZEWvqXY0=; b=0IyxsU+txmPq1i
	v/JkMM6l1htFRD4D6JUKCwWjeQexPeS1nTsPhYux9u0q0qiqhEGLDXXnJissOvZQtppTlU0FXV8FA
	uS9mKiM2eEMOEL/T+oAndHcg8GZRcXC4AQdTERet2dxDz/Psjo8n8E4DLY9s8GXiFhE/0JdsEIdzB
	lBCFAoRAAG3yhdg+8FVMr1Pq/rZzSPl3E0SyEaoK8zZu4rI4fnr7uedVgxidi4fWkzMQFI+9ee7ba
	ZYFNtpiwXAAG8HagSAxBsLgJsV5PLYjWeliKYVg2dMTjmykN5WmlCVh1yj0ewyFzjb59nAIbxEAGe
	OGApQ07pm62Og8y5iQ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o21-0000000FEiW-3vT5;
	Wed, 02 Sep 2026 16:41:49 +0000
Received: from mail-pf1-x446.google.com ([2607:f8b0:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1o-0000000FECR-1EhC
	for kvm-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:39 +0000
Received: by mail-pf1-x446.google.com with SMTP id d2e1a72fcca58-8544b721ce9so1752758b3a.1
        for <kvm-riscv@lists.infradead.org>; Wed, 02 Sep 2026 09:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367294; x=1788972094; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xxl3R2RxR/fdY+CE5Gsyx1FXrQJglfzt8OPnA5rO56k=;
        b=Xq9Cb/jbl6C+BQ11bI2exilRrpI+SaFXJBgdzn13Qc4A319ALpb5c7X/N1pWKYPXl2
         HCwxmuTRxa1NaDbuCIQd3JG0n/eupz59iJTdPyWSzVK4ynT0uX2PKW31bROhl01y+CxC
         cClf2PYtos5o+8nOlcVYoiBR/LpkmDVzIwCwWqJiMAH86vi4dGJgY9CinKngLB3LGr2u
         93Il/x8BD4o05j0MZD0fLf4O7HN6iGamdapFchZ4Gq469UIfHHJ6BKQkuW5Jp7iFHJid
         NLtulZ6RaQHkJGUR+OztC7hn83qp9f1pGYsfHgK2Nwcqe1bPCwPT20Qtu8cYVBSIMpu4
         ed7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367294; x=1788972094;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xxl3R2RxR/fdY+CE5Gsyx1FXrQJglfzt8OPnA5rO56k=;
        b=omcgbe+7B3Vml4t/0PA3wqXMokSM/9iN6arT9mB6aZAglr2//RGk9AwQ/ozQQxWVz+
         8oEL314Ny41cG/5y0dFH3h0L8qJlOCb/S8PM6/XoFyToQBVS7hgKb57M2pLfSeVZgy5E
         FpFf6NBgMFWvSs8NIuGDpTG7iVmPJMLu6GZuVQBSzU9g9Yf3wPTKNP+q9vxMWO9CmgCr
         1SKCMgk4XM2u9DQntvSkYff1zCTHD+KEkTXHNFWZMn0pLzlCvdHSAbJV7jzD+TjQ8amm
         ynAtq3peZaYiAdcqTFcLfTO11quP2PsYgq7huGXnp3jNBg005LnEIRzACnET/MkYabmC
         1Bpw==
X-Forwarded-Encrypted: i=1; AKwUvBz417EjZlZ4dCcyVDU+ASa4oFmNcPeMMuyNm/d+Brga//izDdlinSA7XtAM0r72xNu57uf8q5jCCag=@lists.infradead.org
X-Gm-Message-State: AFuF++m6+ABkGH91pCZLcA9gjdhs9ryOQFPpoKJbhiIInvr6QSOmwOmO
	5Mwkv3hL0r0YFk2keSbDQeIyA3TkHtZMHkucucWLhhs3yz1+cQ0AvwfRZyRiU+v2kXNBgMSqZcV
	4hxtvNg==
X-Received: from pfmy23.prod.google.com ([2002:aa7:8057:0:b0:847:7f5d:6b90])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4fce:b0:845:e9e8:645c
 with SMTP id d2e1a72fcca58-85ed7d1ddf1mr9648289b3a.6.1788367293421; Wed, 02
 Sep 2026 09:41:33 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:10 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-8-seanjc@google.com>
Subject: [PATCH v2 07/20] KVM: selftests: Make the single-page allocator APIs
 static inline
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
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
X-CRM114-CacheID: sfid-20260902_094137_551937_E8E3A318 
X-CRM114-Status: UNSURE (   9.66  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Move the single-page allocator APIs to kvm_util.h as inline functions, as
the are trivial wrappers, and unlike __vm_phy_pages_alloc(), are expected
to remain that way for the foreseeable future.

No functional change intended.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 14 ++++++++++++--
 tools/testing/selftests/kvm/lib/kvm_util.c     | 11 -----------
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 4732b9528812..d9d39a8894e2 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -990,12 +990,10 @@ void kvm_gsi_routing_write(struct kvm_vm *vm, struct kvm_irq_routing *routing);
 
 const char *exit_reason_str(unsigned int exit_reason);
 
-gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa, u32 memslot);
 gpa_t ____vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 			     u32 memslot, bool protected, bool naturally_aligned);
 gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 			   u32 memslot, bool protected);
-gpa_t vm_alloc_page_table(struct kvm_vm *vm);
 
 static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 				       gpa_t min_gpa, u32 memslot)
@@ -1009,6 +1007,18 @@ static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 				    vm_arch_has_protected_memory(vm));
 }
 
+static inline gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa,
+				      u32 memslot)
+{
+	return vm_phy_pages_alloc(vm, 1, min_gpa, memslot);
+}
+
+static inline gpa_t vm_alloc_page_table(struct kvm_vm *vm)
+{
+	return vm_phy_page_alloc(vm, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
+				 vm->memslots[MEM_REGION_PT]);
+}
+
 /*
  * ____vm_create() does KVM_CREATE_VM and little else.  __vm_create() also
  * loads the test binary into guest memory and creates an IRQ chip (x86 only).
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 896da440659e..ce0d8fba4624 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -2086,17 +2086,6 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 	return ____vm_phy_pages_alloc(vm, nr_pages, min_gpa, memslot, protected, false);
 }
 
-gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa, u32 memslot)
-{
-	return vm_phy_pages_alloc(vm, 1, min_gpa, memslot);
-}
-
-gpa_t vm_alloc_page_table(struct kvm_vm *vm)
-{
-	return vm_phy_page_alloc(vm, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-				 vm->memslots[MEM_REGION_PT]);
-}
-
 /*
  * Address Guest Virtual to Host Virtual
  *
-- 
2.55.0.966.g6673acef38-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
