Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7CDE77188
	for <kvm-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 03:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UTKjNDf7bZZIMNAQhn5Bf2NxFAN53l8nTazVfYN9+3o=; b=0Za5BRW3PiUAs9
	Vr+aPmFKtmICF42uFOYBuwLNalee9IwkmCr9QO5HOpyhZkGKT8Lti9bBzp1yqW9gz5pVi+WU8PWv5
	dlUguPL+2W20FHcGV/a+kOz6j4SbCyd70riWV1o04ep9rN1acWJuuosQDddhCTggkQYnv9uxWcmmy
	4aSinu2ZJXqNPBvmZ8OgUM2CosCqIA2NpRpAy64wPagB22Ssepqh2eNaHaujFZvp7t9zJn+32ikNJ
	LGwRwiDvEr84GmSdGOYNs0rQFTHHxn6UqLsj3Z61ATrhOnAe3GhUFnxtBNMHRaGWCFEV3QkuqIH4c
	HyOjAgNDHTdRP2IsOQYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV0H0-00000003JPl-29CL;
	Tue, 07 Jan 2025 03:28:54 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV0Gu-00000003JOX-16ym;
	Tue, 07 Jan 2025 03:28:52 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso100220705e9.0;
        Mon, 06 Jan 2025 19:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736220526; x=1736825326; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfeJ0Lqr2Fv2aRpLh8hAwOkSjsGmGaPxw0MQXGL1VbE=;
        b=BlqcOPIbGrB1d5HsHAWmsMzfc2V213jSiwzn/GlQAdbdyEIVcOBuY3rQlRuCpi7FJi
         JqZi3gUaaruJ+5/5Q6Sq8UAylp55P6P2y9g9a7P07D3enMXSdVbt3WeMpqhVOa7XiFOv
         d7musVyXJNIFvd9JStpLixg3h6PsOVbEH238iXz7SvT0OdvBZTK3X7cpJ875hqwDdwKh
         sPbmXtUK5Rbx4oRg9nGy4hQoqLEJW1J9mqtFkcjySvpb4LzPdfZoxPAKUNfRLvXI0vhR
         d3s3z09AB2jH0ttiZbosdg9RehjTpw9iR93YcrGsdhphNtXhnvpxLSk2Z8DxQWIkCLhF
         CigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736220526; x=1736825326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfeJ0Lqr2Fv2aRpLh8hAwOkSjsGmGaPxw0MQXGL1VbE=;
        b=V8LfH4tuGFK5/JTPhzSg40A0nmkjge1Phr+/se7AfVI+MKLM7ygd0iudQEE2PsMw/k
         rodH7NGZ7G9EWZFqWA42fG/41kkSoc9eOLhYtiQm74mqvLhlxmkqBBgD5dyHQD3GijTw
         nfnstNBB8pw9ppisYIz3Un6Zz+aLihsxN9VUdhf2UAb/Tl/oDgEyuVWIb68f+sLxJU6f
         PGbtTdVCo5HbwML/uKa6oodrGisZqMkkBdj/cBkeo1INeYMo6vAaK544vBMeJtVXcR7i
         S19A1jwLZN0ZuksWBW++7MMvsZia6XEnQYI5o529nu7oXjtOx/DrhkgjLTWt0EJTNV0W
         XhiA==
X-Forwarded-Encrypted: i=1; AJvYcCX/HuBE4rVNKV6BzcuKUq+S0dJjTEbgwTU7Tvx2M761Sc8YiDW6j3+ORv9U5dDsaixaATTCAdrTh3M=@lists.infradead.org, AJvYcCXRrjvghl487IgTXG8wsv4zNqDUHJ8o/vQHIFaLBdYp2WoWVfOomMo2/0DHGr9m1RgJITjO2azuYsnU5Lg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzTpeURbtrtTW0YSBvXJA+/osBNr+Fsn2vsUVtKOjL0VlAmiUWA
	DxMTxMETTPXOi4s82XJFK4C+mlQJ1w5ztDPmb0qcHcuLFqz9Mf3I36IPk23qVVeE93FTL8lv414
	NGVdgqyY0Q2bU4AzOi/zOUbFogKY=
