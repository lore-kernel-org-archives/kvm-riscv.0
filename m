Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AE6606A33A
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 00:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VXwE8plf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=E2UibT/+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WOu8uhwemizW8qLn7tloML1oRh70OMFqk4E6hbUOVTM=; b=VXwE8plf9oR0RuiAsQ/tDpCQuM
	FPkzXcEp0XkKxAdRbDWvUNGhDMckbGPxpAYb878TU3nPPc86ltkZxBVkn8ZaLyghG00rAwjMTpZA3
	IjpuRl3k9R4FuJ0kOXCBAQ1TtEU6F3YG8BaAF48TUMC9nE14hT4H3nB9jUJYiZjLTRzA8XqLAYJMe
	I6VOk3RXfp1YJySLnDR9gn4ZH+NF2hA8FBi/RqvIdDBtUO3gW3v6gB9oq4VNL08kZHd/WpUPHVo00
	IkqvoycUE/mMRVwcpE55JCV/p7Jdhjl47BXe8kWQmSRJuZJ1Oi69TGGrS7Og948LmJD2z0rEtwiTK
	BoqVK5hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfAw-0000000BIyN-1mGH;
	Fri, 13 Nov 2026 00:29:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfAv-0000000BIxo-0AL3
	for kvm-riscv@bombadil.infradead.org;
	Fri, 13 Nov 2026 00:29:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=WUzZAc94TsS7Jml651A4i89wAxxOVIQCfAZAmZSXQi4=; b=E2UibT/+k5GThbDF7kF1kpxCWv
	3iflL7tFohUAGCfEHj7vzeKG8ozJ3nn5nLuxUjav9wzS8efjNIJ0+uTTEW/Qryp1HFnmjrkLoeURq
	af+HJwcsGTeARjxvnm+1yi/ijLHpxMB/n0oZcE5hOuvUC6hppnvXcrTk0p7esTg6pS5VYDfX1K77y
	9Rk84h7wESXJ2Yafz+0bczwrCSx6Q2VvFyNCWPw+pO/L6vdg09OQh9L8kXufrI5kla8wcPmMGLs/M
	ZPRua1PeNQs0VJHG/KqgeC2nrwrNo00TnjnBaElzeLrmgFZXSEdPpJUFFOx+e9swWCRhqnCxy+s7o
	5sU7mb2Q==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfAt-0000000AqdF-0X34;
	Fri, 13 Nov 2026 00:29:51 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xRfAq-00000000DvM-0tIh;
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
Subject: [PATCH 17/16] Documentation: kvm: Renumber KVM_CREATE_PLANE and restore the kvm_run label
Date: Thu, 12 Nov 2026 17:29:47 -0700
Message-ID: <20261113002948.53522-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261111222911.477-1-dwmw2@infradead.org>
References: <20261111222911.477-1-dwmw2@infradead.org>
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

The KVM_CREATE_PLANE section was inserted between the .. _kvm_run:
label and "5. The kvm_run structure", so the :ref:`kvm_run` in the
KVM_CAP_SYNC_REGS text now links to KVM_CREATE_PLANE. It also took the
number 4.145, which KVM_PPC_GET_COMPAT_CAPS already has, leaving 4.147
unused.

Move the label back above section 5 and number the section 4.147.

Found by a local Sashiko review.

Fixes the section placement in "Documentation: kvm: introduce "VM
plane" concept".

Fixes: https://lore.kernel.org/all/20260608144252.351443-9-joro@8bytes.org/
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 Documentation/virt/kvm/api.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index c1a6536354fd..9aa09d8a39dc 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6821,11 +6821,9 @@ if the guest_memfd memory was pinned in IOMMU page tables.
 
 See also: :ref:`KVM_SET_MEMORY_ATTRIBUTES`.
 
-.. _kvm_run:
-
 .. _KVM_CREATE_PLANE:
 
-4.145 KVM_CREATE_PLANE
+4.147 KVM_CREATE_PLANE
 ----------------------
 
 :Capability: KVM_CAP_PLANES
@@ -6843,6 +6841,8 @@ in the future may use the plane id when planes are supported by hardware (as is
 the case for VMPLs in AMD), or if KVM supports accelerated plane switch
 operations (as might be the case for Hyper-V VTLs).
 
+.. _kvm_run:
+
 5. The kvm_run structure
 ========================
 
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
