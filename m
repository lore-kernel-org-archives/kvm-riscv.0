Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC15CCA470
	for <kvm-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 16:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0d+RV1m4Q3VmquRbHFXNoUtr3YS/2yQTRowx5XrKuV0=; b=wGH/6DLK/tYptEzyVP/LUXQ4q0
	jCoO84C3/RiES2R2iOk00DlFIjWCAQ1bKRZpDgh3dvsnJ0VAiIP8vYSw903h2N0QPO/1/JIhTO86/
	Ahvk2D0G/mBiAPXwx/jv2Q6WTE+SFiIHw/67GOoeyIUgz3EvyHaJmqpO1FcxhF2DPwAXeEJCQS1nH
	7okSIdEl+HFW0tN39fSibf692x4roJv5D2nH1/CMtRABu7CJtnA4RMwLjYPIjEzrATGIUzbgb5kkN
	LlgH0WxXyBF3/5X5Q7wlXO0dRbafy0eW4d/isbhiL3BIZcL6hmFZlEoDaoNRivMz61h8rrbNvEOC/
	OSmbjNiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3dLg-00000005mwG-2QEw;
	Tue, 30 Sep 2025 16:37:08 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3dLd-00000005mrE-1hUo
	for kvm-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 16:37:06 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-32ec2211659so5784893a91.0
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Sep 2025 09:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759250224; x=1759855024; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VhViqDkwcWVSLWWD+zOBqBHO20tquMwNgbfY3Bzt4yk=;
        b=sO+r/67Q1JoxfQyevXixfTdkilXfErCyf1nLHtgs0eC59U3ERKKR3p7cUFeuKiXHjg
         PSJa3M3pt9ypkGDbp5Q/auA1cOAi8YycuHq2Bof9a5OuGAgBLIJS0kS7cR3I6MZXUlUJ
         gF/+F6dfwZks+uht8gfU5s2czkB+SqVQnr6BSKuXtTJ6UQyox29lgqfu4KvZk4hV/uqd
         OH+CdfrD1QoMQvjRP442qkTqRvE4g7rOPetQD59EyqzKen2ZQ7OeUIeM8PanpT3cLwfs
         tYxMFwfRxMADUPNFPZdyz+uyvIKaQNkQMiNoDL2JvV8xz1eRi7hd3YOztg6TO9dtDBEs
         RWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759250224; x=1759855024;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VhViqDkwcWVSLWWD+zOBqBHO20tquMwNgbfY3Bzt4yk=;
        b=IAUZCRgQlMy55q/T+WWQKqt5uxA2vjyiYHSAh+An15BR5rjuun4HuERTHJ7Iq2gXlb
         9UfVAq1dmcMUje9kBYtDWOommFX7YXnKtiTZhYKHvd9Dh3W0MoFug9GKh7Mu2t7ITr2c
         C2G5bcWotin0RNxxjWdcEyFrmBKm/483bEo7zfHUhCmWM+PP0WffX0QTFiUfSL/5F1ub
         BKNFDqDCIaOYL6UwatiioXFvebcm+tD8WxRw+hx/vQDnM+R7njgR1oyaUL6B8CFeNtGR
         zjYP2PJZE7I+XZxGVj/NiyiDGTMIUXWsVEpkd9krxAtSgta1TmwKiJ49x3U1veBaJv/r
         aDUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD8vWgJCNlEMBK6DADQcnyR/zjGP+m2J8XOogLJTzkI7TH3nX+Q+5jziskg/i2w2bhL227o02w4fI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3HVW3eTBVJWtUNoftd0SkBk7ur5VhkpqYVFxC9v3ysx9WAxww
	kqN68Ac9TfMRb1hM2EQlH22hTEGBebcvx2D/KoL6GXTPvt7vYT3u76tbOq4T17xPrkAqOpjc137
	0Crb8ewdUWw==
X-Google-Smtp-Source: AGHT+IFNJr9lipNoSDt3DruF7rcxWQ60eYd2ESWJFpivjjPDmvUD5g41M9KiJ+nbTnZt0uYf5BR5V0buLOkY
X-Received: from pjkh7.prod.google.com ([2002:a17:90a:7107:b0:332:4129:51b2])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1b50:b0:330:48d1:f90a
 with SMTP id 98e67ed59e1d1-339a6f680d9mr89247a91.27.1759250224019; Tue, 30
 Sep 2025 09:37:04 -0700 (PDT)
Date: Tue, 30 Sep 2025 09:36:35 -0700
In-Reply-To: <20250930163635.4035866-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250930163635.4035866-1-vipinsh@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20250930163635.4035866-10-vipinsh@google.com>
Subject: [PATCH v3 9/9] KVM: selftests: Provide README.rst for KVM selftests runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com, Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_093705_504193_B831DD48 
X-CRM114-Status: GOOD (  14.29  )
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

Add README.rst for KVM selftest runner and explain how to use the
runner.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 tools/testing/selftests/kvm/.gitignore        |  1 +
 tools/testing/selftests/kvm/runner/README.rst | 54 +++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/runner/README.rst

diff --git a/tools/testing/selftests/kvm/.gitignore b/tools/testing/selftests/kvm/.gitignore
index 548d435bde2f..83aa2fe01bac 100644
--- a/tools/testing/selftests/kvm/.gitignore
+++ b/tools/testing/selftests/kvm/.gitignore
@@ -4,6 +4,7 @@
 !*.c
 !*.h
 !*.py
+!*.rst
 !*.S
 !*.sh
 !*.test
diff --git a/tools/testing/selftests/kvm/runner/README.rst b/tools/testing/selftests/kvm/runner/README.rst
new file mode 100644
index 000000000000..83b071c0a0e6
--- /dev/null
+++ b/tools/testing/selftests/kvm/runner/README.rst
@@ -0,0 +1,54 @@
+KVM Selftest Runner
+===================
+
+KVM selftest runner is highly configurable test executor that allows to run
+tests with different configurations (not just the default), parallely, save
+output to disk hierarchically, control what gets printed on console, provide
+execution status.
+
+To generate default tests use::
+
+  # make tests_install
+
+This will create ``testcases_default_gen`` directory which will have testcases
+in `default.test` files. Each KVM selftest will have a directory in  which
+`default.test` file will be created with executable path relative to KVM
+selftest root directory i.e. `/tools/testing/selftests/kvm`. For example, the
+`dirty_log_perf_test` will have::
+
+  # cat testcase_default_gen/dirty_log_perf_test/default.test
+  dirty_log_perf_test
+
+Runner will execute `dirty_log_perf_test`. Testcases files can also provide
+extra arguments to the test::
+
+  # cat tests/dirty_log_perf_test/2slot_5vcpu_10iter.test
+  dirty_log_perf_test -x 2 -v 5 -i 10
+
+In this case runner will execute the `dirty_log_perf_test` with the options.
+
+Example
+=======
+
+To see all of the options::
+
+  # python3 runner -h
+
+To run all of the default tests::
+
+  # python3 runner -d testcases_default_gen
+
+To run tests parallely::
+
+  # python3 runner -d testcases_default_gen -j 40
+
+To print only passed test status and failed test stderr::
+
+  # python3 runner -d testcases_default_gen --print-passed status \
+  --print-failed stderr
+
+To run tests binary which are in some other directory (out of tree builds)::
+
+  # python3 runner -d testcases_default_gen -p /path/to/binaries
+
+
-- 
2.51.0.618.g983fd99d29-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
