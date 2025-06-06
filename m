Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32301C61CE7
	for <kvm-riscv@archiver.kernel.org>; Sat,  7 Jun 2025 00:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/R8YMtMHywuBAoZiUkEdzDm1kzilELjTp5zjgmtedIo=; b=VgdshuTvwFyKbDSLKSpBkjImFA
	wk/vk9K54fsYtQ+3S4hdqSYyCcvSpEA8XtgSkLrN4nYHtGtwL7dYemfPcL+s58wCdMpcv3YOCpkmO
	C7LNi6c04+I0+6vi8b+r+SOhmaDtD5pcLURzhwADbQOnbw+C6Juq9N88Eo+GrvSueiWKlJeVeWaw/
	ZHWP8wQIZpMopsC8TQNR2A1JDv8Gcl1CB35QKaxvmqF0OGV1A2m7Lg4okZ1JT5LAUnTyIfr3vA6+C
	5sPs2507DZ9TjpONHdxpyFb8pMdjQltJnrfxho7fNFJz4l1uP5oK1+I6vhkH49QAylCqy0f9RvI+m
	3sah0Q9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNhSr-00000001BcU-3wda;
	Sat, 07 Jun 2025 00:31:13 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNgvg-000000019HK-1Gk3
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 23:56:57 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7377139d8b1so2154693b3a.0
        for <kvm-riscv@lists.infradead.org>; Fri, 06 Jun 2025 16:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749254215; x=1749859015; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rQsDpgf8u91vw/WrLSGz0iJXQ6JiA2bq0U/tEH5QJI8=;
        b=ivt5yQqMnu+9J4rtjbe60EHvNqqDw0l66yct7JIWcYfkazyJyVnFA6xKDLpquQHvtw
         OESq/UOVabfFvrUeyFPEDtvFNxFIyoPitf3MvQv3vA/cMBSAP8XUveV/mnggqtTBk72D
         BH10FgDEvAzfcRypGy6Leg1lV33OXWzI1+CIplHQC9Barxiu1eWM5GGTVrJdChjXzvgp
         lKVPFR4UmTxGUPhyT27gCHAQTvpNJqwnsXrLoRORNiTdj9pMckxajaiOuNpH8Kds6NuT
         6CSAgkJItLmLAngoq2uFVw1mE7K37YV0yOghHmi8bMm4YCxQZsRdEuKXSE8kr+vsNKdk
         DBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749254215; x=1749859015;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rQsDpgf8u91vw/WrLSGz0iJXQ6JiA2bq0U/tEH5QJI8=;
        b=uL2bhMtMcwZ5hcqHSAHUus/ig/ie8YHg0Yl3vO0VsY8p+OrOowLnKaznf8JJEheuNz
         HMWnBZtg40SL4ALAz9LcMfIThUWWWHt09JUVeKdPiosgMQlDnicLwmHZTSuqzcYWAUsq
         6y3/Ves5+/HFjhV/7fOxzGa16iHd8A+wWQj0bHaEUBTaoQI6wD5Lg8hTxAyfTSC/1Yec
         L8vQYxnrn/uZcYH5OYoDftujLdHfdJsp9s0z63yi61L1VpM0Gx7q7Dx7+sBVE6xkS/iL
         zcBdX4SbGI9xaiVl/7lKrL9mgZWmITQcCkM1nI8yatJsGZa/Xj7WLK9dN6ZF1BFfLr68
         jPWA==
X-Forwarded-Encrypted: i=1; AJvYcCU4TjgA4AUX1kR7UzaFU+oTKaObbt7aX3r5X3eswnLJbQ4T5nc7iDK6KuYj/Qy+qK++ofMEcGPEYck=@lists.infradead.org
X-Gm-Message-State: AOJu0YzY9gLM3ojKharyvkm/N/YwmnppWcCeZZRz+9AN2ZvY9Dhjhkil
	oglRc2H6gica1DkgQUFeqcmG7PgKtXDhLGgaquRKbSHMg4tA35rLXuHLFUF6C60xpnjcNT3i7gc
	Bs1/RYy/Q7Q==
X-Google-Smtp-Source: AGHT+IGyp1ZByaQWclr+E1KDubTeknVJBEMfz1Flqb1492oOI1nXyfJVxjejhM42yZAw1MjGchfJyqOnrrck
X-Received: from pfiu22.prod.google.com ([2002:a05:6a00:1256:b0:747:b608:3d8e])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6009:b0:218:c22:e3e6
 with SMTP id adf61e73a8af0-21ee2555021mr6804011637.12.1749254215203; Fri, 06
 Jun 2025 16:56:55 -0700 (PDT)
Date: Fri,  6 Jun 2025 16:56:19 -0700
In-Reply-To: <20250606235619.1841595-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250606235619.1841595-16-vipinsh@google.com>
Subject: [PATCH v2 15/15] KVM: selftests: Add riscv auto generated test files
 for KVM Selftests Runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, anup@brainfault.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	maz@kernel.org, oliver.upton@linux.dev, dmatlack@google.com, 
	Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_165656_334739_103FF6BC 
X-CRM114-Status: GOOD (  10.72  )
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

Add auto generated test files for s390 platforms.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 tools/testing/selftests/kvm/tests/riscv/ebreak_test/default.test | 1 +
 .../testing/selftests/kvm/tests/riscv/sbi_pmu_test/default.test  | 1 +
 2 files changed, 2 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/tests/riscv/ebreak_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/riscv/sbi_pmu_test/default.test

diff --git a/tools/testing/selftests/kvm/tests/riscv/ebreak_test/default.test b/tools/testing/selftests/kvm/tests/riscv/ebreak_test/default.test
new file mode 100644
index 000000000000..d34b4b9b77ae
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/riscv/ebreak_test/default.test
@@ -0,0 +1 @@
+riscv/ebreak_test
diff --git a/tools/testing/selftests/kvm/tests/riscv/sbi_pmu_test/default.test b/tools/testing/selftests/kvm/tests/riscv/sbi_pmu_test/default.test
new file mode 100644
index 000000000000..5abb62c51097
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/riscv/sbi_pmu_test/default.test
@@ -0,0 +1 @@
+riscv/sbi_pmu_test
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
