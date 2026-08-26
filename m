Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DDBC61DBE
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 23:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fGmLAxr2Dfs+jjZ8+A+Iy8Qp4oHFdkRdznLoUJSE9HA=; b=13vUcyooFKR0fQ
	D5QrVb+KpG3NQcJFYFFs6iB1ImZwdXlfcYyQdO/27+GJX/+LGfFU4Ne7ssWtdf4jG0zi7UZkBK5vO
	9X7FDKUcKyn4jiJDsM+H7ZKsPt+Gacb30OhIgvYuqo5kplJT/frGEC8t5ublV8izoGgP8uyDAEJQX
	UNFIzWPrx1Gc5u5FsPWWONR5hqBHKKan99Js82b2qcljhA2uGr4Fi9rPChGHw0VMJpVNvkxR9qh6Z
	F4EqKuXbrCycXEpnXGlPCrPSTNF1YBOBDeQhnhxzgrNtnQcaRDlLvkDxlD0KNsJ4wRmSLAIBf4q2+
	J6FUHhB/z1plLTCnFW7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMi8-000000038ZV-12P4;
	Wed, 26 Aug 2026 23:07:12 +0000
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgd-000000036OG-3Tpg
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 23:05:43 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso1492737a12.1
        for <kvm-riscv@lists.infradead.org>; Wed, 26 Aug 2026 16:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785536; x=1788390336; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GKwDIzPdhs+/PUMGOrKYMYY0J2+uedR4TSeAqB3q+w0=;
        b=bKDiZxb2P5yNknt3t1SsiiQ2+65Ub3+HB+FcEzRwrwuOVNxF8PCBQOQWnH8LMuIo+P
         HaYOzn5uoA6exBps6I4E1jkjzgXTq7HNLvJM5M5Zy8BMRpuXu1+L9sWPtmc46tMFhoBW
         Iy21RFfDyX/5vHR+SSS/ODwULXOh9UV6+o12vt76xN4SHEcpF/kEysfYHByHPvh1SZWr
         H94nU4dB7/UrEdmQiZGIM8fjJluf8TDYS3Q3pJGaW1+K7uwkTKBvfV5unSOW59890WSd
         U0/12G6XOTInG5Sz1LOz8TDvUWbPv0MO7kdtJZAR8bFx6Z1+bS18xrOgN8fLn2r5NV+d
         qS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785536; x=1788390336;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GKwDIzPdhs+/PUMGOrKYMYY0J2+uedR4TSeAqB3q+w0=;
        b=mJGZj5ZNy7HH6GtCiYRD68GEWPP+PYP0XvLdE6cWrVx9T4TB2aj5vNyoyiv3PKaGjA
         Vz2kodVyUm7gbg+cLuyV0RcEJLWNAh4Qm+41KEbgjRTAGKpCp4Vha2IKY2xtqrZ3litx
         W2uZ/V7ohOiI3xUGsMKxwM+TlkD+7pxwoNw5/wzdijlXumYxc9v3oqzE6ctQ3R305v+R
         X7L5KaXstJ3WCI58R0cKkUanOS0maynZH/Ca29qLJn6DIW2c35hgS6Qne8vkTY/1Ph9T
         PRXFSWOYcfUe+cwRpdFVuXmJA0nZXA4tGE0jWr2Wlgvu0hSEg7xxOfV7mkWs3CRmOrhp
         SPXQ==
X-Forwarded-Encrypted: i=1; AHgh+RqePC/rOEibrW2rOZVgUVHOiqdArFTyj5MexpxpfZ2ZOp1Uj1rYoNs9jYfxfyk3FJA4Gn8fgEKf3po=@lists.infradead.org
X-Gm-Message-State: AFuF++le6+h2qskby/mBUOOrcQOH8DCLD9Umu7wxvsodKVIBO1deUABX
	BlXSLCHwjF3FU9wI8uHm9L8MmNeOLIMyDW1vq54wMGuXv4AzgtZAdRK9rgE6isXToLbAvLnSMqC
	Vc6aozA==
X-Received: from pgcq30.prod.google.com ([2002:a63:751e:0:b0:cc1:c78b:a2fc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:4a97:b0:3cc:f0c7:5999
 with SMTP id adf61e73a8af0-3cf84348241mr20316754637.16.1787785535770; Wed, 26
 Aug 2026 16:05:35 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:05:07 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-17-seanjc@google.com>
Subject: [PATCH 16/20] KVM: selftests: Use TEST_EXTRA region in set memory
 region test
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Ritesh Harjani <ritesh.list@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_160540_086658_D4DC9A27 
X-CRM114-Status: GOOD (  10.27  )
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

Use the TEST_EXTRA region/memslot in the "set memory region" test instead
of a custom memslot, so that the primary vm_phy_pages_alloc() APIs can be
reworked to take a region type instead of a raw memslot.

For all intents and purposes, no functional change intended, as
vm_override_mem_region() is barely more than a wrapper for
vm_userspace_mem_region_add().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/set_memory_region_test.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index dffe9654f45b..9d21594e2f81 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -116,9 +116,9 @@ static struct kvm_vm *spawn_vm(struct kvm_vcpu **vcpu, pthread_t *vcpu_thread,
 
 	vm = vm_create_with_one_vcpu(vcpu, guest_code);
 
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS_THP,
-				    MEM_REGION_GPA, MEM_REGION_SLOT,
-				    MEM_REGION_SIZE / getpagesize(), 0);
+	vm_override_mem_region(vm, MEM_REGION_TEST_EXTRA, VM_MEM_SRC_ANONYMOUS_THP,
+			       MEM_REGION_GPA, MEM_REGION_SLOT,
+			       MEM_REGION_SIZE / getpagesize());
 
 	/*
 	 * Allocate and map two pages so that the GPA accessed by guest_code()
-- 
2.55.0.887.g758fc8c411-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
