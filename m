Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2E9C624DA
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 16:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTsERT+NQeYnprFTt3FQ0jpMAXKoQxsOdHgGPoh0rtU=; b=lEPlp7BWfEv9yn
	Z/i9ZYTv7UX1vlZ6ZdP9gChM/kawLnvKs94AJZuHR5Gp2l4NUUrq2sTy4P4w+pwXNJ96afTV0CxBo
	biFkpYWOsKGAlVh4nlNXZan8qmmvbc8bWnGvh2aTzh1ozVi4cnIJ+Yoi+5koEtENB/O4QCqKQjBzT
	vC6WdaUb9W4nCUUBH+9BYCr18kO+5uSXjDyQ8IYM92V7uAHkQKLYHwDIwpk90q5hPNvIeaiYkQoZ2
	SpuZSFy1gVdiAzD3rHIZo7t5SRwWxeko1K+zwLPzBojxk4ZYIkiGHR4LxLbDANps1y7X/FEeWVI1q
	nzC8I4KZCe7I77sNl3oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o21-0000000FEhS-1ia1;
	Wed, 02 Sep 2026 16:41:49 +0000
Received: from mail-pf1-x446.google.com ([2607:f8b0:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1p-0000000FEHM-1mUQ
	for kvm-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:39 +0000
Received: by mail-pf1-x446.google.com with SMTP id d2e1a72fcca58-851992f22ccso976007b3a.2
        for <kvm-riscv@lists.infradead.org>; Wed, 02 Sep 2026 09:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367296; x=1788972096; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wcKMUlmJ0lq2oBOCUrCto8mVZjPEk4eBpEgiK6nEFRg=;
        b=em5rSUvRvwwfoJkzPx88faHU/CG9fhOvDjhO7YbhLtZSiI2Yz6DYeVejfR7S82Pzg7
         Ex2t7/ZvxbfOx4hPGODlSIZPp8go1CKZSnyj1PaffTUuFdOKVwg03msMmjxvQo634i97
         QLQnB7SJBTnwpbzo5lG6+8dPHGbe9j9rlQPbgaJ+4hybPCrGhmsex6IuVOeH9vnPXN2p
         W5rI7bT6YZ9zQBZcPnPOEFTCZ1HoLUzWazacmsQQT+/r5lCmZLXNU+s/vBTkWg5vRMuY
         B9cqEvrkFIbMpwEV9a37+WmQpx17ngwNhyWgdfXOyoub5gmD00cbrfik570IH4Du6a7L
         6woA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367296; x=1788972096;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wcKMUlmJ0lq2oBOCUrCto8mVZjPEk4eBpEgiK6nEFRg=;
        b=h1fbO6yhvmJI8VSE7lVpIJ7CPQ4I1uSBJA/IRVpcsY5Klhbd2OGfJNnsItI52khmcK
         GvFN4TAHvCAaPUAGRCHenIt01cVGXBMTrGyFLLy3m6yfUEQ7a+s4tBB0viIX2BlrDi9X
         9IBTt2jevY+0C+XcJ9TLmah6h4Blj/ZZry9A6+ZY2mVQWGhyzyzw0cdn7DYkISoB+U5H
         X/DVvZZPkCKpFkYxBjnjPSXJk/nFGNhNlJAViEngDjYBY5jm0s9xpYnXcGLIY/6C9Izu
         iMa0Ld0js29itvIVk4pI5ujCZ2Yv5rGhRX9hI7/uyKW0UA2WK3X+5zgflIL+un5/OZpc
         7rUA==
X-Forwarded-Encrypted: i=1; AKwUvByeBOs/KVisnPHGJFcy8dhyiEyK8O473CxJPU1+5maNbD9GljZSEtIyO7ySJSLWM5mxnxo81YMmcvs=@lists.infradead.org
X-Gm-Message-State: AFuF++lZEVBm9g5/5+pi7rT+yzihe7+FiYO14EXAlanaFph64kuIix0u
	dGup+2HCjKPThekr5Bb9WYJipxu3O0XDnQH3ZRtKo2M1oQjWYO3VGF79/IHGMRVfFg2iLxuEyZ6
	8eRxPPQ==
X-Received: from pfbeb17.prod.google.com ([2002:a05:6a00:4c91:b0:847:87ec:2a9f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:997:b0:84e:f90e:492f
 with SMTP id d2e1a72fcca58-85ed25e06efmr8429625b3a.7.1788367295680; Wed, 02
 Sep 2026 09:41:35 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:12 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-10-seanjc@google.com>
Subject: [PATCH v2 09/20] KVM: selftests: Use the innermost page allocator API
 in s390's IRQ routing test
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
X-CRM114-CacheID: sfid-20260902_094137_567795_74D9B413 
X-CRM114-Status: GOOD (  10.86  )
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

Use the quad-underscores page allocator in s390's IRQ routing test in
anticipation of dropping the @min_gpa param from the primary APIs.

Note, it's not entirely clear that the test *needs* to use a very magical
@min_gpa, i.e. it's possible a more elegant solution exists.  But that's a
problem for a different day.

No functional change intended.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/s390/irq_routing.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/s390/irq_routing.c b/tools/testing/selftests/kvm/s390/irq_routing.c
index f3839284ac08..cd26cc1aed80 100644
--- a/tools/testing/selftests/kvm/s390/irq_routing.c
+++ b/tools/testing/selftests/kvm/s390/irq_routing.c
@@ -36,7 +36,7 @@ static void test(void)
 	};
 
 	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
-	mem = vm_phy_pages_alloc(vm, 2, 4096 * 42, 0);
+	mem = ____vm_phy_pages_alloc(vm, 2, 4096 * 42, 0, false, false);
 
 	routing = kvm_gsi_routing_create();
 	routing->nr = 1;
-- 
2.55.0.966.g6673acef38-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
