Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE296CCA472
	for <kvm-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 16:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yJJ1pGgROyP5fYRz9J8M6YTjXg8Qkg7jIb3Tx7LP6V4=; b=et92BBltu+BxrwiclEFmhtD95B
	WwLVKchvZb/BqI7ept8gPFhX1JJa7n2qTFimOg0uDnJoAZks8xEAw8BSMnvGmnh/KXS2tEApd9Cok
	+q89SKMsVqfL5J2+avYU0mJFxW5O3hh5aHsDg9Pi06500a58drPcSsNtxhbJrXlloIGbm+yWaNEEx
	kjbZ1HH69z4Yj2hemjfMxQ08Mq9xe8W1hW54iuOSFA56jmhKIQD1rBQNAHjWve7QC/+clHQ4oEj3j
	LHaCR5SA1BXLXBaGgGANwe2MK9ldp5ypFkHW3TDTR1Gf4M4FtdIq9TY0WO/c32rUEOpJk90OaaI/i
	7/01Ua7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3dLS-00000005mj4-2dGT;
	Tue, 30 Sep 2025 16:36:54 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3dLP-00000005mhs-3kau
	for kvm-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 16:36:53 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-27c62320f16so69613925ad.1
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Sep 2025 09:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759250210; x=1759855010; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rc4ucMrZZLQgysJDwujeADN63tAlAVtHcaQvgLoGAb0=;
        b=UeEH5WzcMmJPDPe+dve74tfPtV+szKj5YMQ+MU8cyzxHVp+EjjyQ8+05Ik2YIgmB2n
         qBJKkHrvpzS1JnCyhHGmA7VQEPUi+3xizZuorSdiubB8OXSglrzAz9vnNkLC/v2DWWyk
         TdWW2OFF6rZiAB3OfcBcE9cZgSY0f4F/Q3XB6JVKaLTFNJB51PDizWEdb2RJzzZEdwcf
         6mbDEOeLtPK1S3aSVK2uJ/7MuVsL61cJw5GJUvxlnJdtoyDm9s95u3/CZJfGEsrlW7St
         i+dPbyRyKUzPbvaBLg8nv/ae7FZhOzXXcRWwi4SeiHsZsU3h150+fupGM50Vvsu0C4+2
         CVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759250210; x=1759855010;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rc4ucMrZZLQgysJDwujeADN63tAlAVtHcaQvgLoGAb0=;
        b=wqWQPXJx8WZcIDmqLAvpF9J9oJ8/mplKtn/JhYDJKd06Zj1p5RcrgcIciapnAqz1O2
         y0H/1dlz11lGmGsWVLZIynHRT9DMFzs9INx2uPF1FtRBXsG46Dz0vdQv5TRQJhE/XsIH
         vT+xkaG7BBmVpm0HhutvcQxJDUTo6QSCsgpT5xI9RZJjQXYSdjKLuwmdcNBseeoufgGn
         fT95I/FLotBBtp9TFN2MvvBdBTMwBKs6YMHuGyGmRzgRnH73GcNp3LhytQVcyMKNsPkU
         BlnngpZ8M711dxPmOTzngztqTYyc2uKbAJn7MmWDRsHM9IWwzq9XBWH+qA7MqkN5eX/d
         wlzA==
X-Forwarded-Encrypted: i=1; AJvYcCVDxEaVrpcGS5FZKPVYSkBBqPwop8M5wTevKhYfAXUeqjHJicyZvKaRhInG6xL6OyBN8Na4VAC3tsc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwXdenF7WEYnqlpf4bTTfEYdu6EIjDqND+F1615xRDfDdDjsTSj
	Bz5bA6hCRrpt5yFfHK/TGUzNDvyj4R5fCYpqh5wJskcXaE5FxjBV73Z+1i1pERGOQRH3Lw4h1gF
	cP8Kbpn3MiA==
X-Google-Smtp-Source: AGHT+IHLVHVPK97xGLpcLMiansWk7hFaSR+T9o/MXlCUi7oz8YlG+P3ooNANbdPhcTUhvNECCSwntR5R1+dy
X-Received: from pjbgm21.prod.google.com ([2002:a17:90b:1015:b0:330:88c4:627])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ebc8:b0:267:da75:e0f
 with SMTP id d9443c01a7336-28e7f276e18mr4968975ad.11.1759250210348; Tue, 30
 Sep 2025 09:36:50 -0700 (PDT)
Date: Tue, 30 Sep 2025 09:36:27 -0700
In-Reply-To: <20250930163635.4035866-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250930163635.4035866-1-vipinsh@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20250930163635.4035866-2-vipinsh@google.com>
Subject: [PATCH v3 1/9] KVM: selftest: Create KVM selftest runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com, Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_093651_945101_8F0A92A6 
X-CRM114-Status: GOOD (  18.41  )
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

