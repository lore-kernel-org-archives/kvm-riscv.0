Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBFBC83F03
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 17:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KeQyuM/wZuW3l5YJfKCxPX5sXpALc0anYhPxNDG3KFE=; b=wy09jjHKyNlymR
	O+iD4OtctZ1ypwP7kiNFkY7sNMDYxHb9Mtf3Zfo8LHeUj0bjnHhqZQFbw9eNxE9Yx/Sjgby6su/Kd
	EtIC05idUFc7+USxDdftUoQI52ZMqQ0eTzy9GPn6Tj1nKctbiSiUlW8VdartqTh+btRjtg/ugGVLK
	EEItxkr6hw39ZC5wIXSIH+PmXk+Ss8MFah9Y5BwgfAAjiiRgyS2v94hRAHHOxherA8lKtGoB6E7/t
	hB8JU2z+moDXEMftchR3BtUR5vUY+ckavsq/cw6j3OZsr+Wsq43PzMcOoK/XAc4IkP1BUYCiIqG1H
	GD7Q1ioMxYegozRe8h6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1ZA-00000009ADF-3hgq;
	Wed, 02 Jul 2025 17:48:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWy7o-00000008a02-3XPR
	for kvm-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 14:07:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751465266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QtugXBwpmof8PtjrVGSF5iQiiRq53WoQXJVBl10e0QY=;
	b=TOMCJzdeTs6knaxCuSnSUVXvuFm/Yj41wQQYc4MIvwGtkb5MBoIQJSdo0XX0AFV0vcfeiQ
	scIDOaZ3gK3plLGl+lelfirlAfb/bokpF9XXvfouMu01RMmgJnf/189AhzJZ2SrAQXavxI
	PzouxnJ5LuZFXuRsqSUgBFCsEAOA+Ug=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-I4t-14iMMLujJ_qXaFF4BA-1; Wed, 02 Jul 2025 10:07:44 -0400
X-MC-Unique: I4t-14iMMLujJ_qXaFF4BA-1
X-Mimecast-MFC-AGG-ID: I4t-14iMMLujJ_qXaFF4BA_1751465263
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450d64026baso37578345e9.1
        for <kvm-riscv@lists.infradead.org>; Wed, 02 Jul 2025 07:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751465263; x=1752070063;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QtugXBwpmof8PtjrVGSF5iQiiRq53WoQXJVBl10e0QY=;
        b=ZCvnkJw+hPa9qgfE5Q8zSTLra1RsF/U/3vaKnzGk4F2G1p8X35xBS7tIgF7rCvX1wc
         ldNKlv7r2dZp/wHhI+Hmp9X8HoYVMWjhPbc3VfmH8KavceY0OyVx8WHoSKW7Z4qkpF8m
         IHIqQ26Xe7QZfET9b4hDair8cYuePZ40W7nfuw3qvBKyyDZOan3z/o0crL8nMkTeHJCG
         YP+Ke2bcHo1nb25frpyBq4RYsgLoTGd3D9Y9qOkWA7J4dhxA10m+VQBuN+FBHZaj1TBC
         u4bpL5mqupVJVJM6jMEOvXNaOhwljjKozHXAKGwZgoxhD/eieJmtKNJWaCSishedSsL3
         bIqA==
X-Forwarded-Encrypted: i=1; AJvYcCVreHhCkaK/KzjvWmh1wIBTtt+RMV/4V6d+xXk5LM/qHjVTYOGPtkRghVBmHMB7czywmMSTKl5OJMw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzdr4q+hp6cGzWGnYAn6x/+QgGXiA8OuXowng1z5qoTI2aqVzJn
	zGA7tweQUfFlItT/g1aaoFUAJY6kfFs75dlHElxd0AoS2cnZV8GXV22lwOP0k1cxLkutWhnu/mZ
	nq/AUwgs0bAxvrAd2OPgO1o1ZRElgCO+cm7mwh6GR9zxZNWuze4cJ8gZ3ItnA/ddwhE5qI3QV3c
	A=
