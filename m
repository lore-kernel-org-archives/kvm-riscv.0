Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F810C2D0CD
	for <kvm-riscv@archiver.kernel.org>; Mon, 19 May 2025 08:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QRfqewJBkCY0cVuzbiWaQ+4zEC9q8TKEEhz+YRegDEQ=; b=FLFeCDd9aMpje9
	6wYU2juRrJWKyG7IowvYCFdlBzQCUX5z7uVY8wdmqdhfn9qD2Y5gz7cHDrLqjicrl6p9s+llc9hQp
	LHP/JIo+L5bdt2ZrBeFhLsl+wWXytZ4g4KpNcAABHNlFvuQ1X9jYVsR+6IGOran8+djYlPHnwt75r
	GzZ+xG/oPX2y2QlXeeVAxlxgFIgHszrliwOLyoN4/tTJ3zGVONwfZfIEA+COOWOkBOZWZGrWC+vmK
	GI/DKsQHqdB3zBpxMk4YBwBj+KMeE95P7liHxFb/VPZCX+i2MVYdzLxP0f7hMB9xsH13UxhXC1JxG
	Me54lRplDi53ewwYTzdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGwIB-00000008RVz-3Ea2;
	Mon, 19 May 2025 08:56:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGwI7-00000008RTq-1ak2
	for kvm-riscv@lists.infradead.org;
	Mon, 19 May 2025 08:56:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747644969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+8sI82yq/f8FgFoZEta+4VkgQiL0NBrWh/StSsatWxk=;
	b=imp5kS8KYmh28ZnLLhaHbCqOuFRtFe9XuD5DCPgqB93099NUTeccOgh0wyVVJD4jMb3jyw
	HNtoqpx9DPBF7yo9oaM3giUOtO0XnsQxaHIe2tNaEgRl7vK5WEk1v08FfemBFu6q0MhJg/
	Bbhr7Kqnn7WWPzHEkejm/aBJ7GO5Gak=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-CK55zMFOMEiTka7QQI9pGg-1; Mon, 19 May 2025 04:56:08 -0400
X-MC-Unique: CK55zMFOMEiTka7QQI9pGg-1
X-Mimecast-MFC-AGG-ID: CK55zMFOMEiTka7QQI9pGg_1747644967
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-6c8f99fef10so4660376a12.3
        for <kvm-riscv@lists.infradead.org>; Mon, 19 May 2025 01:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747644967; x=1748249767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+8sI82yq/f8FgFoZEta+4VkgQiL0NBrWh/StSsatWxk=;
        b=faGymvYYGOu4ThjTYs9q6enjGXWMCUc5vBq48/C2NCls3R7TwI5VCLD8YPb9CCXQhe
         Yeq4fTYvmU42WeqzIZi3Tm+HDR6Q1IAX5XW4Krwf5EbJKSB1Ut+eQkbWijdo0Jh+XF0p
         yMan8UeqHJOgfiEzqNiaC+0xahuBN8YHm/pq98Il8sTToj7jhO/B+BsCGNbbHxafNEEU
         tIuOdFYV3xflOtTKU7sbyDqszNLNwDF7q5557oYSsbwomwvgT/VEq52J5iu6uoPepW8i
         ZQsVH25K1Um8EAjI9ltAjXYv2E2bog2fiGXiehystWzn14TZ3jL6mt47NlOwx4MSluoZ
         Z/3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEgcr+6n71Myzxa+KPN1QeLsL+wejlpvjlfWaUiN9IqdlQqm3I6091XDbxIUU1YrcyJOXpISiMkQk=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywskc4/lnU/jDCovOGcpCvfj57re3bE++wihoIOKy1L/YZMOoQZ
	db37/C75HMsOwkZpLZQyB+MPnK1RG7hZD9E/34vuS20c4zSg3DCXVxqsUR6TdMuCwaFRKBLuyzs
	v/dfiXuuITDOwkIS2zFNgRhDVD0jGiRcH1hv+R3+D8hw1JGZzbpbJp9CLEWObuhh7J0d9oimJFS
	7hTQ==
