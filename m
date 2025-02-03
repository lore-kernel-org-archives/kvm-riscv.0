Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF5AC02193
	for <kvm-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 08:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gvxNhpHdQhFjpmfKeHTB68fDn3ZnAd3G7zP9dRaLEtM=; b=4ssL4HXU/QNj6I
	bO6vU4jnq7Ic5wtHznJjNHd+IzbtREkNv79uAob7YqILICIivDfral/88AV309FukKwDVEIZO+UVW
	0vJ0J3gVtmUuuMIF1ZFSbBxv9xg15PXKGAt1re7GYVhmGUxU8yCsvDjRlcRDJnZM95CMtt2CsI5ZG
	3NHgSloFvOn/m3PO/2Dn2+Su77xHUSIR9VzACZZ/UM8yvXUk/ZeDAlemKwOounL5vx4UFCj82KKBc
	ATbuM4GnFlyt/4dROF2noq2XgDtngWhvwlnxL7phR16vaRNNPm4ZT1rTCmkEQlQpqanR9osuRz0JQ
	ZgEFy7szpeIDea+PsS/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tesHC-0000000EvWR-1hMz;
	Mon, 03 Feb 2025 08:57:54 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesH9-0000000EvVy-42gb
	for kvm-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 08:57:53 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso28745805e9.1
        for <kvm-riscv@lists.infradead.org>; Mon, 03 Feb 2025 00:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738573070; x=1739177870; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JQkQ1Ztd0dZlMcWi3Nz+OLBKLCFYYYNAQ/BR0QA4J0w=;
        b=FGw82mLXKTzuUHWZzQ9GmE3LuEelG24e+sfHhZnNMx70XGWe7dPrZiU5j4pWue5zcK
         T3/uKb+nOvRIXxp+iudMAvIU6Bg2TaQfoKEt3lm1ohicEEaVLJndHf4IhpNM0hKIfxgf
         6ylyKffkA/yOtXagHURDIVDOkP42jhJ1UnkJ9/SgrxxbGJ/xQ9AV/f7m37iuJu4Fta2v
         7Ueu9mOQymetTJ+uY9RTBasjbPqUaPeasmzXkNFwuKthDe0gGTf+4GX77LEeOkZOE/Vg
         G0vDNzafG0CDzFVz4sMrrDyFM2Resv1CwqRIHqOTfvFgCeXoDiz8OyRoVkGl+6gGgHsX
         73Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738573070; x=1739177870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JQkQ1Ztd0dZlMcWi3Nz+OLBKLCFYYYNAQ/BR0QA4J0w=;
        b=WjhslIDiN3SvkAXPqQY6/qtMV/k4kBbu1p8lns/k3Rp1LpeK3sKJY+jA4BoyJ/8So6
         QQFd18igCONO3TLzQVWEz4UKItNAKZwtP6XfJpqslvvU40MAyPFonHhbxRdOiXa9URle
         U5y9L5oq4v9JVJ4w2hL6g1OnfME7xOhbfS76uSzqbIJ4RC8O8kn9Q7jFKqoDqd5Tt1BT
         XpI/IUuEyLfC9GnatGK36yN2V5YIkM9i7FYo5hZULUyHWUCTqnWSOPp3Gr97PFN63v94
         vKnj9y5uHXAOjI5d/6R69gjbZ8cHz2e/00MK3685iSeBGSTmxkyiQ6yhFC77LUpK+l/O
         wZ1A==
X-Forwarded-Encrypted: i=1; AJvYcCVaWL/sZvUdV8+1lj+/eMgA/OQUiw/GOyAhCF0ytMszs7iD13qci3QnS2oxqURhhxuwg2ShI6h3VkY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzO2DeZP03tBAYYnGfrKIceFvjawvSyJL9gInt+1IdsJGzkjcrN
	ts6L1s0G+FSQesLMM5ewOt8k5hrAMTu9AE72GLtmJnY0plFHQ0CKBm6x1RQ3c3Y=
