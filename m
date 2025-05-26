Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9128EC54FB3
	for <kvm-riscv@archiver.kernel.org>; Mon, 26 May 2025 09:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2qzX+ge/nywikJ+gLyWFuKxhBaHNpm/5QC0bdpXITe0=; b=WrWvFgOKsujvCt
	E5Heab8vS1fbfrleAswXwgeX73yAVsvMIVlHhKnsSlCqCJ+iDx7g0msRhX0nOR4OAfnXoHz4JF6EK
	HVMhaPFw04HfqC706giw9kFf+KAbGAds4zsmM6GiYL6Q2nLnZD+J1cigDNjmsCd0wX0jdcVI3URzM
	KQOS+07ekHdFLdDK5S30gbx8pvZHgFNcKf3Fx2DvyU5nQqMDXEH48Q/D2+BoUi3Uu7bOHNWX4r9dI
	vDOYgJ1Ni3uEEWIuaNsa3DDrcwfz4ixJccHm17n5WrGFYVRyhd5g0j4os2bbC8wMIJesvJLuzAd01
	lHNZU1A6NJy6aCszjytQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJUL5-00000008XdF-11BW;
	Mon, 26 May 2025 09:41:47 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJUHi-00000008XJx-3kcs
	for kvm-riscv@lists.infradead.org;
	Mon, 26 May 2025 09:38:20 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-742c9563fafso1312615b3a.0
        for <kvm-riscv@lists.infradead.org>; Mon, 26 May 2025 02:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748252297; x=1748857097; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ayXEI8Cfv1/N/P9sk6QD8plzK1Zh4bjNNg4FyYTKeW8=;
        b=3KYFS5lxkWxcso3VnsVmdbOC2KKGPlrqB4KKmrWrkKLzPM3iCXVb1brQ6EFXeOty3U
         89BTUm+4WpKmkAWUeGa9igEiLsue/gcOmcLyqGjmU8h3QNPlr76V1BBUJPGcemJME8Tl
         gfQjCu+s2HfUwOmf63lb2exULH7REixH+HTf0OJmaahhamcyl4ov+64lHWWSWGkLeNnc
         MqCHoxPeCc0WYkFj4eSX6+d4REfTt6cvhzmzimhaLMg4GzriHPFkkXK0njfBgSyTc2fC
         EhD4cjchiY+sjnTb5SZ5phh3DoHg9T+tNCxXKnnw2DiTWJAiE+KmuI7CqpOVUJdqJBsv
         Xatw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748252297; x=1748857097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ayXEI8Cfv1/N/P9sk6QD8plzK1Zh4bjNNg4FyYTKeW8=;
        b=oqyc7IosFIvPU7rlguOxw9iH+SzbpVjGGXSSYh0CsWafp/eTSjbKNAPw6VW6JDVBdu
         +IcmJkLk72fmWKsAzibggp5KTIO5uD1HP7LY233qck+iOf9NRBblvSO77l+DnP6QTVQc
         L3/Y/ff8/6VUYH4bn0XC2OMCYk9wx3eRPZ6qFeLYNhKh9rTq24/NtklqjjE8WV31scUk
         sQDgqBcFXtzXwXkihIlxsGJdNC3b+kxk+o0pzhAoAoaor7QqVoarS8PhkIsHj5H9hKKS
         epKKvtlVcRoNXmIK+8LJFx6VSEwPG/IkUYQ1cv08iGrFhSswdD9etj3xgPmnuKC/gUnn
         24Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXqS7BQj2NpOQlQ+EnueJo+wIFrcSwarlw5gOXs4rVbg5yICORjV0enLP+Xt681entjo8KaTF950fc=@lists.infradead.org
X-Gm-Message-State: AOJu0YygOEKUPnfoDqv+AyqIZTMlR4dPFVXURnquay4FQ83pbg/P1jj4
	okZjbm7qZXm2vnMiy8oFBXgC0g0Jtrooq3GhIC8PWAN8InPffSVuKZrweGwFfjX7PeM=
