Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B665FC5B543
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 May 2025 22:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yAMd47xA2L0JJoFyTxlpdVisS5vYuvqfNtgnBYE04iA=; b=3jN+a2nGpLuBHe
	IpSijrLeNEVCTrbUJ+Mv/qlwFzXE1WvFKro+941mHXd8Wk0/WKdVDBJPShWqzJdPggiknHrIdrNvz
	NbNG37W716nDQyE39C4sqvO8VtMlCZe3iqbY4mfxm15SQrTMn4ptUzk0+Imb1DQEmdSJQA3XwSFOw
	l4VxW96Dsm1dEpioRpfXVcOLnh1HWwiI3PB8n0eSkjbacFMEzlPR16R5n80eZg1lxeH+9au3hacY3
	FZ/iT4gicoG/5SjLnJMPNvg+rtTVKvXKYaCxcrxqzsHtZrGljMHH8azoZ7SCuG3R8D3g6djaX7ZVG
	q9jVIJC60XQSByKOoV0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbd-0000000Gcis-1puJ;
	Thu, 29 May 2025 22:20:09 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbb-0000000Gcff-1zPM
	for kvm-riscv@lists.infradead.org;
	Thu, 29 May 2025 22:20:08 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-745fd5b7b65so1103910b3a.0
        for <kvm-riscv@lists.infradead.org>; Thu, 29 May 2025 15:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748557206; x=1749162006; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=6ecWAsuLWk8WolZhf3FVD8zH2KTmGRghOSDHe/J8+gA=;
        b=qjcJZIQQJsCp6zKll7vkal7Earb325xQ/428i92w7gL+HnOtOmCroTTv6OCb4XKamK
         pweqRysf8QGqU7OIJ+welRLO4/unPtRxth38x1k91YPTX02/fEs/tVutJ+dzDKnxsqK3
         5CoS/ieNE5BcJ9U4XZ3kNagdxLrgbyGZHqXD6Bwynhg9QdwPH4JSMFmP48MigaZ+kex/
         Ljj0KevAScJmHCgQijWjUJ35Jet5W6/ez5El+ojXGRsFUbBA6sCAoBK3o2I2MbP44Vxj
         7LXgjgopmdhj7l8YoATZ5OcANlWFwOWCCz5hAxWC9rGqiLzrNvLM1FYw3CZZCT/A6TfM
         FfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748557206; x=1749162006;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ecWAsuLWk8WolZhf3FVD8zH2KTmGRghOSDHe/J8+gA=;
        b=Px7ymjsaxUmCfa1HWjH3atBsYNxlxPpyLraR9VmC0PAZ9ir9RMINBeqRVOZElBgr/P
         myakjurlzhklju3INaPlBUi89pSkuaq9YNVFHcEp8T+eYxCvqkJYJ7iSlMjFrBBRNXt+
         bP69t/tiGapEKsyyqeQrhbFSqPcZ5bwEvAi0qqWjWKF1dc2CtgUNxXyNzXjnplaWj6VE
         SarBv+stK6mHkQBK/7VjNd1UE/QCeSRaVinPjUZOvshNdhSviUrfWwRhgWem/Ge1nEqs
         yfEp88l6cWTiD8XtDn4lV8R+vunFx0+7y3vL55/vZS6z3LIEd2ijtEgRdT1xt1UE/9Wt
         UuEg==
X-Gm-Message-State: AOJu0YzkMkAVbF/ZQM1CDz0MQIglxAgg7jRLh+7HS8sF3sX/ZO4PDldV
	XhEgBpXqFOtxIjOu6M1fhwHiQ5CF9H8oZ9M4UC3Cmj+2dl9nvxIGexXjBa/RoQbZ4HY5lHqF3pF
	2/BLNOA==
X-Google-Smtp-Source: AGHT+IGqdlQWraG/z6hu1nUR7A5tPeMrZxdUjf3SOgtsQ8w8e/wxZYYVtAEj8FDmoGPeh69VqlnpQFBPrIg=
X-Received: from pfly12.prod.google.com ([2002:a62:f24c:0:b0:740:5196:b63a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2d03:b0:73f:e8c:1aac
 with SMTP id d2e1a72fcca58-747bd968a6cmr1447650b3a.2.1748557206151; Thu, 29
 May 2025 15:20:06 -0700 (PDT)
Date: Thu, 29 May 2025 15:19:28 -0700
In-Reply-To: <20250529221929.3807680-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250529221929.3807680-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529221929.3807680-16-seanjc@google.com>
Subject: [kvm-unit-tests PATCH 15/16] x86/sev: Use amd_sev_es_enabled() to
 detect if SEV-ES is enabled
From: Sean Christopherson <seanjc@google.com>
To: Andrew Jones <andrew.jones@linux.dev>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, "=?UTF-8?q?Nico=20B=C3=B6hr?=" <nrb@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_152007_515740_645B309D 
X-CRM114-Status: UNSURE (   8.89  )
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

Use amd_sev_es_enabled() in the SEV string I/O test instead manually
checking the SEV_STATUS MSR.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 x86/amd_sev.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/x86/amd_sev.c b/x86/amd_sev.c
index 4ec45543..7c207a07 100644
--- a/x86/amd_sev.c
+++ b/x86/amd_sev.c
@@ -19,15 +19,6 @@
 
 static char st1[] = "abcdefghijklmnop";
 
-static void test_sev_es_activation(void)
-{
-	if (rdmsr(MSR_SEV_STATUS) & SEV_ES_ENABLED_MASK) {
-		printf("SEV-ES is enabled.\n");
-	} else {
-		printf("SEV-ES is not enabled.\n");
-	}
-}
-
 static void test_stringio(void)
 {
 	int st1_len = sizeof(st1) - 1;
@@ -52,7 +43,8 @@ int main(void)
 		goto out;
 	}
 
-	test_sev_es_activation();
+	printf("SEV-ES is %senabled.\n", amd_sev_es_enabled() ? "" : "not");
+
 	test_stringio();
 
 out:
-- 
2.49.0.1204.g71687c7c1d-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
