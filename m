Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A82C021BB
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 16:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pwEy2lvlVRyKs31Pd+AJNJg/Xh4eYRtMvJZFcuuLkDM=; b=o1hosnMy2dJf0/
	dO/51Kg44IA3KfyzZfqNrDNAs6YOrKlVQL0eANi2Bou2Mwam8H+uj6tLEk2D/0eNxZbIXYRFipxP4
	EAOr3Hj7uLhn9aCWOTx5X4AP5xr2IL4s15Ipy32Rdw6rsQJNrNxe6CCEpndSc8/HM8pqL5I9tUZAg
	J1/G4KWtwCklY+bRaiub1bycRe2LbEgYfs+rwz/KELXRHsk+Are+j9esMevENigLd/igwT07qpns7
	MgwZqGZfs+Wmk92pVPtQmBniswqgn8pzjjHBEM6Iqg6KtlvF5Y/AGDGCfXEjYa+6ZmuXqZE3SRi8a
	LskK5emIcsP3tQ76hbIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy1N-00000000M8P-1LoZ;
	Tue, 25 Feb 2025 16:43:01 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmwjJ-000000003VO-0Vnn
	for kvm-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 15:20:18 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-220e6028214so126258385ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Feb 2025 07:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740496816; x=1741101616; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+QbMC4BTh28m8n5wJleaY9ka8fH9/c2Ubzdv6xalj84=;
        b=3M+PzkNOwqar9cPWvp8T7GqGZYwSIpX9H+DUahWifF4B5I1kgLI8lLRoyCX7df9dRt
         z9Lu+tc24gize+yaJBKebH3IFxCw0Yu2KgYCLqDBHzeRF2vns5ziIS7q2SyPkQoBvdAT
         kdThze7BUEWynn24owGfHkeAJSZCKmqtYqHiwid6GX5y+7b2tkA1msF3YiCer83bzrVR
         3pJJMHNijiVWD24joJ+9w46UzmtwkfUevJXpDqwARslBaj//8iDCKhRQlvmif4V9nOsk
         8mXarjK7rpxz5pTyEue8hgY7wE1BJeMZB1YDt8VZOro5BZm53qMuRlsTpKsQxfAW0pHR
         HbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740496816; x=1741101616;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+QbMC4BTh28m8n5wJleaY9ka8fH9/c2Ubzdv6xalj84=;
        b=E/g+XdesaiK2xk2oJqlZRlaKble1m7N0qQgiCx6RShCPSS460V03qNVyYG7Rw7rHGb
         RWWxJEvCRyqDUHEpA2H6z2DYuLZfbhfK7zJe8C6Hn6FXukuvWs9rjm3Nts7MZD2DeTRW
         vsF1Gtuf/nxMOfYOfVG/Qs4f3sH01OIFzUGvPGF1+iU9URnjhC1nvak71JdSg4/MOvtx
         OLZk71R+dpDItFWtkO2C9f243OI/w/trgMuHr5zVTG7Fi7UBmZa6YKo4VdsSOKCXi/WQ
         kRkXCpzqf7mWaW8ZiiD7Qs+DgquwG+7r2kPXgUj420tssB7CJ4KPF0Y/Qiufu/7vsfPF
         lUxw==
X-Forwarded-Encrypted: i=1; AJvYcCUOc/dL2WiJhVrnV5HTsy/LtWfmIvTLMRa0PDKXsGyZSoKErAaxrJDBuuymYQzDbznO0JE6a8qHm3A=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywny5SdcWd4c3f/vlwibUzRpiD8L8jAYSLo+MpwoA6hwAyeHM7o
	4N2qNSQ+LvZlM6J1AblZTOJCeKzqfs0qWjL81NEGtF6OW21Leo+Nda4RMMMZfP0=
X-Gm-Gg: ASbGnct4VeEz+EX04Sj8aZUBiUclx1a2xebJqiQzd3q185tJOpdbRZ+egSjQRIrCHm0
	lVQqgk2kYqyN6K+wEA6HDo2w0ZE4/o9gKE3eIf5WIbgURfINL4X2lqJz98eiqPAqQkQwJFhIJXx
	6Y7td4HkL4CzOYSwvitRnPLlHx8bFRtwv7aMmoD3riG3U5MccqCpZ6PVD2MMX1xHp2eg+x15zxP
	HklaatGnwAmY2t7ozu/a2ovEM2Yx3Q0g3y7UnuYnP+HoQwXCWe5y+EsbeZ9Vaf8DPWLYF1VXNG3
	U4/F9gexjwfchq+qk6LqTx2yumQgJ4upjBKwsypRVxaHD1zINGFCXcnuaSemxsMqOrd7hD4=
