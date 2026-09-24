Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2637DC98321
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 18:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xbJfmU3jsYKJpvrtEbFxRW5L6N+fRVt+wbcQCR+hVa4=; b=MMhQd9af8T7qR9
	0pHrBP+501hwJ7noohQONggkqH7N5etAbZ4GFYU8VdxFR4rOodeSeQRw45SQVGpLdHWK5L5xH6WFY
	0Wyuy9Lrd3H0dQ37K4EoP1Tjpaxyye34lvM+k9iQXBlbZ15f/fTLfGzpG0jziM6zYbG/VVaIN69Th
	QgdEBal/nF+2HwLLWCNBAO7Vg5rgN+k+2w9EKrKqv1Tnqw2x5c9UeUBH+ki8VdUdXH/vnNeCv1Sdh
	uCnOEK1mj8s0yVU2m1EpgQtLt4NTZqk0HRH5KMQp5hFhektd9m5fkhehtdTpBGImtiBKmFFiBzYpE
	xArUngYcsENLxSbHv5zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nk9-0000000BqyQ-2ju2;
	Thu, 24 Sep 2026 18:00:25 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nk7-0000000BqxF-1MxF
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 18:00:25 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-52fa9c055b5so11364451cf.1
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Sep 2026 11:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790272822; x=1790877622; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yIrEACM/1hk8RvSSdnwytl7iIy1+VcppA4PP9Tt2BDk=;
        b=EcdN7Q3rP776qc8wZL2iTjjhL/qGk5NmmrMk87vwYPWp9hV0fqAmtAtWeTgTlln7wP
         EDp+TnSLgrKe1WGphYhPrl8Ak3VLf7nMpVYutpgDAjGKXB0S3Suho9UmkOT9URJv2m8D
         mI8U+awCZqV4q9n1zGUxP4/q7mCVbnBvKJYjYWSWT7Q4+Rw9yS/p5hYYPvhaJLU0SCz4
         m4YaZdVoyc2iV7S+ekT6dcpjBydEhS7bRsvw4QaNwJEb62ZDTXpzHnbX7jovxn4ekykq
         aFdhuRsGj3GqVlY37/ID5IE7etNUCNR2VlmMwoR7AVWoFv0zAxCdCzpBMQwXlm3R/qpW
         y+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790272822; x=1790877622;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yIrEACM/1hk8RvSSdnwytl7iIy1+VcppA4PP9Tt2BDk=;
        b=br4EW4bzLLmJZHB3xP/hLlky+e6FH/ru+nXBBMRJjVWxW3CJVNaTm6jT0PxlCw0pmS
         3AUC6wOv9T/pgdiIwzUolxFoIp3yzaKUNWAg+KOGJs2wDGhRNAUwLf+MBymX7ZHSqyMe
         4JUKi7cNV4lm+BBlNAuUqTdCgT3DdU3ddXdQ6RBK43RGAjvJ8pNOY/Fu2doAOINfDDfT
         SgOSUKNBTby1wlWZsYXi/tAcTleSBkv4/XYFGjPrdkaN9etc0DRe1U3DFYe8WNcmDcbJ
         MM7XInpJTnU9zLsavvqP5Xbt+oRkznQrfc6y235pjVATLpTCYAlaeBmXlbX1Ase8U6Ff
         6/jQ==
X-Forwarded-Encrypted: i=1; AKwUvByCEE8bKeJ/t/kv0HtQ76elJaV7OY/SNMOlryweO2ixrhD4bo4ZikPeUvxcx+003WymF3wtw8DtrKc=@lists.infradead.org
X-Gm-Message-State: AFuF++kO3qMpH0KKOEBk2tCUep9PagVtL3QYsHDVnQrd4LCazpdHXKwU
	1uS+K8t8dJIoyrsqXzQeUUKQbYLWWgngUM+4DjgQ4HyXEJUiBlhMm6KY0tZTeapI1Y8=
