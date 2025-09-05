Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6893ACA1013
	for <kvm-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 09:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=boYiiHT+CilhGpbO2PDXvJjeZenpkPbcVLd7t13Baeg=; b=sD5ttyNQvmfL99
	Lzq4tCjgY15uGPc9p5o0h8SiLwOVSozkAanlfcavSaPcSAyeATO9Ct6S61QHuGpf3+YN5QtMBzcdh
	caGet4weeN8nPDQvyIL0cdghs3IIL4zyv7UNkKSGajiTa/R8T7N8T4KpoFwEQHikBqzxJmVm4w+YI
	pl9VfHYC72v+JpXiEW36Pj+Ep10HkqOCfZBUezcf5jByXFa02dzzmaVVbQ/J0dFuNThvPzMcLgfox
	bNHrZDgRGgZrLKc6L/QCtxb2gqKSJUB1MmGF4O3biEv7lX/PubSNWaY0mY2yeDVmqf+kieHuirgFI
	Q8toE5jaEikMcYI5Uvww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuTEa-00000000uCi-3s6a;
	Fri, 05 Sep 2025 09:59:56 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRme-00000000Ltv-1JcD
	for kvm-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 08:27:02 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b4717543ed9so1157565a12.3
        for <kvm-riscv@lists.infradead.org>; Fri, 05 Sep 2025 01:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757060819; x=1757665619; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nHK9iI85iqWO4V8vX9Oo3GoxZBQpdXBS4cUBp8iEWm8=;
        b=XWJjVCt/9+oMM4kt/lFy0LRQfPKgnAuqmJJL+slOfPI5EUkAWWUhOrnXErwLw6B7Ts
         TYsSqH0X4weCYly3JRyzFxwdHrRMDwUFQ588fjowDJfybub/+eQ7Cv57GUMsmOoj9970
         /Y07XXhcDm+i5XkQqKWLlRoPfrMPUNTAmMpTQbGvskyZTz98sEy9VBdC66qWtbv8UzeQ
         7J587o9iCrHI8I3AWMvEKiVr34Z/V+LMAcP9ZDxnlBWzfQ2vzWZBJ9TykfPO04NK8T1T
         uuL/CHwzw/LH+xcZwvjobqGkc6M4pSoUs37mQ/3bFmKcIl+aEwAy9oSh9HF+q1A6UW0m
         lqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757060819; x=1757665619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHK9iI85iqWO4V8vX9Oo3GoxZBQpdXBS4cUBp8iEWm8=;
        b=o6y6B/23vPe8IrvFA4skv/hvKy2kAA4MEvIkzsiCje1njlvHcDO/wBAModkrp1TdWk
         PXKdXgFMVZaKT5Dhkn60vc2GsF58W4/tNamqGywCBOTQjqMKispBx4eUT8CCIMaNVDlS
         jEPKtBIudgrAj/EQwUQRYRlGCPtpvio5tLkfkTNmlKw12/4MD8yyTTyeimSkxo5zXgkD
         P6NuStmNPqFyNY/nQPcZrSj2FS8EDkOJcymKmnkaezW5kLoStOY2rnT0sqqnISLdzKAI
         RmRi69Sgf9E0phVHyYo4TG9dh5sSsAk8Hcv6ighQf7emPAmYXoNCx7/AdXG6YqFSTlJr
         kYVg==
X-Forwarded-Encrypted: i=1; AJvYcCUoQdyG6z6wiczBC/BZelbZ/Au4tTcXLNql8XSfOph5x1Cf9vLqoWIeYNslbUDbmswO5ynCXAyxscQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxmhW9k14Zv5PL3rc+93DGKBWDrwVLl2HeuLhGg8vRBsyAhfHFa
	H7gG6M6KXZVez2DuB/fDFMQjRApSvhLG5gzgRQplTf3LTENR1iTSqlN1
