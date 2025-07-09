Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9ECC83F17
	for <kvm-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 22:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=S47mprHbtiyFELWlqG/sDZVydTMSBJoRllwHOpM+6w4=; b=0G6Jgfkd9ZzfAbt7jztJ6G0YyS
	PRXdxnM7U6CYQWILsAHLuh6+bR73+5UPymnIA5PlAzDe28MV7AtaZWeSomEnoSNq3j6im29afkUwu
	C8c4KG4CVTUhRA7pMkglY7jN39urSwWhxphqPU4sywes/TBfv2CFSIPi3PfjW9d47EFsqh+VY0CXe
	GqLCuAcZuNoeP2JBnMbbCuE5t5rGq57MZIFydU0kIShYsCeSNnddLyGRX+7wAJZrPkARSpTConW8n
	JmKRoc3FNkIJV3che1WeTxqnswO8j5zjvUc/zR1Txg3mAYnxYOG4YBs4Ily0n+fLYg980A7tA17hN
	nZ5hFzoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdk7-0000000ABsk-2fe0;
	Wed, 09 Jul 2025 22:58:23 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdDt-0000000A53O-3stq
	for kvm-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 22:25:06 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-313c3915345so571974a91.3
        for <kvm-riscv@lists.infradead.org>; Wed, 09 Jul 2025 15:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752099904; x=1752704704; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LGmhA3rLQPa628TNnZlIPG9dvF57QQRZaeK+cAtydPY=;
        b=x6IuUbDsmqlC5acnIU2NJly/cdj/N2QmjKUVKkQXLljjbXZL8vB5mlAQMemi0wNRtt
         TjRbKQr45I9wTHBEtk+JjTXl/plMqghyE7Vcq2Zyg02Ckn8zxqMvwegP8z2WMKCrKx8H
         RXm50pQGWEq6CRQnCaepHAT1UmGy4MiJUpaHVRLC49IB7m+TISn0X1Fx+BpquGHdSAGz
         xiGzfW9TXQex5G/N76LeJPpOT5Qm5UcQUMtTlD5YmZQELSHq8DFG4kWoaYdk9YMchV8X
         iH3ajMT/SEWO7thHfpuJ9rlAgNMj04TWAgS7vrVBdvyaVGky6iz/lY/+IsonGsW0BH49
         tO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752099904; x=1752704704;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LGmhA3rLQPa628TNnZlIPG9dvF57QQRZaeK+cAtydPY=;
        b=spZ9YEsh7/rzkQWYr/gmoXgpG2TTj3zXFs27K82G4akoo8WtJrCBxpwLF8b8KzLr1q
         ISCz/TmC3ja5Sa8I8nS26UeyX7fPyqOtynmJo8yH6PyHjnqHzOqKBdqaA6/K/d+53BOk
         9wvDjkEnF2GgbfIHF64Oq7E73LYBUuMqTwfMBV2rig0Q9yLZvv2eWnod/hZ7pwg+Swyj
         2a68V3/ReEecTZHh7Funox7Dnrr9g+WRgBDPUCkYX1vKCskcCbtCMgLDwlA9bV3Xa0CK
         UnhiNwbtTlKSVVxvBRbiBJ5t1XphKYOG2bivLD9hAO09qBR5fonbolvhiXY6QZowRIHg
         WjVA==
X-Forwarded-Encrypted: i=1; AJvYcCXtS7H8+aIrUaEFpWcbFiYlDBohdRNY3AmtYumQgKcKqn6SUHibYEdWy6txRwhAjm/XVNewRE/8Iv0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQJbzWEth0dHTnwYe20pZeGqbpdR6ti3gsMFQ0vHxRHBTLCh6U
	TZgksBDzqD5gLUpRtXnbr8MNA4N/VtIDSdcLDF7cpEaPM1aVeqTW5NC/6wyw/Y515I27Ph+fXhl
	7+0R4zQ==
X-Google-Smtp-Source: AGHT+IHmmYPiGtSUrTz1EJzl9bD7Pjb4B/t13dgcPFaFz3OSasa6nCLwDj6VggbGkffUZnKPlHqH62nN/z8=
X-Received: from pja14.prod.google.com ([2002:a17:90b:548e:b0:313:274d:3007])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:558d:b0:313:db0b:75db
 with SMTP id 98e67ed59e1d1-31c2fdf5ba3mr6480539a91.33.1752099904282; Wed, 09
 Jul 2025 15:25:04 -0700 (PDT)
