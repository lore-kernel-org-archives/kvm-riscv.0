Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC882EE01F6
	for <kvm-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 23:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+iIsHA7aMSfviL/pRVHjwNGAWhi9J+zcdjxC7OPIbko=; b=exFg669CiED9oN
	ichnFFLPQ3m4xlG0cWduFNtcr9/2Ib0+WRh/g6MUbVtIK/3p+LqU/YqRsrFy9tdbZc3CegyesC8F8
	eslwq17FdAdJGARl0wl5dpYbzGCG9oSBV5OZg11BXFc0aqdHf4K0fyTmgJ8m0BN+T1crf4KGoJHS0
	c4vSFHWfhbSTFmAzUmpC8Oy6bDt3wNCEhNtXLf4AdnfW0IrAXcbh/L8yXNcm9CXOIn1PPmWlPNzhj
	miyrZoFjBuMdApwuO93pewDgvO5EPbDcWrVr6JN3AgoJWmhTmQiAez0drDl+C1Rh3ir+Rx0Ky+bll
	Nf+klqVe+0hcQNrUiZbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vail0-00000005Oxr-3Q2q;
	Tue, 30 Dec 2025 23:04:02 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijP-00000005Myj-2DMc
	for kvm-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:24 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2a089575ab3so136396795ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Dec 2025 15:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135742; x=1767740542; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=FMYWTnD6Tv1L5yY9MguuNjhNHloVV4vNjkLbvD2vfOU=;
        b=rChaLrtmLxXHfwfxT1ByH3S/beM24x08oPNTIJ2Cs9GsVsTXgXvXasQgsf/wMyUpLg
         Ao7SyWxmSSbJTzYGmJttKkVDdvySyMQjsGrPP6wSEVe7ka38WkhsSPUs9CVa61o9hYtv
         tHEk2ADXbSWLYosHYZ/HCSWjnuz2vr5nQzjvP79jSqndgqUrpb67S8De6kZ/UvTqazes
         cqak1UDJf1FBiQjrVc7C8vKLUIY6PIzYBXhiQTw46tf0E01rMsHA3eN8sJViqoY2AuNB
         4bDwSAMGwmYfgyJRpIoG5tR5gi6+0ACPdE9wkTUlnveAEc8OWOkdN6ntdmBSNKwXhAvd
         oVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135742; x=1767740542;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FMYWTnD6Tv1L5yY9MguuNjhNHloVV4vNjkLbvD2vfOU=;
        b=XQ86WNggdLobvlPWuRfDrcaU0TJNARhQZ4Yht98IOuzStU3AOs1527KmR2d3wLSwJj
         hb8R2ef8Jff5WtMJ3uFO+9MJo5YiSTTiCxN5flBJp5lGjc/IvphTA8bL/9UC1tHLbsjM
         PtXbjDSl77aLCvCFhgONRwlhzjV4XZ0nBaigNIiizeaWP39iTY6HcmasBi+HWWoRGML/
         oZH66hEU5K99MVkvKsHCsqlmzd8LtFvZtrzh4gwHsCpTGzX5PdIxoEJnibocT8ubmO4X
         pzfWoAjedxBlsCbZ4phJRCJXourpn0RhTm7GZsuOv3pCpdI6dYwFdlQgZ9aYCve4uzmm
         OT0w==
X-Forwarded-Encrypted: i=1; AJvYcCUSlIGC1z9nbMYv0XtDOPdspWDU39ex1EH5DtHfqJLFUBlWRcCN84sViKgON+EAUi981W/EEnwBvIk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwdqyLbzdzEcK91988PT0aI3Qp5hgIn8qmz5r1wed510MBO2ETQ
	6o/Mh1FeFRf+D9PZGb30rwAsHH98/UU5jPNyDpZBUN1aOUgwH+80en2KIa1vpEhlxP52o6pCNlB
	nMJIe1g==
X-Google-Smtp-Source: AGHT+IEPzwhGxGkpTdzvCyQe6ViV9J79G7ardG1q/yA1uYuatCDGiLbmMWR1E1eqCq7xQW2f9AolN3qf2J8=
X-Received: from plzv12.prod.google.com ([2002:a17:902:b7cc:b0:298:1f9e:c334])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e5c7:b0:2a0:be5d:d53d
 with SMTP id d9443c01a7336-2a2f2a361c2mr352279255ad.53.1767135742297; Tue, 30
 Dec 2025 15:02:22 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:46 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-18-seanjc@google.com>
