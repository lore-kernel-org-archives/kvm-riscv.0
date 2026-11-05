Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EB1606A31B
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 18:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DESiz9qj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=PZvk7WDZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1FhJhPm0SbS7AHTTDDcu4Y7fVBuaE3clqXtMMOwAdH0=; b=DESiz9qjpmic+ls7EnUeaOLbpM
	b3PiamNrb5XemtCkD/SpR/4TttQ61WGf8ThSnpS3w9CbC+Za0ZsZyrti9EIAvJYpRHgi0b4b5L1Ej
	MVpa2+3+FqsFl5jEZduZnu8JWicW+E624KnItiWAsQ1ZW01v5Ddxm7M5dPwJXg1uTOCYHAbBtlD4p
	zlmZml0+gwqOXxC6SKc5HMg66whylaRt4Flv+mobkxljV4vNQSHU6Gs9IaqG+Y4X+xRJClTc385o1
	4fWOlOLRbXPsRn/JXofDviZCRo8iNdjcdZeeMEQitQcyOVX7NRFknUsemAR8A6UevVrXiU5y9L32r
	QO3Kzw5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2GS-0000000A9I2-2kIe;
	Thu, 05 Nov 2026 18:32:44 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2G9-0000000A9ER-0M9S
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 18:32:40 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-5eae1276409so744562e0c.3
        for <kvm-riscv@lists.infradead.org>; Thu, 05 Nov 2026 10:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793903544; x=1794508344; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZFFGdirTAMGtbCDF7cv9kKouCz6oxttoVV1PmG5xK7s=;
        b=PZvk7WDZdgAFsRWcIberbXkFXCHff/5VgpzH2Gks6XPV7lM2YjO0DTnCASBksRskAB
         NygXIUrATDWZyfaRyo4qWn7wrWqrkyihnlqOoqg7ySV43Qu+cD06CnOGH4r4vXBPeU37
         tfWzhSoqfgcU95VwOy4YDB4qojRJDAT05nN0Pup9YmAUTGX11g3WwqJERkvM5hnedV8J
         ATxyxhuSE9mq3M5TjC85HwG8JEDqe7XjaWgCtAknqaA3pozrveZ72Tq5mqxMraIzfih4
         QTsmaRFmsHPtqYcYeTZHS0nHq9x5dKweNmaq1HF3K+mHi+3Nl2pvF2D+lg/LoRpD8T/5
         eH7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793903544; x=1794508344;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZFFGdirTAMGtbCDF7cv9kKouCz6oxttoVV1PmG5xK7s=;
        b=njwwkQRakW5B9BTsZICsQHRLuTiqGs3lLfYq3kmtlt3+YbDYw1Px3YW2QRlow43WQJ
         6ucVAjnuxKjWnf+2beORpXKxrhjoDENzg/192LuA5uEFWUEuITltVJBDaK2p62Vn0YOx
         4Uau3dXrpby9kLtUsA3TBhAVKvzu5Pjgn56qWxYDJB5uq+fQGpLwJpRRmif/68ZwfzOt
         LaK6D6yEqMXhFcuZ2hf8IdOruCBZA5nhw2asVWNUPCxm4Tpi9tfL6N2m3Xsh26dXPG5j
         LyTdHlSvgkEvxoWysUbD5MSPfVhhX1CkTRMUQVpML+idpuTsSm/efhsUr/DrI/Rxc8fN
         cLTA==
X-Forwarded-Encrypted: i=1; AKwUvByU8NXCsC936qqke4fR3bdmYH23Ti0vOc225FB0AEWmRNjc9URyXo+sfw2sEFyEjEM9PUoIdofxm78=@lists.infradead.org
X-Gm-Message-State: APuU4Z9ep0K8tERFv3YO0BBaQjd5ZUxKcBvRBMV5gBgXyx0dANFKd1iW
	j0gSmWZ8MZ3p8B+msnOwkxO/X+X/PgRtY3m5XqcLQe+OEKGdysso3iQTDWtR/tUmm2U=
