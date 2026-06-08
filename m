Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73517CD98C6
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r3zr3Gh04lmdQvSFvLsJJiKsg8nI8W8TqIeOiByE9SQ=; b=cl/A5uL8z9bNIZ
	IG+JwAaopKKvC6EAtp5QN1eJ0HkDY/FvfR+iZBFmvbdWO4QPZyRBwpZNS/8igoV/uznwV/br/NLLH
	a74ZzyYuf184exXmjAUwF8nFQ3Bntk/tdpObEXWD68R0IfYJY76j+zqVFWKrF1KI9eV9YcYKsAhzr
	eRrdir3YFXdNZaYNhKGLt0lSKsTf6cwTZBn5lSBNIFzYDZDUYjqtM6RcSKeWX1Y4UIUMUoqJZC0Vm
	R2TLyLsyEMM2ndCCt9Pe6NR6g4cgpt2yhHJ7DbiPf3G+0aLDF/SkxYkEfv/UwmFKY5rDt366R9yc2
	+bdpWGviXihARKD5HTJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCI-00000003pxK-49fP;
	Mon, 08 Jun 2026 14:43:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCD-00000003pk4-30EO
	for kvm-riscv@bombadil.infradead.org;
	Mon, 08 Jun 2026 14:43:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=sm5Nes0CBHSHzrIXDQYXiFAfxGVdcZUPLZZ4Ymn3KuQ=; b=FiDCEaC+sR5ln2cBDFSXi7PP/b
	aAkwrWaa8o2jlPKTO4zeXCeFRB6SZ3Jcwu5/UEhp2tiL4RAGMBO1585wsFbHkivpVUKX+kfEt2L+q
	FSE/Db4AnJF6uel/XRKnSsbhNVQWCkf1UnqAHPbCBByaUo8f83p5MDHuabRQ/swzCjzjr93ISO8/u
	uZ9S2di0ExIlK46EizEawZjw4u8stlMDCxYf6G6qgkriNbXZL3nSZlloF2PIX0aohQfmmAWtPMYzH
	ULMKQdbMhJhYU3aoYlz7WSH+xy0fLS5xw3KHhpZVcN1UJmINF4apdXMzl8RWfPsum1qx2rKK6sy10
	VdjMp2ug==;
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWbC8-000000019AQ-1qcf
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:20 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 4CB882028C0;
	Mon,  8 Jun 2026 16:43:11 +0200 (CEST)
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
Subject: [PATCH 29/60] kvm: Implement KVM_CREATE_PLANE ioctl
Date: Mon,  8 Jun 2026 16:42:21 +0200
Message-ID: <20260608144252.351443-30-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_154316_873416_C9B410A2 
X-CRM114-Status: GOOD (  13.91  )
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

From: Paolo Bonzini <pbonzini@redhat.com>

Add a new VM ioctl to create a new plane. It returns a new file
descriptor which supports per-plane ioctls.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Co-developed-by: Joerg Roedel <joerg.roedel@amd.com>
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 include/uapi/linux/kvm.h |  2 ++
 virt/kvm/kvm_main.c      | 75 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 813f964a6dc1..24e34b8e4819 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1355,6 +1355,8 @@ struct kvm_s390_keyop {
 #define KVM_GET_DEVICE_ATTR	  _IOW(KVMIO,  0xe2, struct kvm_device_attr)
 #define KVM_HAS_DEVICE_ATTR	  _IOW(KVMIO,  0xe3, struct kvm_device_attr)
 
+#define KVM_CREATE_PLANE	  _IO(KVMIO, 0xe4)
+
 /*
  * ioctls for vcpu fds
  */
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 5a0277e2ac7c..03a44ff62f0f 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4843,6 +4843,34 @@ static long kvm_vcpu_compat_ioctl(struct file *filp,
 }
 #endif
 
+static long kvm_plane_ioctl(struct file *filp, unsigned int ioctl,
+			    unsigned long arg)
+{
+	struct kvm_plane *plane = filp->private_data;
+
+	if (plane->kvm->mm != current->mm || plane->kvm->vm_dead)
+		return -EIO;
+
+	switch (ioctl) {
+	default:
+		return -ENOTTY;
+	}
+}
+
+static int kvm_plane_release(struct inode *inode, struct file *filp)
+{
+	struct kvm_plane *plane = filp->private_data;
+
+	kvm_put_kvm(plane->kvm);
+	return 0;
+}
+
+static struct file_operations kvm_plane_fops = {
+	.unlocked_ioctl = kvm_plane_ioctl,
+	.release = kvm_plane_release,
+	KVM_COMPAT(kvm_plane_ioctl),
+};
+
 static int kvm_device_mmap(struct file *filp, struct vm_area_struct *vma)
 {
 	struct kvm_device *dev = filp->private_data;
@@ -5288,6 +5316,49 @@ static int kvm_vm_ioctl_get_stats_fd(struct kvm *kvm)
 	return fd;
 }
 
+static int kvm_vm_ioctl_create_plane(struct kvm *kvm, unsigned id)
+{
+	struct kvm_plane *plane;
+	struct file *file;
+	int r, fd;
+
+	if (id >= kvm_arch_max_planes(kvm) ||
+	    WARN_ON_ONCE(id >= KVM_MAX_PLANES))
+		return -EINVAL;
+
+	guard(mutex)(&kvm->lock);
+	if (kvm->planes[id])
+		return -EEXIST;
+
+	fd = get_unused_fd_flags(O_CLOEXEC);
+	if (fd < 0)
+		return fd;
+
+	plane = kvm_create_plane(kvm, id);
+	if (!plane) {
+		r = -ENOMEM;
+		goto put_fd;
+	}
+
+	kvm_get_kvm(kvm);
+	file = anon_inode_getfile("kvm-plane", &kvm_plane_fops, plane, O_RDWR);
+	if (IS_ERR(file)) {
+		r = PTR_ERR(file);
+		goto put_kvm;
+	}
+
+	fd_install(fd, file);
+	return fd;
+
+put_kvm:
+	kvm_put_kvm(kvm);
+	kvm_destroy_one_plane(plane);
+put_fd:
+	put_unused_fd(fd);
+	return r;
+}
+
+
 #define SANITY_CHECK_MEM_REGION_FIELD(field)					\
 do {										\
 	BUILD_BUG_ON(offsetof(struct kvm_userspace_memory_region, field) !=		\
@@ -5306,6 +5377,9 @@ static long kvm_vm_ioctl(struct file *filp,
 	if (kvm->mm != current->mm || kvm->vm_dead)
 		return -EIO;
 	switch (ioctl) {
+	case KVM_CREATE_PLANE:
+		r = kvm_vm_ioctl_create_plane(kvm, arg);
+		break;
 	case KVM_CREATE_VCPU:
 		r = kvm_vm_ioctl_create_vcpu(kvm, arg);
 		break;
@@ -6676,6 +6750,7 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 	kvm_chardev_ops.owner = module;
 	kvm_vm_fops.owner = module;
 	kvm_vcpu_fops.owner = module;
+	kvm_plane_fops.owner = module;
 	kvm_device_fops.owner = module;
 
 	kvm_preempt_ops.sched_in = kvm_sched_in;
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
