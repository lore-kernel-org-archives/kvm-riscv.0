Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E171DE67A68
	for <kvm-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 04:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YFtu3MLG2T4kOgnBj7xFOc3XlWneOWEQupoxBLmcCWQ=; b=BHNdhnD8ZE2pBv
	AaWBsk9JfS8eXZCgRI5bLNoxgR9HCIvbZD34Qpi+0pE9sMmcKiZggyiSWE1pc4qnp8cVjlRM76wEO
	4CFtSexxz4KoUcSd9BA1MnkNnqL/6ta6PPvT2zS8GTJC0YdypHfz7Bpzjvoj+U+mbD8WquCHxoTuw
	26NUZhp3vIKjybpvldP6kB2pu118bADFdW1sduJQczQhKt6BAlDz4E0lS2WxWmFmDa8v8oe7XUlTf
	C5Nh26YpqELBuYjRYqQXeF0XAtmRvtsKfblXjnzPms1uUKhQDEhu6xTpnydWJCOAGIJVGXV3Ky+Zt
	Y8FFDA+XLkW8HweT1Wpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxHci-0000000EVi1-0JOH;
	Tue, 03 Mar 2026 04:44:44 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxHcf-0000000EVgp-3GiF
	for kvm-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 04:44:43 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a871daa98fso40278575ad.1
        for <kvm-riscv@lists.infradead.org>; Mon, 02 Mar 2026 20:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772513080; x=1773117880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LWqfPnYJzFeuZzCdQbWgAY+H5By2f/u+Z1YMUOO9a4=;
        b=gflIhVXrv8Cpwnc3Xzm1idBwiEhVd+cJraPuJ5YWI4fpFVO4S+krrzHgqZY+raH+xk
         nItlvelk7Eb2JtQAwKAJol1Ko+vyM+yn0ePfhl0YsZinOXtQ5QbVh8MFA8YkS0JCWotl
         c3KEM7R3Y4fMc6YnpqTRw1wNNw+EQeuDrSFt4Ia1ooge96On7kfhu5rskDs3tPBtMpBF
         lzYgkS7bh2oC+PIm3FQQ54iDK9T9tG0FwU+iUxOv4QUKYSvus6xghJ20lIbdBZHQG05M
         /1u629ZDomOu2Iu73coMc+OnJbMHetHqElhHLWvmyAD2zPx3ttUgD+cfzUfd8jtOHKPP
         NP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772513080; x=1773117880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6LWqfPnYJzFeuZzCdQbWgAY+H5By2f/u+Z1YMUOO9a4=;
        b=ato/hQKEAZN1X9CbBFNqkdT2dMFSu8Mwqocl4axnOflmxN8I5UE90zPKUurA/1swkS
         nvPVGtbR/TXlZw+klZdJ69Q58KPiQgSlIiYRdmRoRigJrMkj0sUIJMe5lJ0pQC506XRX
         n2Jj+BX2PN01dRW5MOE2oF2aB6ut3HJFvJde9wylayzf38BAuGhV/AdP7Z8+odD2jRFk
         ot7i4rHC4cl4h0EJGX4CjiDx67yL39ahZX0vMwVeQuupxmWsmiZork9AcAZesOL9ezno
         ZHPgGha23sVsWP/ZaVXlMkO6IFRxDzFms9lLZdH/zB7qbxEvdiCs4OnS7YO+oyhOEdNZ
         HGzA==
X-Forwarded-Encrypted: i=1; AJvYcCXD3uInWuDNHikzaQCD12Wd92kBeWpfxrtT2WOwhF1plIXwyLWyRacQ3jWAv+EA+NaKXPNgHAkJ/kI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxDkAJYSciZ47ekwOQ5vKiQbrYAAS2Bgx+XdoMVNdDC1kLal7Z3
	Br7dqPwhp9qWilJS3g09TBv/TRQWBI3jvfeeg79F2EohyFTltJQbwA2m
X-Gm-Gg: ATEYQzxUhpeaWM6TRT2s3hXibyWrj02ctUn8gomC4Rf3HBB0Q0jAnApxSEoins0H8N5
	MVtOE6mzUHbSgfj8ZCvGRlT01ou1olxycPL2Gwe8FLbvbMIvjQH71dZ0wY4EYKQGGpYwDRbg7Zx
	puTcgZhgZglertDQLXMF0fZu7iFq7ivn4q91RojHjN10zhak5Jw/DCoOZHyBI9zuo15YVN+3vN8
	n4hBrlB/q+0mVmC/C5TvQwqunUlopcmgm2XDUyKjGhU5T02PVK2LhcUjke7AlXwsy2N7yuaJz3/
	tbV9s8GoIhVr8BazDyaMKOqvAMrx3E109AVKtDF63I+numyBrHtJ3wJolhbPG5e5CQzqvT/XscY
	REmbhGnI+0Lfa0cq0tkuA3tPtUjl77XXfFTNzmczIOvfvg8KI51ITDW6vxQ9wgWRVqQBhVFWqhu
	JsH7r5j4QuGL4Kdox3MdKvBg==
X-Received: by 2002:a17:902:ce06:b0:2ae:47c0:19ce with SMTP id d9443c01a7336-2ae47c01d10mr72462485ad.55.1772513080332;
        Mon, 02 Mar 2026 20:44:40 -0800 (PST)
