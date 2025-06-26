Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB78C7EE31
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 16:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDcBCqkf29W7884h1XITF26v8KaR+l+rXN1rh9aMiNk=; b=Nk42jd30G48XEY
	iEcnA+O9msxBnujIuGBOYCH617thaMZgMcSKqGO4cXtZLEVYiLybburLuDUOlBhZejj2otuB8t4LC
	EurpRaLz/dQGmsHs2cVwqudobGvH74nFODIuO7CV2oveSofiXpfBIlg78+bNJqLDN0POWgAIdnSe7
	ctg0yUGi9l60KW7nM+8RIjYRiDeZ7Vyi3sIEEHxqrwAXdxECE7E1bpCovU09RUKebaGRZeqxsykMD
	CzODD0qY8aufI0bw+B3QKhcdNBeNeO0PUwp6XQPyYlCNSdQK2KUVaEAjnqyOvNy9h0tLa6VafSBNZ
	MXvQJOQfcLxgS6sPgspw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpIC-0000000CEvu-26Yj;
	Thu, 26 Jun 2025 16:17:40 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUoXc-0000000C7Kp-0mZQ
	for kvm-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 15:29:33 +0000
Date: Thu, 26 Jun 2025 17:29:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750951769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B7njsQqS9+YDhVOAJu3gcu6bWM9s+UemRcmSG7r3Qvs=;
	b=U45XfFqA2ERqttsJj+PAHPpQC2ZDqBxFOMZkRVL0AKADe70nTLxOPuIU65WzUbbUkfsd+b
	5F4Vl+NzEJJXuyUPzkvbfiUTJcyprTFO9NS8GCkwKwzbJoV8XZN2iwQViQVZoVEXuKzyna
	Yg50+iFSUL3/OH0CegRsxadieDifpF4=
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
Subject: Re: [kvm-unit-tests PATCH v4 04/13] scripts: Use an associative
 array for qemu argument names
Message-ID: <20250626-5cba2905b81b7a5b3a016bfa@orel>
References: <20250625154813.27254-1-alexandru.elisei@arm.com>
 <20250625154813.27254-5-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250625154813.27254-5-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_082932_526513_553D3645 
X-CRM114-Status: GOOD (  22.54  )
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

On Wed, Jun 25, 2025 at 04:48:04PM +0100, Alexandru Elisei wrote:
> Move away from hardcoded qemu arguments and use instead an associative
> array to get the needed arguments. This paves the way for adding kvmtool
> support to the scripts, which has a different syntax for the same VM
> configuration parameters.
> 
> Suggested-by: Andrew Jones <andrew.jones@linux.dev>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
> 
> Changes v3->v4:
> 
> * Renamed vmm_opts to vmm_optname.
> * Dropped entries for 'kernel' and 'initrd' in vmm_optname because they weren't
> used in this patch.
> * Use vmm_optname_nr_cpus() and vmm_optname_args() instead of directly indexing
> into vmm_optname.
> * Dropped the check for empty $test_args in scripts/runtime.bash::run() by
> having $test_args already contain --append if not empty in
> scripts/common.bash::for_each_unittest().
> 
>  scripts/common.bash  | 11 ++++++++---
>  scripts/runtime.bash |  7 +------
>  scripts/vmm.bash     | 15 +++++++++++++++
>  3 files changed, 24 insertions(+), 9 deletions(-)
> 
> diff --git a/scripts/common.bash b/scripts/common.bash
> index 9deb87d4050d..ae127bd4e208 100644
> --- a/scripts/common.bash
> +++ b/scripts/common.bash
> @@ -1,4 +1,5 @@
>  source config.mak
> +source scripts/vmm.bash
>  
>  function for_each_unittest()
>  {
> @@ -26,8 +27,12 @@ function for_each_unittest()
>  				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$test_args" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
>  			fi
>  			testname=$rematch
> -			smp=1
> +			smp="$(vmm_optname_nr_cpus) 1"
>  			kernel=""
> +			# Intentionally don't use -append if test_args is empty
> +			# because qemu interprets the first word after
> +			# -append as a kernel parameter instead of a command
> +			# line option.
>  			test_args=""
>  			opts=""
>  			groups=""
> @@ -39,9 +44,9 @@ function for_each_unittest()
>  		elif [[ $line =~ ^file\ *=\ *(.*)$ ]]; then
>  			kernel=$TEST_DIR/${BASH_REMATCH[1]}
>  		elif [[ $line =~ ^smp\ *=\ *(.*)$ ]]; then
> -			smp=${BASH_REMATCH[1]}
> +			smp="$(vmm_optname_nr_cpus) ${BASH_REMATCH[1]}"
>  		elif [[ $line =~ ^test_args\ *=\ *(.*)$ ]]; then
> -			test_args=${BASH_REMATCH[1]}
> +			test_args="$(vmm_optname_args) ${BASH_REMATCH[1]}"
>  		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *'"""'(.*)$ ]]; then
>  			opts=${BASH_REMATCH[2]}$'\n'
>  			while read -r -u $fd; do
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index bc17b89f4ff5..86d8a2cd8528 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -34,7 +34,7 @@ premature_failure()
>  get_cmdline()
>  {
>      local kernel=$1
> -    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel -smp $smp $opts"
> +    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel $smp $test_args $opts"
>  }
>  
>  skip_nodefault()
> @@ -88,11 +88,6 @@ function run()
>      local accel="${10}"
>      local timeout="${11:-$TIMEOUT}" # unittests.cfg overrides the default
>  
> -    # If $test_args is empty, qemu will interpret the first option after -append
> -    # as a test argument instead of a qemu option, so make sure that doesn't
> -    # happen.
> -    [ -n "$test_args" ] && opts="-append $test_args $opts"
> -
>      if [ "${CONFIG_EFI}" == "y" ]; then
>          kernel=${kernel/%.flat/.efi}
>      fi
> diff --git a/scripts/vmm.bash b/scripts/vmm.bash
> index 8365c1424a3f..7629b2b9146e 100644
> --- a/scripts/vmm.bash
> +++ b/scripts/vmm.bash
> @@ -1,3 +1,18 @@
> +declare -A vmm_optname=(
> +	[qemu,args]='-append'
> +	[qemu,nr_cpus]='-smp'
> +)
> +
> +function vmm_optname_args()
> +{
> +	echo ${vmm_optname[$(vmm_get_target),args]}
> +}
> +
> +function vmm_optname_nr_cpus()
> +{
> +	echo ${vmm_optname[$(vmm_get_target),nr_cpus]}
> +}
> +
>  function vmm_get_target()
>  {
>  	if [[ -z "$TARGET" ]]; then
> -- 
> 2.50.0
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
