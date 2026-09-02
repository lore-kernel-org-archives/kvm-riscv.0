Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FC7C61DD6
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 16:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XgrDlNWgAlP+x3TjVdcNag8HIAJZSnJMqxfhT3tLZpo=; b=jKxojqAlf8b0bH
	V/krvhVSox4CQ7v8a+PNHbvsHkVI4j5u5PF8Wh0/619eo1IVfIOhoeTL/k2Ihe1zBO9bFatJyGDLL
	xJiZaJFSFSpeHkmy+DvV3CzAUJws+h2xdpWmhGHPwIvdb5lOhBZ160DykUKGBDefNTb691ZKswZrY
	+bh1HWXZJmpqCqIUUqe5bZh53UvLZcA0hNWaXjO0XBmw/T8XTnyELCCB643vAndDn6Vx32G0qodV/
	MV6DGyzLCHUI3J1CJcmg2VLapekK9tvo0Ocx+pbQn4VUGHg1H3Jp0gcRDVLlXPE0oFoR3U22zjgZR
	m6ERzV33QbcDyFB6xmhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1k-0000000FE8I-21fB;
	Wed, 02 Sep 2026 16:41:32 +0000
Received: from mail-pl1-x645.google.com ([2607:f8b0:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1f-0000000FE2A-10bN
	for kvm-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:29 +0000
Received: by mail-pl1-x645.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso17985045ad.0
        for <kvm-riscv@lists.infradead.org>; Wed, 02 Sep 2026 09:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367286; x=1788972086; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=377f8tXnWvaciY/JLF+PS/DOVpUUGqN5+0rwp4hwx/U=;
        b=XG7SBFlrsjxKL83XAopai/oXjsmyOGGQOqNoxeVoatc9yYiW9MlU+4+M95HBKTO7K8
         fpxwwv3/KSa0MYx6mXhb+L8W647s4C7bU0zOrH1BMWN85qBx0LZHOd7AXPLmarbgX0ef
         7oaPJMSxgQdENoY06v1oov3v/eu09LzfzYCBBXhRvm5NcDZ5hLl2ncsGOohsiWowAdMe
         tFCuLba2NdlGL76hfz7kxf09DX/fTh/MEPilCjFLlp3n8a1QTR3qtddqtUZ+ke0T3LFz
         /h822KGI34ab+89R8rhbyH6KaQ/URdkWCEOxrho+kWjlW1aVBujhqZlV2aOjQT/naCAd
         sM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367286; x=1788972086;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=377f8tXnWvaciY/JLF+PS/DOVpUUGqN5+0rwp4hwx/U=;
        b=i4t9L11dDbi/4OHI+6oJTZyepC+phlrowP/Hm0EC0BZNTD+2fLS42+8L3QrqztRDGF
         Babad7UQGXLyAnu5uCcxYhB5/WhRjhGxUJZU+3y7BacsafjMNj9kK2ygxW7IFjqEv+Ha
         fM3/ErKiPWsD9/Gu0wAAjd4tcllCHQ4V4vsmujCDmuJv07slp4fuiRPfJunrXrUVB2h6
         /KdOV+Tybw8PsAcGWR7fseFI5PpF+544el6QjFhaOpBKnXWDpYvf4s8vJnkDtNeIZFfc
         AhfWW2vdue1TWG6ECGgPNtJ4L8FOPCTbP0+qWJ68MSqNtAd7LxdQ2cnDNg7b+44orQ1O
         utBg==
X-Forwarded-Encrypted: i=1; AKwUvBzLjO0CKhl0/oRU3XQMJYxFkv2itnTlB9GL6sDDi2gLtxrGYZdu5BsFyJgPLSV6Htm3wjjD9C5Dah0=@lists.infradead.org
X-Gm-Message-State: AFuF++lUZrDyBq0lq7+F5SdUUFeGJAAmw3aBW/wI3EzEWyYXF3exxdfF
	pc+txctkRNjx23GDmUM68rwcpDtI1GoNKnPjOwlQrk7427MveKhTU/QGPxxCaQGI3Fjq6P6mmxe
	xSbS0Gw==
X-Received: from plru4.prod.google.com ([2002:a17:902:b284:b0:2cc:e407:8fef])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cf0d:b0:2cf:4339:aaa
 with SMTP id d9443c01a7336-2daec6d8a20mr100626665ad.12.1788367285568; Wed, 02
 Sep 2026 09:41:25 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:04 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-2-seanjc@google.com>
Subject: [PATCH v2 01/20] KVM: selftests: Use MEM_REGION_PT memslot instead of
 '0' for s390 regions/segments
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
	linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_094127_273731_D8D829C6 
X-CRM114-Status: UNSURE (   9.90  )
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

Use MEM_REGION_PT to indirectly specify memslot '0' instead of hardcoding
the memslot in s390's virtual memory allocator, as a first step towards
taking the allocation type instead of the exact, raw memslot in the
physical memory allocator.

Note, the only tests that set MEM_REGION_PT to a memslot other than '0' are
arm64-only, i.e. s390 always uses memslot '0' for page tables.

No functional change intended.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/s390/processor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/s390/processor.c b/tools/testing/selftests/kvm/lib/s390/processor.c
index a9adb3782b35..fb9dab92d4d1 100644
--- a/tools/testing/selftests/kvm/lib/s390/processor.c
+++ b/tools/testing/selftests/kvm/lib/s390/processor.c
@@ -39,7 +39,8 @@ static u64 virt_alloc_region(struct kvm_vm *vm, int ri)
 	u64 taddr;
 
 	taddr = vm_phy_pages_alloc(vm,  ri < 4 ? PAGES_PER_REGION : 1,
-				   KVM_GUEST_PAGE_TABLE_MIN_PADDR, 0);
+				   KVM_GUEST_PAGE_TABLE_MIN_PADDR,
+				   vm->memslots[MEM_REGION_PT]);
 	memset(addr_gpa2hva(vm, taddr), 0xff, PAGES_PER_REGION * vm->page_size);
 
 	return (taddr & REGION_ENTRY_ORIGIN)
-- 
2.55.0.966.g6673acef38-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
