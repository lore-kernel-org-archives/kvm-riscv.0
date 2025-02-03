Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDE1C02192
	for <kvm-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 09:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HoncHp9nTXI8NmqZHlj3E6vk92OSPvjwWWDRawR3vUU=; b=wAduakbnTaGWTT
	8VtU8MWt5BNNf8PBDnw5G6p2uA4VMgvFjgXo9lxgw34Ueug35lVYYes1LUpY5DTuHY6ZajukuO0PO
	ar/chotyU/qyVOFd9XS1NnOaA3uapWk62k/uWfwDWuAyKMCv0bR84nwF65ygYbgRQX7Ical5qTsAP
	yqSipoH2MWnNG6SdzpmFERm/KCmBHd1oyDt0hjB6r5fcmCcyVxvmHyprhdBTwEYOX4pT0ecR77kQ0
	C2fL1kFf5rfRe5UQO545CD4/9N8C4YttGtYF3xkpAoxVDpoDuPkIxWp1skkNVSU4lUSTpJA33mqx/
	h5QtStT66tOX/tx7HorA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tesJw-0000000EvuG-1639;
	Mon, 03 Feb 2025 09:00:44 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesJu-0000000EvtT-1SIF
	for kvm-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 09:00:43 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3863c36a731so3205129f8f.1
        for <kvm-riscv@lists.infradead.org>; Mon, 03 Feb 2025 01:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738573241; x=1739178041; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=47BYIdFLs9BQTY32Uqj7TVIdtbzXjzluDatUEDyrEhQ=;
        b=tSU4Chrfdseok3YO1FAPcpcz5HKKuk/p/XQhsaDLNYIhQ1kE4fF+BFZAG+KwqfhTgf
         73QeVpIKKRYkGzPyBtsmXFsxCR+nQMjWds9qxc5hwGvbMAlYj/DWktImtUZIetCr0mIs
         a672jaiJ/1dWQLskC4FTvvrRsmS1Uf25Ze8Nh0+Whw3Y5wtzuraoS77FyFA8fxL3fQpQ
         TkAqijTS5A3224KsFpJuRk2SM7oLnYOZ9sYUNZ2lk2qe0zoueo7CuwZElhq4gGx365Mz
         b6NUUbp+8XFmGlV1IrdUN+dMCPHIm05XYB0FPXuBBelplKnnr21u0aWijCfFE7t2/Q7O
         D4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738573241; x=1739178041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47BYIdFLs9BQTY32Uqj7TVIdtbzXjzluDatUEDyrEhQ=;
        b=pwx9k9FZEybMtLJUSnPdANza3NY7zEsYDxnG5mML91f8j20mk1nQKbcrmmzncqfy/j
         K6vYKTmKh8IBvHpTouqO+n4TblSgHEz3IzY9ZIDyhiVbZSuwhJd/sgLEKun9whDQAJjN
         Bxj4xlNueRPmV2kPB0/hqkBfuoJIuugPo/f340a8HcK0YjhPJSJmnKMUkfZh+RhTs3mj
         wwf0GyZiZbUlM7AbTEWczyDF2NvS3AF9/BDGs1Oc0/AEOxkyAwjk5M/P7ZNFVFgl3LH5
         PeDr4mHBZaGzoHm+0rUiuK6mzvT+lXIFOHdL3RvP2+jQAm3POEBB4AxTizzgDd218XSa
         RTYw==
X-Forwarded-Encrypted: i=1; AJvYcCUByKBt5t4f+k1p7EgVI0dDxjZ9NuUnlFKLAtoy4id50g8DMH4quDf2d5ZCM8Qe/WAphMeGPUKv/ew=@lists.infradead.org
X-Gm-Message-State: AOJu0YxEn8EaUYX1YOrU3r3bYvBY9XOczTTHVRgHds9cQs8Hs74JaqvG
	Pu9bunlEGFrSoHWWWl5bKzKbsY4d4FfTL0ZCBn3+Gjc7dc3aeSlKUqAEBNd50Ap7gyPrYd70Ccp
	E3tw=
