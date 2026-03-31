Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDEC10F92F2
	for <kvm-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 19:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hNh4Xs0AucfkIhmM5nww+AGOLdzkoQA1D4Bnpt8evlU=; b=sOr2xerJO660IUTRbe9o8c3w19
	eJz8CLKJ8eq1ZDoopOSaU8EheRUvTwuIIpZcaA2Yuah6YcHHPNZZMv4HHGnLHNI202P1iPALnLMTl
	peTrBH/OHN49vvpNSeqhZxda8iL0SrVroy1blyhG3XYZmcKDi5zNwsuYpPfWT8aGItvGT59W6f7jZ
	oVFvlICdTWhR3uMqKtU4I3+ZQs7C4POu+KFQW52lXg33G28cyYtKhkdmo7m2wS7IhSNVkiba3FM7N
	ZTG7ZQgdB/PFhiXGlIAV1XXUfR2KDNxdti2f1DkF/ybKHB3uBNL1O45v8hEWRKTsuqS0FH0brW3Pz
	Mk0du0YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7eym-0000000DUQA-2kMz;
	Tue, 31 Mar 2026 19:42:24 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7eyj-0000000DUO0-1a4j
	for kvm-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 19:42:22 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-35da86144daso2790453a91.3
        for <kvm-riscv@lists.infradead.org>; Tue, 31 Mar 2026 12:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774986140; x=1775590940; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ka0uEckvF83qn5GmvpHw9HtNOmToQnEieGf8Vdd2qVw=;
        b=m9AYZPGpS2iy8rSnRh2PoMJqsui9xQ9P079wLFLObfCoEE3by0sGQ5dbM4dE8df7lD
         6LUSR+Z//Xq3WWgeSsMdb2aZdZULwqh0xGiuvyENt/uTjpc2vPrGWs0+PF8q7qsm65H3
         uiHEKlcGWJINbjSZ35JNMZCz9lDhoZPnilPeIrEd3hrf0IJc8UOUdQQaPLsy0rIeU1hI
         ze74LTdImc9IMCkf3aTZYA8dFu9neQbd98sFOLseouFNYmS+ZNiHlaowpCs+AbDih6Df
         16wliqPs0345bQO7tm+PkX/BWzbtTidr0q9O56DNe5/Z1ASV+zw/G/WPfZfxGZh+A0ij
         JtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986140; x=1775590940;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ka0uEckvF83qn5GmvpHw9HtNOmToQnEieGf8Vdd2qVw=;
        b=qh+i9TTr5ZZci7YD3jC+2SL4qrifXJg5CnW8uJk3xgtXcPTmAq2L0Y3pt7arI1E4lr
         K6EBhGwqkkWor0GZnKQcvsIYrM05RmTqoUuJ54og+0IXLRfqz7wFzUW6MxOdnHGrG9Hh
         5w0H+SQ3Xu7FjVnXUDAzEzVO81qPCwqG77ILpn0I2c2zCe7oHHxX4utBBJjWF1LnYFdf
         e6OgjTdZSU0R5Z8TsKM11PFiJsA8ghhODsHoDTZ1PGGR40OnFwdUEOLITTS6GdU1uyMn
         oJ7ZmkOYIey0JUIHzeN1QUGBy6r3MKneWcjee6mdxtvg6E9UAJTxHgEQUWTMgEioV/2M
         uiYw==
X-Forwarded-Encrypted: i=1; AJvYcCUSBQrz99agIxiJyTc1jAPQAvEvFjulYVaIZS+E1G3kih5r2CNzHtw5HEtQmvWeQTY0p7uekddrP5g=@lists.infradead.org
X-Gm-Message-State: AOJu0YzyPA/CyAhTs/FOyRalu0BbBZvK1zDEWtf+YqbCu8Xzf5WT32wF
	otkm2fPZSPz5X4TF3iRweWcSQa0TdUnHBZUo9HuGesykejvfVfbBw5O+lmgfMWeJk9QPh9upqIv
	H6kcOkO6rbQ==
