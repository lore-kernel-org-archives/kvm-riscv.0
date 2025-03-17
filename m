Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553FAC282EC
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 08:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eTb9IBd1Ny9RJ1YfAaz7CzxHbitQTkbr2YatglYJKuQ=; b=xYnF/CGna8ve19
	3U4LHNVY+flb0wq2RNs1FfXYVlA11AbC4mGfjdP/YTu/AmNh+yPUEBp/iMdzf9u4q7i7d6P3ABZKa
	sMLveoRl4tjwYPWHiPDzD0lseD4EsplPJlFW4kamphhB9U0dB072VFeYlIyGOZ6BzkVZgpV5B+Qwr
	g7Xuj9mO1iukQ75yc1E4mx8DUSONKAEv/fDNrSs3I6TTWO6lbmVtE/WKQIgaiBgMn4sF6/TpDmx2T
	NasrJCVg4c2Uy47qDGd36g7R3gxDBwBMef7t2SEo9jOy24kBsR1azWFm7M5MdW6rMN6sze6ZfAODO
	YTj2qHKMCGvK+K9FbuYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6Jg-00000001q0d-3yLd;
	Mon, 17 Mar 2025 08:59:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6Do-00000001ozZ-3ece
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 08:53:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742201599;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Z0UeEMmq83xCl69Q71PKJopRqUbkXECgaGSxsoBFy8=;
	b=Egdktkr+t7IIEybO9Z+N8T0mMTbFSRD6ZARwngbrUPZHOb+54Plt+lL2KB6wWsa4533AmU
	OjogXj2/RLWju2Iunyw2rKV6h4YVOZTG5mw7qzMiEoSdUzonvR8KEUF+yI9xr6EzLWBDof
	4MhxWCOeTzZI1ebbhLy+55dd60dOgiw=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-_oQOefuBOnuDgDiAzjdXDA-1; Mon, 17 Mar 2025 04:53:18 -0400
X-MC-Unique: _oQOefuBOnuDgDiAzjdXDA-1
X-Mimecast-MFC-AGG-ID: _oQOefuBOnuDgDiAzjdXDA_1742201597
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85b34bd03c4so614462639f.3
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 01:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742201597; x=1742806397;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Z0UeEMmq83xCl69Q71PKJopRqUbkXECgaGSxsoBFy8=;
        b=OETBSIBaQWGYx0Y+AkLYIztpwBkNdN3oWdT9HjmBUyqkis3Vy8KnzzO82/GBumMD9j
         38lC94ohT5pbbEg0wam3WNvlWup3TOouUAD23844YCr7I7WPSdZ++gGPuCYNXuWqzG0X
         ztAiYRHjqUtUvo6ktoCiDqfrQoJqW01hkOS/bV9quEJIu+MFLSy9ISrO17bjQvokyrie
         0goRP4wsBAmgFNzfRzcpIzzJobwCJ4aIjLBHgXY3N5ZDxuvUvoW2z25Buwq/GxCRUjm8
         7WYWpBEmxFDgzFBprcW4XSyeVglfSzqsEQj3X+0nePh5FS/E+YQb70EKavsqsZ8nDBHF
         5glA==
X-Forwarded-Encrypted: i=1; AJvYcCWySmF+h4uv3W6jLfGLvSXqg3lzes8t4+DHM4BuLaniZxpTDcybnfsfuPju4KfMKwlnG+C2gusZGHc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZQSgosqgOF+wFx9IvSqx6OOs4CnR8tjC0cD3V6L4YVBVLHsj+
	M4Jrxz8GGML7nndELwVpdT+AOC2iEYzKDFH9IotV02jdIEQzhwMQ4iPjCnEYiTyTu+xXM7lkkxO
	wncsQfgiBZgpo4YxN0LguV7lWU+f3qJFpMw5TcRZByFllFT9s/pGQejXEyW0iSgQ=
X-Gm-Gg: ASbGncsum3hNeEA111CysbLCCOg9ot7Bp3pfSloKICFILfjB0Pl17+BbkCFWtQXPeD+
	2ix2Gsxb7w/ZFLJHbuelEvuAffd3Q06gk8odI5K+RExRAP6/jFqGQf+xCZBBW4ult66+qT0XHYf
	hbhfvJTrfjQMaZs2fCzBEClbSqa4WPFis/HxZWk54BSBEPG+GdfyJObRq8vMQjePgfn6BiBphih
	4RobiopyRVvV3+lMzS+yuoJSwAFzOsBVzkeAsBU+F49AKMMWTdfU0MJrPPYRetIfi1xAy6QxBH0
	YqlQtIYW0rDLpbh+Kpi4OQkt7IHegQYA6Aa6WFpp4/QuPvdiNjp3gZrT7a1diZ0=
