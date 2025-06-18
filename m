Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BCFC7115D
	for <kvm-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0S4hu0ulnKJLov8F/tiz9VRN0nWafjixmOR+x6hAXAA=; b=SH+YY1rVCi9+Gb
	ep25ptaWkUXFaO6rfb9EsueLZ0/+sBhwBTjv+sFx25ec1HYI4fMv+PSyiHAaT6B4mIK9XGBTPU40Q
	fzILtuYsZqfrJZlY1E/gXJ9rlLcBPlyri0T1Lh7+IbaNlXctr/2dbT6OhMZ6ZwYaE7xpJKQ0parqt
	pRSZL4ejg4pMJ+bsdod/lqv3hyPMQcU9/RpLWFUOpV5krWC0og1gkza6KXQj3Eh75ADpDTF4Bhxxq
	iQRs8mIWr6Y/iYacZufokylR8eq5DFi7GZQlaC61qoowll8yTs5ENLoSXawDhIX/ihOlLMFU/dTHk
	RHHDiF+fIufXTNJ35BZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsWp-0000000AEgq-2ENe;
	Wed, 18 Jun 2025 13:08:35 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRr5T-00000009xj9-3F5b
	for kvm-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 11:36:17 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2363e973db1so4872935ad.0
        for <kvm-riscv@lists.infradead.org>; Wed, 18 Jun 2025 04:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750246575; x=1750851375; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fsGDp/PENI7aB5HoDYrfk/XMREQKVS7VE/vtxv5oiE=;
        b=dw7o4H+gzjcBNWDzaaYWYCjNOAAjPtPGRLKNmpS6eHYQhfWN1+NeeLSfdH0xgpVUE5
         n+/7xBGYFkPb8vNkv3mY3gSGiTvyp4Gcy7+xWCWTjwiO3gUE44j9OrDL/MNmLun4rNcI
         u+skEJNfqNci0IbiP7VuXXMRkK8rcK/JiYXN2aGax16nd/hGb54BW5wTm7uptTccBFdW
         Z8uTb0Slkg/xrJM/78oCMAhIS76INF/y1YVrbnqYujelcQu04wYGldfpuGCP0y4S++qb
         kYMEWoN2aKFuWZ2DeZ9xegd/7Tib8M2G0AxDKJMdeSBbwoSX7ErvjC5vg017oa6pMBlM
         8a2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246575; x=1750851375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fsGDp/PENI7aB5HoDYrfk/XMREQKVS7VE/vtxv5oiE=;
        b=WaIKOsI+QpNajabdMG7a/u+siS3tC6Ernl0XCmwZf84TCr2y5yrY8ZAkyF6cfA7U5t
         8EyLVYhrHnULDbdMB4/47eAlhvcvPmtaRF3je0IT4SFHai4QUWCwejHB8OfbZZVzFDqd
         7nPPRU1WYD5JqchEX+IzoS+SoIMNefJh8KR7UjxZmA5SdruRLpIVy6FMbE9IsTnb1vTE
         cztTmI3bWL7Zm/Z5t9s2hUkYwHNO9aVZzo/lUdlgDci08hhuMrmOKRuR90xnbDdRMLs/
         vNIhK/PJJ7cS6WUdqjLVNhENckVC+BYnEJzRKmufSH3TOGbBFzXFG/C98iFZZc2CCAOK
         Hcqg==
X-Forwarded-Encrypted: i=1; AJvYcCVym04UaHU/WtQgj0zl2sdldOajRXqsbnsbCcORWnB7Sa0XOVOkXCqfvrwddgvhzCKUyv004jTTJsg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZNvNMBpZtXtMUYAymUEjL8eVOekHhor07Y3GsqosxullOsZPC
	WQMtSkmA9qCAUUAHg2FRVvc7CoOW587r7kQNced2+BpkdsRHC4r1Oyawp/8bl3UKKzM=
X-Gm-Gg: ASbGncuVhDe3J3AyvtLOOAzCs+COa1Ni8rqpecr/nyDlpZTf96lHt30ON6PYu06aDV4
	Sia+IAU5DDa3iYg2sC7fmbsT/6h5PV2GP6QVtnPlF+gjG1oZ81h9LzptNdQjs6l9W961Uq7T6Zx
	rCumE52MCmfCAR5D/pxcJLujt+1p/hh33UDXvhxKe2wSPpfFORXky4P2Sjp0hfJC3biZ5Ncbm7U
	3YixYdAyahV47q1ZkVWaloni4WmeN9QuRaMkcSgnGy6PdulrOUYqgbdkkr8OKbZ5yut7QCjBDPT
	IjZU8WbEqz728tLsmcpm0mrxZVhQp3AE+iVS/6bhrgDm4qww9VKqjxEYD9eRZXqM42CiP3r17xe
	mysLJqVA/bHOeyUwM3w==
X-Google-Smtp-Source: AGHT+IGPdPYj0gZ7Vn94CMfnaQxwq36XrmsmDwGfdD+JAuyfQGtPOHOXGGbxG4KxhqzNEij1VvDbCA==
X-Received: by 2002:a17:902:ec89:b0:22e:457d:3989 with SMTP id d9443c01a7336-237c1d2a8b3mr37447295ad.0.1750246574778;
        Wed, 18 Jun 2025 04:36:14 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237c57c63efsm9112475ad.172.2025.06.18.04.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:36:14 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 06/12] RISC-V: KVM: Implement kvm_arch_flush_remote_tlbs_range()
Date: Wed, 18 Jun 2025 17:05:26 +0530
Message-ID: <20250618113532.471448-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618113532.471448-1-apatel@ventanamicro.com>
References: <20250618113532.471448-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_043615_816421_589A2456 
X-CRM114-Status: GOOD (  11.11  )
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

Reviewed-by: Atish Patra <atishp@rivosinc.com>
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
