Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD207C54ED0
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 May 2025 19:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WF5LFj0CbTP7cfZjjIoDj4hdE4JR3nn1CgT4pe4n85Y=; b=S+jfbdv4Wx1h73
	VYDkmKwCoOYlK8Xp67F/kWdwrfeCdud7ETG6qTTP3D+gVuQ7cDf/41waRvG+ghh3C6Dedr64YOEqi
	pwxy0x1AArUq9hyrnFfYStDmifJcDjOYvTLGgps48Nn3OTxMbJawK1Z52egYdEAc+H1HAsYK9pJy3
	0AtJ7s5xOvKxjPKe6tEVOQnv6bpYmaGUwoTIjGrJhprBn3ZbT1cBifcAmXlvLCmWd6TluciOHnkcr
	EaT7jW2I+01ZsB3KioGlzQLYHrGxqgaCw4TnuOHdTZFkqw5sgk6hkaP/agVJD3Q+nkuoKOFJzkXeT
	BIbevl8tGLK6pcsv+4+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIY5H-00000004nf7-2aUs;
	Fri, 23 May 2025 19:29:35 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXzm-00000004n15-2ofB
	for kvm-riscv@lists.infradead.org;
	Fri, 23 May 2025 19:23:56 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso152111a12.2
        for <kvm-riscv@lists.infradead.org>; Fri, 23 May 2025 12:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748028234; x=1748633034; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ymdNLyOhnChndrLOo/uMB8HrcV+eYphQgSa+w1rmBgc=;
        b=qvn3tzBkCG1X7JKy/JHSxausKxQtMQDdw/oWXHYbryZGF571o10wO37rjK6Hk27ygM
         sYDKqJtgtYTCi97YA9Rg1+207Td1TAD3UYMnJOCkefjFmAlKULb3f42SvL6/ZEnqBGCG
         251VbXqhRLnUQD8UvQZl1RFwFOY/99xAXqFH8aCoPUZ7br8K0YblQK01j9aAOOktnG3j
         MifvDKTkUg1KE0NF2Gn4B0vTBpTvgqQTagndissckYLOii5Z6WLTYDGAAymei0oGHkWY
         Ut97TAtgS6XVODs64LbBF0jcPY3NB3nCIN4gPiVfxRWbeyxJiyJ5ln6ehqfoKt+FXiSS
         OZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748028234; x=1748633034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ymdNLyOhnChndrLOo/uMB8HrcV+eYphQgSa+w1rmBgc=;
        b=JV56Z47xsNnTAzN1DMGR6PBIjrqkte1UdA29mnivBw2rOoyibSjLP83T+eRRw2qc7m
         uHoNN/+ZR1YUzTMTC+hsn9Bs/qNU94Qhip2xQurKDYROGw6/3opVJBQv+SYO5p+cnh5i
         KUr8HXoewlDtwMPDaRz+e+5CNiknncBcVhB9wljEVjV8auQlGTx0G+zprIw8IS6sgG37
         pRMvAue/BrEuU8+uncw1SuR3Wuh0R/K6tvcysZqRfM3Fw0MZvCJ3aeaC02GnfcyP+cak
         HgTpN6Aafn/bRaR5Mzn7OfyDAyrRDrf6fKvE2iXPMTn6qGcaOFqwb0yLQUzeQzqgcFJU
         1Chw==
X-Forwarded-Encrypted: i=1; AJvYcCWn2hQzyPCBu0WoSIiQIT5V+K0D/wOAa6LF7oBYg1Xa21NmqzKhN0kjtp2/yu58NeueUwqLXPvnuqM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxBjRL9P7f6eB61DRl4sj4tjuPbgQr+OdpASQg4JTM6nBdGNbud
	Ezq+03ORzvUOnMrUNWLJ1P4zxaehYd3WLQumcOqMgeHqvizrpPK1V+FAEqMPKkMXu0k=