X-Received: by 2002:a05:6602:2cd6:b0:85b:4d28:2aa9 with SMTP id ca18e2360f4ac-85dc4792a8dmr1487055339f.4.1742201597316;
        Mon, 17 Mar 2025 01:53:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhvA6uoxE9FkDt+/PrcVIKJmkPlXjaFVJVOpZAvngURmdObKJVrgiM4GTTPXD1x6LoFTwjrg==
X-Received: by 2002:a05:6602:2cd6:b0:85b:4d28:2aa9 with SMTP id ca18e2360f4ac-85dc4792a8dmr1487053639f.4.1742201597020;
        Mon, 17 Mar 2025 01:53:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2638147c9sm2161677173.112.2025.03.17.01.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 01:53:16 -0700 (PDT)
Message-ID: <4ab33998-4d16-4ecb-aa76-3919afcbf2d7@redhat.com>
Date: Mon, 17 Mar 2025 09:53:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v2 4/5] configure: Add --qemu-cpu option
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, andrew.jones@linux.dev,
 alexandru.elisei@arm.com
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, vladimir.murzin@arm.com
References: <20250314154904.3946484-2-jean-philippe@linaro.org>
 <20250314154904.3946484-6-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250314154904.3946484-6-jean-philippe@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jUd7-wbfl66zCy4sl7bgF8fYzZPelHzT0Ps80delif8_1742201597
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_015320_989702_86F03412 
X-CRM114-Status: GOOD (  23.15  )
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
Reply-To: eric.auger@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Hi Jean-Philippe,


