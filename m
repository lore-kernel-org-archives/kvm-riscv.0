Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2ADC54E71
	for <kvm-riscv@archiver.kernel.org>; Wed, 21 May 2025 06:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Azk04b1FEKWRkC2zdoHSv9lLqKZ0l2PAr5uVqbgN+O4=; b=mObBXyelYysg3H
	x1hExzHLB1+UmJuVgPqnvOOFrYcZq/MebZM2Fv6I3TJMoptNf7K5GgTOq+SkYN6/2GQVadCfy0bW+
	XsUvft7j9ivJ+I1aNX5Mk73Fmn4st7zWQXBCAUChLvntvZqsau3UhsRd86sL9obgY8PLhDzf8/+C6
	jVDeU5PT4r2wKlnCKvu4Od8pN82pfVZlBR6DYq1LKKdXbRE7jIK+Zr8vVElVLwESuPF9K8kvisjWP
	NqpgQlLPUsP5WiXf33axrMEZcfOE7/8FDlGCPXFcSHm+NkuqXgLSwvj7K5qgbrGnyRk2Jw7/lNp2+
	fPnwxHZ7XaUwv8uipcCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHcqx-0000000Evkj-1dEs;
	Wed, 21 May 2025 06:22:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHcou-0000000EvXp-1QOc
	for kvm-riscv@lists.infradead.org;
	Wed, 21 May 2025 06:20:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747808450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=27vdWwqXm6Qw7dfKd1dwnOUfre6U0zDeEbDFMcZZEZY=;
	b=YO8ZZB3TTR/zXjMFSbg+PGXI8w8Lihatm6FXuPBn5/5PBI8yqnb5xYV7dOyH7Ckvh4QBda
	La5ewSn0ZDmWnSvbHbsA/QxQ611ubsQbnbkV1Xf4Q/YNKjhy5i74p+bKFV4SwZhBZZrkv4
	8BF7d6INgvTMorkM1fIA6fa6srhVvuU=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-Q70fi8AXM7Sh1kFufCeLUQ-1; Wed, 21 May 2025 02:20:49 -0400
X-MC-Unique: Q70fi8AXM7Sh1kFufCeLUQ-1
X-Mimecast-MFC-AGG-ID: Q70fi8AXM7Sh1kFufCeLUQ_1747808448
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-30e8425926eso7069496a91.1
        for <kvm-riscv@lists.infradead.org>; Tue, 20 May 2025 23:20:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808448; x=1748413248;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=27vdWwqXm6Qw7dfKd1dwnOUfre6U0zDeEbDFMcZZEZY=;
        b=w7D6DAPESQHIYGsmUNNxa5fEAD/nxh0+gpgftRsivU8rAtshAfrAYHckDJYHXhJqXd
         9PcmPrM7O8IM37BsUaL9rV+8w51qj/0+2yVwlDPp63PRp0RDNOzUOxewIv+rf1VJJIoI
         iWWc6zqQgjX+Y9rsCMO2L7JKz/WmlUuqAuGxnNbejhs8drMFRO/R4K0hDrhPWmCUIMpU
         Ocxk6RfsBEH9+bokfJqGTg4io2U76Rc+6LZ4Z0pvE8tB0Zjr6uJ6aLgjGfgNTDh48n3K
         xypdrMcQhkNxsCV923qmVmzKXHadzLt0f9jE0N+svGRCcuPM0X/9rzfHXnxJ47MoP5u/
         kC5w==
X-Forwarded-Encrypted: i=1; AJvYcCXvkb0MEwv1CHNI9enugSKDS6pVQeEc2F5PEUhwhbXRVtDcwJNwp45t+6v/Xc2Z/diBFxNglrf29QE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2SeQVUHbkhYWP4LEYNrtGfrP3smOemBbeJQeMY4yt3eNB7nDh
	GfbysVMfEdqY3UJrYn6MO0QDrfT38RZ9c77OKlZOoPbu+ywY5FK/lCvvOnspB+evZNUvVsZWUNg
	L5NEHt9651CzbNjcCcVh16b/VV4r6N6EZIfxB1cLdFF8H6ukHkvx3lxBFXDJgjM1Zix4=
X-Gm-Gg: ASbGnctxP1LHQ0bHbZCg7IlByTTLUEU+az+O1QKt2HDNCVB+VKoUIq3UBysqf7eetfi
	YUBqN55zGLbfYbGguELfml+oJwVv4vn4KHmFnCwdL5RpgzkdiD4a0cdPiEVZn0LvXQczYN7TP9Z
	GgDqzZVmXkjeO/RbOSKzvVHuo6a0Jw5uKPwWbxWoB/XFbv+WhvDJsCCJMl8WuFJM+xJF/7PcG59
	hXU1nV6rHiCeg81Qefp5L4soUDHVBoqLPjiRD8iaTp7VbT9BRYlJnFtzESjRnqApXihaIpsCbUN
	NjRL7H6z9RFHAvQ=
X-Received: by 2002:a17:90b:35ca:b0:2fe:baa3:b8bc with SMTP id 98e67ed59e1d1-30e832258eamr23096808a91.23.1747808447860;
        Tue, 20 May 2025 23:20:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCcJqZvem5ZOsw0GUieRAaMuIKN6FQwGBBKSGgLmmfZRpS0KvtQJGPwRUgMl3I4UcNRsWE9Q==