X-Gm-Gg: ASbGnctqPQ8o973FL7fm0CCFjC+kZ572e95XAoJAum3O4N0DrM+EMFY1WBSMPuI/Zhh
	kWFqseg7lp6JJue/Z0jGGQPdm7otZgaJMaw4dBlLI7Ox3FSE+1rmrRYcTsfEkMOPOkCoGngu+to
	eLijzCInhggu9qMqjB2Mj2ugYUtwkDJrXktnoZPGMgh1eYnxBpEndmyVylTAjcsroTHzUZDihwm
	gHBYtCzE75CDRlSyXOFwLIqFNV6xvmb+lCrLUYOK9RoU2Qd2NRrOg7qMiXXXi4Vd1Zc+I/FR1A6
	V3Yz6ZYnlXT3/T6Qj7tBUQuc2Vy2ZnYIpl8cVb6vlsvimudU3N8Jz5Z2OKUTg5igoROS6/gRb14
	lAgXyKHv3eeyK3+nPbhs7FF8=
X-Google-Smtp-Source: AGHT+IHP1juca3+Y9QGg8ZDy2o9SXnqJ9FRyMR+yGWiDytyQnru5S55L09mGQxTToFAfMA1iFcloFg==
X-Received: by 2002:a17:903:ac8:b0:240:52c8:2552 with SMTP id d9443c01a7336-24944ae192cmr283713095ad.43.1757060819170;
        Fri, 05 Sep 2025 01:26:59 -0700 (PDT)
Received: from localhost ([1.146.99.18])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-249144837fcsm199812975ad.15.2025.09.05.01.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 01:26:58 -0700 (PDT)
Date: Fri, 5 Sep 2025 18:26:55 +1000
From: Nicholas Piggin <npiggin@gmail.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: Joel Stanley <joel@jms.id.au>, kvm-riscv@lists.infradead.org, 
	Buildroot Mailing List <buildroot@buildroot.org>, kvm@vger.kernel.org
Subject: Re: [kvm-unit-tests] riscv build failure
Message-ID: <csh2fzymze636erajmsu5d55id6fpfsnvypkz3at7anp5i35uw@fhn2qgz327vj>
References: <CACPK8XddfiKcS_-pYwG5b7i8pwh7ea-QDA=fwZgkP245Ad9ECQ@mail.gmail.com>
 <20250904-11ba6fa251f914016170c0e4@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250904-11ba6fa251f914016170c0e4@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_012700_372942_093310E3 
X-CRM114-Status: GOOD (  25.23  )
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

On Thu, Sep 04, 2025 at 05:17:45PM -0500, Andrew Jones wrote:
> On Thu, Sep 04, 2025 at 08:57:54AM +0930, Joel Stanley wrote:
> > I'm building kvm-unit-tests as part of buildroot and hitting a build
> > failure. It looks like there's a missing dependency on
> > riscv/sbi-asm.S, as building that manually fixes the issue. Triggering
> > buildroot again (several times) doesn't resolve the issue so it
> > doesn't look like a race condition.
> > 
> > I can't reproduce with a normal cross compile on my machine. Buildroot
> > uses make -C, in case that makes a difference.
> > 
> > The build steps look like this:
> > 
> > bzcat /localdev/jms/buildroot/dl/kvm-unit-tests/kvm-unit-tests-v2025-06-05.tar.bz2
> > | /localdev/jms/buildroot/output-riscv-rvv/host/bin/tar
> > --strip-components=1 -C
> > /localdev/jms/buildroot/output-riscv-rvv/build/kvm-unit-tests-2025-06-05
> >   -xf -
> > cd /localdev/jms/buildroot/output-riscv-rvv/build/kvm-unit-tests-2025-06-05
> > && ./configure --disable-werror --arch="riscv64" --processor=""
> > --endian="little"
> > --cross-prefix="/localdev/jms/buildroot/output-riscv-rvv/host/bin/riscv64-buildroot-linux-gnu-"
> > GIT_DIR=. PATH="/localdev/jms/buildroot/output-riscv-rvv/host/bin:/localdev/jms/buildroot/output-riscv-rvv/host/sbin:/home/jms/.local/bin:/home/jms/bin:/home/jms/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
> > /usr/bin/make -j385  -C
> > /localdev/jms/buildroot/output-riscv-rvv/build/kvm-unit-tests-2025-06-05
> > standalone
> 
> I applied similar steps but couldn't reproduce this. It also looks like we
> have a dependency because configuring with '--cc=/path/to/mygcc', where
> mygcc is
> 
>    #!/bin/bash
>    for x in $@; do
>        if [[ $x =~ sbi-asm ]] && ! [[ $x =~ sbi-asm-offsets ]]; then
>            sleep 5
>            break
>        fi
>    done
>    /path/to/riscv64-linux-gnu-gcc $@
> 
> stalls the build 5 seconds when compiling sbi-asm.S but doesn't reproduce
> the issue. That said, running make with -d shows that riscv/sbi-asm.o is
> an implicit prerequisite, although so are other files. I'm using
> GNU Make 4.4.1. Which version are you using?
> 
> Also, while the steps above shouldn't cause problems, they are a bit odd
>  * '--endian' only applies to ppc64
>  * -j385 is quite large and specific. Typicall -j$(nproc) is recommended.
>  * No need for '-C "$PWD"'