X-Gm-Gg: ASbGncs3yApKGIWCPbEl85eQWFefBYTtCeeEX4D+0A8PPvsOnpHp+0OfVWlb/nkrqMv
	pUt3rI93W1hL9QgnddKrtTZAfLpu8uwfrLDiERS7nL4w2bLWMC5GMPW4ho+KMQ2i+pjZRqrOfiZ
	HSqMJx0xeH01S6CxviOzZR7RTdePWyGsKE3Cx6vC6YLTZvKv45K1v53g6J1r+IB3bmuen7t0eDm
	9L5Lo+HrLloZeghQnVFS0q/TeqTkKZZ5UJ+6WfTUun0p6DXsXNzULeP7iLcmuw7lhv88iU/AMhl
	WnSoQiXOFdb9Qiai
X-Received: by 2002:a05:6a21:9208:b0:209:251d:47d2 with SMTP id adf61e73a8af0-2170cb2609dmr14733189637.11.1747644966760;
        Mon, 19 May 2025 01:56:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfWMc3DaNswLVk3gKWW45O5beN+npa+Ty5x6tqyEpyLBL1yIWrxHAXKN90bYSxUmk6KSXyfQ==
X-Received: by 2002:a05:6a21:9208:b0:209:251d:47d2 with SMTP id adf61e73a8af0-2170cb2609dmr14733145637.11.1747644966186;
        Mon, 19 May 2025 01:56:06 -0700 (PDT)
