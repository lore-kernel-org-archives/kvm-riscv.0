Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF34FC87FCB
	for <kvm-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 16:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SMR8LMyTVu4DlXsUd6F32vdmSmZuS+2kmav8GdihNqA=; b=xPWZ4GUAlmGw1w
	cd/qMY/yc1Y9BNavYDiK/vfaEd1NiUEMLN7Yjr3alCWto614ab3GwAFRG2uUppLPzrAnEiKxVsPTk
	RpY04gs9gmVq9xsuprN1VjiVfufeL3E1m+/aS2vJzwUzVxwKNsbbixZZE7Ww7Zz29YHKPOAsmtxCy
	813O789CgO5tggJMWpIiEdeNb5J0zay7cMtaGEQKxdQ6w2QhNbySV61JFVpoX2TvV1Oi/Y7eOcvAD
	hZLi2tS0EisTmb3f+99zTY1CCLhUjHzGBrmeRpyIGRx9b27EY4H3O1BpqjNSU5YeROgD/rrrDLA4p
	I9+MUkxR3MiwTon6uUUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrwB-0000000BQZ6-2kYz;
	Tue, 12 Aug 2025 16:33:23 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloxq-0000000AuJV-18S7
	for kvm-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 13:22:56 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-459ebc99726so2194285e9.1
        for <kvm-riscv@lists.infradead.org>; Tue, 12 Aug 2025 06:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755004973; x=1755609773; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9B+m7y7gtFTTGyBFc0gL8TaOwTzdqm4Gs9PW5eoUpxg=;
        b=pM/InwQuLLJ8LneB7n0Bv6dJXnDl+e+yuBK1bzqjV4jZSQh+sV28szZ1re9Dpuarrf
         69YDVx1GE8etdpqbwLMnBnnTTt+EaHxL7uwBZgdFEnJBYBBF5bIpm9FQahO+ZsdpEJr6
         JXneh8Ysfgpfo3lQ6TTrb0O4KpxWYdlqYziZCRv1DJcLFgDCFr5M5fEJO0yArgnITp6J
         NG9b8bXH3T4C8kZv3808p9A6NROHQWcvyxqV43s/NINRqeyT63Up/WFO4BBJCL7ehxbH
         I/6V6tfBge9fSUy3SOxdx51nsuku40//jHkL2iJ8tu/hvWizKjT3eb5osq+YK7Hd6K3k
         jezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755004973; x=1755609773;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9B+m7y7gtFTTGyBFc0gL8TaOwTzdqm4Gs9PW5eoUpxg=;
        b=ilmTd4HePVM0mqkJwA/fUg6i8PiJfbUnYHHISaiLIQzDCovg98QsniqoW/TB4L+byU
         FJHm1VTvQwAGbtHg2SJ44YkzdQZND+b7gDo7wdcckymc8dusFC3qeamEf3OVJddnHZtR
         xMXAnwBpJtMUyLYnfMCfMU28ixwlTow5KRd54PMpcVPi7SROsBEc7XahCW8RfMv5p90t
         tYjO4PcfHEcgIgC5/ivIM1PtHvOUhEmP5juejNGJD/a+/R0+74w0099+unB35D0hEs5a
         vIA7Dr7MGa6precOXOdOegAIB8WYokKS42RGv2P8yhgaPfQvyknYJBHb6FYfzh8ygB6B
         JU+A==
X-Forwarded-Encrypted: i=1; AJvYcCWPw7EfVey5Hw7Fz8L5CYPj6tInLOkd469D3p5EJDixRyEPUbRoXp41YMy44kerqmKhJ2Js531za1k=@lists.infradead.org
X-Gm-Message-State: AOJu0YzVVy6Q20RAY6N6iCoN+N/q21GznYr2KWWV9bGAi373Tvr4Gswh
	V1sLfosSH17fbin/faZG7q0ZtKXkz88/DjwA92OAQ2XPD8E1g/9/K8Q02p6FIBjpLlw=
X-Gm-Gg: ASbGncv461ksxeovcvXW9Vu3PSHXxPz5yv8ALg9VfrEy7Grw0+YP4WkhzEZvNM76XpG
	a4HVegvl4Wctxbwh0Pl+fofXS5+mB+AF7K1FM8EFcQBzFrrzvnpMnO0+0E9Ba72hB0GT4yPNKRD
	ILw6uM+t3tA1rRYI6MxbGaVjGxBmpnGN0BTJQ2E2mBH4WOlTm/NrfxI+jFL9ZyLW+AJOlEfMGzx
	FvQpzo3DAkulQmexoF6M+6iMzqLmDXCTynqsXG7qSEVTXuQY/FPdiEuyZvV0+oi4F0iRa73J/34
	2T7bgX7jcW6aRUWdyTCDZrFbHv70I1UN52J7B8xRsWbjQ18/L8VxgE28+W2U3bfl8m8FL6fKEaV
	rpGbDr3SiPFOWStV/qsd1xA3ovlKbxA==
X-Google-Smtp-Source: AGHT+IE2d/O56DZUtoh12B2LgxGIZeb1yHos8UKAErVtVVQ4j+I6Ktyv6mqGKISnmKVi1pnhPfvJHQ==
X-Received: by 2002:a05:600c:1ca1:b0:459:ddd6:1cbf with SMTP id 5b1f17b1804b1-45a157b70b9mr736355e9.0.1755004972582;
        Tue, 12 Aug 2025 06:22:52 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:8113:2b11:8f42:672f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c453d6esm44093096f8f.37.2025.08.12.06.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 06:22:52 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 12 Aug 2025 15:22:51 +0200
Message-Id: <DC0HC9ORWWX1.1LUBWVHPGFK95@ventanamicro.com>
Cc: <alex@ghiti.fr>, <anup@brainfault.org>, <aou@eecs.berkeley.edu>,
 <atish.patra@linux.dev>, <guoren@linux.alibaba.com>,
 <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv-bounces@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
 <paul.walmsley@sifive.com>
To: <fangyu.yu@linux.alibaba.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH] RISC-V: KVM: Using user-mode pte within
 kvm_riscv_gstage_ioremap
References: <DBX0JNR61UNM.Z42YERAKRFR8@ventanamicro.com>
 <20250809032020.51380-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20250809032020.51380-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_062254_315020_72AE4449 
X-CRM114-Status: GOOD (  10.31  )
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

2025-08-09T11:20:20+08:00, <fangyu.yu@linux.alibaba.com>:
>>> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>>> According to the RISC-V Privileged Architecture Spec, for G-stage address
>>> translation, all memory accesses are considered to be user-level accesses
>>> as though executed in Umode.
>>
>>What implementation are you using?  I would have assume that the
>>original code was tested on QEMU, so we might have a bug there.
>>
>
> This issue can be reproduced using QEMU.
> Since kvm has registered the MMIO Bus for IMSIC gpa, when a guest
> page fault occurs, it will call the imsic_mmio_write function,the
> guest irq will be written to the guest interrupt file by kvm.

Oh, so the interrupts were "just" slower.  Great job catching that!

>>> ---
>>> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
>>> @@ -359,8 +360,11 @@ int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
>>> +		pte = pte_mkdirty(pte);
>>
>>Is it necessary to dirty the pte?
>>
>>It was dirtied before, so it definitely doesn't hurt,
>
> Make pte dirty is necessary(for hardware without Svadu), and here is
> the first time to make this pte dirty.

Right, we would get a pointless trap otherwise,

Thanks.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
