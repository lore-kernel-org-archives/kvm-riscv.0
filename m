Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15CDC61DC7
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 23:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YWRf/vhey9TZppYYyDanZlHJkl/qjgYimU+QYQLpVQA=; b=DXtYLfbgE4wDZq
	PZdmOG9ldgjdT6JnrjNdmjxhiZTqQZxrjZlSFuFU10zUX+ZUWET/+bRx+Yf4tInmcwLKORVIO8ie9
	ZI6KWW6dOS1AjldgWAGL8muvGNDA+ngkAKQVRP3PiXThTYVjEcVTE6VtdK9oEa7KdyRz2v4pLshQB
	FEQ14t1/WjOILUW24KiKFatVkFeVTP6pJdi8NGKVMqBhqzQ4ioP5gn08SrXWx6Y73NxWReFAgzXO4
	iswj4GfERasFFLkNi0yD3ECEvHKVLwhxWGmzGARQl3mJY94lmSFYNFF3qZsE/fMUn88mncg4AOgQ2
	69RvvOzE3h6zvRa3qlBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMiD-000000038l3-1XVK;
	Wed, 26 Aug 2026 23:07:17 +0000
Received: from mail-pf1-x447.google.com ([2607:f8b0:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgf-000000036Ur-3zSm
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 23:05:47 +0000
Received: by mail-pf1-x447.google.com with SMTP id d2e1a72fcca58-84859a64079so96136b3a.3
        for <kvm-riscv@lists.infradead.org>; Wed, 26 Aug 2026 16:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785541; x=1788390341; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pHiSvQXl4tkWm+SikbwEM4QvcPfHzRPC0s7Gep7aVew=;
        b=OjESdTT5ZxY8eMrVSoPzaACQ4YYwapwZ85FwdG8qrFjx3QuckAq9eYH2/zpUKdBzTH
         4F/HQdrJIFShRxHFLkeOFQaq7b7tinVZmGwipg2JgPNZlgR8XoKTWi/TfxBd79MpYExS
         CvxZC52mDkx6gzMsJp9+TnhNWfdyDR4xzu5DuLm8RhIhb6o8YOMY1kA6xoIQmjzaOEDV
         ObEG2LImLySo/nLHotcyDpaW+BhRVz9AQ0yxrQX9MS2lFHC8jxx5LrZU5/FO0UtmsItg
         bD682z8/sHCuAHbf5RQlAWrSu1oZLGSSPkQikcuOx3/KM2nfSq2pcqahsD5VTOXRmO44
         iIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785541; x=1788390341;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pHiSvQXl4tkWm+SikbwEM4QvcPfHzRPC0s7Gep7aVew=;
        b=Gdmup+0PC+wYjqx+K8+fEhtGwE+7MRq2D9DDimErLeILCEN7jYl1ewv8OMZq8JWdau
         AucUrZnyMXgfcxrQfvyFl5qx80Ro8I/ekFHCal07S4VlipTSzU9aQqCighpHVrVQMeVd
         LWvBemfDFyWH7rU7bY1fZvq9Tlew8wloZRH+CbO9OdaZGWjeTAnP+Rk39380WgxNJy0j
         G0qcyrKuPkaYT3AautnAKDQQLoCPPf7ir4OqrhWmf2JPnYfOkPkB+wwppDIMdjHlgOme
         U1+AX3sEWeDagPiVnWs2KZN/9BSzkje3kWyhb/RWmtY1O8GVFxl2pXebDX8f+qAb6J0P
         C6QA==
X-Forwarded-Encrypted: i=1; AHgh+Rqq6MnKACJkpcQ5p7uMJEh+JkTz4OIXWdo1T3sp5hlCWunUOnEHoj3UuDxeFFAqxMl3AL3ONT+oMFM=@lists.infradead.org
X-Gm-Message-State: AFuF++n3b7D7q+rzbz6t7ZODLqwY5WTT29HjMHaw+TcsxAv+InN9ENSO
	j7inKHihQr1QL+Ufg4FxmlJqvgwKM9pViNPbn5isv0YV/Pimy8WK9upwTGLNY+ihVxYR6yfaWr6
	v1VbOrg==
X-Received: from pfbcb3.prod.google.com ([2002:a05:6a00:4303:b0:847:aa6c:47fc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b53:b0:851:8baf:5b26
 with SMTP id d2e1a72fcca58-853749a5e4emr17924734b3a.14.1787785540289; Wed, 26
 Aug 2026 16:05:40 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:05:11 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-21-seanjc@google.com>
Subject: [PATCH 20/20] KVM: selftests: Add arch hook to force page tables to
 be naturally aligned
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
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Ritesh Harjani <ritesh.list@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_160542_076116_1901C66A 
X-CRM114-Status: GOOD (  10.81  )
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

Add an arch hook to communicate to the core physical page allocator that
page table allocations need to be naturally aligned.  The hook will be used
for upcoming PowerPC support, which has MMU tables that are larger than the
guest base page size and need to be naturally aligned.

Bury the hook in the physical page allocator to avoid having to plumb a
rarely used param into the main APIs.

Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 2 ++
 tools/testing/selftests/kvm/lib/kvm_util.c     | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 1264cd1a343a..ffd4cf740d7f 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -1050,6 +1050,8 @@ void kvm_gsi_routing_write(struct kvm_vm *vm, struct kvm_irq_routing *routing);
 
 const char *exit_reason_str(unsigned int exit_reason);
 
+bool kvm_arch_needs_naturally_aligned_page_tables(void);
+
 gpa_t ____vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 			     u32 memslot, bool protected, bool naturally_aligned);
 gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 8b5b330a5889..57b653fbd0b1 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -2085,10 +2085,16 @@ gpa_t ____vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 	__builtin_unreachable();
 }
 
+__weak bool kvm_arch_needs_naturally_aligned_page_tables(void)
+{
+	return false;
+}
+
 gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 			   enum kvm_mem_region_type type, bool protected)
 {
 	struct userspace_mem_region *region = vm_get_mem_region(vm, type);
+	bool naturally_aligned = false;
 	gpa_t min_gpa;
 
 	TEST_ASSERT(region, "No region for type '%u', memslot '%u'",
@@ -2110,6 +2116,7 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 		break;
 	case MEM_REGION_PT:
 		min_gpa = KVM_GUEST_PAGE_TABLE_MIN_PADDR;
+		naturally_aligned = kvm_arch_needs_naturally_aligned_page_tables();
 		break;
 	case MEM_REGION_TEST_EXTRA:
 		min_gpa = region->region.guest_phys_addr;
@@ -2120,7 +2127,7 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 	}
 
 	return ____vm_phy_pages_alloc(vm, nr_pages, min_gpa, vm->memslots[type],
-				      protected, false);
+				      protected, naturally_aligned);
 }
 
 /*
-- 
2.55.0.887.g758fc8c411-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
