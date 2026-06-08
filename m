Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8663DCD8CAD
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kHOMV46BCKWif5llRj2PLca0JxgCvAVK1dHdZdQYHgU=; b=JSA2LwIFJUO1Hc
	nHFIhKoDtvNu8vjvu/mwr4YCCp0RrF0LG5VeqdOtnPh0prRYqB8fYfGqgYTPEviGRw+dOx4/Uq3zB
	bjEFTq3KfTOFECJ90eWfV9SBrZGT/8vtOrWZPXftA/9JeKFnmYtKG/Sd/p/j3q8nbTzCJQs6eB+kS
	5idtRpMtvhWzWYarixmYXlL65a4G1Z2YZQqIyub65eJO6ok9th65dpzmfkpZnHdyLgrAgzdl19WIB
	7IPKN/N+lBX4dZOQaxMQwyqMRcJLQoKHJIfbjwLwH3YPg1PgN4JdB3WffZXwaAf2lMqP/dkIpZNnp
	5VzBcXaZbbjoUzKbyu/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCQ-00000003qCo-0LZw;
	Mon, 08 Jun 2026 14:43:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCG-00000003ppu-2MMH
	for kvm-riscv@bombadil.infradead.org;
	Mon, 08 Jun 2026 14:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Sqz6oc6V65sByVcNtBRvB28gocilrV2AZxK4TPrvyCY=; b=NYQxuZlBGolbwFSUbMNNREgvXo
	dKPp9LRDtbHbIsTOE08qwhrrXe8vOljAc7yP94SfkFszxWg/bY+tU1/Os8fF16+19YmOA5h8XV4Gw
	SRf4YCJQXFn0fLD9fke7F7485gg7XnxbNlpTLIHCgSDOfwdinVwGks2YzzrNYs82375dxqSYJkSe+
	ISOamYICJPhqfU5tJqiSsqem1ih82MrphpuzijKKoKmt7a8OgJ/Iea0aFwFEFvgBF1ZPZlp3CwwCx
	iGDgzZknzHXtMP3P12zmZOk2oYy5GsWm0IGxHpaKQsKPmgYQrnQrCPL5xdwLtEkUZB8kVk8/kcVFM
	vtg2yP4g==;
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWbCD-000000019B2-0Lv9
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:23 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id A4CBA2028D9;
	Mon,  8 Jun 2026 16:43:16 +0200 (CEST)
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
Subject: [PATCH 54/60] kvm: x86: Restrict KVM planes support to KVM_IRQCHIP_SPLIT
Date: Mon,  8 Jun 2026 16:42:46 +0200
Message-ID: <20260608144252.351443-55-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_154321_257083_9E1E3C03 
X-CRM114-Status: GOOD (  11.99  )
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

The code right now only supports plane-aware IOAPIC IRQ routing for
IRQ-chip in split mode. Enforce that restriction in the KVM x86 code.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/kvm/x86.c       | 8 ++++++--
 include/linux/kvm_host.h | 1 +
 virt/kvm/kvm_main.c      | 5 +++++
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index c6910356b061..0b9fa1059481 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -490,6 +490,10 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_x86_default_max_planes);
 
 unsigned kvm_arch_max_planes(struct kvm *kvm)
 {
+	/* For now, planes are only supported with irqchip=split */
+	if (!irqchip_split(kvm))
+		return 1;
+
 	return kvm_x86_call(max_planes)(kvm);
 }
 
@@ -6833,7 +6837,7 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 		if (cap->args[0] > KVM_MAX_IRQ_ROUTES)
 			goto split_irqchip_unlock;
 		r = -EEXIST;
-		if (irqchip_in_kernel(kvm))
+		if (irqchip_in_kernel(kvm) || kvm->has_planes)
 			goto split_irqchip_unlock;
 		if (kvm->created_vcpus)
 			goto split_irqchip_unlock;
@@ -7398,7 +7402,7 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 			goto create_irqchip_unlock;
 
 		r = -EINVAL;
-		if (kvm->created_vcpus)
+		if (kvm->created_vcpus || kvm->has_planes)
 			goto create_irqchip_unlock;
 
 		r = kvm_pic_init(kvm);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3b62fb354267..dbf81e2520f2 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -918,6 +918,7 @@ struct kvm {
 	struct list_head gpc_list;
 
 	struct kvm_plane *planes[KVM_MAX_PLANES];
+	bool has_planes;
 
 	/*
 	 * created_vcpus is protected by kvm->lock, and is incremented
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 8f1a16af519a..ff27cdbe8d92 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5477,6 +5477,10 @@ static int kvm_vm_ioctl_create_plane(struct kvm *kvm, unsigned id)
 	    WARN_ON_ONCE(id >= KVM_MAX_PLANES))
 		return -EINVAL;
 
+	/* Planes are only supported with in-kernel IRQ-chip */
+	if (!kvm_arch_irqchip_in_kernel(kvm))
+		return -EINVAL;
+
 	guard(mutex)(&kvm->lock);
 	if (kvm->planes[id])
 		return -EEXIST;
@@ -5498,6 +5502,7 @@ static int kvm_vm_ioctl_create_plane(struct kvm *kvm, unsigned id)
 		goto put_kvm;
 	}
 
+	kvm->has_planes = true;
 	fd_install(fd, file);
 	return fd;
 
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
