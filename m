Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F29C2D0CD
	for <kvm-riscv@archiver.kernel.org>; Mon, 19 May 2025 08:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oPwd1pmIb6iAZ1Y9qUYe9pMkQdGrF64dnXB0Zi5/uL4=; b=fWE5/rwiAsKAyp
	ymOvqdQyatybP9P0qJpjf4SbyuTtydlZJOgW7GNvy6AVGwzf+Mevrm1ey2mKaYyqJhBevRUNMbw3f
	AOZ7X5P7OpAHPd8gklGE/0Xset8nYk8t25n/IxAMUSNArFxDySkivQORs57+3O0DO/jiHmt3/AGxu
	8q4afhWseXuHNf/9P7etFGu+I097tIXjVDODzYDai+yOZ1yNLj+BNy6hR9bA6fkEjqbgjEW5+m/uX
	KKOuglOw07aP7P6yYjcNyZpm2jw6bh4i85UvE8u72RLFD2rv8h5sFJGAmAkcyTOaeOuFVKIbzsVta
	WP1JrKa2Rr3haT0nGWgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGvdW-00000008JoC-1L59;
	Mon, 19 May 2025 08:14:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGvdB-00000008Jh4-1oop
	for kvm-riscv@lists.infradead.org;
	Mon, 19 May 2025 08:13:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747642431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=81MSjO1sHE2YfuqWDok69M/T/8z7rZ6g9u0DZWkIwK4=;
	b=eVe8Y/bNJVZastzj8aNXMfaHNzQqpABUpBML/O7hMA6fdFCDw+7cUStY4EwI++ol0Fpe3S
	6MwFn1QtNo4cSuDkyjYw/wnRsIfsOHHeFrdDaqRFJUoZTKm6YHB0BhakmXP2q9UdM9754O
	AsKtydIvyG9DVHmgrCTrn+7y14YDwq0=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-7L3M7YLhNVGBitSPYsN0hQ-1; Mon, 19 May 2025 04:13:48 -0400
X-MC-Unique: 7L3M7YLhNVGBitSPYsN0hQ-1
X-Mimecast-MFC-AGG-ID: 7L3M7YLhNVGBitSPYsN0hQ_1747642427
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b0f807421c9so2436313a12.0
        for <kvm-riscv@lists.infradead.org>; Mon, 19 May 2025 01:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747642427; x=1748247227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=81MSjO1sHE2YfuqWDok69M/T/8z7rZ6g9u0DZWkIwK4=;
        b=wu9EhY0L4S+bnrtLnRclVPF+0orfrOoVXCE02vHWtvHumYMXkWSXG64WpbpHMUTdMw
         mZUG1zCAjeiG5W/IHlaE4ByU8dTIpf+WjU4jKwYDqyHFrDFOXXgXe1JAKxc8Zp4WlvoH
         QpivwshRLJsrarqm361V4Ldj8GYu3PMguIVWqLOZmLLVvbTcxocqc74bnsC1/UiBaSbC
         oHqE9p1qKZQRl80mWfh0q0WdszSfxQdd/UNj4IA8DV2QxIuJmPRMQnmWn45M+w8DhV0A
         ngm0B77fPCNWvCKiGsRzsdYpoTVjrvnDdMDPzQoQR9xMnmTf0N//qFWdiJzAYibr08rj
         p9Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWTolp7LEu9E2GU/iYnBHaQtNgcPh3jBKpfFqIp7H3J1Kvl3Mn/+dwgL3qkWVGrKQcoF2lw48iCnXA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzJgOsghfBbObKMtAVS2K7u4b1IoaX5yeyedL5hGgRuxlwijNGV
	JLxfLroqL2RFlsxa3GsOJlR4TH/UZfXaEN/WC/udwJlnv2T/KjBhY7NcViDWNxsssaluT9H0TvD
	bjpU/x9U0ROjmTEMLlTjxyHkU4NgT4kSFQTPt0cPu2o/iFyene1ceKiuz84/+zXltgMU=