X-Gm-Gg: ASbGncsXJayL/QWH8sAxNyEozs/qeFY/6gZhKhM1YfOQx1F69Qf4oxO9T+67rId3Bjg
	av+WM3TtJ0dHNSX1qZrmPkjufgzoMtnrC8tS1I0ibu9vXxATqRpfxyVtRueW5t1mNVIANpkHxlv
	h10cU7SHsH9PKFmrsl+F1+3wP9Z6Wr/Xpugg/uBoV1fzAHK8OdLInHY2Q9R/q14ZGDQ8C4c/hDt
	rPNOpoGG51ZfaN/il7afYa56cqtQOuvxdkuu0ppgFH+2iL4jyfa7hP2vvn/ePVQSlLF5IfQFbjo
	zqo7J8KhAyoUhhK4SekZ0sfn/MSzuIZNFZsg/Bgg8/hVyZU45TQSaQ1qHvVk
X-Google-Smtp-Source: AGHT+IGvCwqo03idkL9inJEuFXx0yWyV93Vm66b1lQ5CYaF6DR05e3ZCSR4veU7Dg/iD4W+WvFTPoA==
X-Received: by 2002:a05:6000:1842:b0:38c:5e03:5d9 with SMTP id ffacd0b85a97d-38c5e0309bcmr12406828f8f.16.1738573240662;
        Mon, 03 Feb 2025 01:00:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc26cefsm182077245e9.13.2025.02.03.01.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 01:00:40 -0800 (PST)
Message-ID: <29b93378-e219-4c46-8cf9-270d06f8b843@rivosinc.com>
Date: Mon, 3 Feb 2025 10:00:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 3/3] riscv: sbi: Add sbiret_report_error
To: Andrew Jones <andrew.jones@linux.dev>, kvm-riscv@lists.infradead.org
Cc: jamestiotio@gmail.com, Atish Patra <atishp@rivosinc.com>
References: <20250129170138.174222-5-andrew.jones@linux.dev>
 <20250129170138.174222-8-andrew.jones@linux.dev>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250129170138.174222-8-andrew.jones@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_010042_383682_9C3E369B 
X-CRM114-Status: GOOD (  13.35  )
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

