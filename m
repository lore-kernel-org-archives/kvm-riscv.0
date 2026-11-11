Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFA8606A333
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 22:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3lG636xm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=r831SIFp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wsjeGbgV1L3mt7KavQz/bMvy4uWtmCA2FWJUvrufGaE=; b=3lG636xmiGbDLQbYpZ4eFD6mrQ
	W4pcWE2sB7u9Fp+ITTQsTYXXukBZMO406wYAFZIVnPaqHU3mtvvYPjdHZSl+wlZIDvm0vKADEz6w8
	YetWS+n4hvk/L2+6kRXVSj0/hbgzBF+NEjqwp1KzXDUuHqPFKPee+V4w9aOZLeWZqmPRqjHvuh0Qr
	iuRdtfu5uLVjKsDU5r9dVkmAk9ko8sK6tsTbSvWqSVfp2baEiQo5wdD9KDxjSqbKQ2lO4+4lEKdgi
	yGayIXMTXIPtL+Tj8ETomuzZb9+PzRrLr/2onGhXagKrmPWAmvzIKeAys/fHUReyEd2EyxYNSPK1j
	4N2X0Yiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGod-00000007xIe-3xg1;
	Wed, 11 Nov 2026 22:29:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGoc-00000007xH3-2N4V
	for kvm-riscv@bombadil.infradead.org;
	Wed, 11 Nov 2026 22:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=5oGviVXaj4yIpvPzalC/+nOH5ZvHArwTVGOnk6W3OXc=; b=r831SIFpUymlUnTYb61dln9ahD
	0eq+3vHkta/eyOr8OjQOrTXs4PQ2Z5nkgjHTKRBoFGNNESSqbK1xW1kMm5l6ehPgP1uky4tadiaqu
	G/LFt5CqsbRhH4+LSNf2Flu74ncwO/CqIBRgm4xFye0GNhuOlTHjWMGrg0O4AT3Yqo0JAHoucKw9s
	zmSiXequaXXxhDsMvMqtpW+qRETgkLIw6BUPW9RX1/NfDs1owEHdfQstQY/e8+JeLH+B8nTQHw686
	w2YkvByQxjnQnrL/OsQFTnkSY5h/aKlBE/Tjt2cCGWegc0Csc7Iz4QOgWEbfIWcoXvYQ/WYep07ko
	EICQHRSQ==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGoa-0000000G3nz-1WjJ;
	Wed, 11 Nov 2026 22:29:12 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xRGoa-0000000008e-0kHG;
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
Subject: [PATCH 13/16] KVM: x86: Leave TSC matching to the plane 0 vCPUs
Date: Wed, 11 Nov 2026 14:29:08 -0800
Message-ID: <20261111222911.477-14-dwmw2@infradead.org>
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

From: Mushahid Hussain <hmushi@amazon.co.uk>

KVM enables the master clock when every vCPU has a matching TSC, judged
by nr_vcpus_matched_tsc + 1 == online_vcpus.  online_vcpus counts a vCPU
once, but each of its plane vCPUs synchronizes its TSC at creation and
counts as another matching vCPU.  With one higher plane the count can
never equal the number of vCPUs again, the master clock stays off and
kvmclock loses PVCLOCK_TSC_STABLE_BIT.  Among other things the Hyper-V
reference TSC page then breaks: KVM writes sequence 0 to it, finds the
clock unstable and leaves it that way.

The planes of a vCPU share its TSC.  Give a plane vCPU its plane-0
sibling's TSC offset and generation, and leave the matching count and
generation changes to the sibling.  The offset the caller computed is
ignored: it comes from the VM-global matching window, so it differs
from the sibling's whenever the sibling is not in the current
generation, or on a host with an unstable TSC, and a host TSC write on
a plane fd would otherwise move the twin's TSC away from plane 0's.

Fixes the TSC match count for the plane vCPUs that "KVM: Implement
KVM_CREATE_VCPU ioctl for planes" creates.

Fixes: https://lore.kernel.org/all/20260608144252.351443-34-joro@8bytes.org/
Not-signed-off-by: Mushahid Hussain <hmushi@amazon.co.uk>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/x86.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index cd0e9b6cf8f7..f9adb4e81ebc 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -1366,6 +1366,35 @@ static void __kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 offset, u64 tsc,
 	if (vcpu->arch.guest_tsc_protected)
 		return;
 
+	/*
+	 * The planes of a vCPU share its TSC and online_vcpus counts the
+	 * vCPU once, so a plane vCPU neither counts as a matching vCPU nor
+	 * starts a generation; its plane 0 sibling speaks for it.  Nor may
+	 * it perturb the global matching window (last_tsc_ and
+	 * user_set_tsc): KVM_SET_MSRS is accepted on plane fds, and a TSC
+	 * write on a plane fd moving the window would corrupt the next
+	 * plane-0 write's match decision.
+	 *
+	 * Take the offset and the generation from the plane-0 sibling,
+	 * which exists by construction for a plane twin, and ignore the
+	 * caller's offset: that one comes from the VM-global matching
+	 * window, which may belong to a different vCPU's generation, and
+	 * is recomputed from elapsed time on an unstable host.  A host
+	 * TSC write on a plane fd therefore leaves the TSC alone; plane 0
+	 * owns it.
+	 */
+	if (vcpu->plane_level) {
+		struct kvm_vcpu *sibling = vcpu->common->vcpus[0];
+
+		kvm_vcpu_write_tsc_offset(vcpu, sibling->arch.l1_tsc_offset);
+		vcpu->arch.last_guest_tsc = kvm_read_l1_tsc(vcpu, rdtsc());
+
+		vcpu->arch.this_tsc_generation = sibling->arch.this_tsc_generation;
+		vcpu->arch.this_tsc_nsec = sibling->arch.this_tsc_nsec;
+		vcpu->arch.this_tsc_write = sibling->arch.this_tsc_write;
+		return;
+	}
+
 	if (user_set_tsc)
 		vcpu->kvm->arch.user_set_tsc = true;
 
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
