Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6653DF5A8BC
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 21:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SbCcH1t471Tpe55DsVYUcxxpRBLycWSvmjFc64zbZiw=; b=CJeb48HPPbuR4+
	IC/6/KgJc7XAKqg2AWSB4na1Pw1Fve7IWAiAkHBw5uVtpZvvZ8lnX3b2hIyNATb1UdGP3A4klRuBw
	x5UKSkLWGUXp/Yta/yI14mdlxGvJEYv86AtkR7c7oLBqT5HqH5rnM52B5Vqxk5phekOrSnMr/X33C
	fX0n/MsL8v/JHEBrr2iOQkbCbasIdUE8JGGKBpUqfEUKZ5QX5AtntBeoIalBAaWjdTUXqRr2ydeIV
	GBKYP1ZXabT6OUc0BBhiXjOV1FqnYizHbTq0aZWoHBp+cH3yqKpDeB/8a2ZXh2Hqi7kLXxnncUBVC
	FlAHg5Kd+xVYr/zDdkwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw3c-00000007h5b-3CwK;
	Mon, 20 Apr 2026 21:21:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw2z-00000007gAO-2Fcf
	for kvm-riscv@bombadil.infradead.org;
	Mon, 20 Apr 2026 21:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QEFsBmHczG78buJgokkfE6P9p/Sjtw0NPo8cky9xSS4=; b=gAqwUG6IMTEzzs6WeeDER7emus
	y1UzclZLYpw+UtHNVY2BtpDiYY+4RHzEa7Fv8HOjHDjH5un9jlVLf/yxHMX8DMlAeXUsqMrFphhhw
	vXJMlVVn+xKUp2TM39R34cwrX408oaqT1uLVUXfPCFu7u9mqgntKHIfx1k1EgKWwUbs7Fm1JFBxNW
	19jWPCz6LNAVJ5uOlgWPjWr2VmyIFidrIbBwSakluAMiycugBT05kGSMWEFBj3q4XdpeoWY2AhLu8
	iupqR6U5VpL7SIda5sq/zykZfmH0/tyr0LvcS/1P/E9R6Y32avXrjF8cEOHqe+9VPldInnjpHJEHU
	983Sgwrg==;
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw2v-000000093SU-1dMv
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 21:20:48 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c76c6280732so3875871a12.0
        for <kvm-riscv@lists.infradead.org>; Mon, 20 Apr 2026 14:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776720043; x=1777324843; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=QEFsBmHczG78buJgokkfE6P9p/Sjtw0NPo8cky9xSS4=;
        b=NMQ6EIAdDN0fWEx89vgKYLpmv3DtIOvgwEbSOBf0ldvGjp4xLirJ1SBEj04NKl6Ao2
         FMYE5fKr3mh9H4cGasaOhMyM5YGtP9c1wxntErFQerJEx4+GmxTwTI1catPxVjceIQM2
         YatnoDwGhaND414CIHxdteWopUFS7xTgswrk1MjXD2o/F4U70a17rm5h0ab1ywAiIwRV
         YwsR/mo2lytMT5605LL6WBimPKiLKPUCSCNercSsen4ByZXwbckupbydWFHzIe4nzNsX
         DxnuqIss/b3rC36glXfY1UV1sLN+H9vPKhYtja9BHJlv5nTtr+pViZHf2u0zrbMrGxDZ
         VkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776720043; x=1777324843;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QEFsBmHczG78buJgokkfE6P9p/Sjtw0NPo8cky9xSS4=;
        b=TwxjtjXixQVKq44dvA8L63xmXgzER3HHC42QUOKhgSNd2rTzzTaNFkgfnE8Pj7+zoQ
         +JdL2KlVbi1W7j9zBYcm8ZgexT/ZEGSCM9UtXbGAHWFe9ZYH4h9Vymc5p1EJ/gVA5pPV
         mY+ciyJCskR0o2gAZoc+vrVDSzvwHZiPBnUge2kaGfgDaEXz/zzpfU64q4NrjrF/T1uW
         KkKk/qCOq2QWxliUVXL7QPBCagtIt5QKbMmNoKIwVCNVkoP+fzybTEwm8f2Q6CYM1wKc
         lXOf6wEmjDPNfBLXUbtxXulB4ZwjiHRMXHTY/MyoBXeAUiScMov7yEorXlAMysT0fabz
         KzmA==
