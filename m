Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38537C61CE7
	for <kvm-riscv@archiver.kernel.org>; Sat,  7 Jun 2025 00:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=W/T/akCfYIe0adUJgQBtNXlBX2rbUOH6fKwK7mJGRgc=; b=FsvjgkV57g6RRyhdpJVmdLd8+f
	Epxaabmzd3vTyTRKfYKXOE9GUDnAa6LV4gVPRqfPHqK29R3+C0KF6Qvo2TJ8IXBbmhq1+b9c2u2sK
	NNTnv/9h9BZvWZzNg0NT/MXiqZGJ6YTK2jFHC5Q2Q6mcJAlsVBh0jooMx+uAnYPROpVkM4fa9U9/k
	u1LvvnZz7KMqNEsVDJD9wDzwoVle6lDf6v5ufZAkKuFl+juV+J6rwnbn/zCVt7vrqnl87bRBmE/qP
	4e5cbk6sN/rXy/5nVNwkWbjEw5cOluLk7lMC8/LMG/bsNseRvMvbYhYdCptixyA0BShTlp49i+qYx
	V71kTx7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNhOg-00000001BOl-3PXT;
	Sat, 07 Jun 2025 00:26:54 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNgvd-000000019Er-0Gfy
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 23:56:55 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-74292762324so2652772b3a.0
        for <kvm-riscv@lists.infradead.org>; Fri, 06 Jun 2025 16:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749254212; x=1749859012; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qu1B0vc7yWbsW+rKAINzGAVsuBa1AMOLkrNMvFT9P3s=;
        b=CS/05qOlQkH8eyPZTChR5ohwl9fKMup+0et3gUvVwXQF5olwFNPmsmut6l7UNF/3t+
         Q6WPv+mtIUsS2fGydWyFFx2Qz2LXoKxluOYufK3cYqzxEhVtDHbpy/2O++PxdK6YpwPZ
         A3B/QeAzVjRcs7faHb2Ek+hjfhNQvGkv5th6GPqm/fZdFEa0WjbwyyN/uOBnqrmLKtOX
         6WURpLOznUN23twsBHm6viSGfQxV3gl4tcAhUKpGmjlL4fO5GJEW+FCAreszXB9DPsJZ
         TLoMlV5+Bh70B2ITXc16VQd1KZa70YkurZ5LBj94Cb0qrPMiV1xMcbDpU07xFyn4patD
         lJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749254212; x=1749859012;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qu1B0vc7yWbsW+rKAINzGAVsuBa1AMOLkrNMvFT9P3s=;
        b=L5lnfXWJdnE6If9n3bXm0laEPzcRy/06zUyrVetjjylpFoc4D33R5N/q97lk+eGT9H
         ntXGTmDDrmNiJJfjJcIadLBukVRW78Ak+A2MsozWUh4e9lqEk+J8O54WojRvZPYLFeJY
         SciL4TIwPmhxWi7Kix3PqoHpKCP9t1e3YXeNGtXsuuczuQSPJSTCoQiYSB9gnn5yw1S3
         hWD45WMXI3LPoN2gLS2NA3i9Nf1j1UwybDVWdVYEj3S8FQdM0A/fLn1KOHMWhoc0prIJ
         gg640mbEYn80WRMjmaIGzM2VLsmlIZMtv5PDPm7FE6W+5tZKCfTLEGVOqTXChEAWl3bb
         z7WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDXgqvwSM3f3UdvKINS5TECOAYunOOJkF964vTa8YYh1QmAiiSsoxAqlWsdOR79aFZlleVHnfnMOQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyiZJ6ZbkMEAT+DhZtgpHvDHEnemi3MgGkIpykQor7TBQ1fAr8H
	QyL/zCEegavcXlbowAnLm9ywiikwHQ1MyAsuO/ZVhzKiNKyosyvxIBay8cR2A0Es+Zlwu4UGDQE
	BJI/pN8lgcA==
X-Google-Smtp-Source: AGHT+IE9Z9v/BE8RbJx8HxWBNlBZkwC9QUKC5wtM41pIlGUzD9tGi9yGCVQWA834njnwpPNlSWj8ZpkvvF9W
X-Received: from pfbhw18.prod.google.com ([2002:a05:6a00:8912:b0:748:8e9:968e])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:69b:b0:21a:de8e:5cc3
 with SMTP id adf61e73a8af0-21ee24cbf1bmr6832335637.4.1749254211881; Fri, 06
 Jun 2025 16:56:51 -0700 (PDT)
