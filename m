Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B58C36000
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 20:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XOifekNl8obbAxd0pIehXxPgsInPMaHuu3MZ6qMGGjc=; b=bwmoz0e6xgp0OT
	jpEUM0B9BWhsKPQZzT8h2VAu5z1iiPc3okG//A2OgGxk1pQVGEL2YZZQdvNp6Z9YfeaoHS+HBPYYh
	/9Uf6gxKwwlEZ39gfivh4OX9yczJlyscifo9mweLVZ31JP0Y2iamntE+MFdmZdjUxFHC/4mDsBeHP
	vPhSgpJLpCgoTM2u+Df2MNBl0unLwpF/G8cTlnFY0u68Ee2ZZrFVMkUscFSskOMsrvrZYmXd5m2js
	/IQoghwhFLyGGdxA12avLQgPZ7mw0uNxhexSyuJqLImxvZmlOKAi8gwaTWGGk4/e9vVli8tF0aKyf
	DnNIRnziSb7/pFRskPGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tviz4-0000000GAOu-3s3r;
	Fri, 21 Mar 2025 20:28:50 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvimE-0000000G8g6-43oA
	for kvm-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 20:15:36 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-390cf7458f5so1775648f8f.2
        for <kvm-riscv@lists.infradead.org>; Fri, 21 Mar 2025 13:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742588133; x=1743192933; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M7Pg06C3rx2edAau3ZDyx94pdNdZUqrs4v4UVmFnuyc=;
        b=khCq6WIbDWdUGTUgYbjG9UIVzIt8+EgHX8qS9rVjj9fOwC8spdabka5Sma2BOBwFsk
         eVopAqGbYHDhXfit+rTz4kS4td6joQFIVr+W9LIuqqiyo9zaXL2C1zt2LCsHzy4QLpdg
         NfBe+yBmxaeadMcpqIV3BRxyX/XKlrMz8TF4qDdVqMHrWpsmTIqe0fkQfj6/fDUQoYEp
         vvd4fi4fawnxJ35JEigyxFLC41OdhLvmtXDjP61X7QyEaxcHkLLPzjZaJXXjK/FsSm8o
         3DO2ntSAKgTR+dN4uBZ+7xxMRftLAgUAq+ydjzzgHhr4rIAmdMBtOWCSDMTXgl0peXBz
         acsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742588133; x=1743192933;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M7Pg06C3rx2edAau3ZDyx94pdNdZUqrs4v4UVmFnuyc=;
        b=nAgVIGpY1ptOoRbAqte/vnMfwGPKkEtE4ph5Ei8Ff1RctqBUWtqd0DhhiBzMBEj1jQ
         kqc+hzlY7mjyHgRyyki1g97BRa8lm6qOJpbsCnddL8AWW5Vtlw4VWhKTTgRWUsJey3+t
         M6JBY759xSIS8HNeqTPpPjwMFOsBgmC8GsQSxxtf8LIXn8SxwIdUFTKaGveAjFpBGQlm
         rKjSNHqxz/GFYkR9TaRSCDRl88buX3YVv+frroqCvSm6d3doXy/+S8uB6A3liRVck9RW
         KM1CudyDdP3lCWc5IA+aiOENdqQD0q2xoFwyX6WDJxOooFe2tRgCwuRzHo7yxn66Sofi
         uzWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV9N7E3ZNOcbaWxwjTPgHZcEO49hwZbV7K6UaPAa6so5Gsj89bIEwQy2GZqD1JfnpUKCF0VpCJRME=@lists.infradead.org
X-Gm-Message-State: AOJu0YzNOXGye/lF8/MjTCEdtEGulZepSgyM3EsC9k+rltUPTMqcX2yE
	gw9Jgw8Bndvfemzxzm0BU3XSWuhpRVytTNlaiFlqOg4dsGBD6yXVMFznlXkx/mo=
