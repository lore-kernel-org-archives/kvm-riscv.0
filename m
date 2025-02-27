Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337C2C1B0FF
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 14:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YRV08ZMXOjpbu+Y0P1vt6NjR3bgGfP4b8Bx7zLEsOJs=; b=MqZu9xzJYwrMvv
	aUvW83iAYqhGrB/cgN+IxZSinBNrwxGi2Rb+Lt5SfUHTDAwFGHNlJOi6i351kHIB1GIVtAqFzd8j+
	8URE0rqlawmA2Y1X4sN0jWaHBux2dCfcINDPY4GCWARMCq7WVRUGlonYoC78lTA+5Xvm2dhM+8ZQu
	l6UwpEgeSA+6KcUJPbMCmuDElTGWl09ElHCjBtObENDg4KNZJ7Oe2qJ9LMh6VRj8M9zif5iXYr0cI
	95HP9qN5HJlfqk2XKkYQ9sAa7qQyhz5CkQTbRakzVOjTGu3yN40HqpF+zXWe0P0u4LeO/wD4EDX3f
	wPRXhwUDvEJVqDreImfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnfFh-00000007pKq-3zIe;
	Thu, 27 Feb 2025 14:52:41 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnexb-00000007kaP-13Ci
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 14:34:00 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22339936bbfso15927595ad.1
        for <kvm-riscv@lists.infradead.org>; Thu, 27 Feb 2025 06:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740666838; x=1741271638; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LO3KPCRIoIRvuw27ZXCD5UxGyB4ZPddNyuBgjm0rlfw=;
        b=jIUfFgaERvuSukCfTqtul0GBthapncJfHeEs24hTMg/BqHPgLlHWdVB3QyQGG1Ifsi
         wOV1ZHSg+o1oPwcWPJVZnr9Lp6XrMrpJkt/aDqG6O1xwBBNcjowd6RAJHrxSi2BskTpt
         V7BszR8JmWF2nnHS1TriirEzZDfP6PCm3/zs5Tj8xOsY3JeHUZ0iajBXaQX+sa+hNAm/
         ZsvWCpHEIJhDereDh7guHN2S9dkQ/ymtlCDADwAlNluIyV5A6bgHfvflSXoffi3+Z7ry
         a66T9zECIj0oWDHJWxYxFN9FdDxklbkyoJySZO7V4zqqTQ5h3L1pTPVGu+e04Nk/sA1e
         rupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740666838; x=1741271638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LO3KPCRIoIRvuw27ZXCD5UxGyB4ZPddNyuBgjm0rlfw=;
        b=kl0BRZ8ItH92FU1TItbDRujWTfHylP3IXTYj0DCz9t2QlBF1qtYH3NyGyDC/FR2uMm
         jluTot0y+4ub2Swh2vIONLhpyo73rYBVOrrW/FnsEl4n3QaxN5GEo4RezxxARgeHGmeF
         nwX12YoG0OqS/9A6iBkFVpyEIiX6K8aFe9pCR0c3FbVnw0JgwicOJpQbwdOK2diNOtyy
         XQbdpxTQfoJ/jZW8gGANNJOdm3oSnP/0Qa0+7ndD21b0eagloOeLG37RT7U/HROSSk4t
         SpeqGLHAz8HyApGsQbWq9vzlg08I5VFgMZg25X+wqccmhHChF0wKh1uEJVmnsdauNl42
         OYmg==
X-Forwarded-Encrypted: i=1; AJvYcCV986Pgqm1wL1OVPGxwpA1QNC2KQwMZuEP/myTn9A1ntbtk+6wB1E/zSyEIaxCkTxJWJZ6t5DgB/AY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7lygoItSVtuCvlODvKLdtXObfrrtL7GTG+Oivwt2CCy6lj/Wy
	WimMURt7vas5FTcOP//iSDi9urKEMgF8SSRIFdnxTksBzQyWB3mGGgOqvY1SM5A=
