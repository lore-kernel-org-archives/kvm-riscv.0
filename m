Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA84C5AE59
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 06:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+RLMUQ/ZVPmqAFEVPID51MPLMfVi8nvyf79jI9EaGeg=; b=R+S8czxLNMUxNh
	SPcS1SAoRr7rycd+37bZyNjAUiWA6+sr0+UN0yKCXoolFYkQ/xvKFX2QhPvOiUr69Es90J71BWTF6
	RmCxlTMZxBQGuEHez5SYHDPybnzP9/9YB9V+alriz2XkXzBbJ6Q55wEK8EuuqbfswAwTKCev/E4Qm
	HrxTy/IBkryo51PUFA7h/2YPr6Qjj1IMTf97cPp93eCqbSOfw0Ylzlku5efIl7BVOJB88cbIEktcq
	+J/vMIa0YjRWZDMncfwsJQec86CtObq8v8AxlHWMaRkxLELDq4OlslYq2WKdgDCxzeFpHX5Ifq/iX
	pbe9aYvZ/MY5G432B6RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3t6-0000000EpCt-46uW;
	Thu, 05 Jun 2025 06:15:40 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3t2-0000000Ep7F-314v
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 06:15:39 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3109f106867so766306a91.1
        for <kvm-riscv@lists.infradead.org>; Wed, 04 Jun 2025 23:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749104136; x=1749708936; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBw4EHffUTV31O6B+TCgyeA+gw4sP4Qg6j7rVTIEdxU=;
        b=gjEbppLbVa6F/Dy6SrnUV+iJyjSjw13nF1xxRvRTSuvkFLVnsjXJgEpWlc24ilT69t
         oLKm1goDuaYphz4yzKnH+tJPViVcwVKOlNS3j2nWXX70pCr7ejdqGVFnMceTDyAuhxNv
         JNb3wqqTBw2zr9wXAFf3jYC0Ro8ZROuJqGvn24cpvjGwHZY1ue7Ow+NsHEaZZ2Br6VK4
         eJ0/k94IMlC+5yKV+amg6jnU/n0dzW8vKi74d4hm6QwF3EqywWxDHj14aRZjzYd26nKF
         LDs2wcaf+6wfR+VPNdE2T+o8D2PBQ8w3+oyvf7QOC/wtOL2JpyvRf6p4lbWYVIVHdbi8
         FWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104136; x=1749708936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBw4EHffUTV31O6B+TCgyeA+gw4sP4Qg6j7rVTIEdxU=;
        b=FDRxa3mINHhaRuPljtRtdXnSJErnnQo3YcUoYU2WZB676ECE8KZbJFeYR2LDiAMnGU
         W5G2tT00NAppBq/69B4+g6XLc21bmui5t8IQZf1IbsnEtHTs17oshS5Up1TqB17ZDDKM
         9MQUJWxmYGT2PWL6J2C79/0i24/gos3qDcLmlFKnQugylOyABs4tq8tDRnw7X7yUginA
         h8ITXR6ZA9hZw024ynjy2Lf7mNV614cMUDuL+4M89wYeFFvMDP4xO0a67n0UFMIzalZQ
         XYNQ4sRWqAkE4vBNtCYCkwwwpTQ/flWSyAXBKY+fUv0NBYXm3sYBheQBQptLNCMUioCr
         DLzg==
X-Forwarded-Encrypted: i=1; AJvYcCU2o7Zla/a7GfSVj8kffm3diQR/Lt/sKumkD6ifv7EQZ6pzDeCQJkzL4i3Bo8F3c4huwV6IvD+GBo4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxGGos2h3TTZWD0tgJWv5/knlPPX36kmSsLMhCVeGHt/SitUtQ3
	ydLigMJrHdk74fbkYGFa2YZflh2S8w9J8yTpY2sS+QPsU1RqhZMKJlFgAGWLsb7UR80=
