Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1F5C53200
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 19:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0s4K/3PbTg1ziG2DNbmuqECXlvEi+M9bgVP6GdRMGpo=; b=IAS9CAeEwb2lPCqTijC+TE2DJb
	vZfc3WmxhFc4iR0E6S1vQ/tJ9gSIyK7crDpK3/fOXCfd7N1cprKqb2o60c3smsZ+w8B6DtX4saKG0
	ERyOAkZzfWtpVHO21dNix41lovs/4UCc4fMCfnTyM646tj24HUWqL9bFr5/LMNIdYkpKLRSiWli/p
	UfMFBrw/mpTSs9uenIf5irgoXWd4KTFa6qmsh4S6d5R6ggmK14SZ0E2RFWYAtKe57QKsQlyS/sDJx
	vx6E3xRIA78NZSJDOWWdPGcb1+1NuDtafmxFyNNOrJZyh/izc3HPDDh8pG0XWq1AD3FIrx0GKc+F/
	mDqN9amg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9cx-00000008rVD-3dA8;
	Wed, 29 Jul 2026 19:07:39 +0000
Received: from mail-pf1-x445.google.com ([2607:f8b0:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9cv-00000008rUs-34ep
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 19:07:38 +0000
Received: by mail-pf1-x445.google.com with SMTP id d2e1a72fcca58-84e3d575d6eso2338959b3a.3
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 12:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785352056; x=1785956856; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2b3fQxiZ8vmEMZ/LriNEMYs2OUmWmCeVFavLD+6FbmM=;
        b=se4b2jGLsKGHWVleFByRR9oQMR6lHhEWErJmUhWV9nmKQoNrS9zeo6eTaNeWRTnKzr
         BrjLyDIsf/lfbbKLdnE9mYK3RlzaG3IrDID5J2/8FKjBz5OK6XOQ2uBUeQFE8fHffVaj
         MU5OinEVpYVKmlwHAFX8nRKQVpZuzQfyMWS9QKzPItGziTvtdxBiFGsJIoWNjplq1JWK
         QeUS/qAoy+7Nj/+8X3uACZu44dh0aklyGgVxQal6xmqv5i+yc6XepkX7XpeAqDw2W6ML
         M7k7nQmFlEDn1S8CcOZ2cN8C/UjOBM/dLgnmzufmqRIL5oGMaQGo8EcozKuzO/smguQj
         EPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785352056; x=1785956856;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2b3fQxiZ8vmEMZ/LriNEMYs2OUmWmCeVFavLD+6FbmM=;
        b=VhfjAXZO4P3rzYemYIxM3a5/cALO1yqLU6/MG0Rdmi5XUcxNmquxRUG4U0eLzWyzP9
         zInzahyuQ7ZqnjRGTy86YqfMuOYBkadFKPVgn1znGFx0bmldyc/vlLiW7f5Q36sAPERA
         /jOCIVRuoDBOnjpyJa+o74oOYUHwr4jQjRABXK4rTBESVG6Y321T+hPJnMjBn2UYuF25
         CLseZFDRzLl+06zsAF7/3PQF17wrrp7r7AljGF/ZLEZeODUn2JrrqqqmlVQ/TlUZdgmX
         eqD9M6awPSIRIabPv5NxgryRE8XqQYmCVFC1MP6ZJvphrJPCJtMOniEUZZbNtZLh3N7R
         IyzA==
X-Forwarded-Encrypted: i=1; AHgh+Rr8NaIUFWh0XJMemy8+zrwqiUalx5Vj1oqfbapirg+4fTksOpQmHyN4gRZzJ8C2aX7qeLbbLdS1SUQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzAOwLpQMT0lw3RU+qEqcv8MSVpRpU4XhDZ/t8bcj9fM5IUwXZg
	QUhh0yCA7TaAs+G1q/HSuscm9+SUpyL/ptoXuXR1ajlg/pol6Ag0+Bv/bBnL5KhFOkSibzhkZ31
	GYWS1DA==
X-Received: from pfblc11.prod.google.com ([2002:a05:6a00:4f4b:b0:84a:894f:23e6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:391d:b0:848:56d4:3288
 with SMTP id d2e1a72fcca58-84eb9e86fccmr34880b3a.4.1785352055899; Wed, 29 Jul
 2026 12:07:35 -0700 (PDT)
Date: Wed, 29 Jul 2026 12:07:35 -0700
In-Reply-To: <20260331194202.1722082-9-vipinsh@google.com>
Mime-Version: 1.0
References: <20260331194202.1722082-1-vipinsh@google.com> <20260331194202.1722082-9-vipinsh@google.com>
Message-ID: <ampPd9szwRoGKwds@google.com>
Subject: Re: [PATCH v4 8/9] KVM: selftests: Add rule to generate default tests
 for KVM selftests runner
From: Sean Christopherson <seanjc@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	pbonzini@redhat.com, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, anup@brainfault.org, atish.patra@linux.dev, 
	zhaotianrui@loongson.cn, maobibo@loongson.cn, chenhuacai@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_120737_807904_DBB6A029 
X-CRM114-Status: GOOD (  28.78  )
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

On Tue, Mar 31, 2026, Vipin Sharma wrote:
> Add 'tests_install' rule in the Makefile.kvm to auto generate default
> testcases for KVM selftests runner. Preserve the hierarchy of test
> executables for autogenerated files. Remove these testcases on
> invocation of 'make clean'.
> 
> Autogeneration of default test files allows runner to execute default
> testcases easily. These default testcases don't need to be checked in as
> they are just executing the test without any command line options.
> 
> Signed-off-by: Vipin Sharma <vipinsh@google.com>
> ---
>  tools/testing/selftests/kvm/.gitignore   |  1 +
>  tools/testing/selftests/kvm/Makefile.kvm | 26 +++++++++++++++++++++++-
>  2 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/.gitignore b/tools/testing/selftests/kvm/.gitignore
> index 95af97b1ff9e..548d435bde2f 100644
> --- a/tools/testing/selftests/kvm/.gitignore
> +++ b/tools/testing/selftests/kvm/.gitignore
> @@ -7,6 +7,7 @@
>  !*.S
>  !*.sh
>  !*.test
> +default.test
>  !.gitignore
>  !config
>  !settings
> diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
> index 6471fa214a9f..fb9439cb5f3d 100644
> --- a/tools/testing/selftests/kvm/Makefile.kvm
> +++ b/tools/testing/selftests/kvm/Makefile.kvm
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  include ../../../build/Build.include
>  
> -all:
> +all: tests_install
>  
>  LIBKVM += lib/assert.c
>  LIBKVM += lib/elf.c
> @@ -330,11 +330,15 @@ $(SPLIT_TEST_GEN_PROGS): $(OUTPUT)/%: $(OUTPUT)/%.o $(OUTPUT)/$(ARCH)/%.o
>  $(SPLIT_TEST_GEN_OBJ): $(OUTPUT)/$(ARCH)/%.o: $(ARCH)/%.c
>  	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
>  
> +# Default testcases for KVM selftests runner will be generated in this directory.
> +DEFAULT_TESTCASES = testcases_default_gen

That's a cumbersome name.  It was also written by Yoda :-) How about default_testcases?

> +
>  EXTRA_CLEAN += $(GEN_HDRS) \
>  	       $(LIBKVM_OBJS) \
>  	       $(SPLIT_TEST_GEN_OBJ) \
>  	       $(TEST_DEP_FILES) \
>  	       $(TEST_GEN_OBJ) \
> +	       $(OUTPUT)/$(DEFAULT_TESTCASES) \
>  	       cscope.*
>  
>  $(LIBKVM_C_OBJ): $(OUTPUT)/%.o: %.c $(GEN_HDRS)
> @@ -363,3 +367,23 @@ cscope:
>  	find . -name '*.c' \
>  		-exec realpath --relative-base=$(PWD) {} \;) | sort -u > cscope.files
>  	cscope -b
> +
> +# Generate runner testcases in DEFAULT_TESTCASES directory.
> +# $(OUTPUT) is either CWD or specified in the make command.
> +tests_install: list_progs = $(patsubst $(OUTPUT)/%,%,$(TEST_GEN_PROGS))
> +tests_install:

This is very much *not* an install.  In fact, install is broken, because the
runner isn't added to TEST_FILES.

Another issue with install is that it flattens the directory structures, i.e.
drops the $ARCH/ subdirectories.  That causes issues for the default.test testcases
due to them using partially qualified paths.

And coming back to this with fresh eyes, I don't love generating the testcases
for the "normal" build.  It necessitates adding default.test to .gitignore,
effectively requires copying the runner to the output directory, and is pure
noise for folks that don't want to utilize the runner.

Rather than generate testcases for the default build, what if we make this 100%
opt-in, and take a hard dependency on install?  That should obviate the need for
ignoring default.test, because if someone is silly enough to install testcases
in the source tree, they get to deal with the noise.

And we can commit to having the default testcases provide completely unqualified
paths, so that the Just Work with the flattened output.  If someone wants to run
with an unflattened tree, then we should update the runner itself to handle
multiple paths, a la the actual PATH variable.

The other nice thing is that we can make the runner opt-in, without requiring the
user to run multiple make commands, by chaining testcases => install => all.  If
we try to generate testcases as an optional step to the normal build, then we'll
end up being able to run install without having generated the testcases, which
is "fine", but probably not what we want for people that are trying to use the
runner.

The obvious downside is that it requires doing an install to get the default
testcases, but IMO that's an acceptable tradeoff.

> +	$(foreach tc, $(TEST_PROGS), \
> +		$(shell mkdir -p $(OUTPUT)/$(DEFAULT_TESTCASES)/$(patsubst %.sh,%,$(tc))))
> +	$(foreach tc, $(TEST_PROGS), \
> +		$(shell echo $(tc) > $(patsubst %.sh,$(OUTPUT)/$(DEFAULT_TESTCASES)/%/default.test,$(tc))))
> +
> +	$(foreach tc, $(list_progs), \
> +		$(shell mkdir -p $(OUTPUT)/$(DEFAULT_TESTCASES)/$(tc)))
> +	$(foreach tc, $(list_progs), \
> +		$(shell echo $(tc) > $(patsubst %,$(OUTPUT)/$(DEFAULT_TESTCASES)/%/default.test,$(tc))))
> +
> +	@if [ ! -d $(OUTPUT)/runner ]; then             \

This is very wrong, as this will fail to pick up any changes made to the runner.

All in all, this as fixup?

diff --git a/tools/testing/selftests/kvm/.gitignore b/tools/testing/selftests/kvm/.gitignore
index 83aa2fe01bac..91d2b21d396f 100644
--- a/tools/testing/selftests/kvm/.gitignore
+++ b/tools/testing/selftests/kvm/.gitignore
@@ -8,7 +8,6 @@
 !*.S
 !*.sh
 !*.test
-default.test
 !.gitignore
 !config
 !settings
diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index c5821d495ea6..fc9dc41fdbeb 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -1,8 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 include ../../../build/Build.include
 
-all: tests_install
-
 LIBKVM += lib/assert.c
 LIBKVM += lib/elf.c
 LIBKVM += lib/guest_modes.c
@@ -347,15 +345,13 @@ $(SPLIT_TEST_GEN_PROGS): $(OUTPUT)/%: $(OUTPUT)/%.o $(OUTPUT)/$(ARCH)/%.o
 $(SPLIT_TEST_GEN_OBJ): $(OUTPUT)/$(ARCH)/%.o: $(ARCH)/%.c
        $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
 
-# Default testcases for KVM selftests runner will be generated in this directory.
-DEFAULT_TESTCASES = testcases_default_gen
+TEST_FILES := $(selfdir)/kvm/runner
 
 EXTRA_CLEAN += $(GEN_HDRS) \
               $(LIBKVM_OBJS) \
               $(SPLIT_TEST_GEN_OBJ) \
               $(TEST_DEP_FILES) \
               $(TEST_GEN_OBJ) \
-              $(OUTPUT)/$(DEFAULT_TESTCASES) \
               cscope.*
 
 $(LIBKVM_C_OBJ): $(OUTPUT)/%.o: %.c $(GEN_HDRS)
@@ -386,21 +382,18 @@ cscope:
        cscope -b
 
 # Generate runner testcases in DEFAULT_TESTCASES directory.
-# $(OUTPUT) is either CWD or specified in the make command.
-tests_install: list_progs = $(patsubst $(OUTPUT)/%,%,$(TEST_GEN_PROGS))
-tests_install:
-       $(foreach tc, $(TEST_PROGS), \
-               $(shell mkdir -p $(OUTPUT)/$(DEFAULT_TESTCASES)/$(patsubst %.sh,%,$(tc))))
-       $(foreach tc, $(TEST_PROGS), \
-               $(shell echo $(tc) > $(patsubst %.sh,$(OUTPUT)/$(DEFAULT_TESTCASES)/%/default.test,$(tc))))
+DEFAULT_TESTCASES = default_testcases
+
+testcases: list_progs = $(notdir $(patsubst $(OUTPUT)/%,%,$(TEST_GEN_PROGS)))
+testcases: install
+       $(foreach tc, $(notdir $(TEST_PROGS)), \
+               $(shell mkdir -p $(INSTALL_PATH)/$(DEFAULT_TESTCASES)/$(notdir $(patsubst %.sh,%,$(tc)))))
+       $(foreach tc, $(notdir $(TEST_PROGS)), \
+               $(shell echo $(tc) > $(patsubst %.sh,$(INSTALL_PATH)/$(DEFAULT_TESTCASES)/%/default.test,$(tc))))
 
        $(foreach tc, $(list_progs), \
-               $(shell mkdir -p $(OUTPUT)/$(DEFAULT_TESTCASES)/$(tc)))
+               $(shell mkdir -p $(INSTALL_PATH)/$(DEFAULT_TESTCASES)/$(tc)))
        $(foreach tc, $(list_progs), \
-               $(shell echo $(tc) > $(patsubst %,$(OUTPUT)/$(DEFAULT_TESTCASES)/%/default.test,$(tc))))
-
-       @if [ ! -d $(OUTPUT)/runner ]; then             \
-               cp -r $(selfdir)/kvm/runner $(OUTPUT);  \
-       fi
+               $(shell echo $(tc) > $(patsubst %,$(INSTALL_PATH)/$(DEFAULT_TESTCASES)/%/default.test,$(tc))))
 
        @:

> +		cp -r $(selfdir)/kvm/runner $(OUTPUT);  \
> +	fi
> +
> +	@:
> -- 
> 2.53.0.1118.gaef5881109-goog
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