X-Gm-Gg: ASbGnctWH55w2v/GzFOFtYkLn0o19dsMizEGeYhfzN67bvyFkvqA/Q/IzP40XeaXZCe
	0Vcv6JZ9+BfpRxiias92ngrCu3XeQxRLMLEU9rkC/9erItmcZeMuJxRJxEyV+KZOr3stBLiCdK3
	zlIcqTcfiRZrBp00D5vUxoN+d0pwkHpjCViZVVamiICBb3Gyebw/g4oxA4qVTWNOE6K58fJLwF0
	gfPt6cOxiraL9qcy0URGJqkTFbb4EDzedPH41hEYxo/usC7ncVKAchWYDFBmpVPvTwi7XSz9dw6
	3rOIyv2QQp6wwkUU+aIDKhhufp9f0sxeFJlDu8ViZ6ghKINqu6eB6zSnlKrGxkdpp/pGpiPki09
	/fW7gYR8AIR6Cew==
X-Google-Smtp-Source: AGHT+IHUpxa+AFDsalaScWT+PaI/7X8t9Dfe+KZvLu6TKxNkbbHnFux7c9mcWOBJQvf3oEP5okfc7w==
X-Received: by 2002:a05:6000:18af:b0:391:888:f534 with SMTP id ffacd0b85a97d-3997f902e48mr5624942f8f.20.1742588132860;
        Fri, 21 Mar 2025 13:15:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f43ecbsm86906665e9.10.2025.03.21.13.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 13:15:32 -0700 (PDT)
Message-ID: <6f30d2a2-0565-42cf-bc9a-e0c35e27627f@rivosinc.com>
Date: Fri, 21 Mar 2025 21:15:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 1/3] lib/riscv: Also provide sbiret impl
 functions
To: Andrew Jones <andrew.jones@linux.dev>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org
Cc: atishp@rivosinc.com, akshaybehl231@gmail.com
References: <20250321165403.57859-5-andrew.jones@linux.dev>
 <20250321165403.57859-6-andrew.jones@linux.dev>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250321165403.57859-6-andrew.jones@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_131535_275612_4C069FE0 
X-CRM114-Status: GOOD (  14.42  )
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

