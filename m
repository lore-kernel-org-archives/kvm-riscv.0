Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D21DC83F26
	for <kvm-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 11:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PDuEJRNuoSfkTx4Qv8Pch8Wyttdnk6TJSrbsALo1hsk=; b=lb9Sr+L/Y4yqxX
	j+Bj4NfPYaAO8TR17PtwTam/Nr6CYSnAZLcWpuz3PdFQH6Du9ln2L/xHIRQuAMHeZ7JxpvCsdvhZP
	UwZJXrt4/e6AtZ7iI8+GPH5F80iKiroyLHPJ9fo8lvqdcBd/4fFDqNArFITzjMvUy+jSJBogyIBme
	AEsINuWw/MM4ZZbZ23vdWmGUbHGnx4htgON8jg23RL56yFPCe45wauqZak6kT5ZWKVcazFzenCbLK
	8iU3rCoRcQg9txLJ0nTH/sMXqtf42CIS8zcLG9+swHeG97yJv/6s8I42yxf+qkwdLt0IVUfgqrn4g
	73qZ+arVbLZNnL7Sr6gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugidt-0000000GdSw-0s4J;
	Tue, 29 Jul 2025 11:37:13 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugidq-0000000GdRJ-3ENw
	for kvm-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 11:37:12 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4535fc0485dso5354695e9.0
        for <kvm-riscv@lists.infradead.org>; Tue, 29 Jul 2025 04:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753789029; x=1754393829; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNd74IQITEorMs9LyfvIzBFQmBs+koTjl7VxtOqVCCw=;
        b=WQ8e11mRV96zDMRty7L45k8NvdFq/gwr4++7VdJuBBjqhJPXbySCWRbWxfttaE1ljA
         ctFQNWkdsxbNTWlWrgP2BvUph0Mnr9tvEtFNm06snGQDQl2vJlfnYhGlJHylzUaKgPKD
         NwSXKuf+xHa+0BDcN4YF1rKdOa7VUnTlqdY5I4UYwywYR2S7WyFZcQpvAX+lLJ8D7B4W
         CBk0gi1TJQOSg894/CCNl2LfCjQsxCfr1KQB4MtPcEZGDibN8g8N0efqMKThLYz2CIZF
         0FgGBkeBYzrMsxzPj4Fvr++f55rhM2ti4H7He/KfgpCMKpwad+eBitBqb17TKwEDmKWr
         CG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753789029; x=1754393829;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mNd74IQITEorMs9LyfvIzBFQmBs+koTjl7VxtOqVCCw=;
        b=PgaFDaLFz10VOJz3r7W1n8SRyOSRY9gjRmotnuJ8BMYfKQh8eh660f2PXbnM0KNI3N
         qCHB3/tSYo6gCcDvYkrzHxQ0Re/Xe4pL71tMoVVkTZMyp6G0acqLCxVOpvBMVTnUb+Xv
         +OXucBH74gCficf7HJSFulDQ9F5V3+tV4I/WIq/MBFtnwvRca+DXbxZ9sifa7HTbZFOY
         tgZV18XER8p5NBeLQF3y9AzpBLFy7PwrKCJxdITPhVv4Q+ExdJyYTKV6OXmCtN0/KCHp
         DHw4Fr6VA2DajvdU4zfcKpeKJnC4BkTBFMmbQtBk6cocWn3sGcUA9E46YUJtqcp8Lftw
         SjGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoabajtGpVCtusG1WIZHtNWkbKtIEUgYKWgkfOxTIqsdBVMd3iIo0Afv6kIVyWb5VDrHQJgenKKts=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUsyZaZd66qzDS+ems9AG2gbZpsBsuDpwnK+2nZH9YTsyqUK7o
	mZlpHmCgllgtNEXsM47sUfr4K3FWWTYWPKkgKlBYMToHr+i4nQKtfdc5vNBtUbelVgQ=
