Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA6DC35FF8
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 08:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wp1SUX/QZdf2PMFNH9cglgE2kke0kecCXY8uDBIiBeE=; b=H1xNxfeVCFJmgl
	f//oCmPjXez8RLq31UJAqxqqsq0dKU2noKkZprq3Cs74W7vgdqY4GExSOaHaIgtQxj/VtkPGAeFHu
	t135sPsr9nkqxvb1301YFotiuoAOhunG6E4nydipVu/71oWRnwM8cWJ57ZqwIw1iDsk1Pjnc1IlKV
	DwhLseoqAKXEdClDLBGVPzfDNAwPf5StgqaP7QmrCHJ59bwBG0GIKD3uHAa3bC89sVIeD3p+6B6X7
	zANa0QutHEFzppCMCXVlnRhs9/lY37KcqsPNuS67u6qrOGrds6zCYjzQ2I2F3KyPO+pWLfnQmoFLw
	c380MJ6dSWO71jeML72g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu5sF-00000001kMl-1JMc;
	Mon, 17 Mar 2025 08:31:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu5sC-00000001kLg-0d7j
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 08:31:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742200259;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1e1w7vkGVe2zlHjiuKVaRcK3voy6SpJyKXoctlZSYQI=;
	b=gGnwQi4Uld/CwUHGsjeFf+IqdbFLJ2VFQPGirBb3g3nG+2fiW7n1p73ucQl3TjusxLj0Cr
	wKfAhEDgkAyDB7w6Sh1wtg44yLuAPVYE+OihpKPyxHLB62ebH4mX/vuHDIbBKWK1cA+G24
	gRpVWrX53y6FtjGxIeboFcPhlJLF640=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-hFlKF3gjOziPnM6Rtl5cCA-1; Mon, 17 Mar 2025 04:30:57 -0400
X-MC-Unique: hFlKF3gjOziPnM6Rtl5cCA-1
X-Mimecast-MFC-AGG-ID: hFlKF3gjOziPnM6Rtl5cCA_1742200257
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85b5e46a526so439846139f.1
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 01:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742200257; x=1742805057;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1e1w7vkGVe2zlHjiuKVaRcK3voy6SpJyKXoctlZSYQI=;
        b=BTUGKv+J4cAMegUPLgrBmZ7vjahmPaCwn8b/DXNCdNUoB64AHp+EcKFEBOrsekOO88
         m01Y7U7W9KJQ4bvc/8vQ2M+uMycfF2kgindEElsAxIbBfmgo0zNB+3nqAgw+50ZdWC0q
         b0aciTKqBml3kflhA64sm80LHLh1jiLYtT0YcjJSooDst4NsZalFLQ0TK9UxESNmY9ra
         GRHRSh6CFyvTpeZOQWaonIsZZ9NaBC5jI9lYoigVQ2QJNLyrdYSD+hTyduyvxVu3KOuB
         U1xCCjR3AkCaiwIa2EkOy6Ie71yGNPxxVlmDMSOUcHGVJlRnwbP3fx0anLWo2iTW1gHE
         0w8A==
X-Forwarded-Encrypted: i=1; AJvYcCUwbIjYmcTEPlj1fZH9eqB/VUza6SOtDUJdtrD2ivwBmK8U6/HFJDgsEhHKAe2BNmcD+lK8qVhFKCU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwcYlAqxeSjWLxeU9OeTqz6sicFyo9BZOCDXjt3WWQEhRcx5Zi2
	2jWUSHYs1S/S1zFGKUmxWomarrRWNZYjBsXBIob+vnqsGDqQhPlqYbpsDpr+8p5H/7Umy3XiEku
	Cry1ELkZ02RzXZgp+crYMhVvR7KYSIsTeZ93+3S+BJoGejsIfC52z+PpqlNjtEq4=
X-Gm-Gg: ASbGnctOEpyDghl2V5ZP1V/x+JimNwjQCRyFFqhfv+JdQc1mAg88nQI0b+7xbM79r8F
	GGCk7YbOqpwKzk76pv/RKZevHm+Pmc4/2TRlDwLkoj8gED/+wyPgwddaCxLgDMuBOKRolmVF9Vu
	xNf5tksckUpdFJvnH57w9vbvUzID1Q3wPQGzTite8OuegfoHbrLvVZW2rQqcsoRGKweDUb5ucuO
	MI4AMs8u3G0P7tXyfOGxzw+5VDspYy6KGa1EKbGqnV+IpdPR/adifvucr4JLZNZX0hio0BaTNVi
	g+KlVXi2ictAF1Ri8SimmRlJhuMikQtq09tut9PRmn6lPTRlYnZdwiDKPYcf/H0=
