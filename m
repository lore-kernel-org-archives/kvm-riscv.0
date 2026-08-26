Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F0CC61DBE
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 23:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qvoadXJyXCGcGt5MazFGu+Dp8KMlIXUQ/iAkRyOnJ/8=; b=S6ai3jB5ZyVguS
	d/EMt67XMh6m9P2k1fP/36wqlZWxfQyLxblK9kCMj8jGsw3gj5KisH7mY6Ria1iZWYjisvqeb/yyH
	Pz8hfOGbn6nSofM+ydB2Ver4NLXfxE/Yzgyi8IZSLczKz3r86Nu4OJAV/v+veUC2NHDmVjecQdUqH
	rziGrbQK12yTSwKVltyEhBfyN8tCJpOQcEbeXsBon7XIhTWn0sthpMfVyFZbP/aB9rVezfZKm3cqY
	8RrY3ETzQitpaxjko5q2fUdJ3BVmE2CqDcCjrulbHj3xE+pohKDt/z123deQYkKiWBo8ESSa1I6mt
	DsTrzADhdVX/An0BPL0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgn-000000036hW-1jBu;
	Wed, 26 Aug 2026 23:05:49 +0000
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgO-0000000369G-1uDG
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 23:05:25 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so1899438a12.1
        for <kvm-riscv@lists.infradead.org>; Wed, 26 Aug 2026 16:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785523; x=1788390323; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ypnv5ADnidmiHmk4i8NjwAmXQS3vAgk870JArYSva+A=;
        b=bxwmYPWAuY2oPvf1g5r3hQO4QnTRH3xxkCpUZOmrxzgS3ylQFHUQD39FG7DH7MXSYm
         mVcF2PLjaNJjPM+BHPiAw1wK0BBptEZIZgaMCyFaYMzydd1hjURGbPC81GJPN3cBXNPO
         2mKYXk1AoHqBV82D5GeLOTl3YC36TvVe1Um4U6VWcgbl9mdraCdjQN5HG/9qWW5RlleW
         otV6Hum6iYYveQXzW6RJJWJSseOGRsRGf8J8tKpD7SRr4SUAhUGry+xMuvPedR3ir4U8
         KEn436dzAQVYc41oao6HyE7IPhPqvyBhaH14wtGAdkGREsVi4GIPIJK+TCoQExPUQPbr
         QLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785523; x=1788390323;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ypnv5ADnidmiHmk4i8NjwAmXQS3vAgk870JArYSva+A=;
        b=PNPxvINY1CcWqvz0qo/AktftviyAviluzpVvhTAA1GnMvhMu+0zelb5aKECnk94+n/
         HHy2RqoSKK1PrWWiBxsnNOsBSkGSkqxsxutBOt7Y2BA5nlP6+wiqKD+Xfm23ohV3I1Tx
         fCI9hl0DU0BezsHvZtp9NZOyRRUvoWtdrgDL4OV6UoBMHExeZr5YO5JNFwOjD7qolXZH
         BA4Prrf+AYDnmoCsOLIV8KgAcu7nb9+o3oNKEdTlsotUBv+8BLKyNWaG0lQJtUCHpLRI
         IqXNXaih0ojipor1rqTL25g0pMntRkUBB7rPN4h5a7zRya3Yefc+uValeHdLV1w7+r9g
         2WQw==
X-Forwarded-Encrypted: i=1; AHgh+RrIbinYs3C8JmeOznAe+gIIlZf0Zqz/UIh35AU8Zr3byn18m5DjonSPCk3sQuB5DTWFoNmO/jYfcnE=@lists.infradead.org
X-Gm-Message-State: AFuF++k+9hMKy943FT2rIwEZcfjZDYcVQNQ2NO+fpUU7FxFobPdy+YXG
	vFt9J4CTabPYAnadQXMMkrs3S5fWigd5X2G/iaQm043Pq/otDY2pRAA6/wMWZylPJinP/Dsct57
	kKrgK0g==
X-Received: from pghz21.prod.google.com ([2002:a63:e115:0:b0:cbe:ddc9:c670])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a110:b0:3c3:33df:4d9a
 with SMTP id adf61e73a8af0-3cf7596a65cmr18790428637.1.1787785522980; Wed, 26
 Aug 2026 16:05:22 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:04:57 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-7-seanjc@google.com>
Subject: [PATCH 06/20] KVM: selftests: Extend page allocator to support
 naturally aligned allocations
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
X-CRM114-CacheID: sfid-20260826_160524_540657_6F7B1661 
X-CRM114-Status: GOOD (  10.28  )
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

Extend the page allocator to support naturally aligned allocations, as some
flavors of PowerPC page tables require multiple guest pages per table, and
those tables need to be naturally aligned.

Take care to align the potential base address *inside* the retry loop, i.e.
the base needs to be (re)aligned on every attempt.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h |  2 ++
 tools/testing/selftests/kvm/lib/kvm_util.c     | 13 +++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index b1c5597b1def..96c8251c224a 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -991,6 +991,8 @@ void kvm_gsi_routing_write(struct kvm_vm *vm, struct kvm_irq_routing *routing);
 const char *exit_reason_str(unsigned int exit_reason);
 
 gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa, u32 memslot);
+gpa_t ____vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
+			     u32 memslot, bool protected, bool naturally_aligned);
 gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 			   u32 memslot, bool protected);
 gpa_t vm_alloc_page_table(struct kvm_vm *vm);
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index bbf6d7684c0c..896da440659e 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -17,6 +17,7 @@
 #include <sys/stat.h>
 #include <time.h>
 #include <unistd.h>
+#include <linux/align.h>
 #include <linux/kernel.h>
 
 #define KVM_UTIL_MIN_PFN	2
@@ -2032,9 +2033,10 @@ const char *exit_reason_str(unsigned int exit_reason)
  *
  * Note, success is guaranteed!
  */
-gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
-			   u32 memslot, bool protected)
+gpa_t ____vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
+			     u32 memslot, bool protected, bool naturally_aligned)
 {
+	size_t alignment = naturally_aligned ? nr_pages : 1;
 	struct userspace_mem_region *region;
 	sparsebit_idx_t pg, base;
 
@@ -2051,6 +2053,7 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 
 	base = min_gpa >> vm->page_shift;
 again:
+	base = ALIGN(base, alignment);
 	for (pg = base; pg < base + nr_pages; ++pg) {
 		if (!sparsebit_is_set(region->unused_phy_pages, pg)) {
 			base = sparsebit_next_set(region->unused_phy_pages, pg);
@@ -2077,6 +2080,12 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 	__builtin_unreachable();
 }
 
+gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
+			   u32 memslot, bool protected)
+{
+	return ____vm_phy_pages_alloc(vm, nr_pages, min_gpa, memslot, protected, false);
+}
+
 gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa, u32 memslot)
 {
 	return vm_phy_pages_alloc(vm, 1, min_gpa, memslot);
-- 
2.55.0.887.g758fc8c411-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
