Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F1CC5DF81
	for <kvm-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 23:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LqtuUtZfxHgT0PmUfMb75Jdy7SDuFxMKprzUBQ0zUpY=; b=jkQNWVTnPPB2ym
	wyGY+wJBIKgCVRgegvI4k6InvwPh6f9zyuFeriw2GBZj7u+LDkm7j+W6+2Cku50ehHBo0Xs9+iPJa
	Slhopzev9zNGfqLVl7ODmWGEl3YZsWdgCjoPZp1se9j6kRFOxV47DX8bXyAeyjaKwwtMwcGctz5D6
	FXmC2+K9pxmmSB0br18YqkpqT2JgKJH3IIBxv94Co6j1whB09rNkfw9DY6xNiugx2O5Tm+urJYFUA
	ckoa2C6VCI51XIKu079cXlsRkJGJAv8Lzucq56KhWFkkWyi/PixpinqCwsVfXb79kU0f6695Mij7d
	irQsmGZJx4/Ppx0/zU+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxCCT-0000000CL5o-188Y;
	Thu, 20 Aug 2026 23:29:33 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxCCR-0000000CL5R-0OxM
	for kvm-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 23:29:32 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2d3b440b97aso11815ad.1
        for <kvm-riscv@lists.infradead.org>; Thu, 20 Aug 2026 16:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787268569; x=1787873369; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1/h3VNQtWr5Uh6IO9vIimUOFdkR8pd4y8N4EBbX0fQY=;
        b=E4eH+9r2BTfxMFxpZkJRt3TMfbTzAl0zOCNB2xAxmlz53mXfilxtpTSFSzDLPmBodT
         nFxJm6huBYghtSqpgKlHvwJvQt4ewHFbgojIchRGr0cpevGSKu/jbgtpxqR2grj3rvcQ
         TRhdxVI1/iEfaal781UlfZ9urpXjjRLaSPU1J8w/jn/b6w32kyTE6cgtDimKpiWX8e0v
         MNbq/mSwoFtcW+L7JYDwyVyn2lCH7lzUcoEBK5gpQrOt2ozhWlpeLNsJZ93nxY0q3Lhr
         +Hcfcl4m8lTtteDBVAlhZE+oiXIMigDdVlMBahlFdwgd/e0XA7t8Y8gYtrj4qpeXd/7F
         zYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787268569; x=1787873369;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1/h3VNQtWr5Uh6IO9vIimUOFdkR8pd4y8N4EBbX0fQY=;
        b=X1iICID/JOaWyp4yBvpQG0OKnQi8c/mbXBRz2NXJDu+AfLX0e1bChcFTydhYKwFCuB
         oFSSaKcDE9Wrar6mAQ0dvFXGfwqBqfvvk7EbDX5kwx4zJ+51amImgFp0GL+xfcVrzCJK
         jtqkvfPpU5SBqPFhk8sxk9uK+xI3Bu9lQAhDg8XUKT8iqmnzs69Ex5uNiD3cxCrs+IJ4
         FzOWjHgmmBKpWk1zm+Fmr7QZEwTiMUiF/BMmyoSnvGnb8q1EIe6JbqzFrEW+SrPN5AIy
         Aktr8gcLZ9ntKIRp7AMsXE0Mg8RFndJWmwJLIv3zPtPGAomfJu821ImfIdbX4LTySqDh
         hrHg==
X-Forwarded-Encrypted: i=1; AHgh+RqL9It88NuywYJhQ3AcTAJeU/ysixeOKK7BYtDRLEWCQEcwxHlLiMbkitmg66JMRUO0WU6i004YT/0=@lists.infradead.org
X-Gm-Message-State: AFuF++mLIeG5KzDmOxLW7A76yj7/61Awj1LPHx0z0PM8Bpho2pq6P8YL
	LcSDrEQAW++O0jyPlcuFUpS9Xgye5GQfTTcVSrUK0T1H9NuqN/jEZcotis4Czi5rqg==