X-Google-Smtp-Source: AGHT+IF8gjneRNl5P84CW/SjpXsoOdTm5J8/r+Y2sQiQvRq/nGy4NZswtrJ56L+bD8OrY+akQ+Terg==
X-Received: by 2002:a17:903:244a:b0:220:ca39:d453 with SMTP id d9443c01a7336-2219ff9e9abmr295503365ad.17.1740496816071;
        Tue, 25 Feb 2025 07:20:16 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a092f3esm15466965ad.141.2025.02.25.07.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 07:20:15 -0800 (PST)
Message-ID: <1317d157-da5a-4edd-8b3c-619f3ad29cbb@rivosinc.com>
Date: Tue, 25 Feb 2025 16:20:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 09/10] riscv: sbi: susp: Check upper bits
 of sleep_type are ignored
To: Andrew Jones <andrew.jones@linux.dev>, kvm-riscv@lists.infradead.org
Cc: atishp@rivosinc.com, jamestiotio@gmail.com
References: <20250221155533.123418-12-andrew.jones@linux.dev>
 <20250221155533.123418-21-andrew.jones@linux.dev>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250221155533.123418-21-andrew.jones@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_072017_172685_CC6E4474 
X-CRM114-Status: GOOD (  19.33  )
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

CgpPbiAyMS8wMi8yMDI1IDE2OjU1LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gV2hlbiBhbiBTQkkg
ZnVuY3Rpb24gcGFyYW1ldGVyIGhhcyBhIHNwZWNpZmljIGJpdCB3aWR0aCB3aGljaCBpcwo+IGxl
c3MgdGhhbiB0aGF0IG9mIGEgbG9uZywgdGhlbiB0aGUgdXBwZXIgYml0cyBzaG91bGQgYmUgaWdu
b3JlZAo+IGJ5IHRoZSBTQkkgaW1wbGVtZW50YXRpb24uIEkuZS4gc2luY2Ugc2xlZXBfdHlwZSBp
cyBhIHVpbnQzMl90LAo+IHRoZW4gb24gcnY2NCBib3RoIDAgYW5kIDB4MV8wMDAwXzAwMDAgYXJl
IHZhbGlkIGFuZCBtZWFuIHN1c3BlbmQKPiB0byByYW0uCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5k
cmV3IEpvbmVzIDxhbmRyZXcuam9uZXNAbGludXguZGV2Pgo+IC0tLQo+ICByaXNjdi9zYmkuYyB8
IDMyICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
NiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9yaXNjdi9z
YmkuYyBiL3Jpc2N2L3NiaS5jCj4gaW5kZXggZTVmNmUxYzcyYWU2Li4xZDlkMTg3MWEyOGIgMTAw
NjQ0Cj4gLS0tIGEvcmlzY3Yvc2JpLmMKPiArKysgYi9yaXNjdi9zYmkuYwo+IEBAIC02Nyw3ICs2
Nyw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc2JpcmV0IHNiaV9oYXJ0X3N1c3BlbmRfcmF3KHVuc2lnbmVk
IGxvbmcgc3VzcGVuZF90eXBlLCB1bnNpZ25lZCBsCj4gIAlyZXR1cm4gc2JpX2VjYWxsKFNCSV9F
WFRfSFNNLCBTQklfRVhUX0hTTV9IQVJUX1NVU1BFTkQsIHN1c3BlbmRfdHlwZSwgcmVzdW1lX2Fk
ZHIsIG9wYXF1ZSwgMCwgMCwgMCk7Cj4gIH0KPiAgCj4gLXN0YXRpYyBzdHJ1Y3Qgc2JpcmV0IHNi
aV9zeXN0ZW1fc3VzcGVuZCh1aW50MzJfdCBzbGVlcF90eXBlLCB1bnNpZ25lZCBsb25nIHJlc3Vt
ZV9hZGRyLCB1bnNpZ25lZCBsb25nIG9wYXF1ZSkKPiArc3RhdGljIHN0cnVjdCBzYmlyZXQgc2Jp
X3N5c3RlbV9zdXNwZW5kX3Jhdyh1bnNpZ25lZCBsb25nIHNsZWVwX3R5cGUsIHVuc2lnbmVkIGxv
bmcgcmVzdW1lX2FkZHIsIHVuc2lnbmVkIGxvbmcgb3BhcXVlKQo+ICB7Cj4gIAlyZXR1cm4gc2Jp
X2VjYWxsKFNCSV9FWFRfU1VTUCwgMCwgc2xlZXBfdHlwZSwgcmVzdW1lX2FkZHIsIG9wYXF1ZSwg
MCwgMCwgMCk7Cj4gIH0KPiBAQCAtMTM2Nyw2ICsxMzY3LDE5IEBAIHN0YXRpYyBib29sIHN1c3Bf
dHlwZV9wcmVwKHVuc2lnbmVkIGxvbmcgY3R4W10sIHN0cnVjdCBzdXNwX3BhcmFtcyAqcGFyYW1z
KQo+ICAJcmV0dXJuIHRydWU7Cj4gIH0KPiAgCj4gKyNpZiBfX3Jpc2N2X3hsZW4gIT0gMzIKPiAr
c3RhdGljIGJvb2wgc3VzcF90eXBlX3ByZXAyKHVuc2lnbmVkIGxvbmcgY3R4W10sIHN0cnVjdCBz
dXNwX3BhcmFtcyAqcGFyYW1zKQo+ICt7Cj4gKwlib29sIHI7Cj4gKwo+ICsJciA9IHN1c3BfYmFz
aWNfcHJlcChjdHgsIHBhcmFtcyk7Cj4gKwlhc3NlcnQocik7Cj4gKwlwYXJhbXMtPnNsZWVwX3R5
cGUgPSBCSVQoMzIpOwo+ICsKPiArCXJldHVybiB0cnVlOwo+ICt9Cj4gKyNlbmRpZgo+ICsKPiAg
c3RhdGljIGJvb2wgc3VzcF9iYWRhZGRyX3ByZXAodW5zaWduZWQgbG9uZyBjdHhbXSwgc3RydWN0
IHN1c3BfcGFyYW1zICpwYXJhbXMpCj4gIHsKPiAgCXBoeXNfYWRkcl90IGJhZGFkZHI7Cj4gQEAg
LTE0MzIsNiArMTQ0NSw3IEBAIHN0YXRpYyB2b2lkIGNoZWNrX3N1c3Aodm9pZCkKPiAgI2RlZmlu
ZSBTVVNQX0ZJUlNUX1RFU1ROVU0gMQo+ICAJCVNVU1BfQkFTSUMgPSBTVVNQX0ZJUlNUX1RFU1RO
VU0sCj4gIAkJU1VTUF9UWVBFLAo+ICsJCVNVU1BfVFlQRTIsCj4gIAkJU1VTUF9CQURfQUREUiwK
PiAgCQlTVVNQX09ORV9PTkxJTkUsCj4gIAkJTlJfU1VTUF9URVNUUywKPiBAQCAtMTQ0MSwxMCAr
MTQ1NSwxMyBAQCBzdGF0aWMgdm9pZCBjaGVja19zdXNwKHZvaWQpCj4gIAkJYm9vbCAoKnByZXAp
KHVuc2lnbmVkIGxvbmcgY3R4W10sIHN0cnVjdCBzdXNwX3BhcmFtcyAqcGFyYW1zKTsKPiAgCQl2
b2lkICgqY2hlY2spKHVuc2lnbmVkIGxvbmcgY3R4W10sIHN0cnVjdCBzdXNwX3BhcmFtcyAqcGFy
YW1zKTsKPiAgCX0gc3VzcF90ZXN0c1tdID0gewo+IC0JCVtTVVNQX0JBU0lDXQkJPSB7ICJiYXNp
YyIsCQlzdXNwX2Jhc2ljX3ByZXAsCXN1c3BfYmFzaWNfY2hlY2ssCX0sCj4gLQkJW1NVU1BfVFlQ
RV0JCT0geyAic2xlZXBfdHlwZSIsCXN1c3BfdHlwZV9wcmVwLAkJCQkJfSwKPiAtCQlbU1VTUF9C
QURfQUREUl0JCT0geyAiYmFkIGFkZHIiLAkJc3VzcF9iYWRhZGRyX3ByZXAsCQkJCX0sCj4gLQkJ
W1NVU1BfT05FX09OTElORV0JPSB7ICJvbmUgY3B1IG9ubGluZSIsCXN1c3Bfb25lX3ByZXAsCQkJ
CQl9LAo+ICsJCVtTVVNQX0JBU0lDXQkJPSB7ICJiYXNpYyIsCQkJc3VzcF9iYXNpY19wcmVwLAlz
dXNwX2Jhc2ljX2NoZWNrLAl9LAo+ICsJCVtTVVNQX1RZUEVdCQk9IHsgInNsZWVwX3R5cGUiLAkJ
c3VzcF90eXBlX3ByZXAsCQkJCQl9LAo+ICsjaWYgX19yaXNjdl94bGVuICE9IDMyCj4gKwkJW1NV
U1BfVFlQRTJdCQk9IHsgInNsZWVwX3R5cGUgdXBwZXIgYml0cyIsCXN1c3BfdHlwZV9wcmVwMiwJ
c3VzcF9iYXNpY19jaGVjawl9LAo+ICsjZW5kaWYKPiArCQlbU1VTUF9CQURfQUREUl0JCT0geyAi
YmFkIGFkZHIiLAkJCXN1c3BfYmFkYWRkcl9wcmVwLAkJCQl9LAo+ICsJCVtTVVNQX09ORV9PTkxJ
TkVdCT0geyAib25lIGNwdSBvbmxpbmUiLAkJc3VzcF9vbmVfcHJlcCwJCQkJCX0sCj4gIAl9Owo+
ICAJc3RydWN0IHN1c3BfcGFyYW1zIHBhcmFtczsKPiAgCXN0cnVjdCBzYmlyZXQgcmV0Owo+IEBA
IC0xNDY2LDYgKzE0ODMsOSBAQCBzdGF0aWMgdm9pZCBjaGVja19zdXNwKHZvaWQpCj4gIAlyZXBv
cnQocmV0LmVycm9yID09IFNCSV9FUlJfTk9UX1NVUFBPUlRFRCwgImZ1bmNpZCAhPSAwIG5vdCBz
dXBwb3J0ZWQiKTsKPiAgCj4gIAlmb3IgKGkgPSBTVVNQX0ZJUlNUX1RFU1ROVU07IGkgPCBOUl9T
VVNQX1RFU1RTOyBpKyspIHsKPiArCQlpZiAoIXN1c3BfdGVzdHNbaV0ubmFtZSkKPiArCQkJY29u
dGludWU7Cj4gKwoKSGkgQW5kcmV3LAoKWW91IGNvdWxkIGhhdmUgYXMgd2VsbCBwdXQgYW4gI2lm
ZGVmIGFyb3VuZCBTVVNQX1RZUEUyIGRlZmluaXRpb24gaW4gdGhlCmVudW0gcmF0aGVyIHRoYW4g
cmVseWluZyBvbiBuYW1lIHRvIGJlICE9IE5VTEwuIEJ1dCBJJ20gb2sgZWl0aGVyIHdheSA7KQoK
UmV2aWV3ZWQtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KClRoYW5r
cywKCkNsw6ltZW50Cgo+ICAJCXJlcG9ydF9wcmVmaXhfcHVzaChzdXNwX3Rlc3RzW2ldLm5hbWUp
Owo+ICAKPiAgCQljdHhbU0JJX1NVU1BfVEVTVE5VTV9JRFhdID0gaTsKPiBAQCAtMTQ4MCw3ICsx
NTAwLDcgQEAgc3RhdGljIHZvaWQgY2hlY2tfc3VzcCh2b2lkKQo+ICAJCX0KPiAgCj4gIAkJaWYg
KCh0ZXN0bnVtID0gc2V0am1wKHNiaV9zdXNwX2ptcCkpID09IDApIHsKPiAtCQkJcmV0ID0gc2Jp
X3N5c3RlbV9zdXNwZW5kKHBhcmFtcy5zbGVlcF90eXBlLCBwYXJhbXMucmVzdW1lX2FkZHIsIHBh
cmFtcy5vcGFxdWUpOwo+ICsJCQlyZXQgPSBzYmlfc3lzdGVtX3N1c3BlbmRfcmF3KHBhcmFtcy5z
bGVlcF90eXBlLCBwYXJhbXMucmVzdW1lX2FkZHIsIHBhcmFtcy5vcGFxdWUpOwo+ICAKPiAgCQkJ
bG9jYWxfaXJxX2VuYWJsZSgpOwo+ICAKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0t
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
