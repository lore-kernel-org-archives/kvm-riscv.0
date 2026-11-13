Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C3D606A31C
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 00:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h/1wPm+5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=t8lS+h1x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tVNUdGWUf5kDzN/WLz4pib6Jjl3QsyqrJ8Vx06VVMCw=; b=h/1wPm+5+ffQEgwBbWU9W25FgY
	aPhRl/jjD47DFo/C1q7v2WzRHm3jXPjt2HhrK2kEFyhFLinPIxxEYyH/2tiVcJuK/22LYu42xWLx3
	6iRNfkiH8cMoMBbgpjxxdBJS5rN6mbNmfLdvKP4vRjpGm2ACzG9OPak5ClwnpVJLRoFOMA/Vyxsr8
	IhxnnkJDt1VrEx7relRPavc3PhHMcfHRtTkeUKMBOQVwqdX217vIv+FDkXD9gsczvrzY43ZvIu7ma
	koVlQdb6/1rN4kxz4Fj0I3BNYGVG1ZSM6ypTimW1svGQ8MWdmGtWlHB3/pkQ+bSGXOiqvcxOAPLEW
	G/85z+rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfAu-0000000BIxn-1XFi;
	Fri, 13 Nov 2026 00:29:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfAs-0000000BIxg-35o7
	for kvm-riscv@bombadil.infradead.org;
	Fri, 13 Nov 2026 00:29:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=r4E+MTESEWZeubmBM7/YkvNZnlWh5Dhkmonv/pR6l2E=; b=t8lS+h1xoqqcNCX6bvUQ6GPBG3
	czOnBE3wbdobT8Xt4PbuAuPs6szpn7rX1ZYfX4KebCgyrEdTx+HfnnFUSEjMVNXqEJzWPXJPmTDzl
	G2jDnmgINPeVSnatFqidjs2yw/xK3G/hIg72zvZo1RoW1Y8u8zJnkNvxWVJ4BgNLyatu8CmydO5hT
	btrhY2LDnkjTrKfX4BmMJGovM0g0FvdzxKr8PMjjy80ZjTDzIIWr/MRyamnDb7s9yLSSP57oCwDU2
	xdsRsVcWR0GsFxCvyPbRygnISpR20u9vxhzIJfcUO5UB/u9ZCIUHDTw2v4xbZVhheW+5uC92tv89q
	ga5jTSFA==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfAq-0000000D12s-1rZk;
	Fri, 13 Nov 2026 00:29:48 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xRfAq-00000000DvP-11Bi;
	Fri, 13 Nov 2026 00:29:48 +0000
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
Subject: [PATCH 18/16] KVM: SVM: Bound the SNP plane count by the architectural VMPL limit
Date: Thu, 12 Nov 2026 17:29:48 -0700
Message-ID: <20261113002948.53522-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261111222911.477-1-dwmw2@infradead.org>
References: <20261111222911.477-1-dwmw2@infradead.org>
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

sev_snp_max_planes() reports the VMPL count straight from CPUID
0x8000001f EBX[15:12], a 4-bit field the host provides. A value above
four lets userspace create SNP planes that no VMPL switch can ever
reach, because the switch already refuses a VMPL at or above
SVM_SEV_VMPL_MAX.

Clamp the count to between one and SVM_SEV_VMPL_MAX, so that a
VM's plane count never exceeds what the architecture defines.

Fixes the plane count in "kvm: svm: Implement max_planes x86
operation".

Fixes: https://lore.kernel.org/all/20260608144252.351443-60-joro@8bytes.org/
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/svm/sev.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index c8a9f808dcc4..eefa8641100b 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -6010,8 +6010,10 @@ bool sev_snp_blocked(enum inject_type type, struct kvm_vcpu *vcpu)
 int sev_snp_max_planes(struct kvm *kvm)
 {
 	/*
-	 * CPUID 0x8000001f EBX[15:12] is host-provided data; a zero there
-	 * must not report "no planes at all" (plane 0 always exists).
+	 * CPUID 0x8000001f EBX[15:12] is host-provided data.  A zero there
+	 * must not report "no planes at all" (plane 0 always exists), and
+	 * the architecture defines no more than SVM_SEV_VMPL_MAX VMPLs, the
+	 * bound the VMPL switch already enforces.
 	 */
-	return max(vmpl_levels, 1U);
+	return clamp(vmpl_levels, 1U, SVM_SEV_VMPL_MAX);
 }
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
