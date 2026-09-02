Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5D0C624DA
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 16:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gX8ba1JJlCEOLn9PjZrTdN+j/cyt2oKl4sj/liU5hCQ=; b=orHJVc9sSCoUq0
	AzCL7BY+5vMUXpiNrGLyCNmnoUf4je/oBb/Yg+StmlSax3zU4LGIQCoB+3pJwCdo1dzvrpHuCOFcR
	Euv4NMufo9FN/GQOpO/ZJn4d2SvxqXo94UWChSUUAdNRSGOQllnXHDAp/2KTQ2BaLwXQVmc9g5NF1
	UkndCBBwPh4iG2IKasmv6eqvxTcnaMbW89MohHK2f5D9+9FdzBfwahEK7FZVoAmb+asHPaNNExFX9
	EbooW56063cdn6rkThzEUh91lU/dA6t9g/tfIyN8ItY67LBoHIY6bsB2phBi1nYS0G6m3arsQ/DJH
	m/Zhn9ukHqiCMudK49Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o2I-0000000FFJu-3JBW;
	Wed, 02 Sep 2026 16:42:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o20-0000000FEdj-3qko
	for kvm-riscv@bombadil.infradead.org;
	Wed, 02 Sep 2026 16:41:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=o5u+D2Eye+Inmljua0Pt8umFr/3SFEmDrz+aVxfwQfA=; b=HvbCIJRN1yyYvBHLjXdyaRO33W
	GNgZL82mvwW5AogLu5TI/gvmGtg1RW7CLnNKlbj8RcyAJjvXBdo7UuIWHxvctOZ/WFHi9/qiV79EY
	5S+O89C2xu5IP7411rAy4BdXD7WYMddleXSaL3GUbV/WYlqFmdAq+O9PMVUweN7QswbMnNmWm6OzF
	qRuHPS29dQBk+I33Whox4G+gfHbgjttCVCuIliNms5F03C3Wltc5asAnE+xI2tpkJYvpaIFQC+ZrC
	Csm3CLecZBNtMB+0KktuxgnJVlEJjI9qQ7LSC3939Ii+yjSwOawOA3JXBs251+MLHyCQPTGaEE+gm
	J/MBZBrQ==;
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1o1w-0000000CD8c-2w8J
	for kvm-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:47 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso1618631a12.1
        for <kvm-riscv@lists.infradead.org>; Wed, 02 Sep 2026 09:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367302; x=1788972102; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o5u+D2Eye+Inmljua0Pt8umFr/3SFEmDrz+aVxfwQfA=;
        b=qOO/w7wodSzLTPCscUCpJtuY5nrEEGmvC9JDcdYMir0jdZ6IOz+2SEAi20RbPeWY5N
         a0sN4DEJv/9VO1hQ6i7alU/8Xsd4i2p4iEki7AU+VUhki933k0jzFni/HpKWS/fWt035
         eWkLCpGTjy/h9qkBRt6oiv+9eFMkfIJ8tE03i6/fCZaoTq8Kw8ji4N4nCZ+1Je49gyzL
         mxltJU4bi9XqG3ZnZqk+o9u89hBffIexe4aEoW2zoXmOOawWjNxPYNF8YP8705cDl9pP
         L6dCKaGYmGN4pjNiuEuIPb1SFSmBz52tuByzKuEnVXkDLAKMJnHX1dcgYdajhkD63BJO
         b8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367302; x=1788972102;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o5u+D2Eye+Inmljua0Pt8umFr/3SFEmDrz+aVxfwQfA=;
        b=bTxoUU5qtpI0KwaWWpNdbf/YCieyNldcMDXBH1xy+yy+zI1pnQtoXHzAzTFbRszsod
         P/YuEQMwHUbr6GPkTj12Lht6ox3RvRDQpSsfI/P1wpqCshZ2Dq5quxhkulKtUTfFuRvO
         U6VPOnDyTyWtffDlZ8xEFw8wAUm5c1bmc4Uv0iEP6aEiVgN8zdrW0MUt4QPPHWFci+Pi
         6ntolbUI1U+MEW9p5d56R4DjI/ODVa8UC/FUIe2oyYUQSEHAAixWTotHE3D2eJUDlxRi
         KUoJX1pXJF7NZl9MXe2XVlIxvVY63oJig8LItN6OSFC5fNmr542tWFgsvk3vFkk8DhyU
         Zggw==
X-Forwarded-Encrypted: i=1; AKwUvByVdIgz2dCMTY0QeK26ITTWuNQ45NkgQRWn1GHws+mqx+zJh1ZYOI+DEeejUGa959V4Ur7ig4E0S98=@lists.infradead.org
X-Gm-Message-State: AFuF++mN4Qat4VJrMusvqRSrETyOrHjvYlb4Zl1UlDRuJLnqiQ6gRGzx
	4jeEJrxVx/vZgxi30FjdlG7L/v8MyKOD2uvI/2mTnHI04hiKNVc9mhJeXEBb5meEmCwKI7VDwzD
	IWJ+KnA==
X-Received: from pfbhm12.prod.google.com ([2002:a05:6a00:670c:b0:84a:30be:791f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:35c4:b0:857:73e2:9107
 with SMTP id d2e1a72fcca58-85ed99b48fcmr9375483b3a.23.1788367301626; Wed, 02
 Sep 2026 09:41:41 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:17 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-15-seanjc@google.com>
Subject: [PATCH v2 14/20] KVM: selftests: Use TEST_EXTRA region in arm64's
 vGIC LPI stress test
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
X-CRM114-CacheID: sfid-20260902_174144_854682_91FBA299 
X-CRM114-Status: GOOD (  11.71  )
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

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
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
2.55.0.966.g6673acef38-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
