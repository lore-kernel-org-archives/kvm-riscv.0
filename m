Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C21CCA470
	for <kvm-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 16:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BvSD0lIbgFIwR71qoYS0bVkciQKCN4twLhSYvs9R0Z0=; b=b3XPGMu67Q2ns8V+LtzHKyIMve
	mslSGFiGx6O38rRdCeWZHepIlmJ+KEV833P1QDZSiKYBzWay3Na5uRW1y5kacRT0d2jJthoLOGFeC
	AfpW4ANeipKDTM4sY2wF0L4th9irWu+ZB6PSzcZhLJcBrL3W0HVn8vH/1GBXa3hSxKcWTCBhOFeE3
	AXWz5hmuDtpb6toH4TjrTwU/JKO8p9441TJbUG4TRvoBfQPSepDISH/DzwWFgSDLkdsUGweKWUDlM
	YTHZ2e2UEmPu6ao3JWzwwU6MsVflmXDzUb80RssLLMsQMlUzREGru2Qpu7P/8n93XKyIqj8EcfFoU
	ficCIrPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3dLW-00000005mla-1gYL;
	Tue, 30 Sep 2025 16:36:58 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3dLT-00000005miv-2HDH
	for kvm-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 16:36:56 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-277f0ea6fbaso72588025ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Sep 2025 09:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759250214; x=1759855014; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=j2Euv6clQfNxoRLfSL+cWKcybU5R4aSAzjQ7Pxx9veA=;
        b=QbKLcKek2kWW8WvFdAa8cJtoey13tvcGJnTRki3WrEJxRKQxGKZ/Yk5W19CcPKszBH
         G0A3A4vyvXrWj/MrpYrK/k3dg+BcuFTDgmr4aoQnZCmx2INa7gJ225/y6e4tBVpvo9Qp
         SQ6nF5rhneOtzlR+yGjg1BTpkan5GScFcgiSeLBmTXRB8TJa3PMBvmpu2nwqrl/cr+Ar
         ncu44pAcvJp/hK1d9bQsfpiXU6xyCdSQTzR73qDDogNUJe4tCz8I8M79Pgo90ko5r/uC
         TxMiX5dWrPT9dNa0Ydr0UXK5LkFGzGUYPBwRsq5Sake0a9VXUVzo+f+1qRyXFWTCqamI
         FxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759250214; x=1759855014;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j2Euv6clQfNxoRLfSL+cWKcybU5R4aSAzjQ7Pxx9veA=;
        b=dXAnt+jlMDSpaZ5TQ0RhEt6dAeKxBWVmEVXguNIE0u4hpFlh9tzlIpdASp2lhUL8nl
         gD+MZ1eS8XiCRsUvks4cf65OpUdpjDi8iHzyR4xjGCnQocJKYc9V+vPg4xkFJuUW4GC8
         ycg8d/Ofxh+zpV6P0/B53kywwefKry4QVMX10mhnvHBGc5xyPfGiz/NR12u9yZf5xVL1
         FbsjtNO0lB59YMvv02cjzCBMHhd/rsst+FNqZXN1sadHuEmL4rqEMrXWMvYxsBD7o7x1
         94LkAzN9gbtXHBqbT6TcfImT9FQcjAikaqjBkYKG9ljSODhcyH5r2gF86Qanhc6UYtHV
         kMVg==
X-Forwarded-Encrypted: i=1; AJvYcCWtOoXbYVj1TVwt2vPR8B7To+xothXbz0hwn4Ca1qhh+H74d3LQaINHOwCnw0JF0u7KIRiCWqCeek8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyupWS4QozY2ImedCeaAtFIpVLTu9Xub9JJRO64wumJSjWsYoTy
	Isdh2dRAYBOOxK5Md0DcoyqpoLvF9HjfOW1H6lPUVhO2mdsaw8FRibyyLCvjNPSCBbcpIudRbLI
	NfofKWKzcew==
X-Google-Smtp-Source: AGHT+IEUJogWYHXsmsuG3UsFdIVcKizfFNq9vULrceDQMPraAU5EEavtCr8SZ2YcitzUBBX0I97qyMqtVbSV
X-Received: from plpl2.prod.google.com ([2002:a17:903:3dc2:b0:27d:1f18:78ab])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:b46:b0:252:1743:de67
 with SMTP id d9443c01a7336-28e7f318717mr3857185ad.44.1759250213581; Tue, 30
 Sep 2025 09:36:53 -0700 (PDT)
Date: Tue, 30 Sep 2025 09:36:29 -0700
In-Reply-To: <20250930163635.4035866-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250930163635.4035866-1-vipinsh@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20250930163635.4035866-4-vipinsh@google.com>
Subject: [PATCH v3 3/9] KVM: selftests: Add timeout option in selftests runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com, Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_093655_678946_00762C54 
X-CRM114-Status: GOOD (  13.45  )
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
 .../testing/selftests/kvm/runner/__main__.py  |  9 ++++-
 .../testing/selftests/kvm/runner/selftest.py  | 33 ++++++++++++-------
 .../selftests/kvm/runner/test_runner.py       |  2 +-
 3 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
index 943c3bfe2eb6..5cedc5098a54 100644
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
index a94b6d4cda05..4783785ca230 100644
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
@@ -50,15 +52,24 @@ class Selftest:
             "universal_newlines": True,
             "shell": True,
             "stdout": subprocess.PIPE,
-            "stderr": subprocess.PIPE
+            "stderr": subprocess.PIPE,
+            "timeout": self.timeout,
         }
-        proc = subprocess.run(self.command, **run_args)
-        self.stdout = proc.stdout
-        self.stderr = proc.stderr
 
-        if proc.returncode == 0:
-            self.status = SelftestStatus.PASSED
-        elif proc.returncode == 4:
-            self.status = SelftestStatus.SKIPPED
-        else:
-            self.status = SelftestStatus.FAILED
+        try:
+            proc = subprocess.run(self.command, **run_args)
+            self.stdout = proc.stdout
+            self.stderr = proc.stderr
+
+            if proc.returncode == 0:
+                self.status = SelftestStatus.PASSED
+            elif proc.returncode == 4:
+                self.status = SelftestStatus.SKIPPED
+            else:
+                self.status = SelftestStatus.FAILED
+        except subprocess.TimeoutExpired as e:
+            self.status = SelftestStatus.TIMED_OUT
+            if e.stdout is not None:
+                self.stdout = e.stdout
+            if e.stderr is not None:
+                self.stderr = e.stderr
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
2.51.0.618.g983fd99d29-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
