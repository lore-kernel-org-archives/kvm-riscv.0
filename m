Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4679FC3600B
	for <kvm-riscv@archiver.kernel.org>; Mon, 31 Mar 2025 13:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kZi4FPHHD1JsCyqM89eyCnJydPjmtIZ3JTSDG80yjf0=; b=EVtFOQsT9GlL+D
	PIWftll+ii3OOUDtilBaThoAPIfoN1KrUXX8HIxVnIQAPcmKe8paIlNoDYc54upC7d8TAJcoZF/09
	BJn1/glaAKAhKhFK0luy9tJKA+KQibOIX4c2utBCoZEoaC49BVuBUAen56mklbxtY6TiBYptsDhl7
	CcpAn5CX7+3oQZUFN4Cjk1BieJiFsL2XbputWTkfDMsK3RUds07O8hTFJ80kmKjFfQOlpi1uICweE
	C+zmywAm90Rri9kjszTt4W0vtgZtwQVCyvWmtPR5u7OvzVfFOtVfZ85IJ6kxYjIVvy11kGDqCk2h5
	Bf2hNVVIrUxTmcL8HBwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFbw-00000000UbE-2YKf;
	Mon, 31 Mar 2025 13:55:32 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFbO-00000000UVu-22h7
	for kvm-riscv@lists.infradead.org;
	Mon, 31 Mar 2025 13:55:01 +0000
Date: Mon, 31 Mar 2025 15:54:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743429284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1pj9Mgf9/7BDpyZNmQYfwtt/XC9QiCZdJQaI7DnM3Ag=;
	b=qi5NsyOHbHr3uo9gdtAcMDfdJPeSJor7+G2XGFYIkKqnFIZA6bWSLoNVjydDT2xokOGhgj
	MuyfMjXn9T2GkKz61Pb3O3S+1w7KG5e3oYYNOtzfLio2zMBYlEt1vBqcFqREE+X5OIdS7R
	VbhS/++zxnrPrXPV1IBV3cf2tCc7NkA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, 
	eric.auger@redhat.com, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v3 4/5] configure: Add --qemu-cpu option
Message-ID: <20250331-11789f26d058d11c1aeeaa51@orel>
References: <20250325160031.2390504-3-jean-philippe@linaro.org>
 <20250325160031.2390504-7-jean-philippe@linaro.org>
 <Z-WHf02_ZQKwzQej@raptor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z-WHf02_ZQKwzQej@raptor>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_065458_668111_4E1160A5 
X-CRM114-Status: GOOD (  33.91  )
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

On Thu, Mar 27, 2025 at 05:14:39PM +0000, Alexandru Elisei wrote:
> Hi Jean-Philippe,
> 
> On Tue, Mar 25, 2025 at 04:00:32PM +0000, Jean-Philippe Brucker wrote:
> > Add the --qemu-cpu option to let users set the CPU type to run on.
> > At the moment --processor allows to set both GCC -mcpu flag and QEMU
> > -cpu. On Arm we'd like to pass `-cpu max` to QEMU in order to enable all
> > the TCG features by default, and it could also be nice to let users
> > modify the CPU capabilities by setting extra -cpu options.  Since GCC
> > -mcpu doesn't accept "max" or "host", separate the compiler and QEMU
> > arguments.
> > 
> > `--processor` is now exclusively for compiler options, as indicated by
> > its documentation ("processor to compile for"). So use $QEMU_CPU on
> > RISC-V as well.
> > 
> > Suggested-by: Andrew Jones <andrew.jones@linux.dev>
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >  scripts/mkstandalone.sh |  3 ++-
> >  arm/run                 | 15 +++++++++------
> >  riscv/run               |  8 ++++----
> >  configure               | 24 ++++++++++++++++++++++++
> >  4 files changed, 39 insertions(+), 11 deletions(-)
> > 
> > diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
> > index 2318a85f..9b4f983d 100755
> > --- a/scripts/mkstandalone.sh
> > +++ b/scripts/mkstandalone.sh
> > @@ -42,7 +42,8 @@ generate_test ()
> >  
> >  	config_export ARCH
> >  	config_export ARCH_NAME
> > -	config_export PROCESSOR
> > +	config_export QEMU_CPU
> > +	config_export DEFAULT_QEMU_CPU
> >  
> >  	echo "echo BUILD_HEAD=$(cat build-head)"
> >  
> > diff --git a/arm/run b/arm/run
> > index efdd44ce..4675398f 100755
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
> > @@ -37,12 +37,15 @@ if [ "$ACCEL" = "kvm" ]; then
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
> > +	else
> > +		qemu_cpu="$DEFAULT_QEMU_CPU"
> >  	fi
> >  fi
> >  
> > @@ -71,7 +74,7 @@ if $qemu $M -device '?' | grep -q pci-testdev; then
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
> 
> If you make DEFAULT_QEMU_CPU=max for riscv, you can use it instead of "max",
> just like arm/arm64 does. Not sure if it's worth another respin.

