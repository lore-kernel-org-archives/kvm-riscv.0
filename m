Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18623C7EE30
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 17:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n0n6LfFNQB0IzDf12VGamM9UvYhEVkOTWpgOvsUxAQ4=; b=NQHUTWqY3gnqvQ
	xCiY8QvQi7941FZgWjxxwG3g8I2bzEEXgGWrsiPlqv1CHbMu8GkkQyJOPX4i9DGBOWr5z2UXXHYgz
	B8xPr9mhCZEdhaLd+3Z8JMBpfwCDcEbJrX2tGd5t7TgS8wgCXGN3JTnKmGD9/QmgAsSa8hiebwDzQ
	qesYBtIDYr0mxRce3SFy+V0aH4T+jb3KVqDkR7eUH0MrvMfX/A6h/cBaL/U3Kp5zP8FtNNIofTjbu
	qI50B7tf2I8J5xpDr55RxVhswWbAQLHdVF3i4G8ZKkowT7mU0BHF91Z4zbOc99P+7448FyInuGV81
	Dx25KUqL5QbYBMPORa8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUqKS-0000000CMgS-3Ugi;
	Thu, 26 Jun 2025 17:24:04 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUoc8-0000000C8iG-0PPv
	for kvm-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 15:34:13 +0000
Date: Thu, 26 Jun 2025 17:34:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750952049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MTzNaxET0ChI04GPtqPBTqvxpAjkYbCN9vCfFYsRF38=;
	b=VbAk0zVY3LpVMPdjT1q9dlT77cCaKVIQfwS+uoJPiRLBafmsyB2B1R08LAelYTxPDUkXf7
	aTDYMyOKol3oE7o8dx41P4mNEt1G45xZFYhNxQwHmo17JA3igEXvGaxKvBnRBgIQW62Av8
	/NfH0hk9/ARpm/tHc9wIWCUNV6u6hzI=
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
Subject: Re: [kvm-unit-tests PATCH v4 05/13] scripts: Add 'kvmtool_params' to
 test definition
Message-ID: <20250626-536c0af00aa655d6e647df44@orel>
References: <20250625154813.27254-1-alexandru.elisei@arm.com>
 <20250625154813.27254-6-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250625154813.27254-6-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_083412_289712_BC710CD2 
X-CRM114-Status: GOOD (  21.94  )
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

