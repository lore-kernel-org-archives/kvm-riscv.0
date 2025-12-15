Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451AED5B16C
	for <kvm-riscv@archiver.kernel.org>; Mon, 15 Dec 2025 15:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SZ84WAfpoTQbCul5Ez6m0ulnCw98RgDrJPgnNLHtX/k=; b=KjL+iEGG0HsaanWGv1T5vSRC/x
	lFPNTtp+lUG4zzAoU2KRrOJiX2ghJWs/sJlE26U1UmdEU7QzGx3AUE4bg8hnXo7wvhK0xApYXyVps
	Rdv/+3DRLQdF/sIwyiCglyTAezYSpF+QMky6rVYKiVcqxc6UuIyVuO3eAutxnmj5mOaUg1/sWfRBo
	KWrm9eOJepe63xlQ8D3oDi9ManLRboh299No+jzYjsroNcLpUqmvuhyUqfjJ/fCWAGKkNsPWmdKhu
	p74cK4q83I2BUl9iaxMs5tUKANWEq/cpeBwJEv11u1fQIder5Z3Z/Dbta+8PICzY2FsNGpY6DxlYx
	z2+Q5RSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAvV-00000003wRD-4C6U;
	Mon, 15 Dec 2025 15:55:58 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAvP-00000003wNp-1b9w
	for kvm-riscv@lists.infradead.org;
	Mon, 15 Dec 2025 15:55:54 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-477563a0c75so23565755e9.1
        for <kvm-riscv@lists.infradead.org>; Mon, 15 Dec 2025 07:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765814149; x=1766418949; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ugLBh2wdanmYlXG/Hn2z0Lmtzfai0mPG/qbIe+jLCHk=;
        b=e6gVY8Bul0Q0j+K7/Wabl94SIkFWtWJbz40FUc3lwIbZIvTdlUHRVtBmTyW4pJisP9
         kBtND42zSEe2PfDdZG+XK/rvxjo3TFpXkrZFFz1yTZbz5QAp9Mu7+vUG48iKqaefQO5M
         p4D8HHvwGop9ximbT5h8zRsf6eRs9yqRXfaoJImJ3rG013FDfq20ETRrKIEVzCKFQJlS
         P+64W8nyXUzBK0C+I0NOpCmbHjZwQx5n8XCvEGghsEEszJlOMYiX/98Zqnqy4tNvd+uI
         qSaZcF3AO3cxHOiST0G+MtCl1cc7E6zDvs2PjE7D28HLD0rn9tPxWxoLR1/CIHVHUuF3
         7lMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765814149; x=1766418949;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ugLBh2wdanmYlXG/Hn2z0Lmtzfai0mPG/qbIe+jLCHk=;
        b=tTz2TDqwIM/TjEog618XxEaWXBCVVIRtp2QXOg2yj1QGgy/3aXRudTbI/R7LA4FHeV
         qA40FAle1N3Ki9YeKhzPgEliIep6Isaqkuhkt84ROxzEsAWml2iXxEvGvXR1DQJhe+GO
         G80Z6l4Mh78KBspYFmoY0NCqYLT1LWfE+d5A1O8s0LM+2ZEUGadRk+J9FEm1x49bbOqO
         eBxTjWBjtcD/S3iAI5lPsfMQNwRAcXGovVgI4ikN4B9My5m28NkqJcuEHlxBUB3gi05o
         Lk2eznkC9QoHPNi6PTrbRfCtPe2EpolnKntTzqxzc6X89OTx2lBsDGW6XbhZZ4as6Kpd
         cgyw==
X-Forwarded-Encrypted: i=1; AJvYcCUwHmJAEGdYX3AdjZwM/F9c/ghwwpnlIZHuCl17R/sHwTRVgaPb+sW6oZUeLVvaqF+897jKwmi8WTo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9jy80TJvKyXzw2PimfvxBqCmANZB9kGcMAy9h7NIpd/1UrwJi
	8y22KcTvDMR8nJnpawQZr+SJoWo/bIQEd9SmrRZHe8+JAgrFDJ2msDMJ6vVLPN42i17gJsw/l8C
	0Og==
X-Google-Smtp-Source: AGHT+IES4jG/AJJaQokwhO8mvkU4za0NFopEVHb/TmIMd0XerlweEG7bA0GQE5iiPaq784YzJOJCMBPrkw==
X-Received: from wmbdx17.prod.google.com ([2002:a05:600c:63d1:b0:47a:7874:d5d])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3104:b0:46e:53cb:9e7f
 with SMTP id 5b1f17b1804b1-47a8f9071aemr108797745e9.18.1765814149007; Mon, 15
 Dec 2025 07:55:49 -0800 (PST)
Date: Mon, 15 Dec 2025 15:55:42 +0000
In-Reply-To: <20251215155542.3195173-1-tabba@google.com>
Mime-Version: 1.0
References: <20251215155542.3195173-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251215155542.3195173-6-tabba@google.com>
Subject: [PATCH v1 5/5] KVM: selftests: Fix typos and stale comments in kvm_util
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Cc: tabba@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_075551_438327_24AFD3DF 
X-CRM114-Status: GOOD (  13.72  )
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
