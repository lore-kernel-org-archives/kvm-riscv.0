Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE26B606A89D
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 22:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wPEu3VR+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Mhmpih29
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4wRq0YLVnanz2Js5PJF0M28Kj4VGx0RxW7xd5KNXODk=; b=wPEu3VR+Kw1YMefvI0rBpfsQPb
	6NipZ9cmOR0LXDnAckhUSdC8vRIAR4hLEwUao+UB3eHxNGoRLSAMWbuSdYmtYJGPIYET+sVh2UdXb
	+WGXwozW9KIMsQdLDK6VJkiBxZAr65I1a0VMpYmPyUIJzn0ivOkuTgxcqKyo3t2NlZmaxzQ7BKILX
	VHMad5zLQJirWdj6GJCihezo6aIFyAflI26OBy27PEufnzahpKu8WtbpjxkAnVrTPBm2GzssvwzYJ
	BfNgRGaLk4rceB3h9A09DrAVJQULeyUehHau6U/6i6wcEh2SY6fEj7CMkeNCUtMIqqC8Wnsuvr1fC
	gIxox+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGof-00000007xLC-2Oxn;
	Wed, 11 Nov 2026 22:29:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGod-00000007xHC-18kY
	for kvm-riscv@bombadil.infradead.org;
	Wed, 11 Nov 2026 22:29:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=8rIcuP/4Kb5zS07YkanQvDf9xFXdSyL1L4TPZLIk6kE=; b=Mhmpih290/1F4Cy7rNJmsiv5xh
	KTagvj0bmx+Rz/i0HPD3LG1iyTt/YmhjDLkwCJ6yHvibNng59JHqE5BtJb9aKzo/MWT+/eB4oK7PQ
	eTna6CYO28WO6lwYglmDm/xSFfqkQZoizUi5y0Qaz9Ty61r0JMZdXBURF/cMtIJDbKjA9D9u3ODHa
	onjj0lnNe8MSLGmSP4n4y825566WLHZTuVs1adnPZyKyiN9uFpPP6pJgcA9XKflU+jvrFpUnayZnN
	p7k6mKovmSz+llF1OnTs1x+AEIYOdy7OnvmjDLtRjBdYbc8pE55CLndTDWfWHVu4WlK9Vz6EZ5/l6
	hHZ6kcSg==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGoa-0000000G3o6-1sWv;
	Wed, 11 Nov 2026 22:29:14 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xRGoa-0000000008m-15dz;
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
Subject: [PATCH 15/16] KVM: planes: Annotate the lockless twin-publication protocol
Date: Wed, 11 Nov 2026 14:29:10 -0800
Message-ID: <20261111222911.477-16-dwmw2@infradead.org>
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

Plane twins are published with a plain store to common->vcpus[] plus an
smp_wmb() that pairs with online_vcpus, not with twin initialisation,
while vcpu_for_each_plane() reads the slots with a bare load.  x86-TSO
hides it, but the protocol is unannotated generic code: KCSAN reports
it, and nothing stops a reordered publication from exposing a
half-initialised twin to a lockless iterator.

Publish the slot with smp_store_release(), read it with READ_ONCE() in
vcpu_for_each_plane(), and document the pairing at the iterator. The
lockless readers here are vcpu_for_each_plane() callers that walk other
vCPUs' twins, such as the APICv BLOCKIRQ recompute; the kick paths read
common->current_vcpu instead, and the Hyper-V twin lookups that also
pair with the release come later, with the VSM code.

No functional change on x86.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 include/linux/kvm_host.h | 7 ++++++-
 virt/kvm/kvm_main.c      | 9 ++++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 1f47b3bfa4bb..6922e3063ad8 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -393,9 +393,14 @@ struct kvm_vcpu_common {
 	struct kvm_vcpu_arch_common arch;
 };
 
+/*
+ * The slot read pairs with the smp_store_release() publication in
+ * kvm_vcpu_finish_common() for iterators running outside the locks that
+ * serialise twin creation.
+ */
 #define vcpu_for_each_plane(common, i, v)			\
 	for ((i) = 0; (i) < KVM_MAX_PLANES; ++(i))		\
-		if (((v) = common->vcpus[(i)]) != NULL)
+		if (((v) = READ_ONCE(common->vcpus[(i)])) != NULL)
 
 /* Tracked per plane-VCPU - used for deciding which plane-vcpu to run */
 enum kvm_vcpu_state {
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index b6bdbe5c5133..7f215822e48e 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -548,7 +548,14 @@ static int kvm_vcpu_init_common(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned
 static void kvm_vcpu_finish_common(struct kvm_vcpu *vcpu)
 {
 	WARN_ON(vcpu->common->vcpus[vcpu->plane_level] != NULL);
-	vcpu->common->vcpus[vcpu->plane_level] = vcpu;
+	/*
+	 * Publish with release semantics so that vcpu_for_each_plane()
+	 * callers running outside the locks that serialise twin creation
+	 * (such as the APICv BLOCKIRQ recompute, which walks every vCPU's
+	 * twins) observe a fully initialised vCPU through their READ_ONCE()
+	 * of the slot; the plain store relied on x86-TSO.
+	 */
+	smp_store_release(&vcpu->common->vcpus[vcpu->plane_level], vcpu);
 	smp_wmb();
 	if (vcpu->plane_level == 0) {
 		/*
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
