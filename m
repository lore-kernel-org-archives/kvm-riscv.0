Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CCDD5B847
	for <kvm-riscv@archiver.kernel.org>; Mon, 15 Dec 2025 15:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=eDZt9GbYlIE5G4YLWZ+hG5p3szpfaLfhdDDriUueXBc=; b=J9U1xRO+hNoLn84VUAfAacoYwZ
	AI1v0BWruRcCS7Fgeg3ZOhj5hyu6ERPlzN5KN1hBxKeAn+lQHJXdnntfgDwg1pUVEz8p6rO256jun
	zrMXVhHtoxzkNENB/2fHl3UisbDQDKuEmq2AYC8Q6KKlimLlTnEflZrnZWnfD8rPQuiP6Dj+w7Bdg
	dyTyGM/ydw2Ff0RCQI9KJtLURNuXjknEFw/MzS4Oh1v9bHU5N8ixbrZ59oi/Z5Y0fdOa+xZWxgkVZ
	IF1MiGQQq8Dcv4WO+wDfG0/Yz1Bkc+UPFRv01FXX9b9nGR8jegB67VlnC4xjMq6Fmai/2g8K6VDaW
	M+RhMoTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAvV-00000003wQz-0URN;
	Mon, 15 Dec 2025 15:55:57 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAvP-00000003wNl-0aLG
	for kvm-riscv@lists.infradead.org;
	Mon, 15 Dec 2025 15:55:53 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-477a11d9e67so18931995e9.2
        for <kvm-riscv@lists.infradead.org>; Mon, 15 Dec 2025 07:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765814148; x=1766418948; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VGTJpqAtjnaQAGGRy8gsotmE8IXAZ0B2ScsPjP/ESd0=;
        b=qzTgdBnZQnKe+o5cOOIT9BzKLX8OSmtmkHiSsAwQYHpcJ3t2nlYs5yvU1cv/qTwif2
         HnquJUzYSpZ1gmarBjpJSsoR/2pt5qi2HnFO6ry4RF8oXHzNW82E1OE36kQidBv7IISH
         22jWlfzGtf3XeVh6pffRdyZH9WKjkxlPNp6Kk6pjIkyOxd5ViKIXlvDmeA13VXhfsrGO
         A2UrBjKXPfGaU7yI5It0U6Ty53exU+qzCB6uOr4KuUSuOiYtjTrIPDcONbMb9gwFOC7+
         IR+3DEMVLHxjpAS4m02tXUAwPLRHhKFqwYLLC19Gjyv+ocZG0A35Qlv7WkHpSJpc/K+X
         pnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765814148; x=1766418948;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VGTJpqAtjnaQAGGRy8gsotmE8IXAZ0B2ScsPjP/ESd0=;
        b=eA5aAzX0Q0/p1YvBGvhavYd5SM3+C2DVjFTJNLgHn7iDKFkjtORPP032P0BFiVcKv8
         YAm+3v9HJfGUXQk15y/jlpxVf2vn+sB50m2pc0i3LhB0TqB+cSODwy8FxBTcx7OHoBXV
         Fwqdj6RkwyDfo1VOmTzR0tEZmww/zISNpWFN35EefluV8/o8Sbo6B/iLkYsedlAtIBrJ
         4uAwgklQu83YWPUD3FlHbsPBLDjHash6VhEx26GHCCidR9z8wbbAX3jeohOr4p7QoHQO
         szKzJSHs/DYVgiQz1S05xPXUHdoKCmhRuyPvTUs25YDQYiFKRU26cCqMzPbN+ZDAOHMV
         WQig==
X-Forwarded-Encrypted: i=1; AJvYcCX9i3E7PVsfTIV+V7NVrFgfSKMVJrCg3ucf4CP9g9e6wLJyn0T+pxAzYEMkQL7nKYlSODsLVU6396c=@lists.infradead.org
X-Gm-Message-State: AOJu0YyWeaxjVSV+3LHHazETR+iXFprovq49wNSbNP4LLHFFSjOY0ZyF
	cdP0t/6YD2grO4gb8GvvHyBV+MPgcOGwBkkXIBOs5Jjj/xi24ML2TzBE4kthiBKI3fQAdg29iWa
	zCQ==
X-Google-Smtp-Source: AGHT+IFu/CRJvcQstPKEoREXa/0twPeT8ivZ6zCy+WbZ9jQY7hKkhhHO0/GXQytwxU2TRpJWK8W7Jf62jQ==
X-Received: from wmbb8.prod.google.com ([2002:a05:600c:5888:b0:477:5a0f:1860])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a012:b0:479:3a88:de5e
 with SMTP id 5b1f17b1804b1-47a8f92029emr94229645e9.37.1765814147947; Mon, 15
 Dec 2025 07:55:47 -0800 (PST)
Date: Mon, 15 Dec 2025 15:55:41 +0000
In-Reply-To: <20251215155542.3195173-1-tabba@google.com>
Mime-Version: 1.0
References: <20251215155542.3195173-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251215155542.3195173-5-tabba@google.com>
Subject: [PATCH v1 4/5] KVM: selftests: Move page_align() to shared header
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Cc: tabba@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_075551_191191_5960D0FF 
X-CRM114-Status: UNSURE (   9.20  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

To avoid code duplication, move page_align() to the shared `kvm_util.h`
header file.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h    | 5 +++++
 tools/testing/selftests/kvm/lib/arm64/processor.c | 5 -----
 tools/testing/selftests/kvm/lib/riscv/processor.c | 5 -----
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 81f4355ff28a..dabbe4c3b93f 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -1258,6 +1258,11 @@ static inline int __vm_disable_nx_huge_pages(struct kvm_vm *vm)
 	return __vm_enable_cap(vm, KVM_CAP_VM_DISABLE_NX_HUGE_PAGES, 0);
 }
 
+static inline uint64_t page_align(struct kvm_vm *vm, uint64_t v)
+{
+	return (v + vm->page_size - 1) & ~(vm->page_size - 1);
+}
+
 /*
  * Arch hook that is invoked via a constructor, i.e. before exeucting main(),
  * to allow for arch-specific setup that is common to all tests, e.g. computing
diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
index 607a4e462984..143632917766 100644
--- a/tools/testing/selftests/kvm/lib/arm64/processor.c
+++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
@@ -21,11 +21,6 @@
 
 static vm_vaddr_t exception_handlers;
 
-static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
-{
-	return (v + vm->page_size - 1) & ~(vm->page_size - 1);
-}
-
 static uint64_t pgd_index(struct kvm_vm *vm, vm_vaddr_t gva)
 {
 	unsigned int shift = (vm->pgtable_levels - 1) * (vm->page_shift - 3) + vm->page_shift;
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index d5e8747b5e69..f8ff4bf938d9 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -26,11 +26,6 @@ bool __vcpu_has_ext(struct kvm_vcpu *vcpu, uint64_t ext)
 	return !ret && !!value;
 }
 
-static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
-{
-	return (v + vm->page_size - 1) & ~(vm->page_size - 1);
-}
-
 static uint64_t pte_addr(struct kvm_vm *vm, uint64_t entry)
 {
 	return ((entry & PGTBL_PTE_ADDR_MASK) >> PGTBL_PTE_ADDR_SHIFT) <<
-- 
2.52.0.239.gd5f0c6e74e-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