X-Forwarded-Encrypted: i=1; AFNElJ/1pgFGNFungq/k7MS4RRLJGRLyS8bFgCnGDoW9AAG2X2HjSj86+RR+mhTh2XyifxSDF/JrgZ86l1g=@lists.infradead.org
X-Gm-Message-State: AOJu0YwOrvk7vD2/gLNAgbt3vC74mVQth/zYwJeJLEUgBlEXnp6FIYuv
	bxaoLbeLKiPbqBF3hsqtPYcKBQnpYOxWaXNZdKBX8n7Uf9dvg0Fi4xu1Y8ZzVe8c2bFG41oeArY
	HCjHxYw==
X-Received: from pgbdp12.prod.google.com ([2002:a05:6a02:f0c:b0:c79:84fb:feac])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6d82:b0:398:90e5:a9b9
 with SMTP id adf61e73a8af0-3a08d89d0b9mr16041202637.27.1776720042436; Mon, 20
 Apr 2026 14:20:42 -0700 (PDT)
Date: Mon, 20 Apr 2026 14:20:03 -0700
In-Reply-To: <20260420212004.3938325-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260420212004.3938325-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260420212004.3938325-19-seanjc@google.com>
Subject: [PATCH v3 18/19] KVM: selftests: Replace "u64 nested_paddr" with
 "gpa_t l2_gpa"
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_222045_460916_36C750F4 
X-CRM114-Status: UNSURE (   7.59  )
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

In x86's nested TDP APIs, use the appropriate gpa_t typedef and rename
variables from nested_paddr to l2_gpa to match KVM x86's nomenclature.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/include/x86/processor.h  |  2 +-
 tools/testing/selftests/kvm/lib/x86/processor.c    | 14 ++++++--------
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index fc7efd722229..97dc887658c3 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1514,7 +1514,7 @@ void virt_map_level(struct kvm_vm *vm, gva_t gva, u64 paddr,
 
 void vm_enable_tdp(struct kvm_vm *vm);
 bool kvm_cpu_has_tdp(void);
-void tdp_map(struct kvm_vm *vm, u64 nested_paddr, u64 paddr, u64 size);
+void tdp_map(struct kvm_vm *vm, gpa_t l2_gpa, u64 paddr, u64 size);
 void tdp_identity_map_default_memslots(struct kvm_vm *vm);
 void tdp_identity_map_1g(struct kvm_vm *vm,  u64 addr, u64 size);
 u64 *tdp_get_pte(struct kvm_vm *vm, u64 l2_gpa);
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 3c55980c81b2..892cc517d9f1 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -495,26 +495,24 @@ bool kvm_cpu_has_tdp(void)
 	return kvm_cpu_has_ept() || kvm_cpu_has_npt();
 }
 
-void __tdp_map(struct kvm_vm *vm, u64 nested_paddr, u64 paddr,
-	       u64 size, int level)
+void __tdp_map(struct kvm_vm *vm, gpa_t l2_gpa, u64 paddr, u64 size, int level)
 {
 	size_t page_size = PG_LEVEL_SIZE(level);
 	size_t npages = size / page_size;
 
-	TEST_ASSERT(nested_paddr + size > nested_paddr, "Vaddr overflow");
+	TEST_ASSERT(l2_gpa + size > l2_gpa, "L2 GPA overflow");
 	TEST_ASSERT(paddr + size > paddr, "Paddr overflow");
 
 	while (npages--) {
-		__virt_pg_map(vm, &vm->stage2_mmu, nested_paddr, paddr, level);
-		nested_paddr += page_size;
+		__virt_pg_map(vm, &vm->stage2_mmu, l2_gpa, paddr, level);
+		l2_gpa += page_size;
 		paddr += page_size;
 	}
 }
 
-void tdp_map(struct kvm_vm *vm, u64 nested_paddr, u64 paddr,
-	     u64 size)
+void tdp_map(struct kvm_vm *vm, gpa_t l2_gpa, u64 paddr, u64 size)
 {
-	__tdp_map(vm, nested_paddr, paddr, size, PG_LEVEL_4K);
+	__tdp_map(vm, l2_gpa, paddr, size, PG_LEVEL_4K);
 }
 
 /* Prepare an identity extended page table that maps all the
-- 
2.54.0.rc1.555.g9c883467ad-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
