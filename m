Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20518D5B857
	for <kvm-riscv@archiver.kernel.org>; Mon, 15 Dec 2025 16:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SZ84WAfpoTQbCul5Ez6m0ulnCw98RgDrJPgnNLHtX/k=; b=cIx4WRbpLuiihJjzjU2QrHKsiP
	KgHZ/UWWfjQ4/4UXSc3DomeH8K9x4P6xARKNPvfR/WqckupFFQiPJLqSEUsygw3mu0+IPOrfdiidf
	Q7ZvuoIJbGG9XZ5F2TQ1I9w4fcbM0mtAjTX87/F6ak40olYYWkd4KbBsW8WXbL0OEgR50EIGZtAJW
	XqOkVIRujP9U0sazLrw577KDRcZ60PbZm/qSXxbBpb/g4t2yLWn4Aeqx9jY3eBAxypgGU4EontHUe
	AaLJU8diFHt5uJcTMJLN/9sfc5FtHwYJZcS9yLamqm6QxG9Tpu8YgKKLxefw/qw+z0idn43Fe7uJv
	EMiPJYBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBnq-000000041hN-3aAW;
	Mon, 15 Dec 2025 16:52:06 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBnm-000000041b5-2duI
	for kvm-riscv@lists.infradead.org;
	Mon, 15 Dec 2025 16:52:03 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4779edba8f3so25875825e9.3
        for <kvm-riscv@lists.infradead.org>; Mon, 15 Dec 2025 08:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765817521; x=1766422321; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ugLBh2wdanmYlXG/Hn2z0Lmtzfai0mPG/qbIe+jLCHk=;
        b=31sZDZvjw36XUhDAzfqg3Ghx6s2RnXvSD/fLvn60arU4TmbxUSPGai4IWztoajbNIH
         G7DT8q30z+Tl6U5ony2w6556EVrv6kAb124lEgmIM3swwuTLGRg/QGFK62VTnJ/RKJ2g
         IeWDY/HK07YQlZnK+4dUGCTtvov72RDv2WwDzHSTzC49IObyFDqOAc1wd+flfSdUejYP
         lXo8WEgzbJOgiiULaV32SEy21fSYV/E8wMKoztk7MJp1Ii9aPKj1zyq8XPDWJw9Mixtc
         7Huk+vfuWqQwxzlVrW6ig1sMFfVsVWPd9XnP0VmpUL6ObBZNaQQ4Qz4Cc0/5FRM08CGe
         UjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765817521; x=1766422321;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ugLBh2wdanmYlXG/Hn2z0Lmtzfai0mPG/qbIe+jLCHk=;
        b=IlOY4/vWYOZ3fMYAH2q17XnhgUaE6QlnTsUBNILiCR1BZVcAs7QVBSvoVlcxqA7bT2
         KO+SPWI+7pS57ZFYod/aQsr0/8AfitC6VtVbIdAlvE1vmC+3S9OEHE+ATTM/Uhf3iL0V
         Y0U4vE0XKjWYKlyRrm7E3qrfvi//iiyWSEZn1s9rhVHJWT3u8qyZ2Zw9RRwlCaTRIgFh
         oeK7a08n+srvfu3TfunzcWZYnQoag1tvpB3iyFqOGE7qz/WEHyN4XDEzHlpLUh78YNdO
         5l7dI3jAaXeF5gthG+2PF7cAEZALQoNEoTbvJP+tKu5YZwS1u4yK04nW0hSqk1DxDN3E
         D5VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKOI3gyfsHvLvEGcY+1pObpO5JNfVfSQMj3z2vBqmVO30AGdXxu9iFyC0bVusrA4k7Bq/yZuz9p2M=@lists.infradead.org
X-Gm-Message-State: AOJu0YwWkT7rEC2DIZKkfw3XcCugclPxwMVwpe1cIJai5IQ6hb4+zzB7
	MgRmg7GosJhjziBl5FNgvsEtRewjZKVMm717zr7G5iSRKzE5h2DYAPoavo/H9IrZxZ7FqgIpjKk
	3Gg==
X-Google-Smtp-Source: AGHT+IEtLqdqM2TCcz8tE6+Rp1QAj2pRxjGKZNUndLMFxKWF31WsAS2y+R/nz+ivNRonRnxHnhbxUpbtug==
X-Received: from wmxb4-n1.prod.google.com ([2002:a05:600d:8444:10b0:477:9bcb:dd8b])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8288:b0:477:a1a2:d829
 with SMTP id 5b1f17b1804b1-47a8f8c0caamr110913215e9.13.1765817520904; Mon, 15
 Dec 2025 08:52:00 -0800 (PST)
Date: Mon, 15 Dec 2025 16:51:55 +0000
In-Reply-To: <20251215165155.3451819-1-tabba@google.com>
Mime-Version: 1.0
References: <20251215165155.3451819-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251215165155.3451819-6-tabba@google.com>
Subject: [PATCH v2 5/5] KVM: selftests: Fix typos and stale comments in kvm_util
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, tabba@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_085202_710306_946465E6 
X-CRM114-Status: GOOD (  13.58  )
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

Fix minor documentation errors in `kvm_util.h` and `kvm_util.c`.

- Correct the argument description for `vcpu_args_set` in `kvm_util.h`,
  which incorrectly listed `vm` instead of `vcpu`.
- Fix a typo in the comment for `kvm_selftest_arch_init` ("exeucting" ->
  "executing").
- Correct the return value description for `vm_vaddr_unused_gap` in
  `kvm_util.c` to match the implementation, which returns an address "at
  or above" `vaddr_min`, not "at or below".

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 4 ++--
 tools/testing/selftests/kvm/lib/kvm_util.c     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index dabbe4c3b93f..e29b2cbcb82b 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -939,7 +939,7 @@ void *vcpu_map_dirty_ring(struct kvm_vcpu *vcpu);
  * VM VCPU Args Set
  *
  * Input Args:
- *   vm - Virtual Machine
+ *   vcpu - vCPU
  *   num - number of arguments
  *   ... - arguments, each of type uint64_t
  *
@@ -1264,7 +1264,7 @@ static inline uint64_t page_align(struct kvm_vm *vm, uint64_t v)
 }
 
 /*
- * Arch hook that is invoked via a constructor, i.e. before exeucting main(),
+ * Arch hook that is invoked via a constructor, i.e. before executing main(),
  * to allow for arch-specific setup that is common to all tests, e.g. computing
  * the default guest "mode".
  */
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 8279b6ced8d2..fab6b62d7810 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1351,7 +1351,7 @@ struct kvm_vcpu *__vm_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id)
  * Output Args: None
  *
  * Return:
- *   Lowest virtual address at or below vaddr_min, with at least
+ *   Lowest virtual address at or above vaddr_min, with at least
  *   sz unused bytes.  TEST_ASSERT failure if no area of at least
  *   size sz is available.
  *
-- 
2.52.0.239.gd5f0c6e74e-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