X-Gm-Gg: AYBFou0FRcW9MoSNNWZv4uj8o88vlutptvYU7uNa1kBjvW9AIL5C/kbzYAS3X90JguC
	y0zug+BZEksh8/5Kurw1O0JP/zer9b/AenUYhKMMr6yUqmy1532g5+OCG9ht1Vo3hpLEIxmTyBY
	Iu4vGnWLGyVF2pSpZZDJFktvQS8pamXziGOswS/sz8CHOiaUVSSpjb8yMD3oMNWrShtKfqNBg/T
	JQQ6UW3/4U8uXtErfOpYpSsOO53CyQutSyX82U/TSgIG3R2YBHTW1e1XomIH4IpSj3kCfB0NXv/
	Tt1zr5Xg7frsq2pIiOsO3UbMhwNhf+4TjpxRxld+Fahp5gup5A1iJTklMcpnUuzRFDwPaUzrGH5
	jm9FLJk/qZiyhtMjSVPZjgEqj/8ncuidt4oW6VV3Gt5RahZ4F4r82aVwYDwrYEu9hGrJhleqIqS
	UGsW2HlPjBqc6wzqU+8znc0ZirX1OkwvtwdAxRNSnQhVXwOt91/TzAZgWNjbrNk9ugrx9RN+7RO
	9uZl+6yuuu6voVmFPs2rK7plFSlSWm7PlS2IgLARGlZrAUlMX9SLp6DBMdIgUOP/z0AN3tsWsqi
	9Fk7DMw0zNJWiQO9HaPnZwH/CYXGh4QwGGE+8/s5Cw/m+SO4vyA9yWV7SYesXK2PWDfmZ1TO8ZO
	pu5sOmRTUSA==
X-Received: by 2002:a05:6122:1782:b0:5ea:e1cd:6e4a with SMTP id 71dfb90a1353d-5ecc446d6b1mr99753e0c.23.1793903543539;
        Thu, 05 Nov 2026 10:32:23 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8d77c6esm5043981e0c.6.2026.11.05.10.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:32:22 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xP2G6-00000003Ng9-0h1l;
	Thu, 05 Nov 2026 14:32:22 -0400
Date: Thu, 5 Nov 2026 14:32:22 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tan Chi <tanchi25@mails.ucas.ac.cn>
Cc: gong.shuai@sanechips.com.cn, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	tomasz.jeznach@linux.dev, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, pbonzini@redhat.com, seanjc@google.com,
	kevin.tian@intel.com, andrew.jones@oss.qualcomm.com,
	fangyu.yu@linux.alibaba.com, wu.fei9@sanechips.com.cn,
	zhao.qingye@sanechips.com.cn, gsh517025@gmail.com
Subject: Re: [RFC PATCH v2 9/9] iommu/riscv: Add riscv_iommu_attach_dev_nested
Message-ID: <20261105183222.GE663069@ziepe.ca>
References: <20261029061131.584453-10-gong.shuai@sanechips.com.cn>
 <20261105144944.10193-1-tanchi25@mails.ucas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261105144944.10193-1-tanchi25@mails.ucas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_103229_714535_AE7D37DB 
X-CRM114-Status: GOOD (  16.11  )
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 10:49:44PM +0800, Tan Chi wrote:
> Hi Shuai and Fei,
> 
> I noticed a potential issue with fixing the physical DC's PSCID to 0.
> 
> In QEMU, different VFIO devices can have separate stage-1 HWPTs while
> sharing the same vIOMMU and stage-2 parent. This means two devices may
> have different first-stage page table roots but the same host GSCID
> and PSCID=0.
> 
> According to the RISC-V IOMMU specification, DC.ta.PSCID identifies
> the first-stage address space when PDTV=0 and the first stage is not
> Bare. Could this cause the physical IOMMU to reuse cached translations
> across different stage-1 address spaces? Even broader invalidations
> would not prevent such cache aliasing.
> 
> There also seems to be a related issue in patch 6.
> riscv_viommu_cache_invalidate() unconditionally forces PSCV=1 and
> PSCID=0. However, an IOTINVAL.VMA with PSCV=0 also invalidates global
> mappings, while PSCV=1 excludes them. This appears to narrow the
> guest's requested invalidation scope and could leave stale global
> translations cached.
> 
> One possible approach might be to use the PSCID from the guest-provided
> DC.ta when allocating the nested domain, and preserve the guest's PSCID
> and PSCV settings during invalidation while substituting the host GSCID.
> I'm not sure whether additional considerations are needed for PSCID
> reuse or domain lifetime, though.

If the guest is issuing invalidations you must always preserve the
guests "ASID" or whatever your HW calls it. It can be virtualized and
mapped from a guest view to physical, but it must be preserved and
physical must be 1:1 with virtual.

Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
