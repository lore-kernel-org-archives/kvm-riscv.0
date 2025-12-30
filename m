Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C77EE57C2
	for <kvm-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 23:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xuGlCxiIp+p/Te7hYJ2aO+MU8N0BfXjIxGiAbvq2wcY=; b=thdcQLduoGXExO
	lECbEiQ7kD5Ikjch0pcQFvkQNHdOvqqJj8leeoltskGC+m+bIuQNzc1wFH56fCEdge5df0ZCFDISl
	kxFKflWWO1IFfxCvoeYlyT689A8y6/tmXqlmUyq2AKW3ABUuIXpWRvDI6jOgsLxF2c5yPc6g3KRj4
	05eci+p/jqg3/MxHhODjT7L2GuJRSCSHV7xHbyRvTZb2MkeO6yOMaqj1VP5cV4+tJr73RpvHRG1Cc
	Cpd29hU7iyriQTZ7XfO5ZeVELVJ/6oz9XxtmrD0+uaj8glgM7m0uE9BK8eZd7Zb4GhP9enIuacFLK
	3Nfj8dRWBr7ez7Sqs7XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijn-00000005NVf-1elJ;
	Tue, 30 Dec 2025 23:02:47 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaij4-00000005Mia-3Obn
	for kvm-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:14 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-34c6cda4a92so22223836a91.3
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Dec 2025 15:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135721; x=1767740521; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=snslv60TkZffEAQE2fKI/7w9i9KGKI8ATFVeEcgF+Qk=;
        b=F/D1kpaJYMzrQpLd/RqrLV8EArQpA1Y4FEEsZn8NdJc5PhrujrQQTatgLNhGReOwPl
         Yeg7UuupR6N/56cBRdClEe3OGCml4hjqcJZvxUJSl9rJGnHc/Csmpkfv9L2uEEbwHyI1
         +hgH5mbITcdZ6IuAHFjOXObu/h0bUscLotMxe1viHTVU4yJ97251jADsspcc40pYArVB
         MdGt0RJRTQ7j4miOATavkKUjLRnUYxFX6fiPQHhCULqZZduMY+/X4E4Jig8GRjm7hcHS
         mMuA+ZpmfwC6YDrZ/WUaScUYMuxweb8ShfvCTZO0Zb+5rgnbrczUgPFQ711qLOj6ojaQ
         h+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135721; x=1767740521;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=snslv60TkZffEAQE2fKI/7w9i9KGKI8ATFVeEcgF+Qk=;
        b=KwWeiTScErSNjjb5ppfs3XBAxEJVN1qinCYvY8KPLXRZEKjJpvE4LLnkO7VcctvaCd
         y0vjWw1hMErWQt0O7PS9xM72Q4UaxpigRV5Tb8YFLyW1PHu8t9s090Rb1VVH/WTfbWsr
         02ua3rSr31svVg4X47GE3cfWlXEtnuFHpqKNclAZ8cBnOURugAIK/yKL/Iu9Me2VEMJL
         zmDcqBtnfhESGuYUA7BL+9kuG9/42V3awt1IWzzjdiXEnSdp09zkyFqhjywybi3E2k/7
         EIdjPennTT8//YsYR9PmXRuMUV6HR0GNOFahvIlrIYp+STzBBNyh1O65xGBAPwr+rjIz
         n/Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWNCPF7hTot2oU3o2GsROtJ6j6RQToG5I1n/bPvL+dcvza6ZZt2p21TNeeIDtOTdibog8gs2yVQBxM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyjKX7N3zzZn/AeAktGJKda9lrtjO8bQF9XdW/yLOWNqYZIFowJ
	nLsWhFxf6MMN1W8OSM7oJCSQvLRk0bhCrkGenTmN/zSk3z8LgXLB5xanQmhF2BcT1WO9ihFFkDP
	ZwT8x8Q==
