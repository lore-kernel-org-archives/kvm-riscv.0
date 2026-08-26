Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C13C61DBE
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 23:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=stnaQt0aegNHEUJRt0tjBLAJ+qywyqMo4DOnbuqUNKQ=; b=WBs1YvBad34lZB
	n7xHJ+EqABoNgNx1eXCgjr3NMMST3QGvM1hqesL8CkDSyGJNNxO+BbbZ6o+bwK+InOXkL6a7qIQaU
	gq+cV2EDDqXS7XFfEoP8ezEx+BIEOhjzPr7O+n1HI6+yrkXoTppgYCoxCGvRzJqHthkUyolxsyW0E
	v2tOwrUmARIvfWKq7WyesAXzGL84Tq3HiXS0L2dnBmHhDtaoDNNyn2fp4yyGVeSYCUqpzpgi6S9kX
	ezWcBACC5iAWvKxIpL+Jaw1ezNQLIkYJyJR19AG24LkozDWChapY5J+UTskDgvyE42VvXvC5/IkrI
	/zOj9q1wn6Ixfki/ZrOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMho-000000038AJ-3jkj;
	Wed, 26 Aug 2026 23:06:52 +0000
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgZ-000000036MT-0jBH
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 23:05:40 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-c89704da8c7so185103a12.0
        for <kvm-riscv@lists.infradead.org>; Wed, 26 Aug 2026 16:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785534; x=1788390334; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x6dP/JlGXbpMmzJiAs51wjG9zHvCLsaGeW9+h1tHon4=;
        b=t96QDKFRVQlnG1/FeNyzZvBeIlN00HIx7EqhMRkkdsrRRcUqrnR6IHWmhOWHxQu0hZ
         9FaLP6Obu2wvvlSZ5Fxiw53NU3Qyl1ucOmfrYrj/BWK8z8qBo8ppnLSWolnDt60S2ue5
         95PG3Atv1A+HxjyHjm7wNSnifgHCnn3k8ukUEcviovRzEMnUzWdXk987AwpnZq9CVfbd
         4h1hu4vFOZszHba08hDNEagNpN5n46iwvKuyJroUbnYD9AkcD7/8vRNRN7jRresVMEpX
         Zs0bP2Y751xNf3sNAVQV4DOqXoez8kmdBIExAF4ss4RVrhzssq95QtFgoWTNE6Onih4X
         lqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785534; x=1788390334;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x6dP/JlGXbpMmzJiAs51wjG9zHvCLsaGeW9+h1tHon4=;
        b=J1TP5pMopk4grokua5CRYt9VJCZSuVRkNoyMF1E0ZZx5r7QVzJ3Th0cjyGkDcJ0uTe
         bdn05TeSBrLwuwalvCOAIujDCObRLd5GqSgrfj4KPPYqrBvvoXJ2WIw7alhAZxTp95Bb
         vP0wjoRtDplWlxXChP1W/pJWe1KqbmCm+VYIyEv1VkmsHVrobdXcv0t2kbt0hLVJ/rqr
         vNGBS6NA8Em3D2bPa/X9M4iAGlBeqWH3GADe+Xtt/n+HMdsXjT2UfJlByg4O+Hdt1U2m
         nSFVNMPwSipHNq893eyS3B8PEa10Vsw9M5f+llCnZnFvF8aMsOjt7GOuDwaxhxg+R1t6
         VVPw==
X-Forwarded-Encrypted: i=1; AHgh+RqYISBNOGYAA3XZ1UFTRrs0Q4EiWVdq3vFzVYXrrTOlbltnkHYEtLEcqG5oq9gVKScbWQrYSS1Jpd8=@lists.infradead.org
X-Gm-Message-State: AFuF++kAD3/JB/TF7crHN42H1gNoawE4yHw/5JOzNzIOCAe2eOI0AA2g
	th7eO8Adu7dA1vKVhQfx6Sr527KsLPV5TqV0hD9Pju+l1FfwIf/BkyF7w0LgafYiqluBRqdfARl
	OGFbLWg==
X-Received: from pgcv20.prod.google.com ([2002:a05:6a02:5314:b0:cc1:c423:3804])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:cfa8:b0:3cc:8f53:26c0
 with SMTP id adf61e73a8af0-3cf86dd6053mr21955403637.17.1787785533546; Wed, 26
 Aug 2026 16:05:33 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:05:05 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-15-seanjc@google.com>
Subject: [PATCH 14/20] KVM: selftests: Use TEST_EXTRA region in arm64's vGIC
 LPI stress test
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
X-CRM114-CacheID: sfid-20260826_160535_310726_E64FC621 
X-CRM114-Status: GOOD (  10.91  )
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

Use the TEST_EXTRA region/memslot for arm64's vGIC LPI stress test instead
of a custom memslot, so that the primary vm_phy_pages_alloc() APIs can be
reworked to take a region type instead of a raw memslot.

For all intents and purposes, no functional change intended, as
vm_override_mem_region() is barely more than a wrapper for
vm_userspace_mem_region_add().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
index 9a69c439a0f8..9865b204fdeb 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
@@ -164,8 +164,8 @@ static void setup_memslot(void)
 
 	pages = sz / vm->page_size;
 	gpa_base = ((vm_compute_max_gfn(vm) + 1) * vm->page_size) - sz;
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, gpa_base,
-				    TEST_MEMSLOT_INDEX, pages, 0);
+	vm_override_mem_region(vm, MEM_REGION_TEST_EXTRA, VM_MEM_SRC_ANONYMOUS,
+			       gpa_base, TEST_MEMSLOT_INDEX, pages);
 }
 
 #define LPI_PROP_DEFAULT_PRIO	0xa0
-- 
2.55.0.887.g758fc8c411-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
