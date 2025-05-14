Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEFAC3ABC5
	for <kvm-riscv@archiver.kernel.org>; Wed, 14 May 2025 03:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BQRfPp4ImUQll9R2zGgefieOLrsoPtmg9oX2XX6wRks=; b=28ucVNgJXfxt9+
	9/JJpLTP3O6IPLN7c6pRNWPbPA765pFzqv8qJFFqCJrCXHLQOfbOX+fA0FMUEIhrQqTbrJTzKpvSj
	SFAIn1+MK8Gvia6Jf5mPtcdbg5tXVRz/ebQHOKPZ+rvTXLNWGHSl4q1mJqj3iafJ/XmjoAYdYn5w1
	6BBMSdoA9asB/eYWQJ4QPiBHzG6z2FCRoebQSsr26lAO931xJTmMcTOege8TekQocSlC4XjtjT4MH
	XwqndwCJ2R4jbpvnMyUvbMg5Wp54iFG4qkYYMRYV8Q9njjtkGuKxQSXec5vHdmjqSibwARFWlIULI
	k5p1LpajdyUbgt7Bw8xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF2cC-0000000DwK7-2iET;
	Wed, 14 May 2025 03:17:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF2c9-0000000DwJl-4Avd
	for kvm-riscv@lists.infradead.org;
	Wed, 14 May 2025 03:17:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747192620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bo1zHO1TLu57xTKrXLBF+PVswDcfMpKNQu425MUg/X4=;
	b=SGD6SsHEuDSs8ihpcD9BnYlLBiRIvEOpz6U1UkcNyEYi1eEndA2kaj0gTMCbeOQUPLDpUS
	GlnBqUR/EpWtDonXUuvOLeNaMLEBNxsmYuZRCacrMys2NVpBnE7sLQxReezonTZA4OTv5K
	a2zeXtW5QIMv77YfmJvtELKOf09K7+Y=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-HWXeg--COsydM8cpEwiFKQ-1; Tue, 13 May 2025 23:16:58 -0400
X-MC-Unique: HWXeg--COsydM8cpEwiFKQ-1
X-Mimecast-MFC-AGG-ID: HWXeg--COsydM8cpEwiFKQ_1747192617
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b25dda2f585so4282800a12.1
        for <kvm-riscv@lists.infradead.org>; Tue, 13 May 2025 20:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747192617; x=1747797417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bo1zHO1TLu57xTKrXLBF+PVswDcfMpKNQu425MUg/X4=;
        b=euolQDI5WwvoCnZodIxjJ0WF5cyA2ArXpAalC0RsdSvxuQ9Xk94lhJYgHKEvehBHpC
         A2gj1oWGupWnU2WWxZWrmCPYjJ2iJeJ+iLa3vgq1rck4ZsyQKFSqd64bW/l7Kv4OG/Jw
         wTBpAzFjvfc37FuiJon51bcfnqBcm+OeCbDwAofVcWVrFVC1LkX2x2wN3ExDeHh1hlwL
         pSptxzB1QA6uXsMh78s3NvGSFPgLQafKAAX+hGmGZJOs7qhyQa/r5jB3M90CUFCRmQiE
         zzhupRBoIWQrFnd1IGPHcesHEWd/WUH6QVPePHrXms+kqeCm48WRQ72WY71mAn6Dtx9U
         WkUw==
X-Forwarded-Encrypted: i=1; AJvYcCU62ke9l+b7Om2xA/rX8muwwdVry7S6rENKLoFE7htjjf/sai5a54lkHwZSdMa96Qsy7J9epd78pX0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyefPBpdnBa9ZLc2OKXEesOz3cmvq28g/JQF7pRVNQuynpOod/G
	wyYfex8uIEI/ZziSfMA9e9wT1MgsdeIeSgkZqaAd6AinLhNllYvzHCx+7TorugCDYKUsKOLmaoX
	gTEk9J7VWQKEtwEzDGtP0HxD/mC4tKlP/ilsPwjNqxcwWyW+6tk+SMYivXYoxq/g=
X-Gm-Gg: ASbGncuFG5Y/bi8G83R1Oj06zFCwY6GcRtXvJF7VtcYahWyOQ8QwjPR94lK83b7uaV/
	taiZiNgmN+mmZQVuXAVsYI05uVxtOCMP7hi6DFaECvFSrNF3Qx08x/TrC9/C+SLUKnv4FoN9JOc
	xiKY/iJyoPlI3xg1WX2949QisgkRbV3BL/9w9DKy8D0jkClZNazNJKFBm3BZT+oLUM3NATy6fnS
	3zRERLrpm2CicGMvd2Fy3O6rfezxLRaxomrrQI3NCBSMjbmudCjBqBGEzQntzPugAahnb06512g
	MVwhHN8xlMSgi43u
