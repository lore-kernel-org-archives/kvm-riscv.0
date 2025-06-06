Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BD9C61CE7
	for <kvm-riscv@archiver.kernel.org>; Sat,  7 Jun 2025 00:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FCmv63T1FLZDHbwI3Ao3giqjq2uii9LM2OqajHsQAXM=; b=4D0WiUjNxB/RhSgaJ0lVcErVlK
	eSeKpLlhRu4U/fIpDZyiDPMNE+V7nPcyaJ9Mzz2/PS207G0lYCEZPQPVpGTyKjxic1xIQ+NcVFKJe
	ukXkTssrira8VU8bOHPOfLXH4/JbzdnMHFxybH+lZyV29K46Itk+oQSiyyv8O+TxxjpHlNCUH8ytO
	iM8WNPDruzPb2gv94iq0Dhg8J9NoWiDNWpVsjzic3qG81U9FzFXPTYjwVmfdWO3chTBYBlXM69Vue
	BewddUA0fJHbpOBdYF7moykAeL/reBVncfJF+6gLUuJkhTZtt3RdUKXdtuKku/R+sx0zyRMzcp4Y6
	sCk69xjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNh3j-000000019z3-2ki7;
	Sat, 07 Jun 2025 00:05:15 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNgvN-0000000195l-3MPg
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 23:56:38 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b2f4c436301so1695765a12.0
        for <kvm-riscv@lists.infradead.org>; Fri, 06 Jun 2025 16:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749254196; x=1749858996; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bGljYTvaXC7QnacTzvG5Nj4iX8W+IqA3xJgvnGBwRTM=;
        b=NkW+EfpTejGIvabNcLHXqquvxurHcmB3nJ4xvUTOrP4hqlkih2uy0naoBqJIvtgfTz
         9vEqJgQKs1yKnPGOB57q+ArHW8NrpVp2ZsuTfsTHtsBsSChgRHGmb90xnaqiLoeHaVWs
         truCDAtdGBMojU5H14IBa26ppV9pzQ68Ip3z6+UbUzZTGqnJgwoghOyL4uwSw01iA7qx
         XLDhug+WnVH0B4qLNliS/XNiAonBHLRfmz/reyr1Cdfd5tFhpGB3k2ii8EhPznOl/3L+
         ZfiosjcJcx8lfMppfnSQp/8zpyARj7lnatsG+9vhN/t6CbBtU3PXwjU6Wd6NTCBZuuiR
         EXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749254196; x=1749858996;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bGljYTvaXC7QnacTzvG5Nj4iX8W+IqA3xJgvnGBwRTM=;
        b=gruhvU7LZYIrXJrMzs3sPcmgeuCTuAFZ/7jMZxcVtB0CVJjvtAioIerzMkO8l+gArK
         zUXlFlIz0+IFrG/LUdv2zs0E+Eys/umPNxqZbh3tVeKAzCodXH6gq6Ut5fSAZsJ58UEj
         /4Um/x/92PV1hUSl8hA+pdfN0RzeCAcKejZIHPiOhhq0wXro5PKzUAoCnPNyCYDFCAsV
         sNgRhu2yJZPXC0pBba7FfDP8r06eO/B8sG+rdUMsecSSe+a3JAVhmQ5oJOnkqfxSbaW/
         a5/d203zOS5l82bzYzJlqC24RBYNRPxe5XHRDo7NASs9sTkP/78M5qHFhEL+T3aPbfMN
         BoDA==
X-Forwarded-Encrypted: i=1; AJvYcCUcXbUBgn3hSQzTNIf92jxcgr4eSju35hUFpztCT6XtkkWbQD+KaYj+r7MZq+qcDbzWIBcfxQAJZIM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxNveAVEc/SU1P97qf3LiAoe3T802MabCtcbRgTUGYsfYwoMDEO
	xCe5mqzT6l111HiHe85XfIGVtS4RblOPtTkna3veq/EDtKfoFArXUQmYVVAZdYohGdaLloaLOA7
	d19fu8b13VQ==
X-Google-Smtp-Source: AGHT+IEf6/EQQaFCn2+ilqOXhsd43GYZymP8LG9LnvyyGFrCPkId69cOH/yRMcziE3S42F6gZpobhUsXtO4j
X-Received: from pfhx2.prod.google.com ([2002:a05:6a00:1882:b0:747:abae:78e8])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3942:b0:215:e44c:831f
 with SMTP id adf61e73a8af0-21ee2559924mr7260991637.4.1749254196463; Fri, 06
 Jun 2025 16:56:36 -0700 (PDT)
Date: Fri,  6 Jun 2025 16:56:07 -0700
In-Reply-To: <20250606235619.1841595-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250606235619.1841595-4-vipinsh@google.com>
Subject: [PATCH v2 03/15] KVM: selftests: Add timeout option in selftests runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, anup@brainfault.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	maz@kernel.org, oliver.upton@linux.dev, dmatlack@google.com, 
	Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_165637_831875_4AA1D268 
X-CRM114-Status: GOOD (  14.65  )
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

Add a command line argument in KVM selftest runner to limit amount of
time (seconds) given to a test for execution. Kill the test if it exceeds the
given value. Define a new SelftestStatus.TIMED_OUT to denote a selftest
final result. Add terminal color for status messages of timed out tests.