X-Gm-Gg: ASbGncvDPkGH8MFRmqPqwcpKPQpVGUhcSs0yDA+eEJjnWIhFq6S1svn3NUdt8AkF/+m
	grh5GxnI2wEM4iJXuwuEabVZ3kr2surl5gaAX5RCNWjs9YFIRVBSwgUY4kPYPodasj4pxFhPEJv
	Q2XSF/GpxTaVX4iZ3+1t/qyTkQ0UaOpJwAxTa5cUWu6/HD1gHtNgJjsGLC+7SVdUkywRn3jGbeb
	Xer6NXy4xw80I9kYBdAreo1Go6YH4SiZvd5nEaefxOcdQuJI/rXFGqvJHvUBWkApKG6dDP7voXw
	X9JbJX1FZ52qhVKO9mxod1FMkHCoIL6FDtFzG/AgbSgUIrJqCOcYuL5eVDXXnZdsq+36ExhwkcW
	LfcOZswt5AQ1USTgYnipFpeVpKZ+YZpyhv6JWRDkx
X-Google-Smtp-Source: AGHT+IGx/xqumpoXOavJf3Q9WFPJjniNReIvUAgEgTBSvd6YC7kBN//pTA0UjL3asQ8LZFYOCaj+XA==
X-Received: by 2002:a05:600c:46ce:b0:43b:c844:a4ba with SMTP id 5b1f17b1804b1-4587654b656mr47415595e9.3.1753789028662;
        Tue, 29 Jul 2025 04:37:08 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:293e:b70a:263b:689c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4588e5cc2aasm22325705e9.16.2025.07.29.04.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 04:37:08 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 29 Jul 2025 13:37:07 +0200
Message-Id: <DBOIBORLK6YM.7SND5YPEJR60@ventanamicro.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.17
Cc: "Anup Patel" <anup@brainfault.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Andrew Jones" <ajones@ventanamicro.com>, "Atish
 Patra" <atishp@rivosinc.com>, "Atish Patra" <atish.patra@linux.dev>, "open
 list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>, "KVM General" <kvm@vger.kernel.org>,
 "linux-riscv" <linux-riscv@lists.infradead.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Paolo Bonzini" <pbonzini@redhat.com>, "Anup Patel"
 <apatel@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <CAAhSdy12xtRRem-AybfymGHh+sj4qSDDG0XL6M6as=cD5Y2tkA@mail.gmail.com> <CABgObfYEgf9mTLWByDJeqDT+2PukVn3x2S0gu4TZQP6u5dCtoQ@mail.gmail.com> <CAAhSdy3Jr1-8TVcEhiCUrc-DHQSTPE1RjF--marQPtcV6FPjJA@mail.gmail.com> <CABgObfaDkfUa+=Dthqx_ZFy418KLFkqy2+tKLaGEZmbZ6SbhBA@mail.gmail.com> <CAK9=C2VamSz4ySKc6JKjrLv9ugcTOONAL4+NmKAexoUgw7kP6w@mail.gmail.com> <CABgObfZu2fPFaSy2EHzpD_MUwYYeYMfz6BfXmTw_h3ob1q2=yg@mail.gmail.com>
In-Reply-To: <CABgObfZu2fPFaSy2EHzpD_MUwYYeYMfz6BfXmTw_h3ob1q2=yg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_043710_809456_8518C531 
X-CRM114-Status: GOOD (  11.12  )
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

2025-07-28T18:50:10+02:00, Paolo Bonzini <pbonzini@redhat.com>:
> Il lun 28 lug 2025, 18:21 Anup Patel <apatel@ventanamicro.com> ha scritto:
>> Currently, userspace only has a way to enable/disable the entire
>> SBI FWFT extension. We definitely need to extend ONE_REG
>> interface to allow userspace save/restore SBI FWFT state. I am
>> sure this will happen pretty soon (probably next merge window).
>>
>> At the moment, I am not sure whether userspace also needs a
>> way to enable/disable individual features of SBI FWFT extension.
>> What do you think ?
>
> Yes, you do. FWFT extensions are equivalent to CPU extensions. But all
> this should have been done before including Clement's work. Without it
> userspace has no way to support FWFT.
>
> Drew, I see you have Reviewed-by on the patches; please keep an eye on
> this stuff.

Sorry, I didn't try too hard to convince others after noticing it, and
planned to fix the most significant breakage in later rcs.
(If FWFT wasn't enabled by default, sane userspace just wouldn't expose
 FWFT to the guest until a proper KVM configuration was added).

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
