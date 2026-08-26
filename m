Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BB0C61DD3
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 23:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9fQqfefD9530wgWdf4Ns1hYZZjNBI2dQnHoBoGCaJ0w=; b=c75Ig2Q6N+PVrZ
	HTr3oDjp+UKRBKjDn4/EE6HGqz5Sp3EZc9dhC/gHa8VLOE8xnC4tzXc7d7kBqrxjw0eBy/MgT4zQe
	k+66+wvirI9IZUDKRfcdFjx9r4fMVdT9zahj5YbQwyBaBhAB28/lOlq4d9Ldah/7RKZb8dvKdaXPs
	Rqlg7evKj8SJ0Nf6gxPSve7WZpZ8h2rYSQ3fxXFWiOcGCLe/EOGycsb8Irm1gZ7e++XmvnGm21lN2
	uFcgbjDrz6oTKTbUmXkw6z5GnmdsC/qioQCedkbmeqNj4ejdnIJsRechG0iXbtnd6DFNZc6J0OKBJ
	zad67xI4VqDZAID54V5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgr-000000036pc-03PU;
	Wed, 26 Aug 2026 23:05:53 +0000
Received: from mail-pf1-x446.google.com ([2607:f8b0:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgS-000000036Dh-3TrZ
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 23:05:29 +0000
Received: by mail-pf1-x446.google.com with SMTP id d2e1a72fcca58-84e048a801dso2173291b3a.3
        for <kvm-riscv@lists.infradead.org>; Wed, 26 Aug 2026 16:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785527; x=1788390327; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O8gpVGaSftwEDfNK3yhe7P+6kzj8cM/DRvM4h41+9U8=;
        b=RyRjkBZb9HsGuhPX7PxNcomPPDF/misO9wPnsG9uSQ9lm6nseiBBOZ11XTBnTdPgtk
         8gCvdGeuyYP/xt1uV/aZhiHOPMFCynq2HZXMO/d4F58e+QeTDNHkrso2kdzKtb1K419q
         EqPK3ns6WxacqosThR/Js9xwErqDy6jsIIxe/4Gv/G+Vyi4ozEuTGD3YhARGC4RWwzpy
         WcKPQMNTOjKZ9QbRF3QlYKpgtEgq/cki8wdDsm/QvN4P7E/39kVEb0plvN/TF4jQFmfz
         VKnDBUZbp7y27KsmOeLQAvApB1P9Ht2MB2gAgAHb4BSVwPXTk9Nl5j4ImP1lXMrfaE8c
         Yj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785527; x=1788390327;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O8gpVGaSftwEDfNK3yhe7P+6kzj8cM/DRvM4h41+9U8=;
        b=rPrOwuyxmXux4IISXurDlfjBpKF+A0k1eAsFvReAF5AkdLILjarbGJVoLU4irSJGlm
         1iHDmmqkFX3XYBGpXh3XOUvd4sqXJ7g1oynKuXtGuGJjzcyxlpRGysaGvYdbWjc3Mpdi
         cl/zD+0fEcnv5DJBZEM9I6ZgEgkfToo/4UqH6PCkLbLqe0hKnO10HpiRCCtDegpXpntm
         wuyKW9biz+vk3A9BOvGe/GkPWjTQk7yE/C7se0NNc50FVqR41hXWuq8Ilyzc+RLMGMUM
         XfkyvxjMqGML2ARgZ3ZWlAWnKBRuj0gjvo/C3A84Vr+a2PSxs9gGGEnH61qURfCUb49V
         uCKw==
X-Forwarded-Encrypted: i=1; AHgh+RpSednnamY35+FrPitapzfdZZr8TgNkRfZuxDEc8OgWPyTbLwUf2CazRDSOgBwagPvFEh/dQ4Iet14=@lists.infradead.org
X-Gm-Message-State: AFuF++myCSwuxKU66NuLWU99zSLwSrszKXn8tV0uIHbMfBIfYtELbTEr
	Tth9V+8vj+vDkJdatEU0ZlEA2JWNVV6/bAzQmnYfjM3MgSpPdIR43nxhhFowmZgfNubgqKoHz+X
	xzdiWuQ==
X-Received: from pfpk15.prod.google.com ([2002:aa7:9d0f:0:b0:848:2e0e:62e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:301e:b0:848:34ad:3d6c
 with SMTP id d2e1a72fcca58-853750ccf97mr20523023b3a.15.1787785527096; Wed, 26
 Aug 2026 16:05:27 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:05:00 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-10-seanjc@google.com>
Subject: [PATCH 09/20] KVM: selftests: Use the innermost page allocator API in
 s390's IRQ routing test
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
X-CRM114-CacheID: sfid-20260826_160528_880933_11D76C08 
X-CRM114-Status: GOOD (  10.01  )
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

Use the quad-underscores page allocator in s390's IRQ routing test in
anticipation of dropping the @min_gpa param from the primary APIs.

Note, it's not entirely clear that the test *needs* to use a very magical
@min_gpa, i.e. it's possible a more elegant solution exists.  But that's a
problem for a different day.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/s390/irq_routing.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/s390/irq_routing.c b/tools/testing/selftests/kvm/s390/irq_routing.c
index f3839284ac08..cd26cc1aed80 100644
--- a/tools/testing/selftests/kvm/s390/irq_routing.c
+++ b/tools/testing/selftests/kvm/s390/irq_routing.c
@@ -36,7 +36,7 @@ static void test(void)
 	};
 
 	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
-	mem = vm_phy_pages_alloc(vm, 2, 4096 * 42, 0);
+	mem = ____vm_phy_pages_alloc(vm, 2, 4096 * 42, 0, false, false);
 
 	routing = kvm_gsi_routing_create();
 	routing->nr = 1;
-- 
2.55.0.887.g758fc8c411-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