X-Gm-Gg: ASbGncuwbTPutJMx81fY9get/I0+KYG7UqS5eSL5Rx/8KaLYFLPy3D9x6+0izhOyHmJ
	WqLa+6Ar6qjac62rw6+3f1Okmi0BsMIFu6U+ga7ZLB7e35uYF9ZOAjmRUmduuiAN+lO1fGcuvQ6
	qq9TbdcPx5LESeXLUL5m6kp7p9wTgaumXyOlwb/eZpox7JZ36JdwNgpROilrZi/ULW/LuODC3CL
	KVdHvpZE0+1WaUev70EAFm8HpohtT2zzEOnKNjCujPPDdMualpb5t2AUh3Ye0KJA3wwjYcPqZ/k
	l12LJWIwEW/aytxZRDCoXz8vzVN4d6hKHAj2cnN2rjkgvbNW/lQLA5dzvB0Ml7DO0RXK6q9kYb9
	sBzKD5QldnFEV5Q1z5v9J
X-Google-Smtp-Source: AGHT+IGtpgkfGcWHXNllZ6N7OfshZvdC/ul39y9uFpqnjdl5yZSiN5+nr2uee+5tOzhJpdCxTYM3zg==
X-Received: by 2002:a05:6a21:8dc6:b0:20d:5076:dd78 with SMTP id adf61e73a8af0-2188c3c78f7mr13332787637.42.1748252297429;
        Mon, 26 May 2025 02:38:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb0a4af6sm16624196a12.77.2025.05.26.02.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 02:38:16 -0700 (PDT)
Message-ID: <20aeb166-6128-4dda-a963-c9f66f491bcc@rivosinc.com>
Date: Mon, 26 May 2025 11:38:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 09/14] riscv: misaligned: move emulated access
 uniformity check in a function
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>,
 Deepak Gupta <debug@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-10-cleger@rivosinc.com> <aDC-0qe5STR7ow4m@ghost>
 <b2afb9c7-a3d2-4bf6-bfaa-d804358ccd88@rivosinc.com>
 <20250526-baaca3f03adcac2b6488f040@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250526-baaca3f03adcac2b6488f040@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_023819_009615_4B411F64 
X-CRM114-Status: GOOD (  25.64  )
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

