Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F14210F92F2
	for <kvm-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 19:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4bfBpegrOc6cbcwEOTyxI8D9TVw8cpb3vaobTYrj6PI=; b=cHARjlSG3aoaxEifbMWOf2v5Dt
	zMCJXYlne1bCgj0bSkNlz0stnQ3g/Vf6KyCE++lSGGEP462n3Cbqw5Tt9BZA9Qp4CHzS3HQjcNnqI
	uWAsQrpbQp6Fwxd+bLZN5lQvPxBjkxe2RGVoB8Lp2CGo9eQdAHjcwp9sNMyw7pr+aLdEtNGxtvJ+j
	UXKiNewdfNoOvTXMO+PKPq8E96UC+j8rHxKy8rnqBPj2iHxdqxMgZc63ZQq7BJBnRBluUaBDp/Sz4
	0ml0jLHyCdCoLQAWnZAkne41QkjZ6Q977QlIvfOYRD6Osb1sIdM5OHLHUh6f5o9sC2lT8sBJS1uq/
	2J715HYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7eys-0000000DUVE-3vso;
	Tue, 31 Mar 2026 19:42:30 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7eyq-0000000DUSv-3Nrm
	for kvm-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 19:42:29 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-35c1874336aso17493852a91.3
        for <kvm-riscv@lists.infradead.org>; Tue, 31 Mar 2026 12:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774986147; x=1775590947; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EMAEEYc33pbDyh5jLNn4+2ckaUXnuUr3hoaO2wyMBMY=;
        b=gzO5z9K9ITmLRK3JYOrqK7cUhfk8Q/+j4IJzmPD9oD5m+Cp8DutM6TosHkdJRBk8Ji
         s8CKjDXmRUT2RmWCpRJfBvew9LbaHg33J8igP2belO8nOxg6mSeV8iQxpwFfEaN+iAoD
         3JEdsNGSqSi0gFXPgW4wnbrmJ+xaDX9tDUem2BRNbM44GK8XrsWWcHAgIHW/Wn3ZmL19
         JzcaOtT0ov7mjACdFLZl11bO2qZjjb1zShMT8OjkdoIz9RGVh43K3hvPjEAL7PWoGHZh
         m0N8BMbmtUIUQF7AHP53wZbFmbiB1gbVsvmOOgOB+Dixyd6yTqvaB+hKZ+RRiPUV/1L6
         JVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986147; x=1775590947;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EMAEEYc33pbDyh5jLNn4+2ckaUXnuUr3hoaO2wyMBMY=;
        b=FS4G6zYoIU1AgVeMLHVwbX6sKG0tWTCbsgI4HJioGXA4hfccx1Q1pK0lZ5NvkHQ0GZ
         dq5NMEsP/Mjb4y6qqeHSNC7iiKKHXet+5oV35ejq61yzAoP56e6lqmIOy6rh5+SOYMD7
         hmDZzXtyR00I8T9TKHGolrZDbh6FqcGU64bNKM4MIlqbY0uEAS3LqV/LLfZReZLur6oi
         ABcwybVCdcx50EB3aL/T9bf/416SdaBKlKN3Gal5hSmCsmLRXIV6VrEUaAfSTHGmCQfy
         Dpojuq/N3RKqxplp7rpfFMBR6iLXfI2xMfhS+O9qlgEfoRHalGwbXLHxLtL2pRUODfCl
         e8Jg==
X-Forwarded-Encrypted: i=1; AJvYcCV6/vDTyxdVaPYvylXlqwbCDiSVL1n/TUVdU6urgEJcKIquMv6uNXuPpV+d+JI8IwmOJtSdmqbEnUE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzOTwwlf2ZZUpOSDje59Fwub+kWkgBZIL9iOXK77Juk/PC6ZDEe
	3ys8T6Lg9lOA1h4FUSuW3l2phLdKjdiP9Y6E2ixw35uN4/ihJDn6hyGvYDoM50pS2ex39mNs4gj
	LBQWMXCf6IA==
X-Received: from pjpe5.prod.google.com ([2002:a17:90a:9a85:b0:35d:9d42:3153])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1850:b0:359:ff8a:ee4f
 with SMTP id 98e67ed59e1d1-35dc6e9bc88mr571073a91.7.1774986147217; Tue, 31
 Mar 2026 12:42:27 -0700 (PDT)
