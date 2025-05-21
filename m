Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82269C2D0CD
	for <kvm-riscv@archiver.kernel.org>; Wed, 21 May 2025 03:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+aEK45WJ4SVTFWp1X1r660uTA+BeVx7SA7Cq3IfDvXo=; b=WgtugJt6mf802u
	oADsfkCmEMfK38IVhLCazOWTK13llKrkeGw2Y/M04gp0FavqF8f2D0jKIxZFTuSjGIaexL4IAw7Su
	1sIde72g8TGM75MQtutAwhmHWZRX6xUZlbV0p5yIwKVQylb1rF+VcGu1H2+pOle3RsfQKd6Ph3Ob5
	F4yPFB5UhoRR/P8t7mDltIlNQTzPV5pYs1M+G7AQtaFrqJUXmKKLbSw+3n0HWSG/bDmGi/w88yC9q
	BWPKTDdn07esVg71xJjaeJ1XEDFmK93MJPLMGEOQASGn69iDmtxnB1xoSnHU5VG+uWX35+QauxoFs
	BBSqD8RnnkCfIkCiEHTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHaID-0000000EhAe-3MYW;
	Wed, 21 May 2025 03:38:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHa1b-0000000Efkx-3UUY
	for kvm-riscv@lists.infradead.org;
	Wed, 21 May 2025 03:21:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747797704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jUSOmA0/3Qa3aXRPXfKpDedwfKwE88WYumy/XPPRjQc=;
	b=Yk1eRWUg+8aP5V7Q/RPQn5iKM+ypyPmDn+zd/rfLApBHQ6I9MuOXMxC16lgoiXuNERdx+W
	xmUYtnRer5vGzAWqKpoB/sFXDR8rsI36Ucbh5/SHV2ZxMLFHU3GemL+uI6Evkcpe3s/GI/
	wXA/jVuzWzeuTMUPVrXVTINAgPqaRaM=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-GO84UnNlMVKTYSSbwCxsrA-1; Tue, 20 May 2025 23:21:40 -0400
X-MC-Unique: GO84UnNlMVKTYSSbwCxsrA-1
X-Mimecast-MFC-AGG-ID: GO84UnNlMVKTYSSbwCxsrA_1747797699
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22c31b55ac6so99742995ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 20 May 2025 20:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747797699; x=1748402499;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jUSOmA0/3Qa3aXRPXfKpDedwfKwE88WYumy/XPPRjQc=;
        b=N4dvsdzf2wwEjL2SJE/eCZKRS1s12AnevY33Tur8XSQmxXIYKziKDSUTKnG2GKsIDm
         tEoRbaFak5pj3S6TmcwdHWocu95kK20HchYW8sveFc7ybHEqrBWmpR2xuvm0EODOtVjI
         yR3VDZSNY0C3x9W8YHXKeqLUKYXtHZObOlGxmJ/evj7Go2Gda6PFXSQOnCKDtTCSAB3m
         5rIseUWZ9QuCkHoCFAo5Ylh7yfFPlYztFx520Y56sYNxTzauQTaZA4U9kczho1dqOfGL
         e4krJnId7Ttl0+Zt31J03klBKiGNmSltSeY4RonDXYzfssCRMRoTjDS2GMEwJPjg+0XK
         BBTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkFMJjOzNd2tjVYdHfOb4b6GrmFO5fIjRHuTN2X3bGq5XMKeWKvE5sOKf0MXGQ1idxFBB8d1OoIHk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxGgDaooqWekAV+kQGn3MLc27Qb8YR4hsahojBrXVOdMZQaBsZl
	YM/ZCrEeiKZ51utDfedjmZU2B/i3f580mAV6w5PU3KgmG8bs+8gT2nKSJkNppoPAb5kMACHXMQk
	PEPjiqDSgwnTFd9+Z8g/YSHW9tmU9Zsb2rFVCoNBQEnAXeTs+FBBPE7sPiLt6jnkzj6s=
X-Gm-Gg: ASbGnctl8t+TAedf39sW5V2ycRI4rA4L93sEu4XQlYCFSHWhTjlW+Jn04KwCclnArg4
	TTDc+JWf81L7uWvAIdbyHfac8mPRlT+m9tfFpODgkhaqvCls8Z3l0dNfZR4NErkm7bgpLd/FE1w
	Coc2V9UFKux+3f8gitP5b/p5yGvP3LzPPNqHQqufyO96aIjdXFm9nbSfaGU83nKHVi3o+pX4aMN
	URZ6hgzzYT/n8JS7NULj41EYZMCvglumRfyfl5WFoHcEdS5m29zqZUKtry8NxJd07iMjbDkch3t
	P8WNacddpY185Iw=
