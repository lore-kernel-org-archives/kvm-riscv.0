Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D209FCAC5B8
	for <kvm-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 16:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=UPeQUAqlnId733USKjz71iyM/KUMtPwnv6U04Kg5s28=; b=A6E
	ne04kh08OHuM72FoFBeD6t7dVnJ7yQpLbazcKKBsbJsjIEve3v4c49uNjzo+tzTPhv3eHp09dL8+3
	vucQ5Gc7lVaRe+DTaKI4uCFogZRDBzDW1kIDrOq94vtG+0hwVxPWYh0PR6yi/a8sW3Hx45oy562K5
	L98DuaU318mTEVZOxhWNAwWnxWw2SC1JGQv9hN6OEr8TFqP56jYGw3RcyiZSz+F7NT46Zps32nXwD
	omsyhoQOahKLFIQLBiWRpKGVQm83hAd0bEItO/bhMWDh9GM5ZkG4FmeYqH7k/WzTWhQXNdSBrFBh7
	tbgMgHy8D8P32E4qeyKevwWp1CMldUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3dLQ-00000005miI-1brN;
	Tue, 30 Sep 2025 16:36:52 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3dLN-00000005mhb-3qM0
	for kvm-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 16:36:51 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-78427dae77eso2752948b3a.3
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Sep 2025 09:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759250209; x=1759855009; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q5LgePzkRxjmi424htLltNXg1q5zxRKaifVE5Syh82s=;
        b=WRZ/O2Ddc19o8hBJPPeCcrOFU3vDlpiy7INGIx7Ru/NCgCkHmfHMRzpMMg3kl9BK9C
         uz+2KwdtAqq+f1Y22TdUkliD8gqESIiLWtkp/AEkF3815FGuHCWcIzVwRqRhm6CPXiLs
         oOJsRsaZCZ5CBPWNK93uzFMBxIOAij32fNaC4fivaVahJG2wdjQLFSvDywOfZF9hdOtF
         OSINQG89NwAiUS85omDXl6VFKuTWG3OwDtQVk0NoNeJeWx2TMgXz+FU/lac9S25TFTDH
         lrQ8ep2wVdOlAx40vRofriAdgyvDEi/7R6UOnwwMA9ZhZcpqDPW2s+LAwR/cJu4KtkGz
         dcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759250209; x=1759855009;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q5LgePzkRxjmi424htLltNXg1q5zxRKaifVE5Syh82s=;
        b=hEQxvIpTkMmr15ISV2PgT2Lpyhl6+8KGHut6h9J/tVwPhc1dy91FfrfEM3+T1wR8Vb
         jckHO/R4m5q154dkZ3/vIsYXWbOAD3mPMUgSQwpYu/QsDLc9cASKr/Ypd7ZGN1eo2Ybb
         8sTcHAcS+KPOFSK1XW0yS8wldvnovVPb8lm+Rh3uf+S/pQlPZNi5Yb9Y1eeSDouekQ0N
         SlPJIqiwYbW6T2ne7SkkTrf1+bG1Tdp/KRHKDB5Ak/V+z+C8lWAoqliHX3F3zOQzx9Yl
         1sRRXlX5BcexhNUsCb8Js9mxhZUySQwNK7T9vxJcegAdtPdYw10Y4OkTxy0TBjBlgccK
         tRCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQnniuHP2avw5mdljUYc2DI0JS7vksWCz/ZGXbGNb0VIlt7GbVX9BZiIlEl08XHqPtIxVh8zEBcfE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxjpqBHj1+cpU7MWwP4YpKdxhZdRzbhiKbfyA32JWo66msCPrTQ
	xMYLyicGoGZQCDTJ2x+kHahBfIqH0ghxuUuv7lUpoW5EzAyRnKgV7/o1y9Jjgl9pOnf6dvpmRjM
	zvsXftj6UZg==
X-Google-Smtp-Source: AGHT+IFfwV3VactE4ba6FoRVHzTuew8H79oNEwJxTcAq0uf0cCqCG98iICrJcj6DOYhQRbECloIyWc7dk2Ej
X-Received: from pfoh10.prod.google.com ([2002:aa7:86ca:0:b0:77c:4a2a:9783])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7fa3:b0:2e8:6bf6:7d6c
 with SMTP id adf61e73a8af0-321d8452cb1mr555553637.2.1759250208788; Tue, 30
 Sep 2025 09:36:48 -0700 (PDT)
Date: Tue, 30 Sep 2025 09:36:26 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20250930163635.4035866-1-vipinsh@google.com>
Subject: [PATCH v3 0/9] KVM Selftest Runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com, Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_093649_959211_4A58DD2B 
X-CRM114-Status: GOOD (  17.51  )
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

This is v3 of KVM selftest runner. After making changes on feedback
given in v2, this series has reduced from 15 patches to 9 patches. I
have tried to address all of the comments from v2. There are none left
open and are incorporated to best of my understanding. 

To recap (copied from v2), KVM Selftest Runner allows running KVM
selftests with added features not present in default selftest runner
provided by selftests framework.

This Runner has two broad goals:
1. Make it easier for contributors and maintainers to run various
   configuration of tests with features like preserving output,
   controlling output verbosity, parallelism, different combinations of
   command line arguments.
2. Provide common place to write interesting and useful combinations of
   tests command line arguments to improve KVM test coverage. Default
   selftests runner provide little to no control over this.

Future patches will add features like:
- Print process id of the test in execution.
- CTRL+C currently spits out lots of warning (depending on --job value).
  This will be fixed in the next version.
- Add more tests configurations.
- Provide a way to set the environment in which runner will start tests. For
  example, setting huge pages, stress testing based on resources
  available on host.

This series is also available on github at:

https://github.com/shvipin/linux kvm/sefltests/runner-v3

v3:
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
 tools/testing/selftests/kvm/Makefile.kvm      |  20 ++
 tools/testing/selftests/kvm/runner/README.rst |  54 +++++
 .../testing/selftests/kvm/runner/__main__.py  | 184 ++++++++++++++++++
 .../testing/selftests/kvm/runner/selftest.py  | 105 ++++++++++
 .../selftests/kvm/runner/test_runner.py       |  79 ++++++++
 .../2slot_5vcpu_10iter.test                   |   1 +
 .../no_dirty_log_protect.test                 |   1 +
 8 files changed, 449 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/kvm/runner/README.rst
 create mode 100644 tools/testing/selftests/kvm/runner/__main__.py
 create mode 100644 tools/testing/selftests/kvm/runner/selftest.py
 create mode 100644 tools/testing/selftests/kvm/runner/test_runner.py
 create mode 100644 tools/testing/selftests/kvm/tests/dirty_log_perf_test/2slot_5vcpu_10iter.test
 create mode 100644 tools/testing/selftests/kvm/tests/dirty_log_perf_test/no_dirty_log_protect.test

-- 
2.51.0.618.g983fd99d29-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
