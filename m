Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A5ACA1005
	for <kvm-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 21:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rx4u6+OPvX4n4rOvCs29ArPlOeWM+YaflH+G9ePm7Eo=; b=mpRFImMiZH0vYY
	GX6kDJhPtfP2SU2fQ++CCGKFXy9ehQf7xRYqQL+eLRzXGTx66Jv59nLRE5iNbxIlqUcLKm5AJ7YP2
	kUkjD1Ba1b6F5U5DwaqN9LSxZY7b2Xyx8bX0UDOvRlkPOC8m79EwrkRpurMxZ3WoUVfdGj4nVbtmK
	EwkGz0D1dDIoLBFES9midRk27fwh+l2MWzRkKupWtzx5zKp3Lm4Lu2P4RC5NYqjNfvjjP4eio1aTs
	yrCTmOpisqn31EUvtqmIiBEGbPIUHYrJSQ8mcq+kpLLPGiZgUNm1w0Ym9hvVXPDMGmuaE0E9dL7af
	gMTyIR6J5rIs5xkg+Kpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYmT-00000002BBf-0KBN;
	Tue, 02 Sep 2025 21:43:09 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utT3M-00000000htm-41lP
	for kvm-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 15:36:14 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3ec3b5f05e8so25008965ab.0
        for <kvm-riscv@lists.infradead.org>; Tue, 02 Sep 2025 08:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1756827371; x=1757432171; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K9s+kfAE8HRXPT1H9Bh1Vhsm3UofgSwfxkPjIm95TJo=;
        b=jVbE/+G1MloheCDWren+9K1ygZ78jSjENz2EnbHUKNsarX+x9tpQFO3BfwBWKHFMx+
         7K2QMT6CAwJ35WBoNvomI0S067O6JyVPCl6CIETClb2D9QvtmkNWGzS7m1HODCZc30FG
         E/pXXXoxYYJBtBxXOL0q8vWTqM5wCjeNhn2VoPOyCPAAit3QEnYctwjnx5lYlhQBZhPA
         4YHUa5ZqY38oLHwyGAuNEQAdlk/w4OzuuVb/aUs9Z3PFPUT/5JLOqDQL4JYY6Try9VCM
         81y+K6fP/YWRBFEHUukfkUjW4Qd3MXCD+hZl2fBC0JRDXejsgPk/2S6gbeSgti2CsdNP
         KEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756827371; x=1757432171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9s+kfAE8HRXPT1H9Bh1Vhsm3UofgSwfxkPjIm95TJo=;
        b=BbAzAS5XuO/vd6DVgOynP1CuxUYJj/giBI/PuWn0J5SiIAh6eYoWchVbueJI/b/bOV
         NszT/aXVLQbS0cf1wB7fVs2zd/9I2TBVemi4Ke0it82Vuym7DCu3m/exfv3chnP+ui1c
         NgU3UIdvXnlUHjDzeyfjLEPSRLjPHQCvJ8jkATyaCAu2h5TEWNelRvtl+weIAjewrjTm
         iJdpS0d8+xx9+12E41PwZXlj7M8d30ouPE+M4P0yppfr0rDDJH2gtglSqU/0ZRfAjK+V
         P3D6pSPSwNpf+Bxu9MfuabgVXDIXhErbsugjsVVRP+nKOe45S9tNbUkKCpUfmoAfGXI8
         BJqg==
X-Forwarded-Encrypted: i=1; AJvYcCVLkrA+r23vQsf2CDMqqDGjG5utPxfn+qlMiDuf6tmCe06yDL7fTxI45bciBWGGIPadU5EyMoJuU8E=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5jGAZbgOvBJAsp7NvqQiBEEE/ygEmKrwVKFrhO+7aw+cOvBDS
	UachVGHJQJnfv35MLsrtZALWBfCWV57Hv2e6zFjws8+NLslJba5ZiFJsHZtCegT/Z2w=
X-Gm-Gg: ASbGncvlOOOZCidDWXFRVAvqezWyuhhDpjwwUIRwdyluoWUvL5gU+ktdklSu0YyNz/9
	QDN3uj7zwli6z/4oENswMInRgFJmo05RNCUAbXiElKGrDUJF4OrTyE8trrFPsWv64lpSlabP1JZ
	WQXX7kovGQjzOMbclZOn2fdpTEpF/8IC6JSqiZKqbPxr4lJoIfdT/NyhkYK/Mly75E8yAFP/wFt
	Dh+Txp24c04cDonDf739xv5lxo3niRyoZsL3+0vB4QfYmMX+RHcdT6B78R4WQd9ERzm7I3Lpp9V
	CdhnJQhacjScSOKTnE1zdq3bQQmFvJdCmoakSNM/ljAD56OPK5kTVGcRnW0lzoV/YOdfTXHx8wQ
	16gxNsVaHlqasGoUfjX5GkgWU
X-Google-Smtp-Source: AGHT+IES7nRiJ9CHZ2JkifKal6ueldn9qBf26MOJ0udQNkIKmIhptPxDm7X55cZKJRjHHzBvZ9JRfA==
X-Received: by 2002:a05:6e02:2302:b0:3f0:62bf:f23 with SMTP id e9e14a558f8ab-3f401aee1b6mr224147135ab.15.1756827371527;
        Tue, 02 Sep 2025 08:36:11 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50d8f35cd88sm3180471173.59.2025.09.02.08.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 08:36:10 -0700 (PDT)
Date: Tue, 2 Sep 2025 10:36:10 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: dayss1224@gmail.com
Cc: pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, 
	atish.patra@linux.dev, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/3] KVM: riscv: selftests: Enable supported test cases
Message-ID: <20250902-9cc0d0dad59ba680062dbbf8@orel>
References: <cover.1756710918.git.dayss1224@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1756710918.git.dayss1224@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_083612_991651_9ECEB0E7 
X-CRM114-Status: GOOD (  16.26  )
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

On Mon, Sep 01, 2025 at 03:35:48PM +0800, dayss1224@gmail.com wrote:
> From: Dong Yang <dayss1224@gmail.com>
> 
> Add supported KVM test cases and fix the compilation dependencies.
> ---
> Changes in v3:
> - Reorder patches to fix build dependencies
> - Sort common supported test cases alphabetically
> - Move ucall_common.h include from common header to specific source files
> 
> Changes in v2:
> - Delete some repeat KVM test cases on riscv
> - Add missing headers to fix the build for new RISC-V KVM selftests
> 
> Dong Yang (1):
>   KVM: riscv: selftests: Add missing headers for new testcases
> 
> Quan Zhou (2):
>   KVM: riscv: selftests: Use the existing RISCV_FENCE macro in
>     `rseq-riscv.h`
>   KVM: riscv: selftests: Add common supported test cases
> 
>  tools/testing/selftests/kvm/Makefile.kvm                    | 6 ++++++
>  tools/testing/selftests/kvm/access_tracking_perf_test.c     | 1 +
>  tools/testing/selftests/kvm/include/riscv/processor.h       | 1 +
>  .../selftests/kvm/memslot_modification_stress_test.c        | 1 +
>  tools/testing/selftests/kvm/memslot_perf_test.c             | 1 +
>  tools/testing/selftests/rseq/rseq-riscv.h                   | 3 +--
>  6 files changed, 11 insertions(+), 2 deletions(-)
> 
> -- 
> 2.34.1

In the future please CC previous reviewers on the entire series
(particularly when they have reviewed the entire previous series).

For the series,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
