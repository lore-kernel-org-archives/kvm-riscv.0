Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B611AC0218D
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jan 2025 17:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VZooZRwi+jAISMzCzJHyekKAdVaKcTxstQHdQxUUnYs=; b=WuLiOneV5CniWG
	cFGbnSRaMBjvc2bvxq7NojjEsj7nq1axYDXGCloUmXPf7A/7y55TJ6XJAUQ0rNNbG9T49kZKMFXpa
	NAVyDOBkpTP7nUny0ml8B7Ge72bPf1TjnV24w9JcMfzOuvPK8vx5omj97pxrErjnrB24d1n5HG+Z3
	AlkR7qi4RbHX0AshjU8MlaQ0/L4ebNnKt1+YJ2l8c6FcLQkCaNLr7OAvqFBExRx8pu3XcW1WztF0p
	Hrnx3alyKntLyP+PU+KOG84fnX446ktw2xudE3aBMJT3A7b1mjkdnwfDzoddhQYii219VUX8eByEA
	OYpFxNLYum/nidziTUJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBdf-00000007Stm-1th6;
	Wed, 29 Jan 2025 17:14:07 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBdd-00000007StS-2dHi
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jan 2025 17:14:06 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so3987458f8f.1
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jan 2025 09:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738170843; x=1738775643; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7HovKX7OD4QJUBcM+Cct1SkTLrvCWho5txS9FFYdyNU=;
        b=ddv4w8t+dbLYAKa1kqt3+OAXoWHjtT7WVnsE1Tm7MOdMjvC9tqR8RoMwHh0El0dne8
         PhbKNwVZ2d1cmDhWcpfZqBc/ULL/2Ctoc42wspkmJthjpPAN6Xz0mvm15wLj5JePGWAp
         mdgmYj6MTweco7sXvNMG6KT53yo92P/jiY1h1bo3hQ89Z0tfWBpsgOP4uaYH1KfjN2Uz
         3AkciOKcIrLF1WOH1iDLkiGRO41EL/lwDZ3aSVL23LqxejH+rmQhbOHtWrAZ9QvTO+ko
         P4sybwaCzpEQNKLorarGN2ANCY28NwjYXHljhn/3Fx1G7/By06ZmxzCNTDC+slAQk/0l
         Xi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738170843; x=1738775643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HovKX7OD4QJUBcM+Cct1SkTLrvCWho5txS9FFYdyNU=;
        b=JN5q/K+/R3i6MoLLYoPyU4K0nL16VXi9vQpZTNtlcliysm4qTnfm7lBgdl5KpxbNZj
         lZWP/jbP62vdvMLXCPc0FDmHSXrv1Xe0bjwE+OTVAQ3ec5D1dsuEUajrOBIIZl2i3ree
         6PZ0TqdECu30gfV2/S2PMzyRAEesorvO3ezE+o1oWyxz2Zd86upyy1077Fw5OQ7nBx2T
         iCvuhF5aXPR755cIzhnlnPD/0hLdPQ7VqO5sFXGCPl15vgt75FLDR5i53AdkB1KxgJsZ
         U4puFG0ACkoME/zvz5GQOmyfeZTRZOYdA5wek+AbOAWpcaDERBLrBe7x79VZQCBqLI/j
         /pgQ==
X-Gm-Message-State: AOJu0YyEP4PFJROVtfn8efrJ/AaYlfuJi/7B4TOjZ7RiN/WLe/hXKpzb
	D50qK7BinqntYDwR6OaPYATb6WrqGCn21RoOdTQhxw2Y+orFG6ls0vheTNvGHHM=
X-Gm-Gg: ASbGnct3MXEnAcYuRxqz0DoUwRXQIL7mO0+22DVCL0mLmd8d3YczXa99XKx4hdgL72x
	4Jnvf+VJ8LAu22A9ufdf7OkfSbak710q6v9L7ZgHhLsAUpPVOXc/xX4OzJvssktkYg1XQJT/DLU
	LqQ2HYpu4YgVDdpgk/MuJUCpb1/8DFeH8P+X7ws+VpBA2hii+GCYI3KUWoH7Gl6hiSam3wjMT7o
	WTmYP3BRjKPEIEYZBIjNTg7HD5gdGDb2FgkzjWm9FZqhYcyCxB23ZWzpWy7LboQmX1GMck1A0TC
	2OM=
X-Google-Smtp-Source: AGHT+IEowlFmWEcUGw8iQkYvRie31bVcXM00vYLfJF59FCNsQKdfJY5sTyH6Je4dYk8joVH6U3kyjw==
X-Received: by 2002:a5d:6d0c:0:b0:38a:888c:676f with SMTP id ffacd0b85a97d-38c5194a531mr3352887f8f.15.1738170843288;
        Wed, 29 Jan 2025 09:14:03 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::9a7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c3bacsm17348009f8f.83.2025.01.29.09.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 09:14:02 -0800 (PST)
Date: Wed, 29 Jan 2025 18:14:02 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm-riscv@lists.infradead.org
Subject: Re: [kvm-unit-tests PATCH] riscv: efi: Bump number of memregions
Message-ID: <20250129-a3d20dcf21f54ad5650d284c@orel>
References: <20250129165131.163433-2-andrew.jones@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250129165131.163433-2-andrew.jones@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_091405_667285_7402058D 
X-CRM114-Status: GOOD (  20.34  )
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

On Wed, Jan 29, 2025 at 05:51:32PM +0100, Andrew Jones wrote:
> There may be a bunch of EFI memory regions in the EFI memory map,
> which we convert to k-u-t memregions. Bump the number we allow to
> ensure we don't hit the assert in memregions_add().
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
> 
> I noticed that the gitlab CI started failing the riscv EFI tests. It
> looks like the edk2 used by CI has been updated to a version later than
> what I was using locally and the newer one has several more memory
> regions.
> 
>  lib/riscv/setup.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/lib/riscv/setup.c b/lib/riscv/setup.c
> index 211945448b0f..a30aa0c4cb80 100644
> --- a/lib/riscv/setup.c
> +++ b/lib/riscv/setup.c
> @@ -31,7 +31,11 @@
>  #endif
>  
>  #define MAX_DT_MEM_REGIONS	16
> +#ifdef CONFIG_EFI
> +#define NR_MEM_REGIONS		(MAX_DT_MEM_REGIONS + 128)
> +#else
>  #define NR_MEM_REGIONS		(MAX_DT_MEM_REGIONS + 16)
> +#endif
>  
>  extern unsigned long _etext;
>  
> -- 
> 2.48.1
>

Merged.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