Thanks for taking a look, it's Make 4.2.1 at least. I tracked it down
to second expansion barfing when the variable name has a / in it. It
looks like it can be fixed with the below, so I didn't look too closely
at whether that's a bug, in what versions, or not previously supported
because I was able to fix it like this.

Thanks,
Nick

    build: work around second expansion limitation with some Make versions
    
    GNU Make 4.2.1 as shipped in Ubuntu 20.04 has a problem with secondary
    expansion and variable names containing the '/' character. Make 4.3 and
    4.4 don't have the problem.
    
    Avoid putting the riscv/ directory name in the sbi-deps variable, and
    instead strip the directory off the target name when turning it into
    the dependency variable name.

diff --git a/riscv/Makefile b/riscv/Makefile
index beaeaefa..64720c38 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -18,12 +18,12 @@ tests += $(TEST_DIR)/isa-dbltrp.$(exe)
 
 all: $(tests)
 
-$(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-asm.o
-$(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-dbtr.o
-$(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-fwft.o
-$(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-sse.o
+sbi-deps += $(TEST_DIR)/sbi-asm.o
+sbi-deps += $(TEST_DIR)/sbi-dbtr.o
+sbi-deps += $(TEST_DIR)/sbi-fwft.o
+sbi-deps += $(TEST_DIR)/sbi-sse.o
 
-all_deps += $($(TEST_DIR)/sbi-deps)
+all_deps += $(sbi-deps)
 
 # When built for EFI sieve needs extra memory, run with e.g. '-m 256' on QEMU
 $(TEST_DIR)/sieve.$(exe): AUXFLAGS = 0x1
@@ -113,7 +113,7 @@ cflatobjs += lib/efi.o
 .PRECIOUS: %.so
 
 %.so: EFI_LDFLAGS += -defsym=EFI_SUBSYSTEM=0xa --no-undefined
-%.so: %.o $(FLATLIBS) $(SRCDIR)/riscv/efi/elf_riscv64_efi.lds $(cstart.o) %.aux.o $$($$*-deps)
+%.so: %.o $(FLATLIBS) $(SRCDIR)/riscv/efi/elf_riscv64_efi.lds $(cstart.o) %.aux.o $$($$(notdir $$*)-deps)
 	$(LD) $(EFI_LDFLAGS) -o $@ -T $(SRCDIR)/riscv/efi/elf_riscv64_efi.lds \
 		$(filter %.o, $^) $(FLATLIBS) $(EFI_LIBS)
 
@@ -129,7 +129,7 @@ cflatobjs += lib/efi.o
 		-O binary $^ $@
 else
 %.elf: LDFLAGS += -pie -n -z notext
-%.elf: %.o $(FLATLIBS) $(SRCDIR)/riscv/flat.lds $(cstart.o) %.aux.o $$($$*-deps)
+%.elf: %.o $(FLATLIBS) $(SRCDIR)/riscv/flat.lds $(cstart.o) %.aux.o $$($$(notdir $$*)-deps)
 	$(LD) $(LDFLAGS) -o $@ -T $(SRCDIR)/riscv/flat.lds \
 		$(filter %.o, $^) $(FLATLIBS)
 	@chmod a-x $@

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
