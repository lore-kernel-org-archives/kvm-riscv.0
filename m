Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E17C282D0
	for <kvm-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 08:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j7NGFA0zOuJH/gouZRjGpYi+NtyrbJH0uRJ8hKptm1E=; b=ItIT9OZkGc/kRi
	OalB46xX9j0b/ZERqAFzn0CBcHM3gpEJURSCF05U7U2O68HU09WcqulD8YklVY568HU3j/7g0B0j0
	TVK85J00bs2WBUWJB3p/JkpdGxcJdU27cG8xZeD5oVn/hFZk8AzB9ubQDmMBos4HHfoMriWdgtxJA
	frwcMUoFQ3+lFDmAcLSRAQWKuqRwwdPIZvZtAXWMjr+Oreu2w8A05+72ynLeC1iJ9+rXj3PzU/FZr
	oRmL/b0QLZOYirb9QLOTMGlBe84HzRZ+24BvpOoy4MZwUiRt7+8iSL0TSW/uTzKGlOae2XSTqPlKG
	JYCjbACLCeYPnlLu0w/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTHl-0000000Db39-30d8;
	Fri, 07 Mar 2025 08:42:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTHk-0000000Db2E-0cFX
	for kvm-riscv@bombadil.infradead.org;
	Fri, 07 Mar 2025 08:42:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=l8faWtD+xJ1942m4oDwtKpTnc6C+l89fRhpPKTFDxTI=; b=XXrdl9mDXuZEAiZUSQbm0YvWC6
	dauUH1KPnXeXiq+1RXox5ilswRLFVnZM6i1+qc8usOHcpm1DcY9+y4vgYKr9eQo9lG4X5EseN7XHz
	3lgImuskRkjTqAnn4mLfdnXEDZgpABlS2p9FB+4iL01mlHayKGKsYkts1BEf1s0s8Ue73HWXyzPLC
	1ypHcp6jfqOO9AzEIN45cm6ljNcSqWdBWkMH//9V5m/xK3uEaex+q7cL0poGHGXpYTkLTIq7rq9+B
	tWARVPSy7tjhxeVzXtNRMC4xZTzp2RspatP6Q2Dr+H/7QBNqUImeZiHaFyqpob0mSMIMH4ZNfBuZ+
	SoVAUn7w==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTHg-00000001J1l-1NnR
	for kvm-riscv@lists.infradead.org;
	Fri, 07 Mar 2025 08:42:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741336931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=l8faWtD+xJ1942m4oDwtKpTnc6C+l89fRhpPKTFDxTI=;
	b=R47plaJA8LNqKmqmCxXSI7A98DxRc1HzBIGb7ws+wDnrfzhyFvPHFkD+CNQNyYt1UejseD
	/pITRjfuNG9haePO42FnG2/RRSWE3aeh8DCNhljv47fqjA3brfE+otO73hkVODPpQvZtKv
	L/idQiv/eZP59ggNG1vIXQjbQ4VVyac=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741336938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=l8faWtD+xJ1942m4oDwtKpTnc6C+l89fRhpPKTFDxTI=;
	b=D50d8GW3DctHgpggBflIoSpS/6GRdabI4Votpd9mkPcpDd6io1UlqLge+a5ZqJFxYPEWxO
	DJ3YY/WfWH6W4XU71H1VYuVQn34sWBed+vuo8tqCoxt/vMa7gChBApp5bacjHkgvdgQOWG
	znnB5qlOmW0IhPpqylgayyX6AbkHr/g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-dEPdQ3KyN4Wor7BhSr9A1Q-1; Fri, 07 Mar 2025 03:42:07 -0500
X-MC-Unique: dEPdQ3KyN4Wor7BhSr9A1Q-1
X-Mimecast-MFC-AGG-ID: dEPdQ3KyN4Wor7BhSr9A1Q_1741336927
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39137e17c50so42056f8f.3
        for <kvm-riscv@lists.infradead.org>; Fri, 07 Mar 2025 00:42:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741336926; x=1741941726;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8faWtD+xJ1942m4oDwtKpTnc6C+l89fRhpPKTFDxTI=;
        b=IQ2Yla2lhZh3ITXLjhiLjk/YieoxRAwGWCVKa51fmbSeOKF4tqnB4N/Mez0qoz632U
         iNqLoNvc5UcC19hf+vpv8T31VY+mMdibfFtKYgMh34Ody47gdbqNcDsQjlvrk7ujRoyU
         cAKtVwhbpeZ3oKYQO7E4p3BQSIHs8XQAaHL8I0YsoF+mLWjI5nLN8MoHei4BuwspdULn
         HAVHgKf4bgwuir0+d4yTgupPq33/ciydy6ilRM7Kn3aCxeQ4CZCEY4Ys084iNVcSxHLG
         Nlgxzza4bjciiANg47i+VEB08yO4ACNIC9Ze6RQsUljWgK1JeImqzJRb4VrM/h70HG4/
         Rtig==
