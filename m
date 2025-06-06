Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB52C61CE7
	for <kvm-riscv@archiver.kernel.org>; Sat,  7 Jun 2025 00:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bz/cKO4IEz5+4EVcclSCYNfk0hqcoRdOykKL6wUhFlI=; b=aAwnDGNFaYvaCKMwl1cm4vKKSY
	fW6Jhp5KPGUQrCqG1QMfe9Nuced1dJDme2Q/ktgKmOkFI8ad+n/Dou9IardmdKFKNvi3G54/SCmxH
	P2F6++ub9gwAOTAVLmY0ZKUQzGK5FmwIjJs/aJ2iMIIGAo4rDMIWSrXuGqqXIQa5RRWvJAayrxXp0
	7HLhbNxxqToM1+fekNb9wmdjIn6/UStbCroqzbkuEi7/TU0wZDD/pfuk6R4atmHnC5oneBQexgydE
	J0Rh2Nk4WFgTLkuiMQtEbw7MppJeXxsHo9MXpROluGNVmO2MtgbX5/hPJWhF5U7GpfI62LNYdsnH6
	uZSvka6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNhQl-00000001BUi-3Hpq;
	Sat, 07 Jun 2025 00:29:03 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNgve-000000019Fn-39UD
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 23:56:55 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-74620e98ec8so2373276b3a.1
        for <kvm-riscv@lists.infradead.org>; Fri, 06 Jun 2025 16:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749254213; x=1749859013; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=21lsbUP4Pev7+bZRjEiLUIwgm/TC/un4IRPgZinq0rE=;
        b=cJBq77dQfdsamgf2wsSz9YpCLKLNuf5Np9pTj/a39l9VJcNC1EXAb4icropFgCFYAu
         zpxKaPySR6llvixjqPUh65NJjv1uyvnHehpplJruIZul9nfTVEViaUdzpzbJmYqD3T+g
         RnRaJ823mXKWxNTnuiAfexMYxB2BaAEBTgDAoNqj4SWGodTGtMaNsI+P7/bu9UYxJPVT
         RUx5HO6JMt+sl62wfM/mVb87xWptmzeFsfoEUvXw9W5Sw9pBZ6yPlMHxXc7t2sTGJEg6
         Y+/WbPeg+yMPhvrba9WscTcYzmdzwKRQNaCtEozBAIgaAKkJHpkgqBLItXFIRsIOOZPP
         rlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749254213; x=1749859013;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=21lsbUP4Pev7+bZRjEiLUIwgm/TC/un4IRPgZinq0rE=;
        b=DV2CfFu54V8/e0n3AyiFSPJUhly11OeR9m/hI/vIQsKB03FrcCstMFAMQVABM/2X5/
         ckZwMtY5epTGvWPFx0M59UppKG1OdZsE17tZmB69XWOaUerw2EsWc3CA2NRIAuoPFZMX
         N1pe5Z+m3VlLqscUFFUqsvXVdayPb3LDRfQxzMdwun7IUFFb1yJa8YyqIe3NP9/zDDg/
         QlO8TPyx/Qulmw1kRyWDv6fgHi8q97MS1z931iUakMO8Dlt6fJyEsV/jrQta1lu3tJUn
         YhF+206zHjt0lmsdNwoQ3RlCDJUWHaOtN3B/8zbYAJGUQSYGlL11YaevmAdWgqG8Z4xr
         0qLw==
X-Forwarded-Encrypted: i=1; AJvYcCXh7WviR+7mM37ylm+16qOvqtQ57WWG/tpzONK1i8SRB6uOLvfrmMTUzqo3f2Occ8fcN4SzG68hjvQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzSvMDRsWedGRWgMG6nAGnO1Ad8EaRxMl7nWepnLCIFBp3KvsAp
	J63lgArrmNLLTSKGLrzCH7z2snBynkePR6kxeQw/vrJb3S9EUNdDKKwbLCjpTqqJqKt8nQeGFHj
	+l8tn2qbEDQ==
X-Google-Smtp-Source: AGHT+IFawjIwwAf5PF3Wi/OcDWRJ/ksSgwU5Sx+YrDH8kG+RVuMa1d7ri+swcbrCB/2Jc5d9zeGSaoAOQdJ+
X-Received: from pfop3.prod.google.com ([2002:a05:6a00:b43:b0:747:af58:72ca])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:8705:b0:746:195b:bf1c
 with SMTP id d2e1a72fcca58-74839e1f2admr529438b3a.10.1749254213601; Fri, 06
 Jun 2025 16:56:53 -0700 (PDT)
