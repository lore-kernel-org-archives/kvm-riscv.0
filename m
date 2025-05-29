Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FEFC5AD49
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 May 2025 22:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2WANc9aG66slfGvhZ+fzH/c+Fkc2Do2rN1YVPDWfYpc=; b=LKHCOfX8pkbFMA
	mA5xm+Qr6RJ6Q5NKjSjI4RQoz/ZXmvXmIqTM6y6DJLaQpwCLWTqfUbin2qPt0AEI57lhocazsbo1A
	u2ML1lKYfSCh+7N1FbQUTOzuFGE+YwwKOppCaAbU0ak58kILVH/pYazsQdAGHrTXB/lD3Kr2ijCHz
	NMa19DWzQQ4YzzthtjMOlEnVlPqpLhe30iJT3n/M66De4Mf0zgey5Dvl2NdB7KgaPlY8qoPzqMRFX
	CFV4qWngvOE3qk99WW8IGDVacrdWMi9eK7l5Cseu8GVu4QtI78vF4X0layYzHjEx+4KHJrjXprpdP
	c9q8uY8dMuRk0mEMz/1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbe-0000000Gcjz-36ZI;
	Thu, 29 May 2025 22:20:10 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbc-0000000GchE-3zqG
	for kvm-riscv@lists.infradead.org;
	Thu, 29 May 2025 22:20:10 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-311fa374c2fso1847468a91.2
        for <kvm-riscv@lists.infradead.org>; Thu, 29 May 2025 15:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748557207; x=1749162007; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=NK0WfiQ6dMxac+ln2k79b2QCfH8r8iVJ+iQJS1T9rfM=;
        b=pUXNAQtadKh9cdZov+EAd1BtJW6nRUccHNK86BSXjlSCaePKyfZB/0Er04qgcEOKe0
         qjS37N9jGPLhNzq4h4X4KZuunLmbPaF2pBITHQ99EDOcxgyURBIFq4T4+XD2wN0dShdr
         nO8QQ6AbsSDDzu54lNFdBlN+uGGcT+mvyj1U50xXkGO2PJHkKwq4if5k/g2oEUlY4MHl
         gGrJxdD7UhU+vqLheXKqv7AtehT3zOrv7tbqdIcPPXHW6wY0zkbWUgYeHf/GGDCAC8x1
         VlnjbtEEYRvDfiMqhtCfKF7xOvivNZVSJFJgGAXNpZooCpZ5xF79jqSSWR+EtPXZ1LmM
         PxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748557207; x=1749162007;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NK0WfiQ6dMxac+ln2k79b2QCfH8r8iVJ+iQJS1T9rfM=;
        b=xRj2JD8oG4sAB+EmuRceXMM9fp1yMiXUHxmQI6BHYqnd11VV06L4nKU7HBXZN68C7W
         51lQ9Uub3KxOpoH8M3SduW9Cc3UzeJVhFMyEc6MimDSs7ns5VgUAfTdpv/0L3vjCbavz
         UcVVswEF0qSXKv/Bqd5Gcb8M+lLuHi5291VHwkmpvZlVNYPtVW8kkXudyqM6O4A4ksHT
         ibrcRrN37dhtl+dPPXOO4aXRh8z4e0+eDnVroTpJ/sv5Qrt+mw7BfaTb0miVnUf/cnH7
         htpSwASkgNC+facSYNfzyp7vq88edv+UsZgziV9c9PZjWiKkfOPhhYBH5mUC5abrcpZh
         V19g==
X-Gm-Message-State: AOJu0YxDbTgfbo2RgrtXbCldPbivzPCFBSeG8Pss+RmHa3gtbgEJ8JBU
	BmMapznZiMqR3z/Mi2sjWdQrmO7NltREt/cRAtToYx/Lu4nyn59acwCyQXXIE+SlrWR1lHYMpLN
	BLJeA6Q==
X-Google-Smtp-Source: AGHT+IFrtz3sUzxuEz8YBbvvRR3+9tjsalY/Vak8TsELyOUfiAWzp5Y7ZOMIrESTx91f0Vlh2H9ZLU4kNZc=
X-Received: from pjyp7.prod.google.com ([2002:a17:90a:e707:b0:312:4274:c4ce])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1e09:b0:311:9c1f:8516
 with SMTP id 98e67ed59e1d1-31241518d5cmr1855970a91.15.1748557207601; Thu, 29
 May 2025 15:20:07 -0700 (PDT)
