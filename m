Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3D9C54ED0
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 May 2025 13:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bNHsnFlGlEuCLHVYz+df7qwmrBiWPtyG4BDP5wBxHEQ=; b=NfVThhqWDbddrv
	DhvWAGMSWTcKh82J2UHaBN8BDOMZM5IWkD61mM713t7pO+OdRmehz3Rd4OUOZxnLDwBfTKJP8Z9tQ
	OXCg/xQxC8t4AXjHpji1mmQMo5F7tc8+DtwJbfHHQj8LKNmpcBdA8cORQo1CnwHubC0bTLxRQ+v0o
	STcuC6B3LEklhdsKvVLgsJuDZR/hcPdSbClJqU0lDLX70oJ/NMK8bCx58CHFiV1kkuVy8tTg0o0sR
	rHULP9kY9FRKB9kEpWuvYbf2OnpadjVeuJpxwCJbe9Xw8gMjST2xjlzK9lROObGgRg6fXcHrAWqLG
	FgqoemXzmR3iK0kx1gJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISMB-00000003wLX-3121;
	Fri, 23 May 2025 13:22:39 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIS87-00000003uFj-1rNe
	for kvm-riscv@lists.infradead.org;
	Fri, 23 May 2025 13:08:08 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a365bc0af8so729562f8f.3
        for <kvm-riscv@lists.infradead.org>; Fri, 23 May 2025 06:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748005686; x=1748610486; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KARpSC0ktVs2EmfgMj89WaDgPQ701M83Nyx3KMNRgAE=;
        b=VNDsC4xvgbD6BbHVSz6LWeKGWiidBLndkaKvXUXuwayw2QAnnobCtFmrh0gWzl5eV2
         4awzhFPwIictErP/srjajt/geetLyDohejYN6gBUcM0HxX40o42PXeZf5MKJKBlxNt4x
         hN7+MbIf5fL6lbhwkuz3rme6vD4esUbHNfUch4K6V25c4KefUw/zRlHmsD4DxrsrwaTb
         jyEwIwNjgURVR20r/khSABCAtqtV4cdrqtKGm2v+uMCHTZ+kx6VT4LHz1ILgGvc+JOhE
         F6ES1ZM6ICx0nRUvS3hQyAVsSkmRtQiQSxydSHdw5VZHqMr/0RTiQz6Tu4tJmlpSRBL6
         6zcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748005686; x=1748610486;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KARpSC0ktVs2EmfgMj89WaDgPQ701M83Nyx3KMNRgAE=;
        b=uIMRyTYVDfabG4TQyCwrUhXNndQQCV9Uj8z8riR4ZbI05yV0OxgN5NEQTrW+TtiXA7
         uHzSPPoTIIlpXG4ItTEBWLeOz+mJHFWiVgAUwQefyK7bKQo62eqlANO8/lncAlEGaO0u
         rh38BIJOkdu8luTCjlLlvP+ydiiDHu7028HEzCZBq8TrIEvg3PXh1Yrcgh01MCgb3D/v
         K1bJ8cIOiEaoLOUcaLhyNc5tMeKVPbplkWaK4b73HkpHnJDIO2T+VowmwVc89mko/4rJ
         4rQRmgb8TpoEwu9PWXk2iRViplF6Dm+D+xEOY0nmR5nyyAhWzhqRtDALZ/UDJgAvGp1D
         4zIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5dP9ASe+FUBTbgWgRxyVtIvxJfA2I7oEkAI4Q6sxzdYXogYi446J7/o9sC04Uv0LLe3YHGOvclI4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwytQyS42hiV5DDOGajEB9PPURnkiz75KWyJLmv5cZ4UC/m0rod
	RVajS8GbitZXi6NHVdeuOUO/fcLxgT22xvVSbV/xY0cffUv+ku3MOM7/NVH+kd7+YJs=
X-Gm-Gg: ASbGncsWHRH7qzNCTRnQzJ+wvsKilIwkT26UA9NMuHhzRjTRnDoko4Rs2AoN6/wIRx6
	e0fhSQCsD7lztf3ZNmvDeObXtS+dLeyeVNiGeziyeDHJxCP6PjJmg2rUkYeUhCvYCQXI1bRjSCV
	UKoDnYgmPKNJpySk4qkJjM8Jssf8x+ncd1W5qb9lwI1V71g1rFEonNyc9pFElDtNpTc5ZDpQ1ML
	ZWrPcgUM5l234T5qOzg0FgSZxAHRV1iCCTxNOmR+cCSMX8NXE4ws5H/kRaC8lH7+g2P7ilfTeTD
	CTn2PCkqc5e1W5LZ/EOiCpc9OTwYuqrV0+E5PkOyC0Eg0Z5OzB3MKeJPgTB8rZ0c/i03Ow==
X-Google-Smtp-Source: AGHT+IEQlpZ+MHYlhIdSbIKkOQ9vfMtZ42DEnpA7EqlzBwx2H4tZNz3AtELJClLMWV4vaH5ju8V/Tg==
X-Received: by 2002:a05:6000:184d:b0:39f:728:4324 with SMTP id ffacd0b85a97d-3a4c2d327a9mr972266f8f.9.1748005685763;
        Fri, 23 May 2025 06:08:05 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:be84:d9ad:e5e6:f60b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8874bsm26894531f8f.67.2025.05.23.06.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:08:05 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 23 May 2025 15:08:04 +0200
Message-Id: <DA3KATTIZQ99.2M1SWQ64M9WX8@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v8 14/14] RISC-V: KVM: add support for
 SBI_FWFT_MISALIGNED_DELEG
Cc: "Samuel Holland" <samuel.holland@sifive.com>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Deepak Gupta" <debug@rivosinc.com>, "Charlie
 Jenkins" <charlie@rivosinc.com>, "Atish Patra" <atishp@rivosinc.com>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Anup Patel" <anup@brainfault.org>, "Atish Patra"
 <atishp@atishpatra.org>, "Shuah Khan" <shuah@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-kselftest@vger.kernel.org>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-15-cleger@rivosinc.com>
In-Reply-To: <20250523101932.1594077-15-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_060807_477899_4218059A 
X-CRM114-Status: UNSURE (   4.89  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

MjAyNS0wNS0yM1QxMjoxOTozMSswMjowMCwgQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3Np
bmMuY29tPjoKPiBTQklfRldGVF9NSVNBTElHTkVEX0RFTEVHIG5lZWRzIGhlZGVsZWcgdG8gYmUg
bW9kaWZpZWQgdG8gZGVsZWdhdGUKPiBtaXNhbGlnbmVkIGxvYWQvc3RvcmUgZXhjZXB0aW9ucy4g
U2F2ZSBhbmQgcmVzdG9yZSBpdCBkdXJpbmcgQ1BVCj4gbG9hZC9wdXQuCgpIb3cgZG8geW91IHBs
YW4gdG8gYWNjZXNzIHRoZSB2YWx1ZSBvZiBoZWRlbGVnICYgTUlTX0RFTEVHIGZyb20KdXNlcnNw
YWNlPwoKKEkgdGhpbmsgdGhhdCBtb2RlbGluZyBtZWRlbGVnIGluIE9ORV9SRUcgaXMgYSBjbGVh
biBzb2x1dGlvbi4pCgpUaGFua3MuCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2t2bS1yaXNjdgo=
