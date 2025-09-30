Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520BFCCA476
	for <kvm-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 16:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4vAr5XgL1A+XSb+jDdYD0LnPge6oLDhLBt8Yly140rY=; b=vicInf+p4w85PJBmShOMXWekH9
	/xyZumxanmP8WthYzUAppQrFItebQNfgGY9rwkH1vbsKDDZLfBkj8OZmUFeTbw+yU2h5f/Ak0A4Qo
	wmoJv4srhYzsSzo9dLB1dPWhxJUm2zXoDVcxASUIW5FFo7V/24JVR64RuD4IlEnekkXf45A1gS5oE
	vV3bE6yB/3C7DNPeaIogDm+3WRQlvz2yIkZLR+wEEiTCNX/DMGmDaHLHS9e7hmZwZJ5kkLQBjxWs8
	/JbsrflSPXNfLCA825HVtv+vRk9yd85tWnxVklkkh2Ty1YgV/qPlSUhH6uxfGBYtzLetR/FqVv1ZS
	Mpx7z02Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3dLc-00000005mrh-3mmb;
	Tue, 30 Sep 2025 16:37:04 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3dLX-00000005mmG-2Wvq
	for kvm-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 16:37:03 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-78038ed99d9so8267460b3a.2
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Sep 2025 09:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759250219; x=1759855019; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0GTsqnY4+saNzCy5mGyriIvmSp6eaE/vqi0JjCPWBoU=;
        b=C3NIYL7R9Q2sNi3wVB9r5bdQKyosIVv2wxBf4osHFkddRDg/TTZlOC6Mumw/3xNmE6
         TehK2S1H1llJojSIpXQ9nMVqfc7IeG2+Ydp/0X2j8enFGT2GywdA9lvN6XsxZsyLMObb
         hMoz0CYNavmvPFIbg1Pjy8hIg8AYR4ilqiHvL1DitJjR+py82Cj434ZmWhdTSBeGslb8
         zeQRTVy/QQpuXng7tsaZzjp2ValZdLgmPMrN/xKxicyHPZF83tLoJZEle7ebpkjMwT1D
         D1jFdOMSPQHCxRsJYZyHAmsRJlgYMOAiUsw0oX8k+K+PYb38uO5xUWn+1Iz2F6+cPecW
         LS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759250219; x=1759855019;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0GTsqnY4+saNzCy5mGyriIvmSp6eaE/vqi0JjCPWBoU=;
        b=DzNjOSS9rGPCe15d5NjbJDrR5kciPS2pVzQCqAQQfOLgwsXZVxvY2DRdAuCvvKvBu2
         Jw8I/wfUlJQpV6g9IhX+dGhj83XHniampaAeASeFmuAdJLsuVSIat3jXh6eU02F6IcGX
         Ha6FTFo9+6dmd8tCi1BPO25cT0DccKlEklNYYXIMffWU656ZiYGE7LQMlASBTD4vWNLZ
         oM3w9Z/gmb66tP3edNMUhljt8RE/UpqpKPBKxwP1zK3N+LvOraBciF7k0ytlDMY82IZ+
         EGglXR/M8uu8257Vl7oj1/HWFzowf/7bpnUtQR9w04d4IZd/iTu2hBvK7QVNNLWXbNcm
         keeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIRCbljT17uF0nnsp6e2ZYg86gLFwN1RtrLdiz4zSZQsnMIjjImgic0yql24TxK0BoRre7spo2Wyo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz75qEtZlRDuDQzz/Ht7YK4ttXM0aHkI3sJ2rnJgVutv+F/chdH
	NAQgs52Mjl4oAtpw/CvSckn/J5WaoS+b6Y+SGaqQeTTkGevRYPS11L64azKRu9+oeJteVl6VjID
	eESWH2UsdgA==
X-Google-Smtp-Source: AGHT+IGhAsgZwOMvoWdZcUEtVVfFvQe5AhCplay9erkcPQTqVQZCmBY4Dt3zYWPsYtiBB7sDVDiH7IVgr5gK
X-Received: from pfoh11.prod.google.com ([2002:aa7:86cb:0:b0:77f:138f:8b8f])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3cc4:b0:77b:5b58:34f7
 with SMTP id d2e1a72fcca58-78af4143e2amr69675b3a.9.1759250218647; Tue, 30 Sep
 2025 09:36:58 -0700 (PDT)
Date: Tue, 30 Sep 2025 09:36:32 -0700
In-Reply-To: <20250930163635.4035866-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250930163635.4035866-1-vipinsh@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20250930163635.4035866-7-vipinsh@google.com>
Subject: [PATCH v3 6/9] KVM: selftests: Add various print flags to KVM
 selftest runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com, Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_093701_705422_CDD0637D 
