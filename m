Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984D7C5AD49
	for <kvm-riscv@archiver.kernel.org>; Sat,  7 Jun 2025 00:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CKhipynzHSJUr32g1VLxh0DteUAJjdC74GRLVF4SdTQ=; b=CrX6fVQX7HPLuBS0vdWHL35KQL
	KeZSFD72ZxR8DSLByiDwVW6ywf4DVgmQxHYsii8uV4AAT/WcdASu6vdfdvE43J+x/2Lau9iNNih5U
	MzONHX/2Vp/0zH7L1ye1EXUiMEhwrIhmA+kivUDrLwPzoIQ9NaBlTZK2Twt1XkPyT5SuuMCcd+aPd
	LWKDAUh92gJp+OrcR5Ou1usqLHIjzsqfSdaHV7SkyEZ1ud8Cr80knWf+vb85i8t2AEViYuecUAguC
	jQyN3xlFyJDbrzW+TxIvhoNUAb3fd2g6YN1kptPy1NWCmHg3K3gN6Tkou/hnyPiyLYQOJa598wFN9
	6a6ekPRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNgzX-000000019i8-1ale;
	Sat, 07 Jun 2025 00:00:55 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNgvK-0000000194P-1fFE
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 23:56:35 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7480c9bcfdbso2263770b3a.0
        for <kvm-riscv@lists.infradead.org>; Fri, 06 Jun 2025 16:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749254193; x=1749858993; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kxXP95hawF0bP/21ppA24d2UiC0uzcGS8x7ArOmNTtw=;
        b=g3NOq5IL/MqXuPAGScd2TLMkpRkuwWn2Q/tb8yzqi6TNpFMgNOLJBEI3qKlgE0kMlc
         hxLuCaHAH8gSzpJV+l+q6jjLqMheDgfujx2yvmd58JZnZ8stTwcfJVpYWhR/w3ARRpYt
         0qGVuw3GrW/bZSp2fJBTu9XmvcL3rtWJwc9Uup1Bqu/DmJ9vHpOSp5VgzIZlNKh3daQA
         pEN2jxINLKUeqSSybfQTb1cBcqhQf66ctO0HPViHk3b6kBef/U2EVeFgkKTsF8zQabc3
         Dv6l5edQI2c9inuSNQS2mHyXt6TfyuLO3Sd8GbaIthCAiyeK1Oq1C/YMR4creGLQ5ykQ
         QGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749254193; x=1749858993;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kxXP95hawF0bP/21ppA24d2UiC0uzcGS8x7ArOmNTtw=;
        b=fnGb29VAB8ztdBlIXBi7UjlLRzY73a7ogjeVmPIYXg/jiGXzesLp/qpx+5jA561xL7
         4bWbNidfJ9230MhoAq81C4YEUlx1JX7pE4IzOZaxmBKgF4/bBLlBEzR4dc4VdrOJRuGz
         Kk9wVBuvEoKp8YZn+LlOoh+74q4TsTq7CFnaEuPGFXSvcOGTW0+ePqCaNng/bZd5ITKK
         9WKDIZgUt2FS9+Pxesj15jPEZ/rutCiUzOBlO9NNJFBE9faieVsS/4ATU8ipDZVq2jt9
         2Dd1pa4Y6XoBsGgn81r9wSzYuJibIRMP5gem+TbK+y6umvWHwhGE9MHkF7e11bJEWVv5
         S6Vw==
X-Forwarded-Encrypted: i=1; AJvYcCV6gcUTIfamOMAIWv5m3s0igtC1mqTxPYkfn1q2oAo/JokDVEfXpR43newYEHAahDCqcg4U8lYN4s4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzENPQ5Eyr/YcueDOyumKxSlk7JiHHNxlC8/UeYJNpJ1qKGFhpH
	YPh+Qo8WVDYuAiXupy1SjfT7KcanChc/MD1KNqsqw0dd+VnzFQSaK2H2ZaaysenZSu7c+D4axe1
	B+X2FsHgE6Q==
