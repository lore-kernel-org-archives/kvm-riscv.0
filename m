Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F205BC369D9
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 17:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=B+8pX7trPaeMISjn1U8TOqwcodpfq4YPWXok95vo7fE=; b=4UNaDQ3BwnZ9mSBk8L7FNPBq4N
	ogALp+pSJebaIBmfFFiCigs7cuNKJEbq15wkqG1lZFnLUXQxtPiBXE4hm7DvWDTLXmOxqhW0UDdEN
	4ssyAu2mASwVnaMYT7Me+V0MQ3E+84/iMyEqefIUlikXmedHQOnJQ0Ytji+4ebIdb6RE2p7Le3cIN
	ZtRl7AxPNTxbmtwZwObYfIpyDo7v/Bh/nkCGBR86phA3gCLVhSClc/KDmwndTXWvLGCS5oi97iUqt
	f1h0hqBtKaGAExtaxCzV8q7bxRcOgggvquOr7NFueCOt7JdLiInTSha22EPbZ5x1kSqcWmls0qZMr
	V7aXyUIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAAoR-0000000DVkN-1ZXW;
	Wed, 30 Apr 2025 17:01:35 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAAoO-0000000DViu-2vWQ
	for kvm-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 17:01:33 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3085f5855c4so103947a91.1
        for <kvm-riscv@lists.infradead.org>; Wed, 30 Apr 2025 10:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746032491; x=1746637291; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=URk21pnT/XOSFzAg25G44Je9n7xhg0j0WDExK+T2XSo=;
        b=CMEjrzVqzadMihXa1+1Z/x+Azm9AVdaO20gQP0TaGd0JDvijZU5xnr9ennxY2hn6BU
         twWz9T8tRH9jOEVzLVU1Styj4NPAngkocG4ODILqW67+06peWNnMxeIpcchi+30nBtLv
         5zp6A/dEpc+Rz3om3jT/G17eE7qPgMascytuBL+6UdL0aB8XGgJ2Uw3mFiyxCYixxgTj
         Rw4KgecoM936LsY4A9xHEBQGXuQ+M29Wr0sA//Dqku6l49rKvCf6V0nuvOQkpoaoAxu1
         fITZSi5JpGtNw3+D32ZsctfoIVDSz2JQCNFO7fkMHNO0qI+x8HnVmAZ0zXBwJOpAvfzn
         hFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746032491; x=1746637291;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=URk21pnT/XOSFzAg25G44Je9n7xhg0j0WDExK+T2XSo=;
        b=Lf54pH+nBrjQSkxvtOb2asIbcDaZii6tP7GyWyy+h26xMuOICZhiyd4f4clmmYwxYg
         Ezr27L12UaGiDTR9wKZZJ3P7L33K4eZf5sd56acxsAzmD1a26UEOnr5cPhIvO3qKwjZ8
         XNlCIh1D8uwgUVotoNnwOx+HC964HS5fDfcWO5f1OMNidwY9nLCY5Ci2ofWrDISE/5yj
         QVobOTJ/yXq3C5IqtB3vLF3ngD7lvb0uhtAx71xhgRKyt5seeB2MDLDnSloJC8nsb/Iw
         6XK5NFtLYT7i9suIWl87AFYV5+EibwdDd99SlloVpw/cSh31PQQOmfoQ9f60RnO0vx1B
         D7ew==
X-Forwarded-Encrypted: i=1; AJvYcCV8k2h5wtIkphXF0aAdF2xmeI8cv7BFKU8xWT3NNWxHqKxY2p2fhy6j9wjA35H8jhI0KsKVifGHfqw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/fg42pD2vak9Ie/kuHKtfsUVk0wCMJOGv8nJJVYZvfYDmCuu0
	yPTaHU5G+uMxWDCTWwyqAr9kAZ+sdR6gqjzMtrtp9huWVfoif2VfQ4yl4EO+5EXFOMQS9IUKPK2
	94g==
