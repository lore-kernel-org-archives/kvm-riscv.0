Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB0210F92F2
	for <kvm-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 19:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8ULEXUPklnWTetqY+rw+6+1lXkJPaOA8XLEvrOcD/BY=; b=kC8efRlwRYxqCMqoo+cmIXx/H3
	Wd7QrbV8n9wZx/TiHnGz3VelCHcZHgs/3v+y2BTx9VSm3+lXWm/f0Szfw8QGUZP87dmFsuInlfWAj
	aWueJHNokKE2reYjbF3YGxNs38ugb+12GqCWIyB+KrZM7EDAdJqp7Z3onitQ3hZtY1t0LLlwN9JIm
	NnDw0/0jwKEZdv8Sbd/nHCxk0nIxk4jnv9Ju5NtTBlqTZlxJYp4Arg8tMoLI+exXmFqmQnvkgPexj
	cnF/9HM78b8eMODm5NVoKcustAkbm0Du/ijTG21Pp3AszZwv8eegn8usfJEmAHpZzdLGmtcmPS4tD
	Lvb3O+XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7eyh-0000000DUNY-3pHl;
	Tue, 31 Mar 2026 19:42:19 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7eyf-0000000DULo-2kVe
	for kvm-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 19:42:18 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2b249541063so31964375ad.3
        for <kvm-riscv@lists.infradead.org>; Tue, 31 Mar 2026 12:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774986136; x=1775590936; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=okyRWg6SJ1Nbhs5yC14NmJAon29R3bVuhvecgVY39ps=;
        b=B8zFQLjLv4FH0W/NQdatOkyDLLnxcb3wYl++HLIoVjkzQ3dYlWmEK7a2Bwyre7W1+v
         sovmrazy2SmjLmK4Xu3ATkwEAoMWC7KzSVXd2Fw6DK1mxd3AyZ1098NA7oC0jKEV3FUC
         rJt2crfXDsxBqCgFWS7S8XWijXwt0QXgNrsNkIPjvruNYEDppR7O4iwLTFyTY955CHpy
         gRiazwfyGc26L2Pe8TjNwXISu37uxjIsjYkI0SfEw1yiuRV33yUHt1fsBfgnnfIMK6cv
         Vy3LOTmgWvYfScF9XKTYEA9Ht8Budhzxk2e6O/xzkekNiU+nDH0tGcw6LkZ8Upzv8xNg
         49wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986136; x=1775590936;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=okyRWg6SJ1Nbhs5yC14NmJAon29R3bVuhvecgVY39ps=;
        b=NvzAQL/X/iYVEZaDMpZh3uG34dC1p2vccnB5zWY9CC2PxdKG4JovogcvGBjaV4TFDc
         H8dtNSsxQfjuKglGief1FwJCVtquTIc8zinN+SOQcNyhvKlXQ23lq1K8v2ufACOlxE/m
         vMmULs9N4bQ59JolzLskln1FjlX8Ys+2fAdjhjM72Va6WUOY7R5olZW5rHLKIsEF/P9X
         8qZi5pq2K0/qcRTUisx8Rr6m2eTWmOv/0Z/W0Ca+NV6CDO6BSEH4Y4RcIplTO1hYgu9I
         lH/gwrjDZm8EulwimHKY5qLxztoUDuJrAtXA2fiTDJ6YQZpAa+xSS+NvNJzuoDtIwYgC
         /PPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4KU77WKvk8k0fL3ufJW3ACTMzYtc6G9T0abLy+elLlncTpYtTQlJqlMkMSLLPbyqcqwpwnMlsAGM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6NFm5wV5HKgMvYqGmErkgjbNSCfoE5KJ4NQuyh/zSP/KL2yAc
	/lDeysQ3IaWgqq9fH/WxXMJi5dDND/bLLO6ESxQUsByKlmA/N2g9UStusVQPXcp95wp2f+5zdpB
	V3rqeUaBzAQ==