X-CRM114-Status: GOOD (  10.92  )
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

Add various print flags to selectively print outputs on terminal based
on test execution status (passed, failed, timed out, skipped, no run).

For each status provide further options (off, full, stderr, stdout,
status) to choose verbosity of their prints. Make "full" the default
choice.

Example: To print stderr for the failed tests and only status for the
passed test:

   python3 runner --test-dirs tests  --print-failed stderr \
   --print-passed status

Above command with disable print off skipped, timed out, and no run
tests.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../testing/selftests/kvm/runner/__main__.py  | 45 +++++++++++++++++++
 .../selftests/kvm/runner/test_runner.py       | 19 ++++++--
 2 files changed, 60 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
index b98f72c9f7ee..4867e89c30f2 100644
--- a/tools/testing/selftests/kvm/runner/__main__.py
+++ b/tools/testing/selftests/kvm/runner/__main__.py
@@ -9,6 +9,7 @@ import os
 import sys
 import datetime
 import pathlib
+import textwrap
 
 from test_runner import TestRunner
 from selftest import SelftestStatus
@@ -60,6 +61,50 @@ def cli():
                         type=int,
                         help="Maximum number of tests that can be run concurrently. (Default: 1)")
 
+    status_choices = ["off", "full", "stdout", "stderr", "status"]
+    status_help_text = textwrap.dedent('''\
+                        Control output of the {} test.
+                        off   : dont print anything.
+                        full  : print stdout, stderr, and status of the test.
+                        stdout: print stdout and status of the test.
+                        stderr: print stderr and status of the test.
+                        status: only print the status of test execution and no other output.''');
+
+    parser.add_argument("--print-passed",
+                        default="full",
+                        const="full",
+                        nargs='?',
+                        choices=status_choices,
+                        help = status_help_text.format("passed"))
+
+    parser.add_argument("--print-failed",
+                        default="full",
+                        const="full",
+                        nargs='?',
+                        choices=status_choices,
+                        help = status_help_text.format("failed"))
+
+    parser.add_argument("--print-skipped",
+                        default="full",
+                        const="full",
+                        nargs='?',
+                        choices=status_choices,
+                        help = status_help_text.format("skipped"))
+
+    parser.add_argument("--print-timed-out",
+                        default="full",
+                        const="full",
+                        nargs='?',
+                        choices=status_choices,
+                        help = status_help_text.format("timed-out"))
+
+    parser.add_argument("--print-no-run",
+                        default="full",
+                        const="full",
+                        nargs='?',
+                        choices=status_choices,
+                        help = status_help_text.format("no-run"))
+
     return parser.parse_args()
 
 
diff --git a/tools/testing/selftests/kvm/runner/test_runner.py b/tools/testing/selftests/kvm/runner/test_runner.py
index 92eec18fe5c6..e8e8fd91c1ad 100644
--- a/tools/testing/selftests/kvm/runner/test_runner.py
+++ b/tools/testing/selftests/kvm/runner/test_runner.py
@@ -17,6 +17,13 @@ class TestRunner:
         self.tests = []
         self.output_dir = args.output
         self.jobs = args.jobs
+        self.print_stds = {
+            SelftestStatus.PASSED: args.print_passed,
+            SelftestStatus.FAILED: args.print_failed,
+            SelftestStatus.SKIPPED: args.print_skipped,
+            SelftestStatus.TIMED_OUT: args.print_timed_out,
+            SelftestStatus.NO_RUN: args.print_no_run
+        }
 
         for testcase in testcases:
             self.tests.append(Selftest(testcase, args.path, args.timeout,
@@ -27,10 +34,14 @@ class TestRunner:
         return test
 
     def _log_result(self, test_result):
-        logger.info("*** stdout ***\n" + test_result.stdout)
-        logger.info("*** stderr ***\n" + test_result.stderr)
-        logger.log(test_result.status,
-                   f"[{test_result.status.name}] {test_result.test_path}")
+        print_level = self.print_stds.get(test_result.status, "full")
+
+        if (print_level == "full" or print_level == "stdout"):
+            logger.info("*** stdout ***\n" + test_result.stdout)
+        if (print_level == "full" or print_level == "stderr"):
+            logger.info("*** stderr ***\n" + test_result.stderr)
+        if (print_level != "off"):
+            logger.log(test_result.status, f"[{test_result.status.name}] {test_result.test_path}")
 
     def start(self):
         ret = 0
-- 
2.51.0.618.g983fd99d29-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
