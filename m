Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02347C02196
	for <kvm-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 09:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mOkwBqfSCGYU814/oDwHEYYhC9sm3RvAaHhzmPk7l1c=; b=Wz5MnvO1SBZ4m6
	tqgOTNA1C1YAtAiteb5Aot9gwdEYUZayH13dzjsDKDE5Jg9Zipnd2ICGEqWa/Xvs9xNdZY6/z8XFu
	wHUo65ZM/F7ddf2aeUCw/6fZI7H5iO2CFKa70R3AObBkySJB1czQ2t6QfMmBcfqKRiHkHhGJRttbP
	l7w1ur/UTJC5Xp+t2koSFDkQ6CuXEQSVtj8LNCOFxQvxDn75fsA2eN2pB2KpQ+CFgwWXHwXOSS3Rz
	gGqBrk/XHVOaXk8WB+9dGya0TQHebDa9O8GXxKQYrT8yaqh6WBxUroE4sfdD3GXTxuKnmWRzXTyPo
	P/qpCGE2rFAgbUbQE9aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKmF-0000000932t-2cQ0;
	Fri, 07 Feb 2025 09:35:59 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKh9-0000000925d-2P6w
	for kvm-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 09:30:45 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-38dc1dfd9f2so890964f8f.3
        for <kvm-riscv@lists.infradead.org>; Fri, 07 Feb 2025 01:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738920642; x=1739525442; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3a+d7uyoeApEWBBfKQwFeZRvjtQlKPA0vvhD7J7Rfb0=;
        b=SfIxGUwQ41GBykwK4R7RsTgDs38rRV83URMFP6IZPewarDWLo0Do3Iww+p1vPDvvbI
         Bl02IXqOv6z23Z4EMxlIG2+8RfZgC+dOw0QHHJi8+6rElz+8sfzQu6icKUMfn2Y0By85
         gLdFEjRGcJYIJqeOdQsr/zg3U5B7DLx1qvXlsPUcmOyhcMGEsq/vG6348BmraHKYgHui
         l65mXCMqqyJF4zgeYHcuA8Q10+pzvkTvkD7V6L75A0wXfKLwX4Qukw7KgV6lNSVXwOqq
         73C7MZEyBMwUbwdxHIwqCX0pS31+bz0fZLN2OeVrnRkFokQgc4CuAxNJM6Z9U2gQ17dn
         vzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738920642; x=1739525442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3a+d7uyoeApEWBBfKQwFeZRvjtQlKPA0vvhD7J7Rfb0=;
        b=SbigACuRl5lk3fVLpWoZrzpAHv+nLVfPvtnd5mnDjHLljyM2eI4hc2IH2wBtPNCG3V
         VfRV4MwezVsKy1a/ozDGNwQI31C2s3ZfIEK73am/4m3kuV+9qigoJuDQp7Ugy3JkUifC
         stRUDN/ponQ9B6DFiDrpZvr6x4bdEGRpQD1KktO6XdVpJTmh8odQP46+wvjNhIbpI33o
         Acp/xC7xOKgF4gkrQE0Kq75yav1WUMCDe8/lIwjdWjAbdes9gkWsA0dQYL9Fsn9WJD90
         TZmLg8ObvLZaSUSPUsLat7k3t3cYqmLla0loEWtjbiEP7tGRQvbnYFfMApwdXkQ80psa
         TBFw==
X-Forwarded-Encrypted: i=1; AJvYcCVGbg89Gd5A+F64AJkrKH+iG5NWrFZGsjrJevckLnhfKMaLUH+aaWxdADCa9cQdQlhzKGerBKHieic=@lists.infradead.org
X-Gm-Message-State: AOJu0YyeE1uPpX6YrPkTwxoF7Kwqm41B7ACPThxG579unqioO5T7HMXP
	twj22A3trT3V6kwF6hZphK1H86rkyLTu6hQdIEqFIhJ2kVSxcEcjsLTy5YQp5qE=