X-Received: by 2002:a17:90b:35ca:b0:2fe:baa3:b8bc with SMTP id 98e67ed59e1d1-30e832258eamr23096785a91.23.1747808447373;
        Tue, 20 May 2025 23:20:47 -0700 (PDT)
Received: from [10.72.116.61] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365b2d8fsm2847557a91.7.2025.05.20.23.20.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 23:20:46 -0700 (PDT)
Message-ID: <5b284638-2082-4d85-9e4d-4514ee15e193@redhat.com>
Date: Wed, 21 May 2025 14:20:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v3 16/16] scripts: Enable kvmtool
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
 <20250507151256.167769-17-alexandru.elisei@arm.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20250507151256.167769-17-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lu1iPVio_EQt5DIiOjYxflqTDjFJPclqcfsJXE6AoRU_1747808448
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_232052_453493_8882C61E 
X-CRM114-Status: GOOD (  25.38  )
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
> Everything is in place to run the tests using kvmtool:
> 
> $ ./configure --target=kvmtool
> $ make clean && make
> $ KVMTOOL=<path/to/kvmtool> ./run_tests.sh
> 
> so enable it, and remove ERRATA_FORCE=y when configuring for kvmtool,
> because the runner will generate and pass the correct environment to
> kvmtool.
> 
> Missing is support for EFI tests. That's because distros don't ship a

Missing should be Nothing?

> EDK2 binary compiled for kvmtool, and on top of that kvm-unit-tests as
> an EFI app hasn't been tested to work with kvmtool.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Reviewed-by: Shaoqin Huang <shahuang@redhat.com>

> ---
>   README.md        | 18 +++++++++++++++++-
>   arm/efi/run      |  5 +++++
>   configure        |  1 -
>   scripts/vmm.bash |  2 +-
>   4 files changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/README.md b/README.md
> index be07dc28a094..723ce04cd978 100644
> --- a/README.md
> +++ b/README.md
> @@ -65,6 +65,9 @@ or:
>   
>   to run them all.
>   
> +All tests can be run using QEMU. On arm and arm64, tests can also be run using
> +kvmtool.
> +
>   By default the runner script searches for a suitable QEMU binary in the system.
>   To select a specific QEMU binary though, specify the QEMU=path/to/binary
>   environment variable:
> @@ -78,12 +81,25 @@ ACCEL=name environment variable:
>   
>   For running tests that involve migration from one QEMU instance to another
>   you also need to have the "ncat" binary (from the nmap.org project) installed,
> -otherwise the related tests will be skipped.
> +otherwise the related tests will be skipped. kvmtool does not support migration.
> +
> +As for running a test with kvmtool, please configure kvm-unit-tests accordingly
> +first:
> +
> +   ./configure --arch=arm64 --target=kvmtool
> +
> +then run the test(s) like with QEMU above.
> +
> +To select a kvmtool binary, specify the KVMTOOL=path/to/binary environment
> +variable. kvmtool supports only kvm as the accelerator.
>   
>   ## Running the tests with UEFI
>   
>   Check [x86/efi/README.md](./x86/efi/README.md).
>   
> +On arm and arm64, this is only supported with QEMU; kvmtool cannot run the
> +tests under UEFI.
> +
>   # Tests configuration file
>   
>   The test case may need specific runtime configurations, for
> diff --git a/arm/efi/run b/arm/efi/run
> index 53d71297cc52..0843725ec360 100755
> --- a/arm/efi/run
> +++ b/arm/efi/run
> @@ -15,6 +15,11 @@ source scripts/vmm.bash
>   
>   check_vmm_supported
>   
> +if [[ $TARGET = "kvmtool" ]]; then
> +	echo "kvmtool does not support EFI tests."
> +	exit 2
> +fi
> +
>   if [ -f /usr/share/qemu-efi-aarch64/QEMU_EFI.fd ]; then
>   	DEFAULT_UEFI=/usr/share/qemu-efi-aarch64/QEMU_EFI.fd
>   elif [ -f /usr/share/edk2/aarch64/QEMU_EFI.silent.fd ]; then
> diff --git a/configure b/configure
> index 8c4400db42bc..d5f9995172f8 100755
> --- a/configure
> +++ b/configure
> @@ -392,7 +392,6 @@ elif [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
>           : "${uart_early_addr:=0x9000000}"
>       elif [ "$target" = "kvmtool" ]; then
>           : "${uart_early_addr:=0x1000000}"
> -        errata_force=1
>       else
>           echo "--target must be one of 'qemu' or 'kvmtool'!"
>           usage
> diff --git a/scripts/vmm.bash b/scripts/vmm.bash
> index ef9819f4132c..4ae60c37a6e8 100644
> --- a/scripts/vmm.bash
> +++ b/scripts/vmm.bash
> @@ -159,7 +159,7 @@ declare -A vmm_opts=(
>   function check_vmm_supported()
>   {
>   	case "$TARGET" in
> -	qemu)
> +	qemu | kvmtool)
>   		return 0
>   		;;
>   	*)

-- 
Shaoqin


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
