Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E6DC624D6
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 16:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L4Th4GnEj2p/pGhpjHn4/pxk6gHCGDL+vJN8R+AiDIU=; b=N2Qgl3wg94Sbgk
	edlX7KYblqHoIz+JCKHQbnwpLgRZELiOMm91LEUr+O7FgeeW3zzBRDiH8kk4MCfUxh6UnHKtPKYWQ
	Ylx1lrdYKsGuzkk+GzPfsVicLXw48Aq1LKaV1ZX8JiuQ7lH1rQNG9BrT2d6H83+A/vj/Hd8D8MJo6
	SyMy74B2UFF/DYqYrgQvw8ZAR++k4480ingoXSFF6oAk2/TeNpg+lTSPaWYO0lOf6WPGMx7usCLHw
	p81xrJ4rbVhPQy3AhzAYXcKcIgfUSUFaXICnYAx85eQe5XG/BjxzLs4nwkeevdJxP7urabxIiTyal
	Ify/fG99sAeHUn7tW4Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o2W-0000000FFxS-1Q1b;
	Wed, 02 Sep 2026 16:42:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o23-0000000FEkc-2EI3
	for kvm-riscv@bombadil.infradead.org;
	Wed, 02 Sep 2026 16:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ff1nydjVZ5E7b5LVcCvqITlv5jcgKgSL4KOLnEEEgvQ=; b=jHWYSB/osliC758ewTEAh/5b7I
	xBuVAIwPu7QmTgogSd3bn+hD0TkwPQ/PecxuBrcsk+Xl1qyvIyhS5o8giFcpMTd6mPXio5fGCspRW
	kQ83/UZc45tngBQzPEZFvObTCvgdKoK3z8iNU6v7pax2OlM4aHfGm7p9uKvsXSQeJaiZEtxEm9eDg
	uZ4vNnyvGU1O0zSai8P2smLDx5fhVh6syYhwAl935pQOE7uHCZTtSZwtakg0siC2N7fM2gpvvYjzC
	woU688BlSEYHfD83h1M8YFlBXajD6K+rYQtXQoRTx+nMCD/6EJ2slY4xqpYwqAhwsC/UZLqAWX460
	4RaGsiVw==;
Received: from mail-pg1-x546.google.com ([2607:f8b0:4864:20::546])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1o20-0000000CDAW-2Pmj
	for kvm-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:50 +0000
Received: by mail-pg1-x546.google.com with SMTP id 41be03b00d2f7-cc1c18c775eso76016a12.0
        for <kvm-riscv@lists.infradead.org>; Wed, 02 Sep 2026 09:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367306; x=1788972106; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ff1nydjVZ5E7b5LVcCvqITlv5jcgKgSL4KOLnEEEgvQ=;
        b=iSyjBRcWRzGu1e9bYsj2gCr631naew8uj6oM9tgZB8uvsis7/ExWoDxR/DOzFdRuH7
         8ujTDC0hN/qIuLkilrUznWFtAShVAQb3K3U2hHLCE1Hgi/VJImU6PNw3+vhePmaKUcmp
         Ch3+kP9OelbIhJ0Flc1grUnZMVKSmrM97HmFwAkUvozTem90SiP0RI5WNFe3DamDJTm7
         qcIaubcesJldyvdQBOMt+hlNrDXadQCvWId+j88DaQ5SsP7ELVe76/wQo180Pg/dzDIT
         OmzH0TyA3oS3GiryvDaL9vCmGYzmibnBAy9MNZzqw0wrX593koRoozn/kOmzkbfaBrI9
         2k+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367306; x=1788972106;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ff1nydjVZ5E7b5LVcCvqITlv5jcgKgSL4KOLnEEEgvQ=;
        b=V/asjB2mvirI5sow+vMhzjaWxrpsM5kBMkbUJXB5J8gP2nR0uG4H3Wepjxflegz1+H
         ZONjUisbDmmXQG8rOWDjO6sYWehggdwlF8chLAbqZwy7r+hDJvrdua3QfbXRWiaPta8y
         uAXJd32ShCFyBusBtIGR5Edbcua00manQey+8n+tbqvBuzNu5OD04S+zeJ9xrpZH21X4
         Wzy8GgMaCV2waReArnZ2EMmP7xaaBbfo+wEQss+sejaDWzZVvRh1ruVJNWEIguQc6u/u
         FLeiZWsA/tS0Y592dMR/aPGdg27EUjo1NxIaIQkg90yuMxnpvpjmBQ3cl+aoYElHU26f
         5nPw==
X-Forwarded-Encrypted: i=1; AKwUvBzNNiXg1UkOqwz1Ty2JoZwEAdLCTK85edgG5jBiUpvKDjzgbUS5ZQtbVgZLgc5QU6AX6VNvGdvsj6M=@lists.infradead.org
X-Gm-Message-State: AFuF++kcGD7uYZHKIJRoFD6jt0RSusLS9KwywiqkS1Z3O5JKMhcnD2Yf
	5EIpE16SoLKvX9NoMOzi9s4tGlxMa4d5aQg5NDgWXes5tDOmzE9/U5Tw2RGGDVBE2IxVDyE/n0z
	GbXUFSA==
X-Received: from pjc15.prod.google.com ([2002:a17:90b:2f4f:b0:380:cd24:3a7d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1dcd:b0:398:9bd3:d6d1
 with SMTP id 98e67ed59e1d1-39b083af6fdmr384502a91.11.1788367306328; Wed, 02
 Sep 2026 09:41:46 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:21 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-19-seanjc@google.com>
Subject: [PATCH v2 18/20] KVM: selftests: Use TEST_ASSERT(), not assert(), in vm_get_mem_region()
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
X-CRM114-CacheID: sfid-20260902_174148_728134_4B4BCBEA 
X-CRM114-Status: UNSURE (   8.99  )
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

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index c9ef2e5c9971..c166fce4599c 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -200,7 +200,8 @@ memslot2region(struct kvm_vm *vm, u32 memslot);
 static inline struct userspace_mem_region *vm_get_mem_region(struct kvm_vm *vm,
 							     enum kvm_mem_region_type type)
 {
-	assert(type < NR_MEM_REGIONS);
+	TEST_ASSERT(type < NR_MEM_REGIONS,
+		    "Invalid memory region type '%u'", type);
 	return memslot2region(vm, vm->memslots[type]);
 }
 
-- 
2.55.0.966.g6673acef38-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