X-Received: by 2002:a05:6e02:3285:b0:3d0:bd5:b863 with SMTP id e9e14a558f8ab-3d483a82c1amr138000825ab.20.1742200256992;
        Mon, 17 Mar 2025 01:30:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHWx2BOAFHAQf6kpPdPpo9RU9ar3l1mcm+p8VJlq5wP/AXtSk7y90EOST3/f9LTxyG//NWIw==
X-Received: by 2002:a05:6e02:3285:b0:3d0:bd5:b863 with SMTP id e9e14a558f8ab-3d483a82c1amr138000645ab.20.1742200256699;
        Mon, 17 Mar 2025 01:30:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2637fb2b2sm2162086173.94.2025.03.17.01.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 01:30:55 -0700 (PDT)
Message-ID: <312bfffa-8e91-4b64-b88e-c9868a59d7ec@redhat.com>
Date: Mon, 17 Mar 2025 09:30:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v2 2/5] configure: arm/arm64: Display the
 correct default processor
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, andrew.jones@linux.dev,
 alexandru.elisei@arm.com
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, vladimir.murzin@arm.com
References: <20250314154904.3946484-2-jean-philippe@linaro.org>
 <20250314154904.3946484-4-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250314154904.3946484-4-jean-philippe@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ml-DHSaANSjqDx60dWK2LN4tDSjnU6i1KZYzrdNSrNs_1742200257
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_013100_270630_F0D8008C 
X-CRM114-Status: GOOD (  17.62  )
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
> The help text for the --processor option displays the architecture name as
> the default processor type. But the default for arm is cortex-a15, and for
> arm64 is cortex-a57. Teach configure to display the correct default
> processor type for these two architectures.
>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
*
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

*
> ---
>  configure | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)
>
> diff --git a/configure b/configure
> index dc3413fc..5306bad3 100755
> --- a/configure
> +++ b/configure
> @@ -5,6 +5,24 @@ if [ -z "${BASH_VERSINFO[0]}" ] || [ "${BASH_VERSINFO[0]}" -lt 4 ] ; then
>      exit 1
>  fi
>  
> +function get_default_processor()
> +{
> +    local arch="$1"
> +
> +    case "$arch" in
> +    "arm")
> +        default_processor="cortex-a15"
> +        ;;
> +    "arm64")
> +        default_processor="cortex-a57"
> +        ;;
> +    *)
> +        default_processor=$arch
> +    esac
> +
> +    echo "$default_processor"
> +}
> +
>  srcdir=$(cd "$(dirname "$0")"; pwd)
>  prefix=/usr/local
>  cc=gcc
> @@ -43,13 +61,14 @@ else
>  fi
>  
>  usage() {
> +    [ -z "$processor" ] && processor=$(get_default_processor $arch)
>      cat <<-EOF
>  	Usage: $0 [options]
>  
>  	Options include:
>  	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
>  	                           arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> -	    --processor=PROCESSOR  processor to compile for ($arch)
> +	    --processor=PROCESSOR  processor to compile for ($processor)
>  	    --target=TARGET        target platform that the tests will be running on (qemu or
>  	                           kvmtool, default is qemu) (arm/arm64 only)
>  	    --cross-prefix=PREFIX  cross compiler prefix
> @@ -319,13 +338,8 @@ if [ "$earlycon" ]; then
>      fi
>  fi
>  
> -[ -z "$processor" ] && processor="$arch"
> -
> -if [ "$processor" = "arm64" ]; then
> -    processor="cortex-a57"
> -elif [ "$processor" = "arm" ]; then
> -    processor="cortex-a15"
> -fi
> +# $arch will have changed when cross-compiling.
> +[ -z "$processor" ] && processor=$(get_default_processor $arch)
>  
>  if [ "$arch" = "i386" ] || [ "$arch" = "x86_64" ]; then
>      testdir=x86


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
