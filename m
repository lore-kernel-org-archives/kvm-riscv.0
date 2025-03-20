Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33D3C28B30
	for <kvm-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 13:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P/KQe+1sXTv7+5BS6yJqWo1CX7+0pr827uYsz722Fqk=; b=ZHUXD84kihD8LD
	YnMHSm+mQUIjmnI5W2gkzOWr3wja2IBXuzRcPf/Uphsxtn9VC39U2ynkRBeQhvQGMDad8BPfpIXK6
	47z/VEM+YnB6Q2h5u5gvs/0ZtIAi7XnR+M/yqV/Y87I6Ed2BmvVAsdisCqAcLfnFKqKXY5B6f3J/c
	DiKhfaUY4UIXEc0azKghCMmiPNCKFV56GZUp8MXHvfDWrVTlMbmttksrjKJjpJwUL+hSzm/FZLUCY
	mgE6Kw1LdhV8zG41KWbCtbr9vBS25uVGj5Vj8Z9odVpVwDIPjrXe46RCZ2MoidqBSlcwqOWFyJ5dK
	JasQf6OB7zi5sjdM9zEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvGCJ-0000000CHXL-34wR;
	Thu, 20 Mar 2025 13:44:35 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvGCH-0000000CHWf-0Q35
	for kvm-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 13:44:34 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso5980825e9.1
        for <kvm-riscv@lists.infradead.org>; Thu, 20 Mar 2025 06:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742478271; x=1743083071; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wmu2SYxKWaUXZphIv9tzLlkJ4fqhqSXSAkoab85VEl4=;
        b=FQb6aDF9e5gKl/U0akVcf1C7LodHIEdWqU3zxGlufsxDqhIlhHo39ahxYQMfmFoJik
         ntNd16L5vdLmErjYVpgSbwwyS+83HECF5SIo2AdM7lJZMENffmxS5QtGlkRlmD4copHh
         8kvhg/DDNKtGyZlNIgdZVFOyRYNvGOqxqnm8McjaL2Vh2rx/juLZvP4/hrMeaJbz4c4s
         wwkHgNJoGEf7HzTR2Rw0W9ip1LoO7h1+/UxzZ1A/IrVoWN36YI4PHKvtAw/S7mTUXRnU
         PKQWPVrjngr3/r+BRF40UaxrUW99tNo+bNbEmZboRHwbctt/8oRTUUtxFilxn7o2Bgl1
         qLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742478271; x=1743083071;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wmu2SYxKWaUXZphIv9tzLlkJ4fqhqSXSAkoab85VEl4=;
        b=QP60qGeHhig+ilkV1PqDIFdVXyKsCOQ7TyMCVyuXGJSx9wtjfW8QAFVN0VvcRHXBAT
         qle96BnnYGJdDqp16Q216On/giqk8WlVRtT/GMFFP3yM19r2ecyctq39u35Uu3z56dt3
         2wlfbyIXWDQ8eTLl0AH6qZohmWot9lwLuxWByXSwFBTu1YkOn3EM3zduL1+pXjRAptkX
         bkFqPZTLvjretlS1n1pjqGcWjti1D2wgKiOPfNTyRB9CNjaDcsQeBdDiQwwTBfeHsCho
         Lp1aGqICYgkt2kF2ov8ITtMLh9h/zOE3sCer9YrMVU0TNNvKtndOAE7yp2Gs494Esngw
         iH7g==
X-Forwarded-Encrypted: i=1; AJvYcCVMfQQP5vgeTW57E/LSE5u4UPJRKnlZu9OoMC8z8jOfaquU//nBNa/ARBNjiWcYELRVBCp3OjDA320=@lists.infradead.org
X-Gm-Message-State: AOJu0YwBNgwqwnyHEwpxSiJ5Nh08GC1nr8vGX0XfDjZuultrGbHuTtmW
	7LXatSLWHpoyUzu6ot7vLjI+llVDTSU64JY7G5K65xUx2QWjZmK36f+07oOSLhgFiwc/UmzpR4P
	yHFg=
X-Gm-Gg: ASbGnctZ26O8NZZeMYRqr+zp1n5H/PqsrGUXJ4SiPMHM8yWrcM7xYhKCFn7j5gysv0W
	nLaBF02hZnIaiyvqvmqzZD9UHNXEKjDRShG/mKw+KeJL2jQ3vddqODO4Qr4tx+pH172JpnpzqRm
	capgNM8gqmDNH01d1yy4Tu98UgQfX3Y3SS1KK1UAT7bdlaqZ3QWBiIBa3DSAON8LxaBHWkXg+il
	rUhIgCIA0DLb6IWYItWdvbITW20gCmSY9Tf2pjy+xYTTq/C8croK9DWlXLx8pYBwqro4qLwcGxK
	eJDG/XRw0OUwGo5orvfQqQMyla4I6pMGrRPKnnknIE6RD9WUHmtjSgiWwTou3Zt2AzoETV8aEcV
	4AmvPSpvm4BcdTQ==
