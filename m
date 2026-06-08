Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C26CD8CA4
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GiGmhK4kxPBvHVuZCsNFRR2oBwbKcPiIxmSLVBUk9Tw=; b=HNWYCSuCAzUOIn
	kmVNnCxvNKcKBcopbHEZeKsBxZljbbs1Efh8kjINRhhdvsGZUt8ARgDfCqQ5bzuIgDH5IsAKioQ68
	ZtGJfWaPeBOPbc0XucQ4ZwaFZ3HDuXVUBXgzKEte+vkSKaAQDajlduhdzxUftPS7Z+vrOzGXIni/b
	enu+9UmCZ0kqYVaqdH6q5ES1uIM0b9RDQ52q8Dl6K3/ee/CgsfH/Kei39i46TV/y7yLdxe32JFSnT
	MO5QDH0oPuCrzBrokVlMva4PZvyGf27Rmx+6QvCzM+4Mp7HVeePQWpdG7d1v6rz971a53lQ5V5kbN
	8ZpnhKGHKcisfP3cVR1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCP-00000003qBd-2LiH;
	Mon, 08 Jun 2026 14:43:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCG-00000003ppj-1X5A
	for kvm-riscv@bombadil.infradead.org;
	Mon, 08 Jun 2026 14:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SpVi5n0ud58fulsJOsECPBVkkn7UkPSLl9l/8xgX1N0=; b=Fo8YhkGzfDxdq9UGGm09x0o38y
	CAU1vPjNLkJdcnrJ03hm/M/o17sOjVFCOQnN63de6p2eUblykk0pyllGSTUVGvQvBZlITg9qxcxbo
	qdCdhjWyvG2XOfMR/dFc3bevpWEtfAlOyLDceYB5gqZiKtPfD1dp8ZZ+Ru1S/5iqtgrj2QSNjDMgD
	cpo/joOO7amnGpcR8zSSj6056t1XdPHypEdmD8dyxK+LHt1O+cZxxOm2TNTxNu5CuSW0yqXFFXtiH
	pYoKkzK7ZZr7DHiIr6LyI6YdVJ0VKy/CNPAnSF0zNerwS5/7dM3Lp9QR/civnUt9K8t17xe+7YU9D
	biGCSueA==;
Received: from mail.8bytes.org ([85.214.250.239])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWbCB-0000000199H-3OMO
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:22 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 611962028D3;
	Mon,  8 Jun 2026 16:43:15 +0200 (CEST)
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
Subject: [PATCH 48/60] kvm: x86: Make event injection VCPU requests per-plane
Date: Mon,  8 Jun 2026 16:42:40 +0200
Message-ID: <20260608144252.351443-49-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_154320_180699_BD5481A7 
X-CRM114-Status: UNSURE (   7.38  )
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

These events must be handled on the plane-vcpu that they were raised
on.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/include/asm/kvm_host.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index f30173093c44..c2651774d785 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -85,20 +85,20 @@
 						 KVM_X86_NOTIFY_VMEXIT_USER)
 
 /* x86-specific vcpu->requests bit members */
-#define KVM_REQ_MIGRATE_TIMER		KVM_ARCH_REQ(0)
+#define KVM_REQ_MIGRATE_TIMER		KVM_ARCH_PLANE_REQ(0)
 #define KVM_REQ_REPORT_TPR_ACCESS	KVM_ARCH_REQ(1)
 #define KVM_REQ_TRIPLE_FAULT		KVM_ARCH_REQ(2)
 #define KVM_REQ_MMU_SYNC		KVM_ARCH_REQ(3)
 #define KVM_REQ_CLOCK_UPDATE		KVM_ARCH_REQ(4)
 #define KVM_REQ_LOAD_MMU_PGD		KVM_ARCH_REQ(5)
-#define KVM_REQ_EVENT			KVM_ARCH_REQ(6)
+#define KVM_REQ_EVENT			KVM_ARCH_PLANE_REQ(6)
 #define KVM_REQ_APF_HALT		KVM_ARCH_REQ(7)
 #define KVM_REQ_STEAL_UPDATE		KVM_ARCH_REQ(8)
-#define KVM_REQ_NMI			KVM_ARCH_REQ(9)
-#define KVM_REQ_PMU			KVM_ARCH_REQ(10)
-#define KVM_REQ_PMI			KVM_ARCH_REQ(11)
+#define KVM_REQ_NMI			KVM_ARCH_PLANE_REQ(9)
+#define KVM_REQ_PMU			KVM_ARCH_PLANE_REQ(10)
+#define KVM_REQ_PMI			KVM_ARCH_PLANE_REQ(11)
 #ifdef CONFIG_KVM_SMM
-#define KVM_REQ_SMI			KVM_ARCH_REQ(12)
+#define KVM_REQ_SMI			KVM_ARCH_PLANE_REQ(12)
 #endif
 #define KVM_REQ_MASTERCLOCK_UPDATE	KVM_ARCH_REQ(13)
 #define KVM_REQ_MCLOCK_INPROGRESS \
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
