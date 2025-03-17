Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B867C35FF8
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 08:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Xeuls3BziMJum3u25nbyuc1fEPssANOwP7J/lScFaA=; b=22vnPmd3J647UE
	sSBVtyMiXHYamCaaCpcqWjf/3vwLd5OBV/uob7zC+w7E14Om24AmN6PfD+ozs2LvxtGKKHrsGDTx6
	a5dKwyvTLegtFP1Cfe1j9E4Z7Phk7Wo7emI+IynEcu30ASOVKYys235P34w7DNy1DuuQAAq3AbQRu
	JAlmjHfRL0z67WQjEmjv3HA9asSLIsOMc3GnEcd0z26FsWZaMEr05tYaa0qx7x5YVngk8vF38zIa5
	tVvEnxzciwa1qtxgKnauUYD8qfyRs2YI6HuZwsO2mitXfvWKQ8MvhQKa9QkIGqI/bFJ9wt+nRoZtc
	GR2qECV3oL+Ds5nrvXdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu5w3-00000001lHr-2Wrb;
	Mon, 17 Mar 2025 08:34:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu5w0-00000001lHC-1lre
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 08:34:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742200495;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Nm+DfMNs1ddAyATqlb7pZj2Xsa+iVIwiCGiBBFTXtU=;
	b=TC8xB1j3N2d0p0/SP7kEP57Z5+bQRbIAD5JlW1r+eNpfoaFStt/NYbEaEMPkIyoF7d1u/J
	MLnjqLnEPr7MUmI/9u/Eoysr4zYyHKBDwpAnOmEmD07EAGFiZpKuAjw8B2/ajwrynyD6jD
	SHA2a0FjszKmzaUnRosA0wYMdI5s6Gc=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-ViQr-4I5NwOPWg24tP3iFQ-1; Mon, 17 Mar 2025 04:34:51 -0400
X-MC-Unique: ViQr-4I5NwOPWg24tP3iFQ-1
X-Mimecast-MFC-AGG-ID: ViQr-4I5NwOPWg24tP3iFQ_1742200491
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85db3356bafso1097857139f.3
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 01:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742200491; x=1742805291;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Nm+DfMNs1ddAyATqlb7pZj2Xsa+iVIwiCGiBBFTXtU=;
        b=ehoyTmEDapeRWY3AEspfDbEH74JN2C/yC5mdGiB3EMDq6aUnbQaRDEHE4CWbVqtt5P
         K9TP6EP4rL6f21pxE6f6ePcJN4SeGuDWOOul/pwvx1bmqmsUYoYJHx3J/AngzJD08A2b
         Fj7yWrTpdxhJg51JagltnF/EdvzUcLPmAgo9ZiKAnJCutC3KKWBtxXndlxpxUGvNkfAC
         RL25FtYKuyrihPl6yA29U2/FrS1mFsiOdgPTB6p3td1uvbqZYYDWnjfj0xdjQ09+Y/H/
         IEOPe2B20MH5w6jIVGUneDqtjL5WNzLiQCX/H2ZuduVp7ot7ZKcT67EFKZfMWRpUzkY/
         e+XA==
X-Forwarded-Encrypted: i=1; AJvYcCWlXhXq3RDweEmYi3YUeRNkmMhnrEcXt+Nat4jLw6OiR8JFhsLg7CwTXse6b7P4QxuxAGgbEkPUCBc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHRyftKniGudrM7XHit66loHgKurmghjz5htPaCsx2SIJ8JY8C
	A/ryCaI+4ygmZ7Rwi82YgvHkNIAVChCOzfRtLk5n34MQNQLoaZ1V+udeya21zJy00D1dnxj8aU3
	50qbelDMS5tonNgh3eYvccUjdvbz1PeHzy9kvWX1U8lEP7KRi/dy5SoQW5epM5QM=
