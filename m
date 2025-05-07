Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EE3C3ABBF
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 May 2025 17:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ML1pJoOBOwUDqIS7r/Gc4n94f4tUZm+qaKyFViS/q4=; b=vfQCYXGJoryBBL
	rR7lu9ZVi7dLfdlI1eQXbA2hAwTeZHpv2I/KRFH5MG/ou4lL+a/T8D3WQqXgBtp4vC2NvTVH9MMNo
	16yajv1/QDuaA/60NnKJzzIGH7yok7tludAP1sv1oYdoP8mi1Nske38OFggBxayh51hXhJQCXLKTB
	Wqx9uM9yCwxHH92l9BsVvQZl0jAv/TA/MtZrIBOMd7jWHCqMCRScLb5fR/CXADMcNqZ2kge3e6Ndl
	2CiW2k9sF/X4xVvg5XWEAUyR6AfyksrvZHwAiCvodpu66TOtmTmfKa0xdJX+gRJDY9YwFZgDrmD0V
	5toQ6+lwddxClvznFPXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiXu-0000000GKUX-2Tn0;
	Wed, 07 May 2025 17:27:02 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChx3-0000000GCaH-0iAe
	for kvm-riscv@lists.infradead.org;
	Wed, 07 May 2025 16:49:01 +0000
Date: Wed, 7 May 2025 18:48:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746636535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2RpamE2srlpqeXHrljbpcOM2Ay/589KHDerW4ekHgUI=;
	b=pZjO/Dq1wiCjg2M3GtCbh5dD3dLgzdP6L3Kwa+o1eEo5wqwXY9g4EhJqMQY/Bi/EpxnfA0
	558VvSquXY1JzId+uqGR9L0c8F8U/bW2i0cbPFE5/5UzbATwdBpa9GCxfLKSp/MNrFT22H
	+23vVs422Ir3vA6F77jcwbdE2AsR2Cc=
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
Subject: Re: [kvm-unit-tests PATCH v3 13/16] scripts: Do not probe for
 maximum number of VCPUs when using kvmtool
Message-ID: <20250507-71bfb831e524b5c437c6a828@orel>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-14-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250507151256.167769-14-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_094857_347221_DC4BF174 
X-CRM114-Status: GOOD (  18.69  )
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

On Wed, May 07, 2025 at 04:12:53PM +0100, Alexandru Elisei wrote:
> The --probe-maxsmp parameter updates MAX_SMP with the maximum number of
> VCPUs that the host supports. Qemu will exit with an error when creating a
> virtual machine if the number of VCPUs is exceeded.
> 
> kvmtool behaves differently: it will automatically limit the number of
> VCPUs to the what KVM supports, which is exactly what --probe-maxsmp wants
> to achieve. When doing --probe-maxsmp with kvmtool, print a message
> explaining why it's redundant and don't do anything else.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  run_tests.sh         |  3 ++-
>  scripts/runtime.bash | 16 ----------------
>  scripts/vmm.bash     | 24 ++++++++++++++++++++++++
>  3 files changed, 26 insertions(+), 17 deletions(-)
> 
> diff --git a/run_tests.sh b/run_tests.sh
> index 150a06a91064..a69c3665b7a4 100755
> --- a/run_tests.sh
> +++ b/run_tests.sh
> @@ -10,6 +10,7 @@ if [ ! -f config.mak ]; then
>  fi
>  source config.mak
>  source scripts/common.bash
> +source scripts/vmm.bash
>  
>  function usage()
>  {
> @@ -90,7 +91,7 @@ while [ $# -gt 0 ]; do
>              list_tests="yes"
>              ;;
>          --probe-maxsmp)
> -            probe_maxsmp
> +            ${vmm_opts[$TARGET:probe_maxsmp]}
>              ;;
>          --)
>              ;;
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index 01ec8eae2bba..a802686c511d 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -209,19 +209,3 @@ function run()
>  
>      return $ret
>  }
> -
> -#
> -# Probe for MAX_SMP, in case it's less than the number of host cpus.
> -#
> -function probe_maxsmp()
> -{
> -	local smp
> -
> -	if smp=$($RUNTIME_arch_run _NO_FILE_4Uhere_ -smp $MAX_SMP |& grep 'SMP CPUs'); then
> -		smp=${smp##* }
> -		smp=${smp/\(}
> -		smp=${smp/\)}
> -		echo "Restricting MAX_SMP from ($MAX_SMP) to the max supported ($smp)" >&2
> -		MAX_SMP=$smp
> -	fi
> -}
> diff --git a/scripts/vmm.bash b/scripts/vmm.bash
> index a1d50ed51981..ef9819f4132c 100644
> --- a/scripts/vmm.bash
> +++ b/scripts/vmm.bash
> @@ -105,6 +105,22 @@ function qemu_parse_premature_failure()
>  	return 0
>  }
>  
> +#
> +# Probe for MAX_SMP, in case it's less than the number of host cpus.
> +#
> +function qemu_probe_maxsmp()
> +{
> +	local smp
> +
> +	if smp=$($RUNTIME_arch_run _NO_FILE_4Uhere_ -smp $MAX_SMP |& grep 'SMP CPUs'); then
> +		smp=${smp##* }
> +		smp=${smp/\(}
> +		smp=${smp/\)}
> +		echo "Restricting MAX_SMP from ($MAX_SMP) to the max supported ($smp)" >&2
> +		MAX_SMP=$smp
> +	fi
> +}
> +
>  function kvmtool_parse_premature_failure()
>  {
>  	local log="$@"
> @@ -114,6 +130,12 @@ function kvmtool_parse_premature_failure()
>  	return 0
>  }
>  
> +function kvmtool_probe_maxsmp()
> +{
> +	echo "kvmtool automatically limits the number of VCPUs to maximum supported"
> +	echo "The 'smp' test parameter won't be modified"
> +}
> +
>  declare -A vmm_opts=(
>  	[qemu:nr_cpus]='-smp'
>  	[qemu:kernel]='-kernel'
> @@ -122,6 +144,7 @@ declare -A vmm_opts=(
>  	[qemu:default_opts]=''
>  	[qemu:fixup_return_code]=qemu_fixup_return_code
>  	[qemu:parse_premature_failure]=qemu_parse_premature_failure
> +	[qemu:probe_maxsmp]=qemu_probe_maxsmp
>  
>  	[kvmtool:nr_cpus]='--cpus'
>  	[kvmtool:kernel]='--kernel'
> @@ -130,6 +153,7 @@ declare -A vmm_opts=(
>  	[kvmtool:default_opts]="$KVMTOOL_DEFAULT_OPTS"
>  	[kvmtool:fixup_return_code]=kvmtool_fixup_return_code
>  	[kvmtool:parse_premature_failure]=kvmtool_parse_premature_failure
> +	[kvmtool:probe_maxsmp]=kvmtool_probe_maxsmp
>  )
>  
>  function check_vmm_supported()
> -- 
> 2.49.0
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
