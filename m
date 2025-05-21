Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B099C2D0CD
	for <kvm-riscv@archiver.kernel.org>; Wed, 21 May 2025 06:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ugHuf7nvVgYd/aVtSXLRlouv0gKFjpLtZcAX9N2SSMg=; b=w9DiKlz/bj7Lrs
	Nr36RwO3CWO3SPqImBKo2u7rO0tR/J5GSLWNq3uJFyZdOeMtVDSGEI1i/1Vg6s41bdPbYNOAJz3Z4
	+tcI6YhMI2oEHPlruGyK01oNZGYMs3+njH3PNm0RLO8Zp1XRFDCbpMVWP7Lovz4EY7i7Y8d3gfPLI
	Yb7e3w6myXPL1OnUZ08W5VGUqwVKYyc4vIRGxGveZ6ngwNqFTY1ogK5tIU9E6YNvpk+cWMm1XGO0n
	gJSNGg8wFY8qxq9ROnEc9pSdMzjlwW3XKqCORAUOVJoNN9n4Llo5iogWyLtvuOB5vHA8KXm70IFRf
	fBiZI8o4nns4a5uu5PiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHcXi-0000000Etjm-1AIk;
	Wed, 21 May 2025 06:03:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHcXf-0000000EtjQ-3SBH
	for kvm-riscv@lists.infradead.org;
	Wed, 21 May 2025 06:03:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747807382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Luzvl9YYiKKkKv2ZrlEtI5HQQUPGehqlA/R1MmkzXtU=;
	b=A7V5o52Cl9ryx/8WS3bHeBGxGnrrmzepfGJCdEKikv1ZwZN5bnShW6YPKQd3NUCdhW8j4p
	ZXlVkDRnOm4sifCojO9/5RCKcZWZfnDIPiMdAwk3tVcWM3ualaiWoLw1fIcXJOMqtSybUD
	m37VaBETR9hoq2gJDM6LIHi35k/yDwc=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-psOIQEraPTWSiTb0WMvrTA-1; Wed, 21 May 2025 02:03:00 -0400
X-MC-Unique: psOIQEraPTWSiTb0WMvrTA-1
X-Mimecast-MFC-AGG-ID: psOIQEraPTWSiTb0WMvrTA_1747807380
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7394792f83cso4997989b3a.3
        for <kvm-riscv@lists.infradead.org>; Tue, 20 May 2025 23:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747807380; x=1748412180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Luzvl9YYiKKkKv2ZrlEtI5HQQUPGehqlA/R1MmkzXtU=;
        b=ZV6jpPEUGwLySk/Psq/WczOn+y11U0+2GSbIp7ERlfcNmVSQxqnAOYuGYESFP5PJ3v
         JBnd8J4ezSdW7XiNPsJFds3YYOOrJBRQc9sHGvU38NwyN17qX4O6yFs7AASO/KcIyJHV
         +4UWGHuB5WtUQebBB0jYGEvECm5z3xHSiFYy6TaiJW8HKuwB0tzYOXd2jYQ2S1CNOdyj
         SEjGiA49H7+7YaIhI04H8v/6Kjre3QAIrZpyF57qn0Nm9J0DTaX5uNqLWeZ1sJ7are+3
         bl738aViwm/B34Q2tDVdk7NItw3fb0wK+jp9NvS6N0XhEIxFG/tL5DQikADz26vLP1/b
         bkLw==
X-Forwarded-Encrypted: i=1; AJvYcCXikXuqiYp8+jLz0QUYRRa3ndB2z2KmOmL4SaJ3ed1ws/8llyL+c8O5/DoE28sA0DNvZaKBVET+XMI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyocviqu/yW5fsRkUytfNf6wkaHxVPOw3bSCyW4NRSAuInMDLyW
	JAeGadEKPHNaKyDxa6g+hww/5eW/nBPPatFcHgtd8ZI9I6iIDlojqa5hVc/wl2ZvQVWY9BM4MWW
	6NhpjpbM4PZTbbtMKyl1U981XUJlT2BWsE8wZaYW2xYTtudTXx3oNfWflU5oE2kcboAA=
X-Gm-Gg: ASbGncuUBZqcb6PsIVrr53PIhq7k6I4te6l/1GoSfTS1ZJi0w1aA67gtCWns6/drqIW
	5jl3bkYj7IVLEaQQNFzJ161YEj7s720jeEcuvt60d5/QD8NS+aC0zi/5edMvI80Bneq7EbDp3rn
	dpdA/2w5JgRGZqPhK462vwC9f9xiYEKJWZl0QgFylRO30I6ef7xIpTKEzIIxRTwv3Fx5DfV6G7w
	yETLFJLi9c5UgGE4JXs0eH90hpXgfiBR62p6xR4iG5jlJ9mE3xVZwzcjEI3JRalyTGfqA3d4ec7
	jV+VMUoWNuRxaQo=
