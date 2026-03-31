Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB8810F92F8
	for <kvm-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 19:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=J9BqIiVY+NeaOjcWMKzG5oTixTxMLbzZXDC8nsGO2xQ=; b=JuCsAW3dMwJ1AD1tKEeLyH2zUI
	ovdCPcznNCncxBGYX2drUgl3zH4wYomxVyoQijcS9hs3ULZd+7VLYtmbXYZTjLpVWu5j0IWxMRZKL
	MUQwLNe16s5prG4JqdFSDe7w68IEzYV4amv4Wow9ZEMfRDKFpfg/q6ejXNkWtTHVqB7SL4Dp/w5j2
	d5DjswYCNDa8ej5ZIR5NUs0tHZikZFUi8EzXXyHnsZl6P+WXLlRXsTIWCsNfDaode1efbA1kvmKox
	SNZPw/fuwXduk7p70/Qb2SHJ6xNZrO0QzChqTVmouzsOBbydkHSF5BwiaxFRRj/3PfrZKcdIQgohm
	kxONzc/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7eyr-0000000DUU7-2oYk;
	Tue, 31 Mar 2026 19:42:29 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7eyo-0000000DURQ-3gSG
	for kvm-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 19:42:28 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-82a88a2704fso106991b3a.0
        for <kvm-riscv@lists.infradead.org>; Tue, 31 Mar 2026 12:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774986145; x=1775590945; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EDxS3RLGSrG2H/pkS7vidJMr8Di538wm6I+VqwzPhms=;
        b=uZm3GbkG3QrOu4yQAS1lwze0IiGdsEUPytuJ0iMwscyAgNyTr5GzADZKS1bNSM4npH
         4FtRIe9EUCuH5+y3BqjfOUfi+cb1Zvlo28nbMa7tomAVQkAiOWzD1vQm3QEnIMPyOK+g
         Vex4MQ7ImEv8XC1zfvUoOn7FzPvsfKdfx8dej8hnZovVTswvXLZS+G3e3AENrI7Utl7d
         gajwrvU4ZCQLr4iAE72vcOui7zhD98PinZ75xgQGlWMpE/h2H5yEHftge5JT7hypmrRe
         OC5bBXd090gCVp0U4EHTB//62NbsxNNAZkE1SjftQxfuBK7n0egL46/MFHmbcylNT5XZ
         HHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986145; x=1775590945;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EDxS3RLGSrG2H/pkS7vidJMr8Di538wm6I+VqwzPhms=;
        b=r/hZULERu6UZSGyRqNlfbmB98azwRzUp9ayrVv8g1pDHp7gPjra1l+g84D++J7kH+K
         ojOGFUwlClfHKePU3onlmtPOGrPmaXm86XuEOlsb/Z712iRZSbVYJ9dZ5Nyinm0hm7tT
         29rpmuyZmBUN99BHFGvOn05rced2jdDCBssFHGiGz1ZcUIsHVOyWpH3lMsCz4NPcD5md
         +hLcoIqOWn/t0u3E8ISEuxPsYLpY35Ma29L3Chbc9JLbkSBF7+T3TbDUO6nUmk7+RT3X
         kNlN4Wxsglmb3e5SftR5Oc3Ith30lfN5/M+oOf9LBGU8S4BgeYCsOHCPyjSUx5db77fa
         EGbg==
X-Forwarded-Encrypted: i=1; AJvYcCVhDk3zyMMixOt61BcjXDqyRkWOpkfNGs6S/lND/naJEKXC26t1qOVU7fUjS/3cTuLrLdvWroUPN4o=@lists.infradead.org
X-Gm-Message-State: AOJu0YznqrlHRkLyiPo1szo9k6N68frSucQybEOOF3zMNetdSGtFEQ7N
	ya4KWbwmcXsOgkoHNG172eHRqfzdhbhCDO0RglnTDR/NBlgGmVkKpg4C4hsa7/ZNwNF+6lKV458
	Y+oqu37ckSg==