X-Gm-Gg: ASbGncvV0Z8+21mZH/zFPm+9tmfNM7hU9a8VSp+pe3fjGg7EAhZZQ8oY9353imget3a
	dhjHqsZLQD2Q8VSVpTWEK8DziGIsHzaSbq8TN5ITeVay1oy9+fumpMJ19OzUUp6B/TPHBfzQbNJ
	A8uQidsKm/lt1NgwWmjTgEvLBrGLMRyn84mmrfsY+2YfN9wkbYTZqAgeKnx2zx2+3394wUpv2Xx
	HnwtiaDLrA1Ytkmrshj/oLkDCsy0dVeYH/KSCu6M4A5TIh2QKMMl5UtMiH/D7ivTA/4h1BmYPmC
	mJSW50nO2aCPM8RvRVRUw3VxyFMxeXkyz7nSAJjFbnID/rMt0MLCPtVgmetmkp1pQLxME2c=
X-Google-Smtp-Source: AGHT+IGajRoaA+iTNTjHtnOJfxxHocn+sGlKb/5Z5L73ahWXBQz3tqNFfN4m6KWPaIzuxf1tM9xboA==
X-Received: by 2002:a17:902:ceca:b0:220:eade:d77e with SMTP id d9443c01a7336-221a001565cmr428170805ad.40.1740666838385;
        Thu, 27 Feb 2025 06:33:58 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c8665sm15191845ad.156.2025.02.27.06.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 06:33:57 -0800 (PST)
Message-ID: <def1954c-078f-45a4-b3a6-a712aba6b344@rivosinc.com>
Date: Thu, 27 Feb 2025 15:33:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v2 11/11] riscv: sbi: Add bad fid tests
To: Andrew Jones <andrew.jones@linux.dev>, kvm-riscv@lists.infradead.org
Cc: atishp@rivosinc.com, jamestiotio@gmail.com
References: <20250227141946.91604-13-andrew.jones@linux.dev>
 <20250227142238.102412-2-andrew.jones@linux.dev>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250227142238.102412-2-andrew.jones@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_063359_290265_520FB513 
X-CRM114-Status: GOOD (  15.58  )
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

