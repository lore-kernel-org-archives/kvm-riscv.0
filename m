Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E17CCD1A5
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 19:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=noEHNmyIiYu/ti7gMx6yK3es3HFkaf+4VD2aA1mHnck=; b=vp8/YHVbfB5YJD
	PPrKUz6NkmhkiMU6n8hblomx09y2zhrxW/Hq86aXnoL+5AqApL1HpNu4WsrosW9WJMgCw2+Z4aag2
	kbxVS4QOd1glv3bZSYrEolwXYgVV06nDIV1y8d2AObzBDqRyNkVY9/8KWpSxQ1N9grh+6IK6L93fJ
	MD2kmYS6QJ8KZM4MrCuvU00mr0wFPTDta+ueujMIXq0f5fvyvIVbXRi7EW++WuDTZ/csrT/qU0lhN
	sHfHdAn5MatobJHe0SV16/0yveqyzT40q8lK1TBLNnAsmMiQ8XAEePJinfhogLUBynwQKsR6Wlebl
	HOZ9ukwme95O3EaaeIJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvqf-0000000EpUm-3Ziv;
	Mon, 20 Oct 2025 19:47:17 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvqd-0000000EpUO-22c2
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 19:47:17 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-290d14e5c9aso42504295ad.3
        for <kvm-riscv@lists.infradead.org>; Mon, 20 Oct 2025 12:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760989635; x=1761594435; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T29G72fExJyk8VtqV3YJi7ZBrueGLIkeAq2lMcMuWYA=;
        b=dljiuWTnfVSe2W9hWExSlw/liAVaw6Pt//0lIQHvWA3iW55/tpclKS+sOko+bsE+eX
         Kw9OmZCtnXdcK6ls3x0gHhVeWjraCFyE1Jp6vJ9FN8Lxb1W9+TT8JZJ3TH2gAe8Lkzq5
         94GBCLpfVCSX1tiUv0Ms8jEr9YXtduQWh31S6hcNDBgMXqYXTJHM4mcgDo15FXi1CR/o
         6+aCk41/tI0mVtwCQCUqo7DwWj5HTDkxfJxY0HkFIkNgFlzJ+SgH0VGc2YH63dkSlw60
         3kCGK9D81N/tAZ4uAP1dJT0guczbRa7XHViaW3u1RXj9k6WIRIgQ/EQnE5pb/CpjM5r0
         cagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760989635; x=1761594435;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T29G72fExJyk8VtqV3YJi7ZBrueGLIkeAq2lMcMuWYA=;
        b=K1Bi6YEIkkUpj7WtOT4xjAVCN0e0R3XO4zly2+KYqlrv11J7h6sQiJIyE7w4cYnsca
         TUZQi6f/T9x8mZSN6xr9vlHURBFR+8KTCx9MU7TgPTkQYwCI2qP7Uvg6xruTDC3cnzWN
         U1Jsv0fZJJfC1LCyFe/L+aQhfMWOXSo7nu9FZRyXx9At0ZgL5ofeKq6FhbVNOwAySP2D
         v+96frfjQck4ZAXU5NFqQr8FF0SIVPncavCzzpdjB95Sj+gSLZE5fDDpjdvEkfvJh7Ip
         SgBGpYx207JPddWQhPrq3t7njhI2clFGA458A/UjzodJHWkBgkY8aEKogkjqJOtsNn9n
         a/Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVRf7RFPxOFltb6FlCIw2zIC2qq2amspMTuIHw5lCVwtl8/w7YV3SEZqPd9B4gSqIKzoI9jiWfp5VE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwHIDT+XPZSqVPuKnLq5IBF4tVV8FLVjZrM0AKZJPN3ygnEszqg
	KHH/1IdQSlLpRie7SJ2f0Eoh48xFegvfmNy//gFsXYME5MAuaLPj8/YLt7QW8CQVizk=
