Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE1A10F92F8
	for <kvm-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 19:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=+lDsUogJCJAQVZ8t2EMBR7rmhZCmSqFQWsnSlwe8N7o=; b=0+K
	yJk7z1zrjUkOe/xKxeJJ5VCMG1MrWX40pjNFg3Fmcc0NeHVpDfZVQ7HNw68XbNWVhdFRr7IbH4jFi
	mrZweSePx5+itxS7a8dg193qRw4tneZeTSB72eMMpXlssZsWHjTJguLwJV53jEboilyWFkKzx/Mqm
	R+SCx7pavyZUtWJmt903WNtXUpfcBQjsd4iFAnQ50/kppVUPYGAnHsjRkXkYkohe96luvxZwwzOi1
	ksp7At/eoDkRPwRN8fSs+diJaWBjmZIHulvuwTOxwBQtJz8Hua+Qg60/M7Fjgusm+uiGvxiYOmHM5
	d2y8FtU4uaE97HBsL1dnxMQXc57I9Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7eye-0000000DULZ-1Ygy;
	Tue, 31 Mar 2026 19:42:16 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7eyc-0000000DUKa-00Rp
	for kvm-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 19:42:15 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-c7422397574so11154993a12.0
        for <kvm-riscv@lists.infradead.org>; Tue, 31 Mar 2026 12:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774986132; x=1775590932; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jSJ9JEryhSvGPhJKGI1u0Qnqsdu8hhpgpJnk/hSuiNY=;
        b=Uvjjr1xw5ll/pe4hV3Y2KR7LZV2c9DSM3frbhcSZv8Shjmp9MmJvjOQ48ESQaKqLhx
         2v9M0h1LI/GFQ+LLSySj20+q/7H8FpJUu3aPlebhnsk6SZXzqy6x5/CObtqkrNgCLKzt
         183r4ucrvXLJEuw+ln7+9xKcjY5we6AovpUKl5TNtfC9gyEL/RSEFb30NCBukKr0/Wiu
         g/p8YtoZEkyc9Tc25RT2VaJ7F+xW3dH+0IJ9dEqwuC1DZF06iwlmaOPDx16NoYzNZCwu
         8piUliTa5cvql3Qn83f+9fP0uMqnpWfdQ7fTlr7IgAJMuTUsUMmdrsEM8LdQBEpmMn53
         kAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986132; x=1775590932;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jSJ9JEryhSvGPhJKGI1u0Qnqsdu8hhpgpJnk/hSuiNY=;
        b=a/tgUNthOZYdqOItIoqFsreZ8jAki9f4K0spssNLcBi0mYkpNqZK2TuY+wQC/8j5zu
         fGMqRkjgIwrZgrGPuIKIbP1pqrcyqJvbZO33oO/NUKVdL2k2VbbHcWP8PjbiW4Z8C5gU
         DhkVZpJaNSyjWraxHbEVU9pKDYQYRK2nHc0rJ2BMBCh1CJYRGsNOwIFWuOEgXBxiGZNB
         0022JfjrdeIFIwMEKuo4s5gtackjHwL61W4eTX6YM29pcDaBMY2X81uREgaOE3Tlmh1v
         +S123SCQXvex6zMzpj90WXntsYDzeUOAc9Awwslu0JG8+G3hcNTGos8m+1h1/tAKYdVL
         TtgA==
X-Forwarded-Encrypted: i=1; AJvYcCWoJrLBeNXZU0605kn6f2JJGUOIhuTL62OMbhrKBz4fz2FdVjerpGMUwC1g6UzgSgwWRVbZZGVs0aM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4SpPDLif9rQWBLyEfROQvJUJTD/XcFG/etINFwzbVS/DvX31+
	/1nnt1NNebsknGRjZx3g8DlSmsJGBLHccAfzG+XSNIJY7VL7R1WOcRG5YA7X6YqNjau+NtNQ8VX
	zch/G9bdjBg==
X-Received: from pgah15.prod.google.com ([2002:a05:6a02:4e8f:b0:c75:7a93:9b8f])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6d88:b0:38b:d9b5:5de2
 with SMTP id adf61e73a8af0-39ef7792bc2mr470704637.50.1774986132379; Tue, 31
 Mar 2026 12:42:12 -0700 (PDT)
