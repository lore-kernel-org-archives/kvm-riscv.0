Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A5C60A263F
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 22:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jL5l7RV9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=GTTbU0sn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/etfNV6OogGlMEzjAAJyuDMcR7+ViGk60SP2DjrArTA=; b=jL5l7RV995XmNVb6tsvtXtr874
	8AjJ+bLqgaWGud9WaZ5dAMuYbQeOVF0EU6Y8m1q/2cL4dRAHY9KOgCujOx21awH1aB5CSJyeKpaPF
	Ps4KybiqV1rdmdAm79IQdbScE208Oa9Y4dQX3taTWpKAinJLnkxiHeaaQYko2agp9RCRAs2MdvZkX
	gS0IDp3/K4jDGkW34nXlONr1Az/4PMaXf8wTxoFNNOddWZbIuWgHw4XO8A1QOhbnt37JLa/VS9Nb+
	/BQttHdPbVU8Er+dN2E/i9YrAwTim4pI9K7TYtNZGKnPvlNzdh/7n1ySr8+nS9V8Oz7XGQ7EScaUA
	TP945BJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGog-00000007xMz-25dW;
	Wed, 11 Nov 2026 22:29:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGoe-00000007xIT-25UA
	for kvm-riscv@bombadil.infradead.org;
	Wed, 11 Nov 2026 22:29:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=8qybenYqvG8G9PhMhPtpqHZ056gMFT0pwcSnxKT9iyE=; b=GTTbU0snO/nUQajge+xBq1MFqg
	QCVuIo3EK60swCUZBbdORPP9nzonwyf38wVn5CkrR4E+VbSwxUtREevKSLliFB6FkoA4U0PawrBC6
	21DVG1UqXCWYh8595L2Ac34v8l+N9Em9XG6MOE7cPxBGxDpGLbck/jzBxXsBA9L5afdyIarQH8c0Z
	w7w29b0ah/iBIIRVSrPjcp4hF3oE56z6pIjvpaUGM9Nyjm6z4yMxONuU0qhp079dLqajLEtUPtKCU
	wOMpaAYrFNfqQZpOFD++SIM+GIlqjp42fskxCot1POq9AKgO20oFdAjP691kKLoqXW6LMXgwjthK6
	Idrz/Zwg==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGoc-00000009dba-29nz;
	Wed, 11 Nov 2026 22:29:14 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xRGoZ-00000000081-2lp5;
	Wed, 11 Nov 2026 22:29:11 +0000
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
Subject: [PATCH 04/16] KVM: Guard the per-plane KVM_SIGNAL_MSI cases with __KVM_HAVE_MSI
Date: Wed, 11 Nov 2026 14:28:59 -0800
Message-ID: <20261111222911.477-5-dwmw2@infradead.org>
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

KVM_SIGNAL_MSI fails with -ENOTTY on both the VM fd and plane fds,
while KVM_CHECK_EXTENSION still reports KVM_CAP_SIGNAL_MSI. A VMM that
sends MSIs through the ioctl, such as QEMU with a split irqchip, cannot
inject device interrupts at all.

The new cases in kvm_vm_ioctl() and __kvm_plane_ioctl() test
CONFIG_HAVE_KVM_MSI, which no Kconfig defines; the macro architectures
set is __KVM_HAVE_MSI, as the old VM-fd case used. So both compile
away. Use __KVM_HAVE_MSI.

test_plane_msi in the x86 planes selftest, added later in this series,
catches this.

Fixes the per-plane KVM_SIGNAL_MSI cases added by "kvm: Make
KVM_SIGNAL_MSI per plane".

Fixes: https://lore.kernel.org/all/20260608144252.351443-39-joro@8bytes.org/
Reported-by: Sriram Nambakam <snambakam@linux.microsoft.com>
Closes: https://lore.kernel.org/all/20261104065536.15232-1-snambakam@linux.microsoft.com/
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 virt/kvm/kvm_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 0136156df252..95de904f0c61 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5016,7 +5016,7 @@ static long __kvm_plane_ioctl(struct kvm_plane *plane, unsigned int ioctl, unsig
 	case KVM_CREATE_VCPU:
 		r = kvm_plane_ioctl_create_vcpu(plane, arg);
 		break;
-#ifdef CONFIG_HAVE_KVM_MSI
+#ifdef __KVM_HAVE_MSI
 	case KVM_SIGNAL_MSI: {
 		void __user *argp = (void __user *)arg;
 		struct kvm_msi msi;
@@ -5662,7 +5662,7 @@ static long kvm_vm_ioctl(struct file *filp,
 		r = kvm_vm_ioctl_create_plane(kvm, arg);
 		break;
 	case KVM_CREATE_VCPU:
-#ifdef CONFIG_HAVE_KVM_MSI
+#ifdef __KVM_HAVE_MSI
 	case KVM_SIGNAL_MSI:
 #endif
 #ifdef CONFIG_HAVE_KVM_IRQ_ROUTING
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
