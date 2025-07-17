Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B124BC83F1A
	for <kvm-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 16:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q7tY2+hsKWARI33e6YFQVv+wPuhW3cxp/2M39bMkCTo=; b=ZQxur4Lmn4V3Iw
	FSWbTQJUVo1uI54Halhp8iGjlg7Z2VjvqaUINlC17JJJjpbv2hTkiZhH5YBywJnsf2tKyLu76wsrR
	Y4KMVdRU45g0G0ghocUCPL49PHpmXEOYqAkSozqapJQ6v2G4Xd12syLZ7OyGTkkwjCe9qA2EDTt9D
	KycPs5favbhcZJlWy+p6m/Y2uIlhwSntbi0UmYG4vJg+E5rRlxYtj2pYggbttNFq0Rr3guYM6YYhz
	2XwG+sYah6kptKCMrJJUGUTWDwGvi3OiGw16OOVeKIxBGmYOpZSIuZbVlChv0jssf7ntL+KyfuJWh
	LczP1Ju5oUI5Hp3S++ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucRO6-0000000AdFB-1q7q;
	Thu, 17 Jul 2025 16:23:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucR6N-0000000AZyS-0P64
	for kvm-riscv@bombadil.infradead.org;
	Thu, 17 Jul 2025 16:04:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mF4ZzdU4KPm05DxQhuE3nJR3OBuoI7+D+aCP85HQkvI=; b=TgaRZgsCtEYFX10fQMZSt7txsP
	OUJN0174VLNt3HUr1+nb7lihiSTnLzh8uwsIyI45528DmylJGSNWWHmu5ZalKjfHqtvvNMeNytZGW
	6juLuF98MhCADgaEe6Bj4SWUWDmjbHmYeeHlXisKnISRpz7yfk9fG+Z+Fzx/Mj6crn9gPyY6l/pxJ
	wAKwOmNY9dvZ5BVML9ewf4QDVNvSb+a6lkJWH0D/tZBuGfC6wVQPYs6lVSaUxa62brp850dnUYjmb
	UVXnOzLnsnPmpxxjMWsg1qsaGagwv2c0uOYHZ0ADFYXaeyWlhecUkD7dPKjKVk21ebfRc55rmTeFp
	vl62JOaw==;
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucR6J-0000000AJY2-1q1M
	for kvm-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 16:04:53 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3de2b02c69eso4384565ab.1
        for <kvm-riscv@lists.infradead.org>; Thu, 17 Jul 2025 09:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752768289; x=1753373089; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mF4ZzdU4KPm05DxQhuE3nJR3OBuoI7+D+aCP85HQkvI=;
        b=YTHRvd+/Ubt7pJnutr266FMgRsrOUY0GqG9RvFoGhbuTNH6FpeBFtjDjgmqIXvnTcH
         1fcASD/QE5Bs4k3an31Q3yDC0aYUlr6pxLXv3jyHJSV2xyGn8oofeFe4SNSiLiK0pHMr
         zQh/KVvq2NhLHSJK8t0QzjpNAha3Kw+RTo6vha9yOBoY+fCB5FYiiv8ye6OOMld+o2aR
         GGTmYDRSL5tZx818w8Md4zNVU+9p+F0BDoKc7dbRA2K5kD33ih79+STnjKGV/OKrUt+y
         tUsytYmoXGTx9OwABnh0GzPlzfVC67jLpBJJa7TySbdZRfhL92WP2eBD1tHvfCccoaDt
         v8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752768289; x=1753373089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mF4ZzdU4KPm05DxQhuE3nJR3OBuoI7+D+aCP85HQkvI=;
        b=G9rOH94N8t4feb8L8yam3QzmDjeHwKsOGUwv1O+LOjZscZJbQE4oRRjSHuZCCvOg5y
         EaPUwjWsll0mSzgJ4TXrn4UBdvIcjlsAz71x6u7VpO086tSKTpjccnz67cJqYY61xKWd
         mRqEkd1B9N19NkERanUxu8VfGGSBaEAHs2rotE0jaR7241Xuy2Lv7tsyZcN2w8duvqdM
         Oqfgn/4i6TAOIIiLMbvQ63eD1VJcQun+TeAWMLVJ3nOj3JZBNbj8icnF3CwQ22b3UKGc
         j/7MIqz2pbsFXgE/Ya9Smg4SNGAVcrgj7ibG/ChvW9QhcD1hq8k5eKVIzZEeApjhHCZF
         BlHw==
