Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAECCCAC5B8
	for <kvm-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 16:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dkpS3NU/F7S3OB4R+HjEU6pQRaSKjV2UFqovcycvt0Q=; b=SzjyBUk6heKgUO2YpcjiABbRQX
	6oBiLrMQipkQkJKe8J6advxTaYLONRHIwb8UOutDQCSYmKsv+/uIYVTje91RfU1mZ1hDFnDChGFvu
	bZgmChYjSYSskD6rfV6RbETBizaVMkEj8ClC3ubpygfERRcDOpBkIr0BVivfuI2ZhCJ9iPKovgcTM
	Bt6oetwg+aKwZHwEk2076ufytRnFmd9x3QIRuJU+0cIvQg5RTFBRALZ/CyMbYtrzROyJoalh8cinK
	5eW7c8Nl1TZ+gylDE+oe9SoZ+dpuw6YA+76dfMvM3rIQHQsZDt/fYArLY9hd9EHLNYv2dPmomzJrE
	qa5pI9oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3dLe-00000005mtf-17MO;
	Tue, 30 Sep 2025 16:37:06 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3dLb-00000005moT-2gn7
	for kvm-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 16:37:04 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3305c08d975so6203581a91.3
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Sep 2025 09:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759250222; x=1759855022; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PDB4Bxe6YCqhMG0texjm2F7bd+t0DxvCH5y7s56NZ8g=;
        b=jBq5nU9wvSPbZw1DAxRzQIxNqZTXdZPTO83vi7QSZ5IAJeLk/3Xmdympr2yRAEx1gh
         rg4Uiuh340JMjqIjFhcO2wPzGreRH2zoAD4FFAeDCDgofh07+p2vo8jHNE/ifO/g4Bcl
         NVQSK0AnlQrofEXhAQR3SgzhfG5M4FZQMfVgFPTc+uTRSjTicT9yXcGhNE8vGA5ZUJ0x
         gB3lvoR/g2yd+FE6ppuvn6z+os73E16VjbwEdYmqcKBdTjztihRV/E+V5bH4yxogvu5b
         3q+dgMWEKZf6fPKTd7XW2uFkuWhvsltqHAOxjCvdzcM6ePVbCIRcfqZz16UnVnD5OzNo
         4+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759250222; x=1759855022;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PDB4Bxe6YCqhMG0texjm2F7bd+t0DxvCH5y7s56NZ8g=;
        b=kdALZF4XoUHb3VqquOjg41IVW53FQdSOZqBsrtNws81+OMQn0Ic24lHOXkmXw4MC99
         MgOIbMUfhZTdQw469eiqx6zVBCLG8S1LxBaFM4DlrDJxXg91HM8uvfzQNokXdEZ8/W1R
         l4c6QYeSGUfglAkHmfFKC+1DXd2vISS3xfIM/6kvBWgszkyPoX3kzqEQthWvCIQNyosR
         a9xMS6tTuNTYxpovACTAZSj6y0WMhViLb3vXfWsMlvMOcDpYWs2CbqZSSz31oJemtGQO
         8YyxfkarX/DmONGfm0JlkWbzDZCLDzE7mYbsf7VHti+BOFLjZ//d+yhKo4hMqa+x6FLD
         KDNw==
X-Forwarded-Encrypted: i=1; AJvYcCVMOEDkAlJJ4Mga42dH/q6x7M3W4z5IQgECAGhonLfgpR+X5lZH+dkaEc5sKs1Y1/HSL3EnoM+j1ow=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywmrqh90uWbk9YFfvlySgWsjvtwtfeKAdX5SfbIBR0vbrVEcqcJ
	pG6mgBuJ46aevMabSICX1i3Yq7Y5DSAl8TPEZlO/2C/zml7p0Ne6xDwmkAK1O8sB2ZOXKE83UqQ
	4QsoPMSWLNQ==
X-Google-Smtp-Source: AGHT+IFH7MY9VunA10xfm7S9xXyjqnmpJ9IaA0KI2bTcJ1mC7PTk9P775POawCgRman2ri0lXRnMzI5UF9gA
X-Received: from pjbcz15.prod.google.com ([2002:a17:90a:d44f:b0:327:e021:e61d])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3a92:b0:334:29f0:a7e4
 with SMTP id 98e67ed59e1d1-339a6f36cbamr103438a91.21.1759250222318; Tue, 30
 Sep 2025 09:37:02 -0700 (PDT)
Date: Tue, 30 Sep 2025 09:36:34 -0700
In-Reply-To: <20250930163635.4035866-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250930163635.4035866-1-vipinsh@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20250930163635.4035866-9-vipinsh@google.com>
Subject: [PATCH v3 8/9] KVM: selftests: Add rule to generate default tests for
 KVM selftests runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com, Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_093703_716285_66EF294D 
X-CRM114-Status: UNSURE (   9.48  )
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
 tools/testing/selftests/kvm/Makefile.kvm | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

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
index 41b40c676d7f..6bb63f88c0e6 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -306,11 +306,15 @@ $(SPLIT_TEST_GEN_PROGS): $(OUTPUT)/%: $(OUTPUT)/%.o $(OUTPUT)/$(ARCH)/%.o
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
@@ -339,3 +343,19 @@ cscope:
 	find . -name '*.c' \
 		-exec realpath --relative-base=$(PWD) {} \;) | sort -u > cscope.files
 	cscope -b
+
+# Generate testcases in DEFAULT_TESTCASES directory.
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
+	@:
-- 
2.51.0.618.g983fd99d29-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
