Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFA0C61DBE
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 23:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3d3XBniFjH6xaQneJjpNIIQKXWckkR9XFRqZPs3UcOM=; b=QCeyFbRWRAANjQ
	LGDxF9//rm5gJRg+HAUIr5yvJO6RpczACmXgDcX3IWMpwBvm2dO2GkBZgqaLvfjO0Y0Ux3Uri5gYn
	ghD8qUk/HJ/RD4Zp+UJ739DSWegEoiSqFUOCSaxnpFne61sy7vRicdGpUIgLWu9QblHYzrdOPBNUV
	JiBNuAXFIMyrERWGkac2L78D6SQJrlK/GFr2B+292G/nFeGDHRmGHj5pdRvFS1BBIJ2DE07iT6xiS
	49LZnEBnwudfLb0Gukh4KJ/F/Ikn0xpSIfAJx2JZSbGR8b8XuMyaxFy9FbpaOzjUAYdCNnznhK4Hy
	EV3mp4vbdp6YCSL12lEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgP-000000036CG-3rgV;
	Wed, 26 Aug 2026 23:05:25 +0000
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgI-0000000363c-2Q5o
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 23:05:19 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cbbb9c9bfc3so1290053a12.1
        for <kvm-riscv@lists.infradead.org>; Wed, 26 Aug 2026 16:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785517; x=1788390317; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=94pyTmilRwp00Qy5PlO0fIgUZFKJ9TnrjxcqGpSFO84=;
        b=alAJ9nRwWEdpW541qsChVbRu6rFVUYBWUFPQIgEJbbwe1J8YW7XKx+iYzugc7AkOJM
         gyou3q28uAneU3Bejf1/WH4UbMXhMF63YfidYmLlWclCC99Mngnj/uJKRNu95r0OL0Ho
         5GjB8F6yrvAsQrYGioPD4RVAl91qMN16s6tweIalcB/IS18gMgMwNX7sf1UlSfd03HSC
         EUkWMxw3/kH1t7FZRInSowR6pYZh/UU5FzczuDZQqpOptqATfZlJsg27M2ifc8xjbmq6
         +VsU9HtMegEZTdiUz9RWbu6dejU/XdRGmlft9szY6AstYGu3bn9p/0oIQcbc+9fIlx3s
         ImTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785517; x=1788390317;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=94pyTmilRwp00Qy5PlO0fIgUZFKJ9TnrjxcqGpSFO84=;
        b=EXwRHM+LC8/EZ+0/S7RipxIhffI3Hgkw/KE/lFxhVYdPtpY9Sr78hgz0Vl08nsYz3t
         BEXPwjmHUO5Jf/WzTuG6MJ1MIJwmXMSdHDqs0nDVLoX0lhcGmOYPO2xi53RNSrqy638M
         uJNrCfVYPULj1sj/XvIIVAx0FOfLjfijAVYEb6eHFv0+Cw8BAobbqmmHWsTFS1kKDuBk
         Tx9UQZ0I+OL82j5g0uQH3SLRmBLUJ9tBadeJDx8rKgCmPgllLYR37tXnWHD+SuMmkVgk
         /p8QKAaUYMECDFsfCoaszMBGmj0eAuArPvu2lsP5boQFYYJLlpfyzBpNGRZ442pcMiY7
         SevQ==
X-Forwarded-Encrypted: i=1; AHgh+RoT1/5BEdxqaHEKN1o+5u85mrhPZaE19PcHGSi1izwvepbTf7+XVmZ6d9quJSr5pcGF+u/cjsLOMNA=@lists.infradead.org
X-Gm-Message-State: AFuF++njQoDfAsfcNhpadrpE/jQh1QNzpj9GmqNkowGxrMmlFKndq7dE
	ZXD7Cce7QdHPYZw3EDAAbQRZDYFoZGPlFZUyjPg5OwsZdF9b7y6ZTXoJu/tt9XD4rj5EXZBGlXG
	Kh4bQQw==
X-Received: from pgct13.prod.google.com ([2002:a05:6a02:528d:b0:c99:5634:7551])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7008:b0:3bf:7bf7:7913
 with SMTP id adf61e73a8af0-3cf8445170emr21857267637.14.1787785516420; Wed, 26
 Aug 2026 16:05:16 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:04:53 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-3-seanjc@google.com>
Subject: [PATCH 02/20] KVM: selftests: Bump the minimum GPA for page tables to 0x200000
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
X-CRM114-CacheID: sfid-20260826_160518_674040_24782D21 
X-CRM114-Status: GOOD (  10.03  )
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

Bump selftests completely arbitrary minimum GPA for page tables from
0x180000 to 0x200000 (LoongArch's minimum), so that LoongArch can use
vm_alloc_page_table() instead of open coding a rough equivalent.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 5a7a455b5387..70906a0d1003 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -175,7 +175,7 @@ static inline struct userspace_mem_region *vm_get_mem_region(struct kvm_vm *vm,
 
 /* Minimum allocated guest virtual and physical addresses */
 #define KVM_UTIL_MIN_VADDR		0x2000
-#define KVM_GUEST_PAGE_TABLE_MIN_PADDR	0x180000
+#define KVM_GUEST_PAGE_TABLE_MIN_PADDR	0x200000
 
 #define DEFAULT_GUEST_STACK_VADDR_MIN	0xab6000
 #define DEFAULT_STACK_PGS		5
-- 
2.55.0.887.g758fc8c411-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
