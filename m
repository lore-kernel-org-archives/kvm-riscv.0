Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E659C61CE7
	for <kvm-riscv@archiver.kernel.org>; Sat,  7 Jun 2025 00:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Jj48PBsYIhw2dLCOFYqupZW4ytbc7aFiV56V43GarEs=; b=rODCERu0bop7NOzlyOwo1du5sv
	gv8ook+nae0On1jB+Tq8TZlm5FkYnMVOPZItczOI3lpNAgOSXkAziwB9/FwBdQ0mQMwly8bK5ti7R
	Yy/Tdsi8RY3TZXJ7N3cGpnJNwOee3IMSvM1pq59OhIsS8r0kaZOfzJwDM3qoW9uftB8nM7srySo31
	68utxyin799XpLBHAVB1EJcjSWjPj5SR05rB/PKEX3etX5uEnWMl+x7k3eiBkguLsOof2llHFSBuD
	8i5rwhnoizveHIIDLHO4CWbVFKph0ewgwyha/otGbEQ4CTjDA96YLUx3W891mwxd5/f3rAwOxAPSH
	WCGPROrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNhIQ-00000001B2d-0rBa;
	Sat, 07 Jun 2025 00:20:26 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNgvY-000000019CB-2E9o
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 23:56:49 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2323bd7f873so22564255ad.1
        for <kvm-riscv@lists.infradead.org>; Fri, 06 Jun 2025 16:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749254207; x=1749859007; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2YvWqyMXWbV+Eh1iT8lLaW4K5z1z2+DMYGYssKn0fVI=;
        b=Q9Ayik2EcMjAqKfumovSxvRrvhbZOPsm1i06a4sjZPMqRzBmp+/g97RZf/O5OPOYGm
         Y7aNoUEZonh004QBSk13yzkuoXzBvnwn99zf/C5gqewe/uoNE6j6tTJ2l+A4gCgLfkAH
         bi1MJ9rzk0ZPkR/jmMLbyMejriyeTpYK9PJRhtg0OXhZofWRdq63Jx8oLtcdCcnuTJbZ
         dMQqAnZPBzJN3qGEv3PniYTIvzZ8xyBoUkKHfAzPEGOXX03AyPeuzTVPD58ZR+bCERmi
         tZG+g2Cj3G8qmoquC7GnI2kH199u5rCNWxh/uiFwxV5FE1NVBDbSF9pZ3BdC1HU9xu9C
         uKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749254207; x=1749859007;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2YvWqyMXWbV+Eh1iT8lLaW4K5z1z2+DMYGYssKn0fVI=;
        b=gJeliVMjOWB4bVU4CuFEeYtJ5bbngED6+SvBUWH0J5aIu2D1tq1jK4ZsaCzaSzUiZV
         xL9AcuhZqd8MqIk3cChC10UGH0/dpenFcjZc/An+ZjVZOPEB/EDj8XdTFddJYHPhBGUG
         ruTUyGkePCRrf30RNyiu6iO6YsfA4j3+rwCEk+VKXitcko3mlwCmIDcXlzQtMrf0FBRa
         NMn/OPd62EZE2jF/p/GZP8dFJp8ZiSgi5FCWvzIVcPegErbONJ4dqpL6k7x+//b2vJG1
         5OHpD1uTJxYPPKSZA/keqc/FiI+7qFIqqxMMxAUYsDbIHQbVZmesZrqx2fQzr/+dKMl4
         rggg==
X-Forwarded-Encrypted: i=1; AJvYcCXWxXlOaTJkPOP4PfJBYPFF/R/E6puLcIt2MlH334fFq8FPv6EwUr77qO6LAN0YBBvJzhxtZXn1fKE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxfYJ3SnwJwAwPDUPQRqTUjHctbmK7VVyLGFdi+MYeW6rF+/6Y+
	greqvB2/9SfPzF61CLgxfryti0LO0neTvqD7tmut1jWD1DDVspaLUwlkcCnk+jLIRA9Mfrv+zr5
	BXM68TB8Eiw==
X-Google-Smtp-Source: AGHT+IECcAGloB9eLcQGrexwmZ6dfzE2vnPa3s6mRZgo8fAz19L92je+kXfcgU8ZDEV3rQMzp1fI/Bkas3Ar
X-Received: from pjbcz12.prod.google.com ([2002:a17:90a:d44c:b0:30a:31eb:ec8e])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f686:b0:224:1af1:87f4
 with SMTP id d9443c01a7336-23601cfec20mr73817855ad.22.1749254207363; Fri, 06
 Jun 2025 16:56:47 -0700 (PDT)
