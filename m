Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490CCC3ABD9
	for <kvm-riscv@archiver.kernel.org>; Wed, 14 May 2025 08:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0TuE39/b6LOkGOVzHOM86um8mnSC4CZasesakt4P/M=; b=G2mA2gBWvr/etK
	5c4ilJX5woMN1DFLRt5P1BVlmCD78bL9yahfisLtxDhy5PNA/9ia3vLx7uD0lpdBHB+JMa7KVemYJ
	L3hesRQepmGetr/QEkQyUH0kXZQ7Lu1OjzGMItp9In85SwSNmAqTgvyZWyhDklaLUxrQ6psTzqTWX
	Kdd8N0M9hK++hsoIn7wYYLj11WI6qiyh31lcBbpnMyZTxZ4KsFOD/tQblBDTRZj26oejid51rf10W
	oQ1DLL3HQ4KxbEAS3HJZNwVC3u2dr9aqwTxSwZ7xk3pLOD4GzSA5T49KwJxSCZX9VgnEOY0YTaCbc
	ApQ0DL7FeJuy3ZQAWJpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7It-0000000ET4g-3fMh;
	Wed, 14 May 2025 08:17:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF74Q-0000000EQJn-2j1K
	for kvm-riscv@lists.infradead.org;
	Wed, 14 May 2025 08:02:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747209749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ET5iCd8MyKLHEGzFDUiYbW8pYPvNTTRlK86QIMS0syE=;
	b=DaNi4QjmDZag9fvwmgNXFnMFMOj2FZGRo3mVc+hVeS3NC20k24uOjtn9GiWmMVi/qrpxYy
	9DC0xLhfkW3RP0IgZNmlzujqy6bYDP/d0C3kcfHvLFMkDE2PYOXjovrPecHc8s8eqFa/LF
	wp0yCzoUSArX9ppxYgvHML6dWohD6Ik=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-nrmGE2ibONeyYfHkAkhAog-1; Wed, 14 May 2025 04:02:28 -0400
X-MC-Unique: nrmGE2ibONeyYfHkAkhAog-1
X-Mimecast-MFC-AGG-ID: nrmGE2ibONeyYfHkAkhAog_1747209748
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7425efba1a3so598782b3a.0
        for <kvm-riscv@lists.infradead.org>; Wed, 14 May 2025 01:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747209747; x=1747814547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ET5iCd8MyKLHEGzFDUiYbW8pYPvNTTRlK86QIMS0syE=;
        b=GlgRrun0e3YHmUWuqLvg65wDYw962bGl686poz06qpi+MmGLy4SZhJ79lR4R4rQtaw
         EQucfyVFoVsOVOm07boEL0p25Rpnv2wjEMjX2fXvvsBHBfDRHMqQacOGKoQ1RMgj0UD1
         yNh5rm+zIPM3W0KVvd8ZVhTgL1/qrp03OFdgJzIvbh+z0qTA49VRle13QKDm5RQf71RE
         ttlDhPFYj/g3ci2m8huRhjHr4oUj9/TncD5Q8So1xs1FSDEC0FwX7FzIsZ1zaHG3rrLT
         DVjynXX+qb93X/O/HMVLWu772PGHmIsrc7bji2h///qpwcC/YtOxUL04CNcOkp1ua/8j
         atjg==
X-Forwarded-Encrypted: i=1; AJvYcCU84chkzrpddxwBHkFZ1rMEhrNj4nwtyl6N38BtvCqYFKg22ArT75yUvKA25JR2exRpZEUwdbVjpM0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+332scvik2rkPm42paDSiYELox5y3z2Di1nd/IBuU4pPj56fm
	rqU0IP7oWZyBFwIPago6k+S0l7yrrZQwZwY1GXz0mx8dJnbtb/2BQ1BTVz1+PpC47sNUBFzQfzj
	cF5G5Ln6YpHPUe+jS8nnsCAUG8KbERsOeoQayl92K2AgPgT2q/AbNg+tUxP17NxQ=
X-Gm-Gg: ASbGncupL3MDrJePAr1SH8wITYQp9R+R+hzbfuL8+B1aabJ/5Coj7b5tCxn+E8eNwPL
	Hx2mgjh35ufL9Rr1+7QoEkcIKtKrxMgic/WWWGbykIxmDTSRZfmMaoLoS7xUNwSar3z9nQ8Ur4M
	gLREA97OA33y2vTcob7aHXIMZXSwsSIeDb/nTsc21H9i+9zPebJHVPIgCBKSEDkDvQvkZsmRXPo
	El0HFIYGFL5OH0kSg2taKsrQTe3K4tnqQ0w9Ts1UwQRRW8FPjsuvOScBMgrbYYJtzmnOZF2b+e0
	a/6ImGwHB0USIhYV
