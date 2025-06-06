Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702B0C61CE8
	for <kvm-riscv@archiver.kernel.org>; Sat,  7 Jun 2025 00:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lnKEfdAvJ11+UTEZBRDW5bsUr6CvU+hOA2GjDL6gQgk=; b=rQA9zyGq+e5TqMN9BI7/bm9UpV
	yFCn2PLlgKeOnceUjGCRd45MzgM+7gjjaM6T6Zf4cGfjGReHFBaBSnt+9X2GKlc76eDvwSFCHPCXc
	+nE46oONXiQRQO0CV59++5VbsBAjgvlxgd7iyUf4d+UiE60eohkvfY9dBmxNuXKfQFH/FOU6guamH
	6ExRSSGrlvXEfBmW1ytNGGoqy4K89xyCg+og6GI+Tejip1nXDphEtWrs3y17490B3Rv8NN+l/Ld6Q
	EUawk9OxFphKLcdLsowzVVh1rYpZERcfB0qTR8Tpv6rpNKSNsXCGK8YmwWNOazYruZdE8Ry/pQb45
	NxBvnzng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNh7v-00000001AGE-0omt;
	Sat, 07 Jun 2025 00:09:35 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNgvS-0000000198D-237O
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 23:56:43 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b26e120e300so2927942a12.1
        for <kvm-riscv@lists.infradead.org>; Fri, 06 Jun 2025 16:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749254201; x=1749859001; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PWbzbH1m+wqWOmBrT8udt/40D0dgC1NwBn/2qwIwUgk=;
        b=iVuF6CnRzAsAnNXbtOIlwGgxPges7d2PaaKt5jdNkzWcBsUCukx3jbdzTtW7PAJ/Vm
         5eL653NVd39UpdcTOVFqXU+EMIcEqssfS0jkUYexD4htcHy4ylG78WbXvyrKIA2O8v0D
         am314BskXHLe08WKrue6jnAuOuWQdh78hKUVUfxwhpcpjiVPzjQU/XGhWZa3AvRsSrwQ
         jZEa1I6zszj1fDOMRW9IHRwEzYoKL5Ylr8oDAWfdfDyJnV5aJ+oz2mEgVAifL9RfyHYO
         WGcDwS9Hmm/BwEaET4qmEU5qBVumK2JR1WvI5tRgf8I/nG0CLWK3ggn020pumXm711q5
         BVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749254201; x=1749859001;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PWbzbH1m+wqWOmBrT8udt/40D0dgC1NwBn/2qwIwUgk=;
        b=wDMBK82U6XuoLoU9dolHdC1SYCbbDVQQbmzNav0B+/wccrleJ9LVpV5RNadBE2D+On
         kXxXrOtMdTg8ZCnEh2cLuKlpDxQFN/LeIKr0mCUVRMxksInDz+PLNnlptNqLylY22vzP
         tYgIF6pkpC3hHlFWGBEHDSkf0AbnWDyXkFMjvwjGe7oRGBlBgtl5eJFO7FhBeJxTA62G
         tNe8sPalVu7Z4nvrZHMxqThxXXvoUAPOKEM0+tTzPzS7TMzQ/mxcNhEIDKYlAHOZ4ENL
         mhrEcBWZbW3hpGVB2ZmYceQCB28r1lFCkQYAWF9XDL/MleMGVZOsBR+kGgB2JEdwoo8i
         NMcg==
X-Forwarded-Encrypted: i=1; AJvYcCX0OgNlSKAmyuzSLLl31tcUm933ffpMMu2pAx5fh0t/GVfLGiTUmnw8rZWD6b0Jnin7WuRO4T7B3S8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzim7hqDJ5vapTGI+w6Vq8aKpaUKDFwrdzWvRO7Q5wKPun6lH/z
	N0epSO8rxKf+0fncDPoB59hJRKEpuHY0wECpy//h8q6/FvCQW1TXczG9p6GedJMhxDFN+Fk/HWf
	MC7A0WiGKtQ==
X-Google-Smtp-Source: AGHT+IGVs207s86YmdkUc4NLTl0O3Ae4xRqr3JThhY5MoJTIq3qF5lZ9DcjFAhjtq7dWe0bT1o+6NEUKFsOo
X-Received: from pfbhu52.prod.google.com ([2002:a05:6a00:69b4:b0:746:1b3a:db4])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3383:b0:215:e60b:3bd3
 with SMTP id adf61e73a8af0-21ee25e0bfemr7507277637.29.1749254201128; Fri, 06
 Jun 2025 16:56:41 -0700 (PDT)
Date: Fri,  6 Jun 2025 16:56:10 -0700
In-Reply-To: <20250606235619.1841595-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250606235619.1841595-7-vipinsh@google.com>
Subject: [PATCH v2 06/15] KVM: selftests: Add a flag to print only test status
 in KVM Selftests run
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, anup@brainfault.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	maz@kernel.org, oliver.upton@linux.dev, dmatlack@google.com, 
	Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_165642_528880_F9D25686 
X-CRM114-Status: GOOD (  10.61  )
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

Add a command line argument, --print-status, to limit content printed on
terminal by default. When this flag is passed only print final status of
tests i.e. passed, failed, timed out, etc.

Example:
  python3 runner --test-dirs tests  --print-status

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 tools/testing/selftests/kvm/runner/__main__.py    | 5 +++++
 tools/testing/selftests/kvm/runner/test_runner.py | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
index 48d7ce00a097..3f11a20e76a9 100644
--- a/tools/testing/selftests/kvm/runner/__main__.py
+++ b/tools/testing/selftests/kvm/runner/__main__.py
@@ -59,6 +59,11 @@ def cli():
                         type=int,
                         help="Maximum number of tests that can be run concurrently. (Default: 1)")
 
+    parser.add_argument("--print-status",
+                        action="store_true",
+                        default=False,
+                        help="Print only test's status and avoid printing stdout and stderr of the tests")
+
     return parser.parse_args()
 
 
diff --git a/tools/testing/selftests/kvm/runner/test_runner.py b/tools/testing/selftests/kvm/runner/test_runner.py
index 0a6e5e0ca0f5..474408fcab51 100644
--- a/tools/testing/selftests/kvm/runner/test_runner.py
+++ b/tools/testing/selftests/kvm/runner/test_runner.py
@@ -17,6 +17,7 @@ class TestRunner:
         self.tests = []
         self.output_dir = args.output
         self.jobs = args.jobs
+        self.print_status = args.print_status
 
         for test_file in test_files:
             self.tests.append(Selftest(test_file, args.executable,
@@ -29,7 +30,7 @@ class TestRunner:
     def _log_result(self, test_result):
         logger.log(test_result.status,
                    f"[{test_result.status}] {test_result.test_path}")
-        if (self.output_dir is None):
+        if (self.output_dir is None and self.print_status is False):
             logger.info("************** STDOUT BEGIN **************")
             logger.info(test_result.stdout)
             logger.info("************** STDOUT END **************")
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