X-Gm-Gg: AR+sD11YE/rFNLKWAFiDsj2V8Sn84eUM6GBoVefnYSKHG/IwU4XMWiA/AVVSpjQ2Gun
	bc1FIjW8R33ZhAOI9LNJbEGjnjFQIHQdAs+aqEFsxnatBGI44V+7BqEmg1YCiihh9WyyIyzI/cw
	TqH7uCfnYXMJcTz7D4OBX0uxtEyncS3maCwqcH4EiZ6zT0/2AT8BItoWuIrLAs9XtWnQXLKhWGN
	bLaIT+a0rIfPE61xnvYFM6NYQLm0j1qesh/QF9pfkgI1DLkBCz/LgMZlVhDyNNjEEx/9/0oTM9P
	rUClT8ARiZkIizaAUlpZUOrIXs52jrsM4OMJB17N7LYQUkWi4lnsnyEC2j49g/B1rN3xWqpmOc8
	QxDjDWJmh1TV3OTXy3CegDstSOSWHzGGSA/R4nv41Bv502njIfBNMtJofR7JiD9eOUcgZWaH50x
	JzqULcRw+CKqKkASsvTJkcClPd6oVQlhwjMQtqkuhXkK+MGin20MClznRO7nN1ZjBiG6st34ppC
	MFJnwWfAKvUw0dWZKuDHKYXxQ==
X-Received: by 2002:a17:902:e951:b0:2bf:1000:d3ac with SMTP id d9443c01a7336-2d650d6510bmr1764635ad.11.1787268568429;
        Thu, 20 Aug 2026 16:29:28 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c8e07801sm97051a91.0.2026.08.20.16.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 16:29:27 -0700 (PDT)
Date: Thu, 20 Aug 2026 16:29:22 -0700
From: Vipin Sharma <vipinsh@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, ajones@ventanamicro.com
Subject: Re: [PATCH v4 8/9] KVM: selftests: Add rule to generate default
 tests for KVM selftests runner
Message-ID: <20260820220340.GC618052.vipinsh@google.com>
References: <20260331194202.1722082-1-vipinsh@google.com>
 <20260331194202.1722082-9-vipinsh@google.com>
 <ampPd9szwRoGKwds@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ampPd9szwRoGKwds@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_162931_154888_F4372DC4 
X-CRM114-Status: GOOD (  40.90  )
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

On Wed, Jul 29, 2026 at 12:07:35PM -0700, Sean Christopherson wrote:
> On Tue, Mar 31, 2026, Vipin Sharma wrote:
> > +# Default testcases for KVM selftests runner will be generated in this directory.
> > +DEFAULT_TESTCASES = testcases_default_gen
> 
> That's a cumbersome name.  It was also written by Yoda :-) How about default_testcases?
> 

No fun, you are!

> > +
> >  EXTRA_CLEAN += $(GEN_HDRS) \
> >  	       $(LIBKVM_OBJS) \
> >  	       $(SPLIT_TEST_GEN_OBJ) \
> >  	       $(TEST_DEP_FILES) \
> >  	       $(TEST_GEN_OBJ) \
> > +	       $(OUTPUT)/$(DEFAULT_TESTCASES) \
> >  	       cscope.*
> >  
> >  $(LIBKVM_C_OBJ): $(OUTPUT)/%.o: %.c $(GEN_HDRS)
> > @@ -363,3 +367,23 @@ cscope:
> >  	find . -name '*.c' \
> >  		-exec realpath --relative-base=$(PWD) {} \;) | sort -u > cscope.files
> >  	cscope -b
> > +
> > +# Generate runner testcases in DEFAULT_TESTCASES directory.
> > +# $(OUTPUT) is either CWD or specified in the make command.
> > +tests_install: list_progs = $(patsubst $(OUTPUT)/%,%,$(TEST_GEN_PROGS))
> > +tests_install:
> 
> This is very much *not* an install.  In fact, install is broken, because the
> runner isn't added to TEST_FILES.

I think this will also be not a good approach if we are moving towards
opt-in. I added another option in your FIXUP below.

