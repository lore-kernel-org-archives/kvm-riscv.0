Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A671CA0FED
	for <kvm-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 19:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LAMe2UhZ2VbvqB0QBE0zD+Bxj1maSfk+QGGd+AqlRFs=; b=TZDCTjVxxa1Wz5
	olIhiOFMY+QZmwcooYsZfyCRSGQSL/BsaQ9UgIHGf+WZ1d2PpP7k4pr7j3QjAog6vrxtigK7Hm1VB
	/JVinXGLy94TPQ2DaCilFk6jSsNhk0Iqb157eDTjV7tgDrRaIXV8OlullEBTkjgsUPMLmKwCR4FCC
	kEi+QjIIQe6/H1/EnwMNEpgiQRKycT3vkywqvR/FK5mV5zPGqvV76ewq+WuF4Ncq/UpFtFB4XlAFy
	NwP7EDJbs87OH2WKdlZ/tA1w9dyaizJTmCefU1f+5LA6EfzZc4p+bSMe6rqKAbpnzEjO0mn7HVw0+
	BZ5fShjeY2Lyw4jSaSJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuc85-000000049i5-3V3i;
	Fri, 05 Sep 2025 19:29:49 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYPL-00000002mCy-2oM4
	for kvm-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 15:31:25 +0000
Date: Fri, 5 Sep 2025 10:31:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757086279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oSeZxdMsuw6Z2poCMeEkBswxhwvL2OzwHT8BiaKUwhg=;
	b=owBLh8CY+Jo16DSfNvepvejZHN+5nuXZKIMNLZPRudno405ir7arK0xzu0El3RoB6lB/iP
	pVgREAkR3BnY4pcRHeALllE1ccQ0Z3aIxp1QydMxLhUZJxUMY+3dqumlVrqQx27gUOxQoJ
	zBUzZ6ka88jkWtWdsyVh9PHbRAhbArc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, kvm-riscv@lists.infradead.org, 
	Buildroot Mailing List <buildroot@buildroot.org>, kvm@vger.kernel.org
Subject: Re: [kvm-unit-tests] riscv build failure
Message-ID: <20250905-d9a046fd4787ec78ab611495@orel>
References: <CACPK8XddfiKcS_-pYwG5b7i8pwh7ea-QDA=fwZgkP245Ad9ECQ@mail.gmail.com>
 <20250904-11ba6fa251f914016170c0e4@orel>
 <csh2fzymze636erajmsu5d55id6fpfsnvypkz3at7anp5i35uw@fhn2qgz327vj>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <csh2fzymze636erajmsu5d55id6fpfsnvypkz3at7anp5i35uw@fhn2qgz327vj>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_083124_157027_B22C777B 
X-CRM114-Status: GOOD (  33.51  )
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

