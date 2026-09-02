Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E5FC624DA
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 16:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X5rpF3DClBMdjfTahQk9JxOZMhlwJM+4zXeYX1GmQAU=; b=mC5lRPwcgt/gfD
	jkySMaqDBf4L5rjIDvFfkT8TU8bpTzWVL0FNfXQFeeMKFw6HEbvq8Gx7VzlGkssF4aCX7YM7jvVPf
	sTH19zlnW6YHMFEanY5h034mv7FA9Or0pGaqXGMblzZvA9RH2VPLlTMfegFMgB/SiaK8z/RUzbYoJ
	LEvsjF7M7nHx/4QU6ZfgXNuQ20z4v38iMYXbp4AsxDPgCkhRCD/lolB3iBs5ORu2gkpJPJLpnHsED
	K6Ye4yN0jC/0kSswaTN7bpLkT6ghbiot1f0zNd2WzlVir/iwh+dkgIMWEGzRkdQeDadrVys2u9jTJ
	kqirAMAjnmJ2q6b9xlAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1m-0000000FEC2-0qCa;
	Wed, 02 Sep 2026 16:41:34 +0000
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1i-0000000FE3t-2PlE
	for kvm-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:31 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-c89704da8c7so1772876a12.0
        for <kvm-riscv@lists.infradead.org>; Wed, 02 Sep 2026 09:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367288; x=1788972088; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0zhVxUyRpRhnHXbQLMxjoc4Ys+BN3Anj09sDDnw94v8=;
        b=rNguueMKEn6U8mBZL+YrixjT5dWBLQKLi7eGjef8sVFhDUuN4R3l6eqw+qPg4hRzF2
         5WVNmfOS+YHyk+MX0od7yoxnU02pcpStNmXF1OUNSAYiZCH63Aasf9/IrpldCAXNzXVh
         Tx5jxIE6Jld3lGrv7aO/PeoWYyKnvkt5+7c8Wfs4MdA8ipxN3cjBJuwHd7qU53LYbPq/
         KRjtFEPuacjHa9b08pm8lYHB+wxJoFbmaAj95b22VTp+uXE7HvHloGhicOJZTOfM2pDh
         6dt6dgeoyZmYzUV2BLvYikc2IOJEMxcMeR4jhTU0FUw8UBbXAgb/AyvnP8/PzHbVGURE
         7O8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367288; x=1788972088;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0zhVxUyRpRhnHXbQLMxjoc4Ys+BN3Anj09sDDnw94v8=;
        b=VUIQ5Ify2yB2Vmjmksp+DzWIlFbxPzLPNm8yfPMhfWFeNIyaSIP09DBLU7YPLzQNi4
         6YlVgGomdGdv9PbC1Ngw5TcbjTq4UjA4wKW2DB2HB65NCuRBfGUrGBza/iW246oOzysB
         ILMMc6LIcm82hUoHHy6I6+s1n7C3rXTESDJge3OMDvty8cTxeOscPUs76pYpYLQrrzC/
         C+o+kD3UHHq0ygu7crCGLpFLaW+uHFFDWew5sDNen2Ed/ULwDSmRT/dpFEzld/EsP1Nr
         gPl8C2Vze5SZ/6Q6nUk8DiXV7zbfpCWigVBIDvwNAf34gxM86c6yFWfDJ/b2Op0p3In5
         /BPw==
X-Forwarded-Encrypted: i=1; AKwUvBzK/2Jkdrw21WY9Graj9YFoAmvmthaWjnwZzqgHGd9kRgD5IkECHqWOPbiUabG83qyNpdJOrOe2Q5Y=@lists.infradead.org
X-Gm-Message-State: AFuF++kK4fFoObm1ADJdvsHnsL4FzNa0nfOLmdm4B6sspglZG00/gGOJ
	xMZA0LBN1Kfa/Q4qwxLXmrOQcZOPgQlf8gfefmOLBrL+V+IkkahWdWhJ4HeBv99cwvqYV8zugCg
	YmarFFw==
X-Received: from pgbd10-n1.prod.google.com ([2002:a05:6a02:64ca:10b0:cc4:2728:8938])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7f82:b0:3cc:2552:ddd7
 with SMTP id adf61e73a8af0-3d9adaba731mr8793167637.5.1788367287815; Wed, 02
 Sep 2026 09:41:27 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:06 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-4-seanjc@google.com>
Subject: [PATCH v2 03/20] KVM: selftests: Use vm_alloc_page_table() to
 allocate LoongArch page tables
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
X-CRM114-CacheID: sfid-20260902_094130_624936_BFCA5405 
X-CRM114-Status: GOOD (  11.26  )
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

Now that LoongArch uses KVM_GUEST_PAGE_TABLE_MIN_PADDR for its page table
page allocations, use the common vm_alloc_page_table() instead of open
coding the same.

Opportunistically drop the assert that the allocation succeeded, as the
allocator itself guarantees success.

No functional change intended.

Reviewed-by: Bibo Mao <maobibo@loongson.cn>
Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/loongarch/processor.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/loongarch/processor.c b/tools/testing/selftests/kvm/lib/loongarch/processor.c
index 057a77713542..fcd41bc6fbda 100644
--- a/tools/testing/selftests/kvm/lib/loongarch/processor.c
+++ b/tools/testing/selftests/kvm/lib/loongarch/processor.c
@@ -56,9 +56,7 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
 	child = table = 0;
 	for (i = 0; i < vm->mmu.pgtable_levels; i++) {
 		invalid_pgtable[i] = child;
-		table = vm_phy_page_alloc(vm, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-				vm->memslots[MEM_REGION_PT]);
-		TEST_ASSERT(table, "Fail to allocate page tale at level %d\n", i);
+		table = vm_alloc_page_table(vm);
 		virt_set_pgtable(vm, table, child);
 		child = table;
 	}
-- 
2.55.0.966.g6673acef38-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
