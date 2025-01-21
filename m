Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BD6C02182
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 14:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FC3NY51U/nxi2s6nFXBzoGa+B22KAiIrKAyS1mw6C3s=; b=VfdCc2ORiUAzfH
	H/PzhoW790/6ObPPtb95bPg7jviQO1UY+vTfLDIdO+N8RLzlCT94tQKfJPnPyMvoQqPdWm2yXjfXs
	cdm7X/AfPFo6SIKpJ+WL/lO5CJNM7h/hisHTtchi8RZ9EL/9WDIhJJ+ZAZfL3HQljyV7r5hDM9uuZ
	O6ydwVGjF0xvv1CzA4/130V9ktKkbtpyUyDn6RecdhKDUsFCSasQTB2SBWnHZhsb7sBPsCpz9U23Y
	/a6rRcWudZfTDG+W96og40Uq8HfGjvjLspQO5dlLiqcQ2V3493umU/xWASx5i02KuhLlVspk7L+2K
	Azz1DO1R3m/R54RBFt9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taFYu-000000087T1-19bD;
	Tue, 21 Jan 2025 14:49:04 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taFYs-000000087Rz-0NkZ
	for kvm-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 14:49:03 +0000
Date: Tue, 21 Jan 2025 15:48:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737470939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y4U3mhaNeCPZx2S5DokPxis3spPsXAjQG6CQBxTg9Ys=;
	b=bizThze3yBlYVxibDfKZo6yDUkTwkcWNzU7AThmgiseZtF+i09K+Eu1VGnGFaj5BSju9pB
	f13cntnWjd1BUtmai6RYLN1Mc6354wufLjcOx1v27+pSUv2Bp7mIXHc6sqOTkKQuKhDmp9
	Lmw7Xs5KCfvBN3dtKK6dzoVeIXnrnow=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 03/18] scripts: Refuse to run the tests
 if not configured for qemu
Message-ID: <20250121-45faf6a9a9681c7c9ece5f44@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-4-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250120164316.31473-4-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_064902_282002_E0EEBB70 
X-CRM114-Status: GOOD (  28.73  )
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

On Mon, Jan 20, 2025 at 04:43:01PM +0000, Alexandru Elisei wrote:
> Arm and arm64 support running the tests under kvmtool. Unsurprisingly,
> kvmtool and qemu have a different command line syntax for configuring and
> running a virtual machine.
> 
> On top of that, when kvm-unit-tests has been configured to run under
> kvmtool (via ./configure --target=kvmtool), the early UART address changes,
> and if then the tests are run with qemu, this warning is displayed:
> 
> WARNING: early print support may not work. Found uart at 0x9000000, but early base is 0x1000000.
> 
> At the moment, the only way to run a test under kvmtool is manually, as no
> script has any knowledge of how to invoke kvmtool. Also, unless one looks
> at the logs, it's not obvious that the test runner is using qemu to run the
> tests, and not kvmtool.
> 
> To avoid any confusion for unsuspecting users, refuse to run a test via the
> testing scripts when kvm-unit-tests has been configured for kvmtool.
> 
> There are four different ways to run a test using the test infrastructure:
> with run_tests.sh, by invoking arm/run or arm/efi/run with the correct
> parameters (only the arm directory is mentioned here because the tests can
> be configured for kvmtool only on arm and arm64), and by creating
> standalone tests. Add a check in each of these locations for the supported
> virtual machine manager.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  arm/efi/run             | 8 ++++++++
>  arm/run                 | 9 +++++++++
>  run_tests.sh            | 8 ++++++++
>  scripts/mkstandalone.sh | 8 ++++++++
>  4 files changed, 33 insertions(+)
> 
> diff --git a/arm/efi/run b/arm/efi/run
> index 8f41fc02df31..916f4c4deef6 100755
> --- a/arm/efi/run
> +++ b/arm/efi/run
> @@ -12,6 +12,14 @@ fi
>  source config.mak
>  source scripts/arch-run.bash
>  
> +case "$TARGET" in
> +qemu)
> +    ;;
> +*)
> +    echo "$0 does not support '$TARGET'"
> +    exit 2
> +esac
> +
>  if [ -f /usr/share/qemu-efi-aarch64/QEMU_EFI.fd ]; then
>  	DEFAULT_UEFI=/usr/share/qemu-efi-aarch64/QEMU_EFI.fd
>  elif [ -f /usr/share/edk2/aarch64/QEMU_EFI.silent.fd ]; then
> diff --git a/arm/run b/arm/run
> index efdd44ce86a7..6db32cf09c88 100755
> --- a/arm/run
> +++ b/arm/run
> @@ -8,6 +8,15 @@ if [ -z "$KUT_STANDALONE" ]; then
>  	source config.mak
>  	source scripts/arch-run.bash
>  fi
> +
> +case "$TARGET" in
> +qemu)
> +    ;;
> +*)
> +   echo "'$TARGET' not supported"
> +   exit 3

I think we want exit code 2 here.

> +esac
> +
>  processor="$PROCESSOR"
>  
>  if [ "$QEMU" ] && [ -z "$ACCEL" ] &&
> diff --git a/run_tests.sh b/run_tests.sh
> index 23d81b2caaa1..61480d0c05ed 100755
> --- a/run_tests.sh
> +++ b/run_tests.sh
> @@ -100,6 +100,14 @@ while [ $# -gt 0 ]; do
>      shift
>  done
>  
> +case "$TARGET" in
> +qemu)
> +    ;;
> +*)
> +    echo "$0 does not support '$TARGET'"
> +    exit 2
> +esac
> +
>  # RUNTIME_log_file will be configured later
>  if [[ $tap_output == "no" ]]; then
>      process_test_output() { cat >> $RUNTIME_log_file; }
> diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
> index 2318a85f0706..4de97056e641 100755
> --- a/scripts/mkstandalone.sh
> +++ b/scripts/mkstandalone.sh
> @@ -7,6 +7,14 @@ fi
>  source config.mak
>  source scripts/common.bash
>  
> +case "$TARGET" in
> +qemu)
> +    ;;
> +*)
> +    echo "'$TARGET' not supported for standlone tests"
> +    exit 2
> +esac
> +
>  temp_file ()
>  {
>  	local var="$1"
> -- 
> 2.47.1
>

I think we could put the check in a function in scripts/arch-run.bash and
just use the same error message for all cases.

Thanks,
drew

> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
