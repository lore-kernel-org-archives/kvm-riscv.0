Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2BDE7719C
	for <kvm-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 23:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CQ70Myi8cxojCjyZNOLGjB+5OIWlHmDuyJniqqGn5bw=; b=m6vlXK7vGoogkz
	44HWDD7OsK7ZQjm9zV2Zcgr99Lfw3jEJ1mhGIKvjjbzH6dCYeTxn/0BoctA8cOWhsPTRKU+7uwbsS
	QEc96TgilCyovuWbz3yds8RqdeL+Df+H7P9s84pCw1nR2FLHIE8UhFr7z+2TYQsVceyKQ+63BD2CK
	PLilfJZgkOd8XwrqlfXoUIrB5lxge4Frv3zYtc2UEKE3wLB2hfBpGvSKXFmdcjVk/D7riVKbxcjnw
	p11pcgoxcDqz1efZJWGquXaCxoXe1iP3tW78OsmwdapgpDxvaNTnZr9z9GZOSKXq4pOY/fxQ4cEuZ
	uT21PC7PSHFsCdpx5Z1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWOXr-0000000HHqa-0EB7;
	Fri, 10 Jan 2025 23:36:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWOXp-0000000HHq9-2YHh
	for kvm-riscv@bombadil.infradead.org;
	Fri, 10 Jan 2025 23:36:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CcCPEcTZhVQXmN6oY2VQr5WtuHg5l5fqZdLq8t5bbKs=; b=GUgsezrUyw4ERLwoYHnW03ql8w
	QBvjcvcgEd/lrmdYFhGU5ECbxS1ItoDL83DiIU9240mDYMpBnKimrwB/Ts0t26dhHQ+cO+KMzL1m8
	ouzah2Qn07NMtEi7sy4MOiyDXQp7DrPMoJ65ARO+7kKIPCrdlI7w7vzOLneM8bVpVoabiJX4o9wt1
	D7vL73NF/qS+2k7cj+/wkkogFodMLBC486lm44M9Y8TKnEjYrQZCiX/idPy6UHs1hyPkXCKQ4PBqo
	HddRTOHgZ2PH+ZvYGZNyQwjdzk2RlQGiTX97zBBRSDMUuozDvRKmnO3kUX8AhxZ51qyzuo5BWjwMe
	r701TTJw==;
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWOXm-00000009vsm-1YBc
	for kvm-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 23:36:00 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3ce4b009465so9912965ab.0
        for <kvm-riscv@lists.infradead.org>; Fri, 10 Jan 2025 15:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1736552155; x=1737156955; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:cc:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CcCPEcTZhVQXmN6oY2VQr5WtuHg5l5fqZdLq8t5bbKs=;
        b=Jjf/AVcAPktGOLAPwFLaOHKeQt7712/YCRl/m1PsGgLg9O3NquXOEGmDNoSpk1KYil
         yZR+ETv4KghfZWQ5IT+TGMi/rnHCy7PyShRPc69vFKBW/g0G/5lrJV5/u7ZlfsrwOz/+
         Bj1ZqI49BBVGN5oc07v8IZNa40zvzqnOI6BR6oc34KdjEutF+OSj8PpfUSopuDiSzlyA
         e+7SQ2b/yHS7xPmtcmo3KIV6VUxkhnrgVHoSrq1LMNtCbomKv+uLTke4tDlRnbhIR5Kg
         rZ/UN43p+9q9XuKIXVyRpBRyp5455Ix27Gz10fuJybJJgfmwrixEQrn7MUf67olvc+/5
         cITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736552155; x=1737156955;
        h=content-transfer-encoding:in-reply-to:cc:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CcCPEcTZhVQXmN6oY2VQr5WtuHg5l5fqZdLq8t5bbKs=;
        b=GMPrKuG44dK7p0kCuS9Iw0YIdrerojSivZ+hjZtauWjoR7Iotb1hQupzrdksZn22mr
         ZUHoSFK1EZGiGzzPlH/ubybQJEvu6Jb0owlbTDutn3owj+sZ+MI2rx4K+v+MVs3Di4ZC
         RGH5hBzkncMkxtbbmZKAYoBQd2Jgv91pSfIR4DpBYhE4+ewhtQsL+JnjtqdzScWvkN+y
         so5+0I9+zfKJynS8C/BtHU9XcJgKx1F5Xj04RTReI0EWqt96KVWgATUKTIXLsKZTMVl4
         wz6it55WWQrXnJtY+8I7z9OCzhqSCPZDPRQgZGG77C6zbcBF7qWBK+6gxz4LNV6g2Xfu
         WF4w==