X-Google-Smtp-Source: AGHT+IEsgpkHATD3MzyTUpWnvIfN1vkf60AGKY8YiVf2Af+DZmlI4f3p+7HINwMY2FGNJmYMT0IKw8buk9Zt
X-Received: from pfiy14.prod.google.com ([2002:a05:6a00:190e:b0:746:3321:3880])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:22d1:b0:732:2923:b70f
 with SMTP id d2e1a72fcca58-74827ea1caamr6536248b3a.11.1749254193074; Fri, 06
 Jun 2025 16:56:33 -0700 (PDT)
Date: Fri,  6 Jun 2025 16:56:05 -0700
In-Reply-To: <20250606235619.1841595-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250606235619.1841595-2-vipinsh@google.com>
Subject: [PATCH v2 01/15] KVM: selftest: Create KVM selftest runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, anup@brainfault.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	maz@kernel.org, oliver.upton@linux.dev, dmatlack@google.com, 
	Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_165634_441110_2206F126 
X-CRM114-Status: GOOD (  19.42  )
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

Implement a basic KVM selftest runner in Python to run selftests based
on the passed test configuration. Add command line options to select
individual test configuration file or a directory containing test
configuration files.

After selecting the tests to run, start their execution and print their
final execution status (passed, failed, skipped, no run), stdout and
stderr on terminal.

Print execution status in colors on the terminals where it is supported
to easily distinguish statuses from the stdout/stderr of the tests
execution.

If a test fails or times out, then return with a non-zero exit code
after all of the tests execution have completed. If none of the tests
fails or times out then exit with status 0

Provide some sample test configuration files to demonstrate the
execution of the runner.

Runner can be started from tools/testing/selftests/kvm directory as:

  python3 runner --test-dirs tests
OR
  python3 runner --test-files \
  tests/dirty_log_perf_test/no_dirty_log_protect.test

This is a very basic implementation of the runner. Next patches will
enhance the runner by adding more features like parallelization, dumping
output to file system, time limit, out-of-tree builds run, etc.

Signed-off-by: Vipin Sharma <vipinsh@google.com>