Date: Fri,  6 Jun 2025 16:56:14 -0700
In-Reply-To: <20250606235619.1841595-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250606235619.1841595-11-vipinsh@google.com>
Subject: [PATCH v2 10/15] KVM: selftests: Add flag to suppress all output from
 Selftest KVM Runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, anup@brainfault.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	maz@kernel.org, oliver.upton@linux.dev, dmatlack@google.com, 
	Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_165648_623377_47BE3D85 
X-CRM114-Status: GOOD (  10.80  )
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

Add a command line flag, --quiet, to suppress all of the output from
runner to terminal.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../testing/selftests/kvm/runner/__main__.py  |  8 ++++++-
 .../selftests/kvm/runner/test_runner.py       | 21 ++++++++++++-------
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
index 2dcac1f4d1c4..c02035a62873 100644
--- a/tools/testing/selftests/kvm/runner/__main__.py
+++ b/tools/testing/selftests/kvm/runner/__main__.py
@@ -129,6 +129,12 @@ def cli():
                         default=False,
                         help="Print only the summary status line.")
 
+    parser.add_argument("-q",
+                        "--quiet",
+                        action="store_true",
+                        default=False,
+                        help="Suppress all of the output to terminal")
+
     return parser.parse_args()
 
 
@@ -136,7 +142,7 @@ def level_filters(args):
     # Levels added here will be printed by logger.
     levels = set()
 
-    if args.sticky_summary_only:
+    if args.sticky_summary_only or args.quiet:
         return levels
 
     if args.print_passed or args.print_passed_status or args.print_status:
diff --git a/tools/testing/selftests/kvm/runner/test_runner.py b/tools/testing/selftests/kvm/runner/test_runner.py
index e0da30d216a2..e7730880907d 100644
--- a/tools/testing/selftests/kvm/runner/test_runner.py
+++ b/tools/testing/selftests/kvm/runner/test_runner.py
@@ -18,6 +18,7 @@ class TestRunner:
         self.status = {x: 0 for x in SelftestStatus}
         self.output_dir = args.output
         self.jobs = args.jobs
+        self.quiet = args.quiet
         self.print_status = args.print_status
         self.print_stds = {
             SelftestStatus.PASSED: args.print_passed,
@@ -35,17 +36,21 @@ class TestRunner:
         test.run()
         return test
 
+    def _print(self, text, end="\n"):
+        if not self.quiet:
+            print(text, end=end)
+
     def _sticky_update(self):
-        print(f"\r\033[1mTotal: {self.tests_ran}/{len(self.tests)}" \
-                f"\033[32;1m Passed: {self.status[SelftestStatus.PASSED]}" \
-                f"\033[31;1m Failed: {self.status[SelftestStatus.FAILED]}" \
-                f"\033[33;1m Skipped: {self.status[SelftestStatus.SKIPPED]}"\
-                f"\033[91;1m Timed Out: {self.status[SelftestStatus.TIMED_OUT]}"\
-                f"\033[34;1m No Run: {self.status[SelftestStatus.NO_RUN]}\033[0m", end="\r")
+        self._print(f"\r\033[1mTotal: {self.tests_ran}/{len(self.tests)}"
+                    f"\033[32;1m Passed: {self.status[SelftestStatus.PASSED]}"
+                    f"\033[31;1m Failed: {self.status[SelftestStatus.FAILED]}"
+                    f"\033[33;1m Skipped: {self.status[SelftestStatus.SKIPPED]}"
+                    f"\033[91;1m Timed Out: {self.status[SelftestStatus.TIMED_OUT]}"
+                    f"\033[34;1m No Run: {self.status[SelftestStatus.NO_RUN]}\033[0m", end="\r")
 
     def _log_result(self, test_result):
         # Clear the status line
-        print("\033[2K", end="\r")
+        self._print("\033[2K", end="\r")
         logger.log(test_result.status,
                    f"[{test_result.status}] {test_result.test_path}")
         if (self.output_dir is None and self.print_status is False
@@ -79,5 +84,5 @@ class TestRunner:
                                                SelftestStatus.NO_RUN,
                                                SelftestStatus.SKIPPED]):
                     ret = 1
-        print("\n")
+        self._print("")
         return ret
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