Yup, we'll also need

diff --git a/configure b/configure
index b86ccc0c338b..541b9577a718 100755
--- a/configure
+++ b/configure
@@ -32,7 +32,7 @@ function get_default_qemu_cpu()
     "arm")
         echo "cortex-a15"
         ;;
-    "arm64")
+    "arm64" | "riscv32" | "riscv64")
         echo "max"
         ;;
     esac

Thanks,
drew

> 
> Otherwise the patch looks good to me.
> 
> Thanks,
> Alex
> 
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
> > index b4875ef3..b79145a5 100755
> > --- a/configure
> > +++ b/configure
> > @@ -23,6 +23,21 @@ function get_default_processor()
> >      esac
> >  }
> >  
> > +# Return the default CPU type to run on
> > +function get_default_qemu_cpu()
> > +{
> > +    local arch="$1"
> > +
> > +    case "$arch" in
> > +    "arm")
> > +        echo "cortex-a15"
> > +        ;;
> > +    "arm64")
> > +        echo "cortex-a57"
> > +        ;;
> > +    esac
> > +}
> > +
> >  srcdir=$(cd "$(dirname "$0")"; pwd)
> >  prefix=/usr/local
> >  cc=gcc
> > @@ -52,6 +67,7 @@ earlycon=
> >  console=
> >  efi=
> >  efi_direct=
> > +qemu_cpu=
> >  
> >  # Enable -Werror by default for git repositories only (i.e. developer builds)
> >  if [ -e "$srcdir"/.git ]; then
> > @@ -70,6 +86,9 @@ usage() {
> >  	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
> >  	                           arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> >  	    --processor=PROCESSOR  processor to compile for ($processor)
> > +	    --qemu-cpu=CPU         the CPU model to run on. If left unset, the run script
> > +	                           selects the best value based on the host system and the
> > +	                           test configuration.
> >  	    --target=TARGET        target platform that the tests will be running on (qemu or
> >  	                           kvmtool, default is qemu) (arm/arm64 only)
> >  	    --cross-prefix=PREFIX  cross compiler prefix
> > @@ -146,6 +165,9 @@ while [[ $optno -le $argc ]]; do
> >          --processor)
> >  	    processor="$arg"
> >  	    ;;
> > +	--qemu-cpu)
> > +	    qemu_cpu="$arg"
> > +	    ;;
> >  	--target)
> >  	    target="$arg"
> >  	    ;;
> > @@ -471,6 +493,8 @@ ARCH=$arch
> >  ARCH_NAME=$arch_name
> >  ARCH_LIBDIR=$arch_libdir
> >  PROCESSOR=$processor
> > +QEMU_CPU=$qemu_cpu
> > +DEFAULT_QEMU_CPU=$(get_default_qemu_cpu $arch)
> >  CC=$cc
> >  CFLAGS=$cflags
> >  LD=$cross_prefix$ld
> > -- 
> > 2.49.0
> > 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
