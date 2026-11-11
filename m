Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A295D606A334
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 22:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fEIiJv24;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=dwekS5pm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9XXq+H7rCvuoqihEQrIktEyeeX0Z3KSZ00DVafUpHh0=; b=fEIiJv24IEDolgVCazwJfUD/zl
	tUQvNj6JT/Tme5DXs9XKpTVQOBt+eHvIHz5J5uu245ndDaXXAKqUf3pbNYDKp/KON91uyrLVluP4o
	T7snB8LD3RdYKgnvXmtzA4cPr/iELjw3pD8tgCO8cuRn340sOjh17GjWV2aq02Q5c0/h6ZAB1j8fH
	ShzIj0z+OnFxPQLFgChd9nqQ8cLIx/9TozgRw/v4SWUQyrkX4nteAE9wkD9GT0tuyGlkrRiUcY+zf
	l9T2Xx9qNs6IIdS7rierpyE1071ilemhJ7YA52Rk5aR25ZJ/iaR53jgNyiSusJSgAs5B+rbMqcgnQ
	pObBfZLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGod-00000007xIO-3Oto;
	Wed, 11 Nov 2026 22:29:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGoc-00000007xH4-2NCe
	for kvm-riscv@bombadil.infradead.org;
	Wed, 11 Nov 2026 22:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=pYQ14F/+fxHoO9/xGsZmzWpMCLg2l3VgkgG8NG25FZc=; b=dwekS5pmE08jICmxIc5r9J4NUF
	+UBiqr1bzFUHz4/AYzaUc0d9uqBuPjn5xzA7tZVUY0gmQHpOgk4253xcNOToEsn/x2W/Q3t3sqFGg
	ItGITbLIzEe1MKsuv3KY1fiHFof+7aU/WSpzZhyJ/37x5nvKaVeY6QzgjYtEVVWDOt3lAi1iD2b5B
	3fnMDEwKQLetpx4TnyTrn4MP99/D51MmbQ2lYHmuWewd9xTmvSijZ62LTUkT1Vb05wz0zHb1Iq1gF
	7Esnd6wYHW6SWvoYJygiVqwkq5h5bHRq99C8vHK22JqFEW06q5ShGbBrS9d3Yh4zkcmo3fSCyx3Ou
	KGglwn6A==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGoa-0000000G3o8-23CV;
	Wed, 11 Nov 2026 22:29:12 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xRGoa-0000000008q-1G9V;
	Wed, 11 Nov 2026 22:29:12 +0000
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
Subject: [PATCH 16/16] KVM: SVM: Make KVM_REQ_VMSA_PAGE_RELOAD per plane
Date: Wed, 11 Nov 2026 14:29:11 -0800
Message-ID: <20261111222911.477-17-dwmw2@infradead.org>
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

An SNP guest with multiple VMPLs gives each plane's vCPU its own VMSA,
but KVM_REQ_VMSA_PAGE_RELOAD still treats the vCPU as having one. When
guest_memfd invalidates the page behind a higher VMPL's VMSA,
sev_gmem_invalidate_range() looks only at the plane-0 vCPUs and never
asks the twin to reload. And when a twin's own reload races with an
invalidation and re-raises the request, it lands in the shared common
requests and is consumed by whichever twin runs first. That reloads
*its* VMSA and leaves the target twin entering the guest with a stale
vmsa_pa.

Mark the request KVM_REQUEST_PER_PLANE, as
KVM_REQ_UPDATE_PROTECTED_GUEST_STATE already is, so it stays with the
twin it was raised on, and have the invalidation walk every twin of
each vCPU and target the one whose VMSA GPA falls in the range. The
kick still reaches whichever twin is running, because mode is shared
in the common.

UNTESTED on SNP: build-tested only, as I have no multi-VMPL SNP host.

Fixes the VMSA reload for higher VMPLs in "kvm: sev: Allow for VMPL
level specification in AP create".

Fixes: https://lore.kernel.org/all/20260608144252.351443-58-joro@8bytes.org/
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/include/asm/kvm_host.h |  3 ++-
 arch/x86/kvm/svm/sev.c          | 21 +++++++++++++++------
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index c7471699e2af..a4912735ad3d 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -129,7 +129,8 @@
 #define KVM_REQ_HV_TLB_FLUSH \
 	KVM_ARCH_REQ_FLAGS(32, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_VMSA_PAGE_RELOAD \
-	KVM_ARCH_REQ_FLAGS(33, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
+	KVM_ARCH_REQ_FLAGS(33, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP | \
+			       KVM_REQUEST_PER_PLANE)
 #define KVM_REQ_UPDATE_PROTECTED_GUEST_STATE \
 	KVM_ARCH_REQ_FLAGS(34, KVM_REQUEST_WAIT | KVM_REQUEST_PER_PLANE)
 
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 32a4ba4ffdbb..c8a9f808dcc4 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -5682,7 +5682,13 @@ void sev_gmem_invalidate_range(struct kvm *kvm, struct kvm_gfn_range *range)
 		return;
 
 	kvm_for_each_vcpu(i, vcpu, kvm) {
+		struct kvm_vcpu *twin;
+		int p;
+
 		/*
+		 * Every plane's vCPU has its own VMSA, so check each twin and
+		 * target the request at the twin whose VMSA it is.
+		 *
 		 * Read snp_guest_vmsa_gpa without taking the vCPU's VMSA mutex
 		 * (or its generic mutex) as mmu_lock is held, i.e. this task
 		 * can't sleep.  The VMSA is invalidated outside of mmu_lock,
@@ -5691,12 +5697,15 @@ void sev_gmem_invalidate_range(struct kvm *kvm, struct kvm_gfn_range *range)
 		 * positive is benign, as a spurious request simply forces the
 		 * vCPU to re-establish its VMSA.
 		 */
-		gpa_t gpa = READ_ONCE(to_svm(vcpu)->sev_es.snp_guest_vmsa_gpa);
-
-		if (VALID_PAGE(gpa) &&
-		    gpa_to_gfn(gpa) >= range->start &&
-		    gpa_to_gfn(gpa) < range->end)
-			kvm_make_request_and_kick(KVM_REQ_VMSA_PAGE_RELOAD, vcpu);
+		vcpu_for_each_plane(vcpu->common, p, twin) {
+			gpa_t gpa = READ_ONCE(to_svm(twin)->sev_es.snp_guest_vmsa_gpa);
+
+			if (VALID_PAGE(gpa) &&
+			    gpa_to_gfn(gpa) >= range->start &&
+			    gpa_to_gfn(gpa) < range->end)
+				kvm_make_request_and_kick(KVM_REQ_VMSA_PAGE_RELOAD,
+							  twin);
+		}
 	}
 }
 
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
