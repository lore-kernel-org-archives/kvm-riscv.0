Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFA9FF60D5
	for <kvm-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 19:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PxdfncEcoHLJVPg+4ylJBZ7BASy7OrhH/P8uTeU9wN4=; b=Xz7Re44Jk+R8swAbmGL0Xd7B34
	NwlitgB3HjwooeJKppGGyIL/fEIZ/qkI4cYjIEFMQGumVJEoll7xSOhgRcLqcRV0XFQVHY6wVG7zt
	LxJBkMIe0lSZemgagJ3LSN3j6arb3eOpQEIMWyYxXL9A5SD2k20Ta1oLCiYk9zC5HJgo4Wh40bie8
	0UnsAq87gqVDBIX3pjc9HhMWuOFYlaKHwRZuZjXfcngaQyRZSvDdDdIZEbIKsRl3UZeFzses5QSk0
	nG8G6CZAgFAIKlZ9nh5gCWTfNczVpE3lP0qm0gsRvk4H/rZ+xQIO3Y7IClfS0B1Fhaik/rClLfVWs
	tQCXy8pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7eym-0000000DUQY-3rS3;
	Tue, 31 Mar 2026 19:42:24 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7eyl-0000000DUOv-14Vn
	for kvm-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 19:42:24 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-82c9364612fso10001164b3a.2
        for <kvm-riscv@lists.infradead.org>; Tue, 31 Mar 2026 12:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774986142; x=1775590942; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=moQABiS7cv82z1Yz7qoQD99nIXpPdwRqLpnQn6Ns6AY=;
        b=mcSDuaNwN2xZ6R7Fz+EyGlSRylCg5sgDlpt/vw+dULZeP5Mm9F/j7B8KVE4D6NT9yn
         x5eH1F0moDKf1bbAhnWu17gztkLE9QIN/vGjChPj0ylIv5PTyxjPpn1AIMfDyMw52aFa
         CXrAww66zIss7cO8cJUoY8PeNfBL1hbPrbZuXYkUlYs8pPoMsdrvSoZLzgHXkh2zjVXy
         i6qw/4qFAGzWVfmLP5K3KCSWM4JALG6N+H9efLmaTzgUdHHQVG5OwGivLx1ytWReaZsM
         hixO9DbhhgE4jt8yPTbdgOzrV5zNHvCXsuBHb3rCg2xhZ24eFljdKQJsbaHoqSZjdaRa
         Ggrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986142; x=1775590942;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=moQABiS7cv82z1Yz7qoQD99nIXpPdwRqLpnQn6Ns6AY=;
        b=cISLRaRIpUl5EfUsumMoYPQ6y6NXYKYenV6Mxl4YyO5HZiwz3aaYR1JIyELnYUr/vf
         mRPUuhXtlqiGbYg5FF2qdT/ZRcvGwWHGIlh/VvePsoe6LpOPWsD31ouKSli6UBxYTq6j
         gR8LIf6XkAyUJ0sKxwB3oIWOPYT40D5RMznCQSqpVaU6+5CIFB+ec6c6JsRleJZT8J4u
         bJCNmIpbF6h3astugiZpDQ7n+b3k7OC4PpjTNSgCPid3We2c2Qu+dhA9GWOWoUbl9ofc
         3V02ot9msvef0nEZH7bBWdvpXiALbElY6hSjWhwaIjs9X6O5cyMzkBVPqfjIsVMc3XC6
         KtLA==
X-Forwarded-Encrypted: i=1; AJvYcCVvkFa49eJCWFIxeZuO5t2xifWIOqgG/0NPNrHKzVJcEufqmKRboFWG8bo9IedyXd4CSpAa5E1Lhn0=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywokh6L9EMzQD26MNgED4jFK71F8PX0CbzPxwADp/kp69/5FzLX
	nMvZihTjNw7Kapzr/ZFDXA9kQ9XcIcvigJEvUCTeuMoVvldhbBl7ow6+GbxKPlkYhrfCrYMrAkr
	Wclo882USvQ==
