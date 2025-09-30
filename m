Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BE9CAC5B8
	for <kvm-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 16:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XnK9GKES07dNpznys6ihugdLxxckeLAD08easkm0/Hc=; b=TpAMYcIrV224n0tLEBHpckWOvm
	o/+Gxa6CI2ubzntm77Dp8wC+in9mF2tarWk8OITLypIY6XG9Qlx2KQHWDItm0PnA6HfJngY3XXbBB
	2hNDiOICj5JNuiytjsablbleyojR9Ar+KYBRqRzbqZr5RpFZutWV9Lp2SC2YUJWuPJyPIHhEuYeZp
	cjLy+P/4TSSJmp5FolYl/HZIqPqLZlUMznVUht5wbq3jzyIE3mElyYds8kITSxs9QV8Z+P487TBK6
	d/B/uU9tQT3oVrEGcaNjQSbPMWwLTFt99M9BlLRg7OXHL8ekrXULw5B6STcTWOy69FJWlBDrG8lqi
	KUNRBgvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3dLT-00000005mjo-3lOF;
	Tue, 30 Sep 2025 16:36:55 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3dLR-00000005miN-1AzZ
	for kvm-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 16:36:54 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-32eb18b5659so5648433a91.2
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Sep 2025 09:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759250212; x=1759855012; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=y+zFjp+5NM5jNpiAGubNmlLxuVM2bHjpWFC3hzUQlno=;
        b=3efO0afxypX8uIost3M8onooIkp49RivRCyfjXkjU4rnu3ShHL39TKmZi7WTfvZeJe
         nxoB56TJBFS0fj7Xm19952FFBVAApxWnUWtIssAcCaypfux8MukJXJdwAsEt2qtVAof3
         U15tHdmGkmGPzjUYbLso+ljJEEg0MWttdA5iyKaQY+skujoMhPa7BnS9JFb6zYmAorw9
         fO6/HMK0kYx7j+wotU97UldsxHFw8j9fsk85g7Dx3Fh0EYjNX+2LDZ9ateDoOkCLj7yd
         XUOwtw+vI9cGxT1AvWYFGVhAN0DgDLDfcuvHZ50Cyz4q/LI4rlq8q7lCv43FfzadtYyA
         GKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759250212; x=1759855012;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+zFjp+5NM5jNpiAGubNmlLxuVM2bHjpWFC3hzUQlno=;
        b=sGQ3D1yQoNOxQYYojKRN8JBh80S4zA5T5o8gYEFKXE6Hzv0t8JWI8ffJ6FZvFGuEj/
         3wJXSuAwPVVshBON6YEskWaXle3eOveHCK4IZekL2cfQdXkFmnnTiMjpPLAr9YvFigCk
         EYm8YnI0grX0Uu1sbAUEoOckUzN+icpV373XRemnvffCMPXHyQsQZP59CW5/qmP6U1LG
         oTiLCcgAI1si0e0UROq77qerdicTxl16JfBL9Q3TWT/0gBkEfCraKHNizrTFriBINP7X
         fQqwkEjnxzC+clERMwuoAG7GZizj9C/FP7ewRV517nCyK9ud+V3CjjsULKkPS0EeOq20
         KHpw==
X-Forwarded-Encrypted: i=1; AJvYcCUx4wXZwrcPqek+DOf5qFMxLVtvyAD8U//0smQyzAasNwv3kc8Wl/UfitkZYeqPO7CDUYJ6+YlllsI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzcyO/78JP4NWWDNKNDI6yXCD7zJptZwboajSgXXVEZEAhMBKTJ
	P7lWm6Lk3UaoWsI9ToZT4PsiWjS3xyeNjnErJ42ifRjPzS4wPYtwTEJaKWWjYsZWrer/9EvWrVm
	EJwqrg1ldow==
X-Google-Smtp-Source: AGHT+IFs2HoXuNbjJ6THNWiEgkTSiX/5Eo4qEtefSIhRbGYg0YLR1fsOEVA+aC+FeUieWz082F7fpocBNbqJ
X-Received: from pjup24.prod.google.com ([2002:a17:90a:d318:b0:329:e84e:1c50])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1a8f:b0:32e:7270:94a0
 with SMTP id 98e67ed59e1d1-339a6f84e2amr100040a91.33.1759250212045; Tue, 30
 Sep 2025 09:36:52 -0700 (PDT)
Date: Tue, 30 Sep 2025 09:36:28 -0700
In-Reply-To: <20250930163635.4035866-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250930163635.4035866-1-vipinsh@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20250930163635.4035866-3-vipinsh@google.com>
Subject: [PATCH v3 2/9] KVM: selftests: Provide executables path option to the
 KVM selftest runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com, Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_093653_321266_9A801C20 
X-CRM114-Status: GOOD (  11.96  )
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
index 8d1a78450e41..943c3bfe2eb6 100644
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
index 34005f83f0c3..a94b6d4cda05 100644
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
2.51.0.618.g983fd99d29-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
