Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3651C61CE7
	for <kvm-riscv@archiver.kernel.org>; Sat,  7 Jun 2025 00:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tHc4nMtNLD+Q6imDlbCljBIKy5TKM4wOXCZQfrPOhnk=; b=04lRelsu0FR5RTQeFLAkeSoBgj
	a4xYr4gS7qNs3kSTHiDeym+hmM8u1StH+h70Lz5sE3dTqCHC7KPelVMR2zqZJBkRQhGeWeAx9C3om
	S9J2NJmxupn/NteDeAZhgp6Do+kZzml2yJVzRgDOuXeVtJiQTNjBQBZXz+bI5HK6rGHOvMTM6Sncv
	7E0em26xeZwkeF8d+Kzqs93sctsP/3bIcXuSVoFAd5ZmGWOA1wwB82TjKSYIZEKy4vSqSs5YE2h2s
	GaqSTm7gHilY6EvPHxykDHsnZmajYN1BLNGDhOG4knF3ReyQqVL+PD5oMzhBmEKDnIXImC8YRZ50z
	Na8PCy6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNh1d-000000019pZ-2brA;
	Sat, 07 Jun 2025 00:03:05 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNgvM-00000001956-16TS
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 23:56:37 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-742951722b3so2169921b3a.2
        for <kvm-riscv@lists.infradead.org>; Fri, 06 Jun 2025 16:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749254195; x=1749858995; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=J5qPyWDdZjBYrNiWpTSfn3gp6ZZ42Mm3+G5MVBiOPg4=;
        b=3CYBaXPpOQOIGJhasPC0NK9VvgIwEsHaoVla5FUHljY6YbxHsy0OsQ1jJx8GSga08g
         mR2y33xPjXC4VhmFk7faj3ORXrPmZNc494/xyl3g7ME34vl4Y5YUt/TqwgVrjemOkFs1
         v7jfboyg4HHopEhBRel8+HJczpSa8Zv+VoTcs+oBgUEay91lwk4LxU+53+1pNRlb4h2D
         8QVUVmTUwthUs2P2FvfMG0gTF5HS/cvjyANCLF4T0rVDvdFf0ug8FlawNhjgfyRDF1mR
         CoV4huhuZALJrjnQUb24JApuSgXCC0IHTwltI0Bnk1IsPP06hAhcNlZ45DB80tfjsJqa
         dTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749254195; x=1749858995;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J5qPyWDdZjBYrNiWpTSfn3gp6ZZ42Mm3+G5MVBiOPg4=;
        b=tjGLMhVurnW5TpDPPMsWQQd2P0OQI3Op/hmJ0+5akWC07GkNxMxKx0eSeqoU05NeKd
         tyYeg/CluiUF6hoQ0N5bsU/ThsrnHr6xSll9NUZYCsPNg00/kcWQSzkYsox5aZCHMRvz
         JjBnAQuaHgUsNgJIUZHtp8jxaPgp5nW0U2LQTZdvD8QU0GjnqUmF1e1PSrLMi6ZD7SBa
         XXQ5pUu+P3DplIparu5K9tFo97IQSfk6vNrIwwebd2iplLEOT2wPUzR7nLSW/ZjZoZda
         /XmbBu3SmWGWIV35zM/MZ7GtY8SJ9TFNVcvR5SdBiojtKdN41m2oGE898NhVHRSSnZaz
         nPZw==
X-Forwarded-Encrypted: i=1; AJvYcCUqppjcS+w4/ZKhCGIPrmOdDP1l72OAoK649jWs/Z6Zlig4A/AIBxRNGr6UCFpa8aqCYv+pFmg7vmw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzjS49N459g6TgZyhtbJfkoFOGQcNTAEltjqXL0lUtF/b4SOjMQ
	hYRHOqoiFruVnhHDI+hZiTlh5JNcr3u/+dj/jocsdmUmpd/moh3a+5Bh2H1jb/HDb5jQj1VJoFJ
	8Od6ixPPKjw==
