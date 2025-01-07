Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9BAE77188
	for <kvm-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 03:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u+fA/PAay0wW1rpePIiCtR3Fc/+kub6i9N6tHzLWA9E=; b=Uw1NRFriYaeSzd
	UnuzckC3+kCPMmuMefMk1BCiWNFer9JVO2iP3VEYa++qbaP2XocbZd1BAxS+dBcJye4CeehD/q5NV
	z4+3nDTqVm7ezxYt3dAnEiSpo7PFwP2FZO6OQO2bEZlurF50CiWVBtiTFWtWFlWXtrm1sxtPTx3N2
	mhHj+3Be/LmedDBh9MkGhkM7yNQYdXh8HkYYDdwoM5Ql7tEKjBAWm/tzGkcod+htgP4w/P+9ZxXsr
	GZyTF+FUd8VLSbVsFmWnmvkj2ajuUI51DEEHd35YvBL2ce0PLCf+BKXaa2lkNl1pTWarrMaZJEAKu
	gMAdY/IL+YmLDOsImT/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV0Ms-00000003Juc-3eRn;
	Tue, 07 Jan 2025 03:34:58 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV0Ml-00000003JsA-3A8F;
	Tue, 07 Jan 2025 03:34:57 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso100102555e9.3;
        Mon, 06 Jan 2025 19:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736220890; x=1736825690; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FahbewDvVeR/TbxJ1eC2PQBUvvqltZZ3+sZ1e97cI7M=;
        b=bHqyuhoTsL9jTnFjpV0fwPJ0ZtScKl8MT+2QcYw6lZzCBVQOgJqmc5mCFofSBm1j7P
         ma7t+z8IJ7g3zmdcxgk27M3sJbO33hZf2fYP3iqshiRTp56xb+OACf+NqC6WwjkNVO2O
         DkDudjWQaU+yBzbKoE6dFz8jUumh/WJpuQibGL3w1w2mRG/5bm3xcOszucSr0aMyb/OJ
         8I/BShfSvvMfntKThCETEeZLMJV3LfC9jlojpoVuQDZB9PIxLkKu53QY27RAPLMDYKhb
         1dPUnlm7yaTQuYZc4CVOr6nfMTm+xSb0hRHHgyfZGNF15KbBmaNDqQJrZFxAtKx1XZSZ
         hofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736220890; x=1736825690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FahbewDvVeR/TbxJ1eC2PQBUvvqltZZ3+sZ1e97cI7M=;
        b=EG48RPpQloi41QxTzKa6Es5K2fJAkrtkW4skfpij0YwvxyZ4fJVbXXMxSgBfm56vxr
         N+wPYRQFiHZYIu8DUtQiHvUChP2maMwsVi567D6q/Btep4Xu72up1x+kMH2is6oNvLSD
         PJL4g03NTneO8i7uFrrkpBnLJIdwxQbo3kmpImzp2bqTqe+d3f50zlHa4E0Nrsy0+mC4
         9G0OISLyWTF5eamI+LR37MIulWRaaLx3imPNkYOZ56LgnCZqZfGe+TzYfmBKbVJpwc12
         u+eUlhMLvv5wZ0pVdKcAAooYeuWBX1uwMX4MgJ6/xmOuBO8WEQxeMtak4OmPn3kmaNRY
         AByg==
X-Forwarded-Encrypted: i=1; AJvYcCVsZJibg6qVUWqyEAvOx3Sjai+27XcghBG6Y76Lm/3YbTHZZvHrS1dfFxLtyX2Sy0BRpmwuYb28pVT71Mc=@lists.infradead.org, AJvYcCXVVHARkopqSUbMckunKGAXr8bPy3eN9+uGJQYCYr0s6lvXk4r711ZbfZgwZJ6rqNPmJs7cb6eGZE4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4ZxRa1YIxCpWgs2rYZMb5ep8IYrDyR4BT2pRrKStI52dxGGPR
	nlZ2msCNno1d/DQN6MpaTBddLhiU0fQbDoj/uv24wVWehHRSo+WYXbDUQJB864DMaTb6P43BCzN
	XH3sFxenvxTPDFlb+irsUKtd5vko=
