Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CABC282EC
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 10:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k8mRvaX/6F+O2AkxeNpASdQotlVTF+d601PycmS618w=; b=tLskU6RmSOTbyQ
	4quMqM+aR1774JXh/YR6FHFmJhNBN6XHY8PyC6tM3ldxyHkpLD0T/OFQ+z0CzTwh0WleSOQpcRdoU
	dYLQTtEEwhmqsXjpeCuk4waBZyNE66UNwLB7bEP3zD8GSrsLKb/jvLJdpLja+UvNR/yHwOm6YPGFR
	NJtVooDjElJ8XTSldklBIJAcjfV6Esj7pmEjv9Ie+NiczXoenpWyuPBKTw6KRMTPebSUUg1oWi4PX
	tkisacLVC6ARq5c4wgulESfrUxcitUl40a/WrFn/2o2wikx8DvKnEMQQnNxV0HdbaruP2nul5/btN
	1o0mjLw2QyHzay9MiOQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2Dr-0000000Dpha-2k5X;
	Fri, 14 Mar 2025 10:24:59 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1z3-0000000Dmsj-0bV4
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 10:09:42 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso1222857f8f.2
        for <kvm-riscv@lists.infradead.org>; Fri, 14 Mar 2025 03:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741946979; x=1742551779; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rHvQM0hWNFzQwTnnid4W2JR0bXSJztqu82kqIMQGNho=;
        b=kCH86bR+r2zo+Pdrrk1cShDmFw6Uxb+uO21IGxgY3V8mxaiZ3pG92aPFyHBiB/vQsD
         egwxkeCRuWD8mVt4v7jTHzQFOR9d38NDL2k9ZLdgNKAdGyQf/pBcozKP1zcUlGWL+LCz
         JI7ynWUMlZCivsIWHOfDvDve/lpi2kcij1mqoBFJ6c7WqSVplLoWP77cGW6miwnFacxe
         rxm2N7OqURnkU9L7LB8IY2kQaW+zk7nFNOIkj6nhHFMYW3VBSRnAmmo4INwXBthAERK/
         nHINbQAeeu33VgyyS5mtpUJE6uLXc+TtUXzzV47cRdliN0Awmp4ZKh1Rz2Z7nEd4csEY
         d4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741946979; x=1742551779;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rHvQM0hWNFzQwTnnid4W2JR0bXSJztqu82kqIMQGNho=;
        b=hzw0MXI5R/BBsnJ1NtrrfqrLOFD4B4EImshyc4h4gMrnc6TP8iD4h96A6xqbWMKd2T
         dclJvPYtj1C03YOTjOzxVTsmNPPKV998oG5+zG83ZaX/W93kH8NqJcvE96kuMp8o7V24
         oHiOPb3B8GtfCWusayJVyc8RdGcDpmPo9afEXw6M4nY5r9TTffboa5k03POujpuuS6r4
         ITPZPnSWpZfRnjr8Okp14M/g6zCntb+3KlAZtFtpaywAFcutwwO4frS7s20SBycyMUqy
         OS/gk0qXRj9GveXvCn3DoCYC7zUBVhMASPcQ/bIOsOcfSsn1YySXq+dR+lXmI0ryapAL
         eJXg==
X-Forwarded-Encrypted: i=1; AJvYcCUoPWnzZonEU5XxzWrUWVo3i7hC2vlVsJ9za6y4i/rVNiE0BrFVt+qa6XxdKWCseffz/T9F89qPbtU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyDJgN9cbID1QDtHx+RyCsCYeZ143eeHSocgxw4ju6pWkNVUmnZ
	7KpiJ/UrHSlEDQwA73Pyw8H5AnAVesTELdi03ycR4UZiq9E459KhfY6NlnPyox8=
X-Gm-Gg: ASbGncsDg/C+lS2sjTEMR3r8lbpv2FrJZBNlRsFc4KZItJYADRbRKWFtIXKxE2YPZT6
	0YIo85pcJVfQIKqcWlBvF6t2ZGHbjndTVDNUEUVyljWmwl+5IfSIcR7zBQNRrPeQ545WFgFNy1Z
	BEiCYh8Zd04mA3lkudRW5fENEpQHVfOxcY9S85x/9zknOkouDLOjGBZ3RHapeINgJm5oL79Bvd2
	sM1lWnI+HbAGfebg9yIcYsMBF2c0vZ6E8mw30yRUnT1ge4HMCBTXUgC74+dcspq27wk7r60TyP5
	SLEEVnlczLx1q5YFOEGwdVpuEgPIn0d9
X-Google-Smtp-Source: AGHT+IGkqV7WhiiGQeYcWXpDhWoriw3YE3T0bLfWDTH81lluu82OdgpWnVLXxH1IZF9JIpyRO6KI9Q==
X-Received: by 2002:a05:6000:2ad:b0:391:3aab:a7d0 with SMTP id ffacd0b85a97d-3971d8fc84bmr2759198f8f.19.1741946979038;
        Fri, 14 Mar 2025 03:09:39 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b7656sm4945455f8f.40.2025.03.14.03.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 03:09:38 -0700 (PDT)
Date: Fri, 14 Mar 2025 11:09:37 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v8 6/6] riscv: sbi: Add SSE extension tests
Message-ID: <20250314-427187c2f57975472e8082e0@orel>
References: <20250307161549.1873770-1-cleger@rivosinc.com>
 <20250307161549.1873770-7-cleger@rivosinc.com>
 <20250312-fa9b1889ef5f422be2e20cf4@orel>
 <ba21e0e0-d262-41f1-a71b-b7de31cbbbce@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ba21e0e0-d262-41f1-a71b-b7de31cbbbce@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_030941_186198_F88D93BB 
X-CRM114-Status: UNSURE (   8.39  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 14, 2025 at 10:29:04AM +0100, Cl=E9ment L=E9ger wrote:
> =

> =

> On 12/03/2025 18:51, Andrew Jones wrote:
...
> >> +	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "Set invalid flags =
bit 0x%lx value error",
> >> +			    flags);
> >> +
> > =

> > no need to wrap
> =

> That's actually > 100 columns if unwrap.

True, even more than just 1 or 2 chars, so we can leave it wrapped. But,
I'd still merge it sticking it out too :-)

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