X-Gm-Gg: ASbGnctwjzvQXMAJdEnmPZv9gB7Is6GZtpJf3knYfBTffLNoodxHkUbn3JCpvHAS5lL
	6HY43W/qViUXGMv0mAYdfrs7yzjWurQOms/r8xyZm6xDZdFAkROQAseUBvsMOkKJoIiNiUrX/KL
	tk2Lq/EvEQrvLhBxl4ytSn7dE9KiWIzS3GA/dl7P0YLE7CMYsqRvUO3cdYnKmlzkICxLkb6Nzhs
	Utr1xOp3ZqMNfM+96G0tC7oTPy+SLEMEcWzUQTmahTn1xi82x74se2Omnf32Yx9+SzRDqt15ist
	QObRv+m8x1KqchU8uH7obO3Ow8auV2Yt7zYi+0gUfb2uO/A0o/JtD9NTkILtNTfTXlGp0uCoGQQ
	IteZbaFXj3hepr5zwRlFUlEACl5Q1hhVoIo08hpMluV3qBOzOTUQrQG4EJw9gNKmjGtkQvCEu/A
	Ry52rM0fBdFzIAB+ah/0x8BhKsrkfJYkQRp0Z3AKNyyEUJGQy7OTRT7aKF0R+0eE4U
X-Google-Smtp-Source: AGHT+IHbuqXK1u6LquvMt8XAnfwihmyV2uHtYn9qEdWcAtI1wb6x8mv/e+BQVy3+n2euvz+X557SNA==
X-Received: by 2002:a17:902:e88e:b0:290:a3b9:d4be with SMTP id d9443c01a7336-290c9ce63cbmr161125965ad.24.1760989634647;
        Mon, 20 Oct 2025 12:47:14 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc1:8cb8:dfc4:4af0:d7c6:a030? ([2804:7f0:bcc1:8cb8:dfc4:4af0:d7c6:a030])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246fd5d76sm88303565ad.39.2025.10.20.12.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:47:14 -0700 (PDT)
Message-ID: <4d1e8b55-e404-466b-a2d6-b189de910637@ventanamicro.com>
Date: Mon, 20 Oct 2025 16:47:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 18/18] DO NOT UPSTREAM: RISC-V: KVM: Workaround
 kvm_riscv_gstage_ioremap() bug
To: fangyu.yu@linux.alibaba.com, ajones@ventanamicro.com
Cc: alex.williamson@redhat.com, alex@ghiti.fr, anup@brainfault.org,
 atish.patra@linux.dev, iommu@lists.linux.dev, jgg@nvidia.com,
 joro@8bytes.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robin.murphy@arm.com,
 tglx@linutronix.de, tjeznach@rivosinc.com, will@kernel.org,
 zong.li@sifive.com
References: <20250920203851.2205115-38-ajones@ventanamicro.com>
 <20251020131218.68932-1-fangyu.yu@linux.alibaba.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20251020131218.68932-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_124715_644467_8B8F5706 
X-CRM114-Status: GOOD (  15.21  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Drew,

On 10/20/25 10:12 AM, fangyu.yu@linux.alibaba.com wrote:
>> Workaround a bug that breaks guest booting with device assignment that
>> was introduced with commit 9bca8be646e0 ("RISC-V: KVM: Fix pte settings
>> within kvm_riscv_gstage_ioremap()")
> 
> The root cause of the guest booting failure is that an HPA is obtained
> in the kvm_arch_prepare_memory_region.
> 
> Here [1] might be the correct fixes for this issue.
> [1] https://lore.kernel.org/linux-riscv/20251020130801.68356-1-fangyu.yu@linux.alibaba.com/T/#u

This patch fixes the issue we've been seeing with device assignment inside a
kvm guest. I suggest folding it into this series and dropping this workaround
patch in the next version.


Thanks,

Daniel


> 
>> ---
>> arch/riscv/kvm/mmu.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
>> index 525fb5a330c0..994f18b92143 100644
>> --- a/arch/riscv/kvm/mmu.c
>> +++ b/arch/riscv/kvm/mmu.c
>> @@ -56,7 +56,7 @@ int kvm_riscv_mmu_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
>>
>> 	end = (gpa + size + PAGE_SIZE - 1) & PAGE_MASK;
>> 	pfn = __phys_to_pfn(hpa);
>> -	prot = pgprot_noncached(PAGE_WRITE);
>> +	prot = pgprot_noncached(__pgprot(_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_READ | _PAGE_WRITE));
>>
>> 	for (addr = gpa; addr < end; addr += PAGE_SIZE) {
>> 		map.addr = addr;
>> -- 
>> 2.49.0
> 
> Thanks,
> Fangyu
> 


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