On Fri, Sep 05, 2025 at 06:26:55PM +1000, Nicholas Piggin wrote:
> On Thu, Sep 04, 2025 at 05:17:45PM -0500, Andrew Jones wrote:
> > On Thu, Sep 04, 2025 at 08:57:54AM +0930, Joel Stanley wrote:
> > > I'm building kvm-unit-tests as part of buildroot and hitting a build
> > > failure. It looks like there's a missing dependency on
> > > riscv/sbi-asm.S, as building that manually fixes the issue. Triggering
> > > buildroot again (several times) doesn't resolve the issue so it
> > > doesn't look like a race condition.
> > > 
> > > I can't reproduce with a normal cross compile on my machine. Buildroot
> > > uses make -C, in case that makes a difference.
> > > 
> > > The build steps look like this:
> > > 
> > > bzcat /localdev/jms/buildroot/dl/kvm-unit-tests/kvm-unit-tests-v2025-06-05.tar.bz2
> > > | /localdev/jms/buildroot/output-riscv-rvv/host/bin/tar
> > > --strip-components=1 -C
> > > /localdev/jms/buildroot/output-riscv-rvv/build/kvm-unit-tests-2025-06-05
> > >   -xf -
> > > cd /localdev/jms/buildroot/output-riscv-rvv/build/kvm-unit-tests-2025-06-05
> > > && ./configure --disable-werror --arch="riscv64" --processor=""
> > > --endian="little"
> > > --cross-prefix="/localdev/jms/buildroot/output-riscv-rvv/host/bin/riscv64-buildroot-linux-gnu-"
> > > GIT_DIR=. PATH="/localdev/jms/buildroot/output-riscv-rvv/host/bin:/localdev/jms/buildroot/output-riscv-rvv/host/sbin:/home/jms/.local/bin:/home/jms/bin:/home/jms/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
> > > /usr/bin/make -j385  -C
> > > /localdev/jms/buildroot/output-riscv-rvv/build/kvm-unit-tests-2025-06-05
> > > standalone
> > 
> > I applied similar steps but couldn't reproduce this. It also looks like we
> > have a dependency because configuring with '--cc=/path/to/mygcc', where
> > mygcc is
> > 
> >    #!/bin/bash
> >    for x in $@; do
> >        if [[ $x =~ sbi-asm ]] && ! [[ $x =~ sbi-asm-offsets ]]; then
> >            sleep 5
> >            break
> >        fi
> >    done
> >    /path/to/riscv64-linux-gnu-gcc $@
> > 
> > stalls the build 5 seconds when compiling sbi-asm.S but doesn't reproduce
> > the issue. That said, running make with -d shows that riscv/sbi-asm.o is
> > an implicit prerequisite, although so are other files. I'm using
> > GNU Make 4.4.1. Which version are you using?
> > 
> > Also, while the steps above shouldn't cause problems, they are a bit odd
> >  * '--endian' only applies to ppc64
> >  * -j385 is quite large and specific. Typicall -j$(nproc) is recommended.
> >  * No need for '-C "$PWD"'
> 
> Thanks for taking a look, it's Make 4.2.1 at least. I tracked it down
> to second expansion barfing when the variable name has a / in it. It
> looks like it can be fixed with the below, so I didn't look too closely
> at whether that's a bug, in what versions, or not previously supported
> because I was able to fix it like this.
> 
> Thanks,
> Nick
> 
>     build: work around second expansion limitation with some Make versions
>     
>     GNU Make 4.2.1 as shipped in Ubuntu 20.04 has a problem with secondary
>     expansion and variable names containing the '/' character. Make 4.3 and
>     4.4 don't have the problem.
>     
>     Avoid putting the riscv/ directory name in the sbi-deps variable, and
>     instead strip the directory off the target name when turning it into
>     the dependency variable name.
> 
> diff --git a/riscv/Makefile b/riscv/Makefile
> index beaeaefa..64720c38 100644
> --- a/riscv/Makefile
> +++ b/riscv/Makefile
> @@ -18,12 +18,12 @@ tests += $(TEST_DIR)/isa-dbltrp.$(exe)
>  
>  all: $(tests)
>  
> -$(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-asm.o
> -$(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-dbtr.o
> -$(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-fwft.o
> -$(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-sse.o
> +sbi-deps += $(TEST_DIR)/sbi-asm.o
> +sbi-deps += $(TEST_DIR)/sbi-dbtr.o
> +sbi-deps += $(TEST_DIR)/sbi-fwft.o
> +sbi-deps += $(TEST_DIR)/sbi-sse.o
>  
> -all_deps += $($(TEST_DIR)/sbi-deps)
> +all_deps += $(sbi-deps)
>  
>  # When built for EFI sieve needs extra memory, run with e.g. '-m 256' on QEMU
>  $(TEST_DIR)/sieve.$(exe): AUXFLAGS = 0x1
> @@ -113,7 +113,7 @@ cflatobjs += lib/efi.o
>  .PRECIOUS: %.so
>  
>  %.so: EFI_LDFLAGS += -defsym=EFI_SUBSYSTEM=0xa --no-undefined
> -%.so: %.o $(FLATLIBS) $(SRCDIR)/riscv/efi/elf_riscv64_efi.lds $(cstart.o) %.aux.o $$($$*-deps)
> +%.so: %.o $(FLATLIBS) $(SRCDIR)/riscv/efi/elf_riscv64_efi.lds $(cstart.o) %.aux.o $$($$(notdir $$*)-deps)
>  	$(LD) $(EFI_LDFLAGS) -o $@ -T $(SRCDIR)/riscv/efi/elf_riscv64_efi.lds \
>  		$(filter %.o, $^) $(FLATLIBS) $(EFI_LIBS)
>  
> @@ -129,7 +129,7 @@ cflatobjs += lib/efi.o
>  		-O binary $^ $@
>  else
>  %.elf: LDFLAGS += -pie -n -z notext
> -%.elf: %.o $(FLATLIBS) $(SRCDIR)/riscv/flat.lds $(cstart.o) %.aux.o $$($$*-deps)
> +%.elf: %.o $(FLATLIBS) $(SRCDIR)/riscv/flat.lds $(cstart.o) %.aux.o $$($$(notdir $$*)-deps)
>  	$(LD) $(LDFLAGS) -o $@ -T $(SRCDIR)/riscv/flat.lds \
>  		$(filter %.o, $^) $(FLATLIBS)
>  	@chmod a-x $@

Thanks, Nicholas.

This looks good to me. Can you please send as an independent patch with
your sign-off?

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