X-Received: from pfud21.prod.google.com ([2002:a05:6a00:10d5:b0:82a:1d94:6f65])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1ca8:b0:82a:15a1:14d
 with SMTP id d2e1a72fcca58-82ceaa5635emr441207b3a.14.1774986145378; Tue, 31
 Mar 2026 12:42:25 -0700 (PDT)
Date: Tue, 31 Mar 2026 12:42:00 -0700
In-Reply-To: <20260331194202.1722082-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20260331194202.1722082-1-vipinsh@google.com>
X-Mailer: git-send-email 2.53.0.1118.gaef5881109-goog
Message-ID: <20260331194202.1722082-8-vipinsh@google.com>
Subject: [PATCH v4 7/9] KVM: selftests: Print sticky KVM selftests runner
 status at bottom
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com, Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_124227_032599_BD712DA5 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

Print current state of the KVM selftest runner during its execution.
Show it as the bottom most line, make it sticky and colored. Provide
the following information:
- Total number of tests selected for run.
- How many have executed.
- Total for each end state.

Example:

Total: 3/3 Passed: 1 Failed: 1 Skipped: 0 Timed Out: 0 No Run: 1

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../selftests/kvm/runner/test_runner.py       | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/testing/selftests/kvm/runner/test_runner.py b/tools/testing/selftests/kvm/runner/test_runner.py
index e8e8fd91c1ad..66a3c3711a8a 100644
--- a/tools/testing/selftests/kvm/runner/test_runner.py
+++ b/tools/testing/selftests/kvm/runner/test_runner.py
@@ -15,6 +15,7 @@ logger = logging.getLogger("runner")
 class TestRunner:
     def __init__(self, testcases, args):
         self.tests = []
+        self.status = {x: 0 for x in SelftestStatus}
         self.output_dir = args.output
         self.jobs = args.jobs
         self.print_stds = {
@@ -33,9 +34,19 @@ class TestRunner:
         test.run()
         return test
 
+    def _sticky_update(self):
+        print(f"\r\033[1mTotal: {self.tests_ran}/{len(self.tests)}" \
+                f"\033[32;1m Passed: {self.status[SelftestStatus.PASSED]}" \
+                f"\033[31;1m Failed: {self.status[SelftestStatus.FAILED]}" \
+                f"\033[33;1m Skipped: {self.status[SelftestStatus.SKIPPED]}"\
+                f"\033[91;1m Timed Out: {self.status[SelftestStatus.TIMED_OUT]}"\
+                f"\033[34;1m No Run: {self.status[SelftestStatus.NO_RUN]}\033[0m",
+                end="\r", flush=True)
+
     def _log_result(self, test_result):
         print_level = self.print_stds.get(test_result.status, "full")
 
+        print("\033[2K", end="\r", flush=True)
         if (print_level == "full" or print_level == "stdout"):
             logger.info("*** stdout ***\n" + test_result.stdout)
         if (print_level == "full" or print_level == "stderr"):
@@ -43,8 +54,16 @@ class TestRunner:
         if (print_level != "off"):
             logger.log(test_result.status, f"[{test_result.status.name}] {test_result.test_path}")
 
+        self.status[test_result.status] += 1
+        # Sticky bottom line
+        self._sticky_update()
+
     def start(self):
         ret = 0
+        self.tests_ran = 0
+
+        # Show initial progress
+        self._sticky_update()
 
         with concurrent.futures.ProcessPoolExecutor(max_workers=self.jobs) as executor:
             all_futures = []
@@ -54,9 +73,11 @@ class TestRunner:
 
             for future in concurrent.futures.as_completed(all_futures):
                 test_result = future.result()
+                self.tests_ran += 1
                 self._log_result(test_result)
                 if (test_result.status not in [SelftestStatus.PASSED,
                                                SelftestStatus.NO_RUN,
                                                SelftestStatus.SKIPPED]):
                     ret = 1
+        print("\n")
         return ret
-- 
2.53.0.1118.gaef5881109-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
