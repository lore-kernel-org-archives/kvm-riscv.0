Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA503C3ABC5
	for <kvm-riscv@archiver.kernel.org>; Wed, 14 May 2025 03:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uBvlSQ9+8wRBAOeC9kTxB3qnSwbKkrEcDP7xizXrlKc=; b=2jGsZ5EVEMqFTR
	NvLL1Yq6x3715GLcCpImeIRUN2cC2k8pb7Ml5PeHAVrcQnSKrb0VRxqrJIPsRn7Ioz9JbzVuClmYa
	Cs9HLroC9mm54amDiI+c1sxEzQfrki27wlUkAvPnYkcbFXqXKY2ln6eMQnP6W4wjnpFYFVincxipX
	YSJwWhFKApeFCnaXnDLseoucDGjeGK8bkf/5nXelGz7b1v+DzUsTDn7xHGDTN1T5uHFJLurn+wtiq
	F86KFnrUm7jWHzkN2FBWUnSDpUiiW29t7Jdo0kChkBsGSFDBaO+QXSMYZveP39tt0Vjciw+UXx+R/
	u3yBUef7Q5m4d6Cw5rGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF2vk-0000000DxQU-2K5g;
	Wed, 14 May 2025 03:37:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF2vh-0000000DxQ2-2EUD
	for kvm-riscv@lists.infradead.org;
	Wed, 14 May 2025 03:37:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747193831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sXnHSZ0Yk0pjB03hExnA/yD4CkvPU5te8D9VFkvGbRE=;
	b=GosP4vXsN218zv4s5OohvZUcl4xx8C/iM0l2XopyKMp++Gf0pMRKMkrjhEre2EHQdxg3j1
	s/4hfxbeNyCth419v5BulI9SF5V7H+T6n4q3qv4+JutDwM/ZV89AolvzJyrxKD7WsGqjTC
	gFiRnt2a9zN6WBvqwT6KUx/cTb42tQs=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-DB89KUJMO6izTLGV0MRG1w-1; Tue, 13 May 2025 23:37:10 -0400
X-MC-Unique: DB89KUJMO6izTLGV0MRG1w-1
X-Mimecast-MFC-AGG-ID: DB89KUJMO6izTLGV0MRG1w_1747193829
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30a80fe759bso8343668a91.1
        for <kvm-riscv@lists.infradead.org>; Tue, 13 May 2025 20:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747193829; x=1747798629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sXnHSZ0Yk0pjB03hExnA/yD4CkvPU5te8D9VFkvGbRE=;
        b=DAe/FGBUbl6zcBPlgmDIq9xSXuoETr5R3ZRGBMFwpDK5/ht9AWxr/egzHsuf7YgRoj
         IYyHT/zzQHAW5oWi2GOm+wZz9NpvdTqH95H33Cgh2Ka8vCt8pBp8vQLccDe8MzqcaBrv
         wksJ9WYPu5C4M/e82n085rndKqRi6uRR6Vkgx0q1/Jwu1WZFxf3pp47IOZSD8J75eoxF
         J7+/DMI35N+o7QsOLAmnKfxJcck4oYWCjet/+iv8F6CtZN77W7DFyWNVJOZ8Ymw6K5P6
         VTRo9rmXslcnVR6wBE++QsuaKajUQbhxvdspYZHyafeH/vVH+F9FAofoTaK8BTLePJy6
         ccOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV10XicebMaDrInyU0UEJtuto920O6P+ru1wKyCkwYqZEMvBm7MG8Fkd8CmxVndl7OyoHTtPvNwp4c=@lists.infradead.org
X-Gm-Message-State: AOJu0YyM2mjOf8AncZTCGYaZG1pGPQbC6A5oNJR+2s2VP9VZe+j9ZL+c
	/fH18Ua3emKlUKBGm3XD+fWjf5RKDZiQzV5KrpLlsdjrZLk1qwHDgvIN7xcMD+4b2g/rbGnJna/
	R4Y8qcrl/73XtfvgYX/+eB7Q24nWAfT2W9NNAYEWyDwhNxmyA1BAn9/9JyJk0Kyc=