Subject: [PATCH v4 17/21] KVM: selftests: Set the user bit on nested NPT PTEs
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
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry.ahmed@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_150223_606939_23DC6D36 
X-CRM114-Status: GOOD (  12.53  )
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

From: Yosry Ahmed <yosry.ahmed@linux.dev>

According to the APM, NPT walks are treated as user accesses. In
preparation for supporting NPT mappings, set the 'user' bit on NPTs by
adding a mask of bits to always be set on PTEs in kvm_mmu.

Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/x86/kvm_util_arch.h | 2 ++
 tools/testing/selftests/kvm/include/x86/processor.h     | 1 +
 tools/testing/selftests/kvm/lib/x86/processor.c         | 5 +++--
 tools/testing/selftests/kvm/lib/x86/svm.c               | 3 +++
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h b/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h
index 1cf84b8212c6..be35d26bb320 100644
--- a/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h
@@ -22,6 +22,8 @@ struct pte_masks {
 	uint64_t nx;
 	uint64_t c;
 	uint64_t s;
+
+	uint64_t always_set;
 };
 
 struct kvm_mmu_arch {
diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index deb471fb9b51..7b7d962244d6 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1450,6 +1450,7 @@ enum pg_level {
 #define PTE_NX_MASK(mmu)		((mmu)->arch.pte_masks.nx)
 #define PTE_C_BIT_MASK(mmu)		((mmu)->arch.pte_masks.c)
 #define PTE_S_BIT_MASK(mmu)		((mmu)->arch.pte_masks.s)
+#define PTE_ALWAYS_SET_MASK(mmu)	((mmu)->arch.pte_masks.always_set)
 
 /*
  * For PTEs without a PRESENT bit (i.e. EPT entries), treat the PTE as present
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index a3a4c9a4cbcb..5a3385d48902 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -231,7 +231,8 @@ static uint64_t *virt_create_upper_pte(struct kvm_vm *vm,
 
 	if (!is_present_pte(mmu, pte)) {
 		*pte = PTE_PRESENT_MASK(mmu) | PTE_READABLE_MASK(mmu) |
-		       PTE_WRITABLE_MASK(mmu) | PTE_EXECUTABLE_MASK(mmu);
+		       PTE_WRITABLE_MASK(mmu) | PTE_EXECUTABLE_MASK(mmu) |
+		       PTE_ALWAYS_SET_MASK(mmu);
 		if (current_level == target_level)
 			*pte |= PTE_HUGE_MASK(mmu) | (paddr & PHYSICAL_PAGE_MASK);
 		else
@@ -299,7 +300,7 @@ void __virt_pg_map(struct kvm_vm *vm, struct kvm_mmu *mmu, uint64_t vaddr,
 		    "PTE already present for 4k page at vaddr: 0x%lx", vaddr);
 	*pte = PTE_PRESENT_MASK(mmu) | PTE_READABLE_MASK(mmu) |
 	       PTE_WRITABLE_MASK(mmu) | PTE_EXECUTABLE_MASK(mmu) |
-	       (paddr & PHYSICAL_PAGE_MASK);
+	       PTE_ALWAYS_SET_MASK(mmu) | (paddr & PHYSICAL_PAGE_MASK);
 
 	/*
 	 * Neither SEV nor TDX supports shared page tables, so only the final
diff --git a/tools/testing/selftests/kvm/lib/x86/svm.c b/tools/testing/selftests/kvm/lib/x86/svm.c
index 8e4795225595..18e9e9089643 100644
--- a/tools/testing/selftests/kvm/lib/x86/svm.c
+++ b/tools/testing/selftests/kvm/lib/x86/svm.c
@@ -72,6 +72,9 @@ void vm_enable_npt(struct kvm_vm *vm)
 	pte_masks = vm->mmu.arch.pte_masks;
 	pte_masks.c = 0;
 
+	/* NPT walks are treated as user accesses, so set the 'user' bit. */
+	pte_masks.always_set = pte_masks.user;
+
 	tdp_mmu_init(vm, vm->mmu.pgtable_levels, &pte_masks);
 }
 
-- 
2.52.0.351.gbe84eed79e-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