Received: from ubuntu.. ([89.222.116.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4f945985sm74775645ad.71.2026.03.02.20.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 20:44:39 -0800 (PST)
From: "jk.hong" <ryan.jk.hong@gmail.com>
To: xujiakai2025@iscas.ac.cn
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	Ryan JK Hong <ryan.jk.hong@gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Fix use-after-free in kvm_riscv_aia_aplic_has_attr()
Date: Tue,  3 Mar 2026 12:44:30 +0800
Message-ID: <20260303044432.699084-1-ryan.jk.hong@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260302085312.1649738-1-xujiakai2025@iscas.ac.cn>
References: <20260302085312.1649738-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_204441_864270_35EE2F0D 
X-CRM114-Status: GOOD (  20.27  )
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

From: Ryan JK Hong <ryan.jk.hong@gmail.com>

> Fuzzer reports a KASAN use-after-free bug triggered by a race
> between KVM_HAS_DEVICE_ATTR and KVM_SET_DEVICE_ATTR ioctls on the AIA
> device. The root cause is that aia_has_attr() invokes
> kvm_riscv_aia_aplic_has_attr() without holding dev->kvm->lock, while
> a concurrent aia_set_attr() may call aia_init() under that lock. When
> aia_init() fails after kvm_riscv_aia_aplic_init() has succeeded, it
> calls kvm_riscv_aia_aplic_cleanup() in its fail_cleanup_imsics path,
> which frees both aplic_state and aplic_state->irqs. The concurrent
> has_attr path can then dereference the freed aplic->irqs in
> aplic_read_pending():
> 	irqd = &aplic->irqs[irq];   /* UAF here */
> 
> KASAN report:
>   BUG: KASAN: slab-use-after-free in aplic_read_pending
>               arch/riscv/kvm/aia_aplic.c:119 [inline]
>   BUG: KASAN: slab-use-after-free in aplic_read_pending_word
>               arch/riscv/kvm/aia_aplic.c:351 [inline]
>   BUG: KASAN: slab-use-after-free in aplic_mmio_read_offset
>               arch/riscv/kvm/aia_aplic.c:406
>   Read of size 8 at addr ff600000ba965d58 by task 9498
>   Call Trace:
>    aplic_read_pending arch/riscv/kvm/aia_aplic.c:119 [inline]
>    aplic_read_pending_word arch/riscv/kvm/aia_aplic.c:351 [inline]
>    aplic_mmio_read_offset arch/riscv/kvm/aia_aplic.c:406
>    kvm_riscv_aia_aplic_has_attr arch/riscv/kvm/aia_aplic.c:566
>    aia_has_attr arch/riscv/kvm/aia_device.c:469
>   allocated by task 9473:
>    kvm_riscv_aia_aplic_init arch/riscv/kvm/aia_aplic.c:583
>    aia_init arch/riscv/kvm/aia_device.c:248 [inline]
>    aia_set_attr arch/riscv/kvm/aia_device.c:334
>   freed by task 9473:
>    kvm_riscv_aia_aplic_cleanup arch/riscv/kvm/aia_aplic.c:644
>    aia_init arch/riscv/kvm/aia_device.c:292 [inline]
>    aia_set_attr arch/riscv/kvm/aia_device.c:334
> 
> Fix this race by acquiring dev->kvm->lock in aia_has_attr() before
> calling kvm_riscv_aia_aplic_has_attr(), consistent with the locking
> pattern used in aia_get_attr() and aia_set_attr().
> 
> Fixes: 289a007b98b06d ("RISC-V: KVM: Expose APLIC registers as attributes of AIA irqchip")
> Signed-off-by: Jiakai Xu<jiakaiPeanut@gmail.com>
> Signed-off-by: Jiakai Xu<xujiakai2025@iscas.ac.cn>
> ---
> V2 -> V3:
> - Fixed incorrect locking pattern in aia_has_attr(): avoid returning
>    while holding dev->kvm->lock by storing the return value in a local
>    variable, unlocking, and then returning.
> V1 -> V2:
> - Fixed the race by adding locking in aia_has_attr() instead of
>    introducing a new validation function, as suggested by Anup Patel.
> ---
>   arch/riscv/kvm/aia_device.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
> index b195a93add1ce..0722cbaed5ec9 100644
> --- a/arch/riscv/kvm/aia_device.c
> +++ b/arch/riscv/kvm/aia_device.c
> @@ -437,7 +437,7 @@ static int aia_get_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
>   
>   static int aia_has_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
>   {
> -	int nr_vcpus;
> +	int nr_vcpus, r = -ENXIO;
>   
>   	switch (attr->group) {
>   	case KVM_DEV_RISCV_AIA_GRP_CONFIG:
> @@ -466,12 +466,15 @@ static int aia_has_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
>   		}
>   		break;
>   	case KVM_DEV_RISCV_AIA_GRP_APLIC:
> -		return kvm_riscv_aia_aplic_has_attr(dev->kvm, attr->attr);
> +		mutex_lock(&dev->kvm->lock);
> +		r = kvm_riscv_aia_aplic_has_attr(dev->kvm, attr->attr);
> +		mutex_unlock(&dev->kvm->lock);
> +		return r;
>   	case KVM_DEV_RISCV_AIA_GRP_IMSIC:
>   		return kvm_riscv_aia_imsic_has_attr(dev->kvm, attr->attr);
>   	}
>   
> -	return -ENXIO;
> +	return r;
>   }
>   
>   struct kvm_device_ops kvm_riscv_aia_device_ops = {

This case branch has the same problem.
	case KVM_DEV_RISCV_AIA_GRP_IMSIC:
		mutex_lock(&dev->kvm->lock);
		ret = kvm_riscv_aia_imsic_has_attr(dev->kvm, attr->attr);
		mutex_unlock(&dev->kvm->lock);
		return ret;
	}


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