X-Gm-Gg: ASbGncuy0KFh/aKs+1EqRmINaFprVi+KEDkex5yE0W1EcQ2DvL9a0nowhSF8oQn9BTr
	2z1Iu/86BfbZo0Uok2udNQtsFZjTY8P4StuOKsMZHE1np3nxdIwl2RdCTrA8BxOtLumK0AXh8wy
	p2U01BAlXBPk2fDp66gTCc2GILqSyPqUpZQiP3y5mVghh/yLV3TDzresuYr6VKO9dmNxKwYfbcu
	Ing4MrIp9D0Vqb8f71yLPUWH+RH9DV/V0lnGMMIhlV600mpx+9kfcJWuYw8bpRsynfWUDzaD5rH
	YYZ3rDLsJMI8kmXaIGCDH1VoSRhylniqndNEExqsToeT2tNaP9yU94KfJ9HS836ePPz3ms+toyy
	Q/cz143q1PjVYEQP9+tTk
X-Google-Smtp-Source: AGHT+IGHsnt5I+k7LE92/G9eFGeVn+BHXduOeLqVjzYHaGY4iH/sZrh2puQGctc+9XB7qZF1QzFT9w==
X-Received: by 2002:a17:903:244a:b0:223:5c33:56a8 with SMTP id d9443c01a7336-23414fb18ffmr9697045ad.35.1748028233664;
        Fri, 23 May 2025 12:23:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4af1b75sm127752175ad.85.2025.05.23.12.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 12:23:53 -0700 (PDT)
Message-ID: <01696003-e2b4-4450-85cf-715e31b136d5@rivosinc.com>
Date: Fri, 23 May 2025 21:23:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/14] RISC-V: KVM: add support for FWFT SBI extension
To: Atish Patra <atish.patra@linux.dev>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
 Andrew Jones <ajones@ventanamicro.com>, Deepak Gupta <debug@rivosinc.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-14-cleger@rivosinc.com>
 <DA3K95ZYJ52S.1K6O3LN6WEI0N@ventanamicro.com>
 <9f9e2869-725d-4590-887a-9b0ef091472e@rivosinc.com>
 <DA3OJ7WWUGLT.35AVP0QQDJRZV@ventanamicro.com>
 <5dd587b3-8c04-41d1-b677-5b07266cfec5@linux.dev>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <5dd587b3-8c04-41d1-b677-5b07266cfec5@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_122354_757969_9DAE186C 
X-CRM114-Status: GOOD (  17.21  )
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

