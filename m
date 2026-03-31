Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706ACFF60D5
	for <kvm-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 19:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SGlaVB4oAo7dAktCVacBA2SiDnegAUgUHaHuLvhTH0g=; b=kxWgIAP4Cr8au8veNGpYKcusNh
	A/s3SNXeSS887LkuYF+rFUBclXKf5T0Zaje7nGfAPgJwIJjK9dPJ8oVGo4eynZzfPIcqpWzAObuD6
	Y671NSk5nzZPP70Bv0rdnazg8rTzY3wyt0fTecOxZ13CB0VxsPTtWzsXPA09wdWOUt2zNxoaPpx9V
	XYv3H5tYQXid5NV3qDnRJKVvuRiPcZxDc5DVMmtcN6f9ghard8l0IuctfYWik7XqCq45dvWLQnnQZ
	LDZfe7piSHUqHcho1ZTLBaoMNcq2XVKSNyvnZDz6djsgYecd2jt4V+QVh6LtwL6Xxi7RDYkmLJUoz
	jD64ajMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7eyu-0000000DUWD-0l80;
	Tue, 31 Mar 2026 19:42:32 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7eyr-0000000DUTz-434L
	for kvm-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 19:42:31 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-35dacc40f92so2441437a91.2
        for <kvm-riscv@lists.infradead.org>; Tue, 31 Mar 2026 12:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774986149; x=1775590949; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4VWnO9ZqBqweDz2fb12798lX7BIjzp/risNDY0rLawk=;
        b=Dlr76GlWnhxf6RuwFAL+0HDjrpGazbgfVGrrJ3uwy7pDBSv3jecs5LFltHTHE9SMHq
         qwXLQofMduUoH6YHSx/FIIcp8dUdEFsmUzMurJ53X6cjO1rtZBayY2UnoBspmBDwQ1H+
         M4pJyREfKKx/HoScIu08tnTy/+cnMyYuiDXp5BCmIlYw9rh+/ZjLzLW7w8aGwIeI6o57
         2nO56CgoxW7NSt25EAJ0f07/y1JIWfysYMDyJTlkYvU1+SgmfK8T4eaNtLlVpWX100qg
         wJXPTWxK3h/kFriIf88Snic8UbiOE4qSfoMgcukt/byOy8jQO7x/kQhOKN720Y+m7i/i
         wR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986149; x=1775590949;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4VWnO9ZqBqweDz2fb12798lX7BIjzp/risNDY0rLawk=;
        b=HENRuS/jjukvgbwGstMZGQ3y+xCRorNLR5GMmL/luC0Q6XgcJ+kVEoqXtMTesf0vM4
         7q65iZDMb7FaM1O0amN9/Tfp4dJUJDh3X5vg073bK8C3xNFmbRk5Q/3iT6f8KAvmJ4Oa
         RpihMpIOwnZvXWSPgIf30ds8ftOr2Kvf3aN2V+IFws+kUmu7htrvkqWNH7PnbAW95GOg
         ao4kahfYG4NJ8RVx1Puz2GOmrQgROgkw523akSaFiOyCs4VcFRy5+nRkXaXjSpelQGU3
         VHT3xYwatfaRL0tj9YzdLu9kfYW+3ettOF+vjz2w8ZPu3f1zUA6cA2qQGBtJDGitAN8M
         LeOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHgZwYc+9Ey/r74xoJBwqSELVFekS6++zuJSb6a5T9mesOTemvSWu8eFlPCzVSIAM3rfucoUqwe6E=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8Dpb+vVHgx38p0q6gRDoVsemJTJeL5ZFtv74kHGEx2EAlozUR
	TbfVMkZH7vO40Pv05vzFXQc8p/+bOLtcua7AFewBnNJl6GsRefoJ3yvvw89+dziVokWuLHD+IHT
	L3mfrC9S1Cw==
X-Received: from pjyw24.prod.google.com ([2002:a17:90a:ea18:b0:35d:a917:a7bf])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:528c:b0:35d:a3b4:2f0d
 with SMTP id 98e67ed59e1d1-35dc6e77eb0mr554628a91.6.1774986148828; Tue, 31
 Mar 2026 12:42:28 -0700 (PDT)