X-Google-Smtp-Source: AGHT+IERvTzbGrGJZzSa+H/W4kMrQnsWdb7vNeUSPRle6rJopTbtJgkW4W0Y48vwUYZ7ZJJ64N2k/g==
X-Received: by 2002:a05:600c:8187:b0:43d:47e:3205 with SMTP id 5b1f17b1804b1-43d43793a12mr66521115e9.11.1742478271339;
        Thu, 20 Mar 2025 06:44:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997d508c1esm1046858f8f.93.2025.03.20.06.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 06:44:30 -0700 (PDT)
Message-ID: <0e6de092-4dde-4a50-9373-a8e5b37a8c1e@rivosinc.com>
Date: Thu, 20 Mar 2025 14:44:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v11 8/8] riscv: sbi: Add SSE extension
 tests
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel
 <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
References: <20250317164655.1120015-1-cleger@rivosinc.com>
 <20250317164655.1120015-9-cleger@rivosinc.com>
 <20250320-ab264d08531d4ff10b874485@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250320-ab264d08531d4ff10b874485@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_064433_337215_2C69496F 
X-CRM114-Status: GOOD (  16.08  )
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

CgpPbiAyMC8wMy8yMDI1IDE0OjQwLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gTW9uLCBNYXIg
MTcsIDIwMjUgYXQgMDU6NDY6NTNQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+IC4u
Lgo+PiArCS8qIFRlc3QgYWxsIGZsYWdzIGFsbG93ZWQgZm9yIFNCSV9TU0VfQVRUUl9JTlRFUlJV
UFRFRF9GTEFHUyAqLwo+PiArCWF0dHIgPSBTQklfU1NFX0FUVFJfSU5URVJSVVBURURfRkxBR1M7
Cj4+ICsJcmV0ID0gc2JpX3NzZV9yZWFkX2F0dHJzKGV2ZW50X2lkLCBhdHRyLCAxLCAmcHJldl92
YWx1ZSk7Cj4+ICsJc2JpcmV0X3JlcG9ydF9lcnJvcigmcmV0LCBTQklfU1VDQ0VTUywgIlNhdmUg
aW50ZXJydXB0ZWQgZmxhZ3MiKTsKPj4gKwo+PiArCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpF
KGludGVycnVwdGVkX2ZsYWdzKTsgaSsrKSB7Cj4+ICsJCWZsYWdzID0gaW50ZXJydXB0ZWRfZmxh
Z3NbaV07Cj4+ICsJCXJldCA9IHNiaV9zc2Vfd3JpdGVfYXR0cnMoZXZlbnRfaWQsIGF0dHIsIDEs
ICZmbGFncyk7Cj4+ICsJCXNiaXJldF9yZXBvcnRfZXJyb3IoJnJldCwgU0JJX1NVQ0NFU1MsCj4+
ICsJCQkJICAgICJTZXQgaW50ZXJydXB0ZWQgZmxhZ3MgYml0IDB4JWx4IHZhbHVlIiwgZmxhZ3Mp
Owo+PiArCQlyZXQgPSBzYmlfc3NlX3JlYWRfYXR0cnMoZXZlbnRfaWQsIGF0dHIsIDEsICZ2YWx1
ZSk7Cj4+ICsJCXNiaXJldF9yZXBvcnRfZXJyb3IoJnJldCwgU0JJX1NVQ0NFU1MsICJHZXQgaW50
ZXJydXB0ZWQgZmxhZ3MgYWZ0ZXIgc2V0Iik7Cj4+ICsJCXJlcG9ydCh2YWx1ZSA9PSBmbGFncywg
ImludGVycnVwdGVkIGZsYWdzIG1vZGlmaWVkIHZhbHVlOiAweCVseCIsIHZhbHVlKTsKPj4gKwl9
Cj4+ICsKPj4gKwkvKiBXcml0ZSBpbnZhbGlkIGJpdCBpbiBmbGFnIHJlZ2lzdGVyICovCj4+ICsJ
ZmxhZ3MgPSBTQklfU1NFX0FUVFJfSU5URVJSVVBURURfRkxBR1NfU1NUQVRVU19TRFQgPDwgMTsK
Pj4gKwlyZXQgPSBzYmlfc3NlX3dyaXRlX2F0dHJzKGV2ZW50X2lkLCBhdHRyLCAxLCAmZmxhZ3Mp
Owo+PiArCXNiaXJldF9yZXBvcnRfZXJyb3IoJnJldCwgU0JJX0VSUl9JTlZBTElEX1BBUkFNLCAi
U2V0IGludmFsaWQgZmxhZ3MgYml0IDB4JWx4IHZhbHVlIGVycm9yIiwKPj4gKwkJCSAgICBmbGFn
cyk7Cj4+ICsKPj4gKwlmbGFncyA9IEJJVChTQklfU1NFX0FUVFJfSU5URVJSVVBURURfRkxBR1Nf
U1NUQVRVU19TRFQgKyAxKTsKPiAKPiBUaGlzIGJyb2tlIGNvbXBpbGluZyBmb3IgcnYzMiwgYnV0
IGp1c3QgY2hhbmdpbmcgaXQgdG8gQklUX1VMTCB3b3VsZG4ndCBiZQo+IHJpZ2h0IGVpdGhlciBz
aW5jZSBTQklfU1NFX0FUVFJfSU5URVJSVVBURURfRkxBR1NfU1NUQVRVU19TRFQgaXMgYSBCSVQo
KS4KPiBJIHRoaW5rIHRoZSB0ZXN0IGp1c3QgYWJvdmUgdGhpcyBvbmUgaXMgd2hhdCB0aGlzIHRl
c3Qgd2FzIGFpbWluZyB0byBkbywKPiBtYWtpbmcgaXQgcmVkdW5kYW50LiBJbnN0ZWFkIG9mIHJl
bW92aW5nIGl0LCBJIGNoYW5nZWQgaXQgYXMgYmVsb3cgdG8gZ2V0Cj4gbW9yZSBjb3ZlcmFnZSwg
YXQgbGVhc3Qgb24gcnY2NC4KCkh1bSB5ZWFoIGluZGVlZCwgdGhhdCB3YXNuJ3Qgd2hhdCB3YXMg
aW50ZW5kZWQgdG8gYmUgZG9uZS4gWW91IGZpeCBpcwpjb3JyZWN0LgoKVGhhbmtzLAoKQ2zDqW1l
bnQKCj4gCj4gVGhhbmtzLAo+IGRyZXcKPiAKPiBkaWZmIC0tZ2l0IGEvcmlzY3Yvc2JpLXNzZS5j
IGIvcmlzY3Yvc2JpLXNzZS5jCj4gaW5kZXggZmI0ZWU3ZGQ0NGIyLi5mOWUzODk3Mjg2MTYgMTAw
NjQ0Cj4gLS0tIGEvcmlzY3Yvc2JpLXNzZS5jCj4gKysrIGIvcmlzY3Yvc2JpLXNzZS5jCj4gQEAg
LTQ5NSwxMCArNDk1LDEyIEBAIHN0YXRpYyB2b2lkIHNzZV9zaW1wbGVfaGFuZGxlcih2b2lkICpk
YXRhLCBzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgaW50IGhhCj4gICAgICAgICBzYmly
ZXRfcmVwb3J0X2Vycm9yKCZyZXQsIFNCSV9FUlJfSU5WQUxJRF9QQVJBTSwgIlNldCBpbnZhbGlk
IGZsYWdzIGJpdCAweCVseCB2YWx1ZSBlcnJvciIsCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGZsYWdzKTsKPiAKPiAtICAgICAgIGZsYWdzID0gQklUKFNCSV9TU0VfQVRUUl9JTlRFUlJV
UFRFRF9GTEFHU19TU1RBVFVTX1NEVCArIDEpOwo+ICsjaWYgX19yaXNjdl94bGVuID4gMzIKPiAr
ICAgICAgIGZsYWdzID0gQklUKDMyKTsKPiAgICAgICAgIHJldCA9IHNiaV9zc2Vfd3JpdGVfYXR0
cnMoZXZlbnRfaWQsIGF0dHIsIDEsICZmbGFncyk7Cj4gICAgICAgICBzYmlyZXRfcmVwb3J0X2Vy
cm9yKCZyZXQsIFNCSV9FUlJfSU5WQUxJRF9QQVJBTSwgIlNldCBpbnZhbGlkIGZsYWdzIGJpdCAw
eCVseCB2YWx1ZSBlcnJvciIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZsYWdzKTsK
PiArI2VuZGlmCj4gCj4gICAgICAgICByZXQgPSBzYmlfc3NlX3dyaXRlX2F0dHJzKGV2ZW50X2lk
LCBhdHRyLCAxLCAmcHJldl92YWx1ZSk7Cj4gICAgICAgICBzYmlyZXRfcmVwb3J0X2Vycm9yKCZy
ZXQsIFNCSV9TVUNDRVNTLCAiUmVzdG9yZSBpbnRlcnJ1cHRlZCBmbGFncyIpOwoKCi0tIAprdm0t
cmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
