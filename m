Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A45CAC5B8
	for <kvm-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 16:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Vh4QUQb83StSc/GRJIS7uTs/LM6Rf6Vp1cIkWK5Gars=; b=glm8DFXNnUrH0aycT1tIpDEqKW
	fVPxOhA8VWhGEBKM7OA16tKlcAFnYmUNCYwQiDB4TZfyrP/W1PI62SddIh5ZDjQDoBOf+p4AAbTo8
	FvPBC9un9koUIulDSd7y5mHMIBGZnE84fU5MSS/ZduzSYzU2d7JTvi5H9DMzPJJ75cO4zbQ9GxW+B
	VYDxTal4kOuJxFnJXPiYN7/bM9/Pry3zp2wk8U8cJ0DS3T8F/X24jaioNc4DPHImsfgE8Xs5NgT3J
	KFZksfkKqxIxugrIqmOAos+YMQisukwOlHiqDaVy7lsUut83qA7FzHcdjDA41fTaFzLo31mXLbc2q
	pJvwdhnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3dLa-00000005moF-2kkr;
	Tue, 30 Sep 2025 16:37:02 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3dLU-00000005mjl-3xz9
	for kvm-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 16:36:59 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-32eb864fe90so8692785a91.3
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Sep 2025 09:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759250215; x=1759855015; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=i/QRF3FFgseL8D0g15ww2uGbub0UU/EJdFmqDVXw9oU=;
        b=OumJsWIsq0/GgmWGPFdeuTYYG9X7yKOe/UgvJgIMs7UvIDpC/lyGHOT+UqMhq6M72x
         pWHY+ThmEiQF+twwYMZNzR0jQZ66UNes2ievut3xWGccY8oWN+BxbR02FRWwDc7v0MXR
         G16cFW9E4LqLaWtutxFlzwAKFgLAqUeWkPi56cgU6AU+CBY5REjah1arfou+roDR2BkD
         mWHq9ptYyTqivlcRwYbY1k2nxPGBkbjX+/cRz94iDgUCw+clIONZYO/Mm9AzUQ9YDnU+
         NDHg5vxTRoQxsGJXodG2SQtxPuUsnoYnYDxQU9dCmGxxnxQWaavc9cOpeKlErHLe958d
         EBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759250215; x=1759855015;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i/QRF3FFgseL8D0g15ww2uGbub0UU/EJdFmqDVXw9oU=;
        b=rfC40EUm+BN6TN2R6hK5efGDe9GMCJ8qEtpdkn0Ekcs/dIDuVMZOCKCF7Vf5JtFuEw
         EyHVu3D6/MIj2K+CQD5cPHhF3qm7iQmR0q1d+zWmGj5J2hkGLYykUedRU6U01szjwoJx
         Hy2zepfXeWjsTg3dZ9DFJTaC/p76p1ZBE2Jf0VQzLir2+dzwtYgzm0kP9bJb0HUA0d89
         HDNF8Bz0qSAuWHk64LryEsmIb84g1532aBF710ilMFLqY8Z426Y4eCPRBQjxXnCytLOO
         C37+zMIwYH2Ia4gO0nJnQbqyfp8K36Is65aAXiUAoPgJVbFVgsu0o0Uq6ybNqkxWM1wL
         oYiw==
X-Forwarded-Encrypted: i=1; AJvYcCWhkZ1FnuYvfDCLsgni28EuRNRBP3TUG/A623fNEdZRIUIaoK786vHMMETx93OeX6L6J+/4CKDQIDI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwlsCedBeLF6yNRZc0CJV7QrcY27OGt9Dp+KBo8wgETtPpexfJG
	+SEEZo1Jn2MKrNdzGyfYw6tR2zeix8PjV2rA+6DzafX4zF/nhxZk20gsGy1K2iTgBoKd/fYhpPt
	+rzu93gkUrg==
X-Google-Smtp-Source: AGHT+IEdeV+S3AOsumfo+VA7YBUiHc/nL5ezOQx5Foo8J1Cq3HgpIz3y8FReXq936G/8G4+cCaSjSkfD+N8w
X-Received: from pjbpg12.prod.google.com ([2002:a17:90b:1e0c:b0:32b:50cb:b92f])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c83:b0:338:3221:9dc0
 with SMTP id 98e67ed59e1d1-339a6f69812mr102527a91.37.1759250215269; Tue, 30
 Sep 2025 09:36:55 -0700 (PDT)
Date: Tue, 30 Sep 2025 09:36:30 -0700
In-Reply-To: <20250930163635.4035866-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250930163635.4035866-1-vipinsh@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20250930163635.4035866-5-vipinsh@google.com>
Subject: [PATCH v3 4/9] KVM: selftests: Add option to save selftest runner
 output to a directory
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com, Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_093658_156064_1503E723 
X-CRM114-Status: GOOD (  13.35  )
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
 .../testing/selftests/kvm/runner/__main__.py  | 34 +++++++++++++--
 .../testing/selftests/kvm/runner/selftest.py  | 42 ++++++++++++++++---
 .../selftests/kvm/runner/test_runner.py       |  4 +-
 3 files changed, 69 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
index 5cedc5098a54..b27a41e86271 100644
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
index 4783785ca230..1aedeaeb5e74 100644
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
-            self.stderr = "File doesn't exists."
-            return
-
+    def _run(self, output=None, error=None):
         run_args = {
             "universal_newlines": True,
             "shell": True,
@@ -59,7 +59,12 @@ class Selftest:
         try:
             proc = subprocess.run(self.command, **run_args)
             self.stdout = proc.stdout
+            if output is not None:
+                output.write(proc.stdout)
+
             self.stderr = proc.stderr
+            if error is not None:
+                error.write(proc.stderr)
 
             if proc.returncode == 0:
                 self.status = SelftestStatus.PASSED
@@ -71,5 +76,30 @@ class Selftest:
             self.status = SelftestStatus.TIMED_OUT
             if e.stdout is not None:
                 self.stdout = e.stdout
+                if output is not None:
+                    output.write(e.stdout)
             if e.stderr is not None:
                 self.stderr = e.stderr
+                if error is not None:
+                    error.write(e.stderr)
+
+    def run(self):
+        if not self.exists:
+            self.stderr = "File doesn't exists."
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
2.51.0.618.g983fd99d29-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