X-Gm-Gg: ASbGncu369UzaOMF2gn6JE9P0Jl6zfs1MkeEJymJDd3UYjKUb+SfSM8Q8a8iM8c8pzl
	mZwF/R8i3EanNH/S0zsvP8kYnXFbZVuHS7BLgEkxIlGSis05dkV7YL4KehjEk8pes+bb4IJ0xSd
	y6XQVmD4hrJ+3SOMWcTKSnfbtKbWD8OykuV7OSHjziMaZ1wOXjX2Jyrcow2bEXTC9+Hf2F7ltlr
	WCxltQnQI+OiYAXieqP9l8AP6Mj2d7ESgaGGkddkaidoxWaLOo0p4BfudeRLsCuw28cYnAnpTvf
	Hmfzh7c8Xfl1C6JIeB1yx/cpdcEQVywiiJ/pNpmPb23lqr7Sa93t4VCZw344l1c=
X-Received: by 2002:a05:6e02:1a26:b0:3d4:3556:741 with SMTP id e9e14a558f8ab-3d483a636e0mr118980575ab.17.1742200491111;
        Mon, 17 Mar 2025 01:34:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXeeNMofiOfDClXrxvr5QBbj3fKlOQKb5SMWlRsPSseOxhMX7fmpLthdjxkcqMtcHa1MAfRA==
X-Received: by 2002:a05:6e02:1a26:b0:3d4:3556:741 with SMTP id e9e14a558f8ab-3d483a636e0mr118980485ab.17.1742200490827;
        Mon, 17 Mar 2025 01:34:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d47a83817dsm25926785ab.61.2025.03.17.01.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 01:34:49 -0700 (PDT)
Message-ID: <eedd9e34-7c9a-4379-818e-3420cc8177d0@redhat.com>
Date: Mon, 17 Mar 2025 09:34:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v2 3/5] arm64: Implement the ./configure
 --processor option
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, andrew.jones@linux.dev,
 alexandru.elisei@arm.com
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, vladimir.murzin@arm.com
References: <20250314154904.3946484-2-jean-philippe@linaro.org>
 <20250314154904.3946484-5-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250314154904.3946484-5-jean-philippe@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eW2rll-cPlEGeTRY7X_EN63T1pjVr70UM-oZn621vTI_1742200491
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_013456_597601_4ED3C006 
X-CRM114-Status: GOOD (  17.07  )
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




On 3/14/25 4:49 PM, Jean-Philippe Brucker wrote:
> From: Alexandru Elisei <alexandru.elisei@arm.com>
>
> The help text for the ./configure --processor option says:
>
>     --processor=PROCESSOR  processor to compile for (cortex-a57)
>
> but, unlike arm, the build system does not pass a -mcpu argument to the
> compiler. Fix it, and bring arm64 at parity with arm.
>
> Note that this introduces a regression, which is also present on arm: if
> the --processor argument is something that the compiler doesn't understand,
> but qemu does (like 'max'), then compilation fails. This will be fixed in a
> following patch; another fix is to specify a CPU model that gcc implements
> by using --cflags=-mcpu=<cpu>.
>
> Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  arm/Makefile.arm    | 1 -
>  arm/Makefile.common | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arm/Makefile.arm b/arm/Makefile.arm
> index 7fd39f3a..d6250b7f 100644
> --- a/arm/Makefile.arm
> +++ b/arm/Makefile.arm
> @@ -12,7 +12,6 @@ $(error Cannot build arm32 tests as EFI apps)
>  endif
>  
>  CFLAGS += $(machine)
> -CFLAGS += -mcpu=$(PROCESSOR)
>  CFLAGS += -mno-unaligned-access
>  
>  ifeq ($(TARGET),qemu)
> diff --git a/arm/Makefile.common b/arm/Makefile.common
> index f828dbe0..a5d97bcf 100644
> --- a/arm/Makefile.common
> +++ b/arm/Makefile.common
> @@ -25,6 +25,7 @@ AUXFLAGS ?= 0x0
>  # stack.o relies on frame pointers.
>  KEEP_FRAME_POINTER := y
>  
> +CFLAGS += -mcpu=$(PROCESSOR)
>  CFLAGS += -std=gnu99
>  CFLAGS += -ffreestanding
>  CFLAGS += -O2


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