> 
> Another issue with install is that it flattens the directory structures, i.e.
> drops the $ARCH/ subdirectories.  That causes issues for the default.test testcases
> due to them using partially qualified paths.
> 
> And coming back to this with fresh eyes, I don't love generating the testcases
> for the "normal" build.  It necessitates adding default.test to .gitignore,
> effectively requires copying the runner to the output directory, and is pure
> noise for folks that don't want to utilize the runner.

Yes, this is true.

> 
> Rather than generate testcases for the default build, what if we make this 100%
> opt-in, and take a hard dependency on install?  That should obviate the need for
> ignoring default.test, because if someone is silly enough to install testcases
> in the source tree, they get to deal with the noise.
> 
> And we can commit to having the default testcases provide completely unqualified
> paths, so that the Just Work with the flattened output.  If someone wants to run
> with an unflattened tree, then we should update the runner itself to handle
> multiple paths, a la the actual PATH variable.
> 
> The other nice thing is that we can make the runner opt-in, without requiring the
> user to run multiple make commands, by chaining testcases => install => all.  If
> we try to generate testcases as an optional step to the normal build, then we'll
> end up being able to run install without having generated the testcases, which
> is "fine", but probably not what we want for people that are trying to use the
> runner.
> 
> The obvious downside is that it requires doing an install to get the default
> testcases, but IMO that's an acceptable tradeoff.
> 

I like the opt-in approach. However, there is a subtle difference when
using 'testcases: install' vs 'all: tests_install'

Test cases can only be generated with

  make -C tools/testing/selftests/kvm testcases

We will not be able to generate test cases from the selftest directory
or the source root.

New command will be:

  make -C tools/testing/selftests/kvm testscases INSTALL_PATH=<path>

I think this is fine, considering it is opt-in and user has to know how
to run it. One advantage is that currently when a user runs:

  make -C tools/testing/selftests/kvm install INSTALL_PATH=<path>

They don't get run_kselftest.sh to run those tests. With the new rule,
they will have a runner to work with.

> > +	$(foreach tc, $(TEST_PROGS), \
> > +		$(shell mkdir -p $(OUTPUT)/$(DEFAULT_TESTCASES)/$(patsubst %.sh,%,$(tc))))
> > +	$(foreach tc, $(TEST_PROGS), \
> > +		$(shell echo $(tc) > $(patsubst %.sh,$(OUTPUT)/$(DEFAULT_TESTCASES)/%/default.test,$(tc))))
> > +
> > +	$(foreach tc, $(list_progs), \
> > +		$(shell mkdir -p $(OUTPUT)/$(DEFAULT_TESTCASES)/$(tc)))
> > +	$(foreach tc, $(list_progs), \
> > +		$(shell echo $(tc) > $(patsubst %,$(OUTPUT)/$(DEFAULT_TESTCASES)/%/default.test,$(tc))))
> > +
> > +	@if [ ! -d $(OUTPUT)/runner ]; then             \
> 
> This is very wrong, as this will fail to pick up any changes made to the runner.

yeah, I think rsync would have been better.

> 
> All in all, this as fixup?
> 
> diff --git a/tools/testing/selftests/kvm/.gitignore b/tools/testing/selftests/kvm/.gitignore
> index 83aa2fe01bac..91d2b21d396f 100644
> --- a/tools/testing/selftests/kvm/.gitignore
> +++ b/tools/testing/selftests/kvm/.gitignore
> @@ -8,7 +8,6 @@
>  !*.S
>  !*.sh
>  !*.test
> -default.test
>  !.gitignore
>  !config
>  !settings
> diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
> index c5821d495ea6..fc9dc41fdbeb 100644
> --- a/tools/testing/selftests/kvm/Makefile.kvm
> +++ b/tools/testing/selftests/kvm/Makefile.kvm
> @@ -1,8 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  include ../../../build/Build.include
>  
> -all: tests_install
> -
>  LIBKVM += lib/assert.c
>  LIBKVM += lib/elf.c
>  LIBKVM += lib/guest_modes.c
> @@ -347,15 +345,13 @@ $(SPLIT_TEST_GEN_PROGS): $(OUTPUT)/%: $(OUTPUT)/%.o $(OUTPUT)/$(ARCH)/%.o
>  $(SPLIT_TEST_GEN_OBJ): $(OUTPUT)/$(ARCH)/%.o: $(ARCH)/%.c
>         $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
>  
> -# Default testcases for KVM selftests runner will be generated in this directory.
> -DEFAULT_TESTCASES = testcases_default_gen
> +TEST_FILES := $(selfdir)/kvm/runner

