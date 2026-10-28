Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A9B606BFA5
	for <kvm-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 19:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YKU4QE8+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d2L7Tk1p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Glg6M8NZfAOFvP7h6Z9fxTeG0EDi/LS4HAYNz7nrb3s=; b=YKU4QE8+77QpkUYzAeAZ//R+5P
	78WtvxiR6l1VS+ZJrHBDVwkUYshyeoX1Wrn8B9j/q50q2k2r2yWa4HrqU7FQnrMthZQu8NawgQFg1
	IOMTlRwF6nQyLbwPMZo5Ncyt3hwS9fvCyue3ekF+tJIHL7g6fKGqbhrvQX1QGCN05ZIC4aVGHnh1A
	cVlvT0urEZwxsBZ5lh7v7JM4jUo+COrA10cq7wQhtZo2ftquNXk6T54NDqIAzAYaS41936icx6cId
	eTELc3VhLHxgMyfmQYQhkYj8ae7Qiy56X088ytF2Xm/shPlHo0a79p9+jpMQOYEFEJCizh7tEZSSH
	mda3xuEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8vi-00000007noa-3qyX;
	Wed, 28 Oct 2026 19:03:22 +0000
Received: from mail-pl1-x647.google.com ([2607:f8b0:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8vU-00000007nTl-0xFh
	for kvm-riscv@lists.infradead.org;
	Wed, 28 Oct 2026 19:03:09 +0000
Received: by mail-pl1-x647.google.com with SMTP id d9443c01a7336-2e60770381cso13090595ad.0
        for <kvm-riscv@lists.infradead.org>; Wed, 28 Oct 2026 12:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793214187; x=1793818987; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RloCiG6ktfajfft7oZXWWlUR2yO2W/arq16CEWx06hk=;
        b=d2L7Tk1pgFzXYESpA4PmRzfAcOjDg7egmaTYdMTZxZiVSVDiQp3gibDoxlcDeUjCwe
         E2s22EyOO2MR9iVDO5jZ+ZOE9A+TIeG4H/k9tv5ctTKmqcjzRFPPDOptd2EuHdw3D+Ec
         6ghI0DxiffUSYE7ui5XQPgJFbIIdPWLjwScX4kdgNSLKjcNAA+to3HjG8Z/uwItavBQX
         KfA80qMLxswy7/HWYjLiA3imzYiEiM51i1PtBmokWC/IMI43TC5ujoK5dE8J14PUU3o6
         yA6LJnzeYZCmaLKEibnJGoMtqKIZ7kIDgqZzGBaStEtOujZMiQGE9/waCza650l9VcKU
         u1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214187; x=1793818987;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RloCiG6ktfajfft7oZXWWlUR2yO2W/arq16CEWx06hk=;
        b=Eb+z+kvsq5UUdDQ4nH+qZlm1nujctX/AIfr+ETl3XCpSENMZAsoVcIVLdvNhRcO442
         hvoZ3O1fXDMJ3NdNPpGTuID5G7H6K51BJJ4GLBeSglSTUm6Y3bgWPvM3sZk9HlWUM6vg
         pSCtwfWhfarc3gEe/cgU4RSgXzzc3UX5fuL5ajJcVeFnqmDeG7n2pmCUTUXAhzzIiyo4
         emGO+vSWUExp9Le7zQlCzp/6c3643DD4aRu1M92mc9cfOWFEgmo5I4SNuCS4IZrb8JTU
         Aq8prhiOwhaY7Xbllets6tWuJCddKu0cqzyvHwzqiZCE4aPXvU0IOBbMWm3dU7Eu683+
         J4Vw==
X-Forwarded-Encrypted: i=1; AKwUvBxj2UYe1rgXqzpji5PBHf8dXMPmWRZebbAQ3ms9Q3bDytvHPqPFcyYSfx6ZVJbpWioxDPnNkszMFfQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYLCyzrdqPBbJm8rlxISx3bzPIe22p0M+ejV1S27ytWoMkEMNMjW
	+zcs/soLl9EGtQMqfOLAb0cfj1Hul4CYqZEgYFy4OPeYrlevcsWvrcg68kfQlNt+rPrESgQ4SUo
	uyGRssw==
X-Received: from plma18.prod.google.com ([2002:a17:902:7d92:b0:2e9:73da:58d6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d504:b0:2e8:3d48:4d92
 with SMTP id d9443c01a7336-2eb003bf1dfmr27738995ad.33.1793214186739; Wed, 28
 Oct 2026 12:03:06 -0700 (PDT)
Date: Wed, 28 Oct 2026 12:02:56 -0700
In-Reply-To: <20261028190259.1819571-1-seanjc@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261028190259.1819571-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261028190259.1819571-5-seanjc@google.com>
Subject: [PATCH 4/7] KVM: MIPS: Rework kvm_arch_vcpu_should_kick() to use
 standard implementation
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_120308_321430_96DA34F1 
X-CRM114-Status: GOOD (  11.84  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Rework MIPS' kvm_arch_vcpu_should_kick() to use the "standard" arch
implementation so that the arch hook can be dropped (MIPS is the only
arch other than PPC that implements a non-standard hook, and PPC uses the
recently added @force param when invoking __kvm_vcpu_kick() instead of
relying on kvm_arch_vcpu_should_kick()).

Convert MIPS to the standard implementation even though the code should be
unreachable (neither kvm_vcpu_kick() nor kvm_make_request_and_kick() are
used by MIPS or common KVM), so that there is a bisection point if the
code is somehow reachable.

No functional change intended (because the code is currently unreachable).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mips.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index a53abbba43ea..c37e212bc0a3 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -122,7 +122,7 @@ bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
 
 int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
 {
-	return 1;
+	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
 }
 
 int kvm_arch_enable_virtualization_cpu(void)
-- 
2.56.0.313.g2479322e68-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