X-Gm-Gg: ASbGncvjfimYquTjEnotCUs4I5VDYbHzVcrRUx7OtxFty2lWiaMgGUR6gRzXSJDEPTc
	STIyU9UatWydInImfvPQwi0vXxRmsbrGwT8TgYQ==
X-Google-Smtp-Source: AGHT+IHCmu9uNgDKwC4g/tNae1I7mHrkxA9+po8I303+NYt0svTCTVLUEa6fCsX75L13M3PQ40F+H3+HgY/K8ZCX9l4=
X-Received: by 2002:a05:600c:4f51:b0:436:51bb:7a52 with SMTP id
 5b1f17b1804b1-4366854888fmr438209085e9.7.1736220526436; Mon, 06 Jan 2025
 19:28:46 -0800 (PST)
MIME-Version: 1.0
References: <20250106154847.1100344-1-cleger@rivosinc.com> <20250106154847.1100344-3-cleger@rivosinc.com>
In-Reply-To: <20250106154847.1100344-3-cleger@rivosinc.com>
From: Jesse T <mr.bossman075@gmail.com>
Date: Mon, 6 Jan 2025 22:28:10 -0500
X-Gm-Features: AbW1kvbwwslv4p0Lj_Dk9xCXleaAwtRwEzRrBg540rhMGSBAhQpt4X-nTWUxshU
Message-ID: <CAJFTR8RzGNhM6okugY-CSYqXEmMOxGa9EzcLvwE4u3XePY1ASA@mail.gmail.com>
Subject: Re: [PATCH 2/6] riscv: request misaligned exception delegation from SBI
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_192848_311823_577BC0EE 
X-CRM114-Status: GOOD (  21.99  )
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

