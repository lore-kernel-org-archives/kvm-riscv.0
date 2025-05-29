Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31136C5AD49
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 May 2025 22:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZaAufHVlM51UVZ5qkgky55cHo8JLmCCXBspFIe4ggLY=; b=jshULEzvxzBEDk
	/Sifed9C0nx9O14WxA/qBMOeWS1wHBxHdSd4N7B4+2uoCzFwLNU7LIPI8s654ZgA1QKGeZd135MLb
	P2utVnmWB3voiS0GAd5GF2I0LWloE7te/q/+QsZJJx9y61ZhbJK06BfUuzViy2G5n2/n3oZf+Suip
	f6VJ2dadLAfOrUnlIaot2RhaBgxG8hehFZ1EKDiIHtNbGia6jE+zGZdeUwKlzD76vwWBL+jjHS3Be
	8agFRUQl2SDU2n2XH8nJ9Xm9/gqZVtPCsMa4xIM7AYmR+zrS3e3dcZP2kuNK+x/FYdSkjQvEjPtn1
	lyzIb58YIVmH6qev7tyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbZ-0000000Gcf3-3sdW;
	Thu, 29 May 2025 22:20:05 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbX-0000000GccN-39vP
	for kvm-riscv@lists.infradead.org;
	Thu, 29 May 2025 22:20:04 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b26e6b84a31so920888a12.2
        for <kvm-riscv@lists.infradead.org>; Thu, 29 May 2025 15:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748557203; x=1749162003; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=F2d3FMlUAt4L7Za+Jh9OinkPv4ozyteBA1ro5arBIes=;
        b=j24qONS2uFbb7Ru0HIBTAEaqCP33AASPPBisFkiaKrCcEHas7VOf7yKf5zQgHrXkUc
         4OE/8owB6FiSDalC0nGWlQPMzOaAoYHgkFPi7aFwhKAf2C6KzSi8M0MODWATzJxx5HYn
         obSxf1KUU2KITeLrrB6gV61k65cgERgHRZvm0g1rd7rauox8uSb3Dr9K4gOjLN2QnKmu
         fJARi/v1TN+8UT5pxfAPQhZ9cxWAsGkrG48S8ADrBMEPLekXv+CXn+0kHPmQ1eofvFwr
         n29ozLEAGETb1ujMLD/EFf/pAMrP4El3/l0wKLNuPW+kFfsY7b8fA4H+8oCjFua13jeD
         wA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748557203; x=1749162003;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F2d3FMlUAt4L7Za+Jh9OinkPv4ozyteBA1ro5arBIes=;
        b=v8TXs7RSa6ZD7Vh0hzc3GBsxcGbcgBcTtsrgRHfvSCgHDMlGEjrUxaX3wPs9H+ytAA
         Hn8v2s7lLoEChIJZ3eD5Ak5n3Iu2YQG2lBR13GqWbzvFnnzp6s/gQ2vBfpAc7riiZBB+
         Th1WW32O24Vvzq5sFr3gBV26KrTmnV3fkR0cwIbNRMdjKbr6hbK7NRB+aQ3f2he9UynU
         nI1LqYSQ8YTDDKIpHjo04vK8u/p3JZVbey07LcQHNJ6weiYuvv47HuVTOSDepOrxcsfx
         9hnsy2r95C7sqT3AjJ8vlC+aE4jVyzZIQUSIsys5VZSyv7JfGPH2pOqzGVq4fA+hVrOM
         gjRw==
X-Gm-Message-State: AOJu0YxDV1b7ZqVB4/Y7hY5DvE8Shl2bo4w7qdFUnFx/ag25510JKzIy
	jRig38szyeOkHr5cxk8Hg0/4+xXPa2y8sZOhx+9+Pgu0Dut9PVtYffMrFOVKwh7jBIFbIRyjyCo
	J6cNCLQ==
