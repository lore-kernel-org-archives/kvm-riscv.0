Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D09EE01F6
	for <kvm-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 23:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GZtBUzaFMzv5iuGYUBwSnB5bYdkFCLkxf4qy6EucODA=; b=EMICkuDZcOdWXB
	pDSIWwzEgWSkegjRiLj05WZJBMUraS8wSZooEI8P2Qm20rtDZIvnX/DD7fJi0/Fvagw3XNFRj7VRF
	Mg40IRtm9GHEUF/cTnn6tfM8W8uhTHlzdlytjkud3yxfZosVS8rXH1i0RqvXftsOXi1g3MKzlzpeG
	akT16pDrRTUxswQ+Je+EnvFrAeb2FXFVJ5d5LOgYuDEGY3oeJENPavKwrizkEK5WSICvbM8Vae3oU
	2Re9uJKgISMHbsTLQEP1FYH2VXVESP7FYfkHOIoGws59y40YnE3K2tHv9tmiEHkQTLFtRhBzo6+Aa
	VSltv58sXbnZ7+1T+TcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaikL-00000005O95-1kFX;
	Tue, 30 Dec 2025 23:03:21 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijH-00000005MpX-0CWw
	for kvm-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:18 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-34c5d6193daso20452132a91.1
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Dec 2025 15:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135733; x=1767740533; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=aempC3xup8zdxs82u0niExWKRbrEWWiY7rS3u4Pr19E=;
        b=0fVwd2bSCyS3sK/07diUcztZ9/s72/hjbhfXmYZ524w3YGTSpuC7AT2NQC10f4AOdn
         YsMzt/+kqNOxKlHA5lWe+O4M1tLJOWh0F0MucBk2SP+YroIhd1uMgDIsfnBwl3qLpseO
         hCV2qMcyQsehYHK69zUp2uJq/X+eEtnXu4HTE86hOoBXFvRBUKmhXqOIAwmwD7DL2TTm
         NgGnOgrE+mQDWHFKlux5Dkf2qQsyHKrS0o4t5T6EiN8ROgRkNYJBetDdx/uwd01+V8y6
         OBp6Cxb9vLj5ocWbkAD+zgIFLfFao+4/6MxLWQdeNVBnYlcLEUIiNXnt9yRac670ak8h
         buXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135733; x=1767740533;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aempC3xup8zdxs82u0niExWKRbrEWWiY7rS3u4Pr19E=;
        b=GByWobY2SbJhZexHCydMWhJ9whFYTXhdNm56D7l4EkZ+uMD0DfMmnyLJT2Zq8UGHWf
         YD0WYRtrzmGHeTbfjVj3WApRTy+gTu++6JVyU1x9+y3zBY83RVFa24DzZxcCpkcA3Kaw
         DQqZljzzQYmrdO5ex6JJuY9MYaHVv1BIkI5upK5PgM3TWtBVQmCaRQVgyZ5SsUPoVif8
         7iKcJhHRgqnNdrsBtn5cLfDMRxnceGVLqNl8UfAxS9iZ0xOu9gp7NnZHd68CFZZCZo7z
         XQBGW1jfBFnDBo/TV8UG4l2tL/Sy4Z2+KrlMO81wUEgJhZaiAVpNPvT03Y06VvMnM7ws
         SXIg==
X-Forwarded-Encrypted: i=1; AJvYcCU5X1MKNysMm4dMKQR9sN6JBC7wHCPO/YKqdQMEPIgEOrGnQgfLkFSMJspZuSDbseB/xqP+FPXSaGg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwnoaqGcTYdVSIA3ahXFcncasxBwOA0TPpvRUcdVuKCZ5p0esaK
	TJmwf7gKuyQui7QTDJMdVLvzLquKJOPgtre+/OX6IZoJpv5oAFrO0a9vd4tm6enQv32j/xi0feA
	Rc6xUow==
X-Google-Smtp-Source: AGHT+IF1//ZF8YQZFDW338R6CLvvv/Jhm6bfFusPZNwPuigVsAoIaoiYhFuoR4zT4Z2vqbXSCzOrQaND/Kk=
X-Received: from pjbpm1.prod.google.com ([2002:a17:90b:3c41:b0:34a:b3a0:78b9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:52:b0:34c:94f0:fc09
 with SMTP id 98e67ed59e1d1-34e92139d60mr28142377a91.10.1767135733534; Tue, 30
 Dec 2025 15:02:13 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:41 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-13-seanjc@google.com>
Subject: [PATCH v4 12/21] KVM: selftests: Add a stage-2 MMU instance to kvm_vm
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry.ahmed@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_150215_129480_C250E26E 
X-CRM114-Status: UNSURE (   9.57  )
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

Add a stage-2 MMU instance so that architectures that support nested
virtualization (more specifically, nested stage-2 page tables) can create
and track stage-2 page tables for running L2 guests.  Plumb the structure
into common code to avoid cyclical dependencies, and to provide some line
of sight to having common APIs for creating stage-2 mappings.

As a bonus, putting the member in common code justifies using stage2_mmu
instead of tdp_mmu for x86.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index c1497515fa6a..371d55e0366e 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -116,7 +116,12 @@ struct kvm_vm {
 	uint32_t dirty_ring_size;
 	uint64_t gpa_tag_mask;
 
+	/*
+	 * "mmu" is the guest's stage-1, with a short name because the vast
+	 * majority of tests only care about the stage-1 MMU.
+	 */
 	struct kvm_mmu mmu;
+	struct kvm_mmu stage2_mmu;
 
 	struct kvm_vm_arch arch;
 
-- 
2.52.0.351.gbe84eed79e-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
