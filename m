Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF1CC61CE7
	for <kvm-riscv@archiver.kernel.org>; Sat,  7 Jun 2025 00:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yd20KxtjRG1Jcijl+syBO0PksubZTkR6nkEqG4yki9U=; b=metFhmivWLBiyt9ICulSO7dz0Y
	AqspbQgovl1KLCZuFGmeCMn4yOI+eL1KfyxrhVwn3679CFpA0R/7ta91TPqsVcUSuSixg7xQF1cPr
	yPySBKVzi2U2CnKXvSme/3HRuwXueEH6iPappRN/s1Vadxy8XuHgy1X/5baPS9vsJcTXsloZx7nVe
	UVs6R4o/SvBoMbI/Vcmz/pKgtDTBBfceS8utNocNHbiR6cySP8sV39HKjAfIUbfstexpIjHqkiQay
	R7Jt2ONpHU40gAgCjf6NKRuJgN0Cgv2VnzbvyICG3eBM4gITeYMopSBgn5B5ayYqKNUF3/07iB/mi
	l7z4Rquw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNhEF-00000001ApK-0iVz;
	Sat, 07 Jun 2025 00:16:07 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNgvV-000000019AA-0box
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 23:56:46 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-23592f5fcb0so40891255ad.3
        for <kvm-riscv@lists.infradead.org>; Fri, 06 Jun 2025 16:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749254204; x=1749859004; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Eryy+YJT09TinpK7TLn0VFQh3NTz7wAuAJ/KxptN2XM=;
        b=IimnKq0eIY7UDfoGn/OtU5jxDzfZugFGVLfLuttqofWsf7Un6SA04Rd7d7TfZHf3uH
         d5DErreFG+WCyVEls50KjrJG4glf5TPRdL1I5vD1keVFacT414KIGVHwh6GdjiOyGpjX
         /Buon2LzAg1GI4288hsZqxVw5WkqcF1QKW4rUDqmJAfYLV2ybpHWlKwLkwJ9r4f8YNq8
         3m0PjDEjvrlh7NcDRN2ugVC3+MUpKcVF3sF8IA3E/ef33VyrofkSd7dIqASpzjIFRsJt
         Pm18WqYIyWPD1GF3dO1apLEW4uChCeN8v00QO33z6PEAEQfviHFsFxmU/GMQJidpKIUx
         WCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749254204; x=1749859004;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eryy+YJT09TinpK7TLn0VFQh3NTz7wAuAJ/KxptN2XM=;
        b=njx4eDJJ0jedJzpafy5FCGuYYBcqRpzM72ag/5o+L+AwK7sAWf4a1pPvyRkhyZzrlx
         hHmq8ubu5yDHWHf5JOaFpKJAEkTzgi7JFeCa39nc5UsEXMxYU9iu+vGPfsOsGVAUOVXd
         DLzFjZPKRZv8mnG6tcLDaVvpplk/sF9IsklHqJfoU+JXDcqlts/9PzBX7Z/FTenmE/Db
         CX6XfnUwGAcVWXoyAhSbUYE9N567noXCGApFWkSdUBIdovuTNtQsAdSar7Jb8JjMLgnN
         a0kklzZ79dzicoq9rUdnns1Cqis8topSsHp4l+XZVyOp9L8aWyMRRjmvSH5fVoEQiFZu
         PwIA==
X-Forwarded-Encrypted: i=1; AJvYcCW17xHnA4NKu2Ai+SruepbtPduvpTvo5LbhMF1ugzummHI9pI9p0xC5eTu9o23EML7kdv2lS13STjQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxkvO/9qNO1G21dyQ2UqibgvGHYfctiSXGu1oooUx/nn7+a5uxx
	LjsQS0NHQQn5nKl5fJyfDDkRs6w+EmcP5o8fBhYwXAaVfQd0yjPPzFVyYfIHm2P8gGJO644gtKj
	WEvGbofob8w==
X-Google-Smtp-Source: AGHT+IHoWyMkTDRUV9FORNhwP9EK3SZsd3ZxOrapFYSdtobGvViIWq2t5Q6eVMf+UJBQjw9Zhem7ol5n6al1
X-Received: from pgww16.prod.google.com ([2002:a05:6a02:2c90:b0:b2c:3dd5:8139])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fc86:b0:235:e9fe:83c0
 with SMTP id d9443c01a7336-23601d18723mr75766385ad.27.1749254204307; Fri, 06
 Jun 2025 16:56:44 -0700 (PDT)
Date: Fri,  6 Jun 2025 16:56:12 -0700
In-Reply-To: <20250606235619.1841595-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250606235619.1841595-9-vipinsh@google.com>
Subject: [PATCH v2 08/15] KVM: selftests: Print sticky KVM Selftests Runner
 status at bottom
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, anup@brainfault.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	maz@kernel.org, oliver.upton@linux.dev, dmatlack@google.com, 
	Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_165645_219423_EA761D1F 
X-CRM114-Status: UNSURE (   9.25  )
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

Print current state of the KVM Selftest Runner during its execution.
Show it as the bottom most line, make it sticky and colored. Provide
the following information:
- Total number of tests selected for run.
- How many have executed.
- Total for each end state.

Example:

Total: 3/3 Passed: 1 Failed: 1 Skipped: 0 Timed Out: 0 No Run: 1

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../selftests/kvm/runner/test_runner.py        | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/testing/selftests/kvm/runner/test_runner.py b/tools/testing/selftests/kvm/runner/test_runner.py
index 8f2372834104..e0da30d216a2 100644
--- a/tools/testing/selftests/kvm/runner/test_runner.py
+++ b/tools/testing/selftests/kvm/runner/test_runner.py
@@ -15,6 +15,7 @@ logger = logging.getLogger("runner")
 class TestRunner:
     def __init__(self, test_files, args):
         self.tests = []
+        self.status = {x: 0 for x in SelftestStatus}
         self.output_dir = args.output
         self.jobs = args.jobs
         self.print_status = args.print_status
@@ -34,7 +35,17 @@ class TestRunner:
         test.run()
         return test
 
+    def _sticky_update(self):
+        print(f"\r\033[1mTotal: {self.tests_ran}/{len(self.tests)}" \
+                f"\033[32;1m Passed: {self.status[SelftestStatus.PASSED]}" \
+                f"\033[31;1m Failed: {self.status[SelftestStatus.FAILED]}" \
+                f"\033[33;1m Skipped: {self.status[SelftestStatus.SKIPPED]}"\
+                f"\033[91;1m Timed Out: {self.status[SelftestStatus.TIMED_OUT]}"\
+                f"\033[34;1m No Run: {self.status[SelftestStatus.NO_RUN]}\033[0m", end="\r")
+
     def _log_result(self, test_result):
+        # Clear the status line
+        print("\033[2K", end="\r")
         logger.log(test_result.status,
                    f"[{test_result.status}] {test_result.test_path}")
         if (self.output_dir is None and self.print_status is False
@@ -46,8 +57,13 @@ class TestRunner:
             logger.info(test_result.stderr)
             logger.info("************** STDERR END **************")
 
+        self.status[test_result.status] += 1
+        # Sticky bottom line
+        self._sticky_update()
+
     def start(self):
         ret = 0
+        self.tests_ran = 0
 
         with concurrent.futures.ProcessPoolExecutor(max_workers=self.jobs) as executor:
             all_futures = []
@@ -57,9 +73,11 @@ class TestRunner:
 
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
2.50.0.rc0.604.gd4ff7b7c86-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