Date: Tue, 31 Mar 2026 12:41:53 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1118.gaef5881109-goog
Message-ID: <20260331194202.1722082-1-vipinsh@google.com>
Subject: [PATCH v4 0/9] KVM: selftests: Create KVM selftests runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com, Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_124214_049942_9E56EF44 
X-CRM114-Status: GOOD (  14.25  )
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

Hello,

This is v4 of KVM selftest runner.

To recap, KVM Selftest Runner allows running KVM selftests with added
features not present in default kselftest infrastructure like
parallelism, user friendly output, saving output hierarchically, etc.
Check README file in the patch 9.

This series is also available on github at:

https://github.com/shvipin/linux kvm/selftests/runner-v4

v4:
- Copy runner code and default test case files to out-of-tree build
  directory.
- Added comparison with kernel selftest framework.
- Added python minimum version (3.6) check for the runner.
- Bug fix where runner was not handling the child process output if returned in
  bytes instead of string.

v3: https://lore.kernel.org/kvm/20250930163635.4035866-1-vipinsh@google.com/
- Created "tests_install" rule in Makefile.kvm to auto generate default
  testcases, which will be ignored in .gitignore.
- Changed command line option names to pass testcase files, directories,
  executable paths, print based on test status, and what to print.
  Removed certain other options based on feedback in v2.
- Merged command.py into selftest.py
- Fixed issue where timed out test's stdout and stderr were not printed.
- Reduced python version from 3.7 to 3.6.
- Fixed issue where test status numerical value was printed instead of
  text like PASSED, FAILED, SKIPPED, etc.
- Added README.rst.

v2: https://lore.kernel.org/kvm/20250606235619.1841595-1-vipinsh@google.com/
- Automatic default test generation.
- Command line flag to provide executables location
- Dump output to filesystem with timestamp
- Accept absolute path of *.test files/directory location
- Sticky status at bottom for the current state of runner.
- Knobs to control output verbosity
- Colored output for terminals.

v1: https://lore.kernel.org/kvm/20250222005943.3348627-1-vipinsh@google.com/
- Parallel test execution.
- Dumping separate output for each test.
- Timeout for test execution
- Specify single test or a test directory.

RFC: https://lore.kernel.org/kvm/20240821223012.3757828-1-vipinsh@google.com/


Vipin Sharma (9):
  KVM: selftest: Create KVM selftest runner
  KVM: selftests: Provide executables path option to the KVM selftest
    runner
  KVM: selftests: Add timeout option in selftests runner
  KVM: selftests: Add option to save selftest runner output to a
    directory
  KVM: selftests: Run tests concurrently in KVM selftests runner
  KVM: selftests: Add various print flags to KVM selftest runner
  KVM: selftests: Print sticky KVM selftests runner status at bottom
  KVM: selftests: Add rule to generate default tests for KVM selftests
    runner
  KVM: selftests: Provide README.rst for KVM selftests runner

 tools/testing/selftests/kvm/.gitignore        |   6 +-
 tools/testing/selftests/kvm/Makefile.kvm      |  26 ++-
 tools/testing/selftests/kvm/runner/README.rst |  95 +++++++++
 .../testing/selftests/kvm/runner/__main__.py  | 189 ++++++++++++++++++
 .../testing/selftests/kvm/runner/selftest.py  |  99 +++++++++
 .../selftests/kvm/runner/test_runner.py       |  83 ++++++++
 .../2slot_5vcpu_10iter.test                   |   1 +
 .../no_dirty_log_protect.test                 |   1 +
 8 files changed, 498 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/runner/README.rst
 create mode 100644 tools/testing/selftests/kvm/runner/__main__.py
 create mode 100644 tools/testing/selftests/kvm/runner/selftest.py
 create mode 100644 tools/testing/selftests/kvm/runner/test_runner.py
 create mode 100644 tools/testing/selftests/kvm/tests/dirty_log_perf_test/2slot_5vcpu_10iter.test
 create mode 100644 tools/testing/selftests/kvm/tests/dirty_log_perf_test/no_dirty_log_protect.test


base-commit: df83746075778958954aa0460cca55f4b3fc9c02
-- 
2.53.0.1118.gaef5881109-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
