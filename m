Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E22C282EC
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 10:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RsPPsRpDqYNm3J4Mt7RHvNA+lLby415wnX1qYq5MWtw=; b=INmW78nvPQFllz
	yqxzP/twgh2GBbJbTgQnHbm3rNlwAtOlB0xhz0+sMd/m6gVVBI1oNwWm70MJtOBUE1qAATurIjMxS
	9rL3b3+n7qRmkwwTPOIf7lAZq6tKuiuexELEUae0Ikbn4fFHIFX/dMOjCNjqulVc7JUcyuFp3INgQ
	1snu7JflI/yrwE3PjAohO8NW7o+PDZc/bv11pAMtWPNt2Nokbat6mW6CzTUAfRPPMJmgCD5Mls797
	mTwyCYXNgPO9UKkT+lQ9z8eMKSjUFpkRPZFU3YfkkbzC6+mvfModFak6HvuSq08r1f2dDvTMVmxiF
	tRdO6y5Py5yxuJQgrscg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7Tt-000000025HC-3H04;
	Mon, 17 Mar 2025 10:14:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7Tr-000000025GW-2Cqu
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 10:14:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742206438;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tRBnMFtFaoL3oPsaYEgEoYjcIycECPlznLIMwEBWC2U=;
	b=XkLpEo+lJDRfwFDDP8SBBxdQG6FuNZa4oB9HyDPsMWovR0MJfxBEmF/86hmVivRmg6UX+W
	89MwjVoWsnrXl34HD1BkuFNrmzCzVgjXBwNkFBAFCjkH2L/QMwhi5NoqLs2Mt8yAIdbGF2
	mxoyRjfOdhB4W+ZUTXI4fsoeCdu8Nh4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-oojvxs0MPGqxhwRpnobnuA-1; Mon, 17 Mar 2025 06:13:57 -0400
X-MC-Unique: oojvxs0MPGqxhwRpnobnuA-1
X-Mimecast-MFC-AGG-ID: oojvxs0MPGqxhwRpnobnuA_1742206437
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c543ab40d3so788082885a.2
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 03:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742206437; x=1742811237;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tRBnMFtFaoL3oPsaYEgEoYjcIycECPlznLIMwEBWC2U=;
        b=HmR7+3hhVC2YwVKzxyqRJMbTJjxnFYnx4WNuhLAUxBR/4ojN2NvTelmh6UODD3cXTM
         3s2J7tX1+4+BVge8jiZswj7gTgOd+ANLnBWXMxCvqUuVPgDgfNhXLAtBg1JiYhx57hE/
         GwBL6gC5BO9jc04pqpg/GLylBd0SMvhLwEmtbCHa7rlEZqKJMe4W33DDGGO3HNnM5sWZ
         PtT4X9Lt2AiWqIG6wEMMQWRdGz2XmL0ivH/ae4cFss9pRVuu5EXUp4H5VC4h7kxvJbkR
         dLzjyK2ZDlziBA+4pD0NFOctSi5a0IW7hpfknkY7oaVRKWebv4TaKKoEHeVlzYlSAK6l
         wutQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvQC18IRTyrZULfn+wxVN2xhM6Q4aIU8obnXjr4iil/U9ikjbWZJBBGJEK3CO4wZt+OgBPH7Ek9nU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyYCFdSQuD6i7Wge7WXS+krswl1S/6uG7mrFZtygqod+hy46dPZ
	2H9KWju+ov9N0/LzU6fvI/jBc1koqqF1lkmCdxffCyTFnzEoxR8gjLgAsSfJfShXu5WLm4QuJ+6
	0Bnj15alPDxqgniDUDg6lsJeuzXeLHt5vKU8fc/MK9ZEAzEM7HjkcqqxPH24niMY=
X-Gm-Gg: ASbGnctMSnQRmGWzJqu/4qslmBHohWkR7e1qhrBCxy9713HkfOd4X1pAEsgv7eZ2gza
	d1HStUJfNY2mWMXR0mzGf4tPVIEurcyY/vYapH0SxMrx5MydNqbwtVZRhovYRAPc9W5h12uEkwn
	pq20GQamMiHWLMzy3CH22xwe76fh7QujLhs08XynN7+7ASD1i8XeGvbkx0zEKdd1MDG1BkT76ll
	0iHVSNi4zAQtFQrSpwVdKykE57LKWQq0IlrMbYtze+61aF+x1jCZjjKD8mTnoVeoY/a2Jd7GRBH
	9CNna6wL2p8NxLYCAxtgG1BTzPcSxUDF9F7nMppubDscSGPyTDkZypUoCzulXvs=
X-Received: by 2002:a05:620a:2948:b0:7c5:5768:40ac with SMTP id af79cd13be357-7c57c7c20f3mr1847837885a.30.1742206436626;
        Mon, 17 Mar 2025 03:13:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIOCaxHvQVjTZIrGZZ+aLZbn1xQMAi5UZQbQFIiZdjRyvxK5f639qijZj7sKktMuvUlWabOQ==
X-Received: by 2002:a05:620a:2948:b0:7c5:5768:40ac with SMTP id af79cd13be357-7c57c7c20f3mr1847834685a.30.1742206436273;
        Mon, 17 Mar 2025 03:13:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573c7d869sm566706385a.39.2025.03.17.03.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 03:13:55 -0700 (PDT)
Message-ID: <1ad28176-d564-4d62-898d-d1d80a2609b0@redhat.com>
Date: Mon, 17 Mar 2025 11:13:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v2 5/5] arm64: Use -cpu max as the default
 for TCG
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, andrew.jones@linux.dev,
 alexandru.elisei@arm.com
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, vladimir.murzin@arm.com
References: <20250314154904.3946484-2-jean-philippe@linaro.org>
 <20250314154904.3946484-7-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250314154904.3946484-7-jean-philippe@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V7_MTMi9ac2j3Z_FrlsBowYVRV4MGgoQ1Vgyd6kyOr4_1742206437
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_031359_637394_13CBD528 
X-CRM114-Status: GOOD (  11.68  )
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
> In order to test all the latest features, default to "max" as the QEMU
> CPU type on arm64.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  arm/run | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arm/run b/arm/run
> index 561bafab..84232e28 100755
> --- a/arm/run
> +++ b/arm/run
> @@ -45,7 +45,7 @@ if [ -z "$qemu_cpu" ]; then
>  			qemu_cpu+=",aarch64=off"
>  		fi
>  	elif [ "$ARCH" = "arm64" ]; then
> -		qemu_cpu="cortex-a57"
> +		qemu_cpu="max"
>  	else
>  		qemu_cpu="cortex-a15"
>  	fi


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