On 3/14/25 4:49 PM, Jean-Philippe Brucker wrote:
> Add the --qemu-cpu option to let users set the CPU type to run on.
> At the moment --processor allows to set both GCC -mcpu flag and QEMU
> -cpu. On Arm we'd like to pass `-cpu max` to QEMU in order to enable all
> the TCG features by default, and it could also be nice to let users
> modify the CPU capabilities by setting extra -cpu options.
> Since GCC -mcpu doesn't accept "max" or "host", separate the compiler
> and QEMU arguments.
>
> `--processor` is now exclusively for compiler options, as indicated by
> its documentation ("processor to compile for"). So use $QEMU_CPU on
> RISC-V as well.
>
> Suggested-by: Andrew Jones <andrew.jones@linux.dev>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  scripts/mkstandalone.sh |  2 +-
>  arm/run                 | 17 +++++++++++------
>  riscv/run               |  8 ++++----
>  configure               |  7 +++++++
>  4 files changed, 23 insertions(+), 11 deletions(-)
>
> diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
> index 2318a85f..6b5f725d 100755
> --- a/scripts/mkstandalone.sh
> +++ b/scripts/mkstandalone.sh
> @@ -42,7 +42,7 @@ generate_test ()
>  
>  	config_export ARCH
>  	config_export ARCH_NAME
> -	config_export PROCESSOR
> +	config_export QEMU_CPU
>  
>  	echo "echo BUILD_HEAD=$(cat build-head)"
>  
> diff --git a/arm/run b/arm/run
> index efdd44ce..561bafab 100755
> --- a/arm/run
> +++ b/arm/run
> @@ -8,7 +8,7 @@ if [ -z "$KUT_STANDALONE" ]; then
>  	source config.mak
>  	source scripts/arch-run.bash
>  fi
> -processor="$PROCESSOR"
> +qemu_cpu="$QEMU_CPU"
>  
>  if [ "$QEMU" ] && [ -z "$ACCEL" ] &&
>     [ "$HOST" = "aarch64" ] && [ "$ARCH" = "arm" ] &&
> @@ -37,12 +37,17 @@ if [ "$ACCEL" = "kvm" ]; then
>  	fi
>  fi
>  
> -if [ "$ACCEL" = "kvm" ] || [ "$ACCEL" = "hvf" ]; then
> -	if [ "$HOST" = "aarch64" ] || [ "$HOST" = "arm" ]; then
> -		processor="host"
> +if [ -z "$qemu_cpu" ]; then
> +	if ( [ "$ACCEL" = "kvm" ] || [ "$ACCEL" = "hvf" ] ) &&
> +	   ( [ "$HOST" = "aarch64" ] || [ "$HOST" = "arm" ] ); then
> +		qemu_cpu="host"
>  		if [ "$ARCH" = "arm" ] && [ "$HOST" = "aarch64" ]; then
> -			processor+=",aarch64=off"
> +			qemu_cpu+=",aarch64=off"
>  		fi
> +	elif [ "$ARCH" = "arm64" ]; then
> +		qemu_cpu="cortex-a57"
> +	else
> +		qemu_cpu="cortex-a15"
>  	fi
>  fi
>  
> @@ -71,7 +76,7 @@ if $qemu $M -device '?' | grep -q pci-testdev; then
>  fi
>  
>  A="-accel $ACCEL$ACCEL_PROPS"
> -command="$qemu -nodefaults $M $A -cpu $processor $chr_testdev $pci_testdev"
> +command="$qemu -nodefaults $M $A -cpu $qemu_cpu $chr_testdev $pci_testdev"
>  command+=" -display none -serial stdio"
>  command="$(migration_cmd) $(timeout_cmd) $command"
>  
> diff --git a/riscv/run b/riscv/run
> index e2f5a922..02fcf0c0 100755
> --- a/riscv/run
> +++ b/riscv/run
> @@ -11,12 +11,12 @@ fi
>  
>  # Allow user overrides of some config.mak variables
>  mach=$MACHINE_OVERRIDE
> -processor=$PROCESSOR_OVERRIDE
> +qemu_cpu=$QEMU_CPU_OVERRIDE
>  firmware=$FIRMWARE_OVERRIDE
>  
> -[ "$PROCESSOR" = "$ARCH" ] && PROCESSOR="max"
> +[ -z "$QEMU_CPU" ] && QEMU_CPU="max"
>  : "${mach:=virt}"
> -: "${processor:=$PROCESSOR}"
> +: "${qemu_cpu:=$QEMU_CPU}"
>  : "${firmware:=$FIRMWARE}"
>  [ "$firmware" ] && firmware="-bios $firmware"
>  
> @@ -32,7 +32,7 @@ fi
>  mach="-machine $mach"
>  
>  command="$qemu -nodefaults -nographic -serial mon:stdio"
> -command+=" $mach $acc $firmware -cpu $processor "
> +command+=" $mach $acc $firmware -cpu $qemu_cpu "
>  command="$(migration_cmd) $(timeout_cmd) $command"
>  
>  if [ "$UEFI_SHELL_RUN" = "y" ]; then
> diff --git a/configure b/configure
> index 5306bad3..d25bd23e 100755
> --- a/configure
> +++ b/configure
> @@ -52,6 +52,7 @@ page_size=
>  earlycon=
>  efi=
>  efi_direct=
> +qemu_cpu=
>  
>  # Enable -Werror by default for git repositories only (i.e. developer builds)
>  if [ -e "$srcdir"/.git ]; then
> @@ -69,6 +70,8 @@ usage() {
>  	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
>  	                           arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
>  	    --processor=PROCESSOR  processor to compile for ($processor)
> +	    --qemu-cpu=CPU         the CPU model to run on. The default depends on
> +	                           the configuration, usually it is "host" or "max".
nit: I would remove 'usually it is "host" or "max"'. I don't see any
consistency check between qemu_cpu and processor in case it is
explicitly set? Do we care? Eric

>  	    --target=TARGET        target platform that the tests will be running on (qemu or
>  	                           kvmtool, default is qemu) (arm/arm64 only)
>  	    --cross-prefix=PREFIX  cross compiler prefix
> @@ -142,6 +145,9 @@ while [[ $optno -le $argc ]]; do
>          --processor)
>  	    processor="$arg"
>  	    ;;
> +	--qemu-cpu)
> +	    qemu_cpu="$arg"
> +	    ;;
>  	--target)
>  	    target="$arg"
>  	    ;;
> @@ -464,6 +470,7 @@ ARCH=$arch
>  ARCH_NAME=$arch_name
>  ARCH_LIBDIR=$arch_libdir
>  PROCESSOR=$processor
> +QEMU_CPU=$qemu_cpu
>  CC=$cc
>  CFLAGS=$cflags
>  LD=$cross_prefix$ld

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