X-Received: from pjblp17.prod.google.com ([2002:a17:90b:4a91:b0:35d:a80b:8d43])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4cc2:b0:35b:e554:53a6
 with SMTP id 98e67ed59e1d1-35dc6ea1153mr570258a91.11.1774986139702; Tue, 31
 Mar 2026 12:42:19 -0700 (PDT)
Date: Tue, 31 Mar 2026 12:41:57 -0700
In-Reply-To: <20260331194202.1722082-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20260331194202.1722082-1-vipinsh@google.com>
X-Mailer: git-send-email 2.53.0.1118.gaef5881109-goog
Message-ID: <20260331194202.1722082-5-vipinsh@google.com>
Subject: [PATCH v4 4/9] KVM: selftests: Add option to save selftest runner
 output to a directory
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com, Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_124221_424533_A635E3E4 
X-CRM114-Status: GOOD (  12.57  )
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

Add a command line flag, -o/--output, to selftest runner which enables
it to save individual tests output (stdout & stderr) stream to a
directory in a hierarchical way. Create folder hierarchy same as tests
hieararcy given by --testcases and --dirs.

Also, add a command line flag, --append-output-time, which will append
timestamp (format YYYY.M.DD.HH.MM.SS) to the directory name given in
--output flag.

Example:
  python3 runner --dirs test -o test_result --append_output_time

This will create test_result.2025.06.06.08.45.57 directory.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../testing/selftests/kvm/runner/__main__.py  | 34 +++++++++++++++--
 .../testing/selftests/kvm/runner/selftest.py  | 38 ++++++++++++++++---
 .../selftests/kvm/runner/test_runner.py       |  4 +-
 3 files changed, 65 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
index 82c543d11c34..5ea5ee8957c4 100644
--- a/tools/testing/selftests/kvm/runner/__main__.py
+++ b/tools/testing/selftests/kvm/runner/__main__.py
@@ -7,6 +7,8 @@ import argparse
 import logging
 import os
 import sys
+import datetime
+import pathlib
 
 from test_runner import TestRunner
 from selftest import SelftestStatus
@@ -42,10 +44,20 @@ def cli():
                         type=int,
                         help="Timeout, in seconds, before runner kills the running test. (Default: 120 seconds)")
 
+    parser.add_argument("-o",
+                        "--output",
+                        nargs='?',
+                        help="Dumps test runner output which includes each test execution result, their stdouts and stderrs hierarchically in the given directory.")
+
+    parser.add_argument("--append-output-time",
+                        action="store_true",
+                        default=False,
+                        help="Appends timestamp to the output directory.")
+
     return parser.parse_args()
 
 
-def setup_logging():
+def setup_logging(args):
     class TerminalColorFormatter(logging.Formatter):
         reset = "\033[0m"
         red_bold = "\033[31;1m"
@@ -72,12 +84,26 @@ def setup_logging():
     logger = logging.getLogger("runner")
     logger.setLevel(logging.INFO)
 
+    formatter_args = {
+        "fmt": "%(asctime)s | %(message)s",
+        "datefmt": "%H:%M:%S"
+    }
+
     ch = logging.StreamHandler()
-    ch_formatter = TerminalColorFormatter(fmt="%(asctime)s | %(message)s",
-                                          datefmt="%H:%M:%S")
+    ch_formatter = TerminalColorFormatter(**formatter_args)
     ch.setFormatter(ch_formatter)
     logger.addHandler(ch)
 
+    if args.output != None:
+        if (args.append_output_time):
+            args.output += datetime.datetime.now().strftime(".%Y.%m.%d.%H.%M.%S")
+        pathlib.Path(args.output).mkdir(parents=True, exist_ok=True)
+        logging_file = os.path.join(args.output, "log")
+        fh = logging.FileHandler(logging_file)
+        fh_formatter = logging.Formatter(**formatter_args)
+        fh.setFormatter(fh_formatter)
+        logger.addHandler(fh)
+
 
 def fetch_testcases_in_dirs(dirs):
     testcases = []