X-Gm-Gg: ASbGncv4ZVZfcBHZbg/r38vLguxsghUGNAg9QcvOz1Bpvzqp7S3vz7NxrABAv6iVdIo
	6DRtec4LiVV9MI2oBusdcAZ9orH3mayNdsuj8lCKmXYKEb1MHykgtFTmvrT6ndvm2WKBdlvXnPl
	E0P1swUYr8lRSRhnrPGox/bDpKeFQYVi73ncTKukG3Fr4XgXr1DFZ6IlQouC3rvr64ukAFWD6ae
	bHwIvvWxa24XvnO7htDyZdtx3vYmlXr1+E1y2HIRWQa0FTD0rpHmpmOSAzj8VxQflX1nMUAXV2X
	Peqpy3j9xqJj/JMgPukdakFXYQUgd2RzwE2V+T07/3uQ7faQAT9wZM1YRXfe
X-Google-Smtp-Source: AGHT+IESXZlQ/7J7RVMhXOtjbNkCC7bnZBXGkym1nxwIOsNsCdWy/rEEkXcjomIH6pUgz9UpP8gZ8g==
X-Received: by 2002:a05:6000:154e:b0:385:e1e8:40db with SMTP id ffacd0b85a97d-38dc8dd0a8amr1292514f8f.24.1738920641731;
        Fri, 07 Feb 2025 01:30:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd3856fsm3892845f8f.28.2025.02.07.01.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 01:30:41 -0800 (PST)
Message-ID: <bcb10a3a-162b-4a8c-a479-38f4168cea9a@rivosinc.com>
Date: Fri, 7 Feb 2025 10:30:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/21] RISC-V: Add Sscfg extension CSR definition
To: Atish Patra <atishp@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 Kaiwen Xue <kaiwenx@rivosinc.com>
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
 <20250205-counter_delegation-v4-8-835cfa88e3b1@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-8-835cfa88e3b1@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_013043_616793_591FC0BF 
X-CRM114-Status: GOOD (  14.75  )
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

