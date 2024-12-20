Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637A5E7718A
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 01:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B5fI3NDUfSEgyLrk1VVZ0Y+FEYbcHeYmafOe7xm7K0M=; b=w30xZq8JGjqwuJ
	YGy2HMN6Bguji3W01Xw7xxirVn854wo2F6v53giEAX6fal3cC32dC0LfrdhOh0Cv4mcer+E1jV/6Z
	xMFd9ZWwrArzVWgjUiVPYCHRQmiDVfVqoThtL+TP5T9TSVEG7mWixmq7ms+zioVoCfNGUw5k59RMh
	CmYUnAwN8ekUEcH4jzWqC54vQ3pmArki812mIQLJ0a8QMamyFbZwGMyZEi3K0DrfS5bx4QkAg81Oe
	HlyyqAte4/Vn1tr7Qkmf8Rfdz8bKlrc4qqrQckptsTnn8rlEZ3h0nIJuFcysvOInloFiLPinNyheq
	+Ir7ByNFBTyOs8Ex/r5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOS1F-00000003dq3-0gi1;
	Fri, 20 Dec 2024 01:41:33 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tORyz-00000003cwN-2EAt
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 01:39:14 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-21631cbf87dso11515035ad.3
        for <kvm-riscv@lists.infradead.org>; Thu, 19 Dec 2024 17:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734658752; x=1735263552; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=VJst1sRt7o765YHKTsyCLHu+qBA9pewJkWtnndgMLN0=;
        b=EQUSsGcrzBcoPbyjmmYM5Di9G5KIK5aIvTZD88/cuwPC3+PAQ2x+tyZOE80kKxPsdE
         /jWfp8106rWK8pYOARsMmFLWZ9LigG0gjsqFkNC8/eHn60xd8/zpFXPlC8IhTTxc0XA2
         MN1VZevsu+TMWwn3fUDEVfPE2MNeCtCSaFrZ2L4YOo8wMLbPGvBN6+Pgu0MKVAPCGdvo
         tYNKyh3TAMlLlmR7ymoGrgUoLqL+3OrmlODfYa+E+U68MK98CyjZQGVY/tm1QKkbOKiH
         TNjciH7pxOUQzfxyd7Hw9OJlF/hBf3waD2tOGTrniNYw2pie+8fg51tg166eUr4bRyd3
         Pnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734658752; x=1735263552;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJst1sRt7o765YHKTsyCLHu+qBA9pewJkWtnndgMLN0=;
        b=Ceq0iuKQqznXovs8bqI5ck7aEM5AeMjKrrHxWj2ico5ka5Fni20H4a2E2V1I+cz7/f
         KxVzwYW78dsXDwEijKD50M51e49kiniGaw93chyFj5+WSC4oSTyNtF1zOESOhjE27d9v
         TriTwH8sMPqC0rf4Y67zAOEPNWth+n5jCI8mQVQEApvXOXVQpLc84Jj/QBAuXw7uAT+r
         UHK53CgAnTrA99IFFvQld/MZgrmHCuYH5S2USispRUwhKOuFPAfe3RfAKG14tIbf8g+Q
         Wb2mVIGQzeZGXDRi9xDjq5aaZNut8uNxXhDyYTqRe9TTeNtvo4/Tr4rBimfxctxlP48W
         7XYg==
X-Forwarded-Encrypted: i=1; AJvYcCVNPutz4dGZ4ev39E0cMcsekP3E2QkXnTudLTUOCE6LZWGKg5daQ6PL725HiBHW1na5B0vIHfTT89U=@lists.infradead.org
X-Gm-Message-State: AOJu0YxsYi4wZlb9xFqM+KLnLnX0KLx0ujQ8z2/I+eF3YvzEf1fgBDld
	k/ws2ZpJ/bMFmU4pIO6wgDFzyyKpAvZbtfhpLvYMmD3Uh6cHTAnwuFhC3Gio6QXPZ8weDufIGiZ
	XIw==
X-Google-Smtp-Source: AGHT+IGsWQbkvzY4Nq8NW+TxgBWjNbfzrSia5xRKbrBdsJJ8VjsmNkZOW2nxKqNkxRXVufnLriMmB7/RPeQ=
X-Received: from plbkw12.prod.google.com ([2002:a17:902:f90c:b0:216:3e9d:6bc4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c406:b0:215:854c:a71a
 with SMTP id d9443c01a7336-219e6ebb68dmr11030635ad.34.1734658751894; Thu, 19
 Dec 2024 17:39:11 -0800 (PST)
Date: Thu, 19 Dec 2024 17:39:00 -0800
In-Reply-To: <20241220013906.3518334-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241220013906.3518334-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241220013906.3518334-3-seanjc@google.com>
Subject: [PATCH 2/8] KVM: selftests: Close VM's binary stats FD when releasing VM
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_173913_577877_A45002C1 
X-CRM114-Status: GOOD (  11.93  )
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

Close/free a VM's binary stats cache when the VM is released, not when the
VM is fully freed.  When a VM is re-created, e.g. for state save/restore
tests, the stats FD and descriptor points at the old, defunct VM.  The FD
is still valid, in that the underlying stats file won't be freed until the
FD is closed, but reading stats will always pull information from the old
VM.

Note, this is a benign bug in the current code base as none of the tests
that recreate VMs use binary stats.

Fixes: 83f6e109f562 ("KVM: selftests: Cache binary stats metadata for duration of test")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 91d295ef5d02..9138801ecb60 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -709,6 +709,15 @@ void kvm_vm_release(struct kvm_vm *vmp)
 
 	ret = close(vmp->kvm_fd);
 	TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
+
+	/* Free cached stats metadata and close FD */
+	if (vmp->stats_desc) {
+		free(vmp->stats_desc);
+		vmp->stats_desc = NULL;
+
+		ret = close(vmp->stats_fd);
+		TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
+	}
 }
 
 static void __vm_mem_region_delete(struct kvm_vm *vm,
@@ -748,12 +757,6 @@ void kvm_vm_free(struct kvm_vm *vmp)
 	if (vmp == NULL)
 		return;
 
-	/* Free cached stats metadata and close FD */
-	if (vmp->stats_desc) {
-		free(vmp->stats_desc);
-		close(vmp->stats_fd);
-	}
-
 	/* Free userspace_mem_regions. */
 	hash_for_each_safe(vmp->regions.slot_hash, ctr, node, region, slot_node)
 		__vm_mem_region_delete(vmp, region);
-- 
2.47.1.613.gc27f4b7a9f-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