X-Gm-Gg: ASbGnct7PJSXcTCzv8UMsW+aZ2R+Ni5g7v8abW3vUHTbChogfwFet1PeqaPYo6hQTx8
	w8rPyqb97jVoPiAD6dpC/uAL5updO5gL/kXWiBIlZ3WAFpTl15sFkXMnAUAaOR53RSpABtGRaYy
	/rfy1hvLoL6x+n0LncEQmV33bD6t0wDJwrHu3SPHbAK7iagv5xOi/prX+r0WCsaTwbN/lltjFR7
	zJp1sKW71d8j1uFnu/pjEJYUMpYGiTIYm/6rRiAdWLTJ7PvFuWoQSRJSLxETf9uVb1CDxcntOKy
	HIUsj8t4nkgms372NEraFrpHR5VYvPDxNVo4LdDdtg3bvvD4zj3rjUBsv+54
X-Google-Smtp-Source: AGHT+IH25mV7CptgvZxlx9l6NnWQSbCZXUTeFjo99Zl3xxnaYA+vcTth449Myt7uTDShxpCdDp2HWg==
X-Received: by 2002:a05:600c:4e52:b0:434:9dfe:20e6 with SMTP id 5b1f17b1804b1-438dc3fc2b0mr172572055e9.23.1738573070343;
        Mon, 03 Feb 2025 00:57:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc1317fsm185119295e9.8.2025.02.03.00.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 00:57:49 -0800 (PST)
Message-ID: <1e4b6e91-b5c6-48b4-a80d-163d89ae29da@rivosinc.com>
Date: Mon, 3 Feb 2025 09:57:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 1/3] riscv: sbi: Improve gen_report
To: Andrew Jones <andrew.jones@linux.dev>, kvm-riscv@lists.infradead.org
Cc: jamestiotio@gmail.com, Atish Patra <atishp@rivosinc.com>
References: <20250129170138.174222-5-andrew.jones@linux.dev>
 <20250129170138.174222-6-andrew.jones@linux.dev>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250129170138.174222-6-andrew.jones@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_005752_000337_8E581B3D 
X-CRM114-Status: GOOD (  21.14  )
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