Implement a basic KVM selftest runner in Python to run selftests. Add
command line options to select individual testcase file or a
directory containing multiple testcase files.

After selecting the tests to run, start their execution and print their
final execution status (passed, failed, skipped, no run), stdout and
stderr on terminal.

Print execution status in colors on the terminals where it is supported
to easily distinguish different statuses of the tests execution.

If a test fails or times out, then return with a non-zero exit code
after all of the tests execution have completed. If none of the tests
fails or times out then exit with status 0

Provide some sample test configuration files to demonstrate the
execution of the runner.

Runner can be started from tools/testing/selftests/kvm directory as:

  python3 runner --dirs tests
OR
  python3 runner --testcases \
  tests/dirty_log_perf_test/no_dirty_log_protect.test

This is a very basic implementation of the runner. Next patches will
enhance the runner by adding more features like parallelization, dumping
output to file system, time limit, out-of-tree builds run, etc.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 tools/testing/selftests/kvm/.gitignore        |  4 +-
 .../testing/selftests/kvm/runner/__main__.py  | 94 +++++++++++++++++++
 .../testing/selftests/kvm/runner/selftest.py  | 64 +++++++++++++
 .../selftests/kvm/runner/test_runner.py       | 37 ++++++++
 .../2slot_5vcpu_10iter.test                   |  1 +
 .../no_dirty_log_protect.test                 |  1 +
 6 files changed, 200 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/kvm/runner/__main__.py
 create mode 100644 tools/testing/selftests/kvm/runner/selftest.py
 create mode 100644 tools/testing/selftests/kvm/runner/test_runner.py
 create mode 100644 tools/testing/selftests/kvm/tests/dirty_log_perf_test/2slot_5vcpu_10iter.test
 create mode 100644 tools/testing/selftests/kvm/tests/dirty_log_perf_test/no_dirty_log_protect.test

diff --git a/tools/testing/selftests/kvm/.gitignore b/tools/testing/selftests/kvm/.gitignore
index 1d41a046a7bf..95af97b1ff9e 100644
--- a/tools/testing/selftests/kvm/.gitignore
+++ b/tools/testing/selftests/kvm/.gitignore
@@ -3,10 +3,12 @@
 !/**/
 !*.c
 !*.h
+!*.py
 !*.S
 !*.sh
+!*.test
 !.gitignore
 !config
 !settings
 !Makefile
