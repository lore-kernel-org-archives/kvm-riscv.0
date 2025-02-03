Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBD0C02193
	for <kvm-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 08:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HzML7vUizDsYBHRP/vkkujW/1Ynez8x2g3BDaKv9oTY=; b=G0Uhz4msICaqr1
	+k+Wsgsa0qsFp/y3ZYWUHwMglaVmCchGX3jRPOZYieJF2YlEjUUELk4VQHy994D5EIPpW5D2TJtPH
	wrl5kXpUQon9TffIX9iKeWvQFk02l02Eh1iSKuQNjonnI30wNshugZ7gWRP1nLEfyg3R1TxokErDH
	4++OaXAmdAz8lszisE9K+bqyOWAiXJ5D7i13Q78w7PLG2zZvrTyBKLYxFjhhlgJnJTwsK+2YQrbd7
	rmDuCZMHQK0BZx9nAGzcInY4s27e6TWuWMzTvd9+pCAVGDP3yNOdiOrPPfRnsJ64oRVkIlz+/9vAN
	YXPSqj4AelUZ/Mxe2aEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tesHg-0000000Eva3-30YE;
	Mon, 03 Feb 2025 08:58:24 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesHe-0000000EvZZ-2On5
	for kvm-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 08:58:23 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38be3bfb045so3398555f8f.0
        for <kvm-riscv@lists.infradead.org>; Mon, 03 Feb 2025 00:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738573101; x=1739177901; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pHrK5UvLZLbC7Pb7yURC470gAJ7ShxyOX/5usupuqHE=;
        b=yfoGfbjI91//+/eUSObzbaXoME51WZ74w6IqtgptR6kADGliF3UvdmPsgNpjS9uuWX
         MEaJBbGm8NAij936Cl11ZN94fUdg60hBdW2M4OE+o4KUDMZr2kIX3enNSZHnb38AsZXT
         bIMD60qxkN8ONJgpT9Bkye6sWXUWQOLAXCa82PUb5BA8CZzWcXiuQHmZ4L4EvxXWf2LT
         9FJqJsgmS039CT0Q1cHNUaCi+EkPva5fmXWnkEfL5v4MJyQMUWGR14SeqXSx0EFqSrjJ
         mmflZQqOPmI643lkuGFfqBMrsYhN+E9CGsU62X9nxkzx7qGHFd+f+ed/dHLjrJm/gqTO
         LCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738573101; x=1739177901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pHrK5UvLZLbC7Pb7yURC470gAJ7ShxyOX/5usupuqHE=;
        b=h4QFLdf217hUrikguVBR8kWcohK81A5NLfjpi/TwVNTvs5gFUjRuU50mJBfWuC1yKI
         hceCk84fFtNMnvlItwWbRhRqtCU3OjVJTUqKivuxMPFiMMYQJC+VvuOdDABpWLAYIak+
         purbKZJG1rGJOaMH/XXuE3RiQqijQQIM4XZBLXi5JtI/V4uaGzKL+Cz7LwX6QP94kEl7
         XXsSltSYEj3aSrEcl+7prHcXo0jBSAkoP1pIChK99k7BA23rEkLOH2aChHgiGu0BXsXx
         wLtyJLI1wkbO0xNINrw41A4yRCoRkJZ+/ecObs6pi7EYXTXykWbRFuc12hCCKtg8Gb7T
         NwSA==
X-Forwarded-Encrypted: i=1; AJvYcCVEjnMA9DljgEuHpepfE0UZb2gwJheFJ8T5dmKye2Dm9FI7CnKESFN7lBtKJpyKqdk4QuiKrkO3R/o=@lists.infradead.org
X-Gm-Message-State: AOJu0YzOhM/JyNPb90uDjxtdtazcJuDAYpCClUI/lFr5HZTTGm7ru/dN
	fOy+3RCMuPArFVWgL+LxPj/tRsADek3Y0Z1/K7rh4EzKupCTx7O0W9eLSJrB2i0=
X-Gm-Gg: ASbGncsl2wNr4lagmlDROrUVNKA+VgwdcYsggWhB7r2fRGd71xmV4fMl9nCLght9ZkF
	EpZX1psPKaU18dz2dVbw7efM/YXOVbCuYhr9UWy/eC1JnCLFFAJ+TXmdBS0bTpqCC1+XyJBh6hI
	ds9ehUZoXJ2DQ45RfSOGsOnsM1Z+9zLHnsLBYCfOrP2eLaiRNA2QtoV5A5NJf9jwCzwe2NpQ7eZ
	xyvoGhfETQG2G5KnNq0lmZGKNMi1ickph18LaIvsLi0lhpTizXrkaisZ2GApuHFXos8zOhbt3N2
	7L/GAeB3CI2dVNlt37qOBTLDAImsXOz43JnpMdi0ZKSBIRdsQL8a31m7ufOZ