X-Google-Smtp-Source: AGHT+IESEXuF+9+pwH1wKZ+9NbO7EwNOG2NYsEaw3R2SqqKDBeSnQYLSAYuo2qganDUT53HrDY6m/tsSN3o=
X-Received: from pjbsk13.prod.google.com ([2002:a17:90b:2dcd:b0:2ea:9d23:79a0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c02:b0:2ff:4e90:3c55
 with SMTP id 98e67ed59e1d1-30a3335eeb7mr5473897a91.27.1746032491582; Wed, 30
 Apr 2025 10:01:31 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:01:29 -0700
In-Reply-To: <20250222005943.3348627-2-vipinsh@google.com>
Mime-Version: 1.0
References: <20250222005943.3348627-1-vipinsh@google.com> <20250222005943.3348627-2-vipinsh@google.com>
Message-ID: <aBJXabTuiJyRZb-O@google.com>
Subject: Re: [PATCH 1/2] KVM: selftests: Add default testfiles for KVM
 selftests runner
From: Sean Christopherson <seanjc@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, pbonzini@redhat.com, 
	anup@brainfault.org, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, maz@kernel.org, oliver.upton@linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_100132_739523_DE866BCF 
X-CRM114-Status: GOOD (  29.61  )
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

On Fri, Feb 21, 2025, Vipin Sharma wrote:
> Create a root "testcases" folder in KVM selftests directory. Add test
> files for all of the KVM selftests across all of the supported
> platforms.  Write only default test execution command in the test files.
> Commands written in the test files will be ran by KVM selftest runner.
> 
> Test files are organized based following rules:
> 1. All test files resides in "testcases" directory.
> 2. Test files should have .test extension. This is needed so that
>    git doesn't ignore the test file changes.
> 3. Each KVM selftest resides in a folder in "testcases" directory.
>    It follows the path of KVM selftests directory. For example,
>    kvm/x86_64/vmx_msrs_test.c will be in
>    kvm/testcases/x86_64/vmx_msrs_tests directory.
> 4. default.test name is reserved for the default command to execute the
>    test.
> 5. Different configuration of the tests should reside in their own test
>    files under the same test directory. For example dirty_log_perf_test
>    can have:
>    - testcases/dirty_log_perf_test/default.test
>    - testcases/dirty_log_perf_test/hugetlb1g.test
>    - testcases/dirty_log_perf_test/disable_dirty_log_manual.test
> 6. If there is an arch specific option of a common test then it should
>    be specified under an arch name directory in the test directory. This
>    will avoid test runner to execute the common test or its option on
>    unsupported machine. For example:
>    testcases/memslot_modification_stress_test/x86_64/disable_slot_zap_quirk.test
> 
> Signed-off-by: Vipin Sharma <vipinsh@google.com>
> ---
>  tools/testing/selftests/kvm/.gitignore                         | 3 ++-

After spending a comical amount of time fiddling with the default testcases, I
think I have a final opinion.

We definitely auto-generate the default testcases.  Relying on the user to remember
to add a testcase, and on the maintainer to remember to check for that, isn't a
winning strategy.

But, I do think we should commit the default.test files to the repository.  If
they're ephemeral, then several problems arise:

 1. For out-of-tree builds, the default.test files should arguably be placed in
    the OUTPUT directory.  But if/when we add curated testcases/, then we'll either
    end up with multiple testcases/ directories (source and output), or we'll have
    to copy testcases/ from the source to the output on a normal build, which is
    rather gross.  Or we'd need e.g. "make testcases", which is also gross, e.g.
    I don't want to have to run yet more commands just to execute tests.

 2. Generating default.test could overwrite a user-defined file.  That's firmly
    a user error, but at least if they default.test files are commited, the user
    will get a hint or three that they're doing things wrong.

 3. If the files aren't committed, then they probably should removed on "clean",
    which isn't the end of the world since they're trivially easy to generate,
    but it's kinda funky. 

So, what if we add this to auto-generate the files?  It's obviously wasteful since
the files will exist 99.9999999% of the time, but the overhead is completely
negligible.  The only concern I have is if this will do the wrong thing for some
build environments, i.e. shove the files in the wrong location.

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index f62b0a5aba35..d94bb8330ad1 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -198,6 +198,13 @@ TEST_GEN_PROGS += $(TEST_GEN_PROGS_$(ARCH))
 TEST_GEN_PROGS_EXTENDED += $(TEST_GEN_PROGS_EXTENDED_$(ARCH))
 LIBKVM += $(LIBKVM_$(ARCH))
 
+$(foreach tc, $(TEST_PROGS), $(shell mkdir -p testcases/$(patsubst %.sh,%,$(tc))))
+$(foreach tc, $(TEST_GEN_PROGS), $(shell mkdir -p testcases/$(tc)))
+$(foreach tc, $(TEST_PROGS), \
+  $(shell echo $(tc) > $(patsubst %.sh,testcases/%/default.test,$(tc))))
+$(foreach tc, $(TEST_GEN_PROGS), \
+  $(shell echo $(tc) > $(patsubst %,testcases/%/default.test,$(tc))))
+
 OVERRIDE_TARGETS = 1
 
 # lib.mak defines $(OUTPUT), prepends $(OUTPUT)/ to $(TEST_GEN_PROGS), and most

> diff --git a/tools/testing/selftests/kvm/.gitignore b/tools/testing/selftests/kvm/.gitignore
> index 1d41a046a7bf..550b7c2b4a0c 100644
> --- a/tools/testing/selftests/kvm/.gitignore
> +++ b/tools/testing/selftests/kvm/.gitignore
> @@ -9,4 +9,5 @@
>  !config
>  !settings
>  !Makefile
> -!Makefile.kvm
> \ No newline at end of file
> +!Makefile.kvm
> +!*.test

Let's keep the extension wildcards sorted alphabetically, i.e.:

# SPDX-License-Identifier: GPL-2.0-only
*
!/**/
!*.c
!*.h
!*.py
!*.S
!*.sh
!*.test
!.gitignore
!config
!settings
!Makefile
!Makefile.kvm

> diff --git a/tools/testing/selftests/kvm/testcases/aarch64/aarch32_id_regs/default.test b/tools/testing/selftests/kvm/testcases/aarch64/aarch32_id_regs/default.test
> new file mode 100644
> index 000000000000..5db8723f554f
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/testcases/aarch64/aarch32_id_regs/default.test
> @@ -0,0 +1 @@
> +./aarch64/aarch32_id_regs

I don't see any reason to make the paths directly consumable with a leading "./".
Spoiler alert from the next patch: the location of the test executables needs to
explicitly resolved by the test runner.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
