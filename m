Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2CECCA470
	for <kvm-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 16:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SNXDwdeyrnEVaEjxzmQHx+AqAmM63AmG7SchQuYHquE=; b=35tB2aA7X3qDCMBmmXjX4HtSL9
	sxxmgElcrYB+kMyLvOHT9ilzQxH3D8Y4JrSSTiaIqUm+NSszeQthb7DvmiV4Xuj/4EjdMM9Nvk6Zt
	Wfjry0q0fHpb+5D6hbzQ6IcIYjtpbJ0tg2njTlyCskOjdfsZlOdjwwn/HWH+U1Qno+tq8gNTwmn1D
	TwV/LZJWg/COkUlmimGuJSe0fe90QvQ2LmG3t8Qgfh8+NBR7592rtFsAhpjjaTOnPL8dN/1VOotLh
	2S2OG7C9XRi0HXZkTne3IoDVId9Xs0tl0mBBgFuhNxovpxeapYDgbf46E3itcJUXvlVxS4luqYg1u
	PjxNrYrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3dLc-00000005mrD-2Eew;
	Tue, 30 Sep 2025 16:37:04 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3dLZ-00000005mms-3hB1
	for kvm-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 16:37:03 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b59682541d5so6136115a12.0
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Sep 2025 09:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759250220; x=1759855020; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OUg12Od11PLsJD4awVDsfJr7RcaROxBR6pzVFyNdKj8=;
        b=BvZLA2UnBxgxrQT7pUj6Y5ERZP9AskVY5l6ktHQQ3sE4z2iHhP9XW3/DgA2wWMJ0Z4
         J3UuZ06Pt7KoueeewKVhJp0hRW8EGAZwg1fUgu6a8E9L4HWgLqIg19Ifr4SX9BSSDXbT
         xts16Jmcy5g956BhTyRpP7is6zraP351hPupwxfrluTkYZ8BrhvX/GJMSwAeb8alwb7J
         AmxmGfg/zTtjzw2fU7ptHnyLIdcX+JSveNZrkXPJzCuMQ8Wge3bFbnm8LPhVAWn69eVz
         GvC5UXKvOW6jlInyLjlb17lk2vrjdqF04AGaRAJEytQr2L5UjyHWix3AtbgR4upWOAsR
         hsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759250220; x=1759855020;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OUg12Od11PLsJD4awVDsfJr7RcaROxBR6pzVFyNdKj8=;
        b=LdRYXzxqPafAsxMDuKhvYP8pWQJvCi2RQA1dGuVeLrGbDNJYxLt5ExnrXbNyoiu4Qu
         +Z0mcxgGUNVBJocf+gtPzfzdZ3nu6hXNGLWa4paKgzV8pBmBhasPD7q5eMkWMJrO7SMq
         sDu7mOSbu0sy70sDfcouUyvhZPiBzvxVldZGBNBgDfdjSFdm0U+HRo2CG47dQqVUFk+J
         Ey5lUzpASE4KCxNavdkrrQ9TAtIPkhX4Yzr+7l2gGOur9K8POkvkHY0ijo1YUNgyu/lA
         H7vSOneJ/QNwm095mq38fss4sTBxmmHobfAjYAwDTybvlgvNalyhQRkcXZrwNWn5daEA
         xmVg==
X-Forwarded-Encrypted: i=1; AJvYcCUe2Y1WGhe6FA/7f+8JBtnS7mfQJ2DmtMJrDU7ovESM5qQV9mk9qOaA+B4hDyoJ+fPC8KH/A6CnsLo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz98Ys02C1bRzQGVqNihQuBhX++hTY3nKahDc3bvcupnWp5R83x
	p+AHnVwv8TmUM1491u0uVAXm32zefIaz4Qs6DLbp3GBQz+nCrHtLSzCu1Nl9BoWSbDcx4Bk5Abt
	mxVhMDJ2yow==
X-Google-Smtp-Source: AGHT+IFs+CMWNOODVu6P+nzztd0EOiTd83LgNk/a5bScJBUGMhwZj+o12u3ClbHwdU+ZCLfO3OKClHjbbXZN
X-Received: from pjbcm23.prod.google.com ([2002:a17:90a:fa17:b0:32e:ddac:6ea5])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b08:b0:329:e9da:35e9
 with SMTP id 98e67ed59e1d1-339a6e8ff19mr118159a91.2.1759250220455; Tue, 30
 Sep 2025 09:37:00 -0700 (PDT)
Date: Tue, 30 Sep 2025 09:36:33 -0700
In-Reply-To: <20250930163635.4035866-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250930163635.4035866-1-vipinsh@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20250930163635.4035866-8-vipinsh@google.com>
Subject: [PATCH v3 7/9] KVM: selftests: Print sticky KVM selftests runner
 status at bottom
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com, Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_093702_007561_C1C689A2 
X-CRM114-Status: UNSURE (   9.74  )
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
 .../testing/selftests/kvm/runner/test_runner.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tools/testing/selftests/kvm/runner/test_runner.py b/tools/testing/selftests/kvm/runner/test_runner.py
index e8e8fd91c1ad..42274e695b76 100644
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
@@ -33,9 +34,18 @@ class TestRunner:
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
         print_level = self.print_stds.get(test_result.status, "full")
 
+        print("\033[2K", end="\r")
         if (print_level == "full" or print_level == "stdout"):
             logger.info("*** stdout ***\n" + test_result.stdout)
         if (print_level == "full" or print_level == "stderr"):
@@ -43,8 +53,13 @@ class TestRunner:
         if (print_level != "off"):
             logger.log(test_result.status, f"[{test_result.status.name}] {test_result.test_path}")
 
+        self.status[test_result.status] += 1
+        # Sticky bottom line
+        self._sticky_update()
+
     def start(self):
         ret = 0
+        self.tests_ran = 0
 
         with concurrent.futures.ProcessPoolExecutor(max_workers=self.jobs) as executor:
             all_futures = []
@@ -54,9 +69,11 @@ class TestRunner:
 
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
2.51.0.618.g983fd99d29-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