Downside of this one is that if someone is not planning to use runner they
will still get this directory copied.

Should we instead add 'rsync -u' in 'testcases' rule below which can copy
runner only when it is updated or not present? This would be similar to
original patch but instead of 'cp' it will be 'rsync' command. This will
also copy runner when someone is explicitly using it.

I think we should also include 'tests' directory which we are using for
custom testcases and they also .

>  
>  EXTRA_CLEAN += $(GEN_HDRS) \
>                $(LIBKVM_OBJS) \
>                $(SPLIT_TEST_GEN_OBJ) \
>                $(TEST_DEP_FILES) \
>                $(TEST_GEN_OBJ) \
> -              $(OUTPUT)/$(DEFAULT_TESTCASES) \
>                cscope.*
>  
>  $(LIBKVM_C_OBJ): $(OUTPUT)/%.o: %.c $(GEN_HDRS)
> @@ -386,21 +382,18 @@ cscope:
>         cscope -b
>  
>  # Generate runner testcases in DEFAULT_TESTCASES directory.
> -# $(OUTPUT) is either CWD or specified in the make command.
> -tests_install: list_progs = $(patsubst $(OUTPUT)/%,%,$(TEST_GEN_PROGS))
> -tests_install:
> -       $(foreach tc, $(TEST_PROGS), \
> -               $(shell mkdir -p $(OUTPUT)/$(DEFAULT_TESTCASES)/$(patsubst %.sh,%,$(tc))))
> -       $(foreach tc, $(TEST_PROGS), \
> -               $(shell echo $(tc) > $(patsubst %.sh,$(OUTPUT)/$(DEFAULT_TESTCASES)/%/default.test,$(tc))))
> +DEFAULT_TESTCASES = default_testcases
> +
> +testcases: list_progs = $(notdir $(patsubst $(OUTPUT)/%,%,$(TEST_GEN_PROGS)))
> +testcases: install
> +       $(foreach tc, $(notdir $(TEST_PROGS)), \
> +               $(shell mkdir -p $(INSTALL_PATH)/$(DEFAULT_TESTCASES)/$(notdir $(patsubst %.sh,%,$(tc)))))
> +       $(foreach tc, $(notdir $(TEST_PROGS)), \
> +               $(shell echo $(tc) > $(patsubst %.sh,$(INSTALL_PATH)/$(DEFAULT_TESTCASES)/%/default.test,$(tc))))
>  
>         $(foreach tc, $(list_progs), \
> -               $(shell mkdir -p $(OUTPUT)/$(DEFAULT_TESTCASES)/$(tc)))
> +               $(shell mkdir -p $(INSTALL_PATH)/$(DEFAULT_TESTCASES)/$(tc)))
>         $(foreach tc, $(list_progs), \
> -               $(shell echo $(tc) > $(patsubst %,$(OUTPUT)/$(DEFAULT_TESTCASES)/%/default.test,$(tc))))
> -
> -       @if [ ! -d $(OUTPUT)/runner ]; then             \
> -               cp -r $(selfdir)/kvm/runner $(OUTPUT);  \
> -       fi
> +               $(shell echo $(tc) > $(patsubst %,$(INSTALL_PATH)/$(DEFAULT_TESTCASES)/%/default.test,$(tc))))

All looks good here.

Should I send a next version of this series with the changes you have
suggested or you wanna take the diff you created and apply before merge?

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
