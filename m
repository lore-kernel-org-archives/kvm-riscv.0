Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4ED7C5B543
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 May 2025 22:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e6WhWnrxQtt/8dNI18u1Txn6JSd+4EUWB/xI6ZGN5NA=; b=VIFL3ZQodMqvjX
	iw8EquTDXrHVkzuZT7eOd1LBVzHnGty2ITmDkZs1QXLQ5f80U35KD89kRHwwIjcw/rQVF6jmIEceF
	u8RKTxqfP2pptEilPd8jdLpSmZMG5g8EhcF49kJHcma7MVcwYsLcysYJQQb4c2oe9bVrwSlMNxAUA
	I9EujEuiG/INdoSVsCb02NByiKgSzBci5G5sJ8uKhOU2wnE7+7ZH9R1Iij8p8Uh0sEXxjkOEF3UV3
	KRej/1mk3FNNNu+GrJyGBTrFCaFKzSGN/ii/FgDoYeahzsgw6jKLOZnE1lX1kRx1H+EbarpfUAPpN
	wgDD8cvW7hOnZkOu6hJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbZ-0000000GceW-2aDL;
	Thu, 29 May 2025 22:20:05 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbW-0000000GcbV-1huP
	for kvm-riscv@lists.infradead.org;
	Thu, 29 May 2025 22:20:03 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-23425b537aeso11017645ad.3
        for <kvm-riscv@lists.infradead.org>; Thu, 29 May 2025 15:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748557201; x=1749162001; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=h+zxmynRuus8JTcz4oQ0nDPY5j7Ch469QosRqaeXlg8=;
        b=EdZ7StF/byKJNCi0vhPFFUd54WE9Q2Z5KqXuTxzTOAHNd0Y8gGZwvxQV4G1mY6UOy/
         +zSrPO6EFV2wYZmE0QzRWedOqm4iAMw58T+QYhuiQNkrDYaxls5uQoaRi3pXJwTjIFQ6
         fnq6f1Tc3cTocQY4iNB9G1KE7lZd5xUbvFCXKDezGxesZVVpf0VWTRCG1xDcQBwyn9zb
         7eJobdmys7LuzKqZAwnNAJrU9jUME60xWs277yfdxmlKrDeKONj9UmaUnrcVBynAEEE7
         DGb9auNXl5QqZThhpu7KFd7Sja8TCTxePVDrpFcBQ8HbfT1NGs1RGnJEfWe/spPchMOG
         TXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748557201; x=1749162001;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+zxmynRuus8JTcz4oQ0nDPY5j7Ch469QosRqaeXlg8=;
        b=g4UW2kPisSfow40fMGJCdFvP5bVICzNsAoj0a4ulQUqrFR0rt69ALJoB5tc64nZt6t
         mY0vdXOetqLfO295kKvFP3ukqJJpa8B2s6svdaHdUE4a/q54tVuIZrJ9QWfgi1AJFOXw
         YTaYlWsUcaJJSi+9d2QZNC2doH36Q/5CpMAkjagwDL3muyzRj9NvTMGyo7qmzw0DoHHZ
         N5dL7fG2MW9gi2XAguIQV8oCRPiXpzby3bzY3EDAJ7jtw3JJ+j90JCvBrohRWft6ddvo
         y6HCR4wChgRmiEAGyTawuevd1An6/0wr/j56DmNoLUac7bpkBaNZrmSgo/T+f8CoC9//
         ZelQ==
X-Gm-Message-State: AOJu0YwkXvdwvAmLbdQSQVhExY/jXZl2BbKyFH0CT7IsRd2tjrpE7SoD
	ixK9nQzqKY8Jlb5HrTuD+vGdcTml4mb16Dt9mo+Cf5OpupHKQeHfpROx7HUcLrJ/0xCwHcdJ4i8
	2oXai9Q==