T24gTW9uLCBKYW4gNiwgMjAyNSBhdCAxMDo1MuKAr0FNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBOb3cgdGhhdCB0aGUga2VybmVsIGNhbiBoYW5kbGUg
bWlzYWxpZ25lZCBhY2Nlc3NlcyBpbiBTLW1vZGUsIHJlcXVlc3QKPiBtaXNhbGlnbmVkIGFjY2Vz
cyBleGNlcHRpb24gZGVsZWdhdGlvbiBmcm9tIFNCSS4gVGhpcyB1c2VzIHRoZSBGV0ZUIFNCSQo+
IGV4dGVuc2lvbiBkZWZpbmVkIGluIFNCSSB2ZXJzaW9uIDMuMC4KPgo+IFNpZ25lZC1vZmYtYnk6
IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEplc3Nl
IFRhdWJlIDxtci5ib3NzbWFuMDc1QGdtYWlsLmNvbT4KCj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vY3B1ZmVhdHVyZS5oICAgICAgICB8ICAxICsKPiAgYXJjaC9yaXNjdi9rZXJuZWwv
dHJhcHNfbWlzYWxpZ25lZC5jICAgICAgIHwgNTkgKysrKysrKysrKysrKysrKysrKysrKwo+ICBh
cmNoL3Jpc2N2L2tlcm5lbC91bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMgfCAgMiArCj4gIDMgZmls
ZXMgY2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0
dXJlLmgKPiBpbmRleCA0YmQwNTRjNTRjMjEuLmNkNDA2ZmUzN2RmOCAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vY3B1ZmVhdHVyZS5oCj4gQEAgLTYyLDYgKzYyLDcgQEAgdm9pZCBfX2luaXQgcmlz
Y3ZfdXNlcl9pc2FfZW5hYmxlKHZvaWQpOwo+ICAgICAgICAgX1JJU0NWX0lTQV9FWFRfREFUQShf
bmFtZSwgX2lkLCBfc3ViX2V4dHMsIEFSUkFZX1NJWkUoX3N1Yl9leHRzKSwgX3ZhbGlkYXRlKQo+
Cj4gIGJvb2wgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cyh2b2lkKTsK
PiArdm9pZCB1bmFsaWduZWRfYWNjZXNzX2luaXQodm9pZCk7Cj4gICNpZiBkZWZpbmVkKENPTkZJ
R19SSVNDVl9TQ0FMQVJfTUlTQUxJR05FRCkKPiAgdm9pZCBjaGVja191bmFsaWduZWRfYWNjZXNz
X2VtdWxhdGVkKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yayBfX2Fsd2F5c191bnVzZWQpOwo+ICB2
b2lkIHVuYWxpZ25lZF9lbXVsYXRpb25fZmluaXNoKHZvaWQpOwo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFw
c19taXNhbGlnbmVkLmMKPiBpbmRleCA3Y2MxMDhhZWQ3NGUuLjRhY2E2MDA1MjdlOSAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKPiArKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKPiBAQCAtMTYsNiArMTYsNyBAQAo+ICAj
aW5jbHVkZSA8YXNtL2VudHJ5LWNvbW1vbi5oPgo+ICAjaW5jbHVkZSA8YXNtL2h3cHJvYmUuaD4K
PiAgI2luY2x1ZGUgPGFzbS9jcHVmZWF0dXJlLmg+Cj4gKyNpbmNsdWRlIDxhc20vc2JpLmg+Cj4g
ICNpbmNsdWRlIDxhc20vdmVjdG9yLmg+Cj4KPiAgI2RlZmluZSBJTlNOX01BVENIX0xCICAgICAg
ICAgICAgICAgICAgMHgzCj4gQEAgLTY4OSwzICs2OTAsNjEgQEAgYm9vbCBjaGVja191bmFsaWdu
ZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpCj4gICAgICAgICByZXR1cm4gZmFsc2U7
Cj4gIH0KPiAgI2VuZGlmCj4gKwo+ICsjaWZkZWYgQ09ORklHX1JJU0NWX1NCSQo+ICsKPiArc3Ry
dWN0IG1pc2FsaWduZWRfZGVsZWdfcmVxIHsKPiArICAgICAgIGJvb2wgZW5hYmxlOwo+ICsgICAg
ICAgaW50IGVycm9yOwo+ICt9Owo+ICsKPiArc3RhdGljIHZvaWQKPiArY3B1X3VuYWxpZ25lZF9z
YmlfcmVxdWVzdF9kZWxlZ2F0aW9uKHZvaWQgKmFyZykKPiArewo+ICsgICAgICAgc3RydWN0IG1p
c2FsaWduZWRfZGVsZWdfcmVxICpyZXEgPSBhcmc7Cj4gKyAgICAgICBzdHJ1Y3Qgc2JpcmV0IHJl
dDsKPiArCj4gKyAgICAgICByZXQgPSBzYmlfZWNhbGwoU0JJX0VYVF9GV0ZULCBTQklfRVhUX0ZX
RlRfU0VULAo+ICsgICAgICAgICAgICAgICAgICAgICAgIFNCSV9GV0ZUX01JU0FMSUdORURfRVhD
X0RFTEVHLCByZXEtPmVuYWJsZSwgMCwgMCwgMCwgMCk7Cj4gKyAgICAgICBpZiAocmV0LmVycm9y
KQo+ICsgICAgICAgICAgICAgICByZXEtPmVycm9yID0gMTsKPiArfQo+ICsKPiArc3RhdGljIHZv
aWQgdW5hbGlnbmVkX3NiaV9yZXF1ZXN0X2RlbGVnYXRpb24odm9pZCkKPiArewo+ICsgICAgICAg
c3RydWN0IG1pc2FsaWduZWRfZGVsZWdfcmVxIHJlcSA9IHt0cnVlLCAwfTsKPiArCj4gKyAgICAg
ICBvbl9lYWNoX2NwdShjcHVfdW5hbGlnbmVkX3NiaV9yZXF1ZXN0X2RlbGVnYXRpb24sICZyZXEs
IDEpOwo+ICsgICAgICAgaWYgKCFyZXEuZXJyb3IpIHsKPiArICAgICAgICAgICAgICAgcHJfaW5m
bygiU0JJIG1pc2FsaWduZWQgYWNjZXNzIGV4Y2VwdGlvbiBkZWxlZ2F0aW9uIG9rXG4iKTsKPiAr
ICAgICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAgICAgICogTm90ZSB0aGF0IHdlIGRvbid0
IGhhdmUgdG8gdGFrZSBhbnkgc3BlY2lmaWMgYWN0aW9uIGhlcmUsIGlmCj4gKyAgICAgICAgICAg
ICAgICAqIHRoZSBkZWxlZ2F0aW9uIGlzIHN1Y2Nlc3NmdWwsIHRoZW4KPiArICAgICAgICAgICAg
ICAgICogY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZCgpIHdpbGwgdmVyaWZ5IHRoYXQg
aW5kZWVkIHRoZQo+ICsgICAgICAgICAgICAgICAgKiBwbGF0Zm9ybSB0cmFwcyBvbiBtaXNhbGln
bmVkIGFjY2Vzc2VzLgo+ICsgICAgICAgICAgICAgICAgKi8KPiArICAgICAgICAgICAgICAgcmV0
dXJuOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBJZiBhdCBsZWFz
dCBkZWxlZ2F0aW9uIHJlcXVlc3QgZmFpbGVkIG9uIG9uZSBoYXJ0LCByZXZlcnQgbWlzYWxpZ25l
ZAo+ICsgICAgICAgICogZGVsZWdhdGlvbiBmb3IgYWxsIGhhcnRzLCBpZiB3ZSBkb24ndCBkbyB0
aGF0LCB3ZSdsbCBwYW5pYyBhdAo+ICsgICAgICAgICogbWlzYWxpZ25lZCBkZWxlZ2F0aW9uIGNo
ZWNrIHRpbWUgKHNlZQo+ICsgICAgICAgICogY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRl
ZCgpKS4KPiArICAgICAgICAqLwo+ICsgICAgICAgcmVxLmVuYWJsZSA9IGZhbHNlOwo+ICsgICAg
ICAgcmVxLmVycm9yID0gMDsKPiArICAgICAgIG9uX2VhY2hfY3B1KGNwdV91bmFsaWduZWRfc2Jp
X3JlcXVlc3RfZGVsZWdhdGlvbiwgJnJlcSwgMSk7Cj4gKyAgICAgICBpZiAocmVxLmVycm9yKQo+
ICsgICAgICAgICAgICAgICBwYW5pYygiRmFpbGVkIHRvIGRpc2FibGUgbWlzYWxpZ25lZCBkZWxl
Z2F0aW9uIGZvciBhbGwgQ1BVc1xuIik7Cj4gKwo+ICt9Cj4gKwo+ICt2b2lkIHVuYWxpZ25lZF9h
Y2Nlc3NfaW5pdCh2b2lkKQo+ICt7Cj4gKyAgICAgICBpZiAoc2JpX3Byb2JlX2V4dGVuc2lvbihT
QklfRVhUX0ZXRlQpID4gMCkKPiArICAgICAgICAgICAgICAgdW5hbGlnbmVkX3NiaV9yZXF1ZXN0
X2RlbGVnYXRpb24oKTsKPiArfQo+ICsjZWxzZQo+ICt2b2lkIHVuYWxpZ25lZF9hY2Nlc3NfaW5p
dCh2b2lkKSB7fQo+ICsjZW5kaWYKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdW5h
bGlnbmVkX2FjY2Vzc19zcGVlZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vz
c19zcGVlZC5jCj4gaW5kZXggOTFmMTg5Y2YxNjExLi4xZTMxNjYxMDA4MzcgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5jCj4gKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5jCj4gQEAgLTQwMyw2ICs0MDMs
OCBAQCBzdGF0aWMgaW50IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfYWxsX2NwdXModm9pZCkKPiAg
ewo+ICAgICAgICAgYm9vbCBhbGxfY3B1c19lbXVsYXRlZCwgYWxsX2NwdXNfdmVjX3Vuc3VwcG9y
dGVkOwo+Cj4gKyAgICAgICB1bmFsaWduZWRfYWNjZXNzX2luaXQoKTsKPiArCj4gICAgICAgICBh
bGxfY3B1c19lbXVsYXRlZCA9IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2Nw
dXMoKTsKPiAgICAgICAgIGFsbF9jcHVzX3ZlY191bnN1cHBvcnRlZCA9IGNoZWNrX3ZlY3Rvcl91
bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKCk7Cj4KPiAtLQo+IDIuNDcuMQo+Cj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cgot
LSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