Date: Wed, 9 Jul 2025 15:25:02 -0700
In-Reply-To: <20250606235619.1841595-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com>
Message-ID: <aG7sPikxsI_ovhQq@google.com>
Subject: Re: [PATCH v2 00/15] Add KVM Selftests runner
From: Sean Christopherson <seanjc@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, pbonzini@redhat.com, 
	anup@brainfault.org, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, maz@kernel.org, oliver.upton@linux.dev, 
	dmatlack@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_152505_962179_65B99E6A 
X-CRM114-Status: GOOD (  19.68  )
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

On Fri, Jun 06, 2025, Vipin Sharma wrote:
>  tools/testing/selftests/kvm/.gitignore        |   4 +-
>  tools/testing/selftests/kvm/Makefile.kvm      |   8 +
>  .../testing/selftests/kvm/runner/__main__.py  | 271 ++++++++++++++++++
>  tools/testing/selftests/kvm/runner/command.py |  53 ++++
>  .../testing/selftests/kvm/runner/selftest.py  |  66 +++++
>  .../selftests/kvm/runner/test_runner.py       |  88 ++++++

Overall, looks great!  I think the only significant feedback is on the command
line options.

One thing we probably need is a README of some form, to explain how this works
and to give some examples.  Outside of you and I, I doubt anyone will know how
to use this :-)

Here's the full diff of the modifications I made to massage things to my liking.
It's not complete, e.g. I punted on the help messages and didn't change to
-p/--path, but otherwise it seems to work?

---
 .../testing/selftests/kvm/runner/__main__.py  | 86 +++----------------
 tools/testing/selftests/kvm/runner/command.py | 53 ------------
 .../testing/selftests/kvm/runner/selftest.py  | 39 +++++++--
 .../selftests/kvm/runner/test_runner.py       | 20 ++---
 4 files changed, 53 insertions(+), 145 deletions(-)
 delete mode 100644 tools/testing/selftests/kvm/runner/command.py

diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
index c02035a62873..0105835c557c 100644
--- a/tools/testing/selftests/kvm/runner/__main__.py
+++ b/tools/testing/selftests/kvm/runner/__main__.py
@@ -59,71 +59,26 @@ def cli():
                         type=int,
                         help="Maximum number of tests that can be run concurrently. (Default: 1)")
 
