Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B9FCD8CAB
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bKjx2vwFZsZguTtWdvfBRtCxyRhhN4SMBXfB1Bko2dk=; b=yLIDbyhOGtbefC
	FmH/NM/qh57+mARMXRY2wEUYl4HOZ0cDpxwGHmydMGT/Taz984yIBYiBypfh4TpwkuRQIrX9/Yr78
	7uR6r0Mv9N+PIDTNEY5rgO0UzSSZVuE9QCpUrav41bxl61KlFo8XygD6+e9LpxmeWpFenWCt+Cr+B
	HkoiQlz+Pe6Hdr+SMRcU7dwH9yYWO0U6P3NLqOXrxVmZioiCAGYkPhEaLQrVsBiMuZhjmLbw5jk3P
	2ayoEA4HxUKZzuS2t+kkmknvAnJl4EkhLn2lOaIobhWlrYkty//6tTuCjbieQJSYlwxjHRr6D63p/
	GtY0llVf137x0IvK3E+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCE-00000003pmT-0o3W;
	Mon, 08 Jun 2026 14:43:22 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbC6-00000003pTK-3VcZ
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:17 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 8C9352028B7;
	Mon,  8 Jun 2026 16:43:09 +0200 (CEST)
From: =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
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
	joerg.roedel@amd.com
Subject: [PATCH 21/60] kvm: Introduce per-plane VCPU requests
Date: Mon,  8 Jun 2026 16:42:13 +0200
Message-ID: <20260608144252.351443-22-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074315_087111_5B923913 
X-CRM114-Status: UNSURE (   9.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

From: Joerg Roedel <joerg.roedel@amd.com>

The bitfield layout is shared with the global vcpu->common->requests
field. A new flag will indicate in which bitmap the request will be
set.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 include/linux/kvm_host.h | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 7704820986da..3c72a462ccfa 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -159,6 +159,7 @@ static inline bool kvm_is_error_gpa(gpa_t gpa)
 #define KVM_REQUEST_NO_WAKEUP      BIT(8)
 #define KVM_REQUEST_WAIT           BIT(9)
 #define KVM_REQUEST_NO_ACTION      BIT(10)
+#define KVM_REQUEST_PER_PLANE      BIT(11)
 /*
  * Architecture-independent vcpu->requests bit members
  * Bits 3-7 are reserved for more arch-independent bits.
@@ -184,6 +185,7 @@ static inline bool kvm_is_error_gpa(gpa_t gpa)
 	(unsigned)(((nr) + KVM_REQUEST_ARCH_BASE) | (flags)); \
 })
 #define KVM_ARCH_REQ(nr)           KVM_ARCH_REQ_FLAGS(nr, 0)
+#define KVM_ARCH_PLANE_REQ(nr)     KVM_ARCH_REQ_FLAGS(nr, KVM_REQUEST_PER_PLANE)
 
 bool kvm_make_vcpus_request_mask(struct kvm *kvm, unsigned int req,
 				 unsigned long *vcpu_bitmap);
@@ -371,6 +373,10 @@ struct kvm_vcpu {
 	int sigset_active;
 	sigset_t sigset;
 	unsigned int halt_poll_ns;
+
+	u64 plane_requests;
+
+	/* S390 only */
 	bool valid_wakeup;
 
 #ifdef CONFIG_HAS_IOMEM
@@ -2356,7 +2362,10 @@ static inline void __kvm_make_request(int req, struct kvm_vcpu *vcpu)
 	 * caller.  Paired with the smp_mb__after_atomic in kvm_check_request.
 	 */
 	smp_wmb();
-	set_bit(req & KVM_REQUEST_MASK, (void *)&vcpu->common->requests);
+	if (req & KVM_REQUEST_PER_PLANE)
+		set_bit(req & KVM_REQUEST_MASK, (void *)&vcpu->plane_requests);
+	else
+		set_bit(req & KVM_REQUEST_MASK, (void *)&vcpu->common->requests);
 }
 
 static __always_inline void kvm_make_request(int req, struct kvm_vcpu *vcpu)
@@ -2382,17 +2391,23 @@ static inline void kvm_make_request_and_kick(int req, struct kvm_vcpu *vcpu)
 
 static inline bool kvm_request_pending(struct kvm_vcpu *vcpu)
 {
-	return READ_ONCE(vcpu->common->requests);
+	return READ_ONCE(vcpu->common->requests) || READ_ONCE(vcpu->plane_requests);
 }
 
 static inline bool kvm_test_request(int req, struct kvm_vcpu *vcpu)
 {
-	return test_bit(req & KVM_REQUEST_MASK, (void *)&vcpu->common->requests);
+	if (req & KVM_REQUEST_PER_PLANE)
+		return test_bit(req & KVM_REQUEST_MASK, (void *)&vcpu->plane_requests);
+	else
+		return test_bit(req & KVM_REQUEST_MASK, (void *)&vcpu->common->requests);
 }
 
 static inline void kvm_clear_request(int req, struct kvm_vcpu *vcpu)
 {
-	clear_bit(req & KVM_REQUEST_MASK, (void *)&vcpu->common->requests);
+	if (req & KVM_REQUEST_PER_PLANE)
+		clear_bit(req & KVM_REQUEST_MASK, (void *)&vcpu->plane_requests);
+	else
+		clear_bit(req & KVM_REQUEST_MASK, (void *)&vcpu->common->requests);
 }
 
 static inline bool kvm_check_request(int req, struct kvm_vcpu *vcpu)
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
