Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61217CCD183
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 00:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3OOOiA0IXe073/uyZ/j3rFU4kxJYt69Zl5J27LyPiA4=; b=cJzZ0bCSY6ee6c
	5xpfYusGLUxXEq2eOIdI2yCT/+zf7rKR4fE0+3NFQ5Ci4DIiHC6jd3nidVbfN6tUPv4XUasPkBnna
	o3O1KMAo8b4VOFVOVR103cfj5+Va8yrgNz9DiUvnZRnA6873bYcmEhn1XlUElQcGa0QWt7Q9Hd9VW
	20/CtrOzpHyod7k8KSlNKFv+nqq9D6RgkriW7iyU60I4HPNaeTY/mVEIndn+kYKJ9PdgMjC0hHfNP
	aULwnL99eJr2WCCAsCw/1M+TbqDoal6u2+iD32tE/s/RRKSE8L43nKWXf4WDR1hbNlXSUsT0lR7V0
	uOTcfFJCGqdEbQjLs+5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPL-00000006DHG-1wI7;
	Fri, 17 Oct 2025 00:33:23 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YOy-00000006Ceq-1RHA
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 00:33:02 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33bcb7796d4so676787a91.0
        for <kvm-riscv@lists.infradead.org>; Thu, 16 Oct 2025 17:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661179; x=1761265979; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=+a1al4eiPUacV4Mot5X5KU5+gR34Rt/H3K9T45t0ZTE=;
        b=akllWSFsBfgTAB11RACFGev0Ix/SRFynOsWCZXKoAhk1HcETv4z8cKTEWnKs93j4HX
         FtkPqsUhpDrCT77m5Q643tbTOTTqeGSNPHb29tZZJ1s5faVmx7SmMx9DKNAzHK5H72QN
         6j1Qg9/ZK5ousIO+T5fWmYopD3KUuKqsAa3pcFOd4/lPOKvHigepH5VjZ0rqHkrf6lgV
         k5a9XPLEC4Zsci9ioIE7/Hw4N0cNNWFUSGh8ivm6Dinqf9k/6ud3IUjOfsCVSgkySJaF
         yqV70DFzapWVRqvpJk8BwB2wpB0ghzcC8NY8PE4nlwPAfgNOpcagt7q8FqeHziHnYfAD
         p4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661179; x=1761265979;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+a1al4eiPUacV4Mot5X5KU5+gR34Rt/H3K9T45t0ZTE=;
        b=i+yxTH4gK/gCO2Zep13SoqmhWeFqalUo5xv2IOcKKPdIM83adJWUUGviOKpFBKkurX
         OhXyltNV6b45Mc0CvAhlKG+jc3f3/n9QwfHpbFdiSHCO86ShKfLMLw5Y9q2doiaS220P
         AUMAppaw/3YrEFlBbagjBEQ3OsM9e0XfGtJVPSBCafV/vch84sQqTpMW8ZOEQ52atSo+
         oFpXRCUDv/6qHn8eL5DEhfTJf+Vc/RY/uRz7BuDh4B74sKWKTu7kKI5K1DNzaW5sN2Op
         jD6Vk0Z6O8w8k//hSObQvY1mYuuNUAOjCkZ4qjvA93v35uNI4g8UzYxC+qq/ZWoLI9Wq
         tT4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3Suzl307gxp5VyQ7JDiP+K0zr2R/naldA2GjpIY9IMo4J6fCZjMFdrza50xnWGhZG4sn85zCWYGQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxnhAX2IlufXqwHFHhBljxz6eyNNyuVJRk+bz7LTvCzeWPU9+fn
	gnZX3t2mXaVLdvvUMUL17Rzqrxz1KawmYXXWl0QyelNZK9vKvNbjahbNK+Gbl3tsZr68qfx7nMU
	JR5Sp4Q==
X-Google-Smtp-Source: AGHT+IHzIstKbR2q/VP+R8akfQ7d0mH54WcISHRgZ7r9iWOK+ijBTCVCrvD3k8+Ee7BqK468kooIUIkBSz0=
X-Received: from pjbgj21.prod.google.com ([2002:a17:90b:1095:b0:33b:b662:ae3a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1343:b0:30a:4874:5397
 with SMTP id 98e67ed59e1d1-33bcf87f454mr1982502a91.9.1760661178904; Thu, 16
 Oct 2025 17:32:58 -0700 (PDT)
Date: Thu, 16 Oct 2025 17:32:24 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-7-seanjc@google.com>
Subject: [PATCH v3 06/25] KVM: x86/mmu: Rename kvm_tdp_map_page() to kvm_tdp_page_prefault()
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
X-CRM114-CacheID: sfid-20251016_173300_443613_ABD160BC 
X-CRM114-Status: UNSURE (   9.08  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Rename kvm_tdp_map_page() to kvm_tdp_page_prefault() now that it's used
only by kvm_arch_vcpu_pre_fault_memory().

No functional change intended.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 3711dba92440..94d7f32a03b6 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4924,8 +4924,8 @@ int kvm_tdp_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 	return direct_page_fault(vcpu, fault);
 }
 
-static int kvm_tdp_map_page(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code,
-			    u8 *level)
+static int kvm_tdp_page_prefault(struct kvm_vcpu *vcpu, gpa_t gpa,
+				 u64 error_code, u8 *level)
 {
 	int r;
 
@@ -5002,7 +5002,7 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 	 * Shadow paging uses GVA for kvm page fault, so restrict to
 	 * two-dimensional paging.
 	 */
-	r = kvm_tdp_map_page(vcpu, range->gpa | direct_bits, error_code, &level);
+	r = kvm_tdp_page_prefault(vcpu, range->gpa | direct_bits, error_code, &level);
 	if (r < 0)
 		return r;
 
-- 
2.51.0.858.gf9c4a03a3a-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