X-Forwarded-Encrypted: i=1; AJvYcCVdimr+ciBsvue+tZWglF2eaJFIvde0STRhGQgrQWBWqEWTiUPnXkfWenPmOlQZCg2oATseVd0IEhM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzBHSLav+j3wzRvEcIMxnKgNya9jGveVbzArDPn3JPg0cbKRJib
	W04Igh5MLUEkykqfmSprYlljBmnsBBLUcI5HssQvKTbOEk2eV1FUkFgw+kJeLH9sNCi2I2LYpxh
	wuYTkrCdW9KZgSLtykRkJRnfpSOyb0oiagwHMq4whRyuVko4VvTtClVZwxRalcdA=
X-Gm-Gg: ASbGncu/jiipRiMMF+/Fo3BXmYzCS8m9fZOsPX0Ow1LrdM2neNn09ofSRZzxww+K+cP
	fYQ5qapucuRw17cVSuwsNPC4R/cBUXzPs1S+wjszo1ikEpAZFOGHgBCUS7muqRjsrgVwlEt4lPP
	RROSeVB4j64ijkuRvRt7UNupA9zCPkTs9jwoxQRbKDpLeX1MDyTBOIz/KsYQlymNKhNKvpwixQL
	Df6SZHYx202rfSz34OVUJPGIOmofGtuzhKxlXaQ3vFthPbBgehpNU+qNRum8D3KKak0/sjBBYJy
	Eulm7/wlcDj49idyM1Swkc9pPMWhlQMiloRM/dK3yI/cAzk=
X-Received: by 2002:a5d:64c3:0:b0:391:31c8:ba58 with SMTP id ffacd0b85a97d-39132d16dd6mr1491127f8f.10.1741336926633;
        Fri, 07 Mar 2025 00:42:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEvTfkOOstDpIQCVNVrNI5tXKqN/Unz1X0joyz13KAcVi+91nu9TMSHHsyDlvACic/Oa9C5w==
X-Received: by 2002:a5d:64c3:0:b0:391:31c8:ba58 with SMTP id ffacd0b85a97d-39132d16dd6mr1491095f8f.10.1741336926296;
        Fri, 07 Mar 2025 00:42:06 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-231.web.vodafone.de. [109.42.51.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfba679sm4602122f8f.8.2025.03.07.00.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 00:42:05 -0800 (PST)
Message-ID: <2c0bd772-0132-4053-bd22-aac88a8dcfee@redhat.com>
Date: Fri, 7 Mar 2025 09:42:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH] Makefile: Use CFLAGS in cc-option
To: Andrew Jones <andrew.jones@linux.dev>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Cc: pbonzini@redhat.com, alexandru.elisei@arm.com, eric.auger@redhat.com,
 lvivier@redhat.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com,
 nrb@linux.ibm.com
References: <20250307083952.40999-2-andrew.jones@linux.dev>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250307083952.40999-2-andrew.jones@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rgZEVPToWzfGqJBrBHoSo2XF74njcQKmxsAj9S1PnXI_1741336927
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_084220_666640_DDF35939 
X-CRM114-Status: GOOD (  12.61  )
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

On 07/03/2025 09.39, Andrew Jones wrote:
> When cross compiling with clang we need to specify the target in
> CFLAGS and cc-option will fail to recognize target-specific options
> without it. Add CFLAGS to the CC invocation in cc-option.
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>   Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 78352fced9d4..9dc5d2234e2a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -21,7 +21,7 @@ DESTDIR := $(PREFIX)/share/kvm-unit-tests/
>   
>   # cc-option
>   # Usage: OP_CFLAGS+=$(call cc-option, -falign-functions=0, -malign-functions=0)
> -cc-option = $(shell if $(CC) -Werror $(1) -S -o /dev/null -xc /dev/null \
> +cc-option = $(shell if $(CC) $(CFLAGS) -Werror $(1) -S -o /dev/null -xc /dev/null \
>                 > /dev/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi ;)
>   
>   libcflat := lib/libcflat.a

Reviewed-by: Thomas Huth <thuth@redhat.com>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
