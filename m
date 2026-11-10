Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DB060A5BC6
	for <kvm-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 13:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=brpDUD4j;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QUeaehTf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TEuyaGK6dFcqRXAPmy27/YVUgX/4DnVDLDfGZb5tjuE=; b=brpDUD4jrfguuyYU3I3bnJAaR7
	xiH85nCFzSofxvFw1aPqeVkxtpIjTXbZsAc6Dd9JzlmPvXaaG6Us/J7VCZ12Kc9K+Px4/xSm8TdW8
	1L3XU3PLdGKqM9w0F+AU4IU89nx3FUDyIQ8xL2VHZjCMyIxSQA5Kx1eMGjMp7VDee8TxdxGY0I/8O
	e7gQJZK7QzjLf3jQ0XMBfZhb1yE2B8TRQpcQw2nDV7H7UUUDl+OHE4VGyxpTzw/wRwvNTx+gjQmXJ
	oY3QIPEUpED2roZueViylbCJsZF4cpSMDfX5kvbWa2IbGNklRg4/f5R/6+7Is/WQR8EupMDbk68vT
	J7Er/h3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmC0-000000046zO-2CwR;
	Tue, 10 Nov 2026 13:47:20 +0000
Received: from mail-pi2-x0a.google.com ([2607:f8b0:4864:3a::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmBx-000000046y7-2enB
	for kvm-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 13:47:19 +0000
Received: by mail-pi2-x0a.google.com with SMTP id 41be03b00d2f7-cdac0ac5f19so1029011a12.1
        for <kvm-riscv@lists.infradead.org>; Tue, 10 Nov 2026 05:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794318436; x=1794923236; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GnZf5t7UPSoR7hVFC72+KtUOhGomuwzXct79OPnbGl4=;
        b=QUeaehTfSfMBHpwxSiRryy0ec/AA6Yu0uhfyQXNAGBxXqeXNACHdxTPcxxp0fUZO1o
         4EkvdjRdKdvLfrVOKJxUJx3hCtAvOFNJ8TT0YwSf79Gvc//RYxQEvKInOAL3ffHuqiIw
         dmaH8Za1zqYD8WqWUTLXadDLoZgoASRUzeOoHrKL+dPSQ6dTXdlLWrSSI5Yr9PtKjL0b
         UUUedKiy49SQWb2SJToi14H4nw8XUqZDSt/0Yqa37LALIh+L+o2+UdmhMiKsoTplpzW1
         4c9sPSEfyI60ZzzRjBHjQZGwbj4cM2wTEdm3j6lJAwk+hf/hHhgoXHEqlL5BArsUAz+U
         skHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318436; x=1794923236;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GnZf5t7UPSoR7hVFC72+KtUOhGomuwzXct79OPnbGl4=;
        b=vZ2aIcOATNOZ8BmpSY59GNAtEQtyqOUl9zg6mP8UbUbG6epp+xkIxdk1Q01Mw77ulO
         +d7F2ANsB+oEUt1zn1r5biIAQaXyoq5iReos493y9tWgCb3fl5e+fG05v1VUgYvjs8a4
         I3echnKaNN8d811IvS3DW/mFOB2mqa2GFt8qUCHjEnUroftf+gJmBIel3tFA5mcVv3W5
         C9Yw3uLZ/saOC5rpO87nxv+CaQsEmUek8CSzCVI4mDf/JbsKwlnWxMiNF/vRYK/ABRbh
         Z/FMEg7nbUTXvrn6UBlFQIV1gAA5rFoXR5U8R7GlYoFFX/IJxHs/7XeaGqMSOSgyZiym
         oJGA==
X-Forwarded-Encrypted: i=1; AL+hErEfhkLnVZlWyGAogfYqJ1ETzxRljl1AUvtjJPwm7UB2LKun0c1WYphn1ZIRCEUFoXFcYcUhXBlS77M=@lists.infradead.org
X-Gm-Message-State: APuU4Z9cDiqBUJ8jp0lIL0MvQzDE+AbH8EE6FcYT5a5szPSOHaB8AeJy
	sttlrtIrJngpoVkjsorIYTTsEozqL4z4I+RlKiHde8KUkkB75ywRce73
X-Gm-Gg: AYBFou2BG4SjZN/hPCHaFXkR508CkWycNaX4el5NICC6zuYm15FyTKmoaWz57WSSD+g
	Sp9Efb9vuWAF/EnTp9XzMKfWNkTzsx2ficmLhL57bGQZd9QQ6MA622FtTmgPNhZYuRM+3doTpFQ
	Zr3xErxRgBJ+GBBE2/T57Nft0y+/GIWGKrWhIxzsEBtzzYIFqF/oaUnTZyoeHI3ngF04gPgci3w
	HdUw/9n/amh6Z0bZLTNGaUF1tqkqYTN7e9TtN3rw2x9vYA5M0cp42NmyYqKkhOFftmqEViWslGc
	SzwHDVHde/OHUnGp1BVUyZR2LpWR6wOOIWW/2/BUEHcH7NzZQHlM0wCaHbID9VT3qupRuUIr1Ub
	3chkU25Yp0HKzkKW3hLjmsQOHg6JjcFSlcydc+k9HSm/em04ItC1NQMGJAJ62gBAbzhGMTjZGF1
	HRRIoGMLcBPH4ntm8XI03rLLfk0gHrSTZaY/GJi75QfPYMxCCabR0XX2dlrcNL+7XjmF6qL3Ens
	lwiVCGjeQh5F3IrRvpv6t8evrUpalpA7rUSUv5WbCuZ3+bDh6Ucf6HSnZW8q78npew8EKOavIi/
	VAh/9qH5XI1YQoIt/AmahhbsuMdOl3EglN6bOz3Pi6Dw+ew=
X-Received: by 2002:a05:6300:210f:b0:3de:48e4:c37d with SMTP id adf61e73a8af0-3f18f0b86e1mr2622791637.26.1794318435879;
        Tue, 10 Nov 2026 05:47:15 -0800 (PST)
Received: from [192.168.50.100] ([114.252.97.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e110sm867486b3a.36.2026.11.10.05.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 05:47:15 -0800 (PST)
Message-ID: <42ce73bc-0fb5-46d9-bc45-34a5bef25cb2@gmail.com>
Date: Tue, 10 Nov 2026 21:47:05 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 9/9] iommu/riscv: Add riscv_iommu_attach_dev_nested
To: Jason Gunthorpe <jgg@ziepe.ca>, Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: tanchi25@mails.ucas.ac.cn, alex@ghiti.fr, andrew.jones@oss.qualcomm.com,
 anup@brainfault.org, aou@eecs.berkeley.edu, atish.patra@linux.dev,
 fangyu.yu@linux.alibaba.com, iommu@lists.linux.dev, joro@8bytes.org,
 kevin.tian@intel.com, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pbonzini@redhat.com, pjw@kernel.org,
 robin.murphy@arm.com, seanjc@google.com, tomasz.jeznach@linux.dev,
 will@kernel.org, wu.fei9@sanechips.com.cn, zhao.qingye@sanechips.com.cn
References: <20261105144944.10193-1-tanchi25@mails.ucas.ac.cn>
 <20261110115137.184160-1-gong.shuai@sanechips.com.cn>
 <20261110131658.GW663069@ziepe.ca>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20261110131658.GW663069@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_054717_678647_B027870A 
X-CRM114-Status: GOOD (  10.10  )
X-Spam-Score: -1.9 (-)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jason,

On 11/10/2026 9:16 PM, Jason Gunthorpe wrote:
> On Tue, Nov 10, 2026 at 07:51:37PM +0800, Gong Shuai wrote:
> 
>>   2. Use the guest PSCID directly, but allocate a separate host GSCID for
>>      each vIOMMU.
> 
> This is the right model. The viommu should allocate the GSCID directly
> and keep it for the lifetime of the VM.

Thanks for the confirmation. The new version will use this scheme.

> 
>>   3. Share the GSCID and maintain a per-vIOMMU mapping from each guest
>>      PSCID to a host-allocated PSCID.
> 
> AMD is doing this because they don't have something like a GSCID.

Understood. This approach makes sense.

Thanks,
Shuai

> 
> Jason


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