CgpPbiAwNi8wMi8yMDI1IDA4OjIzLCBBdGlzaCBQYXRyYSB3cm90ZToKPiBGcm9tOiBLYWl3ZW4g
WHVlIDxrYWl3ZW54QHJpdm9zaW5jLmNvbT4KPiAKPiBUaGlzIGFkZHMgdGhlIHNjb3VudGluaGli
aXQgQ1NSIGRlZmluaXRpb24gYW5kIFMtbW9kZSBhY2Nlc3NpYmxlIGhwbWV2ZW50Cj4gYml0cyBk
ZWZpbmVkIGJ5IHNtY2RlbGVnL3NzY2NmZy4gc2NvdW50aW5oaWJpdCBhbGxvd3MgUy1tb2RlIHRv
IHN0YXJ0L3N0b3AKPiBjb3VudGVycyBkaXJlY3RseSBmcm9tIFMtbW9kZSB3aXRob3V0IGludm9r
aW5nIFNCSSBjYWxscyB0byBNLW1vZGUuIEl0IGlzCj4gYWxzbyB1c2VkIHRvIGZpZ3VyZSBvdXQg
dGhlIGNvdW50ZXJzIGRlbGVnYXRlZCB0byBTLW1vZGUgYnkgdGhlIE0tbW9kZSBhcwo+IHdlbGwu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogS2Fpd2VuIFh1ZSA8a2Fpd2VueEByaXZvc2luYy5jb20+Cj4g
LS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmggfCAyNiArKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9jc3IuaAo+IGluZGV4IDJhZDJkNDkyZTZiNC4uNDJiN2Y0ZjdlYzBmIDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2Nzci5oCj4gQEAgLTIyNCw2ICsyMjQsMzEgQEAKPiAgI2RlZmluZSBTTVNUQVRFRU4w
X0hTRU5WQ0ZHCQkoX1VMTCgxKSA8PCBTTVNUQVRFRU4wX0hTRU5WQ0ZHX1NISUZUKQo+ICAjZGVm
aW5lIFNNU1RBVEVFTjBfU1NUQVRFRU4wX1NISUZUCTYzCj4gICNkZWZpbmUgU01TVEFURUVOMF9T
U1RBVEVFTjAJCShfVUxMKDEpIDw8IFNNU1RBVEVFTjBfU1NUQVRFRU4wX1NISUZUKQo+ICsvKiBI
UE1FVkVOVCBiaXRzLiBUaGVzZSBhcmUgYWNjZXNzaWJsZSBpbiBTLW1vZGUgdmlhIFNtY2RlbGVn
L1NzY2NmZyAqLwo+ICsjaWZkZWYgQ09ORklHXzY0QklUCj4gKyNkZWZpbmUgSFBNRVZFTlRfT0YJ
CQkoX1VMKDEpIDw8IDYzKQo+ICsjZGVmaW5lIEhQTUVWRU5UX01JTkgJCQkoX1VMKDEpIDw8IDYy
KQo+ICsjZGVmaW5lIEhQTUVWRU5UX1NJTkgJCQkoX1VMKDEpIDw8IDYxKQo+ICsjZGVmaW5lIEhQ
TUVWRU5UX1VJTkgJCQkoX1VMKDEpIDw8IDYwKQo+ICsjZGVmaW5lIEhQTUVWRU5UX1ZTSU5ICQkJ
KF9VTCgxKSA8PCA1OSkKPiArI2RlZmluZSBIUE1FVkVOVF9WVUlOSAkJCShfVUwoMSkgPDwgNTgp
Cj4gKyNlbHNlCj4gKyNkZWZpbmUgSFBNRVZFTlRIX09GCQkJKF9VTEwoMSkgPDwgMzEpCj4gKyNk
ZWZpbmUgSFBNRVZFTlRIX01JTkgJCQkoX1VMTCgxKSA8PCAzMCkKPiArI2RlZmluZSBIUE1FVkVO
VEhfU0lOSAkJCShfVUxMKDEpIDw8IDI5KQo+ICsjZGVmaW5lIEhQTUVWRU5USF9VSU5ICQkJKF9V
TEwoMSkgPDwgMjgpCj4gKyNkZWZpbmUgSFBNRVZFTlRIX1ZTSU5ICQkJKF9VTEwoMSkgPDwgMjcp
Cj4gKyNkZWZpbmUgSFBNRVZFTlRIX1ZVSU5ICQkJKF9VTEwoMSkgPDwgMjYpCgpIaSBBdGlzaCwK
CkNvdWxkIHlvdSB1c2UgQklUX1VML0JJVF9VTEwoKSA/IFdpdGggdGhhdCBmaXhlZCwKClJldmll
d2VkLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+CgpUaGFua3MsCgpD
bMOpbWVudAoKPiArCj4gKyNkZWZpbmUgSFBNRVZFTlRfT0YJCQkoSFBNRVZFTlRIX09GIDw8IDMy
KQo+ICsjZGVmaW5lIEhQTUVWRU5UX01JTkgJCQkoSFBNRVZFTlRIX01JTkggPDwgMzIpCj4gKyNk
ZWZpbmUgSFBNRVZFTlRfU0lOSAkJCShIUE1FVkVOVEhfU0lOSCA8PCAzMikKPiArI2RlZmluZSBI
UE1FVkVOVF9VSU5ICQkJKEhQTUVWRU5USF9VSU5IIDw8IDMyKQo+ICsjZGVmaW5lIEhQTUVWRU5U
X1ZTSU5ICQkJKEhQTUVWRU5USF9WU0lOSCA8PCAzMikKPiArI2RlZmluZSBIUE1FVkVOVF9WVUlO
SAkJCShIUE1FVkVOVEhfVlVJTkggPDwgMzIpCj4gKyNlbmRpZgo+ICsKPiArI2RlZmluZSBTSVNF
TEVDVF9TU0NDRkdfQkFTRQkJMHg0MAo+ICAKPiAgLyogbXNlY2NmZyBiaXRzICovCj4gICNkZWZp
bmUgTVNFQ0NGR19QTU0JCQlFTlZDRkdfUE1NCj4gQEAgLTMwNSw2ICszMzAsNyBAQAo+ICAjZGVm
aW5lIENTUl9TQ09VTlRFUkVOCQkweDEwNgo+ICAjZGVmaW5lIENTUl9TRU5WQ0ZHCQkweDEwYQo+
ICAjZGVmaW5lIENTUl9TU1RBVEVFTjAJCTB4MTBjCj4gKyNkZWZpbmUgQ1NSX1NDT1VOVElOSElC
SVQJMHgxMjAKPiAgI2RlZmluZSBDU1JfU1NDUkFUQ0gJCTB4MTQwCj4gICNkZWZpbmUgQ1NSX1NF
UEMJCTB4MTQxCj4gICNkZWZpbmUgQ1NSX1NDQVVTRQkJMHgxNDIKPiAKCgotLSAKa3ZtLXJpc2N2
IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