X-Forwarded-Encrypted: i=1; AJvYcCWsrRohwmvLPbU0VdAXuDnqyTP0Ha5gqOLfbTdBCcUKfyJ7CE3su3WtH+jDE6zZeOTAzk39lJJYr6M=@lists.infradead.org
X-Gm-Message-State: AOJu0YzP/ropoAqSyWJNLYDffoT5gwjJLYM3F84dE8ns45uQMAuNH0Jb
	Ko2CCNcRnfJR2pjXWjy9NAa1UEEh4SmVW8fW8LGedTtPlqDymm4RNdGoHc4u818=
X-Gm-Gg: ASbGnctzio7TLlwaAYXuPDwT0G2+zZa5fPM0Ud/cS7Hog/JQD3Ya0mt4HrR56wYcgK9
	lD7ZfPsZH7R9ripMPeMB5Ko0S5+GloxAwKISKlci/wuqBai12hhCNbXx+4bgF5mEIBryz6Fv3NZ
	3SNcNUNCZRiEus/5aOBbBg4CQdrAY07xdLQCXfbuq8x/ixgUnRT8/zawNVERwGHMgcV5E07c7QU
	/56WDGRJBSqjEiBWr0oOugCGk5ojrT0hAKydIbO8spnBG01w0AenoLL51KI02WUvKjFMk5MgUej
	G6z0
X-Google-Smtp-Source: AGHT+IE3UsYQDVqDqz5fOJqR2a0LCCbXCtaGplsbj630vzm92X2koBxsyzguh0JSvTc/R+TUuaX3QA==
X-Received: by 2002:a05:6e02:214f:b0:3a7:e528:6ee6 with SMTP id e9e14a558f8ab-3ce3a888287mr91494995ab.13.1736552155091;
        Fri, 10 Jan 2025 15:35:55 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.9])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea1b62933bsm1148138173.76.2025.01.10.15.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 15:35:54 -0800 (PST)
Message-ID: <fca2a328-f2c4-4df3-9086-06b8a12b8da4@sifive.com>
Date: Fri, 10 Jan 2025 17:35:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] riscv: request misaligned exception delegation from
 SBI
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
References: <20250106154847.1100344-1-cleger@rivosinc.com>
 <20250106154847.1100344-3-cleger@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org
In-Reply-To: <20250106154847.1100344-3-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_233558_528845_5A9D19FD 
X-CRM114-Status: GOOD (  20.24  )
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