X-Google-Smtp-Source: AGHT+IElvIFPPzPbx/fWhmlKYhmrHPLLecvBIwXjPK26QLj43KDrpSTQ0SF/ILvphJaY0JI4Mn53QzvVzYY=
X-Received: from pjoo4.prod.google.com ([2002:a17:90b:5824:b0:34a:a9d5:99d6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2e0c:b0:341:8bda:d0ae
 with SMTP id 98e67ed59e1d1-34e921b7334mr26690257a91.20.1767135721380; Tue, 30
 Dec 2025 15:02:01 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:34 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-6-seanjc@google.com>
Subject: [PATCH v4 05/21] KVM: selftests: Stop setting A/D bits when creating
 EPT PTEs
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
X-CRM114-CacheID: sfid-20251230_150202_843547_918A3524 
X-CRM114-Status: GOOD (  14.69  )
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

Stop setting Accessed/Dirty bits when creating EPT entries for L2 so that
the stage-1 and stage-2 (a.k.a. TDP) page table APIs can use common code
without bleeding the EPT hack into the common APIs.

While commit 094444204570 ("selftests: kvm: add test for dirty logging
inside nested guests") is _very_ light on details, the most likely
explanation is that vmx_dirty_log_test was attempting to avoid taking an
EPT Violation on the first _write_ from L2.

  static void l2_guest_code(u64 *a, u64 *b)
  {
	READ_ONCE(*a);
	WRITE_ONCE(*a, 1);   <===
	GUEST_SYNC(true);

	...
  }

When handling read faults in the shadow MMU, KVM opportunistically creates
a writable SPTE if the mapping can be writable *and* the gPTE is dirty (or
doesn't support the Dirty bit), i.e. if KVM doesn't need to intercept
writes in order to emulate Dirty-bit updates.  By setting A/D bits in the
test's EPT entries, the above READ+WRITE will fault only on the read, and
in theory expose the bug fixed by KVM commit 1f4e5fc83a42 ("KVM: x86: fix
nested guest live migration with PML").  If the Dirty bit is NOT set, the
test will get a false pass due; though again, in theory.

However, the test is flawed (and always was, at least in the versions
posted publicly), as KVM (correctly) marks the corresponding L1 GFN as
dirty (in the dirty bitmap) when creating the writable SPTE.  I.e. without
a check on the dirty bitmap after the READ_ONCE(), the check after the
first WRITE_ONCE() will get a false pass due to the dirty bitmap/log having
been updated by the read fault, not by PML.

Furthermore, the subsequent behavior in the test's l2_guest_code()
effectively hides the flawed test behavior, as the straight writes to a
new L2 GPA fault also trigger the KVM bug, and so the test will still
detect the failure due to lack of isolation between the two testcases
(Read=>Write vs. Write=>Write).

	WRITE_ONCE(*b, 1);
	GUEST_SYNC(true);
	WRITE_ONCE(*b, 1);
	GUEST_SYNC(true);
	GUEST_SYNC(false);

Punt on fixing vmx_dirty_log_test for the moment as it will be easier to
properly fix the test once the TDP code uses the common MMU APIs, at which
point it will be trivially easy for the test to retrieve the EPT PTE and
set the Dirty bit as needed.

Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
[sean: rewrite changelog to explain the situation]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/x86/vmx.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/x86/vmx.c b/tools/testing/selftests/kvm/lib/x86/vmx.c
index 85043bb1ec4d..a3e2eae981da 100644
--- a/tools/testing/selftests/kvm/lib/x86/vmx.c
+++ b/tools/testing/selftests/kvm/lib/x86/vmx.c
@@ -432,14 +432,6 @@ void __tdp_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm,
 
 		pt = addr_gpa2hva(vm, pte->address * vm->page_size);
 	}
-
-	/*
-	 * For now mark these as accessed and dirty because the only
-	 * testcase we have needs that.  Can be reconsidered later.
-	 */
-	pte->accessed = true;
-	pte->dirty = true;
-
 }
 
 void tdp_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm,
-- 
2.52.0.351.gbe84eed79e-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
