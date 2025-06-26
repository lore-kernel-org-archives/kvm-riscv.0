Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEE4C7EE31
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 16:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Oh1meU+wNtmA6Nj+SnOirv1QBOfrwIoT5jzrp6WMJw=; b=gEBooF69J37Pwd
	5GSVgX0hWx47Bqfq6lD5A6CZQHnRBYzGEAn8agabW9TQyh9tehb/9j3Y805JAN2gufCgbDazvJfO6
	uT60X/F60t2mo/+t9417FlmPtQMO7NmJnUjWr2iGNQ6ywsnNFA0ZyF3AU6d/JfJARGEEcpAacowh3
	MZH2NsDQdLzayu25PeOn+KSHSedgHPalxT9DJZSrCE9+dQ5TC8gkll9t3eCZq5mPpafTCvNshYi+b
	EhqEYb0wzigu2twH14ryQ3x8SuPy6pU6zWE3rwf2B1JYcXlhl5WYSDOM2zCn3uMvJYRHTN2kUAIH/
	u1tQ+8HU5XAqpWEADMAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUply-0000000CJ6p-0sCg;
	Thu, 26 Jun 2025 16:48:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUplv-0000000CJ46-1gKi
	for kvm-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 16:48:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D19971758;
	Thu, 26 Jun 2025 09:48:02 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B45F3F66E;
	Thu, 26 Jun 2025 09:48:15 -0700 (PDT)
Date: Thu, 26 Jun 2025 17:48:03 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
	david@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org,
	oliver.upton@linux.dev, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joey.gouly@arm.com, andre.przywara@arm.com,
	shahuang@redhat.com
Subject: Re: [kvm-unit-tests PATCH v4 00/13] arm/arm64: Add kvmtool to the
 runner script
Message-ID: <aF15wzSHKxYZig3N@raptor>
References: <20250625154813.27254-1-alexandru.elisei@arm.com>
 <20250626-f9239a18e811ef67ae5a9686@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250626-f9239a18e811ef67ae5a9686@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_094823_540519_977102F8 
X-CRM114-Status: GOOD (  37.50  )
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

On Thu, Jun 26, 2025 at 06:42:01PM +0200, Andrew Jones wrote:
> On Wed, Jun 25, 2025 at 04:48:00PM +0100, Alexandru Elisei wrote:
> > v3 can be found here [1]. Based on top of the series that add qemu_params and
> > test_args [2].
> > 
> > To goal is to allow the user to do:
> > 
> > $ ./configure --target=kvmtool
> > $ make clean && make
> > $ ./run_tests.sh
> > 
> > to run all the tests automatically with kvmtool.
> > 
> > Reasons to use kvmtool:
> > 
> > * kvmtool is smaller and a lot easier to modify compared to qemu, which
> > means developers may prefer it when adding or prototyping new features to
> > KVM, and being able to run all the tests reliably and automatically is very
> > useful.
> > 
> > * kvmtool is faster to run the tests (a couple of times faster on
> > my rockpro64), making for a quick turnaround. But do keep in mind that not
> > all tests work on kvmtool because of missing features compared to qemu.
> > 
> > * kvmtool does things differently than qemu: different memory layout,
> > different uart, PMU emulation is disabled by default, etc. This makes it a
> > good testing vehicule for kvm-unit-tests itself.
> 
> Thanks for this Alex! I didn't test it on arm yet, but I did test it on
> riscv with the quick patch below. It works great.

From a glance, the patch looks ok to me.

> 
> Applied to arm/queue
> 
> https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/arm/queue

Thanks!

Alex