X-Received: from plbmm7.prod.google.com ([2002:a17:903:a07:b0:2b0:4b14:f0e9])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:fb0:b0:2ae:5eee:7a5
 with SMTP id d9443c01a7336-2b269aca7a0mr4064425ad.12.1774986135979; Tue, 31
 Mar 2026 12:42:15 -0700 (PDT)
Date: Tue, 31 Mar 2026 12:41:55 -0700
In-Reply-To: <20260331194202.1722082-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20260331194202.1722082-1-vipinsh@google.com>
X-Mailer: git-send-email 2.53.0.1118.gaef5881109-goog
Message-ID: <20260331194202.1722082-3-vipinsh@google.com>
Subject: [PATCH v4 2/9] KVM: selftests: Provide executables path option to the
 KVM selftest runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com, Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_124217_717543_6363944A 
X-CRM114-Status: GOOD (  11.42  )
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

Add command line option, -p/--path, to specify the directory where
test binaries exist. If this option is not provided then default
to the current directory.

Example:
  python3 runner --dirs test -p ~/build/selftests

This option enables executing tests from out-of-tree builds.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 tools/testing/selftests/kvm/runner/__main__.py    | 8 +++++++-
 tools/testing/selftests/kvm/runner/selftest.py    | 4 ++--
 tools/testing/selftests/kvm/runner/test_runner.py | 4 ++--
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
index db87f426331d..9b6c78e69c64 100644
--- a/tools/testing/selftests/kvm/runner/__main__.py
+++ b/tools/testing/selftests/kvm/runner/__main__.py
@@ -31,6 +31,12 @@ def cli():
                         default=[],
                         help="Run the testcases present in the given directory and all of its sub directories. Provide the space separated paths to add multiple directories.")
 
+    parser.add_argument("-p",
+                        "--path",
+                        nargs='?',
+                        default=".",
+                        help="Finds the test executables in the given path. Default is the current directory.")
+
     return parser.parse_args()
 
 
@@ -87,7 +93,7 @@ def main():
     args = cli()
     setup_logging()
     testcases = fetch_testcases(args)
-    return TestRunner(testcases).start()
+    return TestRunner(testcases, args).start()
 
 
 if __name__ == "__main__":
diff --git a/tools/testing/selftests/kvm/runner/selftest.py b/tools/testing/selftests/kvm/runner/selftest.py
index 5a86f9ceedd4..c1720897c629 100644
--- a/tools/testing/selftests/kvm/runner/selftest.py
+++ b/tools/testing/selftests/kvm/runner/selftest.py
@@ -28,12 +28,12 @@ class Selftest:
     Extract the test execution command from test file and executes it.
     """
 
-    def __init__(self, test_path):
+    def __init__(self, test_path, path):
         test_command = pathlib.Path(test_path).read_text().strip()
         if not test_command:
             raise ValueError("Empty test command in " + test_path)
 
-        test_command = os.path.join(".", test_command)
+        test_command = os.path.join(path, test_command)
         self.exists = os.path.isfile(test_command.split(maxsplit=1)[0])
         self.test_path = test_path
         self.command = test_command
diff --git a/tools/testing/selftests/kvm/runner/test_runner.py b/tools/testing/selftests/kvm/runner/test_runner.py
index 4418777d75e3..acc9fb3dabde 100644
--- a/tools/testing/selftests/kvm/runner/test_runner.py
+++ b/tools/testing/selftests/kvm/runner/test_runner.py
@@ -11,11 +11,11 @@ logger = logging.getLogger("runner")
 
 
 class TestRunner:
-    def __init__(self, testcases):
+    def __init__(self, testcases, args):
         self.tests = []
 
         for testcase in testcases:
-            self.tests.append(Selftest(testcase))
+            self.tests.append(Selftest(testcase, args.path))
 
     def _log_result(self, test_result):
         logger.info("*** stdout ***\n" + test_result.stdout)
-- 
2.53.0.1118.gaef5881109-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
