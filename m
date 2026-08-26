Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978D2C5DF97
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 23:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LEx0LIZ08k+/TfDS2JErczKgm79Q3XfKnRMCJ6Nt5u8=; b=27E2WrmccIA5BI
	yK8aOC5KCV+4FyJifYfFhlidVjL7qe15MZJzpmMIs/0Ks5212nWe8KHct976ezUwwNzYLoW/V66Ui
	BSLekf16GP60BN0FoPkmlHTVN3ROVBYMBZ1nXyNDenty0SHHGCCFQBoaYXhjvDseBJBpyAMkv5LMh
	mtE+AWVfRCTS6rvZAYP8MuWtde/qb/mh6GIP/onbKYfkINzXGh7kfHn9BF3l7ExU0wBvvbJkpDAw7
	sNgKhkQrwC8mKUbIvsUyrCCp3G/alPdvsDGUqXOXFYM3/qGWT4EOiHPArxhAhoBJZRmBy/Qh8H6Xj
	fxRxBBW0PNvcRr6c+C9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMiC-000000038hg-0DRg;
	Wed, 26 Aug 2026 23:07:16 +0000
Received: from mail-pf1-x445.google.com ([2607:f8b0:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMge-000000036OS-00RW
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 23:05:46 +0000
Received: by mail-pf1-x445.google.com with SMTP id d2e1a72fcca58-84e048a801dso2173530b3a.3
        for <kvm-riscv@lists.infradead.org>; Wed, 26 Aug 2026 16:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785538; x=1788390338; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=heZN2DuvfOxZirlVdynH6v1916EkfGJKRv4e6fIVLjM=;
        b=ADBVkLKecQrkwDVl/unH5rAzGHln0tbIiRrKbcKKF1+5qcBhirK2J3L5aBoVHO/BCE
         562iODdbhK57HkByBhDF7bYQeZ7c74p4w/wpPS+jqeQ/KBzFGi63nCuWZ1Qg6EdLa01A
         rAGyz7eYmSUtsbuj4ueCrIcTDqF4AYAmZIuA7CPtbXYc66W18ZtdsXHnr9N7nSr/7Fwi
         sW4gqMoArfurWoHqtWwnL4aUTHh4eZxRigmwfejTYPnWvPtLbT6Tnd5TQIGogOOL7x59
         VU1iIMKTCv2F62rWBwGCKwEwV4N3G87SSjwTYg0hGotJqop9/rrSUgrlQv+FPljiv7bi
         FSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785538; x=1788390338;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=heZN2DuvfOxZirlVdynH6v1916EkfGJKRv4e6fIVLjM=;
        b=dugO1b4YWSYKClSUbBrhTmPV/fCcR+cidWlaO7TNCXdsncCignyu7SoYm1Zod5fQN3
         ghVB6To4aqdESuLTd8ZXKBlG2vW4aWQEIuwrbBApgy+UVS4LNAAdLkRpD53IofJwEYnM
         EeyVyhLpA8ucyYfBX+4oCq6cAZEyiAQP9iEnTIT4USQCTTCgAqjq9CTuv66HTHlxdlA1
         bdH0cZh5JqawgLJjEFzaH966kQkeMYikKy7OMsmfUCtjNOq0Yo9eMNnIDyml/XnEWrkC
         +9ld3ryLTwdIjih7K6+3wnmJ3nOxZusnJ2+QI160I32kV3CxKCPeLRJTCoQbYc3U0d49
         QeBQ==
X-Forwarded-Encrypted: i=1; AHgh+RoPiWOKzHFFaS/Ro+IPtqbKQJSRqaJSqgqEKBTq0g4V43+G0W5nVJ6S0FwEC6wv2kGP/9AcTARYZcA=@lists.infradead.org
X-Gm-Message-State: AFuF++kC8FwBLNn2791m+7qdJkm2j0nICKRPs+VpAUHCzpQLnkD2jxg5
	40Agxbc5vkTDk6LGq14ogK0O8FT6URdfPBmqB9K0YkYC2XK5lcwlHsAuuI0VZCPbJAVJD3SrTEH
	kJtrBGQ==
X-Received: from pgce14.prod.google.com ([2002:a05:6a02:1ce:b0:c9e:3c0b:5818])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:2013:b0:3d1:3c2:85b6
 with SMTP id adf61e73a8af0-3d103c28dfdmr4039415637.5.1787785538103; Wed, 26
 Aug 2026 16:05:38 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:05:09 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-19-seanjc@google.com>
Subject: [PATCH 18/20] KVM: selftests: Use TEST_ASSERT(), not assert(), in vm_get_mem_region()
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
X-CRM114-CacheID: sfid-20260826_160540_258774_654568BB 
X-CRM114-Status: UNSURE (   8.19  )
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

Use a proper selftests TEST_ASSERT() in vm_get_mem_region() so that bad
input is guaranteed to fail the test, and with the standard error message
format.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 783f060faf9e..a0cd1b6598d4 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -198,7 +198,8 @@ memslot2region(struct kvm_vm *vm, u32 memslot);
 static inline struct userspace_mem_region *vm_get_mem_region(struct kvm_vm *vm,
 							     enum kvm_mem_region_type type)
 {
-	assert(type < NR_MEM_REGIONS);
+	TEST_ASSERT(type < NR_MEM_REGIONS,
+		    "Invalid memory region type '%u'", type);
 	return memslot2region(vm, vm->memslots[type]);
 }
 
-- 
2.55.0.887.g758fc8c411-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