@@ -98,7 +124,7 @@ def fetch_testcases(args):
 
 def main():
     args = cli()
-    setup_logging()
+    setup_logging(args)
     testcases = fetch_testcases(args)
     return TestRunner(testcases, args).start()
 
diff --git a/tools/testing/selftests/kvm/runner/selftest.py b/tools/testing/selftests/kvm/runner/selftest.py
index e3924ee40ab3..76c3e6d463ee 100644
--- a/tools/testing/selftests/kvm/runner/selftest.py
+++ b/tools/testing/selftests/kvm/runner/selftest.py
@@ -7,6 +7,7 @@ import pathlib
 import enum
 import os
 import subprocess
+import contextlib
 
 class SelftestStatus(enum.IntEnum):
     """
@@ -29,7 +30,7 @@ class Selftest:
     Extract the test execution command from test file and executes it.
     """
 
-    def __init__(self, test_path, path, timeout):
+    def __init__(self, test_path, path, timeout, output_dir):
         test_command = pathlib.Path(test_path).read_text().strip()
         if not test_command:
             raise ValueError("Empty test command in " + test_path)
@@ -39,15 +40,14 @@ class Selftest:
         self.test_path = test_path
         self.command = test_command
         self.timeout = timeout
+        if output_dir is not None:
+            output_dir = os.path.join(output_dir, test_path.lstrip("./"))
+        self.output_dir = output_dir
         self.status = SelftestStatus.NO_RUN
         self.stdout = ""
         self.stderr = ""
 
-    def run(self):
-        if not self.exists:
-            self.stderr = "File doesn't exist."
-            return
-
+    def _run(self, output=None, error=None):
         run_args = {
             "universal_newlines": True,
             "shell": True,
@@ -70,4 +70,30 @@ class Selftest:
             out, err = e.stdout, e.stderr
 
         self.stdout = out.decode("utf-8", "replace") if isinstance(out, bytes) else (out or "")
+        if output is not None:
+            output.write(self.stdout)
+
         self.stderr = err.decode("utf-8", "replace") if isinstance(err, bytes) else (err or "")
+        if error is not None:
+            error.write(self.stderr)
+
+    def run(self):
+        if not self.exists:
+            self.stderr = "File doesn't exist."
+            return
+
+        if self.output_dir is not None:
+            pathlib.Path(self.output_dir).mkdir(parents=True, exist_ok=True)
+
+        output = None
+        error = None
+        with contextlib.ExitStack() as stack:
+            if self.output_dir is not None:
+                output_path = os.path.join(self.output_dir, "stdout")
+                output = stack.enter_context(
+                    open(output_path, encoding="utf-8", mode="w"))
+
+                error_path = os.path.join(self.output_dir, "stderr")
+                error = stack.enter_context(
+                    open(error_path, encoding="utf-8", mode="w"))
+            return self._run(output, error)
diff --git a/tools/testing/selftests/kvm/runner/test_runner.py b/tools/testing/selftests/kvm/runner/test_runner.py
index bea82c6239cd..b9101f0e0432 100644
--- a/tools/testing/selftests/kvm/runner/test_runner.py
+++ b/tools/testing/selftests/kvm/runner/test_runner.py
@@ -13,9 +13,11 @@ logger = logging.getLogger("runner")
 class TestRunner:
     def __init__(self, testcases, args):
         self.tests = []
+        self.output_dir = args.output
 
         for testcase in testcases:
-            self.tests.append(Selftest(testcase, args.path, args.timeout))
+            self.tests.append(Selftest(testcase, args.path, args.timeout,
+                                       args.output))
 
     def _log_result(self, test_result):
         logger.info("*** stdout ***\n" + test_result.stdout)
-- 
2.53.0.1118.gaef5881109-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