Received: from [10.72.116.146] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401a81sm10738870a91.2.2025.05.19.01.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 01:56:05 -0700 (PDT)
Message-ID: <8aae95b9-4444-4ede-9f27-7ff759b6586f@redhat.com>
Date: Mon, 19 May 2025 16:55:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v3 09/16] scripts: Add support for kvmtool
To: Alexandru Elisei <alexandru.elisei@arm.com>, andrew.jones@linux.dev,
 eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
 frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
 david@redhat.com, pbonzini@redhat.com
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, will@kernel.org, julien.thierry.kdev@gmail.com,
 maz@kernel.org, oliver.upton@linux.dev, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, joey.gouly@arm.com, andre.przywara@arm.com
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-10-alexandru.elisei@arm.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20250507151256.167769-10-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: urnf4k0BOQ6rdLS_ChYO3PPF5vFQuDA10LbAYcdGL-I_1747644967
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_015611_602376_BA5677A5 
X-CRM114-Status: GOOD (  31.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org



On 5/7/25 11:12 PM, Alexandru Elisei wrote:
> Teach the arm runner to use kvmtool when kvm-unit-tests has been configured
> appropriately.
> 
> The test is ran using run_test_status(), and a 0 return code (which means
> success) is converted to 1, because kvmtool does not have a testdev device
> to return the test exit code, so kvm-unit-tests must always parse the
> "EXIT: STATUS" line for the exit code.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Reviewed-by: Shaoqin Huang <shahuang@redhat.com>

> ---
>   arm/run               | 161 ++++++++++++++++++++++++++----------------
>   powerpc/run           |   4 +-
>   riscv/run             |   4 +-
>   s390x/run             |   2 +-
>   scripts/arch-run.bash | 112 +++++++++++------------------
>   scripts/vmm.bash      |  89 +++++++++++++++++++++++
>   x86/run               |   4 +-
>   7 files changed, 236 insertions(+), 140 deletions(-)
> 
> diff --git a/arm/run b/arm/run
> index 56562ed1628f..e3c4ffc49136 100755
> --- a/arm/run
> +++ b/arm/run
> @@ -12,80 +12,117 @@ fi
>   
>   check_vmm_supported
>   
> -qemu_cpu="$TARGET_CPU"
> -
> -if [ "$QEMU" ] && [ -z "$ACCEL" ] &&
> -   [ "$HOST" = "aarch64" ] && [ "$ARCH" = "arm" ] &&
> -   [ "$(basename $QEMU)" = "qemu-system-arm" ]; then
> -	ACCEL="tcg"
> -fi
> +function arch_run_qemu()
> +{
> +	qemu_cpu="$TARGET_CPU"
> +
> +	if [ "$QEMU" ] && [ -z "$ACCEL" ] &&
> +	   [ "$HOST" = "aarch64" ] && [ "$ARCH" = "arm" ] &&
> +	   [ "$(basename $QEMU)" = "qemu-system-arm" ]; then
> +		ACCEL="tcg"
> +	fi
>   
> -set_qemu_accelerator || exit $?
> -if [ "$ACCEL" = "kvm" ]; then
> -	QEMU_ARCH=$HOST
> -fi
> +	set_qemu_accelerator || exit $?
> +	if [ "$ACCEL" = "kvm" ]; then
> +		QEMU_ARCH=$HOST
> +	fi
>   
> -qemu=$(search_qemu_binary) ||
> -	exit $?
> +	qemu=$(search_qemu_binary) ||
> +		exit $?
>   
> -if ! $qemu -machine '?' | grep -q 'ARM Virtual Machine'; then
> -	echo "$qemu doesn't support mach-virt ('-machine virt'). Exiting."
> -	exit 2
> -fi
> +	if ! $qemu -machine '?' | grep -q 'ARM Virtual Machine'; then
> +		echo "$qemu doesn't support mach-virt ('-machine virt'). Exiting."
> +		exit 2
> +	fi
>   
> -M='-machine virt'
> +	M='-machine virt'
>   
> -if [ "$ACCEL" = "kvm" ]; then
> -	if $qemu $M,\? | grep -q gic-version; then
> -		M+=',gic-version=host'
> +	if [ "$ACCEL" = "kvm" ]; then
> +		if $qemu $M,\? | grep -q gic-version; then
> +			M+=',gic-version=host'
> +		fi
>   	fi
> -fi
>   
> -if [ -z "$qemu_cpu" ]; then
> -	if ( [ "$ACCEL" = "kvm" ] || [ "$ACCEL" = "hvf" ] ) &&
> -	   ( [ "$HOST" = "aarch64" ] || [ "$HOST" = "arm" ] ); then
> -		qemu_cpu="host"
> -		if [ "$ARCH" = "arm" ] && [ "$HOST" = "aarch64" ]; then
> -			qemu_cpu+=",aarch64=off"
> +	if [ -z "$qemu_cpu" ]; then
> +		if ( [ "$ACCEL" = "kvm" ] || [ "$ACCEL" = "hvf" ] ) &&
> +		   ( [ "$HOST" = "aarch64" ] || [ "$HOST" = "arm" ] ); then
> +			qemu_cpu="host"
> +			if [ "$ARCH" = "arm" ] && [ "$HOST" = "aarch64" ]; then
> +				qemu_cpu+=",aarch64=off"
> +			fi
> +		else
> +			qemu_cpu="$DEFAULT_QEMU_CPU"
>   		fi
> -	else
> -		qemu_cpu="$DEFAULT_QEMU_CPU"
>   	fi
> -fi
>   
> -if [ "$ARCH" = "arm" ]; then
> -	M+=",highmem=off"
> -fi
> +	if [ "$ARCH" = "arm" ]; then
> +		M+=",highmem=off"
> +	fi
>   
> -if ! $qemu $M -device '?' | grep -q virtconsole; then
> -	echo "$qemu doesn't support virtio-console for chr-testdev. Exiting."
> -	exit 2
> -fi
> +	if ! $qemu $M -device '?' | grep -q virtconsole; then
> +		echo "$qemu doesn't support virtio-console for chr-testdev. Exiting."
> +		exit 2
> +	fi
>   
> -if ! $qemu $M -chardev '?' | grep -q testdev; then
> -	echo "$qemu doesn't support chr-testdev. Exiting."
> -	exit 2
> -fi
> +	if ! $qemu $M -chardev '?' | grep -q testdev; then
> +		echo "$qemu doesn't support chr-testdev. Exiting."
> +		exit 2
> +	fi
>   
> -if [ "$UEFI_SHELL_RUN" != "y" ] && [ "$EFI_USE_ACPI" != "y" ]; then
> -	chr_testdev='-device virtio-serial-device'
> -	chr_testdev+=' -device virtconsole,chardev=ctd -chardev testdev,id=ctd'
> -fi
> +	if [ "$UEFI_SHELL_RUN" != "y" ] && [ "$EFI_USE_ACPI" != "y" ]; then
> +		chr_testdev='-device virtio-serial-device'
> +		chr_testdev+=' -device virtconsole,chardev=ctd -chardev testdev,id=ctd'
> +	fi
>   
> -pci_testdev=
> -if $qemu $M -device '?' | grep -q pci-testdev; then
> -	pci_testdev="-device pci-testdev"
> -fi
> +	pci_testdev=
> +	if $qemu $M -device '?' | grep -q pci-testdev; then
> +		pci_testdev="-device pci-testdev"
> +	fi
>   
> -A="-accel $ACCEL$ACCEL_PROPS"
> -command="$qemu -nodefaults $M $A -cpu $qemu_cpu $chr_testdev $pci_testdev"
> -command+=" -display none -serial stdio"
> -command="$(migration_cmd) $(timeout_cmd) $command"
> -
> -if [ "$UEFI_SHELL_RUN" = "y" ]; then
> -	ENVIRON_DEFAULT=n run_qemu_status $command "$@"
> -elif [ "$EFI_USE_ACPI" = "y" ]; then
> -	run_qemu_status $command -kernel "$@"
> -else
> -	run_qemu $command -kernel "$@"
> -fi
> +	A="-accel $ACCEL$ACCEL_PROPS"
> +	command="$qemu -nodefaults $M $A -cpu $qemu_cpu $chr_testdev $pci_testdev"
> +	command+=" -display none -serial stdio"
> +	command="$(migration_cmd) $(timeout_cmd) $command"
> +
> +	if [ "$UEFI_SHELL_RUN" = "y" ]; then
> +		ENVIRON_DEFAULT=n run_test_status $command "$@"
> +	elif [ "$EFI_USE_ACPI" = "y" ]; then
> +		run_test_status $command -kernel "$@"
> +	else
> +		run_test $command -kernel "$@"
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
> +	if [ "$HOST" = "aarch64" ] && [ "$ARCH" = "arm" ]; then
> +		run_test_status $command --kernel "$@" --aarch32
> +	else
> +		run_test_status $command --kernel "$@"
> +	fi
> +}
> +
> +case $TARGET in
> +qemu)
> +	arch_run_qemu "$@"
> +	;;
> +kvmtool)
> +	arch_run_kvmtool "$@"
> +	;;
> +esac
> diff --git a/powerpc/run b/powerpc/run
> index 27abf1ef6a4d..0b25a227429a 100755
> --- a/powerpc/run
> +++ b/powerpc/run
> @@ -59,8 +59,8 @@ command+=" -display none -serial stdio -kernel"
>   command="$(migration_cmd) $(timeout_cmd) $command"
>   
>   # powerpc tests currently exit with rtas-poweroff, which exits with 0.
> -# run_qemu treats that as a failure exit and returns 1, so we need
> +# run_test treats that as a failure exit and returns 1, so we need
>   # to fixup the fixup below by parsing the true exit code from the output.
>   # The second fixup is also a FIXME, because once we add chr-testdev
>   # support for powerpc, we won't need the second fixup.
> -run_qemu_status $command "$@"
> +run_test_status $command "$@"
> diff --git a/riscv/run b/riscv/run
> index 3b2fc36f2afb..562347e8bea2 100755
> --- a/riscv/run
> +++ b/riscv/run
> @@ -36,8 +36,8 @@ command+=" $mach $acc $firmware -cpu $qemu_cpu "
>   command="$(migration_cmd) $(timeout_cmd) $command"
>   
>   if [ "$UEFI_SHELL_RUN" = "y" ]; then
> -	ENVIRON_DEFAULT=n run_qemu_status $command "$@"
> +	ENVIRON_DEFAULT=n run_test_status $command "$@"
>   else
>   	# We return the exit code via stdout, not via the QEMU return code
> -	run_qemu_status $command -kernel "$@"
> +	run_test_status $command -kernel "$@"
>   fi
> diff --git a/s390x/run b/s390x/run
> index 34552c2747d4..9ecfaf983a3d 100755
> --- a/s390x/run
> +++ b/s390x/run
> @@ -47,4 +47,4 @@ command+=" -kernel"
>   command="$(panic_cmd) $(migration_cmd) $(timeout_cmd) $command"
>   
>   # We return the exit code via stdout, not via the QEMU return code
> -run_qemu_status $command "$@"
> +run_test_status $command "$@"
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index 8643bab3b252..8cf67e4f3b51 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
> @@ -1,30 +1,7 @@
> -##############################################################################
> -# run_qemu translates the ambiguous exit status in Table1 to that in Table2.
> -# Table3 simply documents the complete status table.
> -#
> -# Table1: Before fixup
> -# --------------------
> -# 0      - Unexpected exit from QEMU (possible signal), or the unittest did
> -#          not use debug-exit
> -# 1      - most likely unittest succeeded, or QEMU failed
> -#
> -# Table2: After fixup
> -# -------------------
> -# 0      - Everything succeeded
> -# 1      - most likely QEMU failed
> -#
> -# Table3: Complete table
> -# ----------------------
> -# 0      - SUCCESS
> -# 1      - most likely QEMU failed
> -# 2      - most likely a run script failed
> -# 3      - most likely the unittest failed
> -# 124    - most likely the unittest timed out
> -# 127    - most likely the unittest called abort()
> -# 1..127 - FAILURE (could be QEMU, a run script, or the unittest)
> -# >= 128 - Signal (signum = status - 128)
> -##############################################################################
> -run_qemu ()
> +source config.mak
> +source scripts/vmm.bash
> +
> +run_test ()
>   {
>   	local stdout errors ret sig
>   
> @@ -39,48 +16,17 @@ run_qemu ()
>   	ret=$?
>   	exec {stdout}>&-
>   
> -	[ $ret -eq 134 ] && echo "QEMU Aborted" >&2
> -
> -	if [ "$errors" ]; then
> -		sig=$(grep 'terminating on signal' <<<"$errors")
> -		if [ "$sig" ]; then
> -			# This is too complex for ${var/search/replace}
> -			# shellcheck disable=SC2001
> -			sig=$(sed 's/.*terminating on signal \([0-9][0-9]*\).*/\1/' <<<"$sig")
> -		fi
> -	fi
> -
> -	if [ $ret -eq 0 ]; then
> -		# Some signals result in a zero return status, but the
> -		# error log tells the truth.
> -		if [ "$sig" ]; then
> -			((ret=sig+128))
> -		else
> -			# Exiting with zero (non-debugexit) is an error
> -			ret=1
> -		fi
> -	elif [ $ret -eq 1 ]; then
> -		# Even when ret==1 (unittest success) if we also got stderr
> -		# logs, then we assume a QEMU failure. Otherwise we translate
> -		# status of 1 to 0 (SUCCESS)
> -	        if [ "$errors" ]; then
> -			if ! grep -qvi warning <<<"$errors" ; then
> -				ret=0
> -			fi
> -		else
> -			ret=0
> -		fi
> -	fi
> +	ret=$(${vmm_opts[$TARGET:fixup_return_code]} $ret $errors)
>   
>   	return $ret
>   }
>   
> -run_qemu_status ()
> +run_test_status ()
>   {
>   	local stdout ret
>   
>   	exec {stdout}>&1
> -	lines=$(run_qemu "$@" > >(tee /dev/fd/$stdout))
> +	lines=$(run_test "$@" > >(tee /dev/fd/$stdout))
>   	ret=$?
>   	exec {stdout}>&-
>   
> @@ -422,6 +368,25 @@ search_qemu_binary ()
>   	export PATH=$save_path
>   }
>   
> +search_kvmtool_binary ()
> +{
> +	local kvmtoolcmd kvmtool
> +
> +	for kvmtoolcmd in lkvm vm lkvm-static; do
> +		if "$kvmtoolcmd" --help 2>/dev/null| grep -q 'The most commonly used'; then
> +			kvmtool="$kvmtoolcmd"
> +			break
> +		fi
> +	done
> +
> +	if [ -z "$kvmtool" ]; then
> +		echo "A kvmtool binary was not found." >&2
> +		return 2
> +	fi
> +
> +	command -v $kvmtool
> +}
> +
>   initrd_cleanup ()
>   {
>   	rm -f $KVM_UNIT_TESTS_ENV
> @@ -447,7 +412,7 @@ initrd_create ()
>   	fi
>   
>   	unset INITRD
> -	[ -f "$KVM_UNIT_TESTS_ENV" ] && INITRD="-initrd $KVM_UNIT_TESTS_ENV"
> +	[ -f "$KVM_UNIT_TESTS_ENV" ] && INITRD="${vmm_opts[$TARGET:initrd]} $KVM_UNIT_TESTS_ENV"
>   
>   	return 0
>   }
> @@ -471,18 +436,23 @@ env_params ()
>   	local qemu have_qemu
>   	local _ rest
>   
> -	qemu=$(search_qemu_binary) && have_qemu=1
> +	env_add_params TARGET
>   
> -	if [ "$have_qemu" ]; then
> -		if [ -n "$ACCEL" ] || [ -n "$QEMU_ACCEL" ]; then
> -			[ -n "$ACCEL" ] && QEMU_ACCEL=$ACCEL
> +	# kvmtool's versioning has been broken since it was split from the
> +	# kernel source.
> +	if [ $TARGET = "qemu" ]; then
> +		qemu=$(search_qemu_binary) && have_qemu=1
> +		if [ "$have_qemu" ]; then
> +			if [ -n "$ACCEL" ] || [ -n "$QEMU_ACCEL" ]; then
> +				[ -n "$ACCEL" ] && QEMU_ACCEL=$ACCEL
> +			fi
> +			QEMU_VERSION_STRING="$($qemu -h | head -1)"
> +			# Shellcheck does not see QEMU_MAJOR|MINOR|MICRO are used
> +			# shellcheck disable=SC2034
> +			IFS='[ .]' read -r _ _ _ QEMU_MAJOR QEMU_MINOR QEMU_MICRO rest <<<"$QEMU_VERSION_STRING"
>   		fi
> -		QEMU_VERSION_STRING="$($qemu -h | head -1)"
> -		# Shellcheck does not see QEMU_MAJOR|MINOR|MICRO are used
> -		# shellcheck disable=SC2034
> -		IFS='[ .]' read -r _ _ _ QEMU_MAJOR QEMU_MINOR QEMU_MICRO rest <<<"$QEMU_VERSION_STRING"
> +		env_add_params QEMU_ACCEL QEMU_VERSION_STRING QEMU_MAJOR QEMU_MINOR QEMU_MICRO
>   	fi
> -	env_add_params QEMU_ACCEL QEMU_VERSION_STRING QEMU_MAJOR QEMU_MINOR QEMU_MICRO
>   
>   	KERNEL_VERSION_STRING=$(uname -r)
>   	IFS=. read -r KERNEL_VERSION KERNEL_PATCHLEVEL rest <<<"$KERNEL_VERSION_STRING"
> diff --git a/scripts/vmm.bash b/scripts/vmm.bash
> index b02055a5c0b6..20968f2e6b10 100644
> --- a/scripts/vmm.bash
> +++ b/scripts/vmm.bash
> @@ -1,10 +1,99 @@
>   source config.mak
>   
> +##############################################################################
> +# qemu_fixup_return_code translates the ambiguous exit status in Table1 to that
> +# in Table2.  Table3 simply documents the complete status table.
> +#
> +# Table1: Before fixup
> +# --------------------
> +# 0      - Unexpected exit from QEMU (possible signal), or the unittest did
> +#          not use debug-exit
> +# 1      - most likely unittest succeeded, or QEMU failed
> +#
> +# Table2: After fixup
> +# -------------------
> +# 0      - Everything succeeded
> +# 1      - most likely QEMU failed
> +#
> +# Table3: Complete table
> +# ----------------------
> +# 0      - SUCCESS
> +# 1      - most likely QEMU failed
> +# 2      - most likely a run script failed
> +# 3      - most likely the unittest failed
> +# 124    - most likely the unittest timed out
> +# 127    - most likely the unittest called abort()
> +# 1..127 - FAILURE (could be QEMU, a run script, or the unittest)
> +# >= 128 - Signal (signum = status - 128)
> +##############################################################################
> +qemu_fixup_return_code()
> +{
> +	local ret=$1
> +	# Remove $ret from the list of arguments
> +	shift 1
> +	local errors="$@"
> +	local sig
> +
> +	[ $ret -eq 134 ] && echo "QEMU Aborted" >&2
> +
> +	if [ "$errors" ]; then
> +		sig=$(grep 'terminating on signal' <<<"$errors")
> +		if [ "$sig" ]; then
> +			# This is too complex for ${var/search/replace}
> +			# shellcheck disable=SC2001
> +			sig=$(sed 's/.*terminating on signal \([0-9][0-9]*\).*/\1/' <<<"$sig")
> +		fi
> +	fi
> +
> +	if [ $ret -eq 0 ]; then
> +		# Some signals result in a zero return status, but the
> +		# error log tells the truth.
> +		if [ "$sig" ]; then
> +			((ret=sig+128))
> +		else
> +			# Exiting with zero (non-debugexit) is an error
> +			ret=1
> +		fi
> +	elif [ $ret -eq 1 ]; then
> +		# Even when ret==1 (unittest success) if we also got stderr
> +		# logs, then we assume a QEMU failure. Otherwise we translate
> +		# status of 1 to 0 (SUCCESS)
> +	        if [ "$errors" ]; then
> +			if ! grep -qvi warning <<<"$errors" ; then
> +				ret=0
> +			fi
> +		else
> +			ret=0
> +		fi
> +	fi
> +
> +	echo $ret
> +}
> +
> +kvmtool_fixup_return_code()
> +{
> +	local ret=$1
> +
> +	# Force run_test_status() to interpret the STATUS line.
> +	if [ $ret -eq 0 ]; then
> +		ret=1
> +	fi
> +
> +	echo $ret
> +}
> +
>   declare -A vmm_opts=(
>   	[qemu:nr_cpus]='-smp'
>   	[qemu:kernel]='-kernel'
>   	[qemu:args]='-append'
>   	[qemu:initrd]='-initrd'
> +	[qemu:fixup_return_code]=qemu_fixup_return_code
> +
> +	[kvmtool:nr_cpus]='--cpus'
> +	[kvmtool:kernel]='--kernel'
> +	[kvmtool:args]='--params'
> +	[kvmtool:initrd]='--initrd'
> +	[kvmtool:fixup_return_code]=kvmtool_fixup_return_code
>   )
>   
>   function check_vmm_supported()
> diff --git a/x86/run b/x86/run
> index a3d3e7db8891..91bcd0b9ae41 100755
> --- a/x86/run
> +++ b/x86/run
> @@ -49,7 +49,7 @@ if [ "${CONFIG_EFI}" = y ]; then
>   	# UEFI, the test case binaries are passed to QEMU through the disk
>   	# image, not through the '-kernel' flag. And QEMU reports an error if it
>   	# gets '-initrd' without a '-kernel'
> -	ENVIRON_DEFAULT=n run_qemu ${command} "$@"
> +	ENVIRON_DEFAULT=n run_test ${command} "$@"
>   else
> -	run_qemu ${command} "$@"
> +	run_test ${command} "$@"
>   fi

-- 
Shaoqin


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
