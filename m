Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D26CCF9FE
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 20:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v1mpjfMCABfhetsSdHagpECFtwxCY69OAacRzu15z+g=; b=l35Bi9j4E+rbmm
	L3XJqioDpdDJsjDaIMr02HBJqyjR+DuFJK/spKo1h1YTdCt3WRTl/prae4vqXHg9cURvO0Xo8bks+
	ohLdA9WegyBY12/o0v1DPttpQH4eF1lXMhziSP7vs6nGf8UESnKzZgDt/wPuFV3Ozc7S+wqFsT2Pq
	1Fx5tPmp5Cy6MjtdT4nNaWvtun09/jfn7ZK+ZzCsPFA5A5nGy6AE8oa7SNa60a3ssy3abjogeFxIX
	FdXOYaNxSBKkY8IPRzZ5TlDr4h9AkixYyjNlf9pCMYuSA4FMkdwFuDceIPaH52MHxv8p9IUMasmfy
	+xIR8P8mnwJlxd/2FObA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZ1I-00000004n05-0cuS;
	Thu, 30 Oct 2025 20:13:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYz7-00000004kLI-1eY1
	for kvm-riscv@bombadil.infradead.org;
	Thu, 30 Oct 2025 20:11:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HfwppzbkJFTqc1oDUhl9YAWd2H/Ydo3ViOcPjYsyqPw=; b=RDE97aIft6hvoPQW/dxcEjJrJ5
	pVo83iYm2FHWxDQtv2+Kg+zgfvKRPIkM7+EoSlLJp1QhuWuHyam8ANJk9GNr8Kcaz0Ja/FTjwXpKx
	GI8GpvvrVgClsuTJ6w6177zJWe/D7Nie3DGYN6A2BynLPPCDS15/jqdycS3EJPq74DDVqgoeAyg9C
	H0QL8PsZwL4Wyr5Yre+EGtFb8PvnBcseiVIu2dXUOXgcVjmXD+nWsGP050n65tmZxB2ORKirZiyAf
	u34QeED09WjGBnopbG+9WdJwku9QCO+OJL02dpFA8gOqIeNFV8k/FuunSLnHasNIS1ixAKY1nvOF8
	BFZ4OSZg==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEY7K-00000009tzO-2yVs
	for kvm-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 19:15:28 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33bbbb41a84so3170936a91.1
        for <kvm-riscv@lists.infradead.org>; Thu, 30 Oct 2025 13:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855055; x=1762459855; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=HfwppzbkJFTqc1oDUhl9YAWd2H/Ydo3ViOcPjYsyqPw=;
        b=O7cQMqOwjLnKfJBLVfB0+M2swNy0UfrjbOGSpgLgR5GU4n9c2J7d9ck3IA9WjK6EPR
         WN3CTkr9A4xkoDbl5vzK3bT6l1iKTkMniwL29wlX+8teUBjltB6j99Ef3BxKKmr2ZpwK
         RhoZiERodtb9q3DH/g54irTWgl8tH3c2I9M6ydqgDt4kV/qA6W08uecuky4ppSJM+ZBe
         B+XaFGtSxbsInjmmH0mIhX7CSeCib2MCCS+Fx/WogGiYroziROi4fXSTSKjM822WjZBQ
         05vURvFnvG+HWDDRV/ixV24eM3CSC/bYjNXjTknxHnWl6QrYsOIqkqay86wtQ9SFAo61
         aAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855055; x=1762459855;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HfwppzbkJFTqc1oDUhl9YAWd2H/Ydo3ViOcPjYsyqPw=;
        b=eVRmY0XNiWhH1R8VJdsG11Q5SQFqwyeWjGMRijpWyOKcdoYRT6Oba0dVh8D3XWInEB
         TPIpI8LYoGUbWR+rH5+l1rZQekZJFftt52Nnwi8MWl9wA+qn6hBQz069IGyuQkI2Hk6w
         g9jaQNmD/WaP+Dd88QoayzlGCHzuzaQBvnSBIj9Lp8xlnLx4t0bVOM2laTnYhn8Wn7pX
         1rO880SPjPPGg0JJN5VL0unaJ4WNEzWcy39q2ElNrVDn8oOdg2dY9PTXx0Pf4l47Cbrc
         oZMvdOD57QWnmrHvkmRtf0RDbUpQzmnM5CXU7VmYMhAbCvCUJs7eDnk0rEZeBovLS03i
         Rxdg==
X-Forwarded-Encrypted: i=1; AJvYcCVAbSKSaR/0lf0fev3noNOKBADrUF3MLf9NMKNJ+WCQmkGix+EKg/RDG6g3ZTgbBk5E1ozuUjajkD4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzzp+k3bOJs92tXtlhBPRUnK6WvqQ1TqIqwUSwL7B5bDiJQ062W
	gIDvAe7kIFvhqkPtku6t97ulToqqRs1iu3drOlEdq41es/75uDt8xJWunkwOuWMerNVnbdwXQHr
	tr395Nw==
X-Google-Smtp-Source: AGHT+IFgv0+NgL48Cma0Y79QUzd7lRP+/FCxQ0tZkUpinDRTeLAklkWHALMXu+tHUB2W7Y9sxKQZz0IMk4g=
X-Received: from pjbbt9.prod.google.com ([2002:a17:90a:f009:b0:340:7770:2e30])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f82:b0:32e:a5ae:d00
 with SMTP id 98e67ed59e1d1-34082fc7b43mr1201499a91.13.1761855054620; Thu, 30
 Oct 2025 13:10:54 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:45 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-23-seanjc@google.com>
Subject: [PATCH v4 22/28] KVM: TDX: Add tdx_get_cmd() helper to get and
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
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_191526_842086_00014C19 
X-CRM114-Status: GOOD (  12.01  )
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

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 97632fc6b520..390c934562c1 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2782,20 +2782,29 @@ static int tdx_td_finalize(struct kvm *kvm, struct kvm_tdx_cmd *cmd)
 	return 0;
 }
 
+static int tdx_get_cmd(void __user *argp, struct kvm_tdx_cmd *cmd)
+{
+	if (copy_from_user(cmd, argp, sizeof(*cmd)))
+		return -EFAULT;
+
+	/*
+	 * Userspace should never set hw_error.  KVM writes hw_error to report
+	 * hardware-defined error back to userspace.
+	 */
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
 
@@ -3171,11 +3180,9 @@ int tdx_vcpu_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
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
2.51.1.930.gacf6e81ea2-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