X-Gm-Gg: ASbGncvQG6vj8W+YAiLnSIrt8VOLyuQ8skn6jE3yIKTSPHE1NJKND2pg2WgTowfUjQB
	momQeXgUfmKyLFOJJvwfLrxnasrqhmsthB4vs+LqyLyKLDOJNAx8PwgbxhdXDP298fV+DM0nqux
	hF6FL7CVfFUpsGTTtFvOrTbkvmoXSUxD5RZMiWhE4Mw6qbMDrc6g2X79WeFpLxovt2INM/quQZ2
	e/8QgSotKNC+Hh9uLIdMIbxSKI4I4Zfo2CriIjCTGogJhGG6HanMuO8I/UNufjSvOxKU6QK2gCp
	/0NmKDMrtC5K98p2QBE76gbpibgHTAFw/HmkUGYFJZRpGq2rSuLXPcy3YzTpHyy3yzJTnfuVsGS
	GXyy6BRojaRae3Lz7yM6G3oy20Y4=
X-Google-Smtp-Source: AGHT+IFD6i36g3dYe1k+gDLGsx1D0hcp/ZxtNU3y3iDfAyRruAl8oD12KxZBz84WYVYtRaZXIXAJqw==
X-Received: by 2002:a17:90b:3ec7:b0:311:9c9a:58da with SMTP id 98e67ed59e1d1-3130cd12ba3mr8390187a91.8.1749104135972;
        Wed, 04 Jun 2025 23:15:35 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0bedc7sm716026a91.49.2025.06.04.23.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:15:35 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 08/13] RISC-V: KVM: Implement kvm_arch_flush_remote_tlbs_range()
Date: Thu,  5 Jun 2025 11:44:53 +0530
Message-ID: <20250605061458.196003-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605061458.196003-1-apatel@ventanamicro.com>
References: <20250605061458.196003-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_231536_763348_F99D9D0C 
X-CRM114-Status: GOOD (  11.23  )
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

The kvm_arch_flush_remote_tlbs_range() expected by KVM core can be
easily implemented for RISC-V using kvm_riscv_hfence_gvma_vmid_gpa()
hence provide it.

Also with kvm_arch_flush_remote_tlbs_range() available for RISC-V, the
mmu_wp_memory_region() can happily use kvm_flush_remote_tlbs_memslot()
instead of kvm_flush_remote_tlbs().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h | 2 ++
 arch/riscv/kvm/mmu.c              | 2 +-
 arch/riscv/kvm/tlb.c              | 8 ++++++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index afaf25f2c5ab..b9e241c46209 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -42,6 +42,8 @@
 	KVM_ARCH_REQ_FLAGS(5, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_STEAL_UPDATE		KVM_ARCH_REQ(6)
 
+#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
+
 #define KVM_HEDELEG_DEFAULT		(BIT(EXC_INST_MISALIGNED) | \
 					 BIT(EXC_BREAKPOINT)      | \
 					 BIT(EXC_SYSCALL)         | \
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index d4eb1999b794..834d855b0478 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -342,7 +342,7 @@ static void gstage_wp_memory_region(struct kvm *kvm, int slot)
 	spin_lock(&kvm->mmu_lock);
 	gstage_wp_range(kvm, start, end);
 	spin_unlock(&kvm->mmu_lock);
-	kvm_flush_remote_tlbs(kvm);
+	kvm_flush_remote_tlbs_memslot(kvm, memslot);
 }
 
 int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index da98ca801d31..f46a27658c2e 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -403,3 +403,11 @@ void kvm_riscv_hfence_vvma_all(struct kvm *kvm,
 	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE_VVMA_ALL,
 			    KVM_REQ_HFENCE_VVMA_ALL, NULL);
 }
+
+int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 nr_pages)
+{
+	kvm_riscv_hfence_gvma_vmid_gpa(kvm, -1UL, 0,
+				       gfn << PAGE_SHIFT, nr_pages << PAGE_SHIFT,
+				       PAGE_SHIFT);
+	return 0;
+}
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