X-Google-Smtp-Source: AGHT+IFymPNLV7C8kv4HiX++BCWTTyN9Bs4wcHwjz3xqdT/RMIhmoiLHjb0XV+RgIdjqFCTlwKZiGw==
X-Received: by 2002:a05:6000:2ae:b0:386:4332:cc99 with SMTP id ffacd0b85a97d-38c60f669a2mr10361700f8f.17.1738573100942;
        Mon, 03 Feb 2025 00:58:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc26cefsm182014905e9.13.2025.02.03.00.58.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 00:58:20 -0800 (PST)
Message-ID: <ab4288e7-1bd3-4fe3-bd41-71bdea3372b7@rivosinc.com>
Date: Mon, 3 Feb 2025 09:58:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 2/3] riscv: sbi: Export sbiret_report/check
To: Andrew Jones <andrew.jones@linux.dev>, kvm-riscv@lists.infradead.org
Cc: jamestiotio@gmail.com, Atish Patra <atishp@rivosinc.com>
References: <20250129170138.174222-5-andrew.jones@linux.dev>
 <20250129170138.174222-7-andrew.jones@linux.dev>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250129170138.174222-7-andrew.jones@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_005822_608359_410151C8 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAyOS8wMS8yMDI1IDE4OjAxLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gQXMgbW9yZSBTQkkg
