Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B46C3DA6D
	for <kvm-riscv@archiver.kernel.org>; Tue, 20 May 2025 08:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rcnH/V4DD/OvUG/COuPE0FsWTQVQ9BV2YOIbcEoB/1w=; b=aTNdXfH5zFvBtK
	d8tP05G9VPffjnL3As1t3HFgwoF8wo5u9J1LzQGYsff44nLV8KhS6bMX9aYt9HMeG96dhmul8oWR0
	KCb2Ud+O5+RaiaNrUQ81cJHoBvUYk5TQxlmJETDzkRz6481oRz4oK6fRLndxFnaf5OExY2sO2CTEw
	Ja5xDRujtaKR6XwUA9cMPtiVlysaPU2tsReFFkkNjP5wbcqgInVb20x42Zhrb1BbPyuNRD/MPVAIR
	QpA1YHmZ4oVLfdl0ykWmvkS6lkU3rn/mCzCN7BPK+nzs/ZZ0lyJ6KdDnyUcSMYomg2+//9ndB7D0g
	c6m7fIQIQTYtxPF2dmNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHICY-0000000C00L-3A3s;
	Tue, 20 May 2025 08:19:54 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHICV-0000000BzzJ-1VgE
	for kvm-riscv@lists.infradead.org;
	Tue, 20 May 2025 08:19:53 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso39666935e9.2
        for <kvm-riscv@lists.infradead.org>; Tue, 20 May 2025 01:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747729189; x=1748333989; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rg4dqqae5QAhm/jj8YkR21SQpKcd2PY6mEVX2p2RC/E=;
        b=2Iu9HT9XWpsuD5WgAUgXC4QnvqpQClOx9hHocMr4DN6owbf2puQJMrUW3zT598315N
         Uie+TyJHhDm63ecQhv38wCQMIggEiZc57u2IIZwYXiE0V7za2iYEjaSZhGCKlMJAUgfP
         AoQWT38gOy3OTUgN4SO/Ajrm99BNZyQj3hEvAMOFb94fTOhmW/DgBSKUMN164RbFitOP
         jDiv3opy5v/rrZKJHofHXsz9nCNNknSckmkFVV/xsgy3xvKnPegsbx+pjzYjaMirvVX1
         khzlsFIKy3sBsL8/h64flP3VkhXo85zH4h/FMQCUKgePWTG/+LdJ64QtzVT4lD/uwU6A
         VOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747729189; x=1748333989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rg4dqqae5QAhm/jj8YkR21SQpKcd2PY6mEVX2p2RC/E=;
        b=QTVWohVUGAONvpEvtUyhJ3KaazGw70qtqqYY7IkE1atiJgf7RiocoBbOuAciXjXuB4
         JmdmznQUeSkSaCoWnK3lVGZ8ePSUMjgd+dy7JgCP3VWHE/KawlwL+vJ70F82eDtIarFe
         sSatSWBgGbrLRLj3fFdyymCjlWUxotencBFrE45MJCPhqBBBXmjicOIoW2RLHDxhUNtR
         ph7fda3PTeiUt+5Xiw9Bg88pJokexWVREVErNNehx0/5yf4gucBPnV7Wg4l3IZcEPIRy
         tIqYZzzf2GUQ9vu1CY0wPRPpp6f8CKr3m3rdDn6MWqGlCO3z7hC6jBEyupCCL0Jyx8FM
         53gg==
X-Forwarded-Encrypted: i=1; AJvYcCVpJhYYumqwGIH2OWzp8bQ/tI7HfiaT6gM0jH5bkihu4vS0VfUxzPinFXlzgANv7Nk0+WLCk/aViS4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxBcJ5Xvu5y3WFvMr4JWkqQ8+4EnZqocFipV2+S13t4vxqeGiR6
	5ppnobIozbjwx2r1oi415O5J4Mx7QbdLg01MJGMmJbcnO7xgg+c7DZLbKnnP+Q4WESw=
X-Gm-Gg: ASbGncu2eTscA6oZcbQfD31BRJJusjT6/V92JuBeIK3+vi06V3bGVHxcPLIDGcusNSx
	SszlYYe4SzCElyzs2Ix4uz4ze77AYrqp15+4kyvbdeFF3mp6BiqBrDGXmooGGvi0k+TUFDGg2hL
	TnYQo7i+qkoTAthcYiiLeyJ0hm0iEYdwA1G4AOKdReXKrTf4vZDw+njo9wspca060hpC62QZuv7
	C+AdfGU8rsRHQ90mDXEVE50NxwODE2NHt1vvNwKfd7toapyw7LgqrIP4K7aYTiwsLS7hrPtvAR7
	SyflGb9HfEJcKT+ZMPn5UqWJpOD6GzR5j/vaeUHkjcA1U02VQwkkiErblT4kmbZbJZOmyoeYDtN
	Qyzrg3YaAeRbWIFIZpwTH