CgpPbiAyNi8wNS8yMDI1IDEwOjQxLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gRnJpLCBNYXkg
MjMsIDIwMjUgYXQgMDk6MjE6NTFQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAyMy8wNS8yMDI1IDIwOjMwLCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4+PiBPbiBG
cmksIE1heSAyMywgMjAyNSBhdCAxMjoxOToyNlBNICswMjAwLCBDbMOpbWVudCBMw6lnZXIgd3Jv
dGU6Cj4+Pj4gU3BsaXQgdGhlIGNvZGUgdGhhdCBjaGVjayBmb3IgdGhlIHVuaWZvcm1pdHkgb2Yg
bWlzYWxpZ25lZCBhY2Nlc3Nlcwo+Pj4+IHBlcmZvcm1hbmNlIG9uIGFsbCBjcHVzIGZyb20gY2hl
Y2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cygpCj4+Pj4gdG8gaXRzIG93biBm
dW5jdGlvbiB3aGljaCB3aWxsIGJlIHVzZWQgZm9yIGRlbGVnYXRpb24gY2hlY2suIE5vCj4+Pj4g
ZnVuY3Rpb25hbCBjaGFuZ2VzIGludGVuZGVkLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+Pj4+IFJldmlld2VkLWJ5OiBBbmRy
ZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+Pj4+IC0tLQo+Pj4+ICBhcmNoL3Jp
c2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCAyMCArKysrKysrKysrKysrKy0tLS0tLQo+
Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPj4+
Pgo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKPj4+PiBpbmRleCBmMWIyYWY1
MTU1OTIuLjdlY2FhODEwM2ZlNyAxMDA2NDQKPj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90
cmFwc19taXNhbGlnbmVkLmMKPj4+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNh
bGlnbmVkLmMKPj4+PiBAQCAtNjQ1LDYgKzY0NSwxOCBAQCBib29sIF9faW5pdCBjaGVja192ZWN0
b3JfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cyh2b2lkKQo+Pj4+ICB9Cj4+Pj4g
ICNlbmRpZgo+Pj4+ICAKPj4+PiArc3RhdGljIGJvb2wgYWxsX2NwdXNfdW5hbGlnbmVkX3NjYWxh
cl9hY2Nlc3NfZW11bGF0ZWQodm9pZCkKPj4+PiArewo+Pj4+ICsJaW50IGNwdTsKPj4+PiArCj4+
Pj4gKwlmb3JfZWFjaF9vbmxpbmVfY3B1KGNwdSkKPj4+PiArCQlpZiAocGVyX2NwdShtaXNhbGln
bmVkX2FjY2Vzc19zcGVlZCwgY3B1KSAhPQo+Pj4+ICsJCSAgICBSSVNDVl9IV1BST0JFX01JU0FM
SUdORURfU0NBTEFSX0VNVUxBVEVEKQo+Pj4+ICsJCQlyZXR1cm4gZmFsc2U7Cj4+Pj4gKwo+Pj4+
ICsJcmV0dXJuIHRydWU7Cj4+Pj4gK30KPj4+Cj4+PiBUaGlzIGVuZHMgdXAgd2FzdGluZyB0aW1l
IHdoZW4gIUNPTkZJR19SSVNDVl9TQ0FMQVJfTUlTQUxJR05FRCBzaW5jZSBpdAo+Pj4gd2lsbCBh
bHdheXMgcmV0dXJuIGZhbHNlIGluIHRoYXQgY2FzZS4gTWF5YmUgdGhlcmUgaXMgYSB3YXkgdG8g
c2ltcGxpZnkKPj4+IHRoZSBpZmRlZnMgYW5kIHN0aWxsIGhhdmUgcGVyZm9ybWFudCBjb2RlLCBi
dXQgSSBkb24ndCB0aGluayB0aGlzIGlzIGEKPj4+IGJpZyBlbm91Z2ggcHJvYmxlbSB0byBwcmV2
ZW50IHRoaXMgcGF0Y2ggZnJvbSBtZXJnaW5nLgo+Pgo+PiBZZWFoIEkgdGhvdWdoIG9mIHRoYXQg
YXMgd2VsbCBidXQgdGhlIGFtb3VudCBvZiBjYWxsIHRvIHRoaXMgZnVuY3Rpb24gaXMKPj4gcHJv
YmFibHkgd2VsbCBiZWxvdyAxMCB0aW1lcyBzbyBJIGd1ZXNzIGl0IGRvZXMgbm90IHJlYWxseSBt
YXR0ZXJzIGluCj4+IHRoYXQgY2FzZSB0byBqdXN0aWZ5IHlldCBhbm90aGVyIGlmZGVmID8KPiAK
PiBXb3VsZCBpdCBuZWVkIGFuIGlmZGVmPyBPciBjYW4gd2UganVzdCBkbwo+IAo+ICBpZiAoIUlT
X0VOQUJMRUQoQ09ORklHX1JJU0NWX1NDQUxBUl9NSVNBTElHTkVEKSkKPiAgICAgcmV0dXJuIGZh
bHNlOwo+IAo+IGF0IHRoZSB0b3Agb2YgdGhlIGZ1bmN0aW9uPwo+IAo+IFdoaWxlIHRoZSBmdW5j
dGlvbiB3b3VsZG4ndCB3YXN0ZSBtdWNoIHRpbWUgc2luY2UgaXQncyBub3QgY2FsbGVkIG11Y2gg
YW5kCj4gd291bGQgcmV0dXJuIGZhbHNlIG9uIHRoZSBmaXJzdCBjaGVjayBkb25lIGluIHRoZSBs
b29wLCBzaW5jZSBpdCdzIGEKPiBzdGF0aWMgZnVuY3Rpb24sIGFkZGluZyB0aGUgSVNfRU5BQkxF
RCgpIGNoZWNrIHdvdWxkIGxpa2VseSBhbGxvdyB0aGUKPiBjb21waWxlciB0byBjb21wbGV0ZWx5
IHJlbW92ZSBpdCBhbmQgYWxsIHRoZSBicmFuY2hlcyBkZXBlbmRpbmcgb24gaXQuCgpBaCB5ZWFo
IGluZGVlZCAhIEknbGwgZG8gdGhhdAoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4gVGhhbmtzLAo+
IGRyZXcKPiAKPj4KPj4+Cj4+PiBSZXZpZXdlZC1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGll
QHJpdm9zaW5jLmNvbT4KPj4+IFRlc3RlZC1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJp
dm9zaW5jLmNvbT4KPj4KPj4gVGhhbmtzLAo+Pgo+PiBDbMOpbWVudAo+Pgo+Pj4KPj4+PiArCj4+
Pj4gICNpZmRlZiBDT05GSUdfUklTQ1ZfU0NBTEFSX01JU0FMSUdORUQKPj4+PiAgCj4+Pj4gIHN0
YXRpYyBib29sIHVuYWxpZ25lZF9jdGwgX19yZWFkX21vc3RseTsKPj4+PiBAQCAtNjgzLDggKzY5
NSw2IEBAIHN0YXRpYyBpbnQgY3B1X29ubGluZV9jaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxh
dGVkKHVuc2lnbmVkIGludCBjcHUpCj4+Pj4gIAo+Pj4+ICBib29sIF9faW5pdCBjaGVja191bmFs
aWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpCj4+Pj4gIHsKPj4+PiAtCWludCBj
cHU7Cj4+Pj4gLQo+Pj4+ICAJLyoKPj4+PiAgCSAqIFdlIGNhbiBvbmx5IHN1cHBvcnQgUFJfVU5B
TElHTiBjb250cm9scyBpZiBhbGwgQ1BVcyBoYXZlIG1pc2FsaWduZWQKPj4+PiAgCSAqIGFjY2Vz
c2VzIGVtdWxhdGVkIHNpbmNlIHRhc2tzIHJlcXVlc3Rpbmcgc3VjaCBjb250cm9sIGNhbiBydW4g
b24gYW55Cj4+Pj4gQEAgLTY5MiwxMCArNzAyLDggQEAgYm9vbCBfX2luaXQgY2hlY2tfdW5hbGln
bmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cyh2b2lkKQo+Pj4+ICAJICovCj4+Pj4gIAlvbl9l
YWNoX2NwdShjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkLCBOVUxMLCAxKTsKPj4+PiAg
Cj4+Pj4gLQlmb3JfZWFjaF9vbmxpbmVfY3B1KGNwdSkKPj4+PiAtCQlpZiAocGVyX2NwdShtaXNh
bGlnbmVkX2FjY2Vzc19zcGVlZCwgY3B1KQo+Pj4+IC0JCSAgICAhPSBSSVNDVl9IV1BST0JFX01J
U0FMSUdORURfU0NBTEFSX0VNVUxBVEVEKQo+Pj4+IC0JCQlyZXR1cm4gZmFsc2U7Cj4+Pj4gKwlp
ZiAoIWFsbF9jcHVzX3VuYWxpZ25lZF9zY2FsYXJfYWNjZXNzX2VtdWxhdGVkKCkpCj4+Pj4gKwkJ
cmV0dXJuIGZhbHNlOwo+Pj4+ICAKPj4+PiAgCXVuYWxpZ25lZF9jdGwgPSB0cnVlOwo+Pj4+ICAJ
cmV0dXJuIHRydWU7Cj4+Pj4gLS0gCj4+Pj4gMi40OS4wCj4+Pj4KPj4KCgotLSAKa3ZtLXJpc2N2
IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