-    parser.add_argument("--print-status",
-                        action="store_true",
-                        default=False,
-                        help="Print only test's status and avoid printing stdout and stderr of the tests")
-
-    parser.add_argument("--print-passed",
-                        action="store_true",
-                        default=False,
-                        help="Print passed test's stdout, stderr and status."
-                        )
-
-    parser.add_argument("--print-passed-status",
-                        action="store_true",
-                        default=False,
-                        help="Print only passed test's status."
-                        )
-
-    parser.add_argument("--print-failed",
-                        action="store_true",
-                        default=False,
-                        help="Print failed test's stdout, stderr and status."
+    parser.add_argument("--print-passed", default="full", const="full", nargs='?', choices=["off", "full", "stderr", "stdout", "status"],
+                        help="blah"
                         )
 
-    parser.add_argument("--print-failed-status",
-                        action="store_true",
-                        default=False,
-                        help="Print only failed test's status."
+    parser.add_argument("--print-failed", default="full", const="full", nargs='?', choices=["off", "full", "stderr", "stdout", "status"],
+                        help="Full = print each test's stdout, stderr and status; status = only status."
                         )
 
-    parser.add_argument("--print-skipped",
-                        action="store_true",
-                        default=False,
+    parser.add_argument("--print-skipped", default="full", const="full", nargs='?', choices=["off", "full", "stderr", "stdout", "status"],
                         help="Print skipped test's stdout, stderr and status."
                         )
 
-    parser.add_argument("--print-skipped-status",
-                        action="store_true",
-                        default=False,
-                        help="Print only skipped test's status."
-                        )
-
-    parser.add_argument("--print-timed-out",
-                        action="store_true",
-                        default=False,
+    parser.add_argument("--print-timed-out", default="full", const="full", nargs='?', choices=["off", "full", "stderr", "stdout", "status"],
                         help="Print timed out test's stdout, stderr and status."
                         )
 
-    parser.add_argument("--print-timed-out-status",
-                        action="store_true",
-                        default=False,
-                        help="Print only timed out test's status."
-                        )
-
-    parser.add_argument("--print-no-runs",
-                        action="store_true",
-                        default=False,
+    parser.add_argument("--print-no-run", default="full", const="full", nargs='?', choices=["off", "full", "stderr", "stdout", "status"],
                         help="Print stdout, stderr and status for tests which didn't run."
                         )
 
-    parser.add_argument("--print-no-runs-status",
-                        action="store_true",
-                        default=False,
-                        help="Print only tests which didn't run."
-                        )
-
     parser.add_argument("--sticky-summary-only",
                         action="store_true",
                         default=False,
@@ -145,36 +100,19 @@ def level_filters(args):
     if args.sticky_summary_only or args.quiet:
         return levels
 
-    if args.print_passed or args.print_passed_status or args.print_status:
+    if args.print_passed != "off":
         levels.add(SelftestStatus.PASSED)
 
-    if args.print_failed or args.print_failed_status or args.print_status:
+    if args.print_failed != "off":
         levels.add(SelftestStatus.FAILED)
 
-    if args.print_skipped or args.print_skipped_status or args.print_status:
+    if args.print_skipped != "off":
         levels.add(SelftestStatus.SKIPPED)
 
-    if args.print_timed_out or args.print_timed_out_status or args.print_status:
+    if args.print_timed_out != "off":
         levels.add(SelftestStatus.TIMED_OUT)
 
-    if args.print_no_runs or args.print_no_runs_status or args.print_status:
-        levels.add(SelftestStatus.NO_RUN)
-
-    # Nothing set explicitly, enable all.
-    if not levels:
-        args.print_passed = True
-        levels.add(SelftestStatus.PASSED)
-
-        args.print_failed = True
-        levels.add(SelftestStatus.FAILED)
-
-        args.print_skipped = True
-        levels.add(SelftestStatus.SKIPPED)
-
-        args.print_timed_out = True
-        levels.add(SelftestStatus.TIMED_OUT)
-
-        args.print_no_runs = True
+    if args.print_no_run != "off":
         levels.add(SelftestStatus.NO_RUN)
 
     levels.add(logging.NOTSET)
diff --git a/tools/testing/selftests/kvm/runner/command.py b/tools/testing/selftests/kvm/runner/command.py
deleted file mode 100644
index 6f6b1811b490..000000000000
--- a/tools/testing/selftests/kvm/runner/command.py
+++ /dev/null
@@ -1,53 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-# Copyright 2025 Google LLC
-#
-# Author: vipinsh@google.com (Vipin Sharma)
-
-import subprocess
-import pathlib
-import contextlib
-import os
-
-
-class Command:
-    """Executes a command in shell.
-
-    Returns the exit code, std output and std error of the command.
-    """
-
-    def __init__(self, command, timeout, output_dir):
-        self.command = command
-        self.timeout = timeout
-        self.output_dir = output_dir
-
-    def _run(self, output=None, error=None):
-        run_args = {
-            "universal_newlines": True,
-            "shell": True,
-            "timeout": self.timeout,
-        }
-
-        if output is None and error is None:
-            run_args.update({"capture_output": True})
-        else:
-            run_args.update({"stdout": output, "stderr": error})
-
-        proc = subprocess.run(self.command, **run_args)
-        return proc.returncode, proc.stdout, proc.stderr
-
-    def run(self):
-        if self.output_dir is not None:
-            pathlib.Path(self.output_dir).mkdir(parents=True, exist_ok=True)
-
-        output = None
-        error = None
-        with contextlib.ExitStack() as stack:
-            if self.output_dir is not None:
-                output_path = os.path.join(self.output_dir, "stdout")
-                output = stack.enter_context(
-                    open(output_path, encoding="utf-8", mode="w"))
-
-                error_path = os.path.join(self.output_dir, "stderr")
-                error = stack.enter_context(
-                    open(error_path, encoding="utf-8", mode="w"))
-            return self._run(output, error)
diff --git a/tools/testing/selftests/kvm/runner/selftest.py b/tools/testing/selftests/kvm/runner/selftest.py
index 664958c693e5..1ec1ddfbf034 100644
--- a/tools/testing/selftests/kvm/runner/selftest.py
+++ b/tools/testing/selftests/kvm/runner/selftest.py
@@ -3,7 +3,6 @@
 #
 # Author: vipinsh@google.com (Vipin Sharma)
 
-import command
 import pathlib
 import enum
 import os
@@ -37,17 +36,18 @@ class Selftest:
         if not test_command:
             raise ValueError("Empty test command in " + test_path)
 
-        test_command = os.path.join(executable_dir, test_command)
-        self.exists = os.path.isfile(test_command.split(maxsplit=1)[0])
+        self.command = os.path.join(executable_dir, test_command)
+        self.exists = os.path.isfile(self.command.split(maxsplit=1)[0])
         self.test_path = test_path
 
         if output_dir is not None:
             output_dir = os.path.join(output_dir, test_path.lstrip("/"))
-        self.command = command.Command(test_command, timeout, output_dir)
 
         self.status = SelftestStatus.NO_RUN
         self.stdout = ""
         self.stderr = ""
+        self.timeout = timeout
+        self.output_dir = output_dir
 
     def run(self):
         if not self.exists:
@@ -55,12 +55,37 @@ class Selftest:
             return
 
         try:
-            ret, self.stdout, self.stderr = self.command.run()
-            if ret == 0:
+            run_args = {
+                "universal_newlines": True,
+                "shell": True,
+                "stdout": subprocess.PIPE,
+                "stderr": subprocess.PIPE,
+                "timeout": self.timeout,
+            }
+            proc = subprocess.run(self.command, **run_args)
+
+            self.stdout = proc.stdout
+            self.stderr = proc.stderr
+
+            if proc.returncode == 0:
                 self.status = SelftestStatus.PASSED
-            elif ret == 4:
+            elif proc.returncode == 4:
                 self.status = SelftestStatus.SKIPPED
             else:
                 self.status = SelftestStatus.FAILED
         except subprocess.TimeoutExpired as e:
+            self.stdout = e.stdout
+            self.stderr = e.stderr
+
             self.status = SelftestStatus.TIMED_OUT
+
+        if self.output_dir is not None:
+            pathlib.Path(self.output_dir).mkdir(parents=True, exist_ok=True)
+
+            output_path = os.path.join(self.output_dir, "stdout")
+            with open(output_path, encoding="utf-8", mode="w") as f:
+                f.write(self.stdout)
+
+            error_path = os.path.join(self.output_dir, "stderr")
+            with open(error_path, encoding="utf-8", mode="w") as f:
+                f.write(self.stderr)
diff --git a/tools/testing/selftests/kvm/runner/test_runner.py b/tools/testing/selftests/kvm/runner/test_runner.py
index e7730880907d..a285a711a686 100644
--- a/tools/testing/selftests/kvm/runner/test_runner.py
+++ b/tools/testing/selftests/kvm/runner/test_runner.py
@@ -19,13 +19,12 @@ class TestRunner:
         self.output_dir = args.output
         self.jobs = args.jobs
         self.quiet = args.quiet
-        self.print_status = args.print_status
         self.print_stds = {
             SelftestStatus.PASSED: args.print_passed,
             SelftestStatus.FAILED: args.print_failed,
             SelftestStatus.SKIPPED: args.print_skipped,
             SelftestStatus.TIMED_OUT: args.print_timed_out,
-            SelftestStatus.NO_RUN: args.print_no_runs
+            SelftestStatus.NO_RUN: args.print_no_run
         }
 
         for test_file in test_files:
@@ -52,15 +51,14 @@ class TestRunner:
         # Clear the status line
         self._print("\033[2K", end="\r")
         logger.log(test_result.status,
-                   f"[{test_result.status}] {test_result.test_path}")
-        if (self.output_dir is None and self.print_status is False
-                and self.print_stds.get(test_result.status, True)):
-            logger.info("************** STDOUT BEGIN **************")
-            logger.info(test_result.stdout)
-            logger.info("************** STDOUT END **************")
-            logger.info("************** STDERR BEGIN **************")
-            logger.info(test_result.stderr)
-            logger.info("************** STDERR END **************")
+                   f"[{test_result.status.name}] {test_result.test_path}")
+
+        print_level = self.print_stds.get(test_result.status);
+        if (print_level == "full" or print_level == "stdout"):
+            logger.info("*** stdout ***\n" + test_result.stdout)
+
+        if (print_level == "full" or print_level == "stderr"):
+            logger.info("*** stderr ***\n" + test_result.stderr)
 
         self.status[test_result.status] += 1
         # Sticky bottom line

base-commit: 611829e42fb47b99ff2b6c75637aec2410739611
--

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
