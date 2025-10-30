Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98230CCF9FE
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 20:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vi/qHkXNo1e5hCZqIByT1hnHdR8ZxCwqjEhOiXGA/s8=; b=39ix0Ll8tdeJ5j
	ay4cg7ot+qFCh4aSwvuoPyH1zdJWZI7n9nDfja9k5/XSuhLb3JMl6KrkS0YXv8kHMaCs960fWaH03
	U4ogiAZBIcYDSF+LJJRF/0TJu4otkGWdtie1LigeiH1bFFN+srLhVhdFbbC5oBtXjzfsjvtRu4YE8
	8o/lN1b3mJZYIjL3MSh+02m1BuqiPm3Y7ONn3erF6ZqWloaCqtMNWjFUhMT1CLDypt2aYRNrDosCq
	xQws8Fws4vip+rPwbaftJRPH3QOYNV+vG9QOKSbdWwLDQXkL1rbTe1yVpZ4t43P+r2oVCcsjV3Biq
	9qyWRw+zsC0KSK4iIHPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYyq-00000004k2r-1XGs;
	Thu, 30 Oct 2025 20:10:44 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYyP-00000004jUM-0qIe
	for kvm-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 20:10:20 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b6cf1b799dcso1133873a12.2
        for <kvm-riscv@lists.infradead.org>; Thu, 30 Oct 2025 13:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855016; x=1762459816; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=JLmVjM6Rep3/JgP/0z+P5jqrWiynYk4juTN/f68hSuo=;
        b=VFih8QHG7e36R+HshJx1PuovozDtvNc1ULWH34yDAwWB2EJh1pY3BNjqdBrnI2a7Mc
         Z4v5QEy1q8XZaIa6wasn6ZJY86mJXoWOiTULmR11jm7Bo4KdKAcSUNphAy5FRLQw+ksc
         MvSltwgK4HLwOqNOpigcK98i6mqSAfDgeqau3sJx2ybP2NGKppZ4nbTiDmwNAfiTKPdA
         ++ZbZKGkR/KFgcpONCmBnPn5t+1IUCbzNiFp2i++cGgb5K/SgsL+mm/mDg074pc86N18
         fWUmvQgL2zBWEbSs1SUSM7mGC8fTBilaPO6LL46I7sEm3fgafQPV7ASOahy+RRmb9ZIE
         bZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855016; x=1762459816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLmVjM6Rep3/JgP/0z+P5jqrWiynYk4juTN/f68hSuo=;
        b=xS1/T7RbULswVn04VATp7hJ6LRXjPeacBXUldMo7m8ArzNHU8pXAg8gmsbr94bDbhY
         9qI2FDXbZESgT0VMtIpGHNEPY4+n8OpEDXe2VHNDxzXEBexBKO39D8pQ/T2giwxTMLAw
         /en8MvC2CCSzolf15K1D0j330ZEiSaw1wnq+CzQTENuglHX4/BH5gvmHqWxLbf3xywf5
         tE8MfGHh2L0HMpTwFIqg0rhWZVroTyrkNy0sPveBYPzCHAH33nfKF8QewJBaV+LeiDs3
         ifrC6S0jzF8BHfCIalVCMr/CYedqmHfK0+xXIiAItxu3U6/U5UtF8OAnexqmmgbtbtj7
         5ujw==
X-Forwarded-Encrypted: i=1; AJvYcCUK7bXLyrAuVMEHgx/5lNtoMYS451kdnLh24iwVNYa9qBWNOHvs/AwIclHoxulU0bV3AUva0r7KRQk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0L0W0/OE0ogGkQy26TM9PmuSzpS0AjQigDZKdll9bJMYonIRs
	VZkCCuZ8Tu0aTQEH9NKOdO4f9sLUMeXfVt7lgeQRTtV+wk++H8qah5ygSfTcUalQn2yOkZPb+mS
	pBpO9bw==
X-Google-Smtp-Source: AGHT+IH1/xZVzpdLpqTCV5R9sgqM94QaK+KvWTLge6Sarj+nuvNBhb5+D5DYqWRmVcfvrQhQkF7/dm0shPg=
X-Received: from plnx8.prod.google.com ([2002:a17:902:8208:b0:290:bd15:24ab])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e88e:b0:28e:7fd3:57f2
 with SMTP id d9443c01a7336-2951a491f2dmr14399305ad.49.1761855016072; Thu, 30
 Oct 2025 13:10:16 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:30 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-8-seanjc@google.com>
Subject: [PATCH v4 07/28] KVM: x86/mmu: Rename kvm_tdp_map_page() to kvm_tdp_page_prefault()
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
X-CRM114-CacheID: sfid-20251030_131017_320577_7F6A9E57 
X-CRM114-Status: UNSURE (   9.16  )
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
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 3a5104e4127a..10e579f8fa8e 100644
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
2.51.1.930.gacf6e81ea2-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