SGV5IEFuZHJldywKCldoaWxlIHVzaW5nIGl0LCBJIHdvbmRlcmVkIGlmIGl0IHdvdWxkIGJlIGhl
bHBmdWwgdG8gZGlzcGxheSB0aGUKZXhwZWN0ZWQgcmV0dXJuIHZhbHVlIGV2ZW4gaW4gdGhlIGNh
c2UgaXQgd2FzIHN1Y2Nlc3NmdWwgYW5kIG9ubHkKZGlzcGxheSB0aGUgcmV0dXJuIHZhbHVlIGlm
IGl0IHdhcyBkaWZmZXJlbnQuIEkgZmVlbCBsaWtlIGl0IGF2b2lkIHRoZQpuZWVkIHRvIHNwZWNp
ZnkgaXQgaW4gdGhlIHJlcG9ydGVkIHN0cmluZywgZm9yIGluc3RhbmNlLAoKSSBoYXZlIGEgZmV3
ICJ0ZXN0IGZvbyBubyBlcnJvciIgb3IgInRlc3QgaW52YWxpZCBldmVudCBpZCAweDAiLiBTbyB0
aGF0CmRpc3BsYXlpbmcgdGhlbSBsaWtlOgoKInRlc3QgZm9vOiBTQklfU1VDQ0VTUyIKInRlc3Qg
ZXZlbnQgaWQgMHgwOiBTQklfSU5WQUxJRF9QQVJBTSIKCmNvdWxkIGJlIGJldHRlci4gQnV0IHRo
YXQncyBvbmx5IGEgcGVyc29uYWwgdGFzdGUuCkFueXdheSwgSSB1c2VkIHRoZXNlIG1hY3JvcyBh
bmQgaXQgd29ya3MgaGFzIGV4cGVjdGVkOgoKVGVzdGVkLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNs
ZWdlckByaXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckBy
aXZvc2luYy5jb20+CgpUaGFua3MsCgpDbMOpbWVudAoKCk9uIDI5LzAxLzIwMjUgMTg6MDEsIEFu
ZHJldyBKb25lcyB3cm90ZToKPiBNYWtlIHNldmVyYWwgaW1wcm92ZW1lbnRzIHRvIGdlbl9yZXBv
cnQoKSwgc3RhcnRpbmcgYnkgcmVuYW1pbmcgaXQKPiB0byBzb21ldGhpbmcgbGVzcyBnZW5lcmlj
IChzYmlyZXRfcmVwb3J0KSBhbmQgdGhlbiwgaW5zdGVhZCBvZgo+IHJlbHlpbmcgb24gcmVwb3J0
IHByZWZpeCB0byBsaW5rIHRoZSByZXBvcnRfaW5mbyB3aXRoIHRoZSB1bmV4cGVjdGVkCj4gcmV0
dXJuIHZhbHVlcyB0byB0aGUgZmFpbGVkIHRlc3QsIHVzZSB0aGUgdGVzdCBzdHJpbmcgaXRzZWxm
LCBieQo+IHRha2luZyBpdCBhcyBhIHBhcmFtZXRlci4gQW5kLCByZXBvcnRpbmcgc2JpcmV0LmVy
cm9yIGFuZAo+IHNiaXJldC52YWx1ZSBzZXBhcmF0ZWx5IHdhcyBtb3JlIHZlcmJvc2UgdGhhbiBu
ZWNlc3Nhcnkgc2luY2UgdGhlCj4gcmVwb3J0X2luZm8gY2FuIGJlIHVzZWQgdG8gc2VlIHdoaWNo
IG9uZSBmYWlsZWQsIHNvIGNvbWJpbmUgdGhlbS4KPiBGaW5hbGx5LCByZXR1cm4gdGhlIHBhc3Mv
ZmFpbCByZXN1bHQgb2YgdGhlIHRlc3QgaW4gY2FzZSBhIGNhbGxlcgo+IHdhbnRzIHRvIHVzZSBp
dC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFuZHJldy5qb25lc0BsaW51eC5k
ZXY+Cj4gLS0tCj4gIHJpc2N2L3NiaS5jIHwgNDUgKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAy
MSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcmlzY3Yvc2JpLmMgYi9yaXNjdi9zYmku
Ywo+IGluZGV4IDZmNGRkYWYxM2RmMy4uOWY1OTFmOGZmNzZhIDEwMDY0NAo+IC0tLSBhL3Jpc2N2
L3NiaS5jCj4gKysrIGIvcmlzY3Yvc2JpLmMKPiBAQCAtMTU2LDE5ICsxNTYsMjIgQEAgc3RhdGlj
IGJvb2wgZ2V0X2ludmFsaWRfYWRkcihwaHlzX2FkZHJfdCAqcGFkZHIsIGJvb2wgYWxsb3dfZGVm
YXVsdCkKPiAgCXJldHVybiBmYWxzZTsKPiAgfQo+ICAKPiAtc3RhdGljIHZvaWQgZ2VuX3JlcG9y
dChzdHJ1Y3Qgc2JpcmV0ICpyZXQsCj4gLQkJICAgICAgIGxvbmcgZXhwZWN0ZWRfZXJyb3IsIGxv
bmcgZXhwZWN0ZWRfdmFsdWUpCj4gLXsKPiAtCWJvb2wgY2hlY2tfZXJyb3IgPSByZXQtPmVycm9y
ID09IGV4cGVjdGVkX2Vycm9yOwo+IC0JYm9vbCBjaGVja192YWx1ZSA9IHJldC0+dmFsdWUgPT0g
ZXhwZWN0ZWRfdmFsdWU7Cj4gLQo+IC0JaWYgKCFjaGVja19lcnJvciB8fCAhY2hlY2tfdmFsdWUp
Cj4gLQkJcmVwb3J0X2luZm8oImV4cGVjdGVkIChlcnJvcjogJWxkLCB2YWx1ZTogJWxkKSwgcmVj
ZWl2ZWQ6IChlcnJvcjogJWxkLCB2YWx1ZSAlbGQpIiwKPiAtCQkJICAgIGV4cGVjdGVkX2Vycm9y
LCBleHBlY3RlZF92YWx1ZSwgcmV0LT5lcnJvciwgcmV0LT52YWx1ZSk7Cj4gLQo+IC0JcmVwb3J0
KGNoZWNrX2Vycm9yLCAiZXhwZWN0ZWQgc2JpLmVycm9yIik7Cj4gLQlyZXBvcnQoY2hlY2tfdmFs
dWUsICJleHBlY3RlZCBzYmkudmFsdWUiKTsKPiAtfQo+ICsjZGVmaW5lIHNiaXJldF9yZXBvcnQo
cmV0LCBleHBlY3RlZF9lcnJvciwgZXhwZWN0ZWRfdmFsdWUsIGZtdCwgLi4uKSAoewkJCQkJCVwK
PiArCWxvbmcgZXhfZXJyID0gZXhwZWN0ZWRfZXJyb3I7CQkJCQkJCQkJCVwKPiArCWxvbmcgZXhf
dmFsID0gZXhwZWN0ZWRfdmFsdWU7CQkJCQkJCQkJCVwKPiArCWJvb2wgY2hfZXJyID0gKHJldCkt
PmVycm9yID09IGV4X2VycjsJCQkJCQkJCQlcCj4gKwlib29sIGNoX3ZhbCA9IChyZXQpLT52YWx1
ZSA9PSBleF92YWw7CQkJCQkJCQkJXAo+ICsJYm9vbCBwYXNzID0gcmVwb3J0KGNoX2VyciAmJiBj
aF92YWwsIGZtdCwgIyNfX1ZBX0FSR1NfXyk7CQkJCQkJXAo+ICsJCQkJCQkJCQkJCQkJCVwKPiAr
CWlmICghcGFzcykJCQkJCQkJCQkJCQlcCj4gKwkJcmVwb3J0X2luZm8oZm10ICI6IGV4cGVjdGVk
IChlcnJvcjogJWxkLCB2YWx1ZTogJWxkKSwgcmVjZWl2ZWQ6IChlcnJvcjogJWxkLCB2YWx1ZSAl
bGQpIiwJXAo+ICsJCQkgICAgIyNfX1ZBX0FSR1NfXywgZXhfZXJyLCBleF92YWwsIChyZXQpLT5l
cnJvciwgKHJldCktPnZhbHVlKTsJCQkJXAo+ICsJCQkJCQkJCQkJCQkJCVwKPiArCXBhc3M7CQkJ
CQkJCQkJCQkJCVwKPiArfSkKPiArCj4gKyNkZWZpbmUgc2JpcmV0X2NoZWNrKHJldCwgZXhwZWN0
ZWRfZXJyb3IsIGV4cGVjdGVkX3ZhbHVlKSBcCj4gKwlzYmlyZXRfcmVwb3J0KHJldCwgZXhwZWN0
ZWRfZXJyb3IsIGV4cGVjdGVkX3ZhbHVlLCAiY2hlY2sgc2JpLmVycm9yIGFuZCBzYmkudmFsdWUi
KQo+ICAKPiAgc3RhdGljIHZvaWQgY2hlY2tfYmFzZSh2b2lkKQo+ICB7Cj4gQEAgLTE4NCw3ICsx
ODcsNyBAQCBzdGF0aWMgdm9pZCBjaGVja19iYXNlKHZvaWQpCj4gIAkJZXhwZWN0ZWQgPSAobG9u
ZylzdHJ0b3VsKGdldGVudigiU0JJX1NQRUNfVkVSU0lPTiIpLCBOVUxMLCAwKTsKPiAgCQlhc3Nl
cnRfbXNnKCEoZXhwZWN0ZWQgJiBCSVQoMzEpKSwgIlNCSSBzcGVjIHZlcnNpb24gYml0IDMxIG11
c3QgYmUgemVybyIpOwo+ICAJCWFzc2VydF9tc2coX19yaXNjdl94bGVuID09IDMyIHx8ICEoZXhw
ZWN0ZWQgPj4gMzIpLCAiU0JJIHNwZWMgdmVyc2lvbiBiaXRzIGdyZWF0ZXIgdGhhbiAzMSBtdXN0
IGJlIHplcm8iKTsKPiAtCQlnZW5fcmVwb3J0KCZyZXQsIDAsIGV4cGVjdGVkKTsKPiArCQlzYmly
ZXRfY2hlY2soJnJldCwgMCwgZXhwZWN0ZWQpOwo+ICAJfQo+ICAJcmVwb3J0X3ByZWZpeF9wb3Ao
KTsKPiAgCj4gQEAgLTE5OSw3ICsyMDIsNyBAQCBzdGF0aWMgdm9pZCBjaGVja19iYXNlKHZvaWQp
Cj4gIAlpZiAoZW52X29yX3NraXAoIlNCSV9JTVBMX0lEIikpIHsKPiAgCQlleHBlY3RlZCA9IChs
b25nKXN0cnRvdWwoZ2V0ZW52KCJTQklfSU1QTF9JRCIpLCBOVUxMLCAwKTsKPiAgCQlyZXQgPSBz
YmlfYmFzZShTQklfRVhUX0JBU0VfR0VUX0lNUF9JRCwgMCk7Cj4gLQkJZ2VuX3JlcG9ydCgmcmV0
LCAwLCBleHBlY3RlZCk7Cj4gKwkJc2JpcmV0X2NoZWNrKCZyZXQsIDAsIGV4cGVjdGVkKTsKPiAg
CX0KPiAgCXJlcG9ydF9wcmVmaXhfcG9wKCk7Cj4gIAo+IEBAIC0yMDcsMTcgKzIxMCwxNyBAQCBz
dGF0aWMgdm9pZCBjaGVja19iYXNlKHZvaWQpCj4gIAlpZiAoZW52X29yX3NraXAoIlNCSV9JTVBM
X1ZFUlNJT04iKSkgewo+ICAJCWV4cGVjdGVkID0gKGxvbmcpc3RydG91bChnZXRlbnYoIlNCSV9J
TVBMX1ZFUlNJT04iKSwgTlVMTCwgMCk7Cj4gIAkJcmV0ID0gc2JpX2Jhc2UoU0JJX0VYVF9CQVNF
X0dFVF9JTVBfVkVSU0lPTiwgMCk7Cj4gLQkJZ2VuX3JlcG9ydCgmcmV0LCAwLCBleHBlY3RlZCk7
Cj4gKwkJc2JpcmV0X2NoZWNrKCZyZXQsIDAsIGV4cGVjdGVkKTsKPiAgCX0KPiAgCXJlcG9ydF9w
cmVmaXhfcG9wKCk7Cj4gIAo+ICAJcmVwb3J0X3ByZWZpeF9wdXNoKCJwcm9iZV9leHQiKTsKPiAg
CWV4cGVjdGVkID0gZ2V0ZW52KCJTQklfUFJPQkVfRVhUIikgPyAobG9uZylzdHJ0b3VsKGdldGVu
digiU0JJX1BST0JFX0VYVCIpLCBOVUxMLCAwKSA6IDE7Cj4gIAlyZXQgPSBzYmlfYmFzZShTQklf
RVhUX0JBU0VfUFJPQkVfRVhULCBTQklfRVhUX0JBU0UpOwo+IC0JZ2VuX3JlcG9ydCgmcmV0LCAw
LCBleHBlY3RlZCk7Cj4gKwlzYmlyZXRfY2hlY2soJnJldCwgMCwgZXhwZWN0ZWQpOwo+ICAJcmVw
b3J0X3ByZWZpeF9wdXNoKCJ1bmF2YWlsYWJsZSIpOwo+ICAJcmV0ID0gc2JpX2Jhc2UoU0JJX0VY
VF9CQVNFX1BST0JFX0VYVCwgMHhiMDAwMDAwKTsKPiAtCWdlbl9yZXBvcnQoJnJldCwgMCwgMCk7
Cj4gKwlzYmlyZXRfY2hlY2soJnJldCwgMCwgMCk7Cj4gIAlyZXBvcnRfcHJlZml4X3BvcG4oMik7
Cj4gIAo+ICAJcmVwb3J0X3ByZWZpeF9wdXNoKCJtdmVuZG9yaWQiKTsKPiBAQCAtMjI1LDcgKzIy
OCw3IEBAIHN0YXRpYyB2b2lkIGNoZWNrX2Jhc2Uodm9pZCkKPiAgCQlleHBlY3RlZCA9IChsb25n
KXN0cnRvdWwoZ2V0ZW52KCJNVkVORE9SSUQiKSwgTlVMTCwgMCk7Cj4gIAkJYXNzZXJ0KF9fcmlz
Y3ZfeGxlbiA9PSAzMiB8fCAhKGV4cGVjdGVkID4+IDMyKSk7Cj4gIAkJcmV0ID0gc2JpX2Jhc2Uo
U0JJX0VYVF9CQVNFX0dFVF9NVkVORE9SSUQsIDApOwo+IC0JCWdlbl9yZXBvcnQoJnJldCwgMCwg
ZXhwZWN0ZWQpOwo+ICsJCXNiaXJldF9jaGVjaygmcmV0LCAwLCBleHBlY3RlZCk7Cj4gIAl9Cj4g
IAlyZXBvcnRfcHJlZml4X3BvcCgpOwo+ICAKPiBAQCAtMjMzLDcgKzIzNiw3IEBAIHN0YXRpYyB2
b2lkIGNoZWNrX2Jhc2Uodm9pZCkKPiAgCWlmIChlbnZfb3Jfc2tpcCgiTUFSQ0hJRCIpKSB7Cj4g
IAkJZXhwZWN0ZWQgPSAobG9uZylzdHJ0b3VsKGdldGVudigiTUFSQ0hJRCIpLCBOVUxMLCAwKTsK
PiAgCQlyZXQgPSBzYmlfYmFzZShTQklfRVhUX0JBU0VfR0VUX01BUkNISUQsIDApOwo+IC0JCWdl
bl9yZXBvcnQoJnJldCwgMCwgZXhwZWN0ZWQpOwo+ICsJCXNiaXJldF9jaGVjaygmcmV0LCAwLCBl
eHBlY3RlZCk7Cj4gIAl9Cj4gIAlyZXBvcnRfcHJlZml4X3BvcCgpOwo+ICAKPiBAQCAtMjQxLDcg
KzI0NCw3IEBAIHN0YXRpYyB2b2lkIGNoZWNrX2Jhc2Uodm9pZCkKPiAgCWlmIChlbnZfb3Jfc2tp
cCgiTUlNUElEIikpIHsKPiAgCQlleHBlY3RlZCA9IChsb25nKXN0cnRvdWwoZ2V0ZW52KCJNSU1Q
SUQiKSwgTlVMTCwgMCk7Cj4gIAkJcmV0ID0gc2JpX2Jhc2UoU0JJX0VYVF9CQVNFX0dFVF9NSU1Q
SUQsIDApOwo+IC0JCWdlbl9yZXBvcnQoJnJldCwgMCwgZXhwZWN0ZWQpOwo+ICsJCXNiaXJldF9j
aGVjaygmcmV0LCAwLCBleHBlY3RlZCk7Cj4gIAl9Cj4gIAlyZXBvcnRfcHJlZml4X3BvcG4oMik7
Cj4gIH0KCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1y
aXNjdgo=
