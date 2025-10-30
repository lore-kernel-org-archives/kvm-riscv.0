Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6AECCF9E3
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 20:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4mjBcURmIh8hzWX7BzQfdwSJ0y79ujDYQKaNK+OQ6qA=; b=QJEXlRYO8utIQH
	QHRLIR2Srf/25VFYWY6nB1UkcGf5+f+afieQWNssyuF0OBtqN79p5zx0HPxrPq3ru/zK+jBo+KctO
	AwXuYD0KP44vK7U6qxdTxy+GuqIBp2YiZikBzjMuxljctJ6SXUknvHP2YwC7FENy9HpktBOKaPpRp
	oKP+gnS9lwcgiGXh9L1hq1VWZLn/L6XtXift9RgMkZppJzNbMB3gWb65grKoJksoR3bQa5BTYGqtl
	VLLqQAtvInnduxKLqvC+xyCYZ5Q7C4ottKF8QR/x+xAWimx2cdOLtBUr6/eP9p0K7A0gZdRKVxa4+
	Y/Q4onTXVzAit1WGmEbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYyc-00000004jmY-3uMq;
	Thu, 30 Oct 2025 20:10:30 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYyK-00000004jNq-2G4G
	for kvm-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 20:10:14 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-32ee4998c50so1121477a91.3
        for <kvm-riscv@lists.infradead.org>; Thu, 30 Oct 2025 13:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855011; x=1762459811; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pr+88J8V2FFjpoCz/RKjLuOTT6WQDejtYqs45iSU51c=;
        b=gy8lPejeDVZXNYtzQGTLkNsiqx8JxuTzdiRKtETBXa0hSoCU3umgJkQykwJzpbDpwF
         cPYFPZJhW4pgV+jFRgMcA6te9BwGW+S3b1fI+Ys/PFiPXVHdmetDFu2Gazi6gV1RhV4L
         PajxL2LtJHhA+c0m1YqS40lHH9PQnO/cKjU09Gl30UT3NMPA7UivmlYYC6uPWbUIa9I3
         TyMga+Nn6/zhfjfvrLuVJD71NhNseK4JJeuHqnx7gtOf7qdpgfrB2+VP4cK7bz4/6kLa
         pFcdMPRaI3MBL8r8fTVL57DSFdLZKKls83LZ2g1JwkKQPZmMNsjWTl6BfeEtcKQp26NN
         GaGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855011; x=1762459811;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pr+88J8V2FFjpoCz/RKjLuOTT6WQDejtYqs45iSU51c=;
        b=IGzn7j8zkl0VrqZf73u4sf7hzzlqWCsWLV2TZG675kq3RXwLLWhdevo/67/+f+Epox
         Wwc26PJRs1O+0reNoDToSYYvU+oAy+4974shbt7UGZ/bJkNxnaWqCntk6LADhRV7oUWy
         +8bdKrERRMJ8wFFuz9PcwB+HPCt77WWZlUT2MslEfsvVH5uR3z98KjHcZMonP5YgWpzV
         5AcALRKmF3DmqZG7V2EhOdN+RdUK90J6A6MjCIywcX+DTj5kIed7ViwaRXSDLABNCrI0
         kkSTaIhGSsU46O4J0qSVz6axiFcOO970bi5HsliTHScfeykP8wMC95zf117NGfSOgynn
         tDYA==
X-Forwarded-Encrypted: i=1; AJvYcCW6Or4HXkPVPlLbfMvSNh89BYpmh1KGLLGHD1k2E7TGQCaxPAjC8E3AeWCiT8pp4DbGDxLB6421eqs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxSVsU01d3BeZ2TAlo24D0pnadKKvDa26EHqOaYd/crJ51ZFN6Z
	2w+4F1/vEU1xQo75XptI0LA5XpsqQ+zYDlaNpjlt3N5RaINESzEFUNFRu2bvUZs/T0Cah+7zbWU
	oFh3d/Q==
X-Google-Smtp-Source: AGHT+IHqKKH3jALoT7jRe2OHIQ2mXXV+pELYiJKGwKEjf4ZIM+twJ+5jG3TjV8eGRlfpIUNYgujs+bg0n4E=
X-Received: from pjji4.prod.google.com ([2002:a17:90a:6504:b0:33b:dccb:b328])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c8d:b0:33f:ebc2:63a
 with SMTP id 98e67ed59e1d1-34082fc2cb0mr1192488a91.14.1761855011296; Thu, 30
 Oct 2025 13:10:11 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:28 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-6-seanjc@google.com>
Subject: [PATCH v4 05/28] KVM: x86/mmu: WARN if KVM attempts to map into an
 invalid TDP MMU root
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
X-CRM114-CacheID: sfid-20251030_131012_606607_7374D708 
X-CRM114-Status: UNSURE (   8.53  )
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

When mapping into the TDP MMU, WARN (if KVM_PROVE_MMU=y) if the root is
invalid, e.g. if KVM is attempting to insert a mapping without checking if
the information and MMU context is fresh.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/tdp_mmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index c5734ca5c17d..440fd8f80397 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1273,6 +1273,8 @@ int kvm_tdp_mmu_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 	struct kvm_mmu_page *sp;
 	int ret = RET_PF_RETRY;
 
+	KVM_MMU_WARN_ON(!root || root->role.invalid);
+
 	kvm_mmu_hugepage_adjust(vcpu, fault);
 
 	trace_kvm_mmu_spte_requested(fault);
-- 
2.51.1.930.gacf6e81ea2-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
