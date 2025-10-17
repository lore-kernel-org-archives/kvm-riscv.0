Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DC5CCD1A3
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 00:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yxgg9aaiUd0L7mt+AT+roNP5VcgAn2p2A70qbtP2zOU=; b=sCZGgsVwkfSl1s
	XeBNUdJtW1voe0dpHsZKExzRizOn1/VCmZ+04lvjvxzGTJ+dOa/wV4fRKTjSHCHijet7RQc7eukwC
	PQKo1BZ8xN8t91g33niG4nNKjFpbpHDn47z8daRE/93GAp7qcYeShaDC9TMoNGt9nu2/YcmAccJZj
	QdcrlQKcLWP6tMhhMeWQP+eP8UHAVNlmeJe8+9WAflZPoUDlOpz7Kfu0ZbJJENmyxdWhBwdqB29Jz
	g2moEywCYJPfyvFPjjC+KmSRoeOGATtwALwe4TB/OdSyxOrNSQTvIunVVXQcJPEjqJBjEPtDvv2KY
	LdetC5lKqe/UI9GYjoRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YQY-00000006F6F-2IwD;
	Fri, 17 Oct 2025 00:34:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPV-00000006DUy-2bXU
	for kvm-riscv@bombadil.infradead.org;
	Fri, 17 Oct 2025 00:33:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=G1uT4yQcba8Ntip8LDR4veCehne/0rON+KC3PlpYlbc=; b=s0JNFvRTEt8fj4BEMyRh1qoMFr
	ZuCwbthv5ySTIgp5TaRBx/FnsjYo9tcSa/6PqhkqChgLK1bwIr9Znl+iD2fpfSp/jeNiDqDSyeoUw
	V6drEEiqiDVaN6kmGOxt4aorYTNdSes0Fcz9q5/gQPeU7OSCGg6drlIVTYJ/9v98UfBBT9fXIeT0y
	u4pDbyrIFPBABImBxZ8anCTe2vkNCMAhmEytaVhShFpWbIKzVnlNXitCbOc6jiyJG8og7skg+alPP
	cYmb2GdW4Lv+v/VeWKkM9sYAcZJmYOS+uWYD1/lANgdBJQw5EToYF/KZJ+Booky4fZM7JEj+solCI
	J55iadvA==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPP-0000000FiBN-1FKZ
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 00:33:31 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-336b646768eso1548707a91.1
        for <kvm-riscv@lists.infradead.org>; Thu, 16 Oct 2025 17:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661205; x=1761266005; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=G1uT4yQcba8Ntip8LDR4veCehne/0rON+KC3PlpYlbc=;
        b=xqVq3Aj4Y9ujrNNOOvU+UTlc4pGeyZJL8zE6SJ35e3eY4eigmEALCAg2BWHFyeF6fW
         0g5+0+1gJMyLYXY8f7pzt5M1L83aMWvi5PSgDo1/AWBFL9h57IeWpUVkd+cD3AQK1e2T
         HdZh1YXiH9ey81LACg7mdZTwsgYO4mwYXTBXVoU5t6eiUQsqy6OpuFm9I53+yJZmmEUa
         Jm8NIi0GyIdsE5PsqW7NoNQqD6XhSKb0p9mDuSEq1Mp9q2kMPXgSYPM3eAEvUkqLzFwd
         aefpZdHuIoHakxQoPsxtEym6C1xv0kPzMjC567A12gnTMLCFiu21uFFgz+1rh67Tn3jO
         2Tbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661205; x=1761266005;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1uT4yQcba8Ntip8LDR4veCehne/0rON+KC3PlpYlbc=;
        b=KcvdWp2cIjAgovyK9G9x7W9OeJ9dA6CUxXZNpaA8nX7iHwUEs2oXN6Gw1MLj9B/h35
         nX8DmMuQr1oRdKhq9sZPZEMFrezxBc8DsOecMLK7AoTedqJXdMhPKW/9pykSupLV/ufs
         u8WeL2PGVF8IHoIarCal8mRz3azFgGTKL4FJaFCSSgQt9fr7rv3IKnQNazAMmIGPHgQI
         MLhgWlSuR7jsQdQxJB7iROSgTpSGFMIMvq+2eai6h1ktcr/JWkjehl571OlU0U/64n5b
         wOvG7tNYAWG50zLYRzFbhFyoEF0ir6uHkUiMXURHafApGl7W5HumH+j34J/bAF+Vew6T
         YSfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIZ7qPcgfCdy9lwf7KQ/ji73LTeP5uVPUz7mtNIy4lbj3fW6C4PStd0xVXNzE10mMkFC+PJznWpEw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwK0Z6pihISGqu+TgqosBpzgEGP7Bk5Zh1p7M4BXPInXk8Nyt55
	tEhQZzX/5PLNFu8Np1ZZbWskESx/eurrbccodhbnhfTcVU+a9wikqAf4vLxmV/sx496A/1+bGej
	P7VuuFg==