X-Google-Smtp-Source: AGHT+IGPFN25sf5fBQuUahDsniRulhDsp5/A6v15vwSgp1kUKeD/wcPxz2MlbUSH1xlqTKiLIES98JHHfcZB
X-Received: from pfbhm22.prod.google.com ([2002:a05:6a00:6716:b0:746:2bf3:e5e8])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:13a4:b0:736:5725:59b4
 with SMTP id d2e1a72fcca58-74827e51491mr7448173b3a.3.1749254194854; Fri, 06
 Jun 2025 16:56:34 -0700 (PDT)
Date: Fri,  6 Jun 2025 16:56:06 -0700
In-Reply-To: <20250606235619.1841595-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250606235619.1841595-3-vipinsh@google.com>
Subject: [PATCH v2 02/15] KVM: selftests: Enable selftests runner to find
 executables in different path
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, anup@brainfault.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	maz@kernel.org, oliver.upton@linux.dev, dmatlack@google.com, 
	Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_165636_295682_54A5BC57 
X-CRM114-Status: GOOD (  10.95  )
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

Add command line option, --executable/-e, to specify a directory where
test binaries are present. If this option is not provided then default
to the current directory.

Example:
  python3 runner --test-dirs test -e ~/build/selftests

This option enables executing tests from out-of-tree builds.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 tools/testing/selftests/kvm/runner/__main__.py    | 8 +++++++-
 tools/testing/selftests/kvm/runner/selftest.py    | 4 ++--
 tools/testing/selftests/kvm/runner/test_runner.py | 4 ++--
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
index b2c85606c516..599300831504 100644
--- a/tools/testing/selftests/kvm/runner/__main__.py
+++ b/tools/testing/selftests/kvm/runner/__main__.py
@@ -29,6 +29,12 @@ def cli():
                         default=[],
                         help="Run tests in the given directory and all of its sub directories. Provide the space separated paths to add multiple directories.")
 
+    parser.add_argument("-e",
+                        "--executable",
+                        nargs='?',
+                        default=".",
+                        help="Finds the test executables in the given directory. Default is the current directory.")
+
     return parser.parse_args()
 
 
@@ -85,7 +91,7 @@ def main():
     args = cli()
     setup_logging(args)
     test_files = fetch_test_files(args)
-    return TestRunner(test_files).start()
+    return TestRunner(test_files, args).start()
 
 
 if __name__ == "__main__":
diff --git a/tools/testing/selftests/kvm/runner/selftest.py b/tools/testing/selftests/kvm/runner/selftest.py
index cc56c45b1c93..a0b06f150087 100644
--- a/tools/testing/selftests/kvm/runner/selftest.py
+++ b/tools/testing/selftests/kvm/runner/selftest.py
@@ -30,12 +30,12 @@ class Selftest:
     Extract the test execution command from test file and executes it.
     """
 
-    def __init__(self, test_path):
+    def __init__(self, test_path, executable_dir):
         test_command = pathlib.Path(test_path).read_text().strip()
         if not test_command:
             raise ValueError("Empty test command in " + test_path)
 
-        test_command = os.path.join(".", test_command)
+        test_command = os.path.join(executable_dir, test_command)
         self.exists = os.path.isfile(test_command.split(maxsplit=1)[0])
         self.test_path = test_path
         self.command = command.Command(test_command)
diff --git a/tools/testing/selftests/kvm/runner/test_runner.py b/tools/testing/selftests/kvm/runner/test_runner.py
index 20ea523629de..104f0b4c2e4e 100644
--- a/tools/testing/selftests/kvm/runner/test_runner.py
+++ b/tools/testing/selftests/kvm/runner/test_runner.py
@@ -11,11 +11,11 @@ logger = logging.getLogger("runner")
 
 
 class TestRunner:
-    def __init__(self, test_files):
+    def __init__(self, test_files, args):
         self.tests = []
 
         for test_file in test_files:
-            self.tests.append(Selftest(test_file))
+            self.tests.append(Selftest(test_file, args.executable))
 
     def _log_result(self, test_result):
         logger.log(test_result.status,
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