---
 tools/testing/selftests/kvm/.gitignore        |  4 +-
 .../testing/selftests/kvm/runner/__main__.py  | 92 +++++++++++++++++++
 tools/testing/selftests/kvm/runner/command.py | 26 ++++++
 .../testing/selftests/kvm/runner/selftest.py  | 57 ++++++++++++
 .../selftests/kvm/runner/test_runner.py       | 41 +++++++++
 .../2slot_5vcpu_10iter.test                   |  1 +
 .../tests/dirty_log_perf_test/default.test    |  1 +
 .../no_dirty_log_protect.test                 |  1 +
 8 files changed, 222 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/kvm/runner/__main__.py
 create mode 100644 tools/testing/selftests/kvm/runner/command.py
 create mode 100644 tools/testing/selftests/kvm/runner/selftest.py
 create mode 100644 tools/testing/selftests/kvm/runner/test_runner.py
 create mode 100644 tools/testing/selftests/kvm/tests/dirty_log_perf_test/2slot_5vcpu_10iter.test
 create mode 100644 tools/testing/selftests/kvm/tests/dirty_log_perf_test/default.test
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
index 000000000000..b2c85606c516
--- /dev/null
+++ b/tools/testing/selftests/kvm/runner/__main__.py
@@ -0,0 +1,92 @@
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
+    parser.add_argument("--test-files",
+                        nargs="*",
+                        default=[],
+                        help="Test files to run. Provide the space separated test file paths")
+
+    parser.add_argument("--test-dirs",
+                        nargs="*",
+                        default=[],
+                        help="Run tests in the given directory and all of its sub directories. Provide the space separated paths to add multiple directories.")
+
+    return parser.parse_args()
+
+
+def setup_logging(args):
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
+def fetch_tests_from_dirs(scan_dirs):
+    test_files = []
+    for scan_dir in scan_dirs:
+        for root, dirs, files in os.walk(scan_dir):
+            for file in files:
+                test_files.append(os.path.join(root, file))
+    return test_files
+
+
+def fetch_test_files(args):
+    test_files = args.test_files
+    test_files.extend(fetch_tests_from_dirs(args.test_dirs))
+    # Remove duplicates
+    test_files = list(dict.fromkeys(test_files))
+    return test_files
+
+
+def main():
+    args = cli()
+    setup_logging(args)
+    test_files = fetch_test_files(args)
+    return TestRunner(test_files).start()
+
+
+if __name__ == "__main__":
+    sys.exit(main())
diff --git a/tools/testing/selftests/kvm/runner/command.py b/tools/testing/selftests/kvm/runner/command.py
new file mode 100644
index 000000000000..a63ff53a92b3
--- /dev/null
+++ b/tools/testing/selftests/kvm/runner/command.py
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright 2025 Google LLC
+#
+# Author: vipinsh@google.com (Vipin Sharma)
+
+import subprocess
+
+
+class Command:
+    """Executes a command in shell.
+
+    Returns the exit code, std output and std error of the command.
+    """
+
+    def __init__(self, command):
+        self.command = command
+
+    def run(self):
+        run_args = {
+            "universal_newlines": True,
+            "shell": True,
+            "capture_output": True,
+        }
+
+        proc = subprocess.run(self.command, **run_args)
+        return proc.returncode, proc.stdout, proc.stderr
diff --git a/tools/testing/selftests/kvm/runner/selftest.py b/tools/testing/selftests/kvm/runner/selftest.py
new file mode 100644
index 000000000000..cc56c45b1c93
--- /dev/null
+++ b/tools/testing/selftests/kvm/runner/selftest.py
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright 2025 Google LLC
+#
+# Author: vipinsh@google.com (Vipin Sharma)
+
+import command
+import pathlib
+import enum
+import os
+
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
+        self.command = command.Command(test_command)
+        self.status = SelftestStatus.NO_RUN
+        self.stdout = ""
+        self.stderr = ""
+
+    def run(self):
+        if not self.exists:
+            self.stderr = "File doesn't exists."
+            return
+
+        ret, self.stdout, self.stderr = self.command.run()
+        if ret == 0:
+            self.status = SelftestStatus.PASSED
+        elif ret == 4:
+            self.status = SelftestStatus.SKIPPED
+        else:
+            self.status = SelftestStatus.FAILED
diff --git a/tools/testing/selftests/kvm/runner/test_runner.py b/tools/testing/selftests/kvm/runner/test_runner.py
new file mode 100644
index 000000000000..20ea523629de
--- /dev/null
+++ b/tools/testing/selftests/kvm/runner/test_runner.py
@@ -0,0 +1,41 @@
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
+    def __init__(self, test_files):
+        self.tests = []
+
+        for test_file in test_files:
+            self.tests.append(Selftest(test_file))
+
+    def _log_result(self, test_result):
+        logger.log(test_result.status,
+                   f"[{test_result.status}] {test_result.test_path}")
+        logger.info("************** STDOUT BEGIN **************")
+        logger.info(test_result.stdout)
+        logger.info("************** STDOUT END **************")
+        logger.info("************** STDERR BEGIN **************")
+        logger.info(test_result.stderr)
+        logger.info("************** STDERR END **************")
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
diff --git a/tools/testing/selftests/kvm/tests/dirty_log_perf_test/default.test b/tools/testing/selftests/kvm/tests/dirty_log_perf_test/default.test
new file mode 100644
index 000000000000..98f423e15b46
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/dirty_log_perf_test/default.test
@@ -0,0 +1 @@
+dirty_log_perf_test
diff --git a/tools/testing/selftests/kvm/tests/dirty_log_perf_test/no_dirty_log_protect.test b/tools/testing/selftests/kvm/tests/dirty_log_perf_test/no_dirty_log_protect.test
new file mode 100644
index 000000000000..ed3490b1d1a1
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/dirty_log_perf_test/no_dirty_log_protect.test
@@ -0,0 +1 @@
+dirty_log_perf_test -g
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
