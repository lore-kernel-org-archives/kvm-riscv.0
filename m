Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02292C47BD3
	for <kvm-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 09:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ApjkLlK7ALoblfcZRp+onjjaBOpLPOC83BmD+oRw6EY=; b=txyi26rP6FBr9+9/jq1RT+J1zX
	jY+lVcK0qbcEU3y7FSErivIgsShO6fKZn9rdtdCDmRZrke70zP10Uiq2c+ash7Z9+bQE+5sFnIQDL
	naFYP1CjWv6VWpiRI6dMatmNZx4OqAXBM3NB9ldOrbFPkeR3793GQ0YGnT/YqaCj3ck67h8nCfKMm
	NWidXXsx5j3HM+y+ObxaSKX87Rq6okiohlf9kZl5P+fqpzUnewRDqaRqt+1AFjVNz1oMlXq6TrcDV
	JkNNpvmFzKzGIcTzkkxtLrl9nE4sp0/U29Jsx75lHIZKbK6ch88IGoK98tJKqjFewI7OZarSNi+IP
	dTD3fPKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3Is-0000000Ci8w-2x2B;
	Tue, 06 Jan 2026 09:24:38 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3In-0000000Ci17-1KjY
	for kvm-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 09:24:35 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4775e00b16fso4714585e9.2
        for <kvm-riscv@lists.infradead.org>; Tue, 06 Jan 2026 01:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767691471; x=1768296271; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CY0nmexOazthmZ5H6pdtIqZB8AItwvhQd/s34gISyww=;
        b=r4HYkUSflVnX8/YqxohtRWFBt6Iu2Ad/VShi/A/8zikXP0tmWkOZ9vJ7aUpv7NEChj
         Z7Ub/pWZB6JgyFmkzfVQn5oroFmXKLANGyGXL/pWcg4oV0Wb4x4to1r8ABAwbvNwzzqN
         N9UP35iSNuP0BJUaudg7415gcyV8J7aQhRMrBSIBkdIEoFC56gcHszgtL4ebCA/IHv2p
         Izdx7iCzjxZIyp2A1rPt4xeOKeXoXzFj0cl43O7QRl4oGEolGcnlVV6tMhYZdCZAnDCl
         YJSZiA9bYUl1jXCwrLm63gYZCswhzmiawqSt+Z0IMK+6DasyvdxzoRvvSmBYEXqYO1TT
         4x1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767691471; x=1768296271;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CY0nmexOazthmZ5H6pdtIqZB8AItwvhQd/s34gISyww=;
        b=MeJen8TQKa0uU2f8pL0Wk3dcUrX4z5IGJQ7BeaCNzUfTjPEOvEXQmzeySALl3haAgB
         i1H8CMlhRkCMqaChkVo44IkT986nBAFHBwI7sy69e4LTdhuNk5PUjglDI+pHvQu7UKkK
         OUkN3nuIseDmzPmeJLH3ZJXD1AvBFpVuG5arbrmM8uyilreYFreL/P8Y5TxT9RFfhrbQ
         2RTt8CioPBGitMTP+nVAQb+dDKAkNyjGZnImmD9IQa/KKu6eV50QOTd43JY8jd9YsNsH
         CzHhDjTyHnnjZMCxarHEMiEzJEwgl9BlszW/E9Iawv6RZwh5jRiOYzcM0N3LkkZT9n1K
         /4dA==
X-Forwarded-Encrypted: i=1; AJvYcCX7W/g3E/ihfvPXPAoRWQbFbeVRojwd0u6Q4yxCdbeubLTmfl7KQZCyes4gZLzEvTttF0F/okvD9tA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWEkMyjAh3+wqVrOww34zoSCc1xEcc21Q2qCgm8h9T1wh1nPIz
	ymIJuDfsRRHM4XsuGhi2pdo/C2d/D8RNq2ybCpSDuNYjvJW766Js2GGnftmnVwFPjG4WsZD3dch
	mvw==
X-Google-Smtp-Source: AGHT+IH4a3WanlofrHZQi1TFDZ2kdHhieJiwoT4O4SCA7gXcrGwc3UiWaYl27kXqMWKHd9vR2euGSEKV6g==
X-Received: from wmsm16.prod.google.com ([2002:a05:600c:3b10:b0:479:3624:3472])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3155:b0:47b:deb9:f8a
 with SMTP id 5b1f17b1804b1-47d7f09b87cmr27122825e9.30.1767691471353; Tue, 06
 Jan 2026 01:24:31 -0800 (PST)
Date: Tue,  6 Jan 2026 09:24:25 +0000
In-Reply-To: <20260106092425.1529428-1-tabba@google.com>
Mime-Version: 1.0
References: <20260106092425.1529428-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20260106092425.1529428-6-tabba@google.com>
Subject: [PATCH v3 5/5] KVM: selftests: Fix typos and stale comments in kvm_util
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, 
	itaru.kitayama@fujitsu.com, andrew.jones@linux.dev, tabba@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_012433_387036_EEF795C0 
X-CRM114-Status: GOOD (  13.84  )
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

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
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
2.52.0.351.gbe84eed79e-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