X-Received: by 2002:a05:6a00:1788:b0:736:5544:7ad7 with SMTP id d2e1a72fcca58-742a97eb5b9mr28757203b3a.14.1747807379866;
        Tue, 20 May 2025 23:02:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkzCM7/Ctb9gNAgNxzZrfSW/B0q8J+JojRSlwDFqY3yzQr38av5VTKAulIBRs6Cj/pJdZcvA==
X-Received: by 2002:a05:6a00:1788:b0:736:5544:7ad7 with SMTP id d2e1a72fcca58-742a97eb5b9mr28757152b3a.14.1747807379436;
        Tue, 20 May 2025 23:02:59 -0700 (PDT)
Received: from [10.72.116.61] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829b87sm8888368b3a.114.2025.05.20.23.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 23:02:58 -0700 (PDT)
Message-ID: <3b33d060-895a-4f4b-a067-66164a29f8b4@redhat.com>
Date: Wed, 21 May 2025 14:02:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v3 13/16] scripts: Do not probe for maximum
 number of VCPUs when using kvmtool
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
 <20250507151256.167769-14-alexandru.elisei@arm.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20250507151256.167769-14-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -MYZF3qwkAo1Yq9fztkF8PeUFRKZ7T5e2AGo6U9uJDo_1747807380
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_230303_936627_32CA9DD5 
X-CRM114-Status: GOOD (  18.34  )
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

Reviewed-by: Shaoqin Huang <shahuang@redhat.com>

> ---
>   run_tests.sh         |  3 ++-
>   scripts/runtime.bash | 16 ----------------
>   scripts/vmm.bash     | 24 ++++++++++++++++++++++++
>   3 files changed, 26 insertions(+), 17 deletions(-)
> 
> diff --git a/run_tests.sh b/run_tests.sh
> index 150a06a91064..a69c3665b7a4 100755
> --- a/run_tests.sh
> +++ b/run_tests.sh
> @@ -10,6 +10,7 @@ if [ ! -f config.mak ]; then
>   fi
>   source config.mak
>   source scripts/common.bash
> +source scripts/vmm.bash
>   
>   function usage()
>   {
> @@ -90,7 +91,7 @@ while [ $# -gt 0 ]; do
>               list_tests="yes"
>               ;;
>           --probe-maxsmp)
> -            probe_maxsmp
> +            ${vmm_opts[$TARGET:probe_maxsmp]}
>               ;;
>           --)
>               ;;
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index 01ec8eae2bba..a802686c511d 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -209,19 +209,3 @@ function run()
>   
>       return $ret
>   }
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
>   	return 0
>   }
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
>   function kvmtool_parse_premature_failure()
>   {
>   	local log="$@"
> @@ -114,6 +130,12 @@ function kvmtool_parse_premature_failure()
>   	return 0
>   }
>   
> +function kvmtool_probe_maxsmp()
> +{
> +	echo "kvmtool automatically limits the number of VCPUs to maximum supported"
> +	echo "The 'smp' test parameter won't be modified"
> +}
> +
>   declare -A vmm_opts=(
>   	[qemu:nr_cpus]='-smp'
>   	[qemu:kernel]='-kernel'
> @@ -122,6 +144,7 @@ declare -A vmm_opts=(
>   	[qemu:default_opts]=''
>   	[qemu:fixup_return_code]=qemu_fixup_return_code
>   	[qemu:parse_premature_failure]=qemu_parse_premature_failure
> +	[qemu:probe_maxsmp]=qemu_probe_maxsmp
>   
>   	[kvmtool:nr_cpus]='--cpus'
>   	[kvmtool:kernel]='--kernel'
> @@ -130,6 +153,7 @@ declare -A vmm_opts=(
>   	[kvmtool:default_opts]="$KVMTOOL_DEFAULT_OPTS"
>   	[kvmtool:fixup_return_code]=kvmtool_fixup_return_code
>   	[kvmtool:parse_premature_failure]=kvmtool_parse_premature_failure
> +	[kvmtool:probe_maxsmp]=kvmtool_probe_maxsmp
>   )
>   
>   function check_vmm_supported()

-- 
Shaoqin


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