X-Received: by 2002:a05:6a20:3d86:b0:215:ee6e:ee3b with SMTP id adf61e73a8af0-215ff0db94dmr2590837637.15.1747192617438;
        Tue, 13 May 2025 20:16:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6ZmEbxqIkWHONUIYBOvAIG+f/adO1+radfY7mm1COXYOKYtizQKv5r8znzX86CFmwnS3eyg==
X-Received: by 2002:a05:6a20:3d86:b0:215:ee6e:ee3b with SMTP id adf61e73a8af0-215ff0db94dmr2590789637.15.1747192616945;
        Tue, 13 May 2025 20:16:56 -0700 (PDT)
Received: from [10.72.116.125] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a0f14csm8775641b3a.107.2025.05.13.20.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 20:16:56 -0700 (PDT)
Message-ID: <7179a8d6-4548-45c6-8b53-11ea605d394e@redhat.com>
Date: Wed, 14 May 2025 11:16:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v3 02/16] scripts: Add 'test_args' test
 definition parameter
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
 <20250507151256.167769-3-alexandru.elisei@arm.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20250507151256.167769-3-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: s8e0j025Jtg_FkshDrNkPeRwoci2dzNs3HOc3KhZqLQ_1747192617
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_201702_193798_7289BC5A 
X-CRM114-Status: GOOD (  20.31  )
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
> kvm-unit-tests, on arm and arm64, is getting ready to support running all
> the test automatically under kvmtool. kvmtool has a different syntax for
> configuring and running a virtual machine, but what is common between
> kvmtool and qemu, and any other virtual machine manager that kvm-unit-tests
> might support in the future, is the test arguments that are passed to the
> main() function.
> 
> So add a new test definition parameter, 'test_args', that contains only the
> VMM-independent arguments that are passed to the main() function.
> 
> Suggested-by: Andrew Jones <andrew.jones@linux.dev>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Reviewed-by: Shaoqin Huang <shahuang@redhat.com>