X-Received: from pfbjf1.prod.google.com ([2002:a05:6a00:6e41:b0:821:82a1:fe7d])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:600d:b0:827:3946:a23c
 with SMTP id d2e1a72fcca58-82ce88d3bd7mr811773b3a.10.1774986141556; Tue, 31
 Mar 2026 12:42:21 -0700 (PDT)
Date: Tue, 31 Mar 2026 12:41:58 -0700
In-Reply-To: <20260331194202.1722082-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20260331194202.1722082-1-vipinsh@google.com>
X-Mailer: git-send-email 2.53.0.1118.gaef5881109-goog
Message-ID: <20260331194202.1722082-6-vipinsh@google.com>
Subject: [PATCH v4 5/9] KVM: selftests: Run tests concurrently in KVM
 selftests runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com, Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_124223_296137_0F73ACE3 
X-CRM114-Status: GOOD (  11.39  )
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

Add a command line argument, --jobs, to specify how many tests can
execute concurrently. Set default to 1.

Example:
  python3 runner --test-dirs tests -j 10

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../testing/selftests/kvm/runner/__main__.py  |  6 ++++
 .../selftests/kvm/runner/test_runner.py       | 28 +++++++++++++------
 2 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
index 5ea5ee8957c4..96402c89aea9 100644
--- a/tools/testing/selftests/kvm/runner/__main__.py
+++ b/tools/testing/selftests/kvm/runner/__main__.py
@@ -54,6 +54,12 @@ def cli():
                         default=False,
                         help="Appends timestamp to the output directory.")
 
+    parser.add_argument("-j",
+                        "--jobs",
+                        default=1,
+                        type=int,
+                        help="Maximum number of tests that can be run concurrently. (Default: 1)")
+
     return parser.parse_args()
 
 
diff --git a/tools/testing/selftests/kvm/runner/test_runner.py b/tools/testing/selftests/kvm/runner/test_runner.py
index b9101f0e0432..92eec18fe5c6 100644
--- a/tools/testing/selftests/kvm/runner/test_runner.py
+++ b/tools/testing/selftests/kvm/runner/test_runner.py
@@ -4,6 +4,8 @@
 # Author: vipinsh@google.com (Vipin Sharma)
 
 import logging
+import concurrent.futures
+
 from selftest import Selftest
 from selftest import SelftestStatus
 
@@ -14,11 +16,16 @@ class TestRunner:
     def __init__(self, testcases, args):
         self.tests = []
         self.output_dir = args.output
+        self.jobs = args.jobs
 
         for testcase in testcases:
             self.tests.append(Selftest(testcase, args.path, args.timeout,
                                        args.output))
 
+    def _run_test(self, test):
+        test.run()
+        return test
+
     def _log_result(self, test_result):
         logger.info("*** stdout ***\n" + test_result.stdout)
         logger.info("*** stderr ***\n" + test_result.stderr)
@@ -28,12 +35,17 @@ class TestRunner:
     def start(self):
         ret = 0
 
-        for test in self.tests:
-            test.run()
-            self._log_result(test)
-
-            if (test.status not in [SelftestStatus.PASSED,
-                                    SelftestStatus.NO_RUN,
-                                    SelftestStatus.SKIPPED]):
-                ret = 1
+        with concurrent.futures.ProcessPoolExecutor(max_workers=self.jobs) as executor:
+            all_futures = []
+            for test in self.tests:
+                future = executor.submit(self._run_test, test)
+                all_futures.append(future)
+
+            for future in concurrent.futures.as_completed(all_futures):
+                test_result = future.result()
+                self._log_result(test_result)
+                if (test_result.status not in [SelftestStatus.PASSED,
+                                               SelftestStatus.NO_RUN,
+                                               SelftestStatus.SKIPPED]):
+                    ret = 1
         return ret
-- 
2.53.0.1118.gaef5881109-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