On Wed, Jun 25, 2025 at 04:48:05PM +0100, Alexandru Elisei wrote:
> arm/arm64 supports running tests under kvmtool, but kvmtool's syntax for
> running and configuring a virtual machine is different to qemu. To run
> tests using the automated test infrastructure, add a new test parameter,
> 'kvmtool_params'. The parameter serves the exact purpose as 'qemu_params',
> but using kvmtool's syntax.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
> 
> Changes v3->v4:
> 
> * Added params_name in scripts/common.bash::for_each_unittest() to avoid
> checking for $TARGET when deciding to parse kvmtool_params or
> {qemu,extra}_params.
> * Dropped factoring out parse_opts() in for_each_unittest().
> 
>  arm/unittests.cfg   | 24 ++++++++++++++++++++++++
>  docs/unittests.txt  |  8 ++++++++
>  scripts/common.bash | 11 +++++++----
>  scripts/vmm.bash    | 16 ++++++++++++++++
>  4 files changed, 55 insertions(+), 4 deletions(-)
> 
> diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> index 384af983cd88..343c14567f27 100644
> --- a/arm/unittests.cfg
> +++ b/arm/unittests.cfg
> @@ -17,6 +17,7 @@ file = selftest.flat
>  smp = 2
>  test_args = 'setup smp=2 mem=256'
>  qemu_params = -m 256
> +kvmtool_params = --mem 256
>  groups = selftest
>  
>  # Test vector setup and exception handling (kernel mode).
> @@ -48,66 +49,77 @@ groups = pci
>  file = pmu.flat
>  groups = pmu
>  test_args = "cycle-counter 0"
> +kvmtool_params = --pmu
>  
>  [pmu-event-introspection]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  test_args = pmu-event-introspection
> +kvmtool_params = --pmu
>  
>  [pmu-event-counter-config]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  test_args = pmu-event-counter-config
> +kvmtool_params = --pmu
>  
>  [pmu-basic-event-count]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  test_args = pmu-basic-event-count
> +kvmtool_params = --pmu
>  
>  [pmu-mem-access]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  test_args = pmu-mem-access
> +kvmtool_params = --pmu
>  
>  [pmu-mem-access-reliability]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  test_args = pmu-mem-access-reliability
> +kvmtool_params = --pmu
>  
>  [pmu-sw-incr]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  test_args = pmu-sw-incr
> +kvmtool_params = --pmu
>  
>  [pmu-chained-counters]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  test_args = pmu-chained-counters
> +kvmtool_params = --pmu
>  
>  [pmu-chained-sw-incr]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  test_args = pmu-chained-sw-incr
> +kvmtool_params = --pmu
>  
>  [pmu-chain-promotion]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  test_args = pmu-chain-promotion
> +kvmtool_params = --pmu
>  
>  [pmu-overflow-interrupt]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  test_args = pmu-overflow-interrupt
> +kvmtool_params = --pmu
>  
>  # Test PMU support (TCG) with -icount IPC=1
>  #[pmu-tcg-icount-1]
> @@ -131,6 +143,7 @@ file = gic.flat
>  smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
>  test_args = ipi
>  qemu_params = -machine gic-version=2
> +kvmtool_params = --irqchip=gicv2
>  groups = gic
>  
>  [gicv2-mmio]
> @@ -138,6 +151,7 @@ file = gic.flat
>  smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
>  test_args = mmio
>  qemu_params = -machine gic-version=2
> +kvmtool_params = --irqchip=gicv2
>  groups = gic
>  
>  [gicv2-mmio-up]
> @@ -145,6 +159,7 @@ file = gic.flat
>  smp = 1
>  test_args = mmio
>  qemu_params = -machine gic-version=2
> +kvmtool_params = --irqchip=gicv2
>  groups = gic
>  
>  [gicv2-mmio-3p]
> @@ -152,6 +167,7 @@ file = gic.flat
>  smp = $((($MAX_SMP < 3)?$MAX_SMP:3))
>  test_args = mmio
>  qemu_params = -machine gic-version=2
> +kvmtool_params = --irqchip=gicv2
>  groups = gic
>  
>  [gicv3-ipi]
> @@ -159,6 +175,7 @@ file = gic.flat
>  smp = $MAX_SMP
>  test_args = ipi
>  qemu_params = -machine gic-version=3
> +kvmtool_params = --irqchip=gicv3
>  groups = gic
>  
>  [gicv2-active]
> @@ -166,6 +183,7 @@ file = gic.flat
>  smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
>  test_args = active
>  qemu_params = -machine gic-version=2
> +kvmtool_params = --irqchip=gicv2
>  groups = gic
>  
>  [gicv3-active]
> @@ -173,6 +191,7 @@ file = gic.flat
>  smp = $MAX_SMP
>  test_args = active
>  qemu_params = -machine gic-version=3
> +kvmtool_params = --irqchip=gicv3
>  groups = gic
>  
>  [its-introspection]
> @@ -180,6 +199,7 @@ file = gic.flat
>  smp = $MAX_SMP
>  test_args = its-introspection
>  qemu_params = -machine gic-version=3
> +kvmtool_params = --irqchip=gicv3-its
>  groups = its
>  arch = arm64
>  
> @@ -188,6 +208,7 @@ file = gic.flat
>  smp = $MAX_SMP
>  test_args = its-trigger
>  qemu_params = -machine gic-version=3
> +kvmtool_params = --irqchip=gicv3-its
>  groups = its
>  arch = arm64
>  
> @@ -196,6 +217,7 @@ file = gic.flat
>  smp = $MAX_SMP
>  test_args = its-migration
>  qemu_params = -machine gic-version=3
> +kvmtool_params = --irqchip=gicv3
>  groups = its migration
>  arch = arm64
>  
> @@ -204,6 +226,7 @@ file = gic.flat
>  smp = $MAX_SMP
>  test_args = its-pending-migration
>  qemu_params = -machine gic-version=3
> +kvmtool_params = --irqchip=gicv3
>  groups = its migration
>  arch = arm64
>  
> @@ -212,6 +235,7 @@ file = gic.flat
>  smp = $MAX_SMP
>  test_args = its-migrate-unmapped-collection
>  qemu_params = -machine gic-version=3
> +kvmtool_params = --irqchip=gicv3
>  groups = its migration
>  arch = arm64
>  
> diff --git a/docs/unittests.txt b/docs/unittests.txt
> index ea0da959f008..a9164bccc24c 100644
> --- a/docs/unittests.txt
> +++ b/docs/unittests.txt
> @@ -78,6 +78,14 @@ extra_params
>  Alias for 'qemu_params', supported for compatibility purposes. Use
>  'qemu_params' for new tests.
>  
> +kvmtool_params
> +--------------
> +Extra parameters supplied to the kvmtool process. Works similarly to
> +'qemu_params', but uses kvmtool's syntax for command line arguments. The
> +example for 'qemu_params', applied to kvmtool, would be:
> +
> +kvmtool_params = --mem 256
> +
>  groups
>  ------
>  groups = <group_name1> <group_name2> ...
> diff --git a/scripts/common.bash b/scripts/common.bash
> index ae127bd4e208..7c1b89f1b3c2 100644
> --- a/scripts/common.bash
> +++ b/scripts/common.bash
> @@ -18,6 +18,9 @@ function for_each_unittest()
>  	local timeout
>  	local rematch
>  
> +	# shellcheck disable=SC2155
> +	local params_name=$(vmm_unittest_params_name)
> +
>  	exec {fd}<"$unittests"
>  
>  	while read -r -u $fd line; do
> @@ -47,8 +50,8 @@ function for_each_unittest()
>  			smp="$(vmm_optname_nr_cpus) ${BASH_REMATCH[1]}"
>  		elif [[ $line =~ ^test_args\ *=\ *(.*)$ ]]; then
>  			test_args="$(vmm_optname_args) ${BASH_REMATCH[1]}"
> -		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *'"""'(.*)$ ]]; then
> -			opts=${BASH_REMATCH[2]}$'\n'
> +		elif [[ $line =~ ^$params_name\ *=\ *'"""'(.*)$ ]]; then
> +			opts=${BASH_REMATCH[1]}$'\n'
>  			while read -r -u $fd; do
>  				#escape backslash newline, but not double backslash
>  				if [[ $opts =~ [^\\]*(\\*)$'\n'$ ]]; then
> @@ -63,8 +66,8 @@ function for_each_unittest()
>  					opts+=$REPLY$'\n'
>  				fi
>  			done
> -		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *(.*)$ ]]; then
> -			opts=${BASH_REMATCH[2]}
> +		elif [[ $line =~ ^$params_name\ *=\ *(.*)$ ]]; then
> +			opts=${BASH_REMATCH[1]}
>  		elif [[ $line =~ ^groups\ *=\ *(.*)$ ]]; then
>  			groups=${BASH_REMATCH[1]}
>  		elif [[ $line =~ ^arch\ *=\ *(.*)$ ]]; then
> diff --git a/scripts/vmm.bash b/scripts/vmm.bash
> index 7629b2b9146e..9a2608eb3fd4 100644
> --- a/scripts/vmm.bash
> +++ b/scripts/vmm.bash
> @@ -38,3 +38,19 @@ function vmm_check_supported()
>  		;;
>  	esac
>  }
> +
> +function vmm_unittest_params_name()
> +{
> +	# shellcheck disable=SC2155
> +	local target=$(vmm_get_target)
> +
> +	case "$target" in
> +	qemu)
> +		echo "extra_params|qemu_params"
> +		;;
> +	*)
> +		echo "$0 does not support '$target'"
> +		exit 2
> +		;;

It seems a bit odd that we've introduced kvmtool_params and applied it to
arm in this patch, but we still don't support it. Not a huge deal, though.

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

> +	esac
> +}
> -- 
> 2.50.0
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
