Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B4ACA0EE4
	for <kvm-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 21:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lLBjbQDr8YFjb0cz6y+WhOjW1Q6cpSrmyFkuysDvW3E=; b=TJ/8PmDblSmENx
	canYSnFQo14wysMqXpjyZ1R/ejk3oxGkAJwz7Te+0fY/Det+dS2a5pmTGRzk6aCMg0b31RUc+tivJ
	KVBiHHWsmGolzFp+oTp4PQwpFJ31Ct5GwcsgPhMPywiTjQWha3J14Lxx8fAFKKWYJBA8Nnz6LdNFT
	+Vr8vu2ljjPvDPHEjdAmTPC//nI7j00u88V1PX070RRFtFARMubci5LHNrdB5sgPGwC0U/Xf8kTEu
	hKcxbHoR626NVLtyzmnN/Z06eac8KcCnSUDGMNGpQOUzXaOw8HdwuMCr5q/3kRqvPeNXu+03mOtb7
	zytZwH/mGKWS+miktbbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7OY-00000008j59-3cZg;
	Mon, 18 Aug 2025 21:27:58 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo6YM-00000008dYx-10yH
	for kvm-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 20:34:03 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3e56fc0f337so29660435ab.1
        for <kvm-riscv@lists.infradead.org>; Mon, 18 Aug 2025 13:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755549241; x=1756154041; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wjJrmy2stspTCrvdXY1WIU0SYuKr2K0lvsiwRgTRkkg=;
        b=O906q9GOSs2YmflroXXGZtVfqHJD9ePDowWynUo/mx3b+9r5sjpMKu4bqW47kBf8aD
         ONUZWhjJPR24oR+wG116z6OTF8DAdqZc4T5HlT36ZIGXCQpt1P65LkQx9u3X5ruXorLU
         HVLDhnsoN8Jr/YIMOJAxobt2Qz74W1adpwTNzElfBLdjW2FfT0qlTk3KjBkG0Gc2FIEB
         yjDRejWNyAcysBzwKCOXr2ADUDza6MObRJLNRuKy3bnuBtHtRCTbNFSfATdZabrGRMBq
         kQ/w6vrrgSC5Mii2SzxgWa0DUpmw95Qmg6aX2shDhWatX8ii9Di/QrfXhdEcsyZrLZDU
         Uf8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755549241; x=1756154041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjJrmy2stspTCrvdXY1WIU0SYuKr2K0lvsiwRgTRkkg=;
        b=u15L/teBl9DZu+Pxgsl1QC8dFqt+saxDt5QWoJmfQziT0KLJ9AdLBcIf/wxRhDtZEd
         iXqu6P6M7ZNyU2wpd+CfrYVEWhpZa0k0wvVjf9/3XeNecs4Qm+gx5Fw+kbBUDthzsZ//
         SY1bDkyeX5AtxjUVHE94Uhb5d6cxJezm9hRbwB5wmniFbtaeflcnCPX9+O2p33n/1O12
         OdjHoj+kn3PZaEDda8juzt1jgn+djDtedd4VoGPvYprAa7HWNAQQc2hvFXo80E6qGh2f
         TnVVkdnv4+3NsF6JrbflcZ/idP3YE9mvP4ssSTM9hxs5/RG3l0X5b6yoaBHwiQldc2fR
         QfLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLokQIkiLOYvhhjKt8J6VKrYyRRItDsEcDLpVM6Ep2WzIWAjyBahmesultCIdVYHLLEkSDvMnW9Ik=@lists.infradead.org
X-Gm-Message-State: AOJu0YwOowlGCoBgkBomS8Put1Z6IhWmLtaBRjmTikYMrknRahFkevJa
	LDmw4F2NgmsHPRnruFJxKdavuEOIlb7A72tX/SkhESkSMN6dFEvrMzVA8dUHgclbGb0=
X-Gm-Gg: ASbGnctI8rTlAj/crmc8tthWnLFnhbcS4qCHeymb6Ej2zdudRH+Mgwr2Nj3TdQ+PI3C
	AYhChgARPKcYujFOXMKFebzH8I2hCqvV5w8yzBOLdrEmd96zBrp7FNvnPDrJf5pzF8JMMKOrhHY
	qwyYudLPXZZQpwVcmtAyvfOxK3gklxZHsWEnVZ6LoTSIhq8Oz9RqEbgH2TaYVgzPGnkIwvI0raH
	RXmg1/1ybGqH9Kj4ajS+xyiD8aRyySVSZlnJrgkxinWjm+E33knfWauVRhLKxxZcjFC/4ggXpef
	Ke88Vauz7CEYxso6AgzXseKo4flSpTI+fWJpKM3atErfNHzET51bPaZEpQTFB2lTM8u418XSN1s
	HooCx+8yoW0uSZ9hvtaHm3opM
X-Google-Smtp-Source: AGHT+IGRTgu1GwXkFLnvLr28LEmoS61swGqzhfNvkiuvx4bYf7qu9UcnEVK45d2zFEeHx8uZ9BB7/A==
X-Received: by 2002:a92:c267:0:b0:3e5:70b0:4f9c with SMTP id e9e14a558f8ab-3e674fe559cmr16147595ab.6.1755549241100;
        Mon, 18 Aug 2025 13:34:01 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e66c6b0b12sm13099125ab.25.2025.08.18.13.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 13:34:00 -0700 (PDT)
Date: Mon, 18 Aug 2025 15:33:59 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/6] RISC-V: KVM: Provide UAPI for Zicbop block size
Message-ID: <20250818-8beeedd83482f6e618be2ea0@orel>
References: <cover.1754646071.git.zhouquan@iscas.ac.cn>
 <befd8403cd76d7adb97231ac993eaeb86bf2582c.1754646071.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <befd8403cd76d7adb97231ac993eaeb86bf2582c.1754646071.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_133402_282857_AC5E022D 
X-CRM114-Status: GOOD (  13.00  )
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

On Fri, Aug 08, 2025 at 06:18:34PM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> We're about to allow guests to use the Zicbop extension.
> KVM userspace needs to know the cache block size in order to
> properly advertise it to the guest. Provide a virtual config
> register for userspace to get it with the GET_ONE_REG API, but
> setting it cannot be supported, so disallow SET_ONE_REG.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/include/uapi/asm/kvm.h |  1 +
>  arch/riscv/kvm/vcpu_onereg.c      | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