SGkgQ2zDqW1lbnQsCgpPbiAyMDI1LTAxLTA2IDk6NDggQU0sIENsw6ltZW50IEzDqWdlciB3cm90
ZToKPiBOb3cgdGhhdCB0aGUga2VybmVsIGNhbiBoYW5kbGUgbWlzYWxpZ25lZCBhY2Nlc3NlcyBp
biBTLW1vZGUsIHJlcXVlc3QKPiBtaXNhbGlnbmVkIGFjY2VzcyBleGNlcHRpb24gZGVsZWdhdGlv
biBmcm9tIFNCSS4gVGhpcyB1c2VzIHRoZSBGV0ZUIFNCSQo+IGV4dGVuc2lvbiBkZWZpbmVkIGlu
IFNCSSB2ZXJzaW9uIDMuMC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNs
ZWdlckByaXZvc2luYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVh
dHVyZS5oICAgICAgICB8ICAxICsKPiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25l
ZC5jICAgICAgIHwgNTkgKysrKysrKysrKysrKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2tlcm5l
bC91bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMgfCAgMiArCj4gIDMgZmlsZXMgY2hhbmdlZCwgNjIg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nw
dWZlYXR1cmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCj4gaW5kZXgg
NGJkMDU0YzU0YzIxLi5jZDQwNmZlMzdkZjggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9jcHVmZWF0dXJlLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZl
YXR1cmUuaAo+IEBAIC02Miw2ICs2Miw3IEBAIHZvaWQgX19pbml0IHJpc2N2X3VzZXJfaXNhX2Vu
YWJsZSh2b2lkKTsKPiAgCV9SSVNDVl9JU0FfRVhUX0RBVEEoX25hbWUsIF9pZCwgX3N1Yl9leHRz
LCBBUlJBWV9TSVpFKF9zdWJfZXh0cyksIF92YWxpZGF0ZSkKPiAgCj4gIGJvb2wgY2hlY2tfdW5h
bGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cyh2b2lkKTsKPiArdm9pZCB1bmFsaWduZWRf
YWNjZXNzX2luaXQodm9pZCk7Cj4gICNpZiBkZWZpbmVkKENPTkZJR19SSVNDVl9TQ0FMQVJfTUlT
QUxJR05FRCkKPiAgdm9pZCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKHN0cnVjdCB3
b3JrX3N0cnVjdCAqd29yayBfX2Fsd2F5c191bnVzZWQpOwo+ICB2b2lkIHVuYWxpZ25lZF9lbXVs
YXRpb25fZmluaXNoKHZvaWQpOwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFw
c19taXNhbGlnbmVkLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKPiBp
bmRleCA3Y2MxMDhhZWQ3NGUuLjRhY2E2MDA1MjdlOSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFw
c19taXNhbGlnbmVkLmMKPiBAQCAtMTYsNiArMTYsNyBAQAo+ICAjaW5jbHVkZSA8YXNtL2VudHJ5
LWNvbW1vbi5oPgo+ICAjaW5jbHVkZSA8YXNtL2h3cHJvYmUuaD4KPiAgI2luY2x1ZGUgPGFzbS9j
cHVmZWF0dXJlLmg+Cj4gKyNpbmNsdWRlIDxhc20vc2JpLmg+Cj4gICNpbmNsdWRlIDxhc20vdmVj
dG9yLmg+Cj4gIAo+ICAjZGVmaW5lIElOU05fTUFUQ0hfTEIJCQkweDMKPiBAQCAtNjg5LDMgKzY5
MCw2MSBAQCBib29sIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9p
ZCkKPiAgCXJldHVybiBmYWxzZTsKPiAgfQo+ICAjZW5kaWYKPiArCj4gKyNpZmRlZiBDT05GSUdf
UklTQ1ZfU0JJCj4gKwo+ICtzdHJ1Y3QgbWlzYWxpZ25lZF9kZWxlZ19yZXEgewo+ICsJYm9vbCBl
bmFibGU7Cj4gKwlpbnQgZXJyb3I7Cj4gK307Cj4gKwo+ICtzdGF0aWMgdm9pZAo+ICtjcHVfdW5h
bGlnbmVkX3NiaV9yZXF1ZXN0X2RlbGVnYXRpb24odm9pZCAqYXJnKQo+ICt7Cj4gKwlzdHJ1Y3Qg
bWlzYWxpZ25lZF9kZWxlZ19yZXEgKnJlcSA9IGFyZzsKPiArCXN0cnVjdCBzYmlyZXQgcmV0Owo+
ICsKPiArCXJldCA9IHNiaV9lY2FsbChTQklfRVhUX0ZXRlQsIFNCSV9FWFRfRldGVF9TRVQsCj4g
KwkJCVNCSV9GV0ZUX01JU0FMSUdORURfRVhDX0RFTEVHLCByZXEtPmVuYWJsZSwgMCwgMCwgMCwg
MCk7Cj4gKwlpZiAocmV0LmVycm9yKQo+ICsJCXJlcS0+ZXJyb3IgPSAxOwo+ICt9Cj4gKwo+ICtz
dGF0aWMgdm9pZCB1bmFsaWduZWRfc2JpX3JlcXVlc3RfZGVsZWdhdGlvbih2b2lkKQo+ICt7Cj4g
KwlzdHJ1Y3QgbWlzYWxpZ25lZF9kZWxlZ19yZXEgcmVxID0ge3RydWUsIDB9Owo+ICsKPiArCW9u
X2VhY2hfY3B1KGNwdV91bmFsaWduZWRfc2JpX3JlcXVlc3RfZGVsZWdhdGlvbiwgJnJlcSwgMSk7
Cj4gKwlpZiAoIXJlcS5lcnJvcikgewo+ICsJCXByX2luZm8oIlNCSSBtaXNhbGlnbmVkIGFjY2Vz
cyBleGNlcHRpb24gZGVsZWdhdGlvbiBva1xuIik7Cj4gKwkJLyoKPiArCQkgKiBOb3RlIHRoYXQg
d2UgZG9uJ3QgaGF2ZSB0byB0YWtlIGFueSBzcGVjaWZpYyBhY3Rpb24gaGVyZSwgaWYKPiArCQkg
KiB0aGUgZGVsZWdhdGlvbiBpcyBzdWNjZXNzZnVsLCB0aGVuCj4gKwkJICogY2hlY2tfdW5hbGln
bmVkX2FjY2Vzc19lbXVsYXRlZCgpIHdpbGwgdmVyaWZ5IHRoYXQgaW5kZWVkIHRoZQo+ICsJCSAq
IHBsYXRmb3JtIHRyYXBzIG9uIG1pc2FsaWduZWQgYWNjZXNzZXMuCj4gKwkJICovCj4gKwkJcmV0
dXJuOwo+ICsJfQo+ICsKPiArCS8qCj4gKwkgKiBJZiBhdCBsZWFzdCBkZWxlZ2F0aW9uIHJlcXVl
c3QgZmFpbGVkIG9uIG9uZSBoYXJ0LCByZXZlcnQgbWlzYWxpZ25lZAo+ICsJICogZGVsZWdhdGlv
biBmb3IgYWxsIGhhcnRzLCBpZiB3ZSBkb24ndCBkbyB0aGF0LCB3ZSdsbCBwYW5pYyBhdAo+ICsJ
ICogbWlzYWxpZ25lZCBkZWxlZ2F0aW9uIGNoZWNrIHRpbWUgKHNlZQo+ICsJICogY2hlY2tfdW5h
bGlnbmVkX2FjY2Vzc19lbXVsYXRlZCgpKS4KPiArCSAqLwo+ICsJcmVxLmVuYWJsZSA9IGZhbHNl
Owo+ICsJcmVxLmVycm9yID0gMDsKPiArCW9uX2VhY2hfY3B1KGNwdV91bmFsaWduZWRfc2JpX3Jl
cXVlc3RfZGVsZWdhdGlvbiwgJnJlcSwgMSk7Cj4gKwlpZiAocmVxLmVycm9yKQo+ICsJCXBhbmlj
KCJGYWlsZWQgdG8gZGlzYWJsZSBtaXNhbGlnbmVkIGRlbGVnYXRpb24gZm9yIGFsbCBDUFVzXG4i
KTsKClRoaXMgbG9naWMgZG9lc24ndCBoYW5kbGUgdGhlIGNhc2Ugd2hlcmUgdGhlIGRlbGVnYXRp
b24gcmVxdWVzdCBmYWlsZWQgb24gZXZlcnkKQ1BVLCBzbyB0aGVyZSdzIG5vdGhpbmcgdG8gcmV2
ZXJ0LiBUaGlzIGNhdXNlcyBhIHBhbmljIGluIGEgS1ZNIGd1ZXN0IGluc2lkZQpxZW11LXNvZnRt
bXUgKHRoZSBob3N0IGtlcm5lbCBkZXRlY3RzIE1JU0FMSUdORURfU0NBTEFSX0ZBU1QsIHNvCnVu
YWxpZ25lZF9jdGxfYXZhaWxhYmxlKCkgcmV0dXJucyBmYWxzZSwgYW5kIGFsbCBGV0ZUIGNhbGxz
IGZhaWwpLgoKUmVnYXJkcywKU2FtdWVsCgo+ICsKPiArfQo+ICsKPiArdm9pZCB1bmFsaWduZWRf
YWNjZXNzX2luaXQodm9pZCkKPiArewo+ICsJaWYgKHNiaV9wcm9iZV9leHRlbnNpb24oU0JJX0VY
VF9GV0ZUKSA+IDApCj4gKwkJdW5hbGlnbmVkX3NiaV9yZXF1ZXN0X2RlbGVnYXRpb24oKTsKPiAr
fQo+ICsjZWxzZQo+ICt2b2lkIHVuYWxpZ25lZF9hY2Nlc3NfaW5pdCh2b2lkKSB7fQo+ICsjZW5k
aWYKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19zcGVl
ZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5jCj4gaW5kZXgg
OTFmMTg5Y2YxNjExLi4xZTMxNjYxMDA4MzcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvdW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdW5h
bGlnbmVkX2FjY2Vzc19zcGVlZC5jCj4gQEAgLTQwMyw2ICs0MDMsOCBAQCBzdGF0aWMgaW50IGNo
ZWNrX3VuYWxpZ25lZF9hY2Nlc3NfYWxsX2NwdXModm9pZCkKPiAgewo+ICAJYm9vbCBhbGxfY3B1
c19lbXVsYXRlZCwgYWxsX2NwdXNfdmVjX3Vuc3VwcG9ydGVkOwo+ICAKPiArCXVuYWxpZ25lZF9h
Y2Nlc3NfaW5pdCgpOwo+ICsKPiAgCWFsbF9jcHVzX2VtdWxhdGVkID0gY2hlY2tfdW5hbGlnbmVk
X2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cygpOwo+ICAJYWxsX2NwdXNfdmVjX3Vuc3VwcG9ydGVk
ID0gY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXMoKTsKPiAg
CgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