X-Gm-Gg: ASbGncsYSdKlzgp3fhnH8KlXFkrWklVn09o2LcpeaBIcKSG51SVmjFvXosZZvT11Xlt
	NvwQTQlt8N5nJw5t4hEEexfqIANtKZpFvd1Xl5JNbpwRBCSjTPHcExW0aHW+2m0kP/w15OLQDv/
	BLv7IFeMlNEXZaLncpFfdEPWOTKiHZ6SQgi4GixJ/rk7lAuOmoUbofAB4iYtNPycDEPWRkThIbp
	KICE/BjOW0VB8v+twM5ZDc5/C+r+KQ29IrVVokgNDwi2WQh2qf+zG3ASYRgzYVlpLPtxP4aVDmz
	p72+suAlXoj1uAnQ
X-Received: by 2002:a05:6a21:7e86:b0:218:bbb:c13d with SMTP id adf61e73a8af0-2180bbbc1b0mr13503003637.13.1747642427010;
        Mon, 19 May 2025 01:13:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKS9dBCdoBJSd2fsnxqZtqXXkuCdfx1TMqH+JdIVWuZzC6jtmWsd4CbKxNWoE3TDYRsqvBDg==
X-Received: by 2002:a05:6a21:7e86:b0:218:bbb:c13d with SMTP id adf61e73a8af0-2180bbbc1b0mr13502979637.13.1747642426697;
        Mon, 19 May 2025 01:13:46 -0700 (PDT)
Received: from [10.72.116.146] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970b9c7sm5585368b3a.48.2025.05.19.01.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 01:13:46 -0700 (PDT)
Message-ID: <e90c3221-4a31-4c53-afb9-c2fcf09ae358@redhat.com>
Date: Mon, 19 May 2025 16:13:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v3 11/16] scripts: Add KVMTOOL environment
 variable for kvmtool binary path
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
 <20250507151256.167769-12-alexandru.elisei@arm.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20250507151256.167769-12-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Yt2embbChtSh_5RJKanziUllkfmNur8PTx9xVtpPWns_1747642427
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_011353_566665_F2D78B5E 
X-CRM114-Status: GOOD (  18.21  )
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
> kvmtool is often used for prototyping new features, and a developer might
> not want to install it system-wide. Add a KVMTOOL environment variable to
> make it easier for tests to use a binary not in $PATH.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Reviewed-by: Shaoqin Huang <shahuang@redhat.com>

> ---
>   run_tests.sh          | 1 +
>   scripts/arch-run.bash | 3 ++-
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/run_tests.sh b/run_tests.sh
> index dd9d27377905..150a06a91064 100755
> --- a/run_tests.sh
> +++ b/run_tests.sh
> @@ -36,6 +36,7 @@ The following environment variables are used:
>       TIMEOUT         Timeout duration for the timeout(1) command
>       CHECK           Overwrites the 'check' unit test parameter (see
>                       docs/unittests.txt)
> +    KVMTOOL         Path to kvmtool binary for ARCH-run
>   EOF
>   }
>   
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index 8cf67e4f3b51..d4fc7116abbe 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
> @@ -372,7 +372,7 @@ search_kvmtool_binary ()
>   {
>   	local kvmtoolcmd kvmtool
>   
> -	for kvmtoolcmd in lkvm vm lkvm-static; do
> +	for kvmtoolcmd in ${KVMTOOL:-lkvm vm lkvm-static}; do
>   		if "$kvmtoolcmd" --help 2>/dev/null| grep -q 'The most commonly used'; then
>   			kvmtool="$kvmtoolcmd"
>   			break
> @@ -381,6 +381,7 @@ search_kvmtool_binary ()
>   
>   	if [ -z "$kvmtool" ]; then
>   		echo "A kvmtool binary was not found." >&2
> +		echo "You can set a custom location by using the KVMTOOL=<path> environment variable." >&2
>   		return 2
>   	fi
>   

-- 
Shaoqin


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