X-Gm-Gg: ASbGncvhuTJ/SJ6Gh6bLDldbj8XtX1eA/nZhrfZPaFPN5nfNJnvRdUXcb6MitNEED4W
	fwT4NCKFhjhIh8WIbY8Ao0O3oeSeT7Umf9FrR5aOVFadT1Qr5pAVVnxRLA0PeaBWnO4AHC2Q8d3
	jJqANG1ag6pQXWvnJnzFBqPaRsFm4Y83BZup3UdfsSrMaB7eVYVsdfSMNVDvGdB6vNXeMi6BnzY
	GbcMJofEWWHoix0r0oYYWK4k4K3O9c57/xrPi5stLNmk430amrTMb4D5h2irKxtaOH2eVEA/aD3
	wCAOVVS9G+8PWas8U2G0qYR9Qic0fTVlWu35FxMhRYU0oTk870CkhJOn0Xn5Lg==
X-Received: by 2002:a05:600c:3b01:b0:453:99f:b1b0 with SMTP id 5b1f17b1804b1-454a3706e45mr28815095e9.20.1751465263148;
        Wed, 02 Jul 2025 07:07:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5YuCq5rpUy6RMv0jfgdQbgLyOb/XAUKuoXtz40yFdPi0MgOsaJG33C7l4K2KM2eHAFCoDsQ==
X-Received: by 2002:a05:600c:3b01:b0:453:99f:b1b0 with SMTP id 5b1f17b1804b1-454a3706e45mr28812865e9.20.1751465261164;
        Wed, 02 Jul 2025 07:07:41 -0700 (PDT)
Received: from [192.168.0.6] (ltea-047-064-114-041.pools.arcor-ip.net. [47.64.114.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453a85b3d44sm36303505e9.0.2025.07.02.07.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 07:07:40 -0700 (PDT)
Message-ID: <69c1b5df-2b49-4a3c-811c-ad6141a22dbe@redhat.com>
Date: Wed, 2 Jul 2025 16:07:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 1/2] scripts: unittests.cfg: Rename
 'extra_params' to 'qemu_params'
To: Alexandru Elisei <alexandru.elisei@arm.com>, kvm@vger.kernel.org,
 andrew.jones@linux.dev, lvivier@redhat.com, frankja@linux.ibm.com,
 imbrenda@linux.ibm.com, nrb@linux.ibm.com, pbonzini@redhat.com,
 eric.auger@redhat.com, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 david@redhat.com, linux-s390@vger.kernel.org
Cc: Shaoqin Huang <shahuang@redhat.com>
References: <20250625154354.27015-1-alexandru.elisei@arm.com>
 <20250625154354.27015-2-alexandru.elisei@arm.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250625154354.27015-2-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0C6wY0cKH-GrfYIA7npx5Ebe50SDjyf53FxXVDVERM4_1751465263
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_070749_064116_E28FF7D9 
X-CRM114-Status: GOOD (  18.90  )
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

On 25/06/2025 17.43, Alexandru Elisei wrote:
> The arm and arm64 architectures can also be run with kvmtool, and work is
> under way to have it supported by the run_tests.sh test runner. Not
> suprisingly, kvmtool's syntax for running a virtual machine is different to
> qemu's.
> 
> Add a new unittest parameter, 'qemu_params', with the goal to add a similar
> parameter for kvmtool, when that's supported.
> 
> 'extra_params' has been kept in the scripts as an alias for 'qemu_params'
> to preserve compatibility with custom test definition, but it is expected
> that going forward new tests will use 'qemu_params'.
> 
> Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
...
> diff --git a/docs/unittests.txt b/docs/unittests.txt
> index c4269f6230c8..3d19fd70953f 100644
> --- a/docs/unittests.txt
> +++ b/docs/unittests.txt
> @@ -24,9 +24,9 @@ param = value format.
>   
>   Available parameters
>   ====================
> -Note! Some parameters like smp and extra_params modify how a test is run,
> -while others like arch and accel restrict the configurations in which the
> -test is run.
> +Note! Some parameters like smp and qemu_params/extra_params modify how a
> +test is run, while others like arch and accel restrict the configurations
> +in which the test is run.
>   
>   file
>   ----
> @@ -56,13 +56,18 @@ smp = <number>
>  Optional, the number of processors created in the machine to run the test.
>  Defaults to 1. $MAX_SMP can be used to specify the maximum supported.
>   
> -extra_params
> +qemu_params
>  ------------

Please adjust the length of the "---" line now, too.

With that nit fixed:
Acked-by: Thomas Huth <thuth@redhat.com>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
