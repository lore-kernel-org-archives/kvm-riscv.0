Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16B1F3ED43
	for <kvm-riscv@archiver.kernel.org>; Sat, 11 Apr 2026 12:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3h1v4G7K5btev+tPBdWXHqAyUJzRww6LAYbBMIv2qH4=; b=Pose2LLpkNWjLd
	ljk6rfvsd2h0fdHVXMJU8r+UIfLgpvUrK9vAuBzy21zD14QzXCrXeFbZ/EkxQkRsKYHQ5jUDi7ZZZ
	CR+dGjK+YcMbtJO5ASKHgdwFyVam5J5Vi2X/Twg3P/BSNzN81WfRFnlaaBs9Xg3rV0GkQY5CzEZw9
	KrjQIk6r9IWHLtcUP5NZOxuUosmP1vvafe6Y0NIgofwiKci++DA0b1YIa1vt0g3vu4Sctxl0l+N2p
	ebv65TsMX3DNAKAzu+xGaV4RY4cuVWubcqYMV2vk6HBemeZlPYNF40baYAoUG0A+hhWo+hkYfczhy
	DC/2ckgNHFE0yDC1jtAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBXkd-0000000DRJZ-2Xnz;
	Sat, 11 Apr 2026 12:47:51 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBXkb-0000000DRIV-1g8T
	for kvm-riscv@lists.infradead.org;
	Sat, 11 Apr 2026 12:47:50 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-506251815a3so24397161cf.0
        for <kvm-riscv@lists.infradead.org>; Sat, 11 Apr 2026 05:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1775911668; x=1776516468; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2V2rJGuz1N7Jn8jex+6xRO5eeCVkWdXEYVceyBVA2GA=;
        b=TL14iAw9sIpF/rKOtyJ283ieGuht9GIz6D5MqwYn93zpDDGyMFcX5FxK/2ef/t7U7f
         9bZ/ivkwxtDspxv4OO17NpdbkP8AdQiOLd1vd/YNl3wkRkuMnmAYGQAxgIo2jqaeoXwv
         evfxveH7PBqio/YKpMl4sQdf7nG1+DyNgTjnbJ2fzfjeFOKtMmX172/biC9xAoeVyuGI
         I7sH7pkUOOoDX1j0QhLZOWjnZJpBcx2cn/AMCpMrg3uj/rlLvXux0opLvGQNmdTqE1pd
         ne9bMxKUjchG8YzSgQ5q+oz2slWfwKJ2Y4H5ECq1gSLc7zxLfGZFDtbrFsBzarXe01x+
         kRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775911668; x=1776516468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2V2rJGuz1N7Jn8jex+6xRO5eeCVkWdXEYVceyBVA2GA=;
        b=GOvUaltGl3i63paQ3JYqcZ5hlGisx3oLO3NBVKkrVr85WevS0rwzvhP7OiPS0gLFQS
         R9GiSsnJ3A4xVfM9Pjlz8LOTolbGmYMlk6UE7Tc/qDae+0GDEWRO2Q0CebrFiidHd+5v
         cq94pgBBFwH8AysFE8UTP3mnCYC1mY6UNhITa9O8EVYb25MsLbWXEBET+KD8/48e9jqQ
         vJOnFulp0kY0NGGAO3mxB/wFnTyOrbv0XjNAIo+xVKTEf8gtaaNFRzMyYuI6tFgS/psr
         Qs6p9MaPAEZJ0TonK2MFtoZ5zC1yTc4ZPO2Y7haUFCpbDpGbe/prWtl/skoKGaQ+Vp1X
         xDyg==
X-Forwarded-Encrypted: i=1; AJvYcCWNshU+9ry9xKDMAyqpWHYlnNHr4XRjD4AfYKgCAhU71gWygAnTXZRsfNjc6ikJxbbb5lovV5JSGng=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbVzYXjnvFWy5xrVWMkV2pBk1jAR2QAwjxxlWPYhMaUk1ggt15
	ySH/KxS8dbNdIAdKRNTJrx3UPlj7j7JJPmQFcj+tZFhnYzYCUxMXyD5deeONvZ6CETw=
X-Gm-Gg: AeBDiesNjtcOSqq07+vO4ZdxrSyMSKmhlUgeyRuYX2HuqP+ZrPpr6zOsb6mvGU6bXGI
	UHBhsSc547JxE4bir4vDAFJU+wGYvoOUbC8tK6ix2m032b6PJi+/tOxySxiWiY4INQ6YiCjlszL
	We8Y3oEDwhd3LqeMVIqCGfli+Q/OApIatvpIlX6SiRP33BckwjUAPJwpBVEfQtNjYpw0w8NmbC8
	XKeGHs9rZja2Mf6c6UooYqB2lmc+13SsjVp7IzlUj3DiWF6/TOwuNutaRCg5+5vo5j58+wQyx4t
	75QEA2IO0jplctVzDwcsc7Sgez61lDvJbUBG4vm2Ic7VCCjHe4Swh+e9Dkato5BmWfpUjMRaS7p
	jpYFg1PZOWJzF5VUEwCCGG7oDSDN0BAs9knjT2mMH2myuDBCvCSzLsgyPpLa6vEXEKLtQk/0lCF
	2bd8E4/Wuxh4AUQ5rmn6Ip6bXDJhViEYOFZUkn8E2XgzlABnkCILf8iZl6KvjZuVGVOjKVp+SJ6
	avoww==
X-Received: by 2002:ac8:590a:0:b0:509:3cd:b22f with SMTP id d75a77b69052e-50dd5af20e4mr102128571cf.23.1775911668183;
        Sat, 11 Apr 2026 05:47:48 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50dd5651482sm43650061cf.31.2026.04.11.05.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:47:47 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wBXkY-00000002Xgq-4AP9;
	Sat, 11 Apr 2026 09:47:47 -0300
Date: Sat, 11 Apr 2026 09:47:46 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	tjeznach@rivosinc.com, kevin.tian@intel.com,
	baolu.lu@linux.intel.com, vasant.hegde@amd.com, guoren@kernel.org,
	iommu@lists.linux.dev, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] iommupt: Encode IOMMU_MMIO/IOMMU_CACHE via RISC-V
 Svpbmt bits
Message-ID: <20260411124746.GF3694781@ziepe.ca>
References: <20260411022223.91029-1-fangyu.yu@linux.alibaba.com>
 <20260411022223.91029-3-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260411022223.91029-3-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_054749_442907_20D561B8 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

On Sat, Apr 11, 2026 at 10:22:23AM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> When the RISC-V IOMMU page table format support Svpbmt, PBMT provides
> a way to tag mappings with page-based memory types. Encode memory type
> via PBMT in RISC-V IOMMU PTEs:
> 
>   - IOMMU_MMIO   -> PBMT=IO
>   - !IOMMU_CACHE -> PBMT=NC
>   - otherwise    -> PBMT=Normal (PBMT=0)
> 
> Clear the PBMT field before applying the selected encoding, and only
> touch PBMT when PT_FEAT_RISCV_SVPBMT is advertised.
> 
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  drivers/iommu/generic_pt/fmt/riscv.h | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

This is similar to ARM now with the 3 kinds..

Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