> ---
>   arm/unittests.cfg     | 94 ++++++++++++++++++++++++++-----------------
>   docs/unittests.txt    | 17 ++++++--
>   powerpc/unittests.cfg | 19 +++++----
>   riscv/unittests.cfg   |  2 +-
>   s390x/unittests.cfg   | 13 +++---
>   scripts/common.bash   |  8 +++-
>   scripts/runtime.bash  | 18 ++++++---
>   x86/unittests.cfg     | 92 ++++++++++++++++++++++++++----------------
>   8 files changed, 164 insertions(+), 99 deletions(-)
> 
> diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> index 6c6f76b2fb52..a4192ed7e20b 100644
> --- a/arm/unittests.cfg
> +++ b/arm/unittests.cfg
> @@ -15,26 +15,27 @@
>   [selftest-setup]
>   file = selftest.flat
>   smp = 2
> -qemu_params = -m 256 -append 'setup smp=2 mem=256'
> +test_args = 'setup smp=2 mem=256'
> +qemu_params = -m 256
>   groups = selftest
>   
>   # Test vector setup and exception handling (kernel mode).
>   [selftest-vectors-kernel]
>   file = selftest.flat
> -qemu_params = -append 'vectors-kernel'
> +test_args = vectors-kernel
>   groups = selftest
>   
>   # Test vector setup and exception handling (user mode).
>   [selftest-vectors-user]
>   file = selftest.flat
> -qemu_params = -append 'vectors-user'
> +test_args = vectors-user
>   groups = selftest
>   
>   # Test SMP support
>   [selftest-smp]
>   file = selftest.flat
>   smp = $MAX_SMP
> -qemu_params = -append 'smp'
> +test_args = smp
>   groups = selftest
>   
>   # Test PCI emulation
> @@ -46,79 +47,81 @@ groups = pci
>   [pmu-cycle-counter]
>   file = pmu.flat
>   groups = pmu
> -qemu_params = -append 'cycle-counter 0'
> +test_args = "cycle-counter 0"
>   
>   [pmu-event-introspection]
>   file = pmu.flat
>   groups = pmu
>   arch = arm64
> -qemu_params = -append 'pmu-event-introspection'
> +test_args = pmu-event-introspection
>   
>   [pmu-event-counter-config]
>   file = pmu.flat
>   groups = pmu
>   arch = arm64
> -qemu_params = -append 'pmu-event-counter-config'
> +test_args = pmu-event-counter-config
>   
>   [pmu-basic-event-count]
>   file = pmu.flat
>   groups = pmu
>   arch = arm64
> -qemu_params = -append 'pmu-basic-event-count'
> +test_args = pmu-basic-event-count
>   
>   [pmu-mem-access]
>   file = pmu.flat
>   groups = pmu
>   arch = arm64
> -qemu_params = -append 'pmu-mem-access'
> +test_args = pmu-mem-access
>   
>   [pmu-mem-access-reliability]
>   file = pmu.flat
>   groups = pmu
>   arch = arm64
> -qemu_params = -append 'pmu-mem-access-reliability'
> +test_args = pmu-mem-access-reliability
>   
>   [pmu-sw-incr]
>   file = pmu.flat
>   groups = pmu
>   arch = arm64
> -qemu_params = -append 'pmu-sw-incr'
> +test_args = pmu-sw-incr
>   
>   [pmu-chained-counters]
>   file = pmu.flat
>   groups = pmu
>   arch = arm64
> -qemu_params = -append 'pmu-chained-counters'
> +test_args = pmu-chained-counters
>   
>   [pmu-chained-sw-incr]
>   file = pmu.flat
>   groups = pmu
>   arch = arm64
> -qemu_params = -append 'pmu-chained-sw-incr'
> +test_args = pmu-chained-sw-incr
>   
>   [pmu-chain-promotion]
>   file = pmu.flat
>   groups = pmu
>   arch = arm64
> -qemu_params = -append 'pmu-chain-promotion'
> +test_args = pmu-chain-promotion
>   
>   [pmu-overflow-interrupt]
>   file = pmu.flat
>   groups = pmu
>   arch = arm64
> -qemu_params = -append 'pmu-overflow-interrupt'
> +test_args = pmu-overflow-interrupt
>   
>   # Test PMU support (TCG) with -icount IPC=1
>   #[pmu-tcg-icount-1]
>   #file = pmu.flat
> -#qemu_params = -icount 0 -append 'cycle-counter 1'
> +#test_args = "cycle-counter 1"
> +#qemu_params = -icount 0
>   #groups = pmu
>   #accel = tcg
>   
>   # Test PMU support (TCG) with -icount IPC=256
>   #[pmu-tcg-icount-256]
>   #file = pmu.flat
> -#qemu_params = -icount 8 -append 'cycle-counter 256'
> +#test_args = "cycle-counter 256"
> +#qemu_params = -icount 8
>   #groups = pmu
>   #accel = tcg
>   
> @@ -126,77 +129,89 @@ qemu_params = -append 'pmu-overflow-interrupt'
>   [gicv2-ipi]
>   file = gic.flat
>   smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
> -qemu_params = -machine gic-version=2 -append 'ipi'
> +test_args = ipi
> +qemu_params = -machine gic-version=2
>   groups = gic
>   
>   [gicv2-mmio]
>   file = gic.flat
>   smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
> -qemu_params = -machine gic-version=2 -append 'mmio'
> +test_args = mmio
> +qemu_params = -machine gic-version=2
>   groups = gic
>   
>   [gicv2-mmio-up]
>   file = gic.flat
>   smp = 1
> -qemu_params = -machine gic-version=2 -append 'mmio'
> +test_args = mmio
> +qemu_params = -machine gic-version=2
>   groups = gic
>   
>   [gicv2-mmio-3p]
>   file = gic.flat
>   smp = $((($MAX_SMP < 3)?$MAX_SMP:3))
> -qemu_params = -machine gic-version=2 -append 'mmio'
> +test_args = mmio
> +qemu_params = -machine gic-version=2
>   groups = gic
>   
>   [gicv3-ipi]
>   file = gic.flat
>   smp = $MAX_SMP
> -qemu_params = -machine gic-version=3 -append 'ipi'
> +test_args = ipi
> +qemu_params = -machine gic-version=3
>   groups = gic
>   
>   [gicv2-active]
>   file = gic.flat
>   smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
> -qemu_params = -machine gic-version=2 -append 'active'
> +test_args = active
> +qemu_params = -machine gic-version=2
>   groups = gic
>   
>   [gicv3-active]
>   file = gic.flat
>   smp = $MAX_SMP
> -qemu_params = -machine gic-version=3 -append 'active'
> +test_args = active
> +qemu_params = -machine gic-version=3
>   groups = gic
>   
>   [its-introspection]
>   file = gic.flat
>   smp = $MAX_SMP
> -qemu_params = -machine gic-version=3 -append 'its-introspection'
> +test_args = its-introspection
> +qemu_params = -machine gic-version=3
>   groups = its
>   arch = arm64
>   
>   [its-trigger]
>   file = gic.flat
>   smp = $MAX_SMP
> -qemu_params = -machine gic-version=3 -append 'its-trigger'
> +test_args = its-trigger
> +qemu_params = -machine gic-version=3
>   groups = its
>   arch = arm64
>   
>   [its-migration]
>   file = gic.flat
>   smp = $MAX_SMP
> -qemu_params = -machine gic-version=3 -append 'its-migration'
> +test_args = its-migration
> +qemu_params = -machine gic-version=3
>   groups = its migration
>   arch = arm64
>   
>   [its-pending-migration]
>   file = gic.flat
>   smp = $MAX_SMP
> -qemu_params = -machine gic-version=3 -append 'its-pending-migration'
> +test_args = its-pending-migration
> +qemu_params = -machine gic-version=3
>   groups = its migration
>   arch = arm64
>   
>   [its-migrate-unmapped-collection]
>   file = gic.flat
>   smp = $MAX_SMP
> -qemu_params = -machine gic-version=3 -append 'its-migrate-unmapped-collection'
> +test_args = its-migrate-unmapped-collection
> +qemu_params = -machine gic-version=3
>   groups = its migration
>   arch = arm64
>   
> @@ -231,37 +246,37 @@ groups = cache
>   [debug-bp]
>   file = debug.flat
>   arch = arm64
> -qemu_params = -append 'bp'
> +test_args = bp
>   groups = debug
>   
>   [debug-bp-migration]
>   file = debug.flat
>   arch = arm64
> -qemu_params = -append 'bp-migration'
> +test_args = bp-migration
>   groups = debug migration
>   
>   [debug-wp]
>   file = debug.flat
>   arch = arm64
> -qemu_params = -append 'wp'
> +test_args = wp
>   groups = debug
>   
>   [debug-wp-migration]
>   file = debug.flat
>   arch = arm64
> -qemu_params = -append 'wp-migration'
> +test_args = wp-migration
>   groups = debug migration
>   
>   [debug-sstep]
>   file = debug.flat
>   arch = arm64
> -qemu_params = -append 'ss'
> +test_args = ss
>   groups = debug
>   
>   [debug-sstep-migration]
>   file = debug.flat
>   arch = arm64
> -qemu_params = -append 'ss-migration'
> +test_args = ss-migration
>   groups = debug migration
>   
>   # FPU/SIMD test
> @@ -276,17 +291,20 @@ arch = arm64
>   [mte-sync]
>   file = mte.flat
>   groups = mte
> -qemu_params = -machine mte=on -append 'sync'
> +test_args=sync
> +qemu_params = -machine mte=on
>   arch = arm64
>   
>   [mte-async]
>   file = mte.flat
>   groups = mte
> -qemu_params = -machine mte=on -append 'async'
> +test_args=async
> +qemu_params = -machine mte=on
>   arch = arm64
>   
>   [mte-asymm]
>   file = mte.flat
>   groups = mte
> -qemu_params = -machine mte=on -append 'asymm'
> +test_args=asymm
> +qemu_params = -machine mte=on
>   arch = arm64
> diff --git a/docs/unittests.txt b/docs/unittests.txt
> index 3d19fd70953f..6eb315618dbd 100644
> --- a/docs/unittests.txt
> +++ b/docs/unittests.txt
> @@ -56,13 +56,22 @@ smp = <number>
>   Optional, the number of processors created in the machine to run the test.
>   Defaults to 1. $MAX_SMP can be used to specify the maximum supported.
>   
> +test_args
> +---------
> +test_args = "..."
> +
> +Optional, will be used to pass arguments into the test case argv. If multiple,
> +space separated, arguments need to be passed to a test, wrap them in quotes.
> +Backticks can be used to pass the result of shell commands, for example:
> +
> +test_args = "10000000 `date +%s`"
> +
>   qemu_params
>   ------------
> -These are extra parameters supplied to the QEMU process. -append '...' can
> -be used to pass arguments into the test case argv. Multiple parameters can
> -be added, for example:
> +These are extra parameters supplied to the QEMU process. Multiple parameters
> +can be added, for example:
>   
> -qemu_params = -m 256 -append 'smp=2'
> +qemu_params = -m 256 -machine pit=off
>   
>   extra_params
>   ------------
> diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
> index 5097911e4bf3..2dd32edfa1ae 100644
> --- a/powerpc/unittests.cfg
> +++ b/powerpc/unittests.cfg
> @@ -15,7 +15,8 @@
>   [selftest-setup]
>   file = selftest.elf
>   smp = 2
> -qemu_params = -m 1g -append 'setup smp=2 mem=1024'
> +test_args = 'setup smp=2 mem=1024'
> +qemu_params = -m 1g
>   groups = selftest
>   
>   [selftest-migration]
> @@ -27,7 +28,7 @@ groups = selftest migration
>   file = selftest-migration.elf
>   machine = pseries
>   groups = selftest migration
> -qemu_params = -append "skip"
> +test_args = "skip"
>   
>   [migration-memory]
>   file = memory-verify.elf
> @@ -46,20 +47,21 @@ machine = pseries
>   file = rtas.elf
>   machine = pseries
>   timeout = 5
> -qemu_params = -append "get-time-of-day date=$(date +%s)"
> +test_args = "get-time-of-day date=$(date +%s)"
>   groups = rtas
>   
>   [rtas-get-time-of-day-base]
>   file = rtas.elf
>   machine = pseries
>   timeout = 5
> -qemu_params = -rtc base="2006-06-17" -append "get-time-of-day date=$(date --date="2006-06-17 UTC" +%s)"
> +test_args = "get-time-of-day date=$(date --date="2006-06-17 UTC" +%s)"
> +qemu_params = -rtc base="2006-06-17"
>   groups = rtas
>   
>   [rtas-set-time-of-day]
>   file = rtas.elf
>   machine = pseries
> -qemu_params = -append "set-time-of-day"
> +test_args = "set-time-of-day"
>   timeout = 5
>   groups = rtas
>   
> @@ -94,7 +96,7 @@ smp = 2
>   [atomics-migration]
>   file = atomics.elf
>   machine = pseries
> -qemu_params = -append "migration -m"
> +test_args = "migration -m"
>   groups = migration
>   
>   [timebase]
> @@ -110,7 +112,8 @@ file = tm.elf
>   machine = pseries
>   accel = kvm
>   smp = 2,threads=2
> -qemu_params = -machine cap-htm=on -append "h_cede_tm"
> +test_args = "h_cede_tm"
> +qemu_params = -machine cap-htm=on
>   groups = h_cede_tm
>   
>   [sprs]
> @@ -119,7 +122,7 @@ file = sprs.elf
>   [sprs-migration]
>   file = sprs.elf
>   machine = pseries
> -qemu_params = -append '-w'
> +test_args = '-w'
>   groups = migration
>   
>   [sieve]
> diff --git a/riscv/unittests.cfg b/riscv/unittests.cfg
> index 5b31047f75c7..8a98ac723c2c 100644
> --- a/riscv/unittests.cfg
> +++ b/riscv/unittests.cfg
> @@ -10,7 +10,7 @@
>   [selftest]
>   file = selftest.flat
>   smp = $MAX_SMP
> -qemu_params = -append 'foo bar baz'
> +test_args = 'foo bar baz'
>   groups = selftest
>   
>   # Set $FIRMWARE_OVERRIDE to /path/to/firmware to select the SBI implementation.
> diff --git a/s390x/unittests.cfg b/s390x/unittests.cfg
> index 1e129fef3c38..ed4d069ece38 100644
> --- a/s390x/unittests.cfg
> +++ b/s390x/unittests.cfg
> @@ -10,7 +10,7 @@
>   file = selftest.elf
>   groups = selftest
>   # please keep the kernel cmdline in sync with $(TEST_DIR)/selftest.parmfile
> -qemu_params = -append 'test 123'
> +test_args = 'test 123'
>   
>   [selftest-migration]
>   file = selftest-migration.elf
> @@ -22,7 +22,7 @@ accel = kvm
>   [selftest-migration-skip]
>   file = selftest-migration.elf
>   groups = selftest migration
> -qemu_params = -append "skip"
> +test_args = "skip"
>   
>   # This fails due to a QEMU TCG bug so KVM-only until QEMU is fixed upstream
>   [migration-memory]
> @@ -214,13 +214,13 @@ smp = 2
>   [migration-skey-sequential]
>   file = migration-skey.elf
>   groups = migration
> -qemu_params = -append '--sequential'
> +test_args = '--sequential'
>   
>   [migration-skey-parallel]
>   file = migration-skey.elf
>   smp = 2
>   groups = migration
> -qemu_params = -append '--parallel'
> +test_args = '--parallel'
>   
>   [execute]
>   file = ex.elf
> @@ -252,12 +252,13 @@ file = topology.elf
>   
>   [topology-2]
>   file = topology.elf
> -qemu_params = -cpu max,ctop=on -smp sockets=31,cores=8,maxcpus=248  -append '-sockets 31 -cores 8'
> +test_args = '-sockets 31 -cores 8'
> +qemu_params = -cpu max,ctop=on -smp sockets=31,cores=8,maxcpus=248
>   
>   [topology-3]
>   file = topology.elf
> +test_args = '-drawers 2 -books 2 -sockets 2 -cores 16'
>   qemu_params = """-cpu max,ctop=on -smp cpus=1,drawers=2,books=2,sockets=2,cores=16,maxcpus=128 \
> --append '-drawers 2 -books 2 -sockets 2 -cores 16' \
>   -device max-s390x-cpu,core-id=31,drawer-id=0,book-id=0,socket-id=0,entitlement=medium,dedicated=false \
>   -device max-s390x-cpu,core-id=11,drawer-id=0,book-id=0,socket-id=0,entitlement=high,dedicated=true \
>   -device max-s390x-cpu,core-id=95,drawer-id=0,book-id=0,socket-id=0,entitlement=medium,dedicated=false \
> diff --git a/scripts/common.bash b/scripts/common.bash
> index bd7c82f1adda..9deb87d4050d 100644
> --- a/scripts/common.bash
> +++ b/scripts/common.bash
> @@ -7,6 +7,7 @@ function for_each_unittest()
>   	local testname
>   	local smp
>   	local kernel
> +	local test_args
>   	local opts
>   	local groups
>   	local arch
> @@ -22,11 +23,12 @@ function for_each_unittest()
>   		if [[ "$line" =~ ^\[(.*)\]$ ]]; then
>   			rematch=${BASH_REMATCH[1]}
>   			if [ -n "${testname}" ]; then
> -				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
> +				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$test_args" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
>   			fi
>   			testname=$rematch
>   			smp=1
>   			kernel=""
> +			test_args=""
>   			opts=""
>   			groups=""
>   			arch=""
> @@ -38,6 +40,8 @@ function for_each_unittest()
>   			kernel=$TEST_DIR/${BASH_REMATCH[1]}
>   		elif [[ $line =~ ^smp\ *=\ *(.*)$ ]]; then
>   			smp=${BASH_REMATCH[1]}
> +		elif [[ $line =~ ^test_args\ *=\ *(.*)$ ]]; then
> +			test_args=${BASH_REMATCH[1]}
>   		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *'"""'(.*)$ ]]; then
>   			opts=${BASH_REMATCH[2]}$'\n'
>   			while read -r -u $fd; do
> @@ -71,7 +75,7 @@ function for_each_unittest()
>   		fi
>   	done
>   	if [ -n "${testname}" ]; then
> -		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
> +		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$test_args" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
>   	fi
>   	exec {fd}<&-
>   }
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index 400e8a082528..06cc58e79b69 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -80,12 +80,18 @@ function run()
>       local groups="$2"
>       local smp="$3"
>       local kernel="$4"
> -    local opts="$5"
> -    local arch="$6"
> -    local machine="$7"
> -    local check="${CHECK:-$8}"
> -    local accel="$9"
> -    local timeout="${10:-$TIMEOUT}" # unittests.cfg overrides the default
> +    local test_args="$5"
> +    local opts="$6"
> +    local arch="$7"
> +    local machine="$8"
> +    local check="${CHECK:-$9}"
> +    local accel="${10}"
> +    local timeout="${11:-$TIMEOUT}" # unittests.cfg overrides the default
> +
> +    # If $test_args is empty, qemu will interpret the first option after -append
> +    # as a kernel parameter instead of a qemu option, so make sure the -append
> +    # option is used only if $test_args is not empy.
> +    [ -n "$test_args" ] && opts="-append $test_args $opts"
>   
>       if [ "${CONFIG_EFI}" == "y" ]; then
>           kernel=${kernel/%.flat/.efi}
> diff --git a/x86/unittests.cfg b/x86/unittests.cfg
> index a356f486eaec..3effddfe4207 100644
> --- a/x86/unittests.cfg
> +++ b/x86/unittests.cfg
> @@ -58,27 +58,27 @@ smp = 3
>   
>   [vmexit_cpuid]
>   file = vmexit.flat
> -qemu_params = -append 'cpuid'
> +test_args = 'cpuid'
>   groups = vmexit
>   
>   [vmexit_vmcall]
>   file = vmexit.flat
> -qemu_params = -append 'vmcall'
> +test_args = 'vmcall'
>   groups = vmexit
>   
>   [vmexit_mov_from_cr8]
>   file = vmexit.flat
> -qemu_params = -append 'mov_from_cr8'
> +test_args = 'mov_from_cr8'
>   groups = vmexit
>   
>   [vmexit_mov_to_cr8]
>   file = vmexit.flat
> -qemu_params = -append 'mov_to_cr8'
> +test_args = 'mov_to_cr8'
>   groups = vmexit
>   
>   [vmexit_inl_pmtimer]
>   file = vmexit.flat
> -qemu_params = -append 'inl_from_pmtimer'
> +test_args = 'inl_from_pmtimer'
>   groups = vmexit
>   
>   # To allow IPIs to be accelerated by SVM AVIC when the feature is available and
> @@ -87,40 +87,43 @@ groups = vmexit
>   [vmexit_ipi]
>   file = vmexit.flat
>   smp = 2
> -qemu_params = -machine pit=off -append 'ipi'
> +test_args = 'ipi'
> +qemu_params = -machine pit=off
>   groups = vmexit
>   
>   [vmexit_ipi_halt]
>   file = vmexit.flat
>   smp = 2
> -qemu_params = -append 'ipi_halt'
> +test_args = 'ipi_halt'
>   groups = vmexit
>   
>   [vmexit_ple_round_robin]
>   file = vmexit.flat
> -qemu_params = -append 'ple_round_robin'
> +test_args = 'ple_round_robin'
>   groups = vmexit
>   
>   [vmexit_tscdeadline]
>   file = vmexit.flat
>   groups = vmexit
> -qemu_params = -cpu qemu64,+x2apic,+tsc-deadline -append tscdeadline
> +test_args = tscdeadline
> +qemu_params = -cpu qemu64,+x2apic,+tsc-deadline
>   
>   [vmexit_tscdeadline_immed]
>   file = vmexit.flat
>   groups = vmexit
> -qemu_params = -cpu qemu64,+x2apic,+tsc-deadline -append tscdeadline_immed
> +test_args = tscdeadline_immed
> +qemu_params = -cpu qemu64,+x2apic,+tsc-deadline
>   
>   [vmexit_cr0_wp]
>   file = vmexit.flat
>   smp = 2
> -qemu_params = -append 'toggle_cr0_wp'
> +test_args = 'toggle_cr0_wp'
>   groups = vmexit
>   
>   [vmexit_cr4_pge]
>   file = vmexit.flat
>   smp = 2
> -qemu_params = -append 'toggle_cr4_pge'
> +test_args = 'toggle_cr4_pge'
>   groups = vmexit
>   
>   [access]
> @@ -131,7 +134,8 @@ qemu_params = -cpu max,host-phys-bits
>   [access_fep]
>   file = access_test.flat
>   arch = x86_64
> -qemu_params = -cpu max,host-phys-bits -append force_emulation
> +test_args = force_emulation
> +qemu_params = -cpu max,host-phys-bits
>   groups = nodefault
>   timeout = 240
>   
> @@ -256,13 +260,15 @@ arch = x86_64
>   [svm]
>   file = svm.flat
>   smp = 2
> -qemu_params = -cpu max,+svm -m 4g -append "-pause_filter_test"
> +test_args = "-pause_filter_test"
> +qemu_params = -cpu max,+svm -m 4g
>   arch = x86_64
>   groups = svm
>   
>   [svm_pause_filter]
>   file = svm.flat
> -qemu_params = -cpu max,+svm -overcommit cpu-pm=on -m 4g -append pause_filter_test
> +test_args = pause_filter_test
> +qemu_params = -cpu max,+svm -overcommit cpu-pm=on -m 4g
>   arch = x86_64
>   groups = svm
>   
> @@ -285,7 +291,7 @@ groups = tasks
>   [kvmclock_test]
>   file = kvmclock_test.flat
>   smp = 2
> -qemu_params = --append "10000000 `date +%s`"
> +test_args = "10000000 `date +%s`"
>   
>   [pcid-enabled]
>   file = pcid.flat
> @@ -320,33 +326,38 @@ qemu_params = -cpu max,host-phys-bits
>   
>   [vmx]
>   file = vmx.flat
> -qemu_params = -cpu max,+vmx -append "-exit_monitor_from_l2_test -ept_access* -vmx_smp* -vmx_vmcs_shadow_test -atomic_switch_overflow_msrs_test -vmx_init_signal_test -vmx_apic_passthrough_tpr_threshold_test -apic_reg_virt_test -virt_x2apic_mode_test -vmx_pf_exception_test -vmx_pf_exception_forced_emulation_test -vmx_pf_no_vpid_test -vmx_pf_invvpid_test -vmx_pf_vpid_test -vmx_basic_vid_test -vmx_eoi_virt_test -vmx_posted_interrupts_test"
> +test_args = "-exit_monitor_from_l2_test -ept_access* -vmx_smp* -vmx_vmcs_shadow_test -atomic_switch_overflow_msrs_test -vmx_init_signal_test -vmx_apic_passthrough_tpr_threshold_test -apic_reg_virt_test -virt_x2apic_mode_test -vmx_pf_exception_test -vmx_pf_exception_forced_emulation_test -vmx_pf_no_vpid_test -vmx_pf_invvpid_test -vmx_pf_vpid_test -vmx_basic_vid_test -vmx_eoi_virt_test -vmx_posted_interrupts_test"
> +qemu_params = -cpu max,+vmx
>   arch = x86_64
>   groups = vmx
>   
>   [ept]
>   file = vmx.flat
> -qemu_params = -cpu max,host-phys-bits,+vmx -m 2560 -append "ept_access*"
> +test_args = "ept_access*"
> +qemu_params = -cpu max,host-phys-bits,+vmx -m 2560
>   arch = x86_64
>   groups = vmx
>   
>   [vmx_eoi_bitmap_ioapic_scan]
>   file = vmx.flat
>   smp = 2
> -qemu_params = -cpu max,+vmx -m 2048 -append vmx_eoi_bitmap_ioapic_scan_test
> +test_args = vmx_eoi_bitmap_ioapic_scan_test
> +qemu_params = -cpu max,+vmx -m 2048
>   arch = x86_64
>   groups = vmx
>   
>   [vmx_hlt_with_rvi_test]
>   file = vmx.flat
> -qemu_params = -cpu max,+vmx -append vmx_hlt_with_rvi_test
> +test_args = vmx_hlt_with_rvi_test
> +qemu_params = -cpu max,+vmx
>   arch = x86_64
>   groups = vmx
>   timeout = 10
>   
>   [vmx_apicv_test]
>   file = vmx.flat
> -qemu_params = -cpu max,+vmx -append "apic_reg_virt_test virt_x2apic_mode_test vmx_basic_vid_test vmx_eoi_virt_test"
> +test_args = "apic_reg_virt_test virt_x2apic_mode_test vmx_basic_vid_test vmx_eoi_virt_test"
> +qemu_params = -cpu max,+vmx
>   arch = x86_64
>   groups = vmx
>   timeout = 30
> @@ -354,7 +365,8 @@ timeout = 30
>   [vmx_posted_intr_test]
>   file = vmx.flat
>   smp = 2
> -qemu_params = -cpu max,+vmx -append "vmx_posted_interrupts_test"
> +test_args = "vmx_posted_interrupts_test"
> +qemu_params = -cpu max,+vmx
>   arch = x86_64
>   groups = vmx
>   timeout = 10
> @@ -362,14 +374,16 @@ timeout = 10
>   [vmx_apic_passthrough_thread]
>   file = vmx.flat
>   smp = 2
> -qemu_params = -cpu max,+vmx -m 2048 -append vmx_apic_passthrough_thread_test
> +test_args = vmx_apic_passthrough_thread_test
> +qemu_params = -cpu max,+vmx -m 2048
>   arch = x86_64
>   groups = vmx
>   
>   [vmx_init_signal_test]
>   file = vmx.flat
>   smp = 2
> -qemu_params = -cpu max,+vmx -m 2048 -append vmx_init_signal_test
> +test_args = vmx_init_signal_test
> +qemu_params = -cpu max,+vmx -m 2048
>   arch = x86_64
>   groups = vmx
>   timeout = 10
> @@ -377,62 +391,71 @@ timeout = 10
>   [vmx_sipi_signal_test]
>   file = vmx.flat
>   smp = 2
> -qemu_params = -cpu max,+vmx -m 2048 -append vmx_sipi_signal_test
> +test_args = vmx_sipi_signal_test
> +qemu_params = -cpu max,+vmx -m 2048
>   arch = x86_64
>   groups = vmx
>   timeout = 10
>   
>   [vmx_apic_passthrough_tpr_threshold_test]
>   file = vmx.flat
> -qemu_params = -cpu max,+vmx -m 2048 -append vmx_apic_passthrough_tpr_threshold_test
> +test_args = vmx_apic_passthrough_tpr_threshold_test
> +qemu_params = -cpu max,+vmx -m 2048
>   arch = x86_64
>   groups = vmx
>   timeout = 10
>   
>   [vmx_vmcs_shadow_test]
>   file = vmx.flat
> -qemu_params = -cpu max,+vmx -append vmx_vmcs_shadow_test
> +test_args = vmx_vmcs_shadow_test
> +qemu_params = -cpu max,+vmx
>   arch = x86_64
>   groups = vmx
>   timeout = 180
>   
>   [vmx_pf_exception_test]
>   file = vmx.flat
> -qemu_params = -cpu max,+vmx -append "vmx_pf_exception_test"
> +test_args = "vmx_pf_exception_test"
> +qemu_params = -cpu max,+vmx
>   arch = x86_64
>   groups = vmx nested_exception
>   
>   [vmx_pf_exception_test_fep]
>   file = vmx.flat
> -qemu_params = -cpu max,+vmx -append "vmx_pf_exception_forced_emulation_test"
> +test_args = "vmx_pf_exception_forced_emulation_test"
> +qemu_params = -cpu max,+vmx
>   arch = x86_64
>   groups = vmx nested_exception nodefault
>   timeout = 240
>   
>   [vmx_pf_vpid_test]
>   file = vmx.flat
> -qemu_params = -cpu max,+vmx -append "vmx_pf_vpid_test"
> +test_args = "vmx_pf_vpid_test"
> +qemu_params = -cpu max,+vmx
>   arch = x86_64
>   groups = vmx nested_exception nodefault
>   timeout = 240
>   
>   [vmx_pf_invvpid_test]
>   file = vmx.flat
> -qemu_params = -cpu max,+vmx -append "vmx_pf_invvpid_test"
> +test_args = "vmx_pf_invvpid_test"
> +qemu_params = -cpu max,+vmx
>   arch = x86_64
>   groups = vmx nested_exception nodefault
>   timeout = 240
>   
>   [vmx_pf_no_vpid_test]
>   file = vmx.flat
> -qemu_params = -cpu max,+vmx -append "vmx_pf_no_vpid_test"
> +test_args = "vmx_pf_no_vpid_test"
> +qemu_params = -cpu max,+vmx
>   arch = x86_64
>   groups = vmx nested_exception nodefault
>   timeout = 240
>   
>   [vmx_pf_exception_test_reduced_maxphyaddr]
>   file = vmx.flat
> -qemu_params = -cpu IvyBridge,phys-bits=36,host-phys-bits=off,+vmx -append "vmx_pf_exception_test"
> +test_args = "vmx_pf_exception_test"
> +qemu_params = -cpu IvyBridge,phys-bits=36,host-phys-bits=off,+vmx
>   arch = x86_64
>   groups = vmx nested_exception
>   check = /sys/module/kvm_intel/parameters/allow_smaller_maxphyaddr=Y
> @@ -462,7 +485,8 @@ groups = hyperv
>   [hyperv_stimer_direct]
>   file = hyperv_stimer.flat
>   smp = 2
> -qemu_params = -cpu host,hv_passthrough -append direct
> +test_args = direct
> +qemu_params = -cpu host,hv_passthrough
>   groups = hyperv
>   
>   [hyperv_clock]

-- 
Shaoqin


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
