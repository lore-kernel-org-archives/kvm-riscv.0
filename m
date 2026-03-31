Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA166FF60D5
	for <kvm-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 19:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MBsW3Dp0QIVeCccLJZQ2oe/Uzf3avP0QdYpC50oO9qw=; b=aX0z9yh58nwlM2QxzZiCH6c1Px
	UlhG216AeZSToONz4XC8v2s/RyEySdFIx1pWbcv0XrjMDq19ZTtjFM3izQnIFnCQaVjWdkgaB05/H
	RPzvR/1jOIbdRk2qxOYPa6cBMsjzDMF8XoIQT9c6isoqXxKirCZUxEeLHmFpf3obsDf8850bVOYvq
	BL4ReMFJre42SQ5LCp/umEdL8n0EN+kdOzq0CmhinMFpd+r1D6x2J0BW471anwQGkTiRPEhcy6dSd
	7m7ZYlmkZFSEpaKvYaO6NOP26khUtynbKuXUKek0gN5PNyrRfTO4OCPhtqUp6BmIiTsXBbWkXANoU
	hYCUIGNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7eyp-0000000DUSV-1lmE;
	Tue, 31 Mar 2026 19:42:27 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7eym-0000000DUPr-3fGV
	for kvm-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 19:42:26 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-35c0cbe0f64so17569357a91.0
        for <kvm-riscv@lists.infradead.org>; Tue, 31 Mar 2026 12:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774986144; x=1775590944; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SmS1uHrhcJAkZ/77nv6KxNChDlZ5TAlHKr2qEzAIUF0=;
        b=rZ/M8s4cw/r1itpg6KkUZzVQbk64QLvYxDY595vFo04Tb76+tQY+a1eCThrCYce7Pz
         6e7Vb8t+uHedqFOcuLiQfmFBX9fMx0oAUQKfipolSVvQVSn9LO8ix931s51Ooq/CFFpn
         ND9kRswLtB+0fY7UEEJOGh/SJy9a9e9vzeHBHdXmTeD1tBO2rcnE2n+KsxlsYkV340Tr
         CjiQ819ycqZJm6tgEyXGNQoB8D+ZJw6wiYw3oKttPjCivhBX42JulSUqyc9HDB1NCSAk
         PKIRbfe9awPh+C0goYbxO5CviT+B6P6qTPE/ai1FoklrrTrVu5/X5NxoqSQ/ciTkq5tl
         kNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986144; x=1775590944;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SmS1uHrhcJAkZ/77nv6KxNChDlZ5TAlHKr2qEzAIUF0=;
        b=e+rlPMPmWyOLQS3TaMXTAAagGRvoMY9YPK9n+LIGE1qU/I/vaLRnjxV+LTKI/OnkJ2
         Xjc7M+JU0ZUJ+OoKbzjd4m8gSJZnKe+1jN9GubtTdv8ZS9Qn4E5qjHQ0i4TjgAVSwPP0
         B7Rbd3Xlu8PHeo6g+iJfr4Jyb8zottpm8LZBbUGz5E55RQjPputFXW44iFQJijeKrwta
         IArVNUcqvz74SIMXKnv5lfCl1KZv+AausK/zdKxfJ4KpiErY+k1B2X+HqvCaGZeqhNGV
         yQ2axJsWeFIsaWU7+2NmFGgFTUDiNF9nj2aFcKXLxtoQNovHTLZ/m2t40Y1wqLAiUTUL
         rQYg==
X-Forwarded-Encrypted: i=1; AJvYcCU605Vip9Q7pg6cKioWUeFSWznDRU8+0dqIT6FjsojLU3GsKOoD5w7du/LAxeNDIXw5LLF36dvA0DU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3yj9NqfFJ+wJgeSZgRFo16zbEbA6zNsaTKtOrLUrlEKKDD5mU
	MLxNhSSvs+YntxRCT19JnJit1IJgZciGxGCFbQ9t9u7OzoD+ZC9gPBjPtCRENmN2MXKSpoRVWnJ
	eh8hTUQ75Pw==
X-Received: from pjbng13.prod.google.com ([2002:a17:90b:1a8d:b0:35c:23cf:b494])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2ec4:b0:34c:904a:d92
 with SMTP id 98e67ed59e1d1-35dc6fdd803mr478428a91.26.1774986143568; Tue, 31
 Mar 2026 12:42:23 -0700 (PDT)
Date: Tue, 31 Mar 2026 12:41:59 -0700
In-Reply-To: <20260331194202.1722082-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20260331194202.1722082-1-vipinsh@google.com>
X-Mailer: git-send-email 2.53.0.1118.gaef5881109-goog
Message-ID: <20260331194202.1722082-7-vipinsh@google.com>
Subject: [PATCH v4 6/9] KVM: selftests: Add various print flags to KVM
 selftest runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com, Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_124224_922439_0DFFE2C0 
X-CRM114-Status: GOOD (  10.22  )
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
index 96402c89aea9..13f4cbea1fa7 100644
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
+                        Control output of the {} test (default is full).
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
2.53.0.1118.gaef5881109-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