-!Makefile.kvm
\ No newline at end of file
+!Makefile.kvm
diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
new file mode 100644
index 000000000000..8d1a78450e41
--- /dev/null
+++ b/tools/testing/selftests/kvm/runner/__main__.py
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright 2025 Google LLC
+#
+# Author: vipinsh@google.com (Vipin Sharma)
+
+import argparse
+import logging
+import os
+import sys
+
+from test_runner import TestRunner
+from selftest import SelftestStatus
+
+
+def cli():
+    parser = argparse.ArgumentParser(
+        prog="KVM Selftests Runner",
+        formatter_class=argparse.RawTextHelpFormatter,
+        allow_abbrev=False
+    )
+
+    parser.add_argument("-t",
+                        "--testcases",
+                        nargs="*",
+                        default=[],
+                        help="Testcases to run. Provide the space separated testcases paths")
+
+    parser.add_argument("-d",
+                        "--dirs",
+                        nargs="*",
+                        default=[],
+                        help="Run the testcases present in the given directory and all of its sub directories. Provide the space separated paths to add multiple directories.")
+
+    return parser.parse_args()
+
+
+def setup_logging():
+    class TerminalColorFormatter(logging.Formatter):
+        reset = "\033[0m"
+        red_bold = "\033[31;1m"
+        green = "\033[32m"
+        yellow = "\033[33m"
+        blue = "\033[34m"
+
+        COLORS = {
+            SelftestStatus.PASSED: green,
+            SelftestStatus.NO_RUN: blue,
+            SelftestStatus.SKIPPED: yellow,
+            SelftestStatus.FAILED: red_bold
+        }
+
+        def __init__(self, fmt=None, datefmt=None):
+            super().__init__(fmt, datefmt)
+
+        def format(self, record):
+            return (self.COLORS.get(record.levelno, "") +
+                    super().format(record) + self.reset)
+
+    logger = logging.getLogger("runner")
+    logger.setLevel(logging.INFO)
+
+    ch = logging.StreamHandler()
+    ch_formatter = TerminalColorFormatter(fmt="%(asctime)s | %(message)s",
+                                          datefmt="%H:%M:%S")
+    ch.setFormatter(ch_formatter)
+    logger.addHandler(ch)
+
+
+def fetch_testcases_in_dirs(dirs):
+    testcases = []
+    for dir in dirs:
+        for root, child_dirs, files in os.walk(dir):
+            for file in files:
+                testcases.append(os.path.join(root, file))
+    return testcases
+
+
+def fetch_testcases(args):
+    testcases = args.testcases
+    testcases.extend(fetch_testcases_in_dirs(args.dirs))
+    # Remove duplicates
+    testcases = list(dict.fromkeys(testcases))
+    return testcases
+
+
+def main():
+    args = cli()
+    setup_logging()
+    testcases = fetch_testcases(args)
+    return TestRunner(testcases).start()
+
+
+if __name__ == "__main__":
+    sys.exit(main())
diff --git a/tools/testing/selftests/kvm/runner/selftest.py b/tools/testing/selftests/kvm/runner/selftest.py
new file mode 100644
index 000000000000..34005f83f0c3
--- /dev/null
+++ b/tools/testing/selftests/kvm/runner/selftest.py
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright 2025 Google LLC
+#
+# Author: vipinsh@google.com (Vipin Sharma)
+
+import pathlib
+import enum
+import os
+import subprocess
+
+class SelftestStatus(enum.IntEnum):
+    """
+    Selftest Status. Integer values are just +1 to the logging.INFO level.
+    """
+
+    PASSED = 21
+    NO_RUN = 22
+    SKIPPED = 23
+    FAILED = 24
+
+    def __str__(self):
+        return str.__str__(self.name)
+
+class Selftest:
+    """
+    Represents a single selftest.
+
+    Extract the test execution command from test file and executes it.
+    """
+
+    def __init__(self, test_path):
+        test_command = pathlib.Path(test_path).read_text().strip()
+        if not test_command:
+            raise ValueError("Empty test command in " + test_path)
+
+        test_command = os.path.join(".", test_command)
+        self.exists = os.path.isfile(test_command.split(maxsplit=1)[0])
+        self.test_path = test_path
+        self.command = test_command
+        self.status = SelftestStatus.NO_RUN
+        self.stdout = ""
+        self.stderr = ""
+
+    def run(self):
+        if not self.exists:
+            self.stderr = "File doesn't exists."
+            return
+
+        run_args = {
+            "universal_newlines": True,
+            "shell": True,
+            "stdout": subprocess.PIPE,
+            "stderr": subprocess.PIPE
+        }
+        proc = subprocess.run(self.command, **run_args)
+        self.stdout = proc.stdout
+        self.stderr = proc.stderr
+
+        if proc.returncode == 0:
+            self.status = SelftestStatus.PASSED
+        elif proc.returncode == 4:
+            self.status = SelftestStatus.SKIPPED
+        else:
+            self.status = SelftestStatus.FAILED
diff --git a/tools/testing/selftests/kvm/runner/test_runner.py b/tools/testing/selftests/kvm/runner/test_runner.py
new file mode 100644
index 000000000000..4418777d75e3
--- /dev/null
+++ b/tools/testing/selftests/kvm/runner/test_runner.py
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright 2025 Google LLC
+#
+# Author: vipinsh@google.com (Vipin Sharma)
+
+import logging
+from selftest import Selftest
+from selftest import SelftestStatus
+
+logger = logging.getLogger("runner")
+
+
+class TestRunner:
+    def __init__(self, testcases):
+        self.tests = []
+
+        for testcase in testcases:
+            self.tests.append(Selftest(testcase))
+
+    def _log_result(self, test_result):
+        logger.info("*** stdout ***\n" + test_result.stdout)
+        logger.info("*** stderr ***\n" + test_result.stderr)
+        logger.log(test_result.status,
+                   f"[{test_result.status.name}] {test_result.test_path}")
+
+    def start(self):
+        ret = 0
+
+        for test in self.tests:
+            test.run()
+            self._log_result(test)
+
+            if (test.status not in [SelftestStatus.PASSED,
+                                    SelftestStatus.NO_RUN,
+                                    SelftestStatus.SKIPPED]):
+                ret = 1
+        return ret
diff --git a/tools/testing/selftests/kvm/tests/dirty_log_perf_test/2slot_5vcpu_10iter.test b/tools/testing/selftests/kvm/tests/dirty_log_perf_test/2slot_5vcpu_10iter.test
new file mode 100644
index 000000000000..5b8d56b44a75
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/dirty_log_perf_test/2slot_5vcpu_10iter.test
@@ -0,0 +1 @@
+dirty_log_perf_test -x 2 -v 5 -i 10
diff --git a/tools/testing/selftests/kvm/tests/dirty_log_perf_test/no_dirty_log_protect.test b/tools/testing/selftests/kvm/tests/dirty_log_perf_test/no_dirty_log_protect.test
new file mode 100644
index 000000000000..ed3490b1d1a1
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/dirty_log_perf_test/no_dirty_log_protect.test
@@ -0,0 +1 @@
+dirty_log_perf_test -g
-- 
2.51.0.618.g983fd99d29-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