Date: Fri,  6 Jun 2025 16:56:17 -0700
In-Reply-To: <20250606235619.1841595-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250606235619.1841595-14-vipinsh@google.com>
Subject: [PATCH v2 13/15] KVM: selftests: Add arm64 auto generated test files
 for KVM Selftests Runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, anup@brainfault.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	maz@kernel.org, oliver.upton@linux.dev, dmatlack@google.com, 
	Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_165653_097500_CB9582C6 
X-CRM114-Status: GOOD (  10.42  )
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

Add auto generated test files for ARM platform.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 tools/testing/selftests/kvm/tests/arch_timer/default.test        | 1 +
 .../selftests/kvm/tests/arm64/aarch32_id_regs/default.test       | 1 +
 .../selftests/kvm/tests/arm64/arch_timer_edge_cases/default.test | 1 +
 .../selftests/kvm/tests/arm64/debug-exceptions/default.test      | 1 +
 tools/testing/selftests/kvm/tests/arm64/hypercalls/default.test  | 1 +
 tools/testing/selftests/kvm/tests/arm64/mmio_abort/default.test  | 1 +
 tools/testing/selftests/kvm/tests/arm64/no-vgic-v3/default.test  | 1 +
 .../selftests/kvm/tests/arm64/page_fault_test/default.test       | 1 +
 tools/testing/selftests/kvm/tests/arm64/psci_test/default.test   | 1 +
 tools/testing/selftests/kvm/tests/arm64/set_id_regs/default.test | 1 +
 .../testing/selftests/kvm/tests/arm64/smccc_filter/default.test  | 1 +
 .../selftests/kvm/tests/arm64/vcpu_width_config/default.test     | 1 +
 tools/testing/selftests/kvm/tests/arm64/vgic_init/default.test   | 1 +
 tools/testing/selftests/kvm/tests/arm64/vgic_irq/default.test    | 1 +
 .../selftests/kvm/tests/arm64/vgic_lpi_stress/default.test       | 1 +
 .../selftests/kvm/tests/arm64/vpmu_counter_access/default.test   | 1 +
 tools/testing/selftests/kvm/tests/get-reg-list/default.test      | 1 +
 17 files changed, 17 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/tests/arch_timer/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/aarch32_id_regs/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/arch_timer_edge_cases/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/debug-exceptions/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/hypercalls/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/mmio_abort/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/no-vgic-v3/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/page_fault_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/psci_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/set_id_regs/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/smccc_filter/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/vcpu_width_config/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/vgic_init/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/vgic_irq/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/vgic_lpi_stress/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/vpmu_counter_access/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/get-reg-list/default.test