X-Received: by 2002:a17:902:d481:b0:232:4f8c:1b01 with SMTP id d9443c01a7336-2324f8c1cb2mr137961405ad.43.1747797699242;
        Tue, 20 May 2025 20:21:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlhvOC0UNtRC7lIlfulUbJxFqkdOC7pIWuh5IMs24BhyaPmpuqy0MrBWfWyaOHGCOUkRmRPA==
X-Received: by 2002:a17:902:d481:b0:232:4f8c:1b01 with SMTP id d9443c01a7336-2324f8c1cb2mr137961065ad.43.1747797698773;
        Tue, 20 May 2025 20:21:38 -0700 (PDT)
Received: from [10.72.116.61] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9784bsm83924955ad.113.2025.05.20.20.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 20:21:38 -0700 (PDT)
Message-ID: <79d7ee71-a68a-4cde-8796-fb42df59cfce@redhat.com>
Date: Wed, 21 May 2025 11:21:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v3 10/16] scripts: Add default arguments
 for kvmtool
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
 <20250507151256.167769-11-alexandru.elisei@arm.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20250507151256.167769-11-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5Zo-1f3t84KT_2r7pCrE1kj3da7Zv0u-sCl80qpz5Dg_1747797699
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_202147_948227_50B81164 
X-CRM114-Status: GOOD (  29.78  )
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
> kvmtool, unless told otherwise, will do its best to make sure that a kernel
> successfully boots in a virtual machine. It does things like automatically
> creating a rootfs and adding extra parameters to the kernel command line.
> This is actively harmful to kvm-unit-tests, because some tests parse the
> kernel command line and they will fail if they encounter the options added
> by kvmtool.
> 
> Fortunately for us, kvmtool commit 5613ae26b998 ("Add --nodefaults command
> line argument") addded the --nodefaults kvmtool parameter which disables
> all the implicit virtual machine configuration that cannot be disabled by
> using other parameters, like modifying the kernel command line. So always
> use --nodefaults to allow a test to run.
> 
> kvmtool can also be too verbose when running a virtual machine, and this is
> controlled by several parameters. Add those to the default kvmtool command
> line to reduce this verbosity to a minimum.
> 
> Before:
> 
> $ vm run arm/selftest.flat --cpus 2 --mem 256 --params "setup smp=2 mem=256"
> Info: # lkvm run -k arm/selftest.flat -m 256 -c 2 --name guest-5035
> Unknown subtest
> 
> EXIT: STATUS=127
> Warning: KVM compatibility warning.
>      virtio-9p device was not detected.
>      While you have requested a virtio-9p device, the guest kernel did not initialize it.
>      Please make sure that the guest kernel was compiled with CONFIG_NET_9P_VIRTIO=y enabled in .config.
> Warning: KVM compatibility warning.
>      virtio-net device was not detected.
>      While you have requested a virtio-net device, the guest kernel did not initialize it.
>      Please make sure that the guest kernel was compiled with CONFIG_VIRTIO_NET=y enabled in .config.
> Info: KVM session ended normally.
> 
> After:
> 
> $ vm run arm/selftest.flat --nodefaults --network mode=none --loglevel=warning --cpus 2 --mem 256 --params "setup smp=2 mem=256"
> PASS: selftest: setup: smp: number of CPUs matches expectation
> INFO: selftest: setup: smp: found 2 CPUs
> PASS: selftest: setup: mem: memory size matches expectation
> INFO: selftest: setup: mem: found 256 MB
> SUMMARY: 2 tests
> 
> EXIT: STATUS=1
> 
> Note that KVMTOOL_DEFAULT_OPTS can be overwritten by an environment
> variable with the same name, but it's not documented in the help string for
> run_tests.sh. This has been done on purpose, since overwritting
> KVMTOOL_DEFAULT_OPTS should only be necessary for debugging or development
> purposes.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>   scripts/common.bash | 10 +++++-----
>   scripts/vmm.bash    | 13 +++++++++++++
>   2 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/common.bash b/scripts/common.bash
> index 0645235d8baa..ee0ae71948c2 100644
> --- a/scripts/common.bash
> +++ b/scripts/common.bash
> @@ -56,7 +56,7 @@ function for_each_unittest()
>   			# because qemu interprets the first argument after
>   			# -append as a kernel parameter.
>   			test_args=""
> -			opts=""
> +			opts="${vmm_opts[$TARGET:default_opts]}"
>   			groups=""
>   			arch=""
>   			machine=""
> @@ -70,13 +70,13 @@ function for_each_unittest()
>   		elif [[ $line =~ ^test_args\ *=\ *(.*)$ ]]; then
>   			test_args="${vmm_opts[$TARGET:args]} ${BASH_REMATCH[1]}"
>   		elif [[ $TARGET = "qemu" ]] && [[ $line =~ ^(extra_params|qemu_params)\ *=\ *'"""'(.*)$ ]]; then
> -			opts=$(parse_opts ${BASH_REMATCH[2]}$'\n' $fd)
> +			opts="${vmm_opts[$TARGET:default_opts]} $(parse_opts ${BASH_REMATCH[2]}$'\n' $fd)"
>   		elif [[ $TARGET  = "qemu" ]] && [[ $line =~ ^(extra_params|qemu_params)\ *=\ *(.*)$ ]]; then
> -			opts=${BASH_REMATCH[2]}
> +			opts="${vmm_opts[$TARGET:default_opts]} ${BASH_REMATCH[2]}"
>   		elif [[ $TARGET = "kvmtool" ]] && [[ $line =~ ^kvmtool_params\ *=\ *'"""'(.*)$ ]]; then
> -			opts=$(parse_opts ${BASH_REMATCH[1]}$'\n' $fd)
> +			opts="${vmm_opts[$TARGET:default_opts]} $(parse_opts ${BASH_REMATCH[1]}$'\n' $fd)"
>   		elif [[ $TARGET = "kvmtool" ]] && [[ $line =~ ^kvmtool_params\ *=\ *(.*)$ ]]; then
> -			opts=${BASH_REMATCH[1]}
> +			opts="${vmm_opts[$TARGET:default_opts]} ${BASH_REMATCH[1]}"
>   		elif [[ $line =~ ^groups\ *=\ *(.*)$ ]]; then
>   			groups=${BASH_REMATCH[1]}
>   		elif [[ $line =~ ^arch\ *=\ *(.*)$ ]]; then
> diff --git a/scripts/vmm.bash b/scripts/vmm.bash
> index 20968f2e6b10..d24a4c4b8713 100644
> --- a/scripts/vmm.bash
> +++ b/scripts/vmm.bash
> @@ -1,5 +1,16 @@
>   source config.mak
>   
> +# The following parameters are enabled by default when running a test with
> +# kvmtool:
> +# --nodefaults: suppress VM configuration that cannot be disabled otherwise
> +#               (like modifying the supplied kernel command line). Tests that
> +#               use the command line will fail without this parameter.

Maybe change it to below is better? (Put the 'Otherwise' to the next 
paragraph)

# --nodefaults: suppress VM configuration that cannot be disabled
#               (like modifying the supplied kernel command line). 	# 
            Otherwise tests that use the command line will fail
#               without this parameter.

Others looks good to me.

Reviewed-by: Shaoqin Huang <shahuang@redhat.com>

> +# --network mode=none: do not create a network device. kvmtool tries to help the
> +#               user by automatically create one, and then prints a warning
> +#               when the VM terminates if the device hasn't been initialized.
> +# --loglevel=warning: reduce verbosity
> +: "${KVMTOOL_DEFAULT_OPTS:="--nodefaults --network mode=none --loglevel=warning"}"
> +
>   ##############################################################################
>   # qemu_fixup_return_code translates the ambiguous exit status in Table1 to that
>   # in Table2.  Table3 simply documents the complete status table.
> @@ -87,12 +98,14 @@ declare -A vmm_opts=(
>   	[qemu:kernel]='-kernel'
>   	[qemu:args]='-append'
>   	[qemu:initrd]='-initrd'
> +	[qemu:default_opts]=''
>   	[qemu:fixup_return_code]=qemu_fixup_return_code
>   
>   	[kvmtool:nr_cpus]='--cpus'
>   	[kvmtool:kernel]='--kernel'
>   	[kvmtool:args]='--params'
>   	[kvmtool:initrd]='--initrd'
> +	[kvmtool:default_opts]="$KVMTOOL_DEFAULT_OPTS"
>   	[kvmtool:fixup_return_code]=kvmtool_fixup_return_code
>   )
>   

-- 
Shaoqin


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