X-Forwarded-Encrypted: i=1; AJvYcCWEXyNOS0Sw9ZHCOEoVbpjTEMGARiPro3x9Yk84VbkZsiB4nRMRMmRIDUkMztARlBYGPgevPceJ3lA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4Rcj+MAb9iglpi2cNVnAk9xxZmzD/ioq8WqmtNLdwXTW7bMy2
	69SOcs0TEGiX5VdxIC3oRn0Jhq8LYqqdS5bMl12elWe8OEubkZl/lgmXCnE4hkpd/OchLSD/6BW
	aVmjVbBkTBNWATyGeouOWoGFoJGaQ3wfiTdB6C6q95w==
X-Gm-Gg: ASbGncuIYQtn6lmq2aQ7ZotLFAC6Pxr1e7/LrQcBqThVYjpU2z0WiyVcw17/AXRl9Ik
	oBlcbhPWpk1tMeUXLTuO/eX0BjyF02YPpT9FXTBOR0SO4MZi/0HZlAjglptT9crrpqk1cYWsrh+
	ieYJFJIOE0/zc8Q3h/xpcYKiCNYEGIhWXOPo4bNoCUunLF7vfijaJpGu0xmcnv7Jzwfot/9c8bZ
	yk3brT2IFSThQZQjWc=
X-Google-Smtp-Source: AGHT+IFAG3wYGrY4xyVVSnggyKQ8Fmk+ZxX7eQXMdYOvL6ZpVVrOgjCMEp0iGPnFH5D2j6kt83DD42IjPEeujKO5F/Q=
X-Received: by 2002:a05:6e02:3e07:b0:3df:3598:7688 with SMTP id
 e9e14a558f8ab-3e28307abacmr89850255ab.21.1752768287054; Thu, 17 Jul 2025
 09:04:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com> <20250522-pmu_event_info-v3-6-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-6-f7bba7fd9cfe@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 17 Jul 2025 21:34:36 +0530
X-Gm-Features: Ac12FXxSVTcSMonhmD8rqZBxMoPIHtsKSpNyakGFXvSyptDFl2Kq_s4PkOsoVXE
Message-ID: <CAAhSdy2v4FSpekE6QNwsP8vVAH3NxW01cZOgECV2tcAOjgXD+A@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] KVM: Add a helper function to validate vcpu gpa range
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_170451_688669_98D29963 
X-CRM114-Status: GOOD (  20.75  )
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

