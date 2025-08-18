Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31117CA0EF2
	for <kvm-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 14:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvD7v+vWszthVrp5Kyp5qqROXJ7aJnhiVsslG3GN8oM=; b=0s+7EPn7SIHBH2
	zH+Hq25DSB3U7vuEpSmpcjRaA3mAjBUpqGGHvcsG1Pl9fp1JCvUtvr4ZHTScKkw8Xs4b8su3Dkb3n
	b+P6vt17CSbgD7wTEokCDo2dXIkLKb1lSf+mhj5ParGfadQ0L/8wb1J6KrMybIylelonextQxOYCP
	v34x/QjR1Mgkwnihg7xAMlmOJKtda3f2V3SSpla3/JVxT38eemCYJms9vxGGR5MvaC1f9bwQLykaw
	o9RJJSanBpO4HfagFZosAgL3RaTY0ge8ON/EdzHswku88+1M66SCvK0jtVUdZxC3Z+5sE/MjwXIfL
	Vax82z2l96J+dsYGBSvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1AM-00000007okq-2By2;
	Mon, 18 Aug 2025 14:48:54 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unx72-000000079ke-4Adq
	for kvm-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 10:29:14 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45a1b0ccd63so7094275e9.3
        for <kvm-riscv@lists.infradead.org>; Mon, 18 Aug 2025 03:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755512951; x=1756117751; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhbysUcbAKjEA8/11kFRzX2E12IzlBavWPgZPsKEmYQ=;
        b=oHpFNnQV8qVDXcT6fOiX9Zi29fXpWoaNvUtomJIq9U8oh9qrGghpuph2SgacGrrIrL
         lngUrNBNV11Go9f1C2d2DAj9C4ZaW45e9VOLJFiiuOQhfkd4xebiENj+6Mo9NuC68GNB
         TNA0ryOUHZYkRb1xpOAp3lApaNRQBaK3bQdMbyigQcGtjkqPxcg5gd85Vim/X2W54aC1
         FSzqR9ZDxz9l7sQEZp5JzeSTqXR9d7cAm1N5PB+yqv2kiL3Hq44P4/btBChucDytymbm
         2BSSB8cYCzZibXBBKF1u0BY9duD4nrk3oCRgZep2TBj+ukTktlCPGnDt0Uu1mDfbjmuu
         cv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755512951; x=1756117751;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BhbysUcbAKjEA8/11kFRzX2E12IzlBavWPgZPsKEmYQ=;
        b=oFuo6JDB0y7Er4sJgYUVrePtFWQAmMPmgn8KJFxGW8wTfiiv47xKopbSECfHKq2YCl
         DaM2NaZl7xuevjauVh764Vgh7lPoilz9CHHsaiGwAbip9Yy5WkYgqx/boQvnjpat4xIO
         jl2Iura3SPhy/4J+1coAAa1fdcSTk3+hsqaXY84uI13cGF1Bde3vrIuBBxxgrS2xMzu4
         M9arZr1nDtRtnlSJuCHln2U7ugdKZxnkEHIm97/QrefVagr9ZKwdbJRFGTfPzs/hX9tR
         xGuuyJTIBoL4HBJeoBLEOsqVtV0pgc+UEFhmI/oBzVtNPhnWRJhYvya7ML5hkuyT/8FA
         uxsw==
X-Forwarded-Encrypted: i=1; AJvYcCVkWJDXcxjY+FHyqksHvtd3HBGUcpazpGpK+FtIo+Gn2dAdjKKQ4FXN/Ad2uNJQRaSg07e3JUasJoI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyrMNHU9WrbCTUmYVG1EJHuxvR2+vkEugmOnmFXN4mhSfoz8gI4
	qCkg7wm+g+BnCdZ1C7Uz/y3voX5EqoLLULmSsngtEA9piEiwEDwrn7yUKTj3hLbew5Y=
X-Gm-Gg: ASbGnct/pMUl6CjlmVEooF08mqJUGHn8kmS16t0d0CwhfcYt2qaKWOcS50bBpb2avnq
	+6/5xrry9097IQr38JvTuQnQFQ/ooqylkiVwVrGadEohLT5H/4qqhldu17HgjibD7OCtjDfHDNq
	1YUoLlx849P+OIJadJzLBsbmggbb2vcQJOk+tB3C2xGxPX3YeAhwswuFzxh92MF0RwOMU8BHG7n
	EgR49uPevApWUc3oDGdICjKKVSNrtMUf4VttSuh82Q2fUMQ9ZAtzIo5/bxDZHiqHszrhWGt0svI
	skiEe/bTQkwKsthsd4SSJpZU5JQ2Dfaf6t5HrD5o8HpQgsP9p8wofjLYg+Yc6bGHcHLqar4/5xN
	QT78M5DsdNBSRZUr9bNTTkxwmI47UcA==
X-Google-Smtp-Source: AGHT+IFey14ol9S6TtNaCL77HGtEmBhLvnjzcHSJ5a+JMC7yNb3b8k4bUmeKUn0yZJ7mbxDU1Gpejg==
X-Received: by 2002:a05:600c:46cf:b0:459:ddd6:1cbf with SMTP id 5b1f17b1804b1-45a21781fb3mr36116495e9.0.1755512950889;
        Mon, 18 Aug 2025 03:29:10 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:faeb:f88c:9e29:5aa1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a2232de40sm125126805e9.26.2025.08.18.03.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 03:29:10 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 18 Aug 2025 12:29:10 +0200
Message-Id: <DC5HEJRMZ84K.34OPU922A7XBE@ventanamicro.com>
Subject: Re: [PATCH 0/6] ONE_REG interface for SBI FWFT extension
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Alexandre Ghiti" <alex@ghiti.fr>, "Andrew
 Jones" <ajones@ventanamicro.com>, "Anup Patel" <anup@brainfault.org>,
 "Paolo Bonzini" <pbonzini@redhat.com>, "Shuah Khan" <shuah@kernel.org>,
 <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Anup Patel" <apatel@ventanamicro.com>, "Atish Patra"
 <atish.patra@linux.dev>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250814155548.457172-1-apatel@ventanamicro.com>
In-Reply-To: <20250814155548.457172-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_032913_085914_0A12F421 
X-CRM114-Status: UNSURE (   8.24  )
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

2025-08-14T21:25:42+05:30, Anup Patel <apatel@ventanamicro.com>:
> This series adds ONE_REG interface for SBI FWFT extension implemented
> by KVM RISC-V.

I think it would be better to ONE_REG the CSRs (medeleg/menvcfg), or at
least expose their CSR fields (each sensible medeleg bit, PMM, ...)
through kvm_riscv_config, than to couple this with SBI/FWFT.

The controlled behavior is defined by the ISA, and userspace might want
to configure the S-mode execution environment even when SBI/FWFT is not
present, which is not possible with the current design.

Is there a benefit in expressing the ISA model through SBI/FWFT?

Thanks.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
