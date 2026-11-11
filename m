Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B5D60A260E
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 22:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JLvMaC3Q;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=S89Ev5TO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=obdBoLlm+ZVxhvJ77hnU/INBq4HhYSx2f5AcSHpTXFc=; b=JLvMaC3QXJ+WDHhIrsBFPxaPn1
	R2Ri52bDx2DXTO4kvZJI/bD9fH9nU8RUCWelLO1KjcSXO12gNTdNzctvNQEypIJh2iMuG/y8wp3uB
	7ZUprtMZSy7zpOGbbMQ+8oVwdoO86O7ISbn4Egrw1uKBhIezTenWgzebY0a1aV5BJDidga4S3e7xI
	COSqZfEVxk13M6LyxeQfJ8/WLSWKQVCZXvx6HrJxD4bHakuo8mvk96dQDFJFlAvgQSfT70nvMnbbC
	Lu/8Jbqyb3OkfFKqpUhELjhjw6y8/gdW+J5rcfuGDfqpnU0VX9YKsMOq5kyr1OH4HwvMUX+nqcDzI
	tfjCciWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGof-00000007xLs-4B41;
	Wed, 11 Nov 2026 22:29:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGoe-00000007xIQ-1xbf
	for kvm-riscv@bombadil.infradead.org;
	Wed, 11 Nov 2026 22:29:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=W87fSQlkCnHCOpy3utcFbD7aEeTD91fXvM7EUGmB8/Y=; b=S89Ev5TOPgWtVFvcEZ+48OAJIO
	XHz1eDA+g6T6JYfr9wgyxYW44qIPA8sMuP2LBy3drm3Mq6Z16AUPK4cIEXJctn0e5AK/C/ii/1BPF
	I8sHywp0m+SfQ0xUp4Ii92OiXPKnlcRyDIBGQF+a6OjjCamoqWClM6iPFWN+CGsFU0S6T+6yXOAEm
	eOqyw+qJlVgYyC6BY/D3zJSWLRDxFfI0oJ4GoGkSwhknnUlc2HminKTDEuO4NmygkjAg2Fwc9SFRK
	RWREfWfDrkmvA1BXZou0ErgSnapYQD/h+818v2lfgDVsrjTdwXB80aHIrnGH8dGLlsf4QdWgSC6r2
	vKOpUNOg==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGoc-00000009dbZ-2ABi;
	Wed, 11 Nov 2026 22:29:14 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xRGoZ-0000000007r-26M1;
	Wed, 11 Nov 2026 22:29:11 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	ashish.kalra@amd.com,
	michael.roth@amd.com,
	nsaenz@amazon.com,
	anelkz@amazon.de,
	James.Bottomley@HansenPartnership.com,
	Melody Wang <huibo.wang@amd.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	x86@kernel.org,
	coconut-svsm@lists.linux.dev,
	joerg.roedel@amd.com,
	Mushahid Hussain <hmushi@amazon.co.uk>,
	Sriram Nambakam <snambakam@linux.microsoft.com>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 01/16] KVM: s390: arm64: Pass plane_level to the kvm_set_routing_entry() stub
Date: Wed, 11 Nov 2026 14:28:56 -0800
Message-ID: <20261111222911.477-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261111222911.477-1-dwmw2@infradead.org>
References: <20260608144252.351443-1-joro@8bytes.org>
 <20261111222911.477-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
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
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

kvm_set_routing_entry() gained a plane_level argument, and every
architecture's implementation was converted except the stub in the
arm64 KVM module on s390, which arrived in the same release. An s390
build with that module then fails:

  arch/s390/kvm/arm64/arm.c:745:5: error: conflicting types for 'kvm_set_routing_entry'

Give the stub the new signature. It still refuses every routing entry.

Fixes the s390 arm64 stub that "kvm: Pass plane_level to
kvm_set_routing_entry()" did not convert.

Fixes: https://lore.kernel.org/all/20260608144252.351443-38-joro@8bytes.org/
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202611102242.ywP1yvPR-lkp@intel.com/
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/s390/kvm/arm64/arm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/s390/kvm/arm64/arm.c b/arch/s390/kvm/arm64/arm.c
index 64a609f087a8..0f0fab76e71a 100644
--- a/arch/s390/kvm/arm64/arm.c
+++ b/arch/s390/kvm/arm64/arm.c
@@ -744,7 +744,8 @@ int kvm_set_msi(struct kvm_kernel_irq_routing_entry *e, struct kvm *kvm,
 
 int kvm_set_routing_entry(struct kvm *kvm,
 			  struct kvm_kernel_irq_routing_entry *e,
-			  const struct kvm_irq_routing_entry *ue)
+			  const struct kvm_irq_routing_entry *ue,
+			  unsigned plane_level)
 {
 	return -EINVAL;
 }
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