X-Google-Smtp-Source: AGHT+IFb3cb9XScIkfIbQA2oQID7nhqxfExRyWF6N5UGcVhE3T71y0SJP1d51io6pNMM6/KZP3XG25y1rx0=
X-Received: from pjoa3.prod.google.com ([2002:a17:90a:8c03:b0:32e:a549:83e3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2d8f:b0:335:2eee:19dc
 with SMTP id 98e67ed59e1d1-33bcf8f94b6mr1826093a91.28.1760661204960; Thu, 16
 Oct 2025 17:33:24 -0700 (PDT)
Date: Thu, 16 Oct 2025 17:32:39 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-22-seanjc@google.com>
Subject: [PATCH v3 21/25] KVM: TDX: Add tdx_get_cmd() helper to get and
 validate sub-ioctl command
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_013328_567368_32A635D1 
X-CRM114-Status: GOOD (  10.36  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Add a helper to copy a kvm_tdx_cmd structure from userspace and verify
that must-be-zero fields are indeed zero.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 2e2dab89c98f..d5f810435f34 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2761,20 +2761,25 @@ static int tdx_td_finalize(struct kvm *kvm, struct kvm_tdx_cmd *cmd)
 	return 0;
 }
 
+static int tdx_get_cmd(void __user *argp, struct kvm_tdx_cmd *cmd)
+{
+	if (copy_from_user(cmd, argp, sizeof(*cmd)))
+		return -EFAULT;
+
+	if (cmd->hw_error)
+		return -EINVAL;
+
+	return 0;
+}
+
 int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 {
 	struct kvm_tdx_cmd tdx_cmd;
 	int r;
 
-	if (copy_from_user(&tdx_cmd, argp, sizeof(struct kvm_tdx_cmd)))
-		return -EFAULT;
-
-	/*
-	 * Userspace should never set hw_error. It is used to fill
-	 * hardware-defined error by the kernel.
-	 */
-	if (tdx_cmd.hw_error)
-		return -EINVAL;
+	r = tdx_get_cmd(argp, &tdx_cmd);
+	if (r)
+		return r;
 
 	mutex_lock(&kvm->lock);
 
@@ -3152,11 +3157,9 @@ int tdx_vcpu_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
 	if (!is_hkid_assigned(kvm_tdx) || kvm_tdx->state == TD_STATE_RUNNABLE)
 		return -EINVAL;
 
-	if (copy_from_user(&cmd, argp, sizeof(cmd)))
-		return -EFAULT;
-
-	if (cmd.hw_error)
-		return -EINVAL;
+	ret = tdx_get_cmd(argp, &cmd);
+	if (ret)
+		return ret;
 
 	switch (cmd.id) {
 	case KVM_TDX_INIT_VCPU:
-- 
2.51.0.858.gf9c4a03a3a-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
