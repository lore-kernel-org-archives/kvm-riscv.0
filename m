Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579B4C282EC
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 14:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TqNMyU6dHOAAyN63o98TA1Nusry9zPjbzEyRZZaU/1o=; b=K41eTHBAV6O6CQ
	bYaJFHXvQZs7MVY7mlCbTr8QHnwp9N4D1YlpKwNnN5yeFzPRRTwzCowtvM2+F6SgRUsr8KVa9+GOi
	6uKjhCG2wFh2Rwi2x/C083PDiwYUBOM8sln+SspnLSNBqiGRdKG8bc+Y29PYsT59HWeoC57di/JTY
	CJTW/vPlt9TuYfLTI8i1Eei8U14p2lJ2jV/JGkgy3PVJKdql0lmZ0zcYO0aG4hjE7sOBCLbFDeui8
	elR2a7ydJqOdS7aK6NNw8SqrHXI00GYW0IymXunXjCgNhCo9cEa9/3AtJwzeDM5U0p6UrsZKfCBJv
	f2X57gz5VL/LUyukgDng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5mi-0000000EN3f-0QNt;
	Fri, 14 Mar 2025 14:13:12 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5mf-0000000EN31-268a
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 14:13:10 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso1802524f8f.0
        for <kvm-riscv@lists.infradead.org>; Fri, 14 Mar 2025 07:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741961588; x=1742566388; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BOtTKHxsBlUHLqz7fX/nbjMS/2K5CqqYxWeMw7RofrY=;
        b=UmxB/kk1RYNhSkyeGh2stPJN4mRS+zWacTU6SUHqRw5O9SC47YXPK2XQxXRd6Xfwpz
         e+naaWXwssJE/KELw7SFxP3EJYgxiqTk37DJoGw+eZMcFwbu8ns+iJGlR2KHBOQiApDb
         PtbMY5etQoXxd32vbUcZcNuuERvM4NZ9mxonlxWzX+NCu60eOC1iumhr5Dfp0b2CCoqx
         MzMsdU34OC5uPxIxK6buswaY7LH6M6RnUoEOJzKLiUpk6RhVQqdi0WcC5RM2NRjYEple
         xcvv7rmvJBQh7Bn0cfy3h7rNIFPVs7Lm0AWVriNt2wf+3C8IC3ZxCnmeQtlLWwBz/Ssw
         z2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741961588; x=1742566388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BOtTKHxsBlUHLqz7fX/nbjMS/2K5CqqYxWeMw7RofrY=;
        b=C4bBAUHZMeDDc+sNdakYmljAtH2gOhQwAZROi1iKumkBrKxxrGHkVWrITAl/Si1SOC
         Nv0ytcx/83lyyVlvsZ7XDqfx3maJnhRhTetfBjn7lpBtbm+vyqgTb1FlRcVKpvXHlTln
         JIOKsHoTvSdU/Gvz98C/kxF3La5ejFKVb+v3N3XBPiKlqbBoxszZrjT0hCGMjXfwGTAI
         wmOe2wme4ns1LcCSI7xCy47TX7ct9AQ5UYHnNr9vBQ0hhRAp1VQK97c8NFt2Hwi6xFj6
         aVJs8jnMJcajrSLsn+6qjsvV/k9ZCMTuaIxXNTNsR7D+4MTnU6GD4Urdd7MVdYb9kUo2
         FvCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpHmA645CV5zdQW7va6I8yP30Lj1VwqblHugMF3F/HV7LW7pbss9Saijemnskot9d0c/uCwigot44=@lists.infradead.org
X-Gm-Message-State: AOJu0YyZlOIwMQgvHY2+qdgpcuGC1bGcTRfPsCziR7zuaFmhmzUBjUiM
	tpNxmIRIKoFcZCchmKphBCy9NVSQvklaSntAtPQqhYPD45LtNisZfxcdkiYkdyaMdUc/YBNCWFf
	R6Vg=