diff --git a/tools/testing/selftests/kvm/tests/arch_timer/default.test b/tools/testing/selftests/kvm/tests/arch_timer/default.test
new file mode 100644
index 000000000000..97cac72515e2
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arch_timer/default.test
@@ -0,0 +1 @@
+arch_timer
diff --git a/tools/testing/selftests/kvm/tests/arm64/aarch32_id_regs/default.test b/tools/testing/selftests/kvm/tests/arm64/aarch32_id_regs/default.test
new file mode 100644
index 000000000000..e9dc42eacb27
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/aarch32_id_regs/default.test
@@ -0,0 +1 @@
+arm64/aarch32_id_regs
diff --git a/tools/testing/selftests/kvm/tests/arm64/arch_timer_edge_cases/default.test b/tools/testing/selftests/kvm/tests/arm64/arch_timer_edge_cases/default.test
new file mode 100644
index 000000000000..ebc7f45fab7e
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/arch_timer_edge_cases/default.test
@@ -0,0 +1 @@
+arm64/arch_timer_edge_cases
diff --git a/tools/testing/selftests/kvm/tests/arm64/debug-exceptions/default.test b/tools/testing/selftests/kvm/tests/arm64/debug-exceptions/default.test
new file mode 100644
index 000000000000..dc427a64e1cd
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/debug-exceptions/default.test
@@ -0,0 +1 @@
+arm64/debug-exceptions
diff --git a/tools/testing/selftests/kvm/tests/arm64/hypercalls/default.test b/tools/testing/selftests/kvm/tests/arm64/hypercalls/default.test
new file mode 100644
index 000000000000..628731a70178
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/hypercalls/default.test
@@ -0,0 +1 @@
+arm64/hypercalls
diff --git a/tools/testing/selftests/kvm/tests/arm64/mmio_abort/default.test b/tools/testing/selftests/kvm/tests/arm64/mmio_abort/default.test
new file mode 100644
index 000000000000..94e2aef05572
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/mmio_abort/default.test
@@ -0,0 +1 @@
+arm64/mmio_abort
diff --git a/tools/testing/selftests/kvm/tests/arm64/no-vgic-v3/default.test b/tools/testing/selftests/kvm/tests/arm64/no-vgic-v3/default.test
new file mode 100644
index 000000000000..5fa28e3d6f9c
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/no-vgic-v3/default.test
@@ -0,0 +1 @@
+arm64/no-vgic-v3
diff --git a/tools/testing/selftests/kvm/tests/arm64/page_fault_test/default.test b/tools/testing/selftests/kvm/tests/arm64/page_fault_test/default.test
new file mode 100644
index 000000000000..dbf95af263d8
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/page_fault_test/default.test
@@ -0,0 +1 @@
+arm64/page_fault_test
diff --git a/tools/testing/selftests/kvm/tests/arm64/psci_test/default.test b/tools/testing/selftests/kvm/tests/arm64/psci_test/default.test
new file mode 100644
index 000000000000..1cbe0cee5277
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/psci_test/default.test
@@ -0,0 +1 @@
+arm64/psci_test
diff --git a/tools/testing/selftests/kvm/tests/arm64/set_id_regs/default.test b/tools/testing/selftests/kvm/tests/arm64/set_id_regs/default.test
new file mode 100644
index 000000000000..e305642fda26
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/set_id_regs/default.test
@@ -0,0 +1 @@
+arm64/set_id_regs
diff --git a/tools/testing/selftests/kvm/tests/arm64/smccc_filter/default.test b/tools/testing/selftests/kvm/tests/arm64/smccc_filter/default.test
new file mode 100644
index 000000000000..98dd986522a1
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/smccc_filter/default.test
@@ -0,0 +1 @@
+arm64/smccc_filter
diff --git a/tools/testing/selftests/kvm/tests/arm64/vcpu_width_config/default.test b/tools/testing/selftests/kvm/tests/arm64/vcpu_width_config/default.test
new file mode 100644
index 000000000000..d00fd74341ac
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/vcpu_width_config/default.test
@@ -0,0 +1 @@
+arm64/vcpu_width_config
diff --git a/tools/testing/selftests/kvm/tests/arm64/vgic_init/default.test b/tools/testing/selftests/kvm/tests/arm64/vgic_init/default.test
new file mode 100644
index 000000000000..7835ba6157b5
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/vgic_init/default.test
@@ -0,0 +1 @@
+arm64/vgic_init
diff --git a/tools/testing/selftests/kvm/tests/arm64/vgic_irq/default.test b/tools/testing/selftests/kvm/tests/arm64/vgic_irq/default.test
new file mode 100644
index 000000000000..387612d50530
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/vgic_irq/default.test
@@ -0,0 +1 @@
+arm64/vgic_irq
diff --git a/tools/testing/selftests/kvm/tests/arm64/vgic_lpi_stress/default.test b/tools/testing/selftests/kvm/tests/arm64/vgic_lpi_stress/default.test
new file mode 100644
index 000000000000..c31424bc5a88
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/vgic_lpi_stress/default.test
@@ -0,0 +1 @@
+arm64/vgic_lpi_stress
diff --git a/tools/testing/selftests/kvm/tests/arm64/vpmu_counter_access/default.test b/tools/testing/selftests/kvm/tests/arm64/vpmu_counter_access/default.test
new file mode 100644
index 000000000000..505743df541f
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/arm64/vpmu_counter_access/default.test
@@ -0,0 +1 @@
+arm64/vpmu_counter_access
diff --git a/tools/testing/selftests/kvm/tests/get-reg-list/default.test b/tools/testing/selftests/kvm/tests/get-reg-list/default.test
new file mode 100644
index 000000000000..07b9427b9f83
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/get-reg-list/default.test
@@ -0,0 +1 @@
+get-reg-list
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