> 
> drew
> 
> 
> diff --git a/README.md b/README.md
> index 723ce04cd978..cbd8a9940ec4 100644
> --- a/README.md
> +++ b/README.md
> @@ -65,8 +65,8 @@ or:
>  
>  to run them all.
>  
> -All tests can be run using QEMU. On arm and arm64, tests can also be run using
> -kvmtool.
> +All tests can be run using QEMU. On arm, arm64, riscv32, and riscv64 tests can
> +also be run using kvmtool.
>  
>  By default the runner script searches for a suitable QEMU binary in the system.
>  To select a specific QEMU binary though, specify the QEMU=path/to/binary
> @@ -97,8 +97,7 @@ variable. kvmtool supports only kvm as the accelerator.
>  
>  Check [x86/efi/README.md](./x86/efi/README.md).
>  
> -On arm and arm64, this is only supported with QEMU; kvmtool cannot run the
> -tests under UEFI.
> +This is only supported with QEMU; kvmtool cannot run the tests under UEFI.
>  
>  # Tests configuration file
>  
> diff --git a/configure b/configure
> index 470f9d7cdb3b..4a9af4e0af30 100755
> --- a/configure
> +++ b/configure
> @@ -90,7 +90,7 @@ usage() {
>  	                           selects the best value based on the host system and the
>  	                           test configuration.
>  	    --target=TARGET        target platform that the tests will be running on (qemu or
> -	                           kvmtool, default is qemu) (arm/arm64 only)
> +	                           kvmtool, default is qemu) (arm/arm64 and riscv32/riscv64 only)
>  	    --cross-prefix=PREFIX  cross compiler prefix
>  	    --cc=CC                c compiler to use ($cc)
>  	    --cflags=FLAGS         extra options to be passed to the c compiler
> @@ -284,7 +284,8 @@ fi
>  if [ -z "$target" ]; then
>      target="qemu"
>  else
> -    if [ "$arch" != "arm64" ] && [ "$arch" != "arm" ]; then
> +    if [ "$arch" != "arm64" ] && [ "$arch" != "arm" ] &&
> +       [ "$arch" != "riscv32" ] && [ "$arch" != "riscv64" ]; then
>          echo "--target is not supported for $arch"
>          usage
>      fi
> @@ -393,6 +394,10 @@ elif [ "$arch" = "riscv32" ] || [ "$arch" = "riscv64" ]; then
>      testdir=riscv
>      arch_libdir=riscv
>      : "${uart_early_addr:=0x10000000}"
> +    if [ "$target" != "qemu" ] && [ "$target" != "kvmtool" ]; then
> +        echo "--target must be one of 'qemu' or 'kvmtool'!"
> +        usage
> +    fi
>  elif [ "$arch" = "s390x" ]; then
>      testdir=s390x
>  else
> @@ -519,7 +524,8 @@ EFI_DIRECT=$efi_direct
>  CONFIG_WERROR=$werror
>  GEN_SE_HEADER=$gen_se_header
>  EOF
> -if [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
> +if [ "$arch" = "arm" ] || [ "$arch" = "arm64" ] ||
> +   [ "$arch" = "riscv32" ] || [ "$arch" = "riscv64" ]; then
>      echo "TARGET=$target" >> config.mak
>  fi
>  
> diff --git a/riscv/efi/run b/riscv/efi/run
> index 5a72683a6ef5..b9b75440c659 100755
> --- a/riscv/efi/run
> +++ b/riscv/efi/run
> @@ -11,6 +11,12 @@ if [ ! -f config.mak ]; then
>  fi
>  source config.mak
>  source scripts/arch-run.bash
> +source scripts/vmm.bash
> +
> +if [[ $(vmm_get_target) == "kvmtool" ]]; then
> +	echo "kvmtool does not support EFI tests."
> +	exit 2
> +fi
>  
>  if [ -f RISCV_VIRT_CODE.fd ]; then
>  	DEFAULT_UEFI=RISCV_VIRT_CODE.fd
> diff --git a/riscv/run b/riscv/run
> index 0f000f0d82c6..3c242923412c 100755
> --- a/riscv/run
> +++ b/riscv/run
> @@ -10,35 +10,75 @@ if [ -z "$KUT_STANDALONE" ]; then
>  	source scripts/vmm.bash
>  fi
>  
> -# Allow user overrides of some config.mak variables
> -mach=$MACHINE_OVERRIDE
> -qemu_cpu=$TARGET_CPU_OVERRIDE
> -firmware=$FIRMWARE_OVERRIDE
> -
> -: "${mach:=virt}"
> -: "${qemu_cpu:=$TARGET_CPU}"
> -: "${qemu_cpu:=$DEFAULT_QEMU_CPU}"
> -: "${firmware:=$FIRMWARE}"
> -[ "$firmware" ] && firmware="-bios $firmware"
> -
> -set_qemu_accelerator || exit $?
> -[ "$ACCEL" = "kvm" ] && QEMU_ARCH=$HOST
> -acc="-accel $ACCEL$ACCEL_PROPS"
> -
> -qemu=$(search_qemu_binary) || exit $?
> -if [ "$mach" = 'virt' ] && ! $qemu -machine '?' | grep -q 'RISC-V VirtIO board'; then
> -	echo "$qemu doesn't support mach-virt ('-machine virt'). Exiting."
> -	exit 2
> -fi
> -mach="-machine $mach"
> +vmm_check_supported
>  
> -command="$qemu -nodefaults -nographic -serial mon:stdio"
> -command+=" $mach $acc $firmware -cpu $qemu_cpu "
> -command="$(migration_cmd) $(timeout_cmd) $command"
> +function arch_run_qemu()
> +{
> +	# Allow user overrides of some config.mak variables
> +	mach=$MACHINE_OVERRIDE
> +	qemu_cpu=$TARGET_CPU_OVERRIDE
> +	firmware=$FIRMWARE_OVERRIDE
>  
> -if [ "$UEFI_SHELL_RUN" = "y" ]; then
> -	ENVIRON_DEFAULT=n run_test_status $command "$@"
> -else
> -	# We return the exit code via stdout, not via the QEMU return code
> -	run_test_status $command -kernel "$@"
> -fi
> +	: "${mach:=virt}"
> +	: "${qemu_cpu:=$TARGET_CPU}"
> +	: "${qemu_cpu:=$DEFAULT_QEMU_CPU}"
> +	: "${firmware:=$FIRMWARE}"
> +	[ "$firmware" ] && firmware="-bios $firmware"
> +
> +	set_qemu_accelerator || exit $?
> +	[ "$ACCEL" = "kvm" ] && QEMU_ARCH=$HOST
> +	acc="-accel $ACCEL$ACCEL_PROPS"
> +
> +	qemu=$(search_qemu_binary) || exit $?
> +	if [ "$mach" = 'virt' ] && ! $qemu -machine '?' | grep -q 'RISC-V VirtIO board'; then
> +		echo "$qemu doesn't support mach-virt ('-machine virt'). Exiting."
> +		exit 2
> +	fi
> +	mach="-machine $mach"
> +
> +	command="$qemu -nodefaults -nographic -serial mon:stdio"
> +	command+=" $mach $acc $firmware -cpu $qemu_cpu "
> +	command="$(migration_cmd) $(timeout_cmd) $command"
> +
> +	if [ "$UEFI_SHELL_RUN" = "y" ]; then
> +		ENVIRON_DEFAULT=n run_test_status $command "$@"
> +	else
> +		# We return the exit code via stdout, not via the QEMU return code
> +		run_test_status $command -kernel "$@"
> +	fi
> +}
> +
> +function arch_run_kvmtool()
> +{
> +	local command
> +
> +	kvmtool=$(search_kvmtool_binary) ||
> +		exit $?
> +
> +	if [ "$ACCEL" ] && [ "$ACCEL" != "kvm" ]; then
> +		echo "kvmtool does not support $ACCEL" >&2
> +		exit 2
> +	fi
> +
> +	if ! kvm_available; then
> +		echo "kvmtool requires KVM but not available on the host" >&2
> +		exit 2
> +	fi
> +
> +	command="$(timeout_cmd) $kvmtool run"
> +	if [ "$HOST" = "riscv64" ] && [ "$ARCH" = "riscv32" ]; then
> +		echo "Cannot run riscv32 on riscv64" >&2
> +		exit 2
> +	else
> +		run_test_status $command --kernel "$@"
> +	fi
> +}
> +
> +case $(vmm_get_target) in
> +qemu)
> +	arch_run_qemu "$@"
> +	;;
> +kvmtool)
> +	arch_run_kvmtool "$@"
> +	;;
> +esac

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
