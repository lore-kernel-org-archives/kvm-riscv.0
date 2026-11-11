Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BE1606A335
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 22:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jMRJbT96;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=wCjtEbpv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=17WdgHH2qA1U/qjVJXqm6xroDUrPfBmEvF8EJlLKyCw=; b=jMRJbT96ZGS/vZH/YJ03yu36Df
	xuHWMXfQPp1JCiHNz7UXeLdB7eiR5VUIV/BO0Fn47+WZAPUhXPYVWL9WXhcQEqHpBb5m1Nf9jDkyr
	6+ivGGOqlgrPmV29w1HTNreATFExyGM7CiLvWUBckHx7bJuGb2g29T4EXWFbNMIUtdAmhkAQwZHjL
	xxDlFi/elWc5YZuIasyd5a+hP3kdXcKZfdrAVxIR6Rad5w5V6UFO5AqtoDbFJ5fiYbSU47qjVMEk2
	y48f3i9dzcifnAqMv5fRn4sAMd91FYZIgQLAfPI8JmW6r/uwVmTaeSiSGJSIm/YVeJDk0XCfqiZK4
	aiGpG4Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGoe-00000007xIm-0BDc;
	Wed, 11 Nov 2026 22:29:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGoc-00000007xHA-2NOu
	for kvm-riscv@bombadil.infradead.org;
	Wed, 11 Nov 2026 22:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=E8rVfKCMqU27RWIM2bfWVZEtsM9bj4ortAwrQwz/hPM=; b=wCjtEbpv8XHuBy6wJMmQMnzuo0
	h0jSZydE2akV5ZyvNvFU8gfabmnnX1AvPipDVPw8246mtWUuU0pqGoi9KOmi9xDMlTnWUd3RFEsvu
	wNx9R8j+Tv10A/0+n1ha9K917Mfen35ra3jusd2RJHDj8TcYgZoU6ofIr1TSFWqRK3h8Sh3fPEAxu
	svIoD7jIOopcL6q84r7feglY523gu6q+DATzxxIoGKhygr5u8wz/Bx0cJ1oknpRP3XqCD8DJW7JiH
	5OjrfuABd5NyZA3x73i3dJcjLwYlKffTZdbNWzzOmLK1VFVZZoIq5/XVZiQvOzF9Sotr67KDOwB5P
	5M3WSmmg==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGoa-0000000G3ny-1BO7;
	Wed, 11 Nov 2026 22:29:12 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xRGoa-0000000008W-0P3R;
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
Subject: [PATCH 11/16] KVM: x86: Load each plane twin while updating it after KVM_SET_CPUID
Date: Wed, 11 Nov 2026 14:29:06 -0800
Message-ID: <20261111222911.477-12-dwmw2@infradead.org>
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

kvm_vcpu_ioctl_set_cpuid() runs kvm_vcpu_after_set_cpuid() on every
plane twin, but only the calling vCPU is loaded. The vendor callback
writes VMCS/VMCB controls, and on VMX those writes go to whatever VMCS
is loaded on the current pCPU: the caller's, not the twin's. The
twin's controls shadow is updated anyway, so the stale values in its
real VMCS can never be corrected later; a twin created before
KVM_SET_CPUID2 keeps its empty-CPUID controls (RDSEED/RDRAND exiting
among them), and the guest's higher VTL takes a spurious #UD on its
first RDSEED.

Swap each twin in as the loaded vCPU for its update, and reload the
caller once at the end. Plane ioctls all share the common vCPU mutex,
so the twin cannot be loaded elsewhere concurrently. A preemption
inside the window is safe only because vcpu_load() now publishes the
loaded twin as common->current_vcpu (previous patch); before that, the
preempt notifiers would arch-put and arch-load the caller instead.

Fixes the twin updates in "kvm: x86: Update state for all plane VCPUs
after CPUID update".

Fixes: https://lore.kernel.org/all/20260608144252.351443-46-joro@8bytes.org/
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/cpuid.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index 54bcfedc5226..c9b7dfc5c967 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -501,7 +501,7 @@ static int kvm_set_cpuid(struct kvm_vcpu *vcpu, struct kvm_cpuid_entry2 *e2,
 {
 	struct kvm_vcpu_common *common = vcpu->common;
 	u32 vcpu_caps[NR_KVM_CPU_CAPS];
-	struct kvm_vcpu *v;
+	struct kvm_vcpu *v, *loaded = vcpu;
 	unsigned i;
 	int r;
 
@@ -568,9 +568,24 @@ static int kvm_set_cpuid(struct kvm_vcpu *vcpu, struct kvm_cpuid_entry2 *e2,
 #ifdef CONFIG_KVM_XEN
 		v->arch.xen.cpuid = kvm_get_hypervisor_cpuid(vcpu, XEN_SIGNATURE);
 #endif
+		/*
+		 * The ioctl loaded the calling vCPU; updating a twin's
+		 * VMCS/VMCB controls requires that twin to be the loaded
+		 * one, so swap it in for the update.
+		 */
+		if (v != loaded) {
+			vcpu_put(loaded);
+			vcpu_load(v);
+			loaded = v;
+		}
 		kvm_vcpu_after_set_cpuid(v);
 	}
 
+	if (loaded != vcpu) {
+		vcpu_put(loaded);
+		vcpu_load(vcpu);
+	}
+
 success:
 	kvfree(e2);
 	return 0;
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
