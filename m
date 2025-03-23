Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97A9C28B30
	for <kvm-riscv@archiver.kernel.org>; Sun, 23 Mar 2025 11:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJG6lBZsauxZEa30uTnDRWd0C5QL4D3k6WCCwqVD4aE=; b=sAAmG5vuSCL0OF
	SqhNQJ3VNbEfASufoKpEuYqIHeI8VKItSQGVgmdI9UCGVrxNYKEk7VVzFx/U/z/jXefRe9ljwbH9E
	Q2E2IO0xWVoJECUVZpcfcjQTxk37HdG0vYz3lmQTiGqp/tS8CnGAQ8qBy3sYn5m0bJpB8Eqbzf5Az
	r2A7+5B/g9Vm/aZ2Abz7A0KSvXnYnF05he3cgUVe+1rIJJ2doYiunkBC62GtfeYQsWBBJP5xYI55f
	o2wQ9f/K0VCgcw9mTGnOyN3fWpuTjqxjNKzUUs7EwegZoEdg/tDtoKkjDl7wh1/WEYqmOuQTfnu5b
	NvQdr9WLR35v0Bk1IuJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twJJd-000000015RI-3KyJ;
	Sun, 23 Mar 2025 11:16:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twJJb-000000015PE-1Vwu
	for kvm-riscv@lists.infradead.org;
	Sun, 23 Mar 2025 11:16:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74F92106F;
	Sun, 23 Mar 2025 04:16:30 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A9623F694;
	Sun, 23 Mar 2025 04:16:22 -0700 (PDT)
Date: Sun, 23 Mar 2025 11:16:19 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, eric.auger@redhat.com,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 4/5] configure: Add --qemu-cpu option
Message-ID: <Z9_tg6WhKvIJtBai@raptor>
References: <20250314154904.3946484-2-jean-philippe@linaro.org>
 <20250314154904.3946484-6-jean-philippe@linaro.org>
 <20250322-91a8125ad8651b24246e5799@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250322-91a8125ad8651b24246e5799@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_041627_495565_3019A071 
X-CRM114-Status: GOOD (  31.13  )
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

Hi Drew,

On Sat, Mar 22, 2025 at 12:26:59PM +0100, Andrew Jones wrote:
> On Fri, Mar 14, 2025 at 03:49:04PM +0000, Jean-Philippe Brucker wrote:
> > Add the --qemu-cpu option to let users set the CPU type to run on.
> > At the moment --processor allows to set both GCC -mcpu flag and QEMU
> > -cpu. On Arm we'd like to pass `-cpu max` to QEMU in order to enable all
> > the TCG features by default, and it could also be nice to let users
> > modify the CPU capabilities by setting extra -cpu options.
> > Since GCC -mcpu doesn't accept "max" or "host", separate the compiler
> > and QEMU arguments.
> > 
> > `--processor` is now exclusively for compiler options, as indicated by
> > its documentation ("processor to compile for"). So use $QEMU_CPU on
> > RISC-V as well.
> > 
> > Suggested-by: Andrew Jones <andrew.jones@linux.dev>
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >  scripts/mkstandalone.sh |  2 +-
> >  arm/run                 | 17 +++++++++++------
> >  riscv/run               |  8 ++++----
> >  configure               |  7 +++++++
> >  4 files changed, 23 insertions(+), 11 deletions(-)
> > 
> > diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
> > index 2318a85f..6b5f725d 100755
> > --- a/scripts/mkstandalone.sh
> > +++ b/scripts/mkstandalone.sh
> > @@ -42,7 +42,7 @@ generate_test ()
> >  
> >  	config_export ARCH
> >  	config_export ARCH_NAME
> > -	config_export PROCESSOR
> > +	config_export QEMU_CPU
> >  
> >  	echo "echo BUILD_HEAD=$(cat build-head)"
> >  
> > diff --git a/arm/run b/arm/run
> > index efdd44ce..561bafab 100755
> > --- a/arm/run
> > +++ b/arm/run
> > @@ -8,7 +8,7 @@ if [ -z "$KUT_STANDALONE" ]; then
> >  	source config.mak
> >  	source scripts/arch-run.bash
> >  fi
> > -processor="$PROCESSOR"
> > +qemu_cpu="$QEMU_CPU"
> >  
> >  if [ "$QEMU" ] && [ -z "$ACCEL" ] &&
> >     [ "$HOST" = "aarch64" ] && [ "$ARCH" = "arm" ] &&
> > @@ -37,12 +37,17 @@ if [ "$ACCEL" = "kvm" ]; then
> >  	fi
> >  fi
> >  
> > -if [ "$ACCEL" = "kvm" ] || [ "$ACCEL" = "hvf" ]; then
> > -	if [ "$HOST" = "aarch64" ] || [ "$HOST" = "arm" ]; then
> > -		processor="host"
> > +if [ -z "$qemu_cpu" ]; then
> > +	if ( [ "$ACCEL" = "kvm" ] || [ "$ACCEL" = "hvf" ] ) &&
> > +	   ( [ "$HOST" = "aarch64" ] || [ "$HOST" = "arm" ] ); then
> > +		qemu_cpu="host"
> >  		if [ "$ARCH" = "arm" ] && [ "$HOST" = "aarch64" ]; then
> > -			processor+=",aarch64=off"
> > +			qemu_cpu+=",aarch64=off"
> >  		fi
> > +	elif [ "$ARCH" = "arm64" ]; then
> > +		qemu_cpu="cortex-a57"
> > +	else
> > +		qemu_cpu="cortex-a15"
> 
> configure could set this in config.mak as DEFAULT_PROCESSOR, avoiding the
> need to duplicate it here.