Date: Fri,  6 Jun 2025 16:56:18 -0700
In-Reply-To: <20250606235619.1841595-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250606235619.1841595-15-vipinsh@google.com>
Subject: [PATCH v2 14/15] KVM: selftests: Add s390 auto generated test files
 for KVM Selftests Runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, anup@brainfault.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	maz@kernel.org, oliver.upton@linux.dev, dmatlack@google.com, 
	Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_165654_814718_4ADCC5AF 
X-CRM114-Status: GOOD (  10.49  )
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
 tools/testing/selftests/kvm/tests/s390/cmma_test/default.test    | 1 +
 .../selftests/kvm/tests/s390/cpumodel_subfuncs_test/default.test | 1 +
 tools/testing/selftests/kvm/tests/s390/debug_test/default.test   | 1 +
 tools/testing/selftests/kvm/tests/s390/memop/default.test        | 1 +
 tools/testing/selftests/kvm/tests/s390/resets/default.test       | 1 +
 .../selftests/kvm/tests/s390/shared_zeropage_test/default.test   | 1 +
 .../testing/selftests/kvm/tests/s390/sync_regs_test/default.test | 1 +
 tools/testing/selftests/kvm/tests/s390/tprot/default.test        | 1 +
 .../testing/selftests/kvm/tests/s390/ucontrol_test/default.test  | 1 +
 9 files changed, 9 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/tests/s390/cmma_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/s390/cpumodel_subfuncs_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/s390/debug_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/s390/memop/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/s390/resets/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/s390/shared_zeropage_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/s390/sync_regs_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/s390/tprot/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/s390/ucontrol_test/default.test

diff --git a/tools/testing/selftests/kvm/tests/s390/cmma_test/default.test b/tools/testing/selftests/kvm/tests/s390/cmma_test/default.test
new file mode 100644
index 000000000000..c6655b3e9472
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/s390/cmma_test/default.test
@@ -0,0 +1 @@
+s390/cmma_test
diff --git a/tools/testing/selftests/kvm/tests/s390/cpumodel_subfuncs_test/default.test b/tools/testing/selftests/kvm/tests/s390/cpumodel_subfuncs_test/default.test
new file mode 100644
index 000000000000..d02545ae1f3b
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/s390/cpumodel_subfuncs_test/default.test
@@ -0,0 +1 @@
+s390/cpumodel_subfuncs_test
diff --git a/tools/testing/selftests/kvm/tests/s390/debug_test/default.test b/tools/testing/selftests/kvm/tests/s390/debug_test/default.test
new file mode 100644
index 000000000000..bd0a9c8965b2
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/s390/debug_test/default.test
@@ -0,0 +1 @@
+s390/debug_test
diff --git a/tools/testing/selftests/kvm/tests/s390/memop/default.test b/tools/testing/selftests/kvm/tests/s390/memop/default.test
new file mode 100644
index 000000000000..76073a59f58d
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/s390/memop/default.test
@@ -0,0 +1 @@
+s390/memop
diff --git a/tools/testing/selftests/kvm/tests/s390/resets/default.test b/tools/testing/selftests/kvm/tests/s390/resets/default.test
new file mode 100644
index 000000000000..133beeb1260b
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/s390/resets/default.test
@@ -0,0 +1 @@
+s390/resets
diff --git a/tools/testing/selftests/kvm/tests/s390/shared_zeropage_test/default.test b/tools/testing/selftests/kvm/tests/s390/shared_zeropage_test/default.test
new file mode 100644
index 000000000000..8ea3ec559fda
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/s390/shared_zeropage_test/default.test
@@ -0,0 +1 @@
+s390/shared_zeropage_test
diff --git a/tools/testing/selftests/kvm/tests/s390/sync_regs_test/default.test b/tools/testing/selftests/kvm/tests/s390/sync_regs_test/default.test
new file mode 100644
index 000000000000..7eacd6f9bd2d
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/s390/sync_regs_test/default.test
@@ -0,0 +1 @@
+s390/sync_regs_test
diff --git a/tools/testing/selftests/kvm/tests/s390/tprot/default.test b/tools/testing/selftests/kvm/tests/s390/tprot/default.test
new file mode 100644
index 000000000000..78e603c3b671
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/s390/tprot/default.test
@@ -0,0 +1 @@
+s390/tprot
diff --git a/tools/testing/selftests/kvm/tests/s390/ucontrol_test/default.test b/tools/testing/selftests/kvm/tests/s390/ucontrol_test/default.test
new file mode 100644
index 000000000000..211cceee1bbd
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/s390/ucontrol_test/default.test
@@ -0,0 +1 @@
+s390/ucontrol_test
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
