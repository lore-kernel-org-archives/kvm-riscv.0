Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BB0C282EC
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 08:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mrSEndQEG/eN/hXzUeUDa9lnUWm8WkxkEWWh+bpt+Ms=; b=KOfhPzYd75fS6M
	3aNnoVRZeaGizCxqR3Pyuy9cvBZRLXFJd1V4lCAkHXtTMMJmEizTtuq4KE112Hts9V0X182GTA9aN
	BxEuFq0FE2CwyB/g/43/gnl4bGiREhII7iJRBGu60iG1itN4cFqxagx/sUk6kwqlNm2WvRcOhoB65
	u6XFfam9nMxGYnKz+l7gY7OyeBIprzzihLwlvtPFI68hYucbg8vVzcBiilE8eYwg5Sbb4QfWy9oFW
	r0380IWGHoQJZ6HFBzFb/0pvlSkxrh296Q57dYWtP4xWFYx8YMlzMThHLBxW1ysJYFgEHJekIgmAb
	vgEadj/hOi3PT26zrx9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu5ic-00000001iBm-2z96;
	Mon, 17 Mar 2025 08:21:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu5iZ-00000001iB0-2afY
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 08:21:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742199661;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0nejHxLLnivIrRTuFTd2M1TZx73UJZS8r5WGx9tsowI=;
	b=Luddk7pxc8MeS361CpQKHc73OuMOvop3s+I4ZhuAcG9Zmnmow7dU3AfYpiQrMu3725LKfh
	CocLOL0+H8HC3mdnsxvO7h4jggOkkTEpZ0l8HFqMSJxWID9aspm9PM1rFZb8Ns73XZEVj3
	ORGxRf4hKcnV2KxS3Jt/IyxZUMvP30g=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-xy7PxQXdOOm_ICEThdMTpA-1; Mon, 17 Mar 2025 04:19:12 -0400
X-MC-Unique: xy7PxQXdOOm_ICEThdMTpA-1
X-Mimecast-MFC-AGG-ID: xy7PxQXdOOm_ICEThdMTpA_1742199551
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d443811ed2so92316625ab.3
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 01:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742199551; x=1742804351;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0nejHxLLnivIrRTuFTd2M1TZx73UJZS8r5WGx9tsowI=;
        b=R7V/3yCuBP5exjPJ9CY183dDaYG2WAWq9Mpcs57+KVdoObo6F2CL3cqkmbW2fjHqSr
         kg7ngW2L5Wi4e0dH5PfJzvp+p0skIOK4oi73yUCqjvW3a6n0A1V4VKAPjX6mrwWfwOe0
         HUwqBr7T+14BiOmH5FB+VNjO02MiZUGIi8TrN1FbnH5RzcYI/SrzjvcXnwWKybdWIhSS
         HxV7GeV8D96jcCpYBiC4LTcwLhssEi2Jz3C68qbb2L2lpcFKmSvzLYAQqzurV7nhxZmS
         zWMJjMSMjqI+eutmn85XnggYdA5Zekj0ynZbC9K0NZLjUI8FhIkUFENqUw9JWo3eLVuE
         NvDA==
X-Forwarded-Encrypted: i=1; AJvYcCVnY/EIlHaBkypMH5I6FYdRAdXWY1KMbJOEbIg3azHmV6cseRKgEWPFyHEFJd2V5/G3WskSJTyub4o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1xNkO+bzVeVnDQo+0PMArf8uKYZ57y2VAYdva56TBL9/vlBjB
	YuMgHRE0YvrDkoygrRKstwyOXhdpVqt4kqaeZk6xWL8NRbWEqcI9ZcNwLqCKXKIvCGVTxsRu1T1
	IRrHaN3+d8Ag43RVNQe5BAf6buSOIELkCxhOMCZpLOBWhX/zla5I4yFaqOXK3yeM=
