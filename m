Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80538606A325
	for <kvm-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 14:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GntaA57P;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QwWnv18G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wj4JTrh9B5XSsTcHpAY3kg40ZHbOg+anJu9lmjrkooU=; b=GntaA57PDguFDq9IbW1uTZ68C0
	Fb9Hub/ppctOZYJ3aam93cuqUbqQZZQHtqDs2ZLZq2ZCnjQWBdDMmlMnzEfLfwSjPjx661KUfrEAJ
	CCHK5b++cpgg9ycIl9ZMM83SYrEkCrGcPG/8iIRWU1W/lqj6Gwf68sJYLKiB4XA8w8bxVDOVfSgNF
	ws7gmYK2HPmyuTzi/eH7OSoYyN4bVn0AksCpPYMklY258vVGTCrU8HHXiUs6Tm0jcVXTJdLpJd/kP
	6ShDoyThinpXZolKMwFhmusn8E00hfGAxTCFDFG/M4YUGl00HFQuqVUWUxSC9pe7yiX2SD/dGcHvA
	1fQoCSnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtzp-0000000EK6Y-0oFZ;
	Thu, 22 Oct 2026 14:42:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtzo-0000000EK5z-0yRV;
	Thu, 22 Oct 2026 14:42:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9DA1543DDB;
	Thu, 22 Oct 2026 14:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D1F1F000C1;
	Thu, 22 Oct 2026 14:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792680139;
	bh=Y/LUBFBKFZ6pOnoBKgntXD5HdgzoU+tx/ippvDPRFz8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QwWnv18GDdspYldAzA7jwq1orZiwP7kwD51CJLmUI/hA7JOIigj13YSsCGdmecAvc
	 46Af8XgaSPB0/af488hSXMzWXBZVYhz8feqjz6tYcWXLwhnafFM9RDkg39VH8qCo88
	 5tE9J8PdRTbOpIYqlb8uDjAZ2Qj03gqPOknl6+GfjnlxGEq5DXEWXRPg4qsEq/kJ1A
	 ud1/u0zwCXeBpft9qDuksliQChVPjBmBY9KSWVHGjLckqW6imzLu9eXF3Kd3bwkWip
	 9qq4z16OLDLz4mvuBRQYs+8RF3hME3KlSwqBioPcsuHFFkBOcWurQkDU9bXbu0ZLSs
	 7REL9rmOdlKLQ==
From: Sasha Levin <sashal@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Anup Patel <anup@brainfault.org>
Cc: Mark Brown <broonie@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Jinyu Tang <jinyu.tang@linux.dev>,
	Atish Patra <atish.patra@linux.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: riscv: Implement kvm_arch_pre_fault_allowed()
Date: Thu, 22 Oct 2026 10:42:16 -0400
Message-ID: <36adc119db9b30984c0df4d1846c0f29e4e46c07.1792679974.git.sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CABgObfaH4-Ud4VR=GC8giDmWGJWS-tvYSmPOs4TtWg2hm4ocqw@mail.gmail.com>
References: <CABgObfaH4-Ud4VR=GC8giDmWGJWS-tvYSmPOs4TtWg2hm4ocqw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit caa63620f9e3 ("KVM: Allow architectures to disallow pre-fault")
requires every architecture that selects KVM_GENERIC_PRE_FAULT_MEMORY to
implement kvm_arch_pre_fault_allowed(), and there is no generic default.

Commit e8b32e377951 ("KVM: riscv: Implement KVM_PRE_FAULT_MEMORY") was
written before that hook existed, so it selects the option without
implementing the hook. With both commits in the same tree, riscv builds
with KVM enabled fail to link:

  ld.lld: error: undefined symbol: kvm_arch_pre_fault_allowed
  >>> referenced by kvm_main.c
  >>>               virt/kvm/kvm_main.o:(kvm_vcpu_pre_fault_memory) in archive vmlinux.a

The riscv implementation does not refuse pre-faulting in any state, so
return 0 to keep its current behaviour.

Fixes: e8b32e377951 ("KVM: riscv: Implement KVM_PRE_FAULT_MEMORY")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Paolo, this is needed when kvm-riscv-7.4-1 is merged into kvm/next.
Feel free to squash it into the merge instead.

Mark, next-20261022 already fails to link, so linux-next needs this on
top of the kvm-riscv merge.

Build-tested with a riscv tinyconfig plus KVM=y on next-20261022 and on
kvm/next with kvm-riscv-7.4-1 merged. Not runtime tested.

 arch/riscv/kvm/mmu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index e8673cfa69668..738d9ee1eac9d 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -754,6 +754,11 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	return ret;
 }
 
+int kvm_arch_pre_fault_allowed(struct kvm_vcpu *vcpu)
+{
+	return 0;
+}
+
 long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 				    struct kvm_pre_fault_memory *range)
 {
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
