Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88F9C02182
	for <kvm-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 16:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CnpUETbT8VzG2RUSDfjcOAZ+DuXlYf9PI7Q5PFFwH1k=; b=RrNhIiyyrP8gYg
	qYfxtphC6n5O9EpJJi0IR0Pb+FA8N4qe6z8kicDJKdLB+j6kg2nzfvnoji/UK9aqX1Mzbf65rn29N
	MxFe6PsgTBIbrjFvqMGgDz7NRLNfSuZM04iOzThsFsKQS8SmVIio5w8iSOyJ7sXCodfHK2x54P4aP
	wTNT2MUIKvnHDfqFF2fLZUGffWREVk3rPfeM5q/LMWRkrTpXw95vGv31A1LZvNmjoKm5mdQc9wrl7
	9lfTlAo8fJbYw38tq0p31SpRq6H08nLOa6cXWauIms+3eC6BENWCzCt9WYqTpHlbH1TQn6HPBVBCh
	uVo79ADoTi0ZwNsfTX+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tazlW-0000000CnJA-2Mgb;
	Thu, 23 Jan 2025 16:09:10 +0000
Received: from out-176.mta0.migadu.com ([2001:41d0:1004:224b::b0])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tazlT-0000000CnIp-18Tv
	for kvm-riscv@lists.infradead.org;
	Thu, 23 Jan 2025 16:09:09 +0000
Date: Thu, 23 Jan 2025 17:08:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737648537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d4GnAaYzyvNVzqbU9Z0K1r3v6m0ZKhrQvNURxdv8LTA=;
	b=DVQF4cvNhljv0hd32+JSWzgv+uS/uKE4BXn91YZq876ff9vLUDQqX8Q5Nwl3Mj+jzrEGDG
	jmkoxXhkDFOeXZwCgZpFcPjctw2Uj0JCeqqhV+FZsmh0+FrbZhtXomf3NPc6Qz+n5EKLxj
	v5oMo37Wc8CzsxqtAoOmCuLA8N6oaig=
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
Subject: Re: [kvm-unit-tests PATCH v2 17/18] unittest: Add disabled_if
 parameter and use it for kvmtool
Message-ID: <20250123-3eda2c10fdce584bdfb14971@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-18-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250120164316.31473-18-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_080907_746394_291FF5CF 
X-CRM114-Status: GOOD (  25.15  )
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

