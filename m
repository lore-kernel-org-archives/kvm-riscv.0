Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592F5C54FB3
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 May 2025 22:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SxjltnwHpuhxO3kwgwE9dgOyNfZOi+xuiOy22p4pAgk=; b=mebz5DUdIOaoia
	fufSwQH0oxZqgbUHPJmIlp2jv3gdKfDyWkOKC/1LHynbVLwUs5X/Eo8Hev7CpcfqTcrSeIvBGKUBr
	bZRGj2C2s4TdlaUJ5m/aCLIeFK02GgVoQe7Uo4IEWV6uWc//Do1FxkbL60ghFdWBX/p/hS+BiLZ6F
	ULbELq6LBOn6mpi0Lkji+H3ffxbKWD+7e0RzhkN34UDnTzanZFrq6gggWu/RRAlJrEY7eNpjceJhR
	IRMgpVaKgdrbKEOVLlmEYjU/fLRUQ+aAERG4gouk+Slu7Lg4hqNlTqxLFdHHLSv4b6fzT5daOi+9m
	H0BfKLoWd+pmkzj2lHPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbc-0000000GchH-0NcE;
	Thu, 29 May 2025 22:20:08 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbZ-0000000Gcdt-1uOr
	for kvm-riscv@lists.infradead.org;
	Thu, 29 May 2025 22:20:06 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-311b0ec138eso1316582a91.2
        for <kvm-riscv@lists.infradead.org>; Thu, 29 May 2025 15:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748557204; x=1749162004; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=kksiwJTfpDAL7uAGNPhMF+vj8FOLnKEunyqXmWg1154=;
        b=qoZvfDogH6WB64s7FYdsmlKWQjGVGjmfJV/Lpo8S9DCHhaMhlXS1CHInrr4RYoOEqS
         cg0Jw1l0pzx6jdva0/GMAoVRWUxSYfOJyuxGHxOESDIVT0D8WjUmpCiioKgK/Abg5It9
         YQYfOpqFJPKwKr2FA/xukdHMw/EqB2meJnIuNc0A3+n2D8dEtHJ7lhlXiFpiByX4WBv5
         H5VTa5QVP6hzWz4+2l0InpvzC4muQXBoRifgNVHxIfAQvByVaaXJyd/fJW7nhnXL3/Dj
         E3H1E0+/XFYb4ZrSj6RcpfcUpRLzLz8fv7D+L1eJvHN3HeYAt85u2eOFrw2KrtdvDtct
         QWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748557204; x=1749162004;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kksiwJTfpDAL7uAGNPhMF+vj8FOLnKEunyqXmWg1154=;
        b=ANYI7LaHi8IOCfiyURhWgF/DH5UTNG3R78rPuxKOKeemUgpHXwx2A+I0HHOZVOrhcj
         fXdEDOPURgh2sYvLJaz6ly1ZLXIp4i00hR4FwbZi4JluPERcJXDUCRoScHTDbFYC8X0J
         +Pb6Qt9CjlDExO3P7iVUJ6P8aZT/kzjl4az+FE44IdRrHD1mTbbsNMWnXEXZIO0tETua
         m0CN3r13BMitNQLYpvBsW/mpczcu4AhErIfnhjMsAv244exsKqyZ+HOulp/z8G6pFSTG
         vdSfK8j1l0YDcLkKX8HpBBqdR3oEvb2PwUPcnpn6slj2n6x4kY2AUm7vi6BaWmrTW/2/
         GbJw==
X-Gm-Message-State: AOJu0YzdGeol0x08GcximSteMFYn+RQ+QuHs4/3c0pQjsyOqaMwhfiq3
	YU2JbhVvHI4NT8cAiQjv4P6Y2+kaOV529scCzRgjZji6bi4XoiDQ/ybJmQwDD79pWVZ5WPm1Ug+
	D7o9Z5A==
X-Google-Smtp-Source: AGHT+IHKKaHBRgZknqdVQGWWJiAz+zFT83aijCtSw3EwCIuFxlNev961CCgZ20g1aw/1KKs9yzGP7rIiVy0=
X-Received: from pjbcz13.prod.google.com ([2002:a17:90a:d44d:b0:30a:31eb:ec8e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:47:b0:30e:6a9d:d787
 with SMTP id 98e67ed59e1d1-31241532ec2mr2010769a91.11.1748557204407; Thu, 29
 May 2025 15:20:04 -0700 (PDT)
Date: Thu, 29 May 2025 15:19:27 -0700
In-Reply-To: <20250529221929.3807680-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250529221929.3807680-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529221929.3807680-15-seanjc@google.com>
Subject: [kvm-unit-tests PATCH 14/16] x86/sev: Use X86_PROPERTY_SEV_C_BIT to
 get the AMD SEV C-bit location
From: Sean Christopherson <seanjc@google.com>
To: Andrew Jones <andrew.jones@linux.dev>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, "=?UTF-8?q?Nico=20B=C3=B6hr?=" <nrb@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_152005_493758_8E2E3951 
X-CRM114-Status: UNSURE (   8.57  )
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

Use X86_PROPERTY_SEV_C_BIT instead of open coding equivalent functionality,
and delete the overly-verbose CPUID_FN_ENCRYPT_MEM_CAPAB macro.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 lib/x86/amd_sev.c | 10 +---------
 lib/x86/amd_sev.h |  6 ------
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/lib/x86/amd_sev.c b/lib/x86/amd_sev.c
index 4e89c84c..416e4423 100644
--- a/lib/x86/amd_sev.c
+++ b/lib/x86/amd_sev.c
@@ -33,19 +33,11 @@ bool amd_sev_enabled(void)
 
 efi_status_t setup_amd_sev(void)
 {
-	struct cpuid cpuid_out;
-
 	if (!amd_sev_enabled()) {
 		return EFI_UNSUPPORTED;
 	}
 
-	/*
-	 * Extract C-Bit position from ebx[5:0]
-	 * AMD64 Architecture Programmer's Manual Volume 3
-	 *   - Section " Function 8000_001Fh - Encrypted Memory Capabilities"
-	 */
-	cpuid_out = cpuid(CPUID_FN_ENCRYPT_MEM_CAPAB);
-	amd_sev_c_bit_pos = (unsigned short)(cpuid_out.b & 0x3f);
+	amd_sev_c_bit_pos = this_cpu_property(X86_PROPERTY_SEV_C_BIT);
 
 	return EFI_SUCCESS;
 }
diff --git a/lib/x86/amd_sev.h b/lib/x86/amd_sev.h
index defcda75..daa33a05 100644
--- a/lib/x86/amd_sev.h
+++ b/lib/x86/amd_sev.h
@@ -19,12 +19,6 @@
 #include "asm/page.h"
 #include "efi.h"
 
-/*
- * AMD Programmer's Manual Volume 3
- *   - Section "Function 8000_001Fh - Encrypted Memory Capabilities"
- */
-#define CPUID_FN_ENCRYPT_MEM_CAPAB    0x8000001f
-
 /*
  * AMD Programmer's Manual Volume 2
  *   - Section "SEV_STATUS MSR"
-- 
2.49.0.1204.g71687c7c1d-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
