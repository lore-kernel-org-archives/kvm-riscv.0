Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8C4C71135
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 06:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6rb/1HUrToFiqSI15yO0Oj1XGOU5oZa4Nl3riChzAjw=; b=nShXqcfV2L+YC5
	GzOdQSybn/rutAyJFwODdr/Mr52GRjCeoj5Oo8kWjyvv1vIOxSQEZGNOxHoWnhwY8zy/yDj1THRX4
	lvBvEGYAAeXQcouzdFEmYCYJM8dFi91KLDsTeqNHkqvodUbBVvFzuENgDURPnUYHOFyYPFz0cYa8C
	PZ1eMST9Qq7TSDRpkXnBldS2rRWZ9lVzfC8lSVp2/ONw3LBB1/p2xyliorPD6u+ITGisAnmDhvAE6
	0M3xBFH0NlPF3zad+vxtac6wq/a/ZFvS40qv1fCT51JFrFiAoFX+BO/1Unf3hGP0vtqLj8XFBOE12
	0+eXL8h1mc6LX3PBizLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyMw-0000000FXZm-00GA;
	Fri, 13 Jun 2025 06:58:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyMu-0000000FXXu-19nc
	for kvm-riscv@bombadil.infradead.org;
	Fri, 13 Jun 2025 06:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+QkzcBlS9vLeXpRqbqSrDujMqO/PGHcWXsj9ZWs9Z+U=; b=QAL/DBSW25X8lDXRlQMy0boNSc
	8SyV7aSpgsAFdIjm9tSuk9aYZIqewmFd8Glwec+7GipkrjPzEs2FSsNypQ0XjCzsF/RomLxXJH80M
	8EGGj35v2F0yZnr0MPrwHsG0AmmV+Gn1zCVzIJvL4hSSCjaqOUFnA5+Yw9RA6XSQ5CpShRCNdMJc4
	6gHF0NH9AjOGUrecCTMa1A6BG51vKbrhMQLC8QRSkyj8OybFDxL/g43mlv7dSu0tNiadT1MDFyUHs
	kd+NrHgYxLFrjoJgt7nRv3dJOChMAIb0HceZy554Vc6riIgR4YDshvfrTTBGLt4BYljf4HonAInVj
	8xpVvqNA==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyMs-00000002rvp-076U
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 06:58:28 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-312116d75a6so1605923a91.3
        for <kvm-riscv@lists.infradead.org>; Thu, 12 Jun 2025 23:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749797902; x=1750402702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QkzcBlS9vLeXpRqbqSrDujMqO/PGHcWXsj9ZWs9Z+U=;
        b=Qi4Kw8iNeu2lPyb3sjL8el5NYL9AzbbSRAs7YcHKp1lugiABmz0fVnzRV57mKUc/zt
         /8NNzNrztIOSbupLsJQlDLxdFn2y1K+/L1i5EWNZfzZbjpwYMhlXLbvlie9SZGNunVO5
         lS7iUux+BAOVl7nJtpx7Gvfsp8QavMwaoBIO5Z6MM0Dbv8Sq2KyLVbxlwZ73luLu/hKz
         uxUPsfVwsuk6faqJi7lniZXdA+z7yTBmBigQDu2SntTiethrE7GJoAbyKzokUcGWXEk+
         KUxqGZt82dKaUO5IXQNSnoNoelz6l0mD9FLcnVjO27Glg2rbKW/ne3fV9527Pm9e7TeC
         0nxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749797902; x=1750402702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QkzcBlS9vLeXpRqbqSrDujMqO/PGHcWXsj9ZWs9Z+U=;
        b=JAwdbI2jCJPXJLtD7dwMWoWSrh3Aa0uaE1YrjGDZS/IEpPOVPcbVLoPRHEswvT5/ue
         o0jCX73Q214t5OL2LhJwqqqx7E/7bxn6PZx4TyUxASAJpF/qt+hqZdZJJRU96t1ZLcO5
         SEylPXVCdlwzZODAxo5iaCjghVCJX3kItwtlFVSy2tS5GQc0d8spFot26ogCW/35k+hn
         GaiixbOfLwd0L3i0hYEyekDmfql1z5flQLN1yH0VuwxM8tEg80PG0OgJsA7vSHB8/OXE
         vYX1UkmXqJwjKLGfW4NaH6iERQ3d+YabL3iYhcGnho8iwgNf0e2xhHX7iveP6hkFs69b
         PfUA==
X-Forwarded-Encrypted: i=1; AJvYcCWa3Jsr0whc9GPrV1KZ7+YrqGISB1ONgbPGGBY5wtQm7n6CoiZfV18cA0lfUAOH6aWl8FlormT7SIY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw33OFUzWEkTh0XqqP909pLwCqu+aPIUjxhsuAHsKM//fLmjUvR
	Z+2Wr8NirNkEabiXoeSu1Qb+HQo3zNBSCV/GpbAuLohgM2NetZABzZPlFN/iU6fKIv8=
X-Gm-Gg: ASbGnctte8UAG8JfJOuJPE0Wk/NDJWWSLZSAFhXRqBPCmAVTp7r18HRtnOJcFnsrS+V
	BQKRcwfGngwWZxbQjhSBt7vP60Cp38ChWlbN5z0v71VYNNexcHhh8eEcsVNWyx446gVEwwxdNtt
	j1I2/Lmzfwp37l3jo0Yn+a0pehyXhAGH1T/qu2JxkmDNUHYRqOzec8n2tyAoKrQAq7sYFF262Hf
	Dr/lTm6MMQlaZLy5rWEgkGQ4lv983KU20boMyp1kcwBFLXXR99yuqkQotQD6H352Nm6d1v7uVeJ
	2yL5kJ3zOv7fh+5KeSFRD3XiOh5rVhfDNJGoBKPm4pmKjP9gOhaxzvMgTa4HCGIH4iAtS0xa1ZS
	9dd3FbKFu4DmDtiHm2qg=
X-Google-Smtp-Source: AGHT+IFcoxTnNLLCaRe3MbV5XZ2eB09JQHRiE2nVJsRUpfaY0rXLYI7i9qxtUj8gRjcaZRLWDhOK7A==
X-Received: by 2002:a17:90b:28cf:b0:313:2768:3f6b with SMTP id 98e67ed59e1d1-313d9ed72f7mr2932665a91.27.1749797902357;
        Thu, 12 Jun 2025 23:58:22 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b49b7fsm2653022a91.24.2025.06.12.23.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 23:58:21 -0700 (PDT)
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
Subject: [PATCH v2 06/12] RISC-V: KVM: Implement kvm_arch_flush_remote_tlbs_range()
Date: Fri, 13 Jun 2025 12:27:37 +0530
Message-ID: <20250613065743.737102-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613065743.737102-1-apatel@ventanamicro.com>
References: <20250613065743.737102-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_075826_155771_F8551D2C 
X-CRM114-Status: GOOD (  11.41  )
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
index ff1f76d6f177..6162575e2177 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -43,6 +43,8 @@
 	KVM_ARCH_REQ_FLAGS(5, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_STEAL_UPDATE		KVM_ARCH_REQ(6)
 
+#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
+
 #define KVM_HEDELEG_DEFAULT		(BIT(EXC_INST_MISALIGNED) | \
 					 BIT(EXC_BREAKPOINT)      | \
 					 BIT(EXC_SYSCALL)         | \
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 29f1bd853a66..a5387927a1c1 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -344,7 +344,7 @@ static void gstage_wp_memory_region(struct kvm *kvm, int slot)
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
