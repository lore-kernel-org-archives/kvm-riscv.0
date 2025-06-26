Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5051C7EE31
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 16:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/8OJFi6Cy4bs88OUNlY2CLcNrW+ohYTVYKQ0NKYbYjg=; b=s4AJ6+sHwS2Vjx
	D2LW6WdycbrdL02LIgL5GBC/V4K++0rAHu2W5IxkJ+9+ZNjnZed1xuPO4if0DHJIYh6ttHeWf+L6x
	soOcg16m32fMuw7CEAmt205ylyre+YxxfmuuapynX5ofIsAEJrHAWYS5w1/GH8JWBEDUXuGEqk8t4
	VxTKn3oFfWdKl/ZFQS1t9qLeBKYoy/R2Bk5UQ7tnPNyG3O10zlLJFRZ7dom5Kh9EgHFCdYm8zZPCo
	FgPyJJB7q+IvZr9nN3QOk2tW5066bINyWbUE9OvGnHuZb3fUmLrbWYRFEn0dc0J1WSnEUonk4FBGr
	F1nWvkbFPr9MygsCLr8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpFt-0000000CEdy-111B;
	Thu, 26 Jun 2025 16:15:17 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUoTj-0000000C6nV-1n3a
	for kvm-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 15:25:33 +0000
Date: Thu, 26 Jun 2025 17:25:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750951527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yMeirCEvb93+6eKpc7HB6gbXZIpqW2Hi3+BGISmVpIs=;
	b=vWWiHDwjdsnVxah//VOE06mn+L789ERAyxJwwodV56NBj7UU4/YpmcD1M2GXm2fk1fEz+c
	RE+pf5Ngacj1OI2IB9rFXUFyD830hpC72TGw65II7dNFETzAGJbHVR2KYTBX0Hdw2T6JcQ
	IYGWh/VdELSLLRDiG1kJohVZrlF6uxc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com, shahuang@redhat.com
Subject: Re: [kvm-unit-tests PATCH v4 03/13] scripts: Refuse to run the tests
 if not configured for qemu
Message-ID: <20250626-e99cee57aaa67223c2e09f31@orel>
References: <20250625154813.27254-1-alexandru.elisei@arm.com>
 <20250625154813.27254-4-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250625154813.27254-4-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_082531_746622_F691263E 
X-CRM114-Status: GOOD (  35.54  )
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

On Wed, Jun 25, 2025 at 04:48:03PM +0100, Alexandru Elisei wrote:
> Arm and arm64 support running the tests under kvmtool. kvmtool has a
> different command line syntax for configuring and running a virtual
> machine, and the automated scripts know only how to use qemu.
> 
> One issue with that is even though the tests have been configured for
> kvmtool (with ./configure --target=kvmtool), the scripts will use qemu to
> run the tests, and without looking at the logs there is no indication that
> the tests haven't been run with kvmtool, as configured.
> 
> Another issue is that kvmtool uses a different address for the UART and
> when running the tests with qemu via the scripts, this warning is
> displayed:
> 
> WARNING: early print support may not work. Found uart at 0x9000000, but early base is 0x1000000.
> 
> which might trip up an unsuspected user.
> 
> There are four different ways to run a test using the test infrastructure:
> with run_tests.sh, by invoking arm/run or arm/efi/run with the correct
> parameters (only the arm directory is mentioned here because the tests can
> be configured for kvmtool only on arm and arm64), and by creating
> standalone tests.
> 
> run_tests.sh ends up executing either arm/run or arm/efi/run, so add a
> check to these two scripts for the test target, and refuse to run the test
> if kvm-unit-tests has been configured for kvmtool.
> 
> mkstandalone.sh also executes arm/run or arm/efi run, but the usual use
> case for standalone tests is to compile them on one machine, and then to
> run them on a different machine. This two step process can be time
> consuming, so save the user time (and frustration!) and add a check
> directly to mkstandalone.sh.
> 
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
> 
> Changes v3->v4:
> 
> * Renamed check_vmm_supported() to vmm_check_supported().
> * Added function vmm_get_target().
> * Added Reviewed-by from Shaoqin.
> * Fixed typo s/execuing/executing (Drew).
> 
>  arm/efi/run             |  3 +++
>  arm/run                 |  4 ++++
>  scripts/mkstandalone.sh |  6 +++++-
>  scripts/vmm.bash        | 25 +++++++++++++++++++++++++
>  4 files changed, 37 insertions(+), 1 deletion(-)
>  create mode 100644 scripts/vmm.bash
> 
> diff --git a/arm/efi/run b/arm/efi/run
> index 8f41fc02df31..38800e8bfa13 100755
> --- a/arm/efi/run
> +++ b/arm/efi/run
> @@ -11,6 +11,9 @@ if [ ! -f config.mak ]; then
>  fi
>  source config.mak
>  source scripts/arch-run.bash
> +source scripts/vmm.bash
> +
> +vmm_check_supported
>  
>  if [ -f /usr/share/qemu-efi-aarch64/QEMU_EFI.fd ]; then
>  	DEFAULT_UEFI=/usr/share/qemu-efi-aarch64/QEMU_EFI.fd
> diff --git a/arm/run b/arm/run
> index ef58558231b7..edf0c1dd1b41 100755
> --- a/arm/run
> +++ b/arm/run
> @@ -7,7 +7,11 @@ if [ -z "$KUT_STANDALONE" ]; then
>  	fi
>  	source config.mak
>  	source scripts/arch-run.bash
> +	source scripts/vmm.bash
>  fi
> +
> +vmm_check_supported
> +
>  qemu_cpu="$TARGET_CPU"
>  
>  if [ "$QEMU" ] && [ -z "$ACCEL" ] &&
> diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
> index c4ba81f18935..9c5768563757 100755
> --- a/scripts/mkstandalone.sh
> +++ b/scripts/mkstandalone.sh
> @@ -6,6 +6,9 @@ if [ ! -f config.mak ]; then
>  fi
>  source config.mak
>  source scripts/common.bash
> +source scripts/vmm.bash
> +
> +vmm_check_supported
>  
>  temp_file ()
>  {
> @@ -71,7 +74,8 @@ generate_test ()
>  	args[3]='$bin'
>  
>  	(echo "#!/usr/bin/env bash"
> -	 cat scripts/arch-run.bash "$TEST_DIR/run") | temp_file RUNTIME_arch_run
> +	 cat scripts/vmm.bash scripts/arch-run.bash "$TEST_DIR/run") \
> +		| temp_file RUNTIME_arch_run
>  
>  	echo "exec {stdout}>&1"
>  	echo "RUNTIME_log_stdout () { cat >&\$stdout; }"
> diff --git a/scripts/vmm.bash b/scripts/vmm.bash
> new file mode 100644
> index 000000000000..8365c1424a3f
> --- /dev/null
> +++ b/scripts/vmm.bash
> @@ -0,0 +1,25 @@
> +function vmm_get_target()
> +{
> +	if [[ -z "$TARGET" ]]; then
> +		echo "qemu"
> +	else
> +		echo "$TARGET"
> +	fi
> +}
> +
> +function vmm_check_supported()
> +{
> +	# We're not interested in the return code for vmm_get_target().
> +	# shellcheck disable=SC2155
> +	local target=$(vmm_get_target)
> +
> +	case "$target" in
> +	qemu)
> +		return 0
> +		;;
> +	*)
> +		echo "$0 does not support target '$target'"
> +		exit 2
> +		;;
> +	esac
> +}
> -- 
> 2.50.0
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