X-Google-Smtp-Source: AGHT+IGoB/vbp1vJwFtNq0D8Lm/f9YbFu83f0096VeeEb6qVMP4bkif1kVwjiObKHv+nfsOeM8aSdayaAmU=
X-Received: from pjbsv7.prod.google.com ([2002:a17:90b:5387:b0:311:e7e6:6d4d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2dcb:b0:312:e9d:3ff2
 with SMTP id 98e67ed59e1d1-3124150da88mr1962364a91.7.1748557202894; Thu, 29
 May 2025 15:20:02 -0700 (PDT)
Date: Thu, 29 May 2025 15:19:26 -0700
In-Reply-To: <20250529221929.3807680-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250529221929.3807680-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529221929.3807680-14-seanjc@google.com>
Subject: [kvm-unit-tests PATCH 13/16] x86/sev: Define and use X86_FEATURE_*
 flags for CPUID 0x8000001F
From: Sean Christopherson <seanjc@google.com>
To: Andrew Jones <andrew.jones@linux.dev>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, "=?UTF-8?q?Nico=20B=C3=B6hr?=" <nrb@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_152003_801298_92B3E08E 
X-CRM114-Status: GOOD (  10.97  )
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

Define proper X86_FEATURE_* flags for CPUID 0x8000001F, and use them
instead of open coding equivalent checks in amd_sev_{,es_}enabled().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 lib/x86/amd_sev.c   | 32 +++++---------------------------
 lib/x86/amd_sev.h   |  3 ---
 lib/x86/processor.h |  9 +++++++++
 3 files changed, 14 insertions(+), 30 deletions(-)

diff --git a/lib/x86/amd_sev.c b/lib/x86/amd_sev.c
index 6c0a66ac..4e89c84c 100644
--- a/lib/x86/amd_sev.c
+++ b/lib/x86/amd_sev.c
@@ -17,31 +17,15 @@ static unsigned short amd_sev_c_bit_pos;
 
 bool amd_sev_enabled(void)
 {
-	struct cpuid cpuid_out;
 	static bool sev_enabled;
 	static bool initialized = false;
 
 	/* Check CPUID and MSR for SEV status and store it for future function calls. */
 	if (!initialized) {
-		sev_enabled = false;
 		initialized = true;
 
-		/* Test if we can query SEV features */
-		cpuid_out = cpuid(CPUID_FN_LARGEST_EXT_FUNC_NUM);
-		if (cpuid_out.a < CPUID_FN_ENCRYPT_MEM_CAPAB) {
-			return sev_enabled;
-		}
-
-		/* Test if SEV is supported */
-		cpuid_out = cpuid(CPUID_FN_ENCRYPT_MEM_CAPAB);
-		if (!(cpuid_out.a & SEV_SUPPORT_MASK)) {
-			return sev_enabled;
-		}
-
-		/* Test if SEV is enabled */
-		if (rdmsr(MSR_SEV_STATUS) & SEV_ENABLED_MASK) {
-			sev_enabled = true;
-		}
+		sev_enabled = this_cpu_has(X86_FEATURE_SEV)
+			      rdmsr(MSR_SEV_STATUS) & SEV_ENABLED_MASK);
 	}
 
 	return sev_enabled;
@@ -72,17 +56,11 @@ bool amd_sev_es_enabled(void)
 	static bool initialized = false;
 
 	if (!initialized) {
-		sev_es_enabled = false;
 		initialized = true;
 
-		if (!amd_sev_enabled()) {
-			return sev_es_enabled;
-		}
-
-		/* Test if SEV-ES is enabled */
-		if (rdmsr(MSR_SEV_STATUS) & SEV_ES_ENABLED_MASK) {
-			sev_es_enabled = true;
-		}
+		sev_es_enabled = amd_sev_enabled() &&
+				 this_cpu_has(X86_FEATURE_SEV_ES) &&
+				 rdmsr(MSR_SEV_STATUS) & SEV_ES_ENABLED_MASK;
 	}
 
 	return sev_es_enabled;
diff --git a/lib/x86/amd_sev.h b/lib/x86/amd_sev.h
index ca7216d4..defcda75 100644
--- a/lib/x86/amd_sev.h
+++ b/lib/x86/amd_sev.h
@@ -21,12 +21,9 @@
 
 /*
  * AMD Programmer's Manual Volume 3
- *   - Section "Function 8000_0000h - Maximum Extended Function Number and Vendor String"
  *   - Section "Function 8000_001Fh - Encrypted Memory Capabilities"
  */
-#define CPUID_FN_LARGEST_EXT_FUNC_NUM 0x80000000
 #define CPUID_FN_ENCRYPT_MEM_CAPAB    0x8000001f
-#define SEV_SUPPORT_MASK              0b10
 
 /*
  * AMD Programmer's Manual Volume 2
diff --git a/lib/x86/processor.h b/lib/x86/processor.h
index 3b02a966..b656ebf6 100644
--- a/lib/x86/processor.h
+++ b/lib/x86/processor.h
@@ -320,6 +320,15 @@ struct x86_cpu_feature {
 #define X86_FEATURE_PFTHRESHOLD		X86_CPU_FEATURE(0x8000000A, 0, EDX, 12)
 #define	X86_FEATURE_VGIF		X86_CPU_FEATURE(0x8000000A, 0, EDX, 16)
 #define X86_FEATURE_VNMI		X86_CPU_FEATURE(0x8000000A, 0, EDX, 25)
+#define X86_FEATURE_SME			X86_CPU_FEATURE(0x8000001F, 0, EAX,  0)
+#define X86_FEATURE_SEV			X86_CPU_FEATURE(0x8000001F, 0, EAX,  1)
+#define X86_FEATURE_VM_PAGE_FLUSH	X86_CPU_FEATURE(0x8000001F, 0, EAX,  2)
+#define X86_FEATURE_SEV_ES		X86_CPU_FEATURE(0x8000001F, 0, EAX,  3)
+#define X86_FEATURE_SEV_SNP		X86_CPU_FEATURE(0x8000001F, 0, EAX,  4)
+#define X86_FEATURE_V_TSC_AUX		X86_CPU_FEATURE(0x8000001F, 0, EAX,  9)
+#define X86_FEATURE_SME_COHERENT	X86_CPU_FEATURE(0x8000001F, 0, EAX, 10)
+#define X86_FEATURE_DEBUG_SWAP		X86_CPU_FEATURE(0x8000001F, 0, EAX, 14)
+#define X86_FEATURE_SVSM		X86_CPU_FEATURE(0x8000001F, 0, EAX, 28)
 #define	X86_FEATURE_AMD_PMU_V2		X86_CPU_FEATURE(0x80000022, 0, EAX, 0)
 
 /*
-- 
2.49.0.1204.g71687c7c1d-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