Date: Tue, 31 Mar 2026 12:42:02 -0700
In-Reply-To: <20260331194202.1722082-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20260331194202.1722082-1-vipinsh@google.com>
X-Mailer: git-send-email 2.53.0.1118.gaef5881109-goog
Message-ID: <20260331194202.1722082-10-vipinsh@google.com>
Subject: [PATCH v4 9/9] KVM: selftests: Provide README.rst for KVM selftests runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com, Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_124230_010292_07356739 
X-CRM114-Status: GOOD (  16.32  )
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
 tools/testing/selftests/kvm/runner/README.rst | 95 +++++++++++++++++++
 2 files changed, 96 insertions(+)
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
index 000000000000..e264c78ace68
--- /dev/null
+++ b/tools/testing/selftests/kvm/runner/README.rst
@@ -0,0 +1,95 @@
+KVM Selftest Runner
+===================
+
+Execute KVM selftests with high configurability. The runner supports parallel
+execution, hierarchical output storage, console output control, and execution
+status reporting.
+
+Compatibility with KVM Selftests
+===============================
+
+The runner acts as a non-intrusive wrapper around the existing KVM selftests.
+It does not modify the underlying test binaries or the way they are built.
+You can still run KVM selftests using traditional methods without any conflict:
+
+- Execute binaries directly: ``./dirty_log_perf_test -v 4``
+- Use the standard kselftest framework: ``make -C tools/testing/selftests TARGETS=kvm run_tests``
+
+Comparison with kselftest framework
+===================================
+
+While the standard ``kselftest`` framework provides basic execution and reporting,
+this runner is designed for more advanced testing scenarios and offers several
+advantages:
+
+- **Flexible Test Selection**: Unlike some ``kselftest`` options that may use a
+  fixed ``suite:test`` syntax for selection, this runner leverages the
+  filesystem. You can group tests into directories (acting as suites) or
+  provide a list of specific test files, offering a more intuitive way to
+  organize and execute subsets of tests.
+- **Parallel Execution**: Run tests concurrently using the ``-j`` flag to
+  significantly reduce total execution time.
+- **Granular Output Control**: Control exactly what gets printed to the console
+  for passed, failed, skipped, or timed-out tests.
+- **Hierarchical Logging**: Automatically save the stdout and stderr of every
+  test into a structured directory tree, making it easy to debug failures in
+  large test runs.
+- **Out-of-Tree Support**: Easily run test binaries located in a different
+  directory using the ``-p`` flag.
+
+Generate Default Tests
+======================
+
+Generate the default test case files using the provided make target::
+
+  # make tests_install
+
+This creates the ``testcases_default_gen`` directory containing ``default.test``
+files. Each KVM selftest has a directory with a ``default.test`` file. This file
+contains the executable path relative to the KVM selftest root directory
+(``/tools/testing/selftests/kvm``). For example, the ``dirty_log_perf_test``
+entry looks like::
+
+  # cat testcases_default_gen/dirty_log_perf_test/default.test
+  dirty_log_perf_test
+
+In above testcase, the runner executes ``dirty_log_perf_test``. Testcase files
+can provide extra arguments to the test::
+
+  # cat tests/dirty_log_perf_test/2slot_5vcpu_10iter.test
+  dirty_log_perf_test -x 2 -v 5 -i 10
+
+In this case, the runner executes ``dirty_log_perf_test`` with the specified
+options.
+
+Examples
+========
+
+Display all options::
+
+  # python3 runner -h
+
+Run all default tests::
+
+  # python3 runner -d testcases_default_gen
+
+Run tests in parallel::
+
+  # python3 runner -d testcases_default_gen -j 40
+
+Print only passed test status and failed test stderr::
+
+  # python3 runner -d testcases_default_gen --print-passed status \
+  --print-failed stderr
+
+Run test binaries from a different directory (e.g., out-of-tree builds)::
+
+  # python3 runner -d testcases_default_gen -p /path/to/binaries
+
+Save all test outputs (stdout, stderr, status) to a directory::
+
+  # python3 runner -d testcases_default_gen -o test_outputs
+
+Run specific testcase files::
+
+  # python3 runner -t tests/dirty_log_perf_test/2slot_5vcpu_10iter.test
-- 
2.53.0.1118.gaef5881109-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