CgpPbiAyNy8wMi8yMDI1IDE1OjIyLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gRW5zdXJlIHdlIGdl
dCB0aGUgY29ycmVjdCBlcnJvciBjb2RlIHdoZW4gYXR0ZW1wdGluZyB0byB1c2UgYW4KPiBpbnZh
bGlkIEZJRC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFuZHJldy5qb25lc0Bs
aW51eC5kZXY+Cj4gLS0tCj4gIHJpc2N2L3NiaS1md2Z0LmMgIHwgIDIgKysKPiAgcmlzY3Yvc2Jp
LXRlc3RzLmggfCAgMiArKwo+ICByaXNjdi9zYmkuYyAgICAgICB8IDE4ICsrKysrKysrKysrKysr
KysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvcmlzY3Yvc2JpLWZ3ZnQuYyBiL3Jpc2N2L3NiaS1md2Z0LmMKPiBpbmRleCBjYTRkNDliNWRi
ODUuLmFjMmUzNDg2OWRmYSAxMDA2NDQKPiAtLS0gYS9yaXNjdi9zYmktZndmdC5jCj4gKysrIGIv
cmlzY3Yvc2JpLWZ3ZnQuYwo+IEBAIC0zMzksNiArMzM5LDggQEAgdm9pZCBjaGVja19md2Z0KHZv
aWQpCj4gIAkJcmV0dXJuOwo+ICAJfQo+ICAKPiArCXNiaV9iYWRfZmlkKFNCSV9FWFRfRldGVCk7
Cj4gKwo+ICAJZndmdF9jaGVja19iYXNlKCk7Cj4gIAlmd2Z0X2NoZWNrX21pc2FsaWduZWRfZXhj
X2RlbGVnKCk7Cj4gIAlmd2Z0X2NoZWNrX3B0ZV9hZF9od191cGRhdGluZygpOwo+IGRpZmYgLS1n
aXQgYS9yaXNjdi9zYmktdGVzdHMuaCBiL3Jpc2N2L3NiaS10ZXN0cy5oCj4gaW5kZXggN2M3ZmUz
MDU0MWU0Li5mOGNlM2MyNjlkNDggMTAwNjQ0Cj4gLS0tIGEvcmlzY3Yvc2JpLXRlc3RzLmgKPiAr
KysgYi9yaXNjdi9zYmktdGVzdHMuaAo+IEBAIC03MCw1ICs3MCw3IEBACj4gICNkZWZpbmUgc2Jp
cmV0X2NoZWNrKHJldCwgZXhwZWN0ZWRfZXJyb3IsIGV4cGVjdGVkX3ZhbHVlKSBcCj4gIAlzYmly
ZXRfcmVwb3J0KHJldCwgZXhwZWN0ZWRfZXJyb3IsIGV4cGVjdGVkX3ZhbHVlLCAiY2hlY2sgc2Jp
LmVycm9yIGFuZCBzYmkudmFsdWUiKQo+ICAKPiArdm9pZCBzYmlfYmFkX2ZpZChpbnQgZXh0KTsK
PiArCj4gICNlbmRpZiAvKiBfX0FTU0VNQkxZX18gKi8KPiAgI2VuZGlmIC8qIF9SSVNDVl9TQklf
VEVTVFNfSF8gKi8KPiBkaWZmIC0tZ2l0IGEvcmlzY3Yvc2JpLmMgYi9yaXNjdi9zYmkuYwo+IGlu
ZGV4IDFkOWQxODcxYTI4Yi4uMDQwNGJiODEzMTdkIDEwMDY0NAo+IC0tLSBhL3Jpc2N2L3NiaS5j
Cj4gKysrIGIvcmlzY3Yvc2JpLmMKPiBAQCAtNzIsNiArNzIsMTIgQEAgc3RhdGljIHN0cnVjdCBz
YmlyZXQgc2JpX3N5c3RlbV9zdXNwZW5kX3Jhdyh1bnNpZ25lZCBsb25nIHNsZWVwX3R5cGUsIHVu
c2lnbmVkIGwKPiAgCXJldHVybiBzYmlfZWNhbGwoU0JJX0VYVF9TVVNQLCAwLCBzbGVlcF90eXBl
LCByZXN1bWVfYWRkciwgb3BhcXVlLCAwLCAwLCAwKTsKPiAgfQo+ICAKPiArdm9pZCBzYmlfYmFk
X2ZpZChpbnQgZXh0KQo+ICt7Cj4gKwlzdHJ1Y3Qgc2JpcmV0IHJldCA9IHNiaV9lY2FsbChleHQs
IDB4YmFkLCAwLCAwLCAwLCAwLCAwLCAwKTsKPiArCXNiaXJldF9yZXBvcnRfZXJyb3IoJnJldCwg
U0JJX0VSUl9OT1RfU1VQUE9SVEVELCAiQmFkIEZJRCIpOwo+ICt9Cj4gKwo+ICBzdGF0aWMgdm9p
ZCBzdGFydF9jcHUodm9pZCAqZGF0YSkKPiAgewo+ICAJLyogbm90aGluZyB0byBkbyAqLwo+IEBA
IC0xNzgsNiArMTg0LDggQEAgc3RhdGljIHZvaWQgY2hlY2tfYmFzZSh2b2lkKQo+ICAKPiAgCXJl
cG9ydF9wcmVmaXhfcHVzaCgiYmFzZSIpOwo+ICAKPiArCXNiaV9iYWRfZmlkKFNCSV9FWFRfQkFT
RSk7Cj4gKwo+ICAJcmV0ID0gc2JpX2Jhc2UoU0JJX0VYVF9CQVNFX0dFVF9TUEVDX1ZFUlNJT04s
IDApOwo+ICAKPiAgCXJlcG9ydF9wcmVmaXhfcHVzaCgic3BlY192ZXJzaW9uIik7Cj4gQEAgLTMz
MSw2ICszMzksOCBAQCBzdGF0aWMgdm9pZCBjaGVja190aW1lKHZvaWQpCj4gIAkJcmV0dXJuOwo+
ICAJfQo+ICAKPiArCXNiaV9iYWRfZmlkKFNCSV9FWFRfVElNRSk7Cj4gKwo+ICAJcmVwb3J0X3By
ZWZpeF9wdXNoKCJzZXRfdGltZXIiKTsKPiAgCj4gIAlpbnN0YWxsX2lycV9oYW5kbGVyKElSUV9T
X1RJTUVSLCB0aW1lcl9pcnFfaGFuZGxlcik7Cj4gQEAgLTQzOCw2ICs0NDgsOCBAQCBzdGF0aWMg
dm9pZCBjaGVja19pcGkodm9pZCkKPiAgCQlyZXR1cm47Cj4gIAl9Cj4gIAo+ICsJc2JpX2JhZF9m
aWQoU0JJX0VYVF9JUEkpOwo+ICsKPiAgCWlmIChucl9jcHVzX3ByZXNlbnQgPCAyKSB7Cj4gIAkJ
cmVwb3J0X3NraXAoIkF0IGxlYXN0IDIgY3B1cyByZXF1aXJlZCIpOwo+ICAJCXJlcG9ydF9wcmVm
aXhfcG9wKCk7Cj4gQEAgLTczMSw2ICs3NDMsOCBAQCBzdGF0aWMgdm9pZCBjaGVja19oc20odm9p
ZCkKPiAgCQlyZXR1cm47Cj4gIAl9Cj4gIAo+ICsJc2JpX2JhZF9maWQoU0JJX0VYVF9IU00pOwo+
ICsKPiAgCXJlcG9ydF9wcmVmaXhfcHVzaCgiaGFydF9nZXRfc3RhdHVzIik7Cj4gIAo+ICAJaGFy
dGlkID0gY3VycmVudF90aHJlYWRfaW5mbygpLT5oYXJ0aWQ7Cj4gQEAgLTEyMTAsNiArMTIyNCw4
IEBAIHN0YXRpYyB2b2lkIGNoZWNrX2RiY24odm9pZCkKPiAgCQlyZXR1cm47Cj4gIAl9Cj4gIAo+
ICsJc2JpX2JhZF9maWQoU0JJX0VYVF9EQkNOKTsKPiArCj4gIAlyZXBvcnRfcHJlZml4X3B1c2go
IndyaXRlIik7Cj4gIAo+ICAJZGJjbl93cml0ZV90ZXN0KERCQ05fV1JJVEVfVEVTVF9TVFJJTkcs
IG51bV9ieXRlcywgZmFsc2UpOwo+IEBAIC0xNDc1LDYgKzE0OTEsOCBAQCBzdGF0aWMgdm9pZCBj
aGVja19zdXNwKHZvaWQpCj4gIAkJcmV0dXJuOwo+ICAJfQo+ICAKPiArCXNiaV9iYWRfZmlkKFNC
SV9FWFRfU1VTUCk7Cj4gKwo+ICAJdGltZXJfc2V0dXAoc3VzcF90aW1lcik7Cj4gIAlsb2NhbF9p
cnFfZW5hYmxlKCk7Cj4gIAl0aW1lcl9zdGFydChTQklfU1VTUF9USU1FUl9EVVJBVElPTl9VUyk7
CgpIaSBBbmRyZXcsCgpFdmVuIHRob3VnaCBpdCBkb2VzIG5vdCB2YWxpZGF0ZSAqYWxsKiBpbnZh
bGlkIGZpZCAod2hpY2ggd291bGQgYmUgb2YKY291cnNlIHRvbyBsb25nKSwgYXQgbGVhc3QgdGhh
dCdzIHNvbWV0aGluZy4KClJldmlld2VkLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZv
c2luYy5jb20+CgpUaGFua3MsCgpDbMOpbWVudAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QK
a3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
