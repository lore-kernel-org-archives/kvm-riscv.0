Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24B2FF60D5
	for <kvm-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 19:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Y8en7RrU9TKo+wcGtT46H6bZHTSHUsG3Z/zvqdDXL7s=; b=QunV8WftmoM1fY1b13tMqhmjU6
	3Z4dMqy/AHG1wH+wgikKuupFOdoJMsa48NB+t93OJiToC/87Jfco4jVNWw3QTYmXSpsVz8g9KevyR
	/W9xeVP8YVB0uj3zEAI8hJGygst5xitLDEKh48sPkUeaZ/VOTGnkamTWNAFpNe0QK6yXFX0HJO/x9
	fjGnEmEomPbuqcYPKLZkj2C0axysRz7ncXQJ9Nn2eY1/IpCn0hXd4QWtEToQS5nk0JrIEMGTd1PX3
	RvzL7V+zXwa2F8yNlHBzcToFEY7Su9J8Nw9laiOC/hct/SgTXX6xCRibgO24hB84UwMxCtpZAcS8H
	F2gdk6ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7eyk-0000000DUOw-1bLs;
	Tue, 31 Mar 2026 19:42:22 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7eyh-0000000DUMn-36Vp
	for kvm-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 19:42:20 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-35678f99c6eso4452663a91.1
        for <kvm-riscv@lists.infradead.org>; Tue, 31 Mar 2026 12:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774986138; x=1775590938; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MqTZM8Atvognfn8r5xuaknIcSyhPV2VEo05zIHjpojQ=;
        b=XPQiGqe4Vn5S8/5MQ8pVFlCl9REO3KTz8FpLFhqpqvj+TXRP8eOwfQTUFlKAAj/ezc
         95/UthwcMvDAJHgFkqeKHzVk4aMtWFlG46Ln/uFmTCk77pulqDK9nPMK9Ap650sqYD1w
         9PWeBpDPROfvcgYvfz+d07/Y/oBJML4cD+04Q2jHSN5uObqaUJD8xZUwPJluyYoC5BoB
         AQpknnzMrsfh4c1xfLB8A9ic2UelZLeD0AWOZHBVpjDpFN2qRfnIR+17GJqdD324Zbxw
         Od/5y1c82u/MZgkaazYsxbBQ7WW663zkCx+5vkKUsLJx3vft1GNa4MqUpjGjWstVdslW
         2oDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986138; x=1775590938;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqTZM8Atvognfn8r5xuaknIcSyhPV2VEo05zIHjpojQ=;
        b=sr48nw3j7Yl7B1QBbmWrtRbO+AI4YmYUAfbCSlLniu1QjxF9KIMxrhzKXBaPbZbun6
         +h2Q1jgi2H3NBkxp//k7HHNSK9Fsm+bELJ9bTKuAKYlGb0nntlNGawog2iTvEHGOlrxT
         5bhaLOln9JgjerdEn/v7jzersXfje1E+1v2YA3152cYv4ECQBdr5r35J4zMFRWqvSXiT
         Gsxqkt1vzNXzuECHBSDY9emZqmiNCQ2A7oFYNjSTZF3QN5dkE0SGQe1wvLixmAAhe5p+
         yS6jBBOHZFKdTpNc7xRc/jBvnHVKTDiVtSIgm7P8ZcKkN25Pgs3MUxETe5mwXzjyZIC7
         YJ+w==
X-Forwarded-Encrypted: i=1; AJvYcCUdOMmyGMMLyXzr1BStnK8MTjyqsn6nqJXl/SYrhLGOH8G0qZMJQv0+22TjSfUiPsZnUYLZ/9zns2E=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxzg1pxzPi+mwzfJu/ocD3wSSSG6hQZsKRi2Elaalbk4xD4iFMz
	GDSvJulTpNzgZ+UFLr5emFlm0bd//uSfTUCLkwwWHOzZtZ2bj3kw9AW7y2idEoDkSG+MI46BDUy
	8cHBRICvDsA==
X-Received: from pjbqi4.prod.google.com ([2002:a17:90b:2744:b0:35b:993f:f936])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:57c4:b0:35c:d37:6024
 with SMTP id 98e67ed59e1d1-35dc6edbfd0mr555200a91.11.1774986138004; Tue, 31
 Mar 2026 12:42:18 -0700 (PDT)
Date: Tue, 31 Mar 2026 12:41:56 -0700
In-Reply-To: <20260331194202.1722082-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20260331194202.1722082-1-vipinsh@google.com>
X-Mailer: git-send-email 2.53.0.1118.gaef5881109-goog
Message-ID: <20260331194202.1722082-4-vipinsh@google.com>
Subject: [PATCH v4 3/9] KVM: selftests: Add timeout option in selftests runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com, Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_124219_784870_A9BB27EF 
X-CRM114-Status: GOOD (  12.89  )
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
time (seconds) given to a test for execution. Kill the test if it
exceeds the given timeout. Define a new SelftestStatus.TIMED_OUT to
denote a selftest final result. Add terminal color for status messages
of timed out tests.

