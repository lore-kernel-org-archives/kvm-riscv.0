Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551AACD8CBE
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dVXYYLy8kRpJAmfumKLoBVQXGqiuSjAxha7+fvf+xe8=; b=qpnaZ0nLtRS2HU
	F3rlxdXD0PUHFcGbmnaAE/HiZTxMio/9EXlcamPuZXDQZDvElNzFYoya1B9rR4HhwpdMrRNjCmvCl
	OPNFTTZJr5qILT5ZMr/8wFVIUaTw57L8FvoBYWJIW+aMeEk2o07qEy4lZNS/EOjQHru5jCDh3D+iS
	/qiIe2XBvW5JpSCMj492mhv8Q9+a621vIqnii5aZqmSXqdiRII/bi0QqcORdqoDgE8BbbsH29ngoW
	BaugxXKezHQr0E/K30sXYFiErL4Km8Bk2jnsmrCMtHB+REQEsALepfZjeN57p6AD4OWt6LXvmNB5o
	Z7GgfzItVxQmcbZZdgBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCT-00000003qKw-3a2X;
	Mon, 08 Jun 2026 14:43:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCI-00000003pt1-0btn
	for kvm-riscv@bombadil.infradead.org;
	Mon, 08 Jun 2026 14:43:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZTBXjJEF/DsV/qcPFtiUDZ9ungvC+HRp6AGY/SyLCu0=; b=aH5Ik+Jq4shrbrbAfisVj7vvDx
	s8dJ7EWmmku6igPAPO1ZdLjhKuMITAS6VW3aNOMD5mtSzU2bSx88N9MgYjUvQA0QWyhWJ68lsoxYF
	888vQ8Pbebj3JkdGNGeB02Qwow0PBTNOjEytYHVD1BIFFmzg7vano5Jo5mVZF/9GGdfGKTbP3Dlmv
	SNj/btlCiM5aLKX/0d/p+4zOi/ZuGDHb/UgcS5HeG68143qW1i5DOI+VP28p/R04MNuBrBUPLsUfy
	RGEpcS6xJ4TUauTrhUAf3N+ZHpD2kTXRTHVFackoxWbP17s6lZcgsUqAEPHzWKnQudP0TcoSlNcdp
	2wcQkVLw==;
Received: from mail.8bytes.org ([85.214.250.239])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWbCE-0000000198t-0tjo
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:24 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id EF34E2028DF;
	Mon,  8 Jun 2026 16:43:17 +0200 (CEST)
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
Subject: [PATCH 60/60] kvm: svm: Advertise full multi-VMPL support to the SNP guest
Date: Mon,  8 Jun 2026 16:42:52 +0200
Message-ID: <20260608144252.351443-61-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_154322_480331_592597F5 
X-CRM114-Status: UNSURE (   8.26  )
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

From: Tom Lendacky <thomas.lendacky@amd.com>

Indicate full multi-VMPL support to the guest through the GHCB feature
bitmap.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
Co-developed-by: Joerg Roedel <joerg.roedel@amd.com>
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/kvm/svm/sev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 528c8bd3e8fc..0736e1c778d9 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -43,7 +43,8 @@
 #define GHCB_HV_FT_SUPPORTED	(GHCB_HV_FT_SNP			| \
 				 GHCB_HV_FT_SNP_AP_CREATION	| \
 				 GHCB_HV_FT_SNP_RINJ		| \
-				 GHCB_HV_FT_APIC_ID_LIST)
+				 GHCB_HV_FT_APIC_ID_LIST	| \
+				 GHCB_HV_FT_SNP_MULTI_VMPL)
 
 /*
  * The GHCB spec essentially states that all non-zero error codes other than
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
