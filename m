Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E80C5DF97
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 23:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UlmbAxp9qQtYC7QTfJ2f20iBVafgh4hyCVG+Epx2yZg=; b=Lzblw9jseTFvkj
	i4nDRR9oSTWTpUXkXiZ/LsRPV5Dq3v7YTCmMAe1SAy6fbBuJpZiRjxPjxBx4wN11lBGIXzMYmv2yf
	70bnIrnM8osPXFFZdgj/uTfZra3KLp+OR3Clue6baLTWkI11lBo+X3SNgN6+azhhWfmzQlI+PMggc
	9f//nEBoU2KU0OXqpKsN9oF97P2LR6fR+yoZyDF1iiNJLgCM5J1QvkeuBA9Dt06jw4vwFgn1RE0QN
	RwKFNr3rBw3g/Pp0Ryq9NeRjGrCkGvVf6C0kTxe1Y/7S7mv5JfapVeRDeC1Vv0gjPUOJ5lkLLS33R
	ag3DUzP/bct1aNCwMGfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMhH-000000037UD-0jXJ;
	Wed, 26 Aug 2026 23:06:19 +0000
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgV-000000036HB-1ttj
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 23:05:34 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-cb48f41343aso302193a12.1
        for <kvm-riscv@lists.infradead.org>; Wed, 26 Aug 2026 16:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785530; x=1788390330; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N89bCfABJreQrIt289fAG+G+a6K8qwfLKTGSVLeSHrg=;
        b=g3BwB12bGIUqjIreCkj8IZhWQMpfqL0SI9qJMgA8RMdZuce2g6Y6GPXg7kptULIBTa
         7MyepbM23VvsTNA1jcOxnB/s8XuR2ibpuV+zaeLOcmRZRmDqlfwSey2Frn2Cqi4pa6I+
         xbwU/KT8hhDeExpliZU5xaNIBJXgSD4jEzkwnWFK4KdW98Pv9wrFpd1SEQtsqGB6SxWi
         Cj6o5FxX1MtEBJi5uJcixi49gXwC/hLe+ptTlc+oFwWkmk4HguerVuaftmRuuE99LvCM
         AfnBpQ5q+6W5NSVD46A2Y/DKzN3zcHMPeeBZjNK8Y1fG883LUdbucPfHqXCZ0WwbIY8V
         WVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785530; x=1788390330;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N89bCfABJreQrIt289fAG+G+a6K8qwfLKTGSVLeSHrg=;
        b=RYH4Dq8FmTd3Ac0UimsRY5Mw3z7MI2I2FHvCWhkzVOSIfAcqBwDoRL0Yznn6djL04k
         ctMWHGsFDZMbr1t2ZG7YXU/KsG6d0YiVu7LpMfrptrBHMVZLIA++QtEqY0acS/PoOqKV
         hTHk7YgtY//6q/afV+8x0Ph5PpVJdDJk0+auPjulGS3lobi4YlejgCYjJOlhh80IVC0P
         SMA2taAZW7EJT7R2zsux9MNGz5m1ok1nvmHtESmFHy2b7ga0xlfiHE0HekA+c9SoUflJ
         iWdHAYp+c8EODRmz/7+ib5dK+pQb74KCOC6cbmPKNDhnk4CaXCB4piPbTCK1fQlJLX5V
         /IeQ==
X-Forwarded-Encrypted: i=1; AHgh+RqfwHuR9RwZSe6phx+bkNkJ2Ki/dDXH5D0dcKiKfGEHm94wxLHZsa16peoPSzhwOqt5mlN7FZkkaS4=@lists.infradead.org
X-Gm-Message-State: AFuF++mk7KHT+9rJYuww23XpAWLNQomcciiuUh8VaXZOxlyvUchooufd
	UnYKCgEvs2AHCpvJ5Wqx8qZREqaApwCx8FeQ2MqA3TqnKHm/SyfQES9g5hH1nPknlP49pskPaCZ
	U5hsyWw==
X-Received: from pgkj19.prod.google.com ([2002:a63:e753:0:b0:cc1:517a:d29])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4388:b0:3b2:8674:9830
 with SMTP id adf61e73a8af0-3d0f6d2abaemr2865141637.14.1787785529701; Wed, 26
 Aug 2026 16:05:29 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:05:02 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-12-seanjc@google.com>
Subject: [PATCH 11/20] KVM: selftests: Initialize vm->memslots[] with invalid
 memslots during creation
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
X-CRM114-CacheID: sfid-20260826_160531_594478_FF16D7CB 
X-CRM114-Status: GOOD (  12.75  )
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

Initialize vm->memslots[] with an invalid memslots value during very
initial VM creation so that failure to configure the core memory regions
generates an immediate assert instead of potential weirdness, e.g. if slot0
is coincidentally valid.  This will also allow hardening the region APIs to
guard overriding a region's memslot multiple times.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h  | 2 ++
 tools/testing/selftests/kvm/lib/kvm_util.c      | 5 +++++
 tools/testing/selftests/kvm/lib/x86/processor.c | 5 ++++-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 21354434de0a..70e77992dd2f 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -33,6 +33,8 @@
 
 #define NSEC_PER_SEC 1000000000L
 
+#define KVM_INVALID_MEMSLOT UINT_MAX
+
 struct userspace_mem_region {
 	struct kvm_userspace_memory_region2 region;
 	struct sparsebit *unused_phy_pages;
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index ce0d8fba4624..56df5b1d9c79 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -288,6 +288,7 @@ __weak void vm_populate_gva_bitmap(struct kvm_vm *vm)
 struct kvm_vm *____vm_create(struct vm_shape shape)
 {
 	struct kvm_vm *vm;
+	int i;
 
 	vm = calloc(1, sizeof(*vm));
 	TEST_ASSERT(vm != NULL, "Insufficient Memory");
@@ -296,6 +297,8 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
 	vm->regions.gpa_tree = RB_ROOT;
 	vm->regions.hva_tree = RB_ROOT;
 	hash_init(vm->regions.slot_hash);
+	for (i = 0; i < NR_MEM_REGIONS; i++)
+		vm->memslots[i] = KVM_INVALID_MEMSLOT;
 
 	vm->mode = shape.mode;
 	vm->type = shape.type;
@@ -1190,6 +1193,8 @@ memslot2region(struct kvm_vm *vm, u32 memslot)
 {
 	struct userspace_mem_region *region;
 
+	TEST_ASSERT(memslot != KVM_INVALID_MEMSLOT, "vm->memslots[] unpopulated?");
+
 	hash_for_each_possible(vm->regions.slot_hash, region, slot_node,
 			       memslot)
 		if (region->region.slot == memslot)
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index d31fa81ea075..ea5fa59888af 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -529,7 +529,10 @@ void tdp_identity_map_default_memslots(struct kvm_vm *vm)
 
 	/* Only memslot 0 is mapped here, ensure it's the only one being used */
 	for (s = 0; s < NR_MEM_REGIONS; s++)
-		TEST_ASSERT_EQ(vm->memslots[s], 0);
+		TEST_ASSERT(!vm->memslots[s] ||
+			    vm->memslots[s] == KVM_INVALID_MEMSLOT,
+			    "Unhandled memslot '%u' for type '%u'",
+			    vm->memslots[s], s);
 
 	i = (region->region.guest_phys_addr >> vm->page_shift) - 1;
 	last = i + (region->region.memory_size >> vm->page_shift);
-- 
2.55.0.887.g758fc8c411-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