X-Google-Smtp-Source: AGHT+IGkWRHpejvhd2ldNGU9YUglc3/C3NmA+k/oaq+HdU4jZaE1V6i6HKiDHjwmfVv91+C2M/Od+vROETo=
X-Received: from plblh14.prod.google.com ([2002:a17:903:290e:b0:234:d2a4:ddf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fc8f:b0:234:cc7c:d2fc
 with SMTP id d9443c01a7336-23529a0f482mr14516585ad.27.1748557201422; Thu, 29
 May 2025 15:20:01 -0700 (PDT)
Date: Thu, 29 May 2025 15:19:25 -0700
In-Reply-To: <20250529221929.3807680-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250529221929.3807680-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529221929.3807680-13-seanjc@google.com>
Subject: [kvm-unit-tests PATCH 12/16] x86/sev: Skip the AMD SEV test if SEV is unsupported/disabled
From: Sean Christopherson <seanjc@google.com>
To: Andrew Jones <andrew.jones@linux.dev>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, "=?UTF-8?q?Nico=20B=C3=B6hr?=" <nrb@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_152002_472155_05D2B932 
X-CRM114-Status: GOOD (  11.51  )
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

Skip the AMD SEV test if SEV is unsupported, as KVM-Unit-Tests typically
don't report failures if feature is missing.

Opportunistically use amd_sev_enabled() instead of duplicating all of its
functionality.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 x86/amd_sev.c | 51 +++++++--------------------------------------------
 1 file changed, 7 insertions(+), 44 deletions(-)

diff --git a/x86/amd_sev.c b/x86/amd_sev.c
index 7757d4f8..4ec45543 100644
--- a/x86/amd_sev.c
+++ b/x86/amd_sev.c
@@ -15,51 +15,10 @@
 #include "x86/amd_sev.h"
 #include "msr.h"
 
-#define EXIT_SUCCESS 0
-#define EXIT_FAILURE 1
-
 #define TESTDEV_IO_PORT 0xe0
 
 static char st1[] = "abcdefghijklmnop";
 
-static int test_sev_activation(void)
-{
-	struct cpuid cpuid_out;
-	u64 msr_out;
-
-	printf("SEV activation test is loaded.\n");
-
-	/* Tests if CPUID function to check SEV is implemented */
-	cpuid_out = cpuid(CPUID_FN_LARGEST_EXT_FUNC_NUM);
-	printf("CPUID Fn8000_0000[EAX]: 0x%08x\n", cpuid_out.a);
-	if (cpuid_out.a < CPUID_FN_ENCRYPT_MEM_CAPAB) {
-		printf("CPUID does not support FN%08x\n",
-		       CPUID_FN_ENCRYPT_MEM_CAPAB);
-		return EXIT_FAILURE;
-	}
-
-	/* Tests if SEV is supported */
-	cpuid_out = cpuid(CPUID_FN_ENCRYPT_MEM_CAPAB);
-	printf("CPUID Fn8000_001F[EAX]: 0x%08x\n", cpuid_out.a);
-	printf("CPUID Fn8000_001F[EBX]: 0x%08x\n", cpuid_out.b);
-	if (!(cpuid_out.a & SEV_SUPPORT_MASK)) {
-		printf("SEV is not supported.\n");
-		return EXIT_FAILURE;
-	}
-	printf("SEV is supported\n");
-
-	/* Tests if SEV is enabled */
-	msr_out = rdmsr(MSR_SEV_STATUS);
-	printf("MSR C001_0131[EAX]: 0x%08lx\n", msr_out & 0xffffffff);
-	if (!(msr_out & SEV_ENABLED_MASK)) {
-		printf("SEV is not enabled.\n");
-		return EXIT_FAILURE;
-	}
-	printf("SEV is enabled\n");
-
-	return EXIT_SUCCESS;
-}
-
 static void test_sev_es_activation(void)
 {
 	if (rdmsr(MSR_SEV_STATUS) & SEV_ES_ENABLED_MASK) {
@@ -88,10 +47,14 @@ static void test_stringio(void)
 
 int main(void)
 {
-	int rtn;
-	rtn = test_sev_activation();
-	report(rtn == EXIT_SUCCESS, "SEV activation test.");
+	if (!amd_sev_enabled()) {
+		report_skip("AMD SEV not enabled\n");
+		goto out;
+	}
+
 	test_sev_es_activation();
 	test_stringio();
+
+out:
 	return report_summary();
 }
-- 
2.49.0.1204.g71687c7c1d-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
