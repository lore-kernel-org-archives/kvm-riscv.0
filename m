Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4754C624D6
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 16:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7/yR2g1Y+uJh+0pxyHw3/eoXuz5rI2uScNqwjd59fn4=; b=TK76KZhH1kNo/J
	gkvLBmtzmv6qgFm0RVImo6NjSff4kDxRy19UcQ5uVglcoNdvGuc88KEyry9RIFlWPvIdC8xxe2Alb
	S+LkwB7VgDBHidnrZJD4FvBfa/sss27LeZRgKI6Ez6mqbPAkKZQAw4TIn7q+5SaEbqjudog2gvHZK
	ORFcY+cKeYljtme5lrBX7uOqPgUEcAMPWrnLnRgeTCLHGjbemGHdGJitxXJxGAWteUhs6k3iY4BhR
	Gb7g50PHaarrvyZ29uydlhZSuSEykE3AXyolFv1ygu08L4iglGOy5Ue10ki5MVbt7lfOWe3Hd5IB3
	Dk2hofrgSa63mu9aiQDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o20-0000000FEfr-3RoL;
	Wed, 02 Sep 2026 16:41:48 +0000
Received: from mail-pl1-x646.google.com ([2607:f8b0:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1p-0000000FEEE-06Zk
	for kvm-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:39 +0000
Received: by mail-pl1-x646.google.com with SMTP id d9443c01a7336-2cf1c86963bso542795ad.0
        for <kvm-riscv@lists.infradead.org>; Wed, 02 Sep 2026 09:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367295; x=1788972095; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gLFvTuC7gXbjk/rOLKK/p7bC02ttHAq/6LyCTsnQIyk=;
        b=Li+FwmLKfEV8wrUAr2yqI9bFEDReDvApqZ6Nn0EbE8XOOHFVZj0e63A8mEHfOPYYIU
         YZzQXsQU4yG65zXACyT4gVYjXetdi2dIljFGCsx4U5U5P7tJP8fDqD5gC8t4ANib0XsG
         EcJTdwVxZRw8pmUTdD+0G/BNvaGujmPu7j+vlUPVZcpeZHiFsmkJImJgEw8Qx6vg42sz
         39fIiSxOWTsri8YRcrDYQTkkwYx7AiU790Lds+eQWtGaV/dGUkDApYVKBex8dMFGj1Ab
         8cB7Tp+e/xXeBUrt5l5CaCCrLiWv0UclD8LCeoW7kCqFNYOalvwD7VOPdZKC1xoPFRNX
         tp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367295; x=1788972095;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gLFvTuC7gXbjk/rOLKK/p7bC02ttHAq/6LyCTsnQIyk=;
        b=ReyomoERp5TIGfarwZynwJ4+eYUb6seFGsM21O9Fa4tS2jbEwk53C6ygBaZHQJ+S1/
         D65//mHwskHDuxnsbeBevim53PzOipKBMxQBHb5l9vCziKebofptSGqfv/0uWPqUlg2i
         pgK4CAadoh6n3rJwJI6AsTvcq7XLXLYKq67cDYEV8gSMLZASUsD9Ztw77pQm4GfRB8pq
         pIECdcbg1t3oWdbCofj7268NHx8f2en9I6FF/zSqsQB+Xe4s1VKyaZf4wJP/OhzaUu+k
         KrCD4SZykDw47zwXRjtau8hY+S7dCuRmVEdAO1A5uLD6KkAX6GU01iiPb7jhr/PzUE3S
         4Stw==
X-Forwarded-Encrypted: i=1; AKwUvByeo/yUOmJX78ceCE5RhsWxXc8U5bbZ5aNNrrl6BmK71oZqQqs3b+xYv0+4UR2my9BDbgYmkLuGODw=@lists.infradead.org
X-Gm-Message-State: AFuF++lcdxKaD3LfR1J26Jz73J7j6KaDPB+sBeL9vdSoI9Tsghd1HtFn
	OymlrwUIXeRfg+ayaGXHl1JR5XYFwmfxjUHUoVNPzwEb/uPkfaPEf0Bahym6l3aYZTzrdy3882a
	qPLqOnQ==
X-Received: from plpf12.prod.google.com ([2002:a17:903:3c4c:b0:2ce:9b49:d497])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:946:b0:2da:fa62:4aee
 with SMTP id d9443c01a7336-2dafaef6574mr4292355ad.1.1788367294564; Wed, 02
 Sep 2026 09:41:34 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:11 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-9-seanjc@google.com>
Subject: [PATCH v2 08/20] KVM: selftests: Use the innermost page allocator API
 in the memslot perf test
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
X-CRM114-CacheID: sfid-20260902_094137_611602_8326E29A 
X-CRM114-Status: GOOD (  10.11  )
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

Use the quad-underscores physical page allocator API in the memslot perf
test in anticipation of converting the outer versions to take the memory
region type instead of the raw memslot.  Stating the obvious, the memslot
perf test creates and allocates from multiple memslots, and so can't use
MEM_REGION_TEST_DATA to communicate which region/slot to allocate from.

No functional change intended.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/memslot_perf_test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/memslot_perf_test.c b/tools/testing/selftests/kvm/memslot_perf_test.c
index e1299611be32..844ea9b7bb41 100644
--- a/tools/testing/selftests/kvm/memslot_perf_test.c
+++ b/tools/testing/selftests/kvm/memslot_perf_test.c
@@ -339,7 +339,8 @@ static bool prepare_vm(struct vm_data *data, int nslots, u64 *maxslots,
 		if (slot == data->nslots)
 			npages += rempages;
 
-		gpa = vm_phy_pages_alloc(data->vm, npages, guest_addr, slot);
+		gpa = ____vm_phy_pages_alloc(data->vm, npages, guest_addr, slot,
+					     false, false);
 		TEST_ASSERT(gpa == guest_addr,
 			    "vm_phy_pages_alloc() failed");
 
-- 
2.55.0.966.g6673acef38-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