Date: Thu, 29 May 2025 15:19:29 -0700
In-Reply-To: <20250529221929.3807680-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250529221929.3807680-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529221929.3807680-17-seanjc@google.com>
Subject: [kvm-unit-tests PATCH 16/16] x86: Move SEV MSR definitions to msr.h
From: Sean Christopherson <seanjc@google.com>
To: Andrew Jones <andrew.jones@linux.dev>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, "=?UTF-8?q?Nico=20B=C3=B6hr?=" <nrb@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_152008_999877_3C82AAA7 
X-CRM114-Status: UNSURE (   9.84  )
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

Move the SEV MSR definitions to msr.h so that they're available for non-EFI
builds.  There is nothing EFI specific about the architectural definitions.

Opportunistically massage the names to align with existing style.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 lib/x86/amd_sev.c |  8 ++++----
 lib/x86/amd_sev.h | 14 --------------
 lib/x86/msr.h     |  6 ++++++
 3 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/lib/x86/amd_sev.c b/lib/x86/amd_sev.c
index 416e4423..7c6d2804 100644
--- a/lib/x86/amd_sev.c
+++ b/lib/x86/amd_sev.c
@@ -24,8 +24,8 @@ bool amd_sev_enabled(void)
 	if (!initialized) {
 		initialized = true;
 
-		sev_enabled = this_cpu_has(X86_FEATURE_SEV)
-			      rdmsr(MSR_SEV_STATUS) & SEV_ENABLED_MASK);
+		sev_enabled = this_cpu_has(X86_FEATURE_SEV) &&
+			      rdmsr(MSR_SEV_STATUS) & SEV_STATUS_SEV_ENABLED;
 	}
 
 	return sev_enabled;
@@ -52,7 +52,7 @@ bool amd_sev_es_enabled(void)
 
 		sev_es_enabled = amd_sev_enabled() &&
 				 this_cpu_has(X86_FEATURE_SEV_ES) &&
-				 rdmsr(MSR_SEV_STATUS) & SEV_ES_ENABLED_MASK;
+				 rdmsr(MSR_SEV_STATUS) & SEV_STATUS_SEV_ES_ENABLED;
 	}
 
 	return sev_es_enabled;
@@ -100,7 +100,7 @@ void setup_ghcb_pte(pgd_t *page_table)
 	pteval_t *pte;
 
 	/* Read the current GHCB page addr */
-	ghcb_addr = rdmsr(SEV_ES_GHCB_MSR_INDEX);
+	ghcb_addr = rdmsr(MSR_SEV_ES_GHCB);
 
 	/* Search Level 1 page table entry for GHCB page */
 	pte = get_pte_level(page_table, (void *)ghcb_addr, 1);
diff --git a/lib/x86/amd_sev.h b/lib/x86/amd_sev.h
index daa33a05..9d587e2d 100644
--- a/lib/x86/amd_sev.h
+++ b/lib/x86/amd_sev.h
@@ -19,23 +19,9 @@
 #include "asm/page.h"
 #include "efi.h"
 
-/*
- * AMD Programmer's Manual Volume 2
- *   - Section "SEV_STATUS MSR"
- */
-#define MSR_SEV_STATUS      0xc0010131
-#define SEV_ENABLED_MASK    0b1
-#define SEV_ES_ENABLED_MASK 0b10
-
 bool amd_sev_enabled(void);
 efi_status_t setup_amd_sev(void);
 
-/*
- * AMD Programmer's Manual Volume 2
- *   - Section "GHCB"
- */
-#define SEV_ES_GHCB_MSR_INDEX 0xc0010130
-
 bool amd_sev_es_enabled(void);
 efi_status_t setup_amd_sev_es(void);
 void setup_ghcb_pte(pgd_t *page_table);
diff --git a/lib/x86/msr.h b/lib/x86/msr.h
index 658d237f..ccfd6bdd 100644
--- a/lib/x86/msr.h
+++ b/lib/x86/msr.h
@@ -523,4 +523,10 @@
 #define MSR_VM_IGNNE                    0xc0010115
 #define MSR_VM_HSAVE_PA                 0xc0010117
 
+#define MSR_SEV_STATUS			0xc0010131
+#define SEV_STATUS_SEV_ENABLED		BIT(0)
+#define SEV_STATUS_SEV_ES_ENABLED	BIT(1)
+
+#define MSR_SEV_ES_GHCB			0xc0010130
+
 #endif /* _X86_MSR_H_ */
-- 
2.49.0.1204.g71687c7c1d-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
