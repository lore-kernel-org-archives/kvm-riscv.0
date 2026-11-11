Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64A7606A337
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 22:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mMoZI603;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=A/Qgv401
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4D9DxC0ov0w/+pivSSAJDS5EOT1DsVy91Wp5ukrmNQY=; b=mMoZI603V8STrPcLGdC5exUxcd
	liyzxXoUfY1rAVWXbS0RByc01mHGr1TBxEmPY/2WUpWfio8EUqqqSACXoyFG5uwzlEeY95YIwZ9be
	41y/6eceSkToegs8pLBSMhlzDqF0FzAphvZ8JqsK4Di417E8hGJJR1hVPx+UpoSimewzBMiWxtssv
	1VRifiveG9BkwWuU8AfJUGqqH0iGfXaaTGz1ZqLtnreAJNEAAijqcgFGUAnJaHaBX9x+lYQWbOUoa
	6QHO2XgzkwwAlWdiXtyNQvwqNKUs77TuLaWELI0ku6SLgRhXbO6WUXQjYgDsyjVKqM5rnLl4k9/iD
	ikaEXjmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGod-00000007xIZ-3lMV;
	Wed, 11 Nov 2026 22:29:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGoc-00000007xH6-2Mlg
	for kvm-riscv@bombadil.infradead.org;
	Wed, 11 Nov 2026 22:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=wBoZDHT0z6uhalEs33RytkDoGLTQdmaMj7+RO9mWG/g=; b=A/Qgv401Xd439MOoTlIWy/QCUX
	KkI0CNA5bjK9uvI3mC7FrQPIsPnBsOl1WzcM4u6IBagrIswEGZc1a4vg8CwxqXx6hyKG/orjReKID
	Lgczt9ZjgYx+asxZPytsfJVI2OLqITC/QhFGiKti2xuWx9ed+cgr+FDvQAmZZDzX+2VQojbOBusuL
	KtmUSmkOk+recg6loelcyEIwFpy9jVHJobd1dJ6xW9UzdD5MVUmk7WccPuzwk+hkGgRPibC21NvUB
	nT22ymAKXmFQ/02LEEAAorNIfLGw4es/AtlWw2jWalDpF5FIdRPnpYy1F3Fc17pZci3dPc+x68ZpS
	vIhN9o4Q==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGoa-0000000G3nw-0LUa;
	Wed, 11 Nov 2026 22:29:12 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xRGoZ-0000000008G-3ZWT;
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
Subject: [PATCH 07/16] KVM: x86/mmu: Free obsolete roots of all planes
Date: Wed, 11 Nov 2026 14:29:02 -0800
Message-ID: <20261111222911.477-8-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261111222911.477-1-dwmw2@infradead.org>
References: <20260608144252.351443-1-joro@8bytes.org>
 <20261111222911.477-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
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

KVM_REQ_MMU_FREE_OBSOLETE_ROOTS lives in the request set shared by all
planes of a vCPU. A fast zap (e.g. memslot deletion) invalidates
*every* plane's TDP roots and raises the request once per vCPU, but
whichever plane enters the guest next consumes the shared bit and
frees only its own obsolete roots. The other planes keep an obsolete
root with a valid-looking root.hpa, kvm_mmu_reload() does nothing for
them, and every page fault bails out in is_page_fault_stale() with
RET_PF_RETRY. The vCPU livelocks, taking the same EPT violation
forever.

Observed with a Windows VSM guest spinning at ~18k EPT violations/s
after a memslot update during boot, with the root obsolete (inv=1
obs=1) and the request already consumed (req=0).

Service every plane twin in kvm_mmu_free_obsolete_roots(). The
inactive twins cannot be running (all planes of a vCPU share one
thread), so their MMUs are stable.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/mmu/mmu.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 89cec6dd757a..e8eb1e48df36 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -6401,8 +6401,20 @@ static void __kvm_mmu_free_obsolete_roots(struct kvm *kvm, struct kvm_mmu *mmu)
 
 void kvm_mmu_free_obsolete_roots(struct kvm_vcpu *vcpu)
 {
-	__kvm_mmu_free_obsolete_roots(vcpu->kvm, &vcpu->arch.root_mmu);
-	__kvm_mmu_free_obsolete_roots(vcpu->kvm, &vcpu->arch.guest_mmu);
+	struct kvm_vcpu *v;
+	int i;
+
+	/*
+	 * KVM_REQ_MMU_FREE_OBSOLETE_ROOTS is tracked in the request set
+	 * shared by all of the vCPU's planes, so the plane that consumes
+	 * the request is not necessarily the plane whose root is obsolete.
+	 * Service every plane: the inactive twins cannot be running (all
+	 * planes of a vCPU share one thread), so their MMUs are stable.
+	 */
+	vcpu_for_each_plane(vcpu->common, i, v) {
+		__kvm_mmu_free_obsolete_roots(vcpu->kvm, &v->arch.root_mmu);
+		__kvm_mmu_free_obsolete_roots(vcpu->kvm, &v->arch.guest_mmu);
+	}
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_mmu_free_obsolete_roots);
 
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