Set the default value of 120 seconds for all tests.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../testing/selftests/kvm/runner/__main__.py  | 10 +++++++-
 tools/testing/selftests/kvm/runner/command.py |  4 +++-
 .../testing/selftests/kvm/runner/selftest.py  | 23 +++++++++++--------
 .../selftests/kvm/runner/test_runner.py       |  2 +-
 4 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
index 599300831504..f7f679be0e03 100644
--- a/tools/testing/selftests/kvm/runner/__main__.py
+++ b/tools/testing/selftests/kvm/runner/__main__.py
@@ -35,6 +35,12 @@ def cli():
                         default=".",
                         help="Finds the test executables in the given directory. Default is the current directory.")
 
+    parser.add_argument("-t",
+                        "--timeout",
+                        default=120,
+                        type=int,
+                        help="Timeout, in seconds, before runner kills the running test. (Default: 120 seconds)")
+
     return parser.parse_args()
 
 
@@ -42,6 +48,7 @@ def setup_logging(args):
     class TerminalColorFormatter(logging.Formatter):
         reset = "\033[0m"
         red_bold = "\033[31;1m"
+        red = "\033[31;1m"
         green = "\033[32m"
         yellow = "\033[33m"
         blue = "\033[34m"
@@ -50,7 +57,8 @@ def setup_logging(args):
             SelftestStatus.PASSED: green,
             SelftestStatus.NO_RUN: blue,
             SelftestStatus.SKIPPED: yellow,
-            SelftestStatus.FAILED: red_bold
+            SelftestStatus.FAILED: red_bold,
+            SelftestStatus.TIMED_OUT: red
         }
 
         def __init__(self, fmt=None, datefmt=None):
diff --git a/tools/testing/selftests/kvm/runner/command.py b/tools/testing/selftests/kvm/runner/command.py
index a63ff53a92b3..44c8e0875779 100644
--- a/tools/testing/selftests/kvm/runner/command.py
+++ b/tools/testing/selftests/kvm/runner/command.py
@@ -12,14 +12,16 @@ class Command:
     Returns the exit code, std output and std error of the command.
     """
 
-    def __init__(self, command):
+    def __init__(self, command, timeout):
         self.command = command
+        self.timeout = timeout
 
     def run(self):
         run_args = {
             "universal_newlines": True,
             "shell": True,
             "capture_output": True,
+            "timeout": self.timeout,
         }
 
         proc = subprocess.run(self.command, **run_args)
diff --git a/tools/testing/selftests/kvm/runner/selftest.py b/tools/testing/selftests/kvm/runner/selftest.py
index a0b06f150087..4c72108c47de 100644
--- a/tools/testing/selftests/kvm/runner/selftest.py
+++ b/tools/testing/selftests/kvm/runner/selftest.py
@@ -7,6 +7,7 @@ import command
 import pathlib
 import enum
 import os
+import subprocess
 
 
 class SelftestStatus(enum.IntEnum):
@@ -18,6 +19,7 @@ class SelftestStatus(enum.IntEnum):
     NO_RUN = 22
     SKIPPED = 23
     FAILED = 24
+    TIMED_OUT = 25
 
     def __str__(self):
         return str.__str__(self.name)
@@ -30,7 +32,7 @@ class Selftest:
     Extract the test execution command from test file and executes it.
     """
 
-    def __init__(self, test_path, executable_dir):
+    def __init__(self, test_path, executable_dir, timeout):
         test_command = pathlib.Path(test_path).read_text().strip()
         if not test_command:
             raise ValueError("Empty test command in " + test_path)
@@ -38,7 +40,7 @@ class Selftest:
         test_command = os.path.join(executable_dir, test_command)
         self.exists = os.path.isfile(test_command.split(maxsplit=1)[0])
         self.test_path = test_path
-        self.command = command.Command(test_command)
+        self.command = command.Command(test_command, timeout)
         self.status = SelftestStatus.NO_RUN
         self.stdout = ""
         self.stderr = ""
@@ -48,10 +50,13 @@ class Selftest:
             self.stderr = "File doesn't exists."
             return
 
-        ret, self.stdout, self.stderr = self.command.run()
-        if ret == 0:
-            self.status = SelftestStatus.PASSED
-        elif ret == 4:
-            self.status = SelftestStatus.SKIPPED
-        else:
-            self.status = SelftestStatus.FAILED
+        try:
+            ret, self.stdout, self.stderr = self.command.run()
+            if ret == 0:
+                self.status = SelftestStatus.PASSED
+            elif ret == 4:
+                self.status = SelftestStatus.SKIPPED
+            else:
+                self.status = SelftestStatus.FAILED
+        except subprocess.TimeoutExpired as e:
+            self.status = SelftestStatus.TIMED_OUT
diff --git a/tools/testing/selftests/kvm/runner/test_runner.py b/tools/testing/selftests/kvm/runner/test_runner.py
index 104f0b4c2e4e..1409e1cfe7d5 100644
--- a/tools/testing/selftests/kvm/runner/test_runner.py
+++ b/tools/testing/selftests/kvm/runner/test_runner.py
@@ -15,7 +15,7 @@ class TestRunner:
         self.tests = []
 
         for test_file in test_files:
-            self.tests.append(Selftest(test_file, args.executable))
+            self.tests.append(Selftest(test_file, args.executable, args.timeout))
 
     def _log_result(self, test_result):
         logger.log(test_result.status,
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