X-Gm-Gg: ASbGncv3UH7yNTgU7W2SQfGQKR2O58/QMu8+u8JyF2QVFWSAeSrPl73ba3vUnVykMxy
	a0zfrszESs0jn5EwFYE8vpDYTxmpW2A/ptNsCyg==
X-Google-Smtp-Source: AGHT+IEjgFMsqmwMnBKlRV84pLX9SGYuU1vz9iegSbKPWh1KSUj66MxOowLXK8zaESZz4nWlyoo0up8QbNmKSijALkY=
X-Received: by 2002:a5d:6da4:0:b0:385:f5c4:b30d with SMTP id
 ffacd0b85a97d-38a223ffac3mr50598935f8f.39.1736220889773; Mon, 06 Jan 2025
 19:34:49 -0800 (PST)
MIME-Version: 1.0
References: <20250106154847.1100344-1-cleger@rivosinc.com> <20250106154847.1100344-6-cleger@rivosinc.com>
In-Reply-To: <20250106154847.1100344-6-cleger@rivosinc.com>
From: Jesse T <mr.bossman075@gmail.com>
Date: Mon, 6 Jan 2025 22:34:13 -0500
X-Gm-Features: AbW1kvb44Ft_Fk0OEu5NPcMRBNdKrUUoqUqMtgbBqh5bUl2FZVNAVukNHQY7sXA
Message-ID: <CAJFTR8QyphR6sWdnri1uvw0Nwmg=4G_Xb02+CvH4LhpO3=-GhQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] riscv: export unaligned_ctl_available() as a GPL symbol
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_193451_792986_A45747DD 
X-CRM114-Status: GOOD (  14.56  )
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

T24gTW9uLCBKYW4gNiwgMjAyNSBhdCAxMDo1MeKAr0FNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHN5bWJvbCB3aWxsIGJlIHVzZWQgYnkgdGhl
IEtWTSBTQkkgZmlybXdhcmUgZmVhdHVyZSBleHRlbnNpb24KPiBpbXBsZW1lbnRhdGlvbi4gU2lu
Y2UgS1ZNIGNhbiBiZSBidWlsdCBhcyBhIG1vZHVsZSwgdGhpcyBuZWVkcyB0byBiZQo+IGV4cG9y
dGVkLiBFeHBvcnQgaXQgdXNpbmcgRVhQT1JUX1NZTUJPTF9HUEwoKS4KPgo+IFNpZ25lZC1vZmYt
Ynk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEpl
c3NlIFRhdWJlIDxtci5ib3NzbWFuMDc1QGdtYWlsLmNvbT4KCj4gLS0tCj4gIGFyY2gvcmlzY3Yv
a2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2Fs
aWduZWQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwo+IGluZGV4IDRh
Y2E2MDA1MjdlOS4uNzExOGQ3NDY3M2VlIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L3RyYXBzX21pc2FsaWduZWQuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2Fs
aWduZWQuYwo+IEBAIC02ODQsNiArNjg0LDggQEAgYm9vbCB1bmFsaWduZWRfY3RsX2F2YWlsYWJs
ZSh2b2lkKQo+ICB7Cj4gICAgICAgICByZXR1cm4gdW5hbGlnbmVkX2N0bDsKPiAgfQo+ICtFWFBP
UlRfU1lNQk9MX0dQTCh1bmFsaWduZWRfY3RsX2F2YWlsYWJsZSk7Cj4gKwo+ICAjZWxzZQo+ICBi
b29sIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCkKPiAgewo+
IC0tCj4gMi40Ny4xCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8va3ZtLXJpc2N2Cg==
