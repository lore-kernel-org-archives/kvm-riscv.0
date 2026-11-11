Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780A560A260F
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 22:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vtSOEnm4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=C9BSB26Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YbXGvRLmhGgQJTCGKxrBfOtCkq1l2DQc+6ZnxfeTw6E=; b=vtSOEnm46uxTKDcRwbzlmUCzLP
	v7j7kuN7b3Ra4uo/+QLRZMOcSro8ebyMsr4lFfbaSy5iH0CmNQ0c8uveZN5VspJ8AQiGxNYHrapMs
	EX3dFvE0JqdiMWJGkmCQIQPRH/kVaV7LtHef4iflg9gcb6r0VDU4aUH08osTvRAQETZBNgPbQiv6f
	e9c8hNwX4ASH6wzjOix1fy79VT3do0v4o35l/xa3/ms+uGW6N0jHFy6Uh4BpdjIc4+CkvV6r1xdOK
	J9dbhubDvff2StJ3sDkxOZx5DaZgF0iE8npGJj4XLT6qXyYHEHmitOu7ZUndFOxmnwWgLFrTDnv37
	8dR97FjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGog-00000007xMD-0FWv;
	Wed, 11 Nov 2026 22:29:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGoe-00000007xIP-1x6P
	for kvm-riscv@bombadil.infradead.org;
	Wed, 11 Nov 2026 22:29:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=oFTOekiPiKL4T1KhOTcidabBpJ5GICpNBEzlP5Id0Nc=; b=C9BSB26YSXAAAt8dotx5k4npei
	7lOaJNzIG3vNyJXet0BSEzgeND3o0kmPi8zLlvguz0/YykL482sDuJo5mz8z+C8YDdaVn4MK2U3B4
	qeX6HzVze6Jw2bKaqD+IZuDS2A3FuaC92BrhMw3foF5vgGYk+QRLIbK+f2hyKYzpveDgRgWatXglx
	h9pgQtP9oXDL5gAGu1XPX2UhzPHdc6RiKTRcuWp+xsEd9gXZS14E6bSCqwHCYvenocTcMtqgTsRJB
	COcg+iRyM2waOsPu0BXkMhP1pEY/pF5Y6CDua+bGhd0RA33jBQwPEwTLAMZ+oLBw3uSlm0MnChIqM
	H2YjHJWg==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGoc-00000009dbd-2A1k;
	Wed, 11 Nov 2026 22:29:14 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xRGoa-0000000008a-0ZfS;
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
Subject: [PATCH 12/16] KVM: VMX: Leave the IPIv PID-table entry to the plane 0 vCPU
Date: Wed, 11 Nov 2026 14:29:07 -0800
Message-ID: <20261111222911.477-13-dwmw2@infradead.org>
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

The IPI virtualization PID table is indexed by vCPU ID, and a plane
vCPU has the same vCPU ID as its plane 0 twin. vmx_vcpu_create() for a
twin therefore repoints plane 0's entry at the twin's posted-interrupt
descriptor, and vmx_vcpu_free() for a twin (including the error path
of a failed KVM_CREATE_VCPU on a plane fd) clears it. Plane 0 is left
with no valid entry, or one naming a freed descriptor.

Nothing consumes the table while that is the case today: a VM with
planes has APICv inhibited, so IPIv stays off. But the entry must not
depend on that. Fill and clear it for the plane 0 vCPU only.

Fixes the IPIv PID-table handling for the plane vCPUs that "KVM:
Implement KVM_CREATE_VCPU ioctl for planes" creates.

Fixes: https://lore.kernel.org/all/20260608144252.351443-34-joro@8bytes.org/
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/vmx/vmx.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 44d0e8eba45b..591c7745e3e9 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7525,7 +7525,8 @@ void vmx_vcpu_free(struct kvm_vcpu *vcpu)
 	free_loaded_vmcs(vmx->loaded_vmcs);
 	free_page((unsigned long)vmx->ve_info);
 
-	if (vmx_can_use_ipiv(vcpu))
+	/* See vmx_vcpu_create(): only the plane 0 vCPU owns the entry. */
+	if (vmx_can_use_ipiv(vcpu) && !vcpu->plane_level)
 		WRITE_ONCE(to_kvm_vmx(vcpu->kvm)->pid_table[vcpu->vcpu_id], 0);
 }
 
@@ -7614,7 +7615,12 @@ int vmx_vcpu_create(struct kvm_vcpu *vcpu)
 		vmx->ve_info = page_to_virt(page);
 	}
 
-	if (vmx_can_use_ipiv(vcpu))
+	/*
+	 * The PID table is indexed by vCPU ID, which a plane vCPU shares
+	 * with its plane 0 twin: only plane 0 fills the entry, or creating
+	 * (and freeing) a twin would repoint (and clear) plane 0's.
+	 */
+	if (vmx_can_use_ipiv(vcpu) && !vcpu->plane_level)
 		WRITE_ONCE(to_kvm_vmx(vcpu->kvm)->pid_table[vcpu->vcpu_id],
 			   __pa(&vmx->vt.pi_desc) | PID_TABLE_ENTRY_VALID);
 
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