X-Gm-Gg: ASbGncu5RB9tt2DJkW0ZEOy6OIWRX490L5N2UOdJ9jgpnQMBK0Zly4LDFJuroBZYNGI
	R8e/1NzPQCpgy8cy1xKnLDsFBez6gOI5+HXO9/KWuO6xZXPBdA7Qde92UOqi/6aQF46VNOjOFXJ
	amCmUwp/Bq0Ez6qsXlWQtcESQlZ7HHNIwQZgrj7V06NDS8ZBo7+W8kfoBktjvWxP7XNxXJyyKtm
	0fDzTHnsmoTcKZTT4tkDUlQExjGbIrrprqa81nX68ffrqSf41oBce7+mSiUindJWf79scSCP0Lr
	xDkqABIpiHi8qsTv
X-Received: by 2002:a17:90b:5590:b0:2ee:f687:6acb with SMTP id 98e67ed59e1d1-30e2e5c24b0mr3049821a91.13.1747193829183;
        Tue, 13 May 2025 20:37:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEMic3JZfqHUduiY6RIFo4rKxWJxbdw/r/LByh2iH/VAXRKkC+svCTuRA6EfZQjPLBCUxbkg==
X-Received: by 2002:a17:90b:5590:b0:2ee:f687:6acb with SMTP id 98e67ed59e1d1-30e2e5c24b0mr3049782a91.13.1747193828788;
        Tue, 13 May 2025 20:37:08 -0700 (PDT)
Received: from [10.72.116.125] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e334e2503sm434299a91.31.2025.05.13.20.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 20:37:08 -0700 (PDT)
Message-ID: <1ac10d00-c21c-44fd-9973-c32fd89b4ba1@redhat.com>
Date: Wed, 14 May 2025 11:36:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v3 05/16] scripts: Document environment
 variables
To: Alexandru Elisei <alexandru.elisei@arm.com>, andrew.jones@linux.dev,
 eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
 frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
 david@redhat.com, pbonzini@redhat.com
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, will@kernel.org, julien.thierry.kdev@gmail.com,
 maz@kernel.org, oliver.upton@linux.dev, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, joey.gouly@arm.com, andre.przywara@arm.com,
 Andrew Jones <drjones@redhat.com>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-6-alexandru.elisei@arm.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20250507151256.167769-6-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5YduNy9g71coz1WhPmO2j5VbqcOZlF2GbRYzOcOg0ZA_1747193829
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_203713_659397_8078C41F 
X-CRM114-Status: GOOD (  17.01  )
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
> Document the environment variables that influence how a test is executed
> by the run_tests.sh test runner.
> 
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Reviewed-by: Shaoqin Huang <shahuang@redhat.com>

> ---
>   docs/unittests.txt |  5 ++++-
>   run_tests.sh       | 12 +++++++++---
>   2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/unittests.txt b/docs/unittests.txt
> index 6eb315618dbd..ea0da959f008 100644
> --- a/docs/unittests.txt
> +++ b/docs/unittests.txt
> @@ -102,7 +102,8 @@ timeout
>   -------
>   timeout = <duration>
>   
> -Optional timeout in seconds, after which the test will be killed and fail.
> +Optional timeout in seconds, after which the test will be killed and fail. Can
> +be overwritten with the TIMEOUT=<duration> environment variable.
>   
>   check
>   -----
> @@ -113,3 +114,5 @@ can contain multiple files to check separated by a space, but each check
>   parameter needs to be of the form <path>=<value>
>   
>   The path and value cannot contain space, =, or shell wildcard characters.
> +
> +Can be overwritten with the CHECK environment variable with the same syntax.
> diff --git a/run_tests.sh b/run_tests.sh
> index f30b6dbd131c..dd9d27377905 100755
> --- a/run_tests.sh
> +++ b/run_tests.sh
> @@ -27,9 +27,15 @@ Usage: $0 [-h] [-v] [-a] [-g group] [-j NUM-TASKS] [-t] [-l]
>       -l, --list          Only output all tests list
>           --probe-maxsmp  Update the maximum number of VCPUs supported by host
>   
> -Set the environment variable QEMU=/path/to/qemu-system-ARCH to
> -specify the appropriate qemu binary for ARCH-run.
> -
> +The following environment variables are used:
> +
> +    QEMU            Path to QEMU binary for ARCH-run
> +    ACCEL           QEMU accelerator to use, e.g. 'kvm', 'hvf' or 'tcg'
> +    ACCEL_PROPS     Extra argument(s) to ACCEL
> +    MACHINE         QEMU machine type
> +    TIMEOUT         Timeout duration for the timeout(1) command
> +    CHECK           Overwrites the 'check' unit test parameter (see
> +                    docs/unittests.txt)
>   EOF
>   }
>   

-- 
Shaoqin


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
