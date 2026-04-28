Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65410FF885D
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 13:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lEH/o/o+pn/IiLQRMrGsJtS2aZkRM5ULXucsYMBH87s=; b=JF3FwbtOfKT8H/
	BGtoTvkkH7sWmAG6tQASr3we4BA1U8BJvSLnQCGd4qyIWOrFj7H6HMKXjGLetEB8QyhCZHKK23gCj
	nGZIoJtLZmOONUaCQKT48FpgkUL6+yFPZkX/Clndtlo26rHrbM4pex62uyi+8Abgtcqwix+KqRlOh
	2q25P73ytAC2bHHIAFRhwAHsVESiR1q5/I5ihBNTSCGTkKwq7cbpzhPj6MtqgcqERH991sETtHQq6
	de1DZzIGwh58FnPfGreClJFJ5wzm6tOLHvgTT6ZrMb7M0VmSiGcQMX1oM4JRtrTBG6yRpxSuOc2s9
	vyG//Z6VJBfmVgEW4dPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHieh-00000001ZEM-0h3d;
	Tue, 28 Apr 2026 13:39:15 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiee-00000001ZCt-1L7R
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 13:39:13 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-8ee62a19730so703280285a.3
        for <kvm-riscv@lists.infradead.org>; Tue, 28 Apr 2026 06:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777383551; x=1777988351; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SXKtcLwqLjfsawGA5AC8W37mySu8/8Ho5thgPASoghk=;
        b=A9RydTXIDc6noSH8LQz5CE5iun1D1m4m/W9oJyHuoV5X9Y/KsMIRYQWDaOo/tTwOLr
         ZkPD8Ufe9Cj0rQk+UocXRSICKUQUt7TOFUYrso4qMpQPn4HQHQb9HxDGK03jv+qxOj7X
         UUOK7ClDkottfJIzFUPE9/P+C9p8/qt14aZkm/dTTHv6lr7taBDpMTzob+MrBt0p1bFZ
         7pg9ongrzeL3gg53uo7kOOkzqk/RwyAoQQsoKTyRC1HxeRYIlr1lz/fnnf5cFha6DLTJ
         sz/WJ5O/NLk76ndhmHbJdY8QEV5bd9Sta5jeQJSqsxPuewQhvhs6u/Jn+dHyGzkvLLro
         zj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383551; x=1777988351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXKtcLwqLjfsawGA5AC8W37mySu8/8Ho5thgPASoghk=;
        b=Q6Yi3w4wmFhfrG2DQX1PX9UmmnpRzy5o4uEoT6wumXTh51HFQQR3xnXTz4m2eh+KqC
         WWlq6eKPcTKm51pNAbDsy43FUv+SlOeqBOrlAF0D7tZWtZbUIIKAv7/plyVOlSgApG2U
         P1f1jSfEr2y5vywXraORhdmajKrxkuhGcoctf0juxxihlWSbcNWE2CjXCn2JJdCBAXdg
         iZ9yykaBdC/DCQhleAGKHwcHh8j30HKmF2Wz1N4gs8mooh+vkPbq1af5FnCavejggArL
         nWbubb25waix6XeCtvy8YOg3uY6vF+eBkDIwL+rar7w7Goljk7vJGewqaht6gCCfaQ3d
         0vSg==
X-Forwarded-Encrypted: i=1; AFNElJ/YP+sZVVcIEc01lsE2R5CBymIsK77fsmqpouabcoDD0pmW31vdt575AD8aA1KAOaMxkmhtgJ9JUYg=@lists.infradead.org
X-Gm-Message-State: AOJu0YznSKM7h622Zl2PfWO3WN9FJg9XeFO+wDv8OrZGN5a6CdfvQrID
	M9mhCTDw2kgHHYJdBrrjRwqs31jBQaxzFGNwmysLCua3je+M/qPsIxJSFMILVgot/M0=
X-Gm-Gg: AeBDievwXfgL0p+f24RhSTaJhLtFoJ1GqfoqIC71+wtU9qASuIu427R1kjuHfsm3XDp
	aybYZKPciZuBh/xdDRt/2MPHlMadbHxW3gezEjnZ4bihp3BEio/sXHzyjZgY9I9o7LMmEpMxT0L
	AI0hmVFsB1f1Xo6+eD8pdKRNArxGsz5fxT9+OtgJnPFTnlsjhW67Cp16atttbHp104p7QID0hE/
	NEgTzoSTm4dmo4oEudMo9PWOfhjQ06YG6tbBjHfC2Hyu2ZDTOaNLTcKlOipGNfo8IIMCHh8SVrQ
	TwmN0NQArj7S6tD1DX9joupqdjLY+DM8dcYQ2/aRLTADTbgjvtNUnMPiDJBAdy5HTaRUKNjs6Cm
	spR13LkOtf3TsrJrgmU2SZ44ToENu0Oq29V6ST6bn8bJX6p9ru6mppFxM1RyHciU/8YhjoWUZK1
	XoCj/ih77LKqzCE/6br8COF1Aiar30myLzUtCX4fgPBD0Q3yopBdYIjBkHOrfUxBMl5O8J3FaMg
	zDXE+PanGQdrLov
X-Received: by 2002:a05:620a:28c9:b0:8ef:12de:1337 with SMTP id af79cd13be357-8f7d9200e1bmr385079485a.38.1777383550897;
        Tue, 28 Apr 2026 06:39:10 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c48c71fesm230888585a.5.2026.04.28.06.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:39:10 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wHieb-0000000AjKg-3JBz;
	Tue, 28 Apr 2026 10:39:09 -0300
Date: Tue, 28 Apr 2026 10:39:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	tjeznach@rivosinc.com, kevin.tian@intel.com,
	baolu.lu@linux.intel.com, vasant.hegde@amd.com, anup@brainfault.org,
	atish.patra@linux.dev, skhawaja@google.com, guoren@kernel.org,
	kvm@vger.kernel.org, iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 10/11] iommupt: Add RISC-V dirty tracking PTE ops
Message-ID: <20260428133909.GH849557@ziepe.ca>
References: <20260428131359.34872-1-fangyu.yu@linux.alibaba.com>
 <20260428131359.34872-11-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260428131359.34872-11-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_063912_352185_0D74986B 
X-CRM114-Status: GOOD (  10.04  )
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

On Tue, Apr 28, 2026 at 09:13:58PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> Implement the three dirty-tracking hooks required by the generic page
> table framework for the RISC-V format:
> 
>   pt_entry_is_write_dirty():
>     Check the D bit (bit 7) in the PTE.
> 
>   pt_entry_make_write_clean():
>     Clear the D bit across the full contiguous range.
> 
>   pt_entry_make_write_dirty():
>     Atomically set D via try_cmpxchg64() on a single PTE.
> 
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  drivers/iommu/generic_pt/fmt/riscv.h | 43 ++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)

This patch should probably go earlier in your series, before adding
the alloc_paging flags at least.

Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