X-Gm-Gg: AYBFou3c90uKD6QAsVAEPXoiZxjbppX21gfgYlURG4nfyAklaI7VA4ZOip/BjhhcWO4
	ApXGm9Hv804p3CtTN9weWfkRUnwjc8Z+HSA17vcRqjUwxDkoSzfHsFcwGLP2hmj/boElxQtmxrN
	Su+WxQkOjcWq8OLWzc4Y1nFd7CDuUHQ9UFXA/4FQCqwmtFNVV5fyqHqu1Kb7W+bEvSXSHrQReBp
	bpRbyc1euJrjG4qc5HTyyoHoRQoT2bRrHD20CKPtCplA8i9CDH2DAdWi5fkFhFMTJBAYSCKisOs
	FEJPUgaJVfI/DSSQ73JRwErUgRA1jV725ADGGRl56DGzabf0eIMkK218QnExyzbqwnxbZho7gn6
	xmOYYQNFVtl6wBalXD0IV5ZrNW+gsbtyxpxarBgqmqkEdspowFFRa/6cltklThwm6VGaAQStfdE
	UvyVAl0lBFCEIxUT0Y8M0xwKz+kPDKWXRWWKvKcX3hWz2TCQlH2VDqLpQD09HYsajvZnYXUZLc8
	W8x4sI9dJMdqS/DlbrXJa8SQLk2Rcav/uo/Z8/hJOM4qirzgt/7xjA=
X-Received: by 2002:ac8:5a46:0:b0:530:e682:87c with SMTP id d75a77b69052e-5330b6df434mr78501cf.33.1790272821894;
        Thu, 24 Sep 2026 11:00:21 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb38d347sm47450101cf.25.2026.09.24.11.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 11:00:21 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:00:18 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, 
	bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 05/40] mm/vma: ensure mmap_prepare doesn't set actions
 on a mergeable vma
Message-ID: <arVkwC_wNoTLjRYf@gourry-fedora-PF4VCD3F>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-5-4583d8a23bca@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-5-4583d8a23bca@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_110023_375458_6D8BA8F9 
X-CRM114-Status: GOOD (  20.43  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 17, 2026 at 05:22:14PM +0100, Lorenzo Stoakes (ARM) wrote:
> When a user requests an mmap_action be performed in mmap_prepare, this
> involves populating the VMA range with data.
> 
> However, if the VMA is mergeable, it might then mistakenly be merged with
> another VMA without having populated the range.
> 
> Every mmap action currently available sets VMA flags such that the VMA
> cannot be merged.
> 
> However, to ensure that no future mmap action falls foul of this, assert
> that this is the case upon mmap_prepare validation.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  mm/vma.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/mm/vma.c b/mm/vma.c
> index d6ed10cefc8f..62f2ce1ad5a1 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -2809,6 +2809,15 @@ static int mmap_validate(unsigned long prev_start, unsigned long prev_end,
>  int mmap_prepare_validate(const struct vm_area_desc *prev_desc,
>  			  const struct vm_area_desc *desc)
>  {
> +	/*
> +	 * It is not valid to execute mmap actions for VMAs which can be merged,
> +	 * as any such merge would leave portions of the mapping incorrectly
> +	 * unmapped.
> +	 */
> +	if (vma_flags_can_merge(&desc->vma_flags) &&
> +	    WARN_ON_ONCE(desc->action.type != MMAP_NOTHING))
> +		return -EINVAL;
> +

If you wanted to make this unit-testable, you could pull it out into a
separate function:

static bool mmap_action_is_valid(const struct vm_area_desc *desc)
{
	return desc->action.type == MMAP_NOTHING ||
		!vma_flags_can_merge(&desc->vma_flags);
}

then write:

if (WARN_ON_ONCE(!mmap_action_is_valid(desc)))
	return -EINVAL;

And you can write a unit test directly against mmap_action_is_valid

otherwise

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
