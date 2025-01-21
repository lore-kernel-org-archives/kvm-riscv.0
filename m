Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CEDC02182
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 16:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4tj4QUQGckBiOzSMZw9wJdS4qM58w2Wx7uiG+phfsog=; b=1F2JzbCVk/k6JG
	Cl5k8i0wJ7ehA/mbI/NRDWAHU9o2HBa7KcL0PUPxC8aAguEUw2QFHU/PDdgB3anFAnzyAhbMB2NNO
	DN4A4LqTGjF6uCIgQFCYldVqgNixtrxUigjijnLfmNjnjJytDT4wnIghdQ3AMpH9fMkhoJVbHcvhn
	kKmg5HNSN9sMkExlwPYqjksPaePhfa7FgV7Qg3fF1RApx7+SsgTnct1z/eqv1roxTj0wEevWm0WK5
	M5qnUpB2Sdc4d/DNGjESzpbXsgpUu1rD7LiqehOlkiP384SbHZuHIduSQS1G67Wg8ANzBb0FSa7ca
	7kUECWNwI4iZA698vjCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taH3J-00000008LqP-4Bew;
	Tue, 21 Jan 2025 16:24:34 +0000
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taH3H-00000008Lpm-0iwN
	for kvm-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 16:24:33 +0000
Date: Tue, 21 Jan 2025 17:24:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737476668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H6pzkPiNgYGUEzo0pWRd1g0zmrJRFWgoHspDsCsXeo0=;
	b=MRTrxH9cLSMxf51WTQhkuQO65jTuw3qwoo1tjBxJihfQOf2x5FOyehb8UWzv4SKKAzuQB5
	rD44pG5X2+C1NjVUsr6PuOMEbUBG2/znpG7wMaPh1mM8cfAAAKGU2jRnsPvWkdT0tjU6Ya
	UDXoiEOzDjdymvmiH/k00tiHzEWuDh8=
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
Subject: Re: [kvm-unit-tests PATCH v2 07/18] scripts: Introduce kvmtool_opts
Message-ID: <20250121-9bef2681da529d9d41f524d3@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-8-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250120164316.31473-8-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_082431_649409_1B039674 
X-CRM114-Status: GOOD (  18.97  )
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

On Mon, Jan 20, 2025 at 04:43:05PM +0000, Alexandru Elisei wrote:
> In preparation for supporting kvmtool, create and pass the variable
> 'kvmtool_opts' to the arch run script $RUNTIME_arch_run.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  scripts/common.bash  |  6 ++++--
>  scripts/runtime.bash | 14 +++++++++++---
>  2 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/common.bash b/scripts/common.bash
> index a40c28121b6a..1b5e0d667841 100644
> --- a/scripts/common.bash
> +++ b/scripts/common.bash
> @@ -37,6 +37,7 @@ function for_each_unittest()
>  	local check
>  	local accel
>  	local timeout
> +	local kvmtool_opts
>  	local rematch
>  
>  	exec {fd}<"$unittests"
> @@ -45,7 +46,7 @@ function for_each_unittest()
>  		if [[ "$line" =~ ^\[(.*)\]$ ]]; then
>  			rematch=${BASH_REMATCH[1]}
>  			if [ -n "${testname}" ]; then
> -				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$qemu_opts" "$arch" "$machine" "$check" "$accel" "$timeout"
> +				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$qemu_opts" "$arch" "$machine" "$check" "$accel" "$timeout" "$kvmtool_opts"

It looks odd to have both qemu_opts and kvmtool_opts at the same time.

>  			fi
>  			testname=$rematch
>  			smp=1
> @@ -57,6 +58,7 @@ function for_each_unittest()
>  			check=""
>  			accel=""
>  			timeout=""
> +			kvmtool_opts=""
>  		elif [[ $line =~ ^file\ *=\ *(.*)$ ]]; then
>  			kernel=$TEST_DIR/${BASH_REMATCH[1]}
>  		elif [[ $line =~ ^smp\ *=\ *(.*)$ ]]; then
> @@ -80,7 +82,7 @@ function for_each_unittest()
>  		fi
>  	done
>  	if [ -n "${testname}" ]; then
> -		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$qemu_opts" "$arch" "$machine" "$check" "$accel" "$timeout"
> +		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$qemu_opts" "$arch" "$machine" "$check" "$accel" "$timeout" "$kvmtool_opts"
>  	fi
>  	exec {fd}<&-
>  }
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index a89f2d10ab78..451b5585f010 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -35,7 +35,7 @@ get_cmdline()
>  {
>      local kernel=$1
>  
> -    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel $qemu_opts"
> +    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel $opts"
>  }
>  
>  skip_nodefault()
> @@ -87,8 +87,16 @@ function run()
>      local check="${CHECK:-$8}"
>      local accel="$9"
>      local timeout="${10:-$TIMEOUT}" # unittests.cfg overrides the default
> -
> -    qemu_opts="-smp $smp $qemu_opts"
> +    local kvmtool_opts="${11}"
> +
> +    case "$TARGET" in
> +    qemu)
> +        opts="-smp $smp $qemu_opts"
> +        ;;
> +    kvmtool)
> +        opts="--cpus $smp $kvmtool_opts"
> +        ;;
> +    esac

This is similar to what I was proposing with the associative array, but
we'll only need to set a $vmm variable once with the array. If parsing
command lines is different between the vmms then we can even add
functions to the table

vmm_opts[qemu,func]=qemu_func
vmm_opts[kvmtool,func]=kvmtool_func

eval ${vmm_opts[$vmm,func]} ...

Thanks,
drew

>  
>      if [ "${CONFIG_EFI}" == "y" ]; then
>          kernel=${kernel/%.flat/.efi}
> -- 
> 2.47.1
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
