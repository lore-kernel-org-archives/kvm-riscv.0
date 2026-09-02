Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBF1C624D6
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 16:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dFthLTKBlgxvIf4ivKrAvztOPNZx82MLFATwyzpaIFw=; b=lP1kPikWH182HL
	QXXu2YRoNE+X/0r0cVGyXExMqYHM2oh675GUyM1yhbmlKeobgG77R0Qpms3SqWUKLr1+qchMmfkLi
	PTEB/zOKsvZHm+cNIOUDkUYuBGGuD/41sBA7KBo8D/pZqs/HGB7qW4LeXAohEheZPxYrtVrkZ395h
	bsZPPvlVeVHKyYkuvhK1E/ERoqjuGB/wK4xKrzYg2j2XrUedlpZ6hpxsrfnx6rLpmjPYDX+9KbTvp
	Xkx4cJiQlduyIZ9O7uq0yM0WXAESWhabK9vUBbcBWRwNUc+lD7fGK1AJYJy0HzCCVd3Vbwu1qtY8y
	7JI3qoQWL66CEwoznJWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o2C-0000000FF3P-18g0;
	Wed, 02 Sep 2026 16:42:00 +0000
Received: from mail-pf1-x447.google.com ([2607:f8b0:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1r-0000000FEOE-24Aa
	for kvm-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:42 +0000
Received: by mail-pf1-x447.google.com with SMTP id d2e1a72fcca58-84e4ef486c7so41381b3a.1
        for <kvm-riscv@lists.infradead.org>; Wed, 02 Sep 2026 09:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367299; x=1788972099; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OWxwiZu3iI1BKMOXY9Ac60kPARcqOSTNs6vsc+7jhyU=;
        b=kIDk7UYo3Q4F4pfzkStLfrVorKAMUMqOirYHpIF0KxfUlHWP/zC8NWWhJYZTqP7yhB
         vn0sxqP7vQWa1E07inXQZXtyjIlaWjOLw4q0ZrdDioIMNrLgFB3kCJ0sVS2M5QB2eQMJ
         0a/XeFGe5G+VE/0lGgkuxSXb9eDbaXAo/o5g9TBFbxBDeve8AakgWFcxiblNYigvMJPf
         ffoVhoN1vDaj2gfSQ+T1GB3FjfDYSCPZi7vNQLRbI87Uc4tGlUXB8YKDo1bmWk+PJxR4
         SLIEEmfKY00h9Nj8Bodwl2uYYU5rwAw/92K5w6mNI59mTIEXmXZ0POIDLXHdsbcgMA8j
         oNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367299; x=1788972099;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OWxwiZu3iI1BKMOXY9Ac60kPARcqOSTNs6vsc+7jhyU=;
        b=XcP1MAA5COKPWtJ06OKRIGwxY8CkLKtCWY7VdeO/1Cl/kuqAaT2havtM/SaIKAOtA5
         K5Xl2qnreT3qYM02VFyDtSNhYy314EqdjBbSW/NOMVEnO6t66mmT7Qa8xKhA8E3lWDoN
         ZpB4d2J3kvoOaObHofA9OrJ9HFW3REswuqBIcv3hNmEpPQYsYyFXV+RRKCJgyE9UFyJy
         4KxDDX41qWUig9VhTgS9g1bLr6/+SJCZrumf4teEPqumK8iC6lVQTs8bW6p+b8bvP6N+
         bFGxtcVWJcZy9srJuHtFwMVnr47pSoddaATLQDIUOKsKhCWMZWltA6q90rLC0uOR6WBB
         NuTw==
X-Forwarded-Encrypted: i=1; AKwUvBydVp/u5O3sQYmj+Zv/7OnvMmfMiO1ziponEt/5ItV/lypDV2V2nvrMCIk0Ort+QyuSvwYl4oezjTk=@lists.infradead.org
X-Gm-Message-State: AFuF++lFvSf006MAzpnrhUP8KJQvxNiOnrSeNjC9olsx7zYEcnwxjuE4
	tlkrh926ktI2NYIUZ0utgaX1BNKNx68LM9uAjjy2K1RW4l6qNXVxwtQD6Ei1vq9w+k1XFZT5TTu
	DMshu2g==
X-Received: from pfbbm14.prod.google.com ([2002:a05:6a00:320e:b0:84c:2e88:693d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3d55:b0:84e:cd14:aeba
 with SMTP id d2e1a72fcca58-85ffbe960f2mr374778b3a.6.1788367298091; Wed, 02
 Sep 2026 09:41:38 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:14 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-12-seanjc@google.com>
Subject: [PATCH v2 11/20] KVM: selftests: Initialize vm->memslots[] with
 invalid memslots during creation
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
X-CRM114-CacheID: sfid-20260902_094139_580305_3AAED0FA 
X-CRM114-Status: GOOD (  13.60  )
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

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h  | 2 ++
 tools/testing/selftests/kvm/lib/kvm_util.c      | 5 +++++
 tools/testing/selftests/kvm/lib/x86/processor.c | 5 ++++-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index c56f342b16fd..304ef6af3268 100644
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
2.55.0.966.g6673acef38-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