T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMTI6MzPigK9BTSBBdGlzaCBQYXRyYSA8YXRpc2hwQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGUgYXJjaCBzcGVjaWZpYyBjb2RlIG1heSBuZWVkIHRv
IHZhbGlkYXRlIGEgZ3BhIHJhbmdlIGlmIGl0IGlzIGEgc2hhcmVkCj4gbWVtb3J5IGJldHdlZW4g
dGhlIGhvc3QgYW5kIHRoZSBndWVzdC4gQ3VycmVudGx5LCB0aGVyZSBhcmUgZmV3IHBsYWNlcwo+
IHdoZXJlIGl0IGlzIHVzZWQgaW4gUklTQy1WIGltcGxlbWVudGF0aW9uLiBHaXZlbiB0aGUgbmF0
dXJlIG9mIHRoZSBmdW5jdGlvbgo+IGl0IG1heSBiZSB1c2VkIGZvciBvdGhlciBhcmNoaXRlY3R1
cmVzLiBIZW5jZSwgYSBjb21tb24gaGVscGVyIGZ1bmN0aW9uCj4gaXMgYWRkZWQuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgaW5j
bHVkZS9saW51eC9rdm1faG9zdC5oIHwgIDIgKysKPiAgdmlydC9rdm0va3ZtX21haW4uYyAgICAg
IHwgMjEgKysrKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0
aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaCBiL2luY2x1
ZGUvbGludXgva3ZtX2hvc3QuaAo+IGluZGV4IDI5MWQ0OWI5YmYwNS4uYWRkYTYxY2M0MDcyIDEw
MDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAo+ICsrKyBiL2luY2x1ZGUvbGlu
dXgva3ZtX2hvc3QuaAo+IEBAIC0xMzgzLDYgKzEzODMsOCBAQCBzdGF0aWMgaW5saW5lIGludCBr
dm1fdmNwdV9tYXBfcmVhZG9ubHkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBncGFfdCBncGEsCj4K
PiAgdW5zaWduZWQgbG9uZyBrdm1fdmNwdV9nZm5fdG9faHZhKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwgZ2ZuX3QgZ2ZuKTsKPiAgdW5zaWduZWQgbG9uZyBrdm1fdmNwdV9nZm5fdG9faHZhX3Byb3Qo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBnZm5fdCBnZm4sIGJvb2wgKndyaXRhYmxlKTsKPiAraW50
IGt2bV92Y3B1X3ZhbGlkYXRlX2dwYV9yYW5nZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdwYV90
IGdwYSwgdW5zaWduZWQgbG9uZyBsZW4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBib29sIHdyaXRlX2FjY2Vzcyk7Cj4gIGludCBrdm1fdmNwdV9yZWFkX2d1ZXN0X3BhZ2Uoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LCBnZm5fdCBnZm4sIHZvaWQgKmRhdGEsIGludCBvZmZzZXQsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgbGVuKTsKPiAgaW50IGt2bV92Y3B1X3Jl
YWRfZ3Vlc3RfYXRvbWljKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ3BhX3QgZ3BhLCB2b2lkICpk
YXRhLAo+IGRpZmYgLS1naXQgYS92aXJ0L2t2bS9rdm1fbWFpbi5jIGIvdmlydC9rdm0va3ZtX21h
aW4uYwo+IGluZGV4IGU4NWIzM2E5MjYyNC4uM2Y1MmY1NTcxZmE2IDEwMDY0NAo+IC0tLSBhL3Zp
cnQva3ZtL2t2bV9tYWluLmMKPiArKysgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCj4gQEAgLTMzMDEs
NiArMzMwMSwyNyBAQCBpbnQga3ZtX3ZjcHVfd3JpdGVfZ3Vlc3Qoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LCBncGFfdCBncGEsIGNvbnN0IHZvaWQgKmRhdGEsCj4gIH0KPiAgRVhQT1JUX1NZTUJPTF9H
UEwoa3ZtX3ZjcHVfd3JpdGVfZ3Vlc3QpOwo+Cj4gK2ludCBrdm1fdmNwdV92YWxpZGF0ZV9ncGFf
cmFuZ2Uoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBncGFfdCBncGEsIHVuc2lnbmVkIGxvbmcgbGVu
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCB3cml0ZV9hY2Nlc3MpCj4g
K3sKPiArICAgICAgIGdmbl90IGdmbiA9IGdwYSA+PiBQQUdFX1NISUZUOwo+ICsgICAgICAgaW50
IHNlZzsKPiArICAgICAgIGludCBvZmZzZXQgPSBvZmZzZXRfaW5fcGFnZShncGEpOwo+ICsgICAg
ICAgYm9vbCB3cml0YWJsZSA9IGZhbHNlOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBodmE7CgpO
aXQ6IHJlYXJyYW5nZSB0aGUgdmFyaWFibGVzIGluIGEgaW52ZXJ0ZWQgcHlyYW1pZCBzaGFwZS4K
Cj4gKwo+ICsgICAgICAgd2hpbGUgKChzZWcgPSBuZXh0X3NlZ21lbnQobGVuLCBvZmZzZXQpKSAh
PSAwKSB7Cj4gKyAgICAgICAgICAgICAgIGh2YSA9IGt2bV92Y3B1X2dmbl90b19odmFfcHJvdCh2
Y3B1LCBnZm4sICZ3cml0YWJsZSk7Cj4gKyAgICAgICAgICAgICAgIGlmIChrdm1faXNfZXJyb3Jf
aHZhKGh2YSkgfHwgKHdyaXRhYmxlIF4gd3JpdGVfYWNjZXNzKSkKPiArICAgICAgICAgICAgICAg
ICAgICAgICByZXR1cm4gLUVQRVJNOwo+ICsgICAgICAgICAgICAgICBvZmZzZXQgPSAwOwo+ICsg
ICAgICAgICAgICAgICBsZW4gLT0gc2VnOwo+ICsgICAgICAgICAgICAgICArK2dmbjsKPiArICAg
ICAgIH0KPiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0xfR1BMKGt2bV92
Y3B1X3ZhbGlkYXRlX2dwYV9yYW5nZSk7Cj4gKwo+ICBzdGF0aWMgaW50IF9fa3ZtX2dmbl90b19o
dmFfY2FjaGVfaW5pdChzdHJ1Y3Qga3ZtX21lbXNsb3RzICpzbG90cywKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZ2ZuX3RvX2h2YV9jYWNoZSAqZ2hjLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdwYV90IGdwYSwgdW5zaWdu
ZWQgbG9uZyBsZW4pCj4KPiAtLQo+IDIuNDMuMAo+CgpPdGhlcndpc2UsIGxvb2tzIGdvb2QgdG8g
bWUuCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2Fy
ZHMsCkFudXAKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3Zt
LXJpc2N2Cg==