Set the default value of 120 seconds for all tests.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../testing/selftests/kvm/runner/__main__.py  |  9 +++++-
 .../testing/selftests/kvm/runner/selftest.py  | 29 ++++++++++++-------
 .../selftests/kvm/runner/test_runner.py       |  2 +-
 3 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
index 9b6c78e69c64..82c543d11c34 100644
--- a/tools/testing/selftests/kvm/runner/__main__.py
+++ b/tools/testing/selftests/kvm/runner/__main__.py
@@ -37,6 +37,11 @@ def cli():
                         default=".",
                         help="Finds the test executables in the given path. Default is the current directory.")
 
+    parser.add_argument("--timeout",
+                        default=120,
+                        type=int,
+                        help="Timeout, in seconds, before runner kills the running test. (Default: 120 seconds)")
+
     return parser.parse_args()
 
 
@@ -44,6 +49,7 @@ def setup_logging():
     class TerminalColorFormatter(logging.Formatter):
         reset = "\033[0m"
         red_bold = "\033[31;1m"
+        red = "\033[31;1m"
         green = "\033[32m"
         yellow = "\033[33m"
         blue = "\033[34m"
@@ -52,7 +58,8 @@ def setup_logging():
             SelftestStatus.PASSED: green,
             SelftestStatus.NO_RUN: blue,
             SelftestStatus.SKIPPED: yellow,
-            SelftestStatus.FAILED: red_bold
+            SelftestStatus.FAILED: red_bold,
+            SelftestStatus.TIMED_OUT: red
         }
 
         def __init__(self, fmt=None, datefmt=None):
diff --git a/tools/testing/selftests/kvm/runner/selftest.py b/tools/testing/selftests/kvm/runner/selftest.py
index c1720897c629..e3924ee40ab3 100644
--- a/tools/testing/selftests/kvm/runner/selftest.py
+++ b/tools/testing/selftests/kvm/runner/selftest.py
@@ -17,6 +17,7 @@ class SelftestStatus(enum.IntEnum):
     NO_RUN = 22
     SKIPPED = 23
     FAILED = 24
+    TIMED_OUT = 25
 
     def __str__(self):
         return str.__str__(self.name)
@@ -28,7 +29,7 @@ class Selftest:
     Extract the test execution command from test file and executes it.
     """
 
-    def __init__(self, test_path, path):
+    def __init__(self, test_path, path, timeout):
         test_command = pathlib.Path(test_path).read_text().strip()
         if not test_command:
             raise ValueError("Empty test command in " + test_path)
@@ -37,6 +38,7 @@ class Selftest:
         self.exists = os.path.isfile(test_command.split(maxsplit=1)[0])
         self.test_path = test_path
         self.command = test_command
+        self.timeout = timeout
         self.status = SelftestStatus.NO_RUN
         self.stdout = ""
         self.stderr = ""
@@ -50,17 +52,22 @@ class Selftest:
             "universal_newlines": True,
             "shell": True,
             "stdout": subprocess.PIPE,
-            "stderr": subprocess.PIPE
+            "stderr": subprocess.PIPE,
+            "timeout": self.timeout,
         }
-        proc = subprocess.run(self.command, **run_args)
+        try:
+            proc = subprocess.run(self.command, **run_args)
+            out, err = proc.stdout, proc.stderr
+
+            if proc.returncode == 0:
+                self.status = SelftestStatus.PASSED
+            elif proc.returncode == 4:
+                self.status = SelftestStatus.SKIPPED
+            else:
+                self.status = SelftestStatus.FAILED
+        except subprocess.TimeoutExpired as e:
+            self.status = SelftestStatus.TIMED_OUT
+            out, err = e.stdout, e.stderr
 
-        out, err = proc.stdout, proc.stderr
         self.stdout = out.decode("utf-8", "replace") if isinstance(out, bytes) else (out or "")
         self.stderr = err.decode("utf-8", "replace") if isinstance(err, bytes) else (err or "")
-
-        if proc.returncode == 0:
-            self.status = SelftestStatus.PASSED
-        elif proc.returncode == 4:
-            self.status = SelftestStatus.SKIPPED
-        else:
-            self.status = SelftestStatus.FAILED
diff --git a/tools/testing/selftests/kvm/runner/test_runner.py b/tools/testing/selftests/kvm/runner/test_runner.py
index acc9fb3dabde..bea82c6239cd 100644
--- a/tools/testing/selftests/kvm/runner/test_runner.py
+++ b/tools/testing/selftests/kvm/runner/test_runner.py
@@ -15,7 +15,7 @@ class TestRunner:
         self.tests = []
 
         for testcase in testcases:
-            self.tests.append(Selftest(testcase, args.path))
+            self.tests.append(Selftest(testcase, args.path, args.timeout))
 
     def _log_result(self, test_result):
         logger.info("*** stdout ***\n" + test_result.stdout)
-- 
2.53.0.1118.gaef5881109-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
