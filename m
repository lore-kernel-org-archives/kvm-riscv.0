Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5413D5B859
	for <kvm-riscv@archiver.kernel.org>; Mon, 15 Dec 2025 16:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=eDZt9GbYlIE5G4YLWZ+hG5p3szpfaLfhdDDriUueXBc=; b=ingN5iKnb/POZZiPbK5oEFK+4D
	MI0U+zFEXrfLO9jt6A4x3MVYfATVkKvKqILKNdPuAykOgBQS9WBqqY1n6JwKJORm3Xpmbzw5ux3jF
	E+zAAXUG5+2bQQ5IJuvZl/fdQ8rC5zo/j1oXDAfADJfP2LUJXB6Bs0uyqu0gzQesHXsQc1sZXRm4r
	1ork54oyn7JcFjKq73fkqumy0uK7e0wuIpOxoz1M0WcvhVs+cSvBSXJ7gOWupEhlWCaraaFDCFWLk
	BJosUgCEo2v/tEpGVBpLLybM6ZfintZpLB/+4wSLBW5+jKrFQIlqXckndAddthPadXtsR4b3TCFOS
	JYjy8QsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBnq-000000041gx-2L8F;
	Mon, 15 Dec 2025 16:52:06 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBnl-000000041Zi-1XYu
	for kvm-riscv@lists.infradead.org;
	Mon, 15 Dec 2025 16:52:03 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4779da35d27so33280105e9.3
        for <kvm-riscv@lists.infradead.org>; Mon, 15 Dec 2025 08:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765817520; x=1766422320; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VGTJpqAtjnaQAGGRy8gsotmE8IXAZ0B2ScsPjP/ESd0=;
        b=ttkhw10ZUZGvTOT0IyEYmWyH7lBNiD9FgEUWjbN6lXBBlgiJHHata7KwI8aLg1EhVK
         Xc7eubhQZTAC80oIbAUMSayqwu7m87fyr0dVBNlVd7ME0v0SoQkt65VjKPylUxSJ2r2C
         StzwhCugFBLgtoQM8c4g4+rTsZir9DSJewkej6Fjd3jmQ6Lex9SsOMq5dT+dJvSw62Y6
         1L8YZMWh59686pcliDh/zpqSsR9nr8cUBZNAXD8kiom1NGxeEG9Rql+ukhOBroAcoUve
         ylvBE2276XLtVmZ5Xmud1Ic0uPEpo6uN0VkgdVYfzXONnM9jJQKPvTY2FJL8p1x9JYJz
         dFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765817520; x=1766422320;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VGTJpqAtjnaQAGGRy8gsotmE8IXAZ0B2ScsPjP/ESd0=;
        b=AoMaSu1yC0G8WDzpgE4bjEP3SzbnfgjgiaIey7LGwOU+q5eK4pcS41M+MukCzWsSk3
         rLl3uUo/l3hPHrV2spTY7eoK24rQVDW0PEoP7/k2OVbCZCgfrqCAH1C6LxwV6KKZoCva
         yBqFTtwmksrAR0pBvZ20A5QSi5iS4uyY8vOTBlhP/sMW8JKrX5AnmDFD47h39+EaTFHX
         HNH9DNJekfsoNCtkCnp4+9lmFfQSbmRSUfTrO1OsEgblQd+OZpMp9/TMVf+RYv/sd1j1
         B044Oa6V9DNfo2Ey1Bth0hf+HvK9XoNnp3PcyOgXNJPiIjDL4WLsmAGqLOtrfAJkijNI
         x3Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXG10JqZCmaxqzgoiykqBEKkwXNINfKbTNMD/akMwGhZoCQwVATuaGImX7r27OOtxgNWLuvpob1Mpc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4pkDn5HMJnk5UulckXfRBt0EfDI4eIZ04Nd+jyyZpxn1+c2FN
	fGOEbms+jNvxXXOEkkreuhoAuV7liXd/L+BRLOLYnr+cvIYMoxkmljMEzIkRLUmo52bAY6U4B6e
	l9g==
X-Google-Smtp-Source: AGHT+IHdmoXymTwmtDhUo4OPKD55NjfIa2ZaYkUMxOGs0DQTenx1wSRtOp2+NPGnkVJnbSiUoA2tLeeLYg==
X-Received: from wmbgz10.prod.google.com ([2002:a05:600c:888a:b0:47a:8fa6:6a57])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f89:b0:477:7a95:b971
 with SMTP id 5b1f17b1804b1-47a8f90c5b0mr124657005e9.31.1765817519823; Mon, 15
 Dec 2025 08:51:59 -0800 (PST)
Date: Mon, 15 Dec 2025 16:51:54 +0000
In-Reply-To: <20251215165155.3451819-1-tabba@google.com>
Mime-Version: 1.0
References: <20251215165155.3451819-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251215165155.3451819-5-tabba@google.com>
Subject: [PATCH v2 4/5] KVM: selftests: Move page_align() to shared header
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, tabba@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_085201_429197_78EE6C4E 
X-CRM114-Status: UNSURE (   9.06  )
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