Date: Tue, 31 Mar 2026 12:42:01 -0700
In-Reply-To: <20260331194202.1722082-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20260331194202.1722082-1-vipinsh@google.com>
X-Mailer: git-send-email 2.53.0.1118.gaef5881109-goog
Message-ID: <20260331194202.1722082-9-vipinsh@google.com>
Subject: [PATCH v4 8/9] KVM: selftests: Add rule to generate default tests for
 KVM selftests runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com, Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_124228_846700_923CAF3F 
X-CRM114-Status: GOOD (  10.93  )
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

Add 'tests_install' rule in the Makefile.kvm to auto generate default
testcases for KVM selftests runner. Preserve the hierarchy of test
executables for autogenerated files. Remove these testcases on
invocation of 'make clean'.

Autogeneration of default test files allows runner to execute default
testcases easily. These default testcases don't need to be checked in as
they are just executing the test without any command line options.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 tools/testing/selftests/kvm/.gitignore   |  1 +
 tools/testing/selftests/kvm/Makefile.kvm | 26 +++++++++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/.gitignore b/tools/testing/selftests/kvm/.gitignore
index 95af97b1ff9e..548d435bde2f 100644
--- a/tools/testing/selftests/kvm/.gitignore
+++ b/tools/testing/selftests/kvm/.gitignore
@@ -7,6 +7,7 @@
 !*.S
 !*.sh
 !*.test
+default.test
 !.gitignore
 !config
 !settings
diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 6471fa214a9f..fb9439cb5f3d 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 include ../../../build/Build.include
 
-all:
+all: tests_install
 
 LIBKVM += lib/assert.c
 LIBKVM += lib/elf.c
@@ -330,11 +330,15 @@ $(SPLIT_TEST_GEN_PROGS): $(OUTPUT)/%: $(OUTPUT)/%.o $(OUTPUT)/$(ARCH)/%.o
 $(SPLIT_TEST_GEN_OBJ): $(OUTPUT)/$(ARCH)/%.o: $(ARCH)/%.c
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
 
+# Default testcases for KVM selftests runner will be generated in this directory.
+DEFAULT_TESTCASES = testcases_default_gen
+
 EXTRA_CLEAN += $(GEN_HDRS) \
 	       $(LIBKVM_OBJS) \
 	       $(SPLIT_TEST_GEN_OBJ) \
 	       $(TEST_DEP_FILES) \
 	       $(TEST_GEN_OBJ) \
+	       $(OUTPUT)/$(DEFAULT_TESTCASES) \
 	       cscope.*
 
 $(LIBKVM_C_OBJ): $(OUTPUT)/%.o: %.c $(GEN_HDRS)
@@ -363,3 +367,23 @@ cscope:
 	find . -name '*.c' \
 		-exec realpath --relative-base=$(PWD) {} \;) | sort -u > cscope.files
 	cscope -b
+
+# Generate runner testcases in DEFAULT_TESTCASES directory.
+# $(OUTPUT) is either CWD or specified in the make command.
+tests_install: list_progs = $(patsubst $(OUTPUT)/%,%,$(TEST_GEN_PROGS))
+tests_install:
+	$(foreach tc, $(TEST_PROGS), \
+		$(shell mkdir -p $(OUTPUT)/$(DEFAULT_TESTCASES)/$(patsubst %.sh,%,$(tc))))
+	$(foreach tc, $(TEST_PROGS), \
+		$(shell echo $(tc) > $(patsubst %.sh,$(OUTPUT)/$(DEFAULT_TESTCASES)/%/default.test,$(tc))))
+
+	$(foreach tc, $(list_progs), \
+		$(shell mkdir -p $(OUTPUT)/$(DEFAULT_TESTCASES)/$(tc)))
+	$(foreach tc, $(list_progs), \
+		$(shell echo $(tc) > $(patsubst %,$(OUTPUT)/$(DEFAULT_TESTCASES)/%/default.test,$(tc))))
+
+	@if [ ! -d $(OUTPUT)/runner ]; then             \
+		cp -r $(selfdir)/kvm/runner $(OUTPUT);  \
+	fi
+
+	@:
-- 
2.53.0.1118.gaef5881109-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
