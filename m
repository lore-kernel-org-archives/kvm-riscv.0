Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB14C021A4
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 01:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C0Ft3GMnYSLnLeQNA2Bprhb6m2VBN+5tjexB/FRs5ig=; b=nJKEZ+/WP7nEUN
	fLrexWQ1rDWWtmLzniTVm8OOAGcYglOfL5Wko/dzSsVJbgXvB/shO1wv4n3W20pLB6nJQGxrZ19y6
	wQSiXynALLGWDdw6kApb4Nzx99Q1lfpIiWyNAOoIOCNlVxvJFLweNfosdRQb2bo0u62123xAFwwYV
	nu+87309GV2OZOjMqgYVefDTzWatfZlMSDRuSTMgJ3179o6qAGkbJA3vCpf5P+0zF/INrhax9UsJ+
	hkJcPXj1tsWluwKUg+jItxh9VSd4YMBrIPMI6cJrkfnaz/FPT4k1m8T1bpKR80HQGbZBY2j/p1V+I
	k7mjm6E8L+f8CL5fLYUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmjQO-0000000Ffqo-278K;
	Tue, 25 Feb 2025 01:07:52 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmiIm-0000000FY1J-3GLP
	for kvm-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 23:55:57 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2210121ac27so104241045ad.1
        for <kvm-riscv@lists.infradead.org>; Mon, 24 Feb 2025 15:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740441356; x=1741046156; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=TJTgZNhYY30nXxMYJRDXX1rx/rqsWdUW6nwlsEZr+Zo=;
        b=s/EKz2bmKg1x/EOX4H7mnARQb/HNhdfz2Clx6VAHIYBvMOFInSfPKZO62yu6Gi/OXT
         8pKnKCgi7yk+L7mIkmAUENtj2hQvYXTp5PXjcfKoUs1qTqEcrCjPrktvoUFm1Sd6s4GX
         xkAMz5fkd8UXe19MxbGMO6n/o1sccehqi88yR0P+Vxo6le6VHO4w4w4hEcfqvhDa/qzN
         JDhIIGV4ekYTmeoBTcu1uTCGPb+Jw2kzETYBHiXsxgx1p0FXP1NwwxuQRqSxjzyAVo+y
         +5yeagx0x8UcTsSJ5lyMNO8pxmZwyXyHjwzfNerBllGmK+DhwNdL9T+NmBupkJc4IcOY
         /NqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740441356; x=1741046156;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TJTgZNhYY30nXxMYJRDXX1rx/rqsWdUW6nwlsEZr+Zo=;
        b=YJ/60L5369ITWH3PUwZewW3omdqzHR+k4kNJEucOqWwVEAwYqQVNrK/MUUpAfL9iP6
         /fpMeeoFVoCR+Rwc91CCVnr3/BKGJyEduYMKDkHcdy5hiYrnLDIMS4Tk0YLK04nV29Hd
         k+pvQhBrD8isYWOZ5xPQtEt7U0fPMuWJoKjF/p0LcczmkfY8S8WWfAjcTKkoEPN8Hx9b
         cdVe/WoWY67gUbxD1OSraRKHwJIKgNYD14eMrcw8voaxK1QNJmzc3UN7Rba71IjyTZPu
         ZlRno91QtfwsMLfX+KE4vjpTYqWtb8dHhUb/j0bTvwrW2sFjsDLwNtoEj5PQldw6xaRi
         cUCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN7r6MPX/2moBwpQOo4e8/lnsVBXeq1khOIhde3MAKK87ynL+o2u7CBDy+l87XE/QICG6EjqjWWSA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+bAQ6qToE/PCr3Ibm3rkXYpGxzRT5WV0366CMWTTMLQkfocJX
	efFXaNUoRd6F2x3a1fjRHdv3MrNy5BM7PNFRlz/noP+0NeMBS4355OUZI2cgpwbchDFR9b/HadQ
	QKA==
X-Google-Smtp-Source: AGHT+IHgthprmvsK7rAfh+PsqOM1pat7xQuGm72FmKpfdI+qTOt1cCxKN5aFSZszJT1EFJi9jy4pNoVXfJY=
X-Received: from pfbig2.prod.google.com ([2002:a05:6a00:8b82:b0:730:7c03:35e1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1947:b0:732:623e:2bdc
 with SMTP id d2e1a72fcca58-73426c84885mr24369761b3a.2.1740441355733; Mon, 24
 Feb 2025 15:55:55 -0800 (PST)
Date: Mon, 24 Feb 2025 15:55:41 -0800
In-Reply-To: <20250224235542.2562848-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250224235542.2562848-7-seanjc@google.com>
Subject: [PATCH 6/7] KVM: x86: Fold guts of kvm_arch_sync_events() into kvm_arch_pre_destroy_vm()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aaron Lewis <aaronlewis@google.com>, Jim Mattson <jmattson@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_155556_815569_D53E0232 
X-CRM114-Status: UNSURE (   8.69  )
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

Fold the guts of kvm_arch_sync_events() into kvm_arch_pre_destroy_vm(), as
the kvmclock and PIT background workers only need to be stopped before
destroying vCPUs (to avoid accessing vCPUs as they are being freed); it's
a-ok for them to be running while the VM is visible on the global vm_list.

Note, the PIT also needs to be stopped before IRQ routing is freed
(because KVM's IRQ routing is garbage and assumes there is always non-NULL
routing).

Opportunistically add comments to explain why KVM stops/frees certain
assets early.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index a61dbd1f0d01..ea445e6579f1 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12772,9 +12772,7 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 
 void kvm_arch_sync_events(struct kvm *kvm)
 {
-	cancel_delayed_work_sync(&kvm->arch.kvmclock_sync_work);
-	cancel_delayed_work_sync(&kvm->arch.kvmclock_update_work);
-	kvm_free_pit(kvm);
+
 }
 
 /**
@@ -12855,6 +12853,17 @@ EXPORT_SYMBOL_GPL(__x86_set_memory_region);
 
 void kvm_arch_pre_destroy_vm(struct kvm *kvm)
 {
+	/*
+	 * Stop all background workers and kthreads before destroying vCPUs, as
+	 * iterating over vCPUs in a different task while vCPUs are being freed
+	 * is unsafe, i.e. will lead to use-after-free.  The PIT also needs to
+	 * be stopped before IRQ routing is freed.
+	 */
+	cancel_delayed_work_sync(&kvm->arch.kvmclock_sync_work);
+	cancel_delayed_work_sync(&kvm->arch.kvmclock_update_work);
+
+	kvm_free_pit(kvm);
+
 	kvm_mmu_pre_destroy_vm(kvm);
 }
 
-- 
2.48.1.658.g4767266eb4-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
