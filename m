Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57ED4C61DD6
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 16:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N7Uc888M1nV6Z6GX9V1umbSgxLo+1PCykgzUsYhTS0A=; b=PuETczXdlTR5rp
	/Qw4WQL/nrl2abFQKR2WLY1+BhlPlfsqRMlpcZhgBi6TiGjAqFvzB1jVoS3C50fq/JtQdQu9Fi2eQ
	Deoytb07tTsK+HajRzhZPnJUzyipqlftLxN331SLAScvr+4+O51OA12XUGVGSfKnqddvnsiL1ngA9
	c5uuA7hQG2Y0DQwcDhmeCUV9dS0vKcGzd3DBloYNjOpgFBuEBNBB3JxqCTz8CFNP02fMR7Jx7AaPe
	epd+V8dyiks36daYim4dJfcdikB/LmMOJ8pXNFB4b53kMJoDi3RptaaMcU+1rMhx/Q2OaIxKDWsp7
	3R0gUIzTlfA3bWljU5yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o2L-0000000FFRw-2RrZ;
	Wed, 02 Sep 2026 16:42:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o21-0000000FEfn-3Oh6
	for kvm-riscv@bombadil.infradead.org;
	Wed, 02 Sep 2026 16:41:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=F6KFth+wmNcPY6G4yAkPxQ/KQlcOGwTTAk9RODAHfTs=; b=CuQrP5ErelAirN84YDegFVHID2
	9CoTzmhkh1zAH9/tASLhsaEk3G5QbrLtZ/0ZmPT4zraVFnYKVlgrWTBtPLRLsnUK9cBVyISym/iL2
	jOgdInkoCNT10XRObqhPmz85hmAAMXLermJLxmeDWMEbi0Xq66PvnYQZFE2pElAb0axwc/cCZhts6
	0Kr39LNf4Ig02YkdMPQu04fUQlPW/fp7ZcWOo25irrGmO9uOs1OTzmWtsIYzwAikr6cqqn8z9/Vcf
	c32knIYYyrc5xuKH589WSetuN6ChY20PCg0uZLqEkWpoGg5ICgcmcx+6aMzuE3+r+yNqZpP3Om/0O
	sjgTlS6Q==;
Received: from mail-pf1-x448.google.com ([2607:f8b0:4864:20::448])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1o1y-0000000CD8n-1cTQ
	for kvm-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:48 +0000
Received: by mail-pf1-x448.google.com with SMTP id d2e1a72fcca58-85f3a39f3beso1298264b3a.0
        for <kvm-riscv@lists.infradead.org>; Wed, 02 Sep 2026 09:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367303; x=1788972103; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F6KFth+wmNcPY6G4yAkPxQ/KQlcOGwTTAk9RODAHfTs=;
        b=TQI2ci+W6wYiWn7+qNKpeQ5PxVHe8tL91Ac20/V6h7SY32xdF3QEOnLQxN72k0khXF
         LQSbvO3MyMwgDrbTnQa52yDQDOBpZhMYPLy+xSMRuY8r/PEJvD5vG08+CjVzW6POXBvP
         NBZtRUrgUv8PNFFvK7uV08z0FV9uTXy33xrp+se+3+Bi7WkMpyI/2Fv7WUs9w8mmYYfC
         Mnhd24xRPXZw5SI+kqoWb40QLhLiSEBbS/5YAVtiOZbHFsoBTpODzZy6ToAQI7Hl12kW
         //bBI/rFWetiEk3O5gzfYGOiaZmR+B+CDW8A3lZ6bwA7qsDbff2TWJpj8wKjOJ/c2+qt
         Jjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367303; x=1788972103;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F6KFth+wmNcPY6G4yAkPxQ/KQlcOGwTTAk9RODAHfTs=;
        b=HjN+d3nB2iQd3lHgIEbXNmCz7hTUw4iUJUGgbHQpDhaX0XpL7x+MkpDbcsiEHTZwt9
         CAeiP3R9TudbULOzU+Ubb5UY6beBy7RhqfCFW9Xqv0vGOjmqJau+BSLLlfJ4/ZsiuLFc
         d8Pgz+jl0z16vTKX7ZnM4mN0hcxP4eQCqGwDUyXDDUT1Acm06VZtwVrMuhHg4eAqcAFi
         YM6Wy/hm0BPelXDdqhAVYpwuBq3R7/dRCLweCmlaZyrtTooq/p0JHdBbBFHnbDQhg94i
         ntHaWEafdKtp5Cr5+68kLAV+df3S1fL6ZAxDbapSfaPcYCQiKCxcUo6XUHz16BCk2DzG
         siOg==
X-Forwarded-Encrypted: i=1; AKwUvByd5UZygX+SACxKvudyRuX+OdhDtalsjHpsgDDWtd2ql7CIgaJgHsraadNnzIpbPUKS0uiPnoQYN+c=@lists.infradead.org
X-Gm-Message-State: AFuF++ne9B2YCD5jGT++wFovuafUOqMoXsed7s1irr+UeYZsz3W4wdNH
	rRmpwVVmC2Rdigx5J4gWIN2a9I8yGp0XZMakj4MGy4byTHtyvtMjKQx3y7GIRp04WuH3huM27FU
	b08EOMw==
X-Received: from pfux9.prod.google.com ([2002:a05:6a00:bc9:b0:847:82b3:aca])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9295:b0:837:e9cc:d474
 with SMTP id d2e1a72fcca58-85ed1d07a02mr8719333b3a.2.1788367302673; Wed, 02
 Sep 2026 09:41:42 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:18 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-16-seanjc@google.com>
Subject: [PATCH v2 15/20] KVM: selftests: Use TEST_EXTRA region in x86's
 smaller MAXPHYADDR test
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
X-CRM114-CacheID: sfid-20260902_174146_789323_B45FFAFB 
X-CRM114-Status: UNSURE (   9.67  )
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

Use the TEST_EXTRA region/memslot for x86's smaller MAXPHYADDR test instead
of a custom memslot, so that the primary vm_phy_pages_alloc() APIs can be
reworked to take a region type instead of a raw memslot.

For all intents and purposes, no functional change intended, as
vm_add_extra_mem_region() is barely more than a wrapper for
vm_userspace_mem_region_add().

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c  | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c b/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
index 3dca85e95478..b21798a385ca 100644
--- a/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
+++ b/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
@@ -62,9 +62,10 @@ int main(int argc, char *argv[])
 	TEST_ASSERT(rc, "KVM_CAP_EXIT_ON_EMULATION_FAILURE is unavailable");
 	vm_enable_cap(vm, KVM_CAP_EXIT_ON_EMULATION_FAILURE, 1);
 
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
-				    MEM_REGION_GPA, MEM_REGION_SLOT,
-				    MEM_REGION_SIZE / PAGE_SIZE, 0);
+	vm_override_mem_region(vm, MEM_REGION_TEST_EXTRA, VM_MEM_SRC_ANONYMOUS,
+			       MEM_REGION_GPA, MEM_REGION_SLOT,
+			       MEM_REGION_SIZE / PAGE_SIZE);
+
 	gpa = vm_phy_pages_alloc(vm, MEM_REGION_SIZE / PAGE_SIZE,
 				 MEM_REGION_GPA, MEM_REGION_SLOT);
 	TEST_ASSERT(gpa == MEM_REGION_GPA, "Failed vm_phy_pages_alloc");
-- 
2.55.0.966.g6673acef38-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