X-Google-Smtp-Source: AGHT+IEnBNI1O6DOXTrHnPp911hPTHbpDnBVZzrdBEbI+pdS0MKdIeQtQ/je5/atfqHW1EnEtC8JdA==
X-Received: by 2002:a05:600c:1c03:b0:43d:2313:7b49 with SMTP id 5b1f17b1804b1-442fd627744mr144511695e9.12.1747729189050;
        Tue, 20 May 2025 01:19:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aea59sm21045525e9.25.2025.05.20.01.19.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 01:19:48 -0700 (PDT)
Message-ID: <126762fc-17ca-4e9d-94d0-3aed1ae321ff@rivosinc.com>
Date: Tue, 20 May 2025 10:19:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/14] riscv: misaligned: move emulated access
 uniformity check in a function
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>,
 Andrew Jones <ajones@ventanamicro.com>, Deepak Gupta <debug@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
 <20250515082217.433227-10-cleger@rivosinc.com> <aCu_ce-kVQsyjrh5@ghost>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <aCu_ce-kVQsyjrh5@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_011951_392444_9F8474C7 
X-CRM114-Status: GOOD (  19.35  )
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

CgpPbiAyMC8wNS8yMDI1IDAxOjMyLCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4gT24gVGh1LCBN
YXkgMTUsIDIwMjUgYXQgMTA6MjI6MTBBTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+
PiBTcGxpdCB0aGUgY29kZSB0aGF0IGNoZWNrIGZvciB0aGUgdW5pZm9ybWl0eSBvZiBtaXNhbGln
bmVkIGFjY2Vzc2VzCj4+IHBlcmZvcm1hbmNlIG9uIGFsbCBjcHVzIGZyb20gY2hlY2tfdW5hbGln
bmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cygpCj4+IHRvIGl0cyBvd24gZnVuY3Rpb24gd2hp
Y2ggd2lsbCBiZSB1c2VkIGZvciBkZWxlZ2F0aW9uIGNoZWNrLiBObwo+PiBmdW5jdGlvbmFsIGNo
YW5nZXMgaW50ZW5kZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xl
Z2VyQHJpdm9zaW5jLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+Cj4+IC0tLQo+PiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxp
Z25lZC5jIHwgMjAgKysrKysrKysrKysrKystLS0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlz
YWxpZ25lZC5jCj4+IGluZGV4IGU1NTFiYTE3ZjU1Ny4uMjg3ZWMzNzAyMWM4IDEwMDY0NAo+PiAt
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKPj4gKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCj4+IEBAIC02NDcsNiArNjQ3LDE4IEBAIGJv
b2wgX19pbml0IGNoZWNrX3ZlY3Rvcl91bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVz
KHZvaWQpCj4+ICB9Cj4+ICAjZW5kaWYKPj4gIAo+PiArc3RhdGljIGJvb2wgYWxsX2NwdXNfdW5h
bGlnbmVkX3NjYWxhcl9hY2Nlc3NfZW11bGF0ZWQodm9pZCkKPj4gK3sKPj4gKwlpbnQgY3B1Owo+
PiArCj4+ICsJZm9yX2VhY2hfb25saW5lX2NwdShjcHUpCj4+ICsJCWlmIChwZXJfY3B1KG1pc2Fs
aWduZWRfYWNjZXNzX3NwZWVkLCBjcHUpICE9Cj4gCj4gbWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQg
aXMgb25seSBkZWZpbmVkIHdoZW4KPiBDT05GSUdfUklTQ1ZfU0NBTEFSX01JU0FMSUdORUQuIFRo
aXMgZnVuY3Rpb24gc2hvdWxkIHJldHVybiBmYWxzZSB3aGVuCj4gIUNPTkZJR19SSVNDVl9TQ0FM
QVJfTUlTQUxJR05FRCBhbmQgb25seSB1c2UgdGhpcyBsb2dpYyBvdGhlcndpc2UuCgpIaSBDaGFy
bGllLAoKbWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQgaXMgZGVmaW5lZCBpbiB1bmFsaWduZWRfYWNj
ZXNzX3NwZWVkLmMgd2hpY2ggaXMKY29tcGlsZWQgYmFzZWQgb24gQ09ORklHX1JJU0NWX01JU0FM
SUdORUQgKGRpdHRvIGZvciB0cmFwX21pc2FsaWduZWQuYykKCm9iai0kKENPTkZJR19SSVNDVl9N
SVNBTElHTkVEKQkrPSB1bmFsaWduZWRfYWNjZXNzX3NwZWVkLm8KCkhvd2V2ZXIsIHRoZSBkZWNs
YXJhdGlvbiBmb3IgaXQgaW4gdGhlIGhlYWRlciBjcHUtZmVhdHVyZS5oIGhvd2V2ZXIgaXMKdW5k
ZXIgYSBDT05GSUdfUklTQ1ZfU0NBTEFSX01JU0FMSUdORUQgaWZkZWYuIFNvIGVpdGhlciB0aGUg
ZGVjbGFyYXRpb24Kb3IgdGhlIGRlZmluaXRpb24gaXMgd3JvbmcgYnV0IHRoZSBpZmRlZmVyeSBz
b3VwIG1ha2VzIGl0IHF1aXRlCmRpZmZpY3VsdCB0byB1bmRlcnN0YW5kIHdoYXQncyBnb2luZyBv
bi4KCkkgd291bGQgc3VnZ2VzdCB0byBtb3ZlIHRoZSBERUNMQVJFX1BFUl9DUFUgdW5kZXIKQ09O
RklHX1JJU0NWX01JU0FMSUdORUQgc28gdGhhdCBpdCByZWR1Y2VzIGlmZGVmIGluIHRyYXBzX21p
c2FsaWduZWQgYXMKd2VsbC4KClRoYW5rcywKCkNsw6ltZW50Cgo+IAo+IC0gQ2hhcmxpZQo+IAo+
PiArCQkgICAgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1NDQUxBUl9FTVVMQVRFRCkKPj4gKwkJ
CXJldHVybiBmYWxzZTsKPj4gKwo+PiArCXJldHVybiB0cnVlOwo+PiArfQo+PiArCj4+ICAjaWZk
ZWYgQ09ORklHX1JJU0NWX1NDQUxBUl9NSVNBTElHTkVECj4+ICAKPj4gIHN0YXRpYyBib29sIHVu
YWxpZ25lZF9jdGwgX19yZWFkX21vc3RseTsKPj4gQEAgLTY4NSw4ICs2OTcsNiBAQCBzdGF0aWMg
aW50IGNwdV9vbmxpbmVfY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZCh1bnNpZ25lZCBp
bnQgY3B1KQo+PiAgCj4+ICBib29sIF9faW5pdCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxh
dGVkX2FsbF9jcHVzKHZvaWQpCj4+ICB7Cj4+IC0JaW50IGNwdTsKPj4gLQo+PiAgCS8qCj4+ICAJ
ICogV2UgY2FuIG9ubHkgc3VwcG9ydCBQUl9VTkFMSUdOIGNvbnRyb2xzIGlmIGFsbCBDUFVzIGhh
dmUgbWlzYWxpZ25lZAo+PiAgCSAqIGFjY2Vzc2VzIGVtdWxhdGVkIHNpbmNlIHRhc2tzIHJlcXVl
c3Rpbmcgc3VjaCBjb250cm9sIGNhbiBydW4gb24gYW55Cj4+IEBAIC02OTQsMTAgKzcwNCw4IEBA
IGJvb2wgX19pbml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9p
ZCkKPj4gIAkgKi8KPj4gIAlvbl9lYWNoX2NwdShjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxh
dGVkLCBOVUxMLCAxKTsKPj4gIAo+PiAtCWZvcl9lYWNoX29ubGluZV9jcHUoY3B1KQo+PiAtCQlp
ZiAocGVyX2NwdShtaXNhbGlnbmVkX2FjY2Vzc19zcGVlZCwgY3B1KQo+PiAtCQkgICAgIT0gUklT
Q1ZfSFdQUk9CRV9NSVNBTElHTkVEX1NDQUxBUl9FTVVMQVRFRCkKPj4gLQkJCXJldHVybiBmYWxz
ZTsKPj4gKwlpZiAoIWFsbF9jcHVzX3VuYWxpZ25lZF9zY2FsYXJfYWNjZXNzX2VtdWxhdGVkKCkp
Cj4+ICsJCXJldHVybiBmYWxzZTsKPj4gIAo+PiAgCXVuYWxpZ25lZF9jdGwgPSB0cnVlOwo+PiAg
CXJldHVybiB0cnVlOwo+PiAtLSAKPj4gMi40OS4wCj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dAo+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCgotLSAKa3ZtLXJpc2N2IG1h
aWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