That was my first instinct too, having the default value in config.mak seemed
like the correct solution.

But the problem with this is that the default -cpu type depends on -accel (set
via unittests.cfg or as an environment variable), host and test architecture
combination. All of these variables are known only at runtime.

Let's say we have DEFAULT_QEMU_CPU=cortex-a57 in config.mak. If we keep the
above heuristic, arm/run will override it with host,aarch64=off. IMO, having it
in config.mak, but arm/run using it only under certain conditions is worse than
not having it at all. arm/run choosing the default value **all the time** is at
least consistent.

We could modify the help text for --qemu-cpu to say something like "If left
unset, the $ARCH/run script will choose a best value based on the host system
and test configuration."

Thanks,
Alex

> 
> >  	fi
> >  fi
> >  
> > @@ -71,7 +76,7 @@ if $qemu $M -device '?' | grep -q pci-testdev; then
> >  fi
> >  
> >  A="-accel $ACCEL$ACCEL_PROPS"
> > -command="$qemu -nodefaults $M $A -cpu $processor $chr_testdev $pci_testdev"
> > +command="$qemu -nodefaults $M $A -cpu $qemu_cpu $chr_testdev $pci_testdev"
> >  command+=" -display none -serial stdio"
> >  command="$(migration_cmd) $(timeout_cmd) $command"
> >  
> > diff --git a/riscv/run b/riscv/run
> > index e2f5a922..02fcf0c0 100755
> > --- a/riscv/run
> > +++ b/riscv/run
> > @@ -11,12 +11,12 @@ fi
> >  
> >  # Allow user overrides of some config.mak variables
> >  mach=$MACHINE_OVERRIDE
> > -processor=$PROCESSOR_OVERRIDE
> > +qemu_cpu=$QEMU_CPU_OVERRIDE
> >  firmware=$FIRMWARE_OVERRIDE
> >  
> > -[ "$PROCESSOR" = "$ARCH" ] && PROCESSOR="max"
> > +[ -z "$QEMU_CPU" ] && QEMU_CPU="max"
> >  : "${mach:=virt}"
> > -: "${processor:=$PROCESSOR}"
> > +: "${qemu_cpu:=$QEMU_CPU}"
> >  : "${firmware:=$FIRMWARE}"
> >  [ "$firmware" ] && firmware="-bios $firmware"
> >  
> > @@ -32,7 +32,7 @@ fi
> >  mach="-machine $mach"
> >  
> >  command="$qemu -nodefaults -nographic -serial mon:stdio"
> > -command+=" $mach $acc $firmware -cpu $processor "
> > +command+=" $mach $acc $firmware -cpu $qemu_cpu "
> >  command="$(migration_cmd) $(timeout_cmd) $command"
> >  
> >  if [ "$UEFI_SHELL_RUN" = "y" ]; then
> > diff --git a/configure b/configure
> > index 5306bad3..d25bd23e 100755
> > --- a/configure
> > +++ b/configure
> > @@ -52,6 +52,7 @@ page_size=
> >  earlycon=
> >  efi=
> >  efi_direct=
> > +qemu_cpu=
> >  
> >  # Enable -Werror by default for git repositories only (i.e. developer builds)
> >  if [ -e "$srcdir"/.git ]; then
> > @@ -69,6 +70,8 @@ usage() {
> >  	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
> >  	                           arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> >  	    --processor=PROCESSOR  processor to compile for ($processor)
> > +	    --qemu-cpu=CPU         the CPU model to run on. The default depends on
> > +	                           the configuration, usually it is "host" or "max".
> >  	    --target=TARGET        target platform that the tests will be running on (qemu or
> >  	                           kvmtool, default is qemu) (arm/arm64 only)
> >  	    --cross-prefix=PREFIX  cross compiler prefix
> > @@ -142,6 +145,9 @@ while [[ $optno -le $argc ]]; do
> >          --processor)
> >  	    processor="$arg"
> >  	    ;;
> > +	--qemu-cpu)
> > +	    qemu_cpu="$arg"
> > +	    ;;
> >  	--target)
> >  	    target="$arg"
> >  	    ;;
> > @@ -464,6 +470,7 @@ ARCH=$arch
> >  ARCH_NAME=$arch_name
> >  ARCH_LIBDIR=$arch_libdir
> >  PROCESSOR=$processor
> > +QEMU_CPU=$qemu_cpu
> >  CC=$cc
> >  CFLAGS=$cflags
> >  LD=$cross_prefix$ld
> > -- 
> > 2.48.1
> >
> 
> With the Alex's and Eric's requested changes to the help text,
> 
> Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
