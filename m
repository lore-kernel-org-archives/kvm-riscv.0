Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461EFCCA472
	for <kvm-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 16:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=b2YEha+8OVrknoo1dZLjYe82RCMpTzf6ExFzIihoZvc=; b=NMiiLZiJ/M7eVNO2SdD8hc66Cr
	ma4Rm/5i1bmhzFUQVTxgkJcOAiJf8z8FpUTRxVAVa88z7sUjHvJSA2wypW/3OotmAu1UbfDTmyzcj
	0ei44Aw6a4ZufJ18SVKknhtoD+x3oLxgDrNu5YFuZ3jZGg8HvYeh2TjkvTVfbMi1Ma8Hb+eFxoVq6
	Xpn8a9NXsVqsuL7BmWNnNGoq7MNsduJSR6s9t0zKEMzHDJkuhT3gMB5Ey5Xuxyo68VuCHPo+6M8Gf
	uTmzuWbFm2j99ltkFtTg43SD5AYAMMjcmOFwU4+/kR4GnqwlWiJ28F8uoEeURnLs6mBJ5o91KF7Cn
	FxUkT52g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3dLb-00000005mpl-3v8W;
	Tue, 30 Sep 2025 16:37:03 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3dLW-00000005mkz-3bTJ
	for kvm-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 16:37:02 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-78038ed99d9so8267433b3a.2
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Sep 2025 09:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759250217; x=1759855017; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/blTKaVRJ7ExwjOeSNjQIII5Nz+Rh7TdSzJjFSlh4/M=;
        b=FdS7Ae3nxiQUEG0lIcdIkUEcfYSIOa3YUS7RxHU3O8XsuQ0Htl4dJyVtigb8Z37KJu
         4JCqWHTrML5C1l8Njh9k065jGmjKYnrvdvyeJ5iUr8wOuK0cthTwOc07st/QSWIwBrxY
         k2A15potyE1dRYOfZBXqxijXOATc4cZA8yhTFaNvGVGbOBW9Zrug3EVzgYRyjU1w4Mfw
         SSNsDBTyqVbRpkt/Bjf5A6KAT4d5sfQulXadK6BdwfVpHezg+1CbwRcG4ilmOZLuPqQL
         +ryPN/XmFpLvUyeIEhY8zC+5vEjgO5x4WC8xJtioZ1q7F3BsnHoH5f1ufeMmi7g2W9bp
         DdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759250217; x=1759855017;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/blTKaVRJ7ExwjOeSNjQIII5Nz+Rh7TdSzJjFSlh4/M=;
        b=MH/GNtc14vFikptCQU3Kb+6oQboTWXuxn7ZT+XpDU0U71mJU+vNGrxHOfMap7+UobK
         +G1b7khuR9LAcmOFGuRjvHhOokBveXPakSKMKDk9xt7VPqVK4i3znap39mlGqn8hWz+W
         dIEDTEfD2bT0kPusnjUuWqdoT0MmnIz5N3O69UmoC/znNue3MEPe84h4VkVPWf07Gf04
         hkTtgSNTZn+Ymf9BPRWvZxVJzUVcFp/INvEpoOJFSy1OYjHE8Y0lWIFUNDkSUADr4cOg
         4NWObmIhEepvWGsDwSTRFg4IS/ldSeVE+B3Yn8uEL3xvh/kGG2vCuTQgxXuX5TQo7rho
         nlzA==
X-Forwarded-Encrypted: i=1; AJvYcCWK5ifDrmNJQKAu7FFBs3mliOS7FUQZEdXuTuYEGLZuJQLRETfivboc+z+6K5zHyxbq/G2wWBAUjGY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwFdT5BQpGLCH+ormIEzYb+MMeD3onbSbkzNJWRUgHEGgPQwdlv
	PwOx4W71afTYj3SudC7TlkiEtZ/ra5InV9ro562egnrBAPE3ps+n9jxSOi9mZnuSIsNSlsYKKqx
	Z76jW/XHc5Q==
X-Google-Smtp-Source: AGHT+IE7rnnLhXFO5s/R1gQ25mkbUuQhQ07CGMf/RRIqGNDBQAmFMCZUe6cqXMyhDeruvPI5USo/PgLLbGsF
X-Received: from pgdf22.prod.google.com ([2002:a05:6a02:5156:b0:b58:d933:1281])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:1813:b0:301:daeb:589f
 with SMTP id adf61e73a8af0-321cf13ac4bmr518324637.8.1759250216877; Tue, 30
 Sep 2025 09:36:56 -0700 (PDT)
Date: Tue, 30 Sep 2025 09:36:31 -0700
In-Reply-To: <20250930163635.4035866-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250930163635.4035866-1-vipinsh@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20250930163635.4035866-6-vipinsh@google.com>
Subject: [PATCH v3 5/9] KVM: selftests: Run tests concurrently in KVM
 selftests runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com, Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_093658_930499_4859FC46 
X-CRM114-Status: GOOD (  11.98  )
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
index b27a41e86271..b98f72c9f7ee 100644
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
2.51.0.618.g983fd99d29-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