CgpPbiAyMS8wMy8yMDI1IDE3OjU0LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gV2UgYWxtb3N0IGFs
d2F5cyByZXR1cm4gc2JpcmV0IGZyb20gc2JpIHdyYXBwZXIgZnVuY3Rpb25zIHNvCj4gZG8gdGhh
dCBmb3Igc2JpX2dldF9pbXBfdmVyc2lvbigpIGFuZCBzYmlfZ2V0X2ltcF9pZCgpLCBidXQKPiBh
c3NlcnRpbmcgbm8gZXJyb3IgYW5kIHJldHVybmluZyB0aGUgdmFsdWUgaXMgYWxzbyB1c2VmdWws
Cj4gc28gY29udGludWUgdG8gcHJvdmlkZSB0aG9zZSBmdW5jdGlvbnMgdG9vLCBqdXN0IHdpdGgg
YSBzbGlnaHRseQo+IGRpZmZlcmVudCBuYW1lLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBK
b25lcyA8YW5kcmV3LmpvbmVzQGxpbnV4LmRldj4KPiAtLS0KPiAgbGliL3Jpc2N2L2FzbS9zYmku
aCB8ICA2ICsrKystLQo+ICBsaWIvcmlzY3Yvc2JpLmMgICAgIHwgMTggKysrKysrKysrKysrKyst
LS0tCj4gIHJpc2N2L3NiaS1zc2UuYyAgICAgfCAgNCArKy0tCj4gIDMgZmlsZXMgY2hhbmdlZCwg
MjAgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL3Jp
c2N2L2FzbS9zYmkuaCBiL2xpYi9yaXNjdi9hc20vc2JpLmgKPiBpbmRleCBlZGFlZTQ2MmMzZmEu
LmE1NzM4YTVjZTIwOSAxMDA2NDQKPiAtLS0gYS9saWIvcmlzY3YvYXNtL3NiaS5oCj4gKysrIGIv
bGliL3Jpc2N2L2FzbS9zYmkuaAo+IEBAIC0yNjAsOSArMjYwLDExIEBAIHN0cnVjdCBzYmlyZXQg
c2JpX3NlbmRfaXBpX2NwdW1hc2soY29uc3QgY3B1bWFza190ICptYXNrKTsKPiAgc3RydWN0IHNi
aXJldCBzYmlfc2VuZF9pcGlfYnJvYWRjYXN0KHZvaWQpOwo+ICBzdHJ1Y3Qgc2JpcmV0IHNiaV9z
ZXRfdGltZXIodW5zaWduZWQgbG9uZyBzdGltZV92YWx1ZSk7Cj4gIHN0cnVjdCBzYmlyZXQgc2Jp
X2dldF9zcGVjX3ZlcnNpb24odm9pZCk7Cj4gLXVuc2lnbmVkIGxvbmcgc2JpX2dldF9pbXBfdmVy
c2lvbih2b2lkKTsKPiAtdW5zaWduZWQgbG9uZyBzYmlfZ2V0X2ltcF9pZCh2b2lkKTsKPiArc3Ry
dWN0IHNiaXJldCBzYmlfZ2V0X2ltcF92ZXJzaW9uKHZvaWQpOwo+ICtzdHJ1Y3Qgc2JpcmV0IHNi
aV9nZXRfaW1wX2lkKHZvaWQpOwo+ICBsb25nIHNiaV9wcm9iZShpbnQgZXh0KTsKPiArdW5zaWdu
ZWQgbG9uZyBfX3NiaV9nZXRfaW1wX3ZlcnNpb24odm9pZCk7Cj4gK3Vuc2lnbmVkIGxvbmcgX19z
YmlfZ2V0X2ltcF9pZCh2b2lkKTsKPiAgCj4gIHR5cGVkZWYgdm9pZCAoKnNiaV9zc2VfaGFuZGxl
cl9mbikodm9pZCAqZGF0YSwgc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGludCBoYXJ0
aWQpOwo+ICAKPiBkaWZmIC0tZ2l0IGEvbGliL3Jpc2N2L3NiaS5jIGIvbGliL3Jpc2N2L3NiaS5j
Cj4gaW5kZXggNTNkMjU0ODlmOTA1Li4yOTU5Mzc4ZjY0YmIgMTAwNjQ0Cj4gLS0tIGEvbGliL3Jp
c2N2L3NiaS5jCj4gKysrIGIvbGliL3Jpc2N2L3NiaS5jCj4gQEAgLTE4MywyMSArMTgzLDMxIEBA
IHN0cnVjdCBzYmlyZXQgc2JpX3NldF90aW1lcih1bnNpZ25lZCBsb25nIHN0aW1lX3ZhbHVlKQo+
ICAJcmV0dXJuIHNiaV9lY2FsbChTQklfRVhUX1RJTUUsIFNCSV9FWFRfVElNRV9TRVRfVElNRVIs
IHN0aW1lX3ZhbHVlLCAwLCAwLCAwLCAwLCAwKTsKPiAgfQo+ICAKPiAtdW5zaWduZWQgbG9uZyBz
YmlfZ2V0X2ltcF92ZXJzaW9uKHZvaWQpCj4gK3N0cnVjdCBzYmlyZXQgc2JpX2dldF9pbXBfdmVy
c2lvbih2b2lkKQo+ICt7Cj4gKwlyZXR1cm4gc2JpX2VjYWxsKFNCSV9FWFRfQkFTRSwgU0JJX0VY
VF9CQVNFX0dFVF9JTVBfVkVSU0lPTiwgMCwgMCwgMCwgMCwgMCwgMCk7Cj4gK30KPiArCj4gK3N0
cnVjdCBzYmlyZXQgc2JpX2dldF9pbXBfaWQodm9pZCkKPiArewo+ICsJcmV0dXJuIHNiaV9lY2Fs
bChTQklfRVhUX0JBU0UsIFNCSV9FWFRfQkFTRV9HRVRfSU1QX0lELCAwLCAwLCAwLCAwLCAwLCAw
KTsKPiArfQo+ICsKPiArdW5zaWduZWQgbG9uZyBfX3NiaV9nZXRfaW1wX3ZlcnNpb24odm9pZCkK
PiAgewo+ICAJc3RydWN0IHNiaXJldCByZXQ7Cj4gIAo+IC0JcmV0ID0gc2JpX2VjYWxsKFNCSV9F
WFRfQkFTRSwgU0JJX0VYVF9CQVNFX0dFVF9JTVBfVkVSU0lPTiwgMCwgMCwgMCwgMCwgMCwgMCk7
Cj4gKwlyZXQgPSBzYmlfZ2V0X2ltcF92ZXJzaW9uKCk7Cj4gIAlhc3NlcnQoIXJldC5lcnJvcik7
Cj4gIAo+ICAJcmV0dXJuIHJldC52YWx1ZTsKPiAgfQo+ICAKPiAtdW5zaWduZWQgbG9uZyBzYmlf
Z2V0X2ltcF9pZCh2b2lkKQo+ICt1bnNpZ25lZCBsb25nIF9fc2JpX2dldF9pbXBfaWQodm9pZCkK
PiAgewo+ICAJc3RydWN0IHNiaXJldCByZXQ7Cj4gIAo+IC0JcmV0ID0gc2JpX2VjYWxsKFNCSV9F
WFRfQkFTRSwgU0JJX0VYVF9CQVNFX0dFVF9JTVBfSUQsIDAsIDAsIDAsIDAsIDAsIDApOwo+ICsJ
cmV0ID0gc2JpX2dldF9pbXBfaWQoKTsKPiAgCWFzc2VydCghcmV0LmVycm9yKTsKPiAgCj4gIAly
ZXR1cm4gcmV0LnZhbHVlOwo+IGRpZmYgLS1naXQgYS9yaXNjdi9zYmktc3NlLmMgYi9yaXNjdi9z
Ymktc3NlLmMKPiBpbmRleCA5N2UwNzcyNWMzNTkuLmJjNmFmYWY1NDgxZSAxMDA2NDQKPiAtLS0g
YS9yaXNjdi9zYmktc3NlLmMKPiArKysgYi9yaXNjdi9zYmktc3NlLmMKPiBAQCAtMTIzMiw4ICsx
MjMyLDggQEAgdm9pZCBjaGVja19zc2Uodm9pZCkKPiAgCQlyZXR1cm47Cj4gIAl9Cj4gIAo+IC0J
aWYgKHNiaV9nZXRfaW1wX2lkKCkgPT0gU0JJX0lNUExfT1BFTlNCSSAmJgo+IC0JICAgIHNiaV9n
ZXRfaW1wX3ZlcnNpb24oKSA8IHNiaV9pbXBsX29wZW5zYmlfbWtfdmVyc2lvbigxLCA3KSkgewo+
ICsJaWYgKF9fc2JpX2dldF9pbXBfaWQoKSA9PSBTQklfSU1QTF9PUEVOU0JJICYmCj4gKwkgICAg
X19zYmlfZ2V0X2ltcF92ZXJzaW9uKCkgPCBzYmlfaW1wbF9vcGVuc2JpX21rX3ZlcnNpb24oMSwg
NykpIHsKPiAgCQlyZXBvcnRfc2tpcCgiT3BlblNCSSA8IHYxLjcgZGV0ZWN0ZWQsIHNraXBwaW5n
IHRlc3RzIik7Cj4gIAkJcmVwb3J0X3ByZWZpeF9wb3AoKTsKPiAgCQlyZXR1cm47CgpIaSBBbmRy
ZXcsCgpMb29rcyBnb29kIHRvIG1lLAoKUmV2aWV3ZWQtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xl
Z2VyQHJpdm9zaW5jLmNvbT4KClRoYW5rcywKCkNsw6ltZW50CgoKLS0gCmt2bS1yaXNjdiBtYWls
aW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