X-Received: by 2002:a05:6a00:811a:b0:736:4c3d:2cba with SMTP id d2e1a72fcca58-7427917883cmr7436410b3a.9.1747209747411;
        Wed, 14 May 2025 01:02:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwhqdQhP9GhHKMFywwgH/LIw6XImxil66dwro2onM7heCubGabPHGV/eyERLOa/TP3h81BbA==
X-Received: by 2002:a05:6a00:811a:b0:736:4c3d:2cba with SMTP id d2e1a72fcca58-7427917883cmr7436362b3a.9.1747209747028;
        Wed, 14 May 2025 01:02:27 -0700 (PDT)
Received: from [10.72.116.125] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7423772752csm8775799b3a.45.2025.05.14.01.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 01:02:26 -0700 (PDT)
Message-ID: <74a90a55-80ae-45ff-9b37-7cb2771ed0e0@redhat.com>
Date: Wed, 14 May 2025 16:02:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v3 07/16] scripts: Use an associative array
 for qemu argument names
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
 <20250507151256.167769-8-alexandru.elisei@arm.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20250507151256.167769-8-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: L4ec0ZG3OMiywGYQIuNzNJfJQwGylsm4WSNuDusRLG8_1747209748
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_010230_761366_1047F899 
X-CRM114-Status: GOOD (  19.57  )
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
> Move away from hardcoded qemu arguments and use instead an associative
> array to get the needed arguments. This paves the way for adding kvmtool
> support to the scripts, which has a different syntax for the same VM
> configuration parameters.
> 
> Suggested-by: Andrew Jones <andrew.jones@linux.dev>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Reviewed-by: Shaoqin Huang <shahuang@redhat.com>

> ---
>   scripts/common.bash  | 10 +++++++---
>   scripts/runtime.bash |  7 +------
>   scripts/vmm.bash     |  7 +++++++
>   3 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/scripts/common.bash b/scripts/common.bash
> index 9deb87d4050d..649f1c737617 100644
> --- a/scripts/common.bash
> +++ b/scripts/common.bash
> @@ -1,4 +1,5 @@
>   source config.mak
> +source scripts/vmm.bash
>   
>   function for_each_unittest()
>   {
> @@ -26,8 +27,11 @@ function for_each_unittest()
>   				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$test_args" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
>   			fi
>   			testname=$rematch
> -			smp=1
> +			smp="${vmm_opts[$TARGET:nr_cpus]} 1"
>   			kernel=""
> +			# Intentionally don't use -append if test_args is empty
> +			# because qemu interprets the first argument after
> +			# -append as a kernel parameter.
>   			test_args=""
>   			opts=""
>   			groups=""
> @@ -39,9 +43,9 @@ function for_each_unittest()
>   		elif [[ $line =~ ^file\ *=\ *(.*)$ ]]; then
>   			kernel=$TEST_DIR/${BASH_REMATCH[1]}
>   		elif [[ $line =~ ^smp\ *=\ *(.*)$ ]]; then
> -			smp=${BASH_REMATCH[1]}
> +			smp="${vmm_opts[$TARGET:nr_cpus]} ${BASH_REMATCH[1]}"
>   		elif [[ $line =~ ^test_args\ *=\ *(.*)$ ]]; then
> -			test_args=${BASH_REMATCH[1]}
> +			test_args="${vmm_opts[$TARGET:args]} ${BASH_REMATCH[1]}"
>   		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *'"""'(.*)$ ]]; then
>   			opts=${BASH_REMATCH[2]}$'\n'
>   			while read -r -u $fd; do
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index 06cc58e79b69..86d8a2cd8528 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -34,7 +34,7 @@ premature_failure()
>   get_cmdline()
>   {
>       local kernel=$1
> -    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel -smp $smp $opts"
> +    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel $smp $test_args $opts"
>   }
>   
>   skip_nodefault()
> @@ -88,11 +88,6 @@ function run()
>       local accel="${10}"
>       local timeout="${11:-$TIMEOUT}" # unittests.cfg overrides the default
>   
> -    # If $test_args is empty, qemu will interpret the first option after -append
> -    # as a kernel parameter instead of a qemu option, so make sure the -append
> -    # option is used only if $test_args is not empy.
> -    [ -n "$test_args" ] && opts="-append $test_args $opts"
> -
>       if [ "${CONFIG_EFI}" == "y" ]; then
>           kernel=${kernel/%.flat/.efi}
>       fi
> diff --git a/scripts/vmm.bash b/scripts/vmm.bash
> index 39325858c6b3..b02055a5c0b6 100644
> --- a/scripts/vmm.bash
> +++ b/scripts/vmm.bash
> @@ -1,5 +1,12 @@
>   source config.mak
>   
> +declare -A vmm_opts=(
> +	[qemu:nr_cpus]='-smp'
> +	[qemu:kernel]='-kernel'
> +	[qemu:args]='-append'
> +	[qemu:initrd]='-initrd'
> +)
> +
>   function check_vmm_supported()
>   {
>   	case "$TARGET" in

-- 
Shaoqin


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