dGVzdHMgYXJlIHdyaXR0ZW4gbm90IGFsbCB3aWxsIGJlIGluIHJpc2N2L3NiaS5jLiBFeHBvcnQK
PiBzYmlyZXQgcmVwb3J0aW5nIGZ1bmN0aW9ucyB0byBiZSB1c2VkIGluIG90aGVyIFNCSSB0ZXN0
IGZpbGVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBKb25lcyA8YW5kcmV3LmpvbmVzQGxp
bnV4LmRldj4KPiAtLS0KPiAgcmlzY3Yvc2JpLXRlc3RzLmggfCAyMSArKysrKysrKysrKysrKysr
KysrKysKPiAgcmlzY3Yvc2JpLmMgICAgICAgfCAxNyAtLS0tLS0tLS0tLS0tLS0tLQo+ICAyIGZp
bGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9yaXNjdi9zYmktdGVzdHMuaCBiL3Jpc2N2L3NiaS10ZXN0cy5oCj4gaW5kZXggY2Ux
Mjk5NjhmZTk5Li4yYmRjOTQ0MGQ4MmQgMTAwNjQ0Cj4gLS0tIGEvcmlzY3Yvc2JpLXRlc3RzLmgK
PiArKysgYi9yaXNjdi9zYmktdGVzdHMuaAo+IEBAIC0zMyw0ICszMywyNSBAQAo+ICAjZGVmaW5l
IFNCSV9TVVNQX1RFU1RfSEFSVElECSgxIDw8IDIpCj4gICNkZWZpbmUgU0JJX1NVU1BfVEVTVF9N
QVNLCTcKPiAgCj4gKyNpZm5kZWYgX19BU1NFTUJMWV9fCj4gKyNpbmNsdWRlIDxhc20vc2JpLmg+
Cj4gKwo+ICsjZGVmaW5lIHNiaXJldF9yZXBvcnQocmV0LCBleHBlY3RlZF9lcnJvciwgZXhwZWN0
ZWRfdmFsdWUsIGZtdCwgLi4uKSAoewkJCQkJCVwKPiArCWxvbmcgZXhfZXJyID0gZXhwZWN0ZWRf
ZXJyb3I7CQkJCQkJCQkJCVwKPiArCWxvbmcgZXhfdmFsID0gZXhwZWN0ZWRfdmFsdWU7CQkJCQkJ
CQkJCVwKPiArCWJvb2wgY2hfZXJyID0gKHJldCktPmVycm9yID09IGV4X2VycjsJCQkJCQkJCQlc
Cj4gKwlib29sIGNoX3ZhbCA9IChyZXQpLT52YWx1ZSA9PSBleF92YWw7CQkJCQkJCQkJXAo+ICsJ
Ym9vbCBwYXNzID0gcmVwb3J0KGNoX2VyciAmJiBjaF92YWwsIGZtdCwgIyNfX1ZBX0FSR1NfXyk7
CQkJCQkJXAo+ICsJCQkJCQkJCQkJCQkJCVwKPiArCWlmICghcGFzcykJCQkJCQkJCQkJCQlcCj4g
KwkJcmVwb3J0X2luZm8oZm10ICI6IGV4cGVjdGVkIChlcnJvcjogJWxkLCB2YWx1ZTogJWxkKSwg
cmVjZWl2ZWQ6IChlcnJvcjogJWxkLCB2YWx1ZSAlbGQpIiwJXAo+ICsJCQkgICAgIyNfX1ZBX0FS
R1NfXywgZXhfZXJyLCBleF92YWwsIChyZXQpLT5lcnJvciwgKHJldCktPnZhbHVlKTsJCQkJXAo+
ICsJCQkJCQkJCQkJCQkJCVwKPiArCXBhc3M7CQkJCQkJCQkJCQkJCVwKPiArfSkKPiArCj4gKyNk
ZWZpbmUgc2JpcmV0X2NoZWNrKHJldCwgZXhwZWN0ZWRfZXJyb3IsIGV4cGVjdGVkX3ZhbHVlKSBc
Cj4gKwlzYmlyZXRfcmVwb3J0KHJldCwgZXhwZWN0ZWRfZXJyb3IsIGV4cGVjdGVkX3ZhbHVlLCAi
Y2hlY2sgc2JpLmVycm9yIGFuZCBzYmkudmFsdWUiKQo+ICsKPiArI2VuZGlmIC8qIF9fQVNTRU1C
TFlfXyAqLwo+ICAjZW5kaWYgLyogX1JJU0NWX1NCSV9URVNUU19IXyAqLwo+IGRpZmYgLS1naXQg
YS9yaXNjdi9zYmkuYyBiL3Jpc2N2L3NiaS5jCj4gaW5kZXggOWY1OTFmOGZmNzZhLi4zZWNhOGM3
ZTM1ZWQgMTAwNjQ0Cj4gLS0tIGEvcmlzY3Yvc2JpLmMKPiArKysgYi9yaXNjdi9zYmkuYwo+IEBA
IC0xNTYsMjMgKzE1Niw2IEBAIHN0YXRpYyBib29sIGdldF9pbnZhbGlkX2FkZHIocGh5c19hZGRy
X3QgKnBhZGRyLCBib29sIGFsbG93X2RlZmF1bHQpCj4gIAlyZXR1cm4gZmFsc2U7Cj4gIH0KPiAg
Cj4gLSNkZWZpbmUgc2JpcmV0X3JlcG9ydChyZXQsIGV4cGVjdGVkX2Vycm9yLCBleHBlY3RlZF92
YWx1ZSwgZm10LCAuLi4pICh7CQkJCQkJXAo+IC0JbG9uZyBleF9lcnIgPSBleHBlY3RlZF9lcnJv
cjsJCQkJCQkJCQkJXAo+IC0JbG9uZyBleF92YWwgPSBleHBlY3RlZF92YWx1ZTsJCQkJCQkJCQkJ
XAo+IC0JYm9vbCBjaF9lcnIgPSAocmV0KS0+ZXJyb3IgPT0gZXhfZXJyOwkJCQkJCQkJCVwKPiAt
CWJvb2wgY2hfdmFsID0gKHJldCktPnZhbHVlID09IGV4X3ZhbDsJCQkJCQkJCQlcCj4gLQlib29s
IHBhc3MgPSByZXBvcnQoY2hfZXJyICYmIGNoX3ZhbCwgZm10LCAjI19fVkFfQVJHU19fKTsJCQkJ
CQlcCj4gLQkJCQkJCQkJCQkJCQkJXAo+IC0JaWYgKCFwYXNzKQkJCQkJCQkJCQkJCVwKPiAtCQly
ZXBvcnRfaW5mbyhmbXQgIjogZXhwZWN0ZWQgKGVycm9yOiAlbGQsIHZhbHVlOiAlbGQpLCByZWNl
aXZlZDogKGVycm9yOiAlbGQsIHZhbHVlICVsZCkiLAlcCj4gLQkJCSAgICAjI19fVkFfQVJHU19f
LCBleF9lcnIsIGV4X3ZhbCwgKHJldCktPmVycm9yLCAocmV0KS0+dmFsdWUpOwkJCQlcCj4gLQkJ
CQkJCQkJCQkJCQkJXAo+IC0JcGFzczsJCQkJCQkJCQkJCQkJXAo+IC19KQo+IC0KPiAtI2RlZmlu
ZSBzYmlyZXRfY2hlY2socmV0LCBleHBlY3RlZF9lcnJvciwgZXhwZWN0ZWRfdmFsdWUpIFwKPiAt
CXNiaXJldF9yZXBvcnQocmV0LCBleHBlY3RlZF9lcnJvciwgZXhwZWN0ZWRfdmFsdWUsICJjaGVj
ayBzYmkuZXJyb3IgYW5kIHNiaS52YWx1ZSIpCj4gLQo+ICBzdGF0aWMgdm9pZCBjaGVja19iYXNl
KHZvaWQpCj4gIHsKPiAgCXN0cnVjdCBzYmlyZXQgcmV0OwoKUmV2aWV3ZWQtYnk6IENsw6ltZW50
IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KClRoYW5rcywKCkNsw6ltZW50CgotLSAKa3Zt
LXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