CgpPbiAyOS8wMS8yMDI1IDE4OjAxLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gQW4gc2JpcmV0IHZh
bHVlIG1heSBiZSB1bnNwZWNpZmllZCBpbiB0aGUgY2FzZSBvZiBlcnJvcnMsIGFuZCBldmVuIGlu
Cj4gdGhlIGNhc2Ugb2Ygc3VjY2VzcyB3aGVuIHRoZSBmdW5jdGlvbiBkb2Vzbid0IHJldHVybiBh
bnl0aGluZy4KPiBQcm92aWRlIGFuIHNiaXJldCByZXBvcnQgZnVuY3Rpb24gdGhhdCBvbmx5IGNo
ZWNrcyBzYmlyZXQuZXJyb3IuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEpvbmVzIDxhbmRy
ZXcuam9uZXNAbGludXguZGV2Pgo+IC0tLQo+ICByaXNjdi9zYmktdGVzdHMuaCB8IDE1ICsrKysr
KysrKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcmlzY3Yvc2JpLXRlc3RzLmggYi9yaXNjdi9zYmktdGVz
dHMuaAo+IGluZGV4IDJiZGM5NDQwZDgyZC4uZjZlNjQ2YTc5ZGJlIDEwMDY0NAo+IC0tLSBhL3Jp
c2N2L3NiaS10ZXN0cy5oCj4gKysrIGIvcmlzY3Yvc2JpLXRlc3RzLmgKPiBAQCAtMzYsMjAgKzM2
LDI5IEBACj4gICNpZm5kZWYgX19BU1NFTUJMWV9fCj4gICNpbmNsdWRlIDxhc20vc2JpLmg+Cj4g
IAo+IC0jZGVmaW5lIHNiaXJldF9yZXBvcnQocmV0LCBleHBlY3RlZF9lcnJvciwgZXhwZWN0ZWRf
dmFsdWUsIGZtdCwgLi4uKSAoewkJCQkJCVwKPiArI2RlZmluZSBfX3NiaXJldF9yZXBvcnQocmV0
LCBleHBlY3RlZF9lcnJvciwgZXhwZWN0ZWRfdmFsdWUsIGhhc192YWx1ZSwgZm10LCAuLi4pICh7
CQkJCVwKPiAgCWxvbmcgZXhfZXJyID0gZXhwZWN0ZWRfZXJyb3I7CQkJCQkJCQkJCVwKPiAgCWxv
bmcgZXhfdmFsID0gZXhwZWN0ZWRfdmFsdWU7CQkJCQkJCQkJCVwKPiAgCWJvb2wgY2hfZXJyID0g
KHJldCktPmVycm9yID09IGV4X2VycjsJCQkJCQkJCQlcCj4gIAlib29sIGNoX3ZhbCA9IChyZXQp
LT52YWx1ZSA9PSBleF92YWw7CQkJCQkJCQkJXAo+IC0JYm9vbCBwYXNzID0gcmVwb3J0KGNoX2Vy
ciAmJiBjaF92YWwsIGZtdCwgIyNfX1ZBX0FSR1NfXyk7CQkJCQkJXAo+ICsJYm9vbCBwYXNzID0g
cmVwb3J0KGNoX2VyciAmJiAoIShoYXNfdmFsdWUpIHx8IGNoX3ZhbCksIGZtdCwgIyNfX1ZBX0FS
R1NfXyk7CQkJCVwKCk5pdDogSSB3b3VsZCBoYXZlIG1vdmVkIHRoZSBoYXNfdmFsdWUgY2hlY2sg
aW4gdGhlIGNoX3ZhbCBib29sIGJ1dCBJJ20KZ29vZCB3aXRoIGJvdGggd2F5LgoKPiAgCQkJCQkJ
CQkJCQkJCQlcCj4gLQlpZiAoIXBhc3MpCQkJCQkJCQkJCQkJXAo+ICsJaWYgKCFwYXNzICYmICho
YXNfdmFsdWUpKQkJCQkJCQkJCQlcCj4gIAkJcmVwb3J0X2luZm8oZm10ICI6IGV4cGVjdGVkIChl
cnJvcjogJWxkLCB2YWx1ZTogJWxkKSwgcmVjZWl2ZWQ6IChlcnJvcjogJWxkLCB2YWx1ZSAlbGQp
IiwJXAo+ICAJCQkgICAgIyNfX1ZBX0FSR1NfXywgZXhfZXJyLCBleF92YWwsIChyZXQpLT5lcnJv
ciwgKHJldCktPnZhbHVlKTsJCQkJXAo+ICsJZWxzZSBpZiAoIXBhc3MpCQkJCQkJCQkJCQkJXAo+
ICsJCXJlcG9ydF9pbmZvKGZtdCAiOiBleHBlY3RlZCAoZXJyb3I6ICVsZCksIHJlY2VpdmVkOiAo
ZXJyb3I6ICVsZCkiLAkJCQlcCj4gKwkJCSAgICAjI19fVkFfQVJHU19fLCBleF9lcnIsIChyZXQp
LT5lcnJvcik7CQkJCQkJXAo+ICAJCQkJCQkJCQkJCQkJCVwKPiAgCXBhc3M7CQkJCQkJCQkJCQkJ
CVwKPiAgfSkKPiAgCj4gKyNkZWZpbmUgc2JpcmV0X3JlcG9ydChyZXQsIGV4cGVjdGVkX2Vycm9y
LCBleHBlY3RlZF92YWx1ZSwgLi4uKSBcCj4gKwlfX3NiaXJldF9yZXBvcnQocmV0LCBleHBlY3Rl
ZF9lcnJvciwgZXhwZWN0ZWRfdmFsdWUsIHRydWUsIF9fVkFfQVJHU19fKQo+ICsKPiArI2RlZmlu
ZSBzYmlyZXRfcmVwb3J0X2Vycm9yKHJldCwgZXhwZWN0ZWRfZXJyb3IsIC4uLikgXAo+ICsJX19z
YmlyZXRfcmVwb3J0KHJldCwgZXhwZWN0ZWRfZXJyb3IsIDAsIGZhbHNlLCBfX1ZBX0FSR1NfXykK
PiArCj4gICNkZWZpbmUgc2JpcmV0X2NoZWNrKHJldCwgZXhwZWN0ZWRfZXJyb3IsIGV4cGVjdGVk
X3ZhbHVlKSBcCj4gIAlzYmlyZXRfcmVwb3J0KHJldCwgZXhwZWN0ZWRfZXJyb3IsIGV4cGVjdGVk
X3ZhbHVlLCAiY2hlY2sgc2JpLmVycm9yIGFuZCBzYmkudmFsdWUiKQo+ICAKClRlc3RlZC1ieTog
Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQ2zDqW1l
bnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoKVGhhbmtzLAoKQ2zDqW1lbnQKCi0tIApr
dm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