X-Gm-Gg: ASbGncuU5ve9XxUwNdXRQ/1v4P+24m20ne+2dxoGHJalQNtV7aITDU5zDUDwdeG8p5h
	4VJxxiPioQhxVeMScVLW2gB8auVMZqBgZZH3pOdd3s4DcUZQ/OKg3Kwe/lVDzuDP5FbciiTXyNA
	777prO7YwtL5SLtdQAs/5T+rAH12qI99QF/YhVkHMW2JVrOsqq14h83eCFqgtqUceYI1rBHdMFm
	t+OQ4Pya0Wg2KsonI7G9rTQiURN1y+m/+v+rKnKSsQfXN044q0DxMwT54YdftfYVmjkoBhcvUhY
	V+RcSavzQWTCe4hJOitAF2XbEJjYsv03shDKYP6qNU89OgGfkC2t743KWT6QbJ52YJWvOTPB9MF
	/j29wFhM7s5CXHQ==
X-Google-Smtp-Source: AGHT+IGCgacB9DRhpEgGF4RbE+sajD5loYzUCHp9z2MkOCzGetiv5BTF6BJDywIqB4bdKYjkoO5kRQ==
X-Received: by 2002:a5d:5f4b:0:b0:38a:88ac:f115 with SMTP id ffacd0b85a97d-3971e972011mr3870485f8f.34.1741961587861;
        Fri, 14 Mar 2025 07:13:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df3419sm5564046f8f.9.2025.03.14.07.13.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 07:13:07 -0700 (PDT)
Message-ID: <56451a0e-7971-4619-8b2e-84c5129547b4@rivosinc.com>
Date: Fri, 14 Mar 2025 15:13:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v9 6/6] riscv: sbi: Add SSE extension tests
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel
 <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
References: <20250314111030.3728671-1-cleger@rivosinc.com>
 <20250314111030.3728671-7-cleger@rivosinc.com>
 <20250314-0940c2c0dcd92b285f43e4ca@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250314-0940c2c0dcd92b285f43e4ca@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_071309_537663_D2B5E56C 
X-CRM114-Status: GOOD (  13.21  )
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