On Mon, Jan 20, 2025 at 04:43:15PM +0000, Alexandru Elisei wrote:
> The pci-test is qemu specific. Other tests perform migration, which
> isn't supported by kvmtool. In general, kvmtool is not as feature-rich
> as qemu, so add a new unittest parameter, disabled_if, that causes a
> test to be skipped if the condition evaluates to true.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  arm/unittests.cfg    |  7 +++++++
>  docs/unittests.txt   | 13 +++++++++++++
>  scripts/common.bash  |  8 ++++++--
>  scripts/runtime.bash |  6 ++++++
>  4 files changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> index 974a5a9e4113..9b1df5e02a58 100644
> --- a/arm/unittests.cfg
> +++ b/arm/unittests.cfg
> @@ -44,6 +44,7 @@ groups = selftest
>  # Test PCI emulation
>  [pci-test]
>  file = pci-test.flat
> +disabled_if = [[ "$TARGET" != qemu ]]
>  groups = pci
>  
>  # Test PMU support
> @@ -208,6 +209,7 @@ file = gic.flat
>  smp = $MAX_SMP
>  extra_params = -machine gic-version=3 -append 'its-migration'
>  groups = its migration
> +disabled_if = [[ "$TARGET" != qemu ]]
>  arch = arm64
>  
>  [its-pending-migration]
> @@ -215,6 +217,7 @@ file = gic.flat
>  smp = $MAX_SMP
>  extra_params = -machine gic-version=3 -append 'its-pending-migration'
>  groups = its migration
> +disabled_if = [[ "$TARGET" != qemu ]]
>  arch = arm64
>  
>  [its-migrate-unmapped-collection]
> @@ -222,6 +225,7 @@ file = gic.flat
>  smp = $MAX_SMP
>  extra_params = -machine gic-version=3 -append 'its-migrate-unmapped-collection'
>  groups = its migration
> +disabled_if = [[ "$TARGET" != qemu ]]
>  arch = arm64
>  
>  # Test PSCI emulation
> @@ -263,6 +267,7 @@ groups = debug
>  file = debug.flat
>  arch = arm64
>  extra_params = -append 'bp-migration'
> +disabled_if = [[ "$TARGET" != qemu ]]
>  groups = debug migration
>  
>  [debug-wp]
> @@ -276,6 +281,7 @@ groups = debug
>  file = debug.flat
>  arch = arm64
>  extra_params = -append 'wp-migration'
> +disabled_if = [[ "$TARGET" != qemu ]]
>  groups = debug migration
>  
>  [debug-sstep]
> @@ -289,6 +295,7 @@ groups = debug
>  file = debug.flat
>  arch = arm64
>  extra_params = -append 'ss-migration'
> +disabled_if = [[ "$TARGET" != qemu ]]
>  groups = debug migration
>  
>  # FPU/SIMD test
> diff --git a/docs/unittests.txt b/docs/unittests.txt
> index ebb6994cab77..58d1a29146a3 100644
> --- a/docs/unittests.txt
> +++ b/docs/unittests.txt
> @@ -115,3 +115,16 @@ parameter needs to be of the form <path>=<value>
>  The path and value cannot contain space, =, or shell wildcard characters.
>  
>  Can be overwritten with the CHECK environment variable with the same syntax.
> +
> +disabled_if
> +------
> +disabled_if = <condition>
> +
> +Do not run the test if <condition> is met. <condition> will be fed unmodified
> +to a bash 'if' statement and follows the same syntax.
> +
> +This can be used to prevent running a test when kvm-unit-tests is configured a
> +certain way. For example, it can be used to skip a qemu specific test when
> +using another VMM and using UEFI:
> +
> +disabled_if = [[ "$TARGET" != qemu ]] && [[ "$CONFIG_EFI" = y ]]
> diff --git a/scripts/common.bash b/scripts/common.bash
> index f54ffbd7a87b..c0ea2eabeda6 100644
> --- a/scripts/common.bash
> +++ b/scripts/common.bash
> @@ -38,6 +38,7 @@ function for_each_unittest()
>  	local accel
>  	local timeout
>  	local kvmtool_opts
> +	local disabled_cond
>  	local rematch
>  
>  	exec {fd}<"$unittests"
> @@ -46,7 +47,7 @@ function for_each_unittest()
>  		if [[ "$line" =~ ^\[(.*)\]$ ]]; then
>  			rematch=${BASH_REMATCH[1]}
>  			if [ -n "${testname}" ]; then
> -				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$qemu_opts" "$arch" "$machine" "$check" "$accel" "$timeout" "$kvmtool_opts"
> +				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$qemu_opts" "$arch" "$machine" "$check" "$accel" "$timeout" "$kvmtool_opts" "$disabled_cond"
>  			fi
>  			testname=$rematch
>  			smp=1
> @@ -59,6 +60,7 @@ function for_each_unittest()
>  			accel=""
>  			timeout=""
>  			kvmtool_opts=""
> +			disabled_cond=""
>  		elif [[ $line =~ ^file\ *=\ *(.*)$ ]]; then
>  			kernel=$TEST_DIR/${BASH_REMATCH[1]}
>  		elif [[ $line =~ ^smp\ *=\ *(.*)$ ]]; then
> @@ -79,6 +81,8 @@ function for_each_unittest()
>  			machine=${BASH_REMATCH[1]}
>  		elif [[ $line =~ ^check\ *=\ *(.*)$ ]]; then
>  			check=${BASH_REMATCH[1]}
> +		elif [[ $line =~ ^disabled_if\ *=\ *(.*)$ ]]; then
> +			disabled_cond=${BASH_REMATCH[1]}
>  		elif [[ $line =~ ^accel\ *=\ *(.*)$ ]]; then
>  			accel=${BASH_REMATCH[1]}
>  		elif [[ $line =~ ^timeout\ *=\ *(.*)$ ]]; then
> @@ -86,7 +90,7 @@ function for_each_unittest()
>  		fi
>  	done
>  	if [ -n "${testname}" ]; then
> -		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$qemu_opts" "$arch" "$machine" "$check" "$accel" "$timeout" "$kvmtool_opts"
> +		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$qemu_opts" "$arch" "$machine" "$check" "$accel" "$timeout" "$kvmtool_opts" "$disabled_cond"
>  	fi
>  	exec {fd}<&-
>  }
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index abfd1e67b2ef..002bd2744d6b 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -108,6 +108,7 @@ function run()
>      local accel="$9"
>      local timeout="${10:-$TIMEOUT}" # unittests.cfg overrides the default
>      local kvmtool_opts="${11}"
> +    local disabled_cond="${12}"
>  
>      case "$TARGET" in
>      qemu)
> @@ -186,6 +187,11 @@ function run()
>          done
>      fi
>  
> +    if [[ "$disabled_cond" ]] && (eval $disabled_cond); then
> +		print_result "SKIP" $testname "" "disabled because: $disabled_cond"
> +		return 2
> +	fi
> +
>      log=$(premature_failure) && {
>          skip=true
>          if [ "${CONFIG_EFI}" == "y" ]; then
> -- 
> 2.47.1
>

I like disabled_if because I like the lambda-like thing it's doing, but I
wonder if it wouldn't be better to make TARGET a first class citizen by
adding a 'targets' unittest parameter which allows listing all targets the
test can run on, e.g.

[selftest-setup]
file = selftest.flat
smp = 2
extra_params = -m 256 -append 'setup smp=2 mem=256'
targets = qemu,kvmtool
groups = selftest

[pci-test]
file = pci-test.flat
targets = qemu
groups = pci

If targets isn't present then the default is only qemu.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