CgpPbiAyMy8wNS8yMDI1IDIwOjAyLCBBdGlzaCBQYXRyYSB3cm90ZToKPiBPbiA1LzIzLzI1IDk6
MjcgQU0sIFJhZGltIEtyw4Rtw4PCocOFIHdyb3RlOgo+PiAyMDI1LTA1LTIzVDE3OjI5OjQ5KzAy
OjAwLCBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ogo+Pj4gT24gMjMvMDUv
MjAyNSAxNTowNSwgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgo+Pj4+IDIwMjUtMDUtMjNUMTI6MTk6
MzArMDI6MDAsIENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT46Cj4+Pj4+ICsr
KyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYwo+Pj4+PiArc3RhdGljIGNvbnN0IGVu
dW0gc2JpX2Z3ZnRfZmVhdHVyZV90IGt2bV9md2Z0X2RlZmluZWRfZmVhdHVyZXNbXSA9IHsKPj4+
Pj4gK8KgwqDCoCBTQklfRldGVF9NSVNBTElHTkVEX0VYQ19ERUxFRywKPj4+Pj4gK8KgwqDCoCBT
QklfRldGVF9MQU5ESU5HX1BBRCwKPj4+Pj4gK8KgwqDCoCBTQklfRldGVF9TSEFET1dfU1RBQ0ss
Cj4+Pj4+ICvCoMKgwqAgU0JJX0ZXRlRfRE9VQkxFX1RSQVAsCj4+Pj4+ICvCoMKgwqAgU0JJX0ZX
RlRfUFRFX0FEX0hXX1VQREFUSU5HLAo+Pj4+PiArwqDCoMKgIFNCSV9GV0ZUX1BPSU5URVJfTUFT
S0lOR19QTUxFTiwKPj4+Pj4gK307Cj4+Pj4KPj4+PiBIb3cgd2lsbCB1c2Vyc3BhY2UgY29udHJv
bCB3aGljaCBzdWJzZXQgb2YgdGhlc2UgZmVhdHVyZXMgaXMgYWxsb3dlZCBpbgo+Pj4+IHRoZSBn
dWVzdD8KPj4+Pgo+Pj4+IChXZSBjYW4gcmV1c2UgdGhlIEtWTSBTQkkgZXh0ZW5zaW9uIGludGVy
ZmFjZSBpZiB3ZSBkb24ndCB3YW50IHRvIGFkZCBhCj4+Pj4gwqAgRldGVCBzcGVjaWZpYyBPTkVf
UkVHLikKPj4+Cj4+PiBIaSBSYWRpbSwKPj4+Cj4+PiBJIGRpZG4ndCBsb29rZWQgYXQgdGhhdCBw
YXJ0LiBCdXQgbW9zdCBsaWtlbHkgdXNpbmcgdGhlIGt2bSBvbmUgcmVnCj4+PiBpbnRlcmZhY2Ug
c2VlbXMgb2sgbGlrZSB3aGF0IGlzIGRvbmUgZm9yIFNUQSA/IFdlIGNvdWxkIGhhdmUgcGVyIGZl
YXR1cmUKPj4+IG92ZXJyaWRlIHdpdGggb25lIHJlZyBwZXIgZmVhdHVyZS4KPj4KPj4gU291bmRz
IGZpbmUuCj4+Cj4gCj4gWWVhaC4gV2UgY2FuIGhhdmUgYSBmb2xsb3cgdXAgc2VyaWVzIGZvciBT
QkkgRldGVCBzdGF0ZSB0aGF0IGFsbG93cyB1c2VyCj4gc3BhY2UgdG8gdG9nZ2xlIGVhY2ggc3Rh
dGUgaW5kaXZpZHVhbGx5Lgo+IAo+Pj4gSXMgdGhpcyBzb21ldGhpbmcgYmxvY2tpbmcgdGhvdWdo
ID8gV2UnZCBsaWtlIHRvIG1lcmdlIEZXRlQgb25jZSBTQkkgMy4wCj4+PiBpcyByYXRpZmllZCBz
byB0aGF0IHdvdWxkIGJlIG5pY2Ugbm90IGRlbGF5aW5nIGl0IHRvbyBtdWNoLiBJJ2xsIHRha2Ug
YQo+Pj4gbG9vayBhdCBpdCB0byBzZWUgaWYgaXQgaXNuJ3QgdG9vIGxvbmcgdG8gaW1wbGVtZW50
Lgo+Pgo+PiBOb3QgYmxvY2tpbmcsIGJ1dCBJIHdvdWxkIGF0IGxlYXN0IGRlZmF1bHQgRldGVCB0
byBkaXNhYmxlZCwgYmVjYXVzZQo+PiBjdXJyZW50IHVzZXJzcGFjZSBjYW5ub3QgaGFuZGxlIFsx
NC8xNF0uwqAgKFdlbGwuLi4gc2F2ZS9yZXN0b3JlIHdhcwo+PiBwcm9iYWJseSBicm9rZW4gZXZl
biBiZWZvcmUsIGJ1dCBsZXQncyB0cnkgdG8gbm90IG1ha2UgaXQgd29yc2UuIDpdKQo+Pgo+IAo+
IFVzZXIgc3BhY2UgY2FuIG5vdCBlbmFibGUgb3IgZGlzYWJsZSBtaXNhbGlnbmVkIGFjY2VzcyBk
ZWxlZ2F0aW9uIGFzCj4gdGhlcmUgaXMgbm8gaW50ZXJmYWNlIGZvciBub3cgcmlnaHRseSBwb2lu
dGVkIGJ5IHlvdS4gSSBndWVzcyBzdXBwb3J0aW5nCj4gdGhhdCB3b3VsZCBiZSBxdWlja2VyIHRo
YW4gZml4aW5nIHRoZSBicm9hZGVyIGd1ZXN0IHNhdmUvcmVzdG9yZQo+IGFueXdheXMuIElzbid0
IGl0ID8KPiAKPiBXZSBjYW4gaGF2ZSB0aGUgcGF0Y2hlcyByZWFkeSBmb3IgdGhlIG5leHQgTVcg
Zm9yIEZXRlQgb25lIHJlZyBpbnRlcmZhY2UuCgpZZWFoIHN1cmUgSSdsbCB3b3JrIG9uIHRoYXQg
aW4gdGhlIG1lYW50aW1lLgoKPiAKPj4gVGhhbmtzLgo+Pgo+PiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
Pj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4gCgoKLS0gCmt2bS1yaXNjdiBt
YWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