X-Gm-Gg: ASbGncvw6w8ihDNgEO8DBDGRDgUwvCK0Tv5giMCGkNJ5/VPWe5DnwHEoP4A/Sg49igp
	pYn1otr/jhJa6U050gTEL67e9cOKN/LSXNb9X7tPlWYuLpJycAMOZz8wUjDqC4flaabgRh+oTTC
	fc6HWM7Jjlt0Tg5HElMVMgwSYJfuJuZsHWj9QC0U6u/VjHB14dfcPCWrze3QYxk2PZ2CpmPTDZ8
	PEKddOUrfQIW9sFt+0Q8nmtB/g/j85CCAE1W0R++wa7RSGps6YGLR3Z/DGCL7XjTR9MIbL7nxtD
	Z/ySES7SywWKWgfVffxZwf8LTvh7h83eu0p/JFTvPvPucpWI0GFg69UVpD/Tjhs=
X-Received: by 2002:a05:6e02:214d:b0:3d4:6e2f:b493 with SMTP id e9e14a558f8ab-3d483a1a038mr100733435ab.11.1742199551380;
        Mon, 17 Mar 2025 01:19:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsEkTjItCn+3c/1exaejxjUCNrW349jWciioJ8unsR3OwQFSF90QFz+g/WpvO1aQ2salG17A==
X-Received: by 2002:a05:6e02:214d:b0:3d4:6e2f:b493 with SMTP id e9e14a558f8ab-3d483a1a038mr100733315ab.11.1742199551067;
        Mon, 17 Mar 2025 01:19:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f26372760asm2145612173.67.2025.03.17.01.19.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 01:19:10 -0700 (PDT)
Message-ID: <1b0233dc-b303-4317-a65d-572cc3582b8a@redhat.com>
Date: Mon, 17 Mar 2025 09:19:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v2 1/5] configure: arm64: Don't display
 'aarch64' as the default architecture
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, andrew.jones@linux.dev,
 alexandru.elisei@arm.com
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, vladimir.murzin@arm.com
References: <20250314154904.3946484-2-jean-philippe@linaro.org>
 <20250314154904.3946484-3-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250314154904.3946484-3-jean-philippe@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jaPUWTjl_wDZqiHeMq8gGXYHfmOBZ_grHUhVw_K16EQ_1742199551
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_012103_721745_49C44CD6 
X-CRM114-Status: GOOD (  16.93  )
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
> From: Alexandru Elisei <alexandru.elisei@arm.com>
>
> --arch=aarch64, intentional or not, has been supported since the initial
> arm64 support, commit 39ac3f8494be ("arm64: initial drop"). However,
> "aarch64" does not show up in the list of supported architectures, but
> it's displayed as the default architecture if doing ./configure --help
> on an arm64 machine.
>
> Keep everything consistent and make sure that the default value for
> $arch is "arm64", but still allow --arch=aarch64, in case they are users
there
> that use this configuration for kvm-unit-tests.
>
> The help text for --arch changes from:
>
>    --arch=ARCH            architecture to compile for (aarch64). ARCH can be one of:
>                            arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
>
> to:
>
>     --arch=ARCH            architecture to compile for (arm64). ARCH can be one of:
>                            arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  configure | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/configure b/configure
> index 06532a89..dc3413fc 100755
> --- a/configure
> +++ b/configure
> @@ -15,8 +15,9 @@ objdump=objdump
>  readelf=readelf
>  ar=ar
>  addr2line=addr2line
> -arch=$(uname -m | sed -e 's/i.86/i386/;s/arm64/aarch64/;s/arm.*/arm/;s/ppc64.*/ppc64/')
> -host=$arch
> +host=$(uname -m | sed -e 's/i.86/i386/;s/arm64/aarch64/;s/arm.*/arm/;s/ppc64.*/ppc64/')
> +arch=$host
> +[ "$arch" = "aarch64" ] && arch="arm64"
Looks the same it done again below

arch_name=$arch
[ "$arch" = "aarch64" ] && arch="arm64"
[ "$arch_name" = "arm64" ] && arch_name="aarch64" <---
arch_libdir=$arch

maybe we could move all arch settings at the same location so that it
becomes clearer?

Thanks

Eric

>  cross_prefix=
>  endian=""
>  pretty_print_stacks=yes


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