CgpPbiAxNC8wMy8yMDI1IDE1OjExLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gRnJpLCBNYXIg
MTQsIDIwMjUgYXQgMTI6MTA6MjlQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+IC4u
Lgo+PiArc3RhdGljIHZvaWQgc3NlX3Rlc3RfaW5qZWN0X2xvY2FsKHVpbnQzMl90IGV2ZW50X2lk
KQo+PiArewo+PiArCWludCBjcHU7Cj4+ICsJdWludDY0X3QgdGltZW91dDsKPj4gKwlzdHJ1Y3Qg
c2JpcmV0IHJldDsKPj4gKwlzdHJ1Y3Qgc3NlX2xvY2FsX3Blcl9jcHUgKmNwdV9hcmdzLCAqY3B1
X2FyZzsKPj4gKwlzdHJ1Y3Qgc3NlX2ZvcmVpZ25fY3B1X3Rlc3RfYXJnICpoYW5kbGVyX2FyZzsK
Pj4gKwo+PiArCWNwdV9hcmdzID0gY2FsbG9jKE5SX0NQVVMsIHNpemVvZihzdHJ1Y3Qgc2JpX3Nz
ZV9oYW5kbGVyX2FyZykpOwo+PiArCj4+ICsJcmVwb3J0X3ByZWZpeF9wdXNoKCJsb2NhbF9kaXNw
YXRjaCIpOwo+PiArCWZvcl9lYWNoX29ubGluZV9jcHUoY3B1KSB7Cj4+ICsJCWNwdV9hcmcgPSAm
Y3B1X2FyZ3NbY3B1XTsKPj4gKwkJY3B1X2FyZy0+aGFuZGxlcl9hcmcuZXZlbnRfaWQgPSBldmVu
dF9pZDsKPj4gKwkJY3B1X2FyZy0+YXJncy5zdGFjayA9IHNzZV9hbGxvY19zdGFjaygpOwo+PiAr
CQljcHVfYXJnLT5hcmdzLmhhbmRsZXIgPSBzc2VfZm9yZWlnbl9jcHVfaGFuZGxlcjsKPj4gKwkJ
Y3B1X2FyZy0+YXJncy5oYW5kbGVyX2RhdGEgPSAodm9pZCAqKSZjcHVfYXJnLT5oYW5kbGVyX2Fy
ZzsKPj4gKwkJY3B1X2FyZy0+c3RhdGUgPSBTQklfU1NFX1NUQVRFX1VOVVNFRDsKPj4gKwl9Cj4+
ICsKPj4gKwlvbl9jcHVzKHNzZV9yZWdpc3Rlcl9lbmFibGVfbG9jYWwsIGNwdV9hcmdzKTsKPj4g
Kwlmb3JfZWFjaF9vbmxpbmVfY3B1KGNwdSkgewo+PiArCQljcHVfYXJnID0gJmNwdV9hcmdzW2Nw
dV07Cj4+ICsJCXJldCA9IGNwdV9hcmctPnJldDsKPj4gKwkJaWYgKHJldC5lcnJvcikgewo+PiAr
CQkJcmVwb3J0X2ZhaWwoIkNQVSBmYWlsZWQgdG8gcmVnaXN0ZXIvZW5hYmxlIGV2ZW50OiAlbGQi
LCByZXQuZXJyb3IpOwo+PiArCQkJZ290byBjbGVhbnVwOwo+PiArCQl9Cj4+ICsKPj4gKwkJaGFu
ZGxlcl9hcmcgPSAmY3B1X2FyZy0+aGFuZGxlcl9hcmc7Cj4+ICsJCVdSSVRFX09OQ0UoaGFuZGxl
cl9hcmctPmV4cGVjdGVkX2NwdSwgY3B1KTsKPj4gKwkJLyogRm9yIGhhbmRsZXJfYXJnIGNvbnRl
bnQgdG8gYmUgdmlzaWJsZSBmb3Igb3RoZXIgQ1BVcyAqLwo+PiArCQlzbXBfd21iKCk7Cj4+ICsJ
CXJldCA9IHNiaV9zc2VfaW5qZWN0KGV2ZW50X2lkLCBjcHVzW2NwdV0uaGFydGlkKTsKPj4gKwkJ
aWYgKHJldC5lcnJvcikgewo+PiArCQkJcmVwb3J0X2ZhaWwoIkNQVSBmYWlsZWQgdG8gaW5qZWN0
IGV2ZW50OiAlbGQiLCByZXQuZXJyb3IpOwo+PiArCQkJZ290byBjbGVhbnVwOwo+PiArCQl9Cj4+
ICsJfQo+PiArCj4+ICsJZm9yX2VhY2hfb25saW5lX2NwdShjcHUpIHsKPj4gKwkJaGFuZGxlcl9h
cmcgPSAmY3B1X2FyZ3NbY3B1XS5oYW5kbGVyX2FyZzsKPj4gKwkJc21wX3JtYigpOwo+PiArCj4+
ICsJCXRpbWVvdXQgPSBzc2VfZXZlbnRfZ2V0X2NvbXBsZXRlX3RpbWVvdXQoKTsKPj4gKwkJd2hp
bGUgKCFSRUFEX09OQ0UoaGFuZGxlcl9hcmctPmRvbmUpIHx8IHRpbWVyX2dldF9jeWNsZXMoKSA8
IHRpbWVvdXQpIHsKPiAKPiBJIHBvaW50ZWQgdGhpcyBvdXQgaW4gdGhlIGxhc3QgcmV2aWV3LCB0
aGUgfHwgc2hvdWxkIGJlIGEgJiYuIFdlIGRvbid0Cj4gd2FudCB0byBrZWVwIHdhaXRpbmcgdW50
aWwgd2UgcmVhY2ggdGhlIHRpbWVvdXQgaWYgd2UgZ2V0IHRoZSBkb25lIHNpZ25hbAo+IGVhcmxp
ZXIuCgpNaXNzZWQgaXQuIEknbGwgcmVzZW5kIGEgVjEwIGlmIHlvdSBkb24ndCBoYXZlIGFueSBv
dGhlciBjb21tZW50cy4KClRoYW5rcywKCkNsw6ltZW50Cgo+IAo+PiArCQkJLyogRm9yIGhhbmRs
ZXJfYXJnIHVwZGF0ZSB0byBiZSB2aXNpYmxlICovCj4+ICsJCQlzbXBfcm1iKCk7Cj4+ICsJCQlj
cHVfcmVsYXgoKTsKPj4gKwkJfQo+PiArCQlyZXBvcnQoUkVBRF9PTkNFKGhhbmRsZXJfYXJnLT5k
b25lKSwgIkV2ZW50IGhhbmRsZWQiKTsKPj4gKwkJV1JJVEVfT05DRShoYW5kbGVyX2FyZy0+ZG9u
ZSwgZmFsc2UpOwo+PiArCX0KPj4gKwo+PiArY2xlYW51cDoKPj4gKwlvbl9jcHVzKHNiaV9zc2Vf
ZGlzYWJsZV91bnJlZ2lzdGVyX2xvY2FsLCBjcHVfYXJncyk7Cj4+ICsJZm9yX2VhY2hfb25saW5l
X2NwdShjcHUpIHsKPj4gKwkJY3B1X2FyZyA9ICZjcHVfYXJnc1tjcHVdOwo+PiArCQlyZXQgPSBS
RUFEX09OQ0UoY3B1X2FyZy0+cmV0KTsKPj4gKwkJaWYgKHJldC5lcnJvcikKPj4gKwkJCXJlcG9y
dF9mYWlsKCJDUFUgZmFpbGVkIHRvIGRpc2FibGUvdW5yZWdpc3RlciBldmVudDogJWxkIiwgcmV0
LmVycm9yKTsKPj4gKwl9Cj4+ICsKPj4gKwlmb3JfZWFjaF9vbmxpbmVfY3B1KGNwdSkgewo+PiAr
CQljcHVfYXJnID0gJmNwdV9hcmdzW2NwdV07Cj4+ICsJCXNzZV9mcmVlX3N0YWNrKGNwdV9hcmct
PmFyZ3Muc3RhY2spOwo+PiArCX0KPj4gKwo+PiArCXJlcG9ydF9wcmVmaXhfcG9wKCk7Cj4+ICt9
Cj4+ICsKPj4gK3N0YXRpYyB2b2lkIHNzZV90ZXN0X2luamVjdF9nbG9iYWxfY3B1KHVpbnQzMl90
IGV2ZW50X2lkLCB1bnNpZ25lZCBpbnQgY3B1LAo+PiArCQkJCSAgICAgICBzdHJ1Y3Qgc3NlX2Zv
cmVpZ25fY3B1X3Rlc3RfYXJnICp0ZXN0X2FyZykKPj4gK3sKPj4gKwl1bnNpZ25lZCBsb25nIHZh
bHVlOwo+PiArCXN0cnVjdCBzYmlyZXQgcmV0Owo+PiArCXVpbnQ2NF90IHRpbWVvdXQ7Cj4+ICsJ
ZW51bSBzYmlfc3NlX3N0YXRlIHN0YXRlOwo+PiArCj4+ICsJV1JJVEVfT05DRSh0ZXN0X2FyZy0+
ZXhwZWN0ZWRfY3B1LCBjcHUpOwo+PiArCS8qIEZvciB0ZXN0X2FyZyBjb250ZW50IHRvIGJlIHZp
c2libGUgZm9yIG90aGVyIENQVXMgKi8KPj4gKwlzbXBfd21iKCk7Cj4+ICsJdmFsdWUgPSBjcHU7
Cj4+ICsJcmV0ID0gc2JpX3NzZV93cml0ZV9hdHRycyhldmVudF9pZCwgU0JJX1NTRV9BVFRSX1BS
RUZFUlJFRF9IQVJULCAxLCAmdmFsdWUpOwo+PiArCWlmICghc2JpcmV0X3JlcG9ydF9lcnJvcigm
cmV0LCBTQklfU1VDQ0VTUywgIlNldCBwcmVmZXJyZWQgaGFydCIpKQo+PiArCQlyZXR1cm47Cj4+
ICsKPj4gKwlyZXQgPSBzYmlfc3NlX2VuYWJsZShldmVudF9pZCk7Cj4+ICsJaWYgKCFzYmlyZXRf
cmVwb3J0X2Vycm9yKCZyZXQsIFNCSV9TVUNDRVNTLCAiRW5hYmxlIGV2ZW50IikpCj4+ICsJCXJl
dHVybjsKPj4gKwo+PiArCXJldCA9IHNiaV9zc2VfaW5qZWN0KGV2ZW50X2lkLCBjcHUpOwo+PiAr
CWlmICghc2JpcmV0X3JlcG9ydF9lcnJvcigmcmV0LCBTQklfU1VDQ0VTUywgIkluamVjdCBldmVu
dCIpKQo+PiArCQlnb3RvIGRpc2FibGU7Cj4+ICsKPj4gKwlzbXBfcm1iKCk7Cj4+ICsJdGltZW91
dCA9IHNzZV9ldmVudF9nZXRfY29tcGxldGVfdGltZW91dCgpOwo+PiArCXdoaWxlICghUkVBRF9P
TkNFKHRlc3RfYXJnLT5kb25lKSB8fCB0aW1lcl9nZXRfY3ljbGVzKCkgPCB0aW1lb3V0KSB7Cj4g
Cj4gc2FtZSBjb21tZW50Cj4gCj4+ICsJCS8qIEZvciBzaGFyZWQgdGVzdF9hcmcgc3RydWN0dXJl
ICovCj4+ICsJCXNtcF9ybWIoKTsKPj4gKwkJY3B1X3JlbGF4KCk7Cj4+ICsJfQo+PiArCj4+ICsJ
cmVwb3J0KFJFQURfT05DRSh0ZXN0X2FyZy0+ZG9uZSksICJldmVudCBoYW5kbGVyIGNhbGxlZCIp
Owo+PiArCVdSSVRFX09OQ0UodGVzdF9hcmctPmRvbmUsIGZhbHNlKTsKPj4gKwo+PiArCXRpbWVv
dXQgPSBzc2VfZXZlbnRfZ2V0X2NvbXBsZXRlX3RpbWVvdXQoKTsKPj4gKwkvKiBXYWl0IGZvciBl
dmVudCB0byBiZSBiYWNrIGluIEVOQUJMRUQgc3RhdGUgKi8KPj4gKwlkbyB7Cj4+ICsJCXJldCA9
IHNzZV9ldmVudF9nZXRfc3RhdGUoZXZlbnRfaWQsICZzdGF0ZSk7Cj4+ICsJCWlmIChyZXQuZXJy
b3IpCj4+ICsJCQlnb3RvIGRpc2FibGU7Cj4+ICsJCWNwdV9yZWxheCgpOwo+PiArCX0gd2hpbGUg
KHN0YXRlICE9IFNCSV9TU0VfU1RBVEVfRU5BQkxFRCB8fCB0aW1lcl9nZXRfY3ljbGVzKCkgPCB0
aW1lb3V0KTsKPiAKPiBzYW1lIGNvbW1lbnQKPiAKPiBPdGhlcndpc2UsCj4gCj4gUmV2aWV3ZWQt
Ynk6IEFuZHJldyBKb25lcyA8YW5kcmV3LmpvbmVzQGxpbnV4LmRldj4KPiAKPiBUaGFua3MsCj4g
ZHJldwoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJp
c2N2Cg==
