Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C66C71136
	for <kvm-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 15:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=t90jFgsIC6HM51kovGRCQk3tHi7nlGKNLvvubHb3FYk=; b=DwKth9+SNvdxwpG6LK6oRMsfz8
	4t1dW9EusKoUkxNWLPJEfBXaAj5OPh9A5bdezZ7uLfQtxgHG3z9Hob4tcPMOrvw3STa2Hhufcb4H0
	ri9A4TeosrkHz7P5fUaQH+MP7ZYd8If4DxGaCmhadIeRgF76oOP1MwmGs5ciDFnWK6hQGOLhCNBIK
	Uo4CRwTe0t0iIPmfWhRWgoCRNYvY7HR7WS34XMGf0P/p6haY2v1B56hJQqV6ZzdbFhJwbBz3nEZL+
	iY489xVaJHhdX1JTfYO34mv+iu1jykTLBnxztc2C8uyrSL1j9PJcuFHa78ARfGBNV4mQxPWQpXf4v
	xA4yNfdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYJ2-00000007k2X-1AQQ;
	Tue, 17 Jun 2025 15:33:00 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXQH-00000007aGc-2Ycv
	for kvm-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 14:36:26 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7425efba1a3so4807765b3a.0
        for <kvm-riscv@lists.infradead.org>; Tue, 17 Jun 2025 07:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750170984; x=1750775784; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uMwlSkCNIqJfHOH66+3JA30LqpAbnp8KrvmDSuhH/Ag=;
        b=G7Ai+eqlcrQeUVDcQidrxdSaSgyrgz4bAZ9+z8rg2pFlfn5m08GAAVYTEnh0d+wt7A
         N/+0ILtJc81m3Mtj8Wk2wJv+o40oYMId+dETbc0VUHJLPbsHP6Z7a3dq4Q6OJV5e//zo
         KzBTyw8iNahVoOzqRGkciLb4vNz2piLWPBEnznWTQvToheVf4p+TrlzBiaX8lJrUU4Ue
         HCV1eth3XzSN0pfwypZuyj506h0ld8ga8k6hoHzzPYSOShLMaJAxEqXXl3aNyxihlTTV
         qYNJj9ORNniGRzqccg1v9oNj4Y9GB7LQzCRz7Bm+OqSaNFKpfdFWxvkuYbDpaPOGNYTj
         tYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750170984; x=1750775784;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uMwlSkCNIqJfHOH66+3JA30LqpAbnp8KrvmDSuhH/Ag=;
        b=kBehUL0SIYsHQB4hpXTzca/UGdNrjTWYjsFXd0UZIh80dtowfBZ12bm8ZRz83dSw4g
         2QPZhFV/Y2JAzuErpTP4iM9CCJb90nmo4oarZVxzjF5rQpLvnQFX9lS+bztWTLvsDu3a
         bjlHtPORqLOnRTVKL3wmA7yGhwXtxNNY4YaMwaJ2uNgS1RWwvqmrwsRA0LWCgqlaceBF
         q1rpq8IHgG9EVVP6wvlfH/xHGs5+HRYZcHqMu5frGjFnijL0WLdTwF1ur7pR1M0cefhb
         CtIVceYlrXp9WQ8UmNVIII9B1s43Wbsm4GEbaMKcc7+S0K/rWbyAm7ea5KSGSQ947J6Y
         KIhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbTukx5Ff3uLB0DiolYUjm8roFVjJ62cAn1SzmW5LF3YURwJmY3KPW2oX1nSlVSf+Uc/KMkboCGD4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzuF9Zbafls8ckk6Uznqm59nXktlbtU8SxH3NqCPZyv/hbiQ7Hk
	5o7CpohVYwg5zJ4sRu7z3dHNnaP6LWKQOOdny5k4y2VJo1hdw+TbYr2v0uyk8X0vo5iLKWYrI9E
	7oW5Pqw==
X-Google-Smtp-Source: AGHT+IFdJLXMZEEu8DdlQZ+U+oQwIvzvdGgAICIJ+geqiAScmpG1InwG5WTe3wRE1wV8wV8tzAaYKmdEpJA=
X-Received: from pfnw6.prod.google.com ([2002:aa7:8586:0:b0:747:a8e8:603e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9181:b0:748:a0b9:f873
 with SMTP id d2e1a72fcca58-748a0b9f8d2mr16220059b3a.9.1750170984466; Tue, 17
 Jun 2025 07:36:24 -0700 (PDT)
Date: Tue, 17 Jun 2025 07:36:22 -0700
In-Reply-To: <CAK9=C2WFA+SDt4MCLj0reQnkkA2kxUmfWhT8HZxjT_DdW8W_rQ@mail.gmail.com>
Mime-Version: 1.0
References: <50989f0a02790f9d7dc804c2ade6387c4e7fbdbc.1749634392.git.zhouquan@iscas.ac.cn>
 <20250611-352bef23df9a4ec55fe5cb68@orel> <aEmsIOuz3bLwjBW_@google.com>
 <20250612-70c2e573983d05c4fbc41102@orel> <aEymPwNM59fafP04@google.com> <CAK9=C2WFA+SDt4MCLj0reQnkkA2kxUmfWhT8HZxjT_DdW8W_rQ@mail.gmail.com>
Message-ID: <aFF9ZqbvZZtbUnGt@google.com>
Subject: Re: [PATCH] RISC-V: KVM: Avoid re-acquiring memslot in kvm_riscv_gstage_map()
From: Sean Christopherson <seanjc@google.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, zhouquan@iscas.ac.cn, anup@brainfault.org, 
	atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_073625_644637_4AEDCCF1 
X-CRM114-Status: GOOD (  13.80  )
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

T24gU3VuLCBKdW4gMTUsIDIwMjUsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gT24gU2F0LCBKdW4gMTQs
IDIwMjUgYXQgMzo1OeKAr0FNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29t
PiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIEp1biAxMiwgMjAyNSwgQW5kcmV3IEpvbmVzIHdyb3Rl
Ogo+ID4gPiBPbiBXZWQsIEp1biAxMSwgMjAyNSBhdCAwOToxNzozNkFNIC0wNzAwLCBTZWFuIENo
cmlzdG9waGVyc29uIHdyb3RlOgo+ID4gPiA+IExvb2tzIGxpa2UgeSdhbGwgYWxzbyBoYXZlIGEg
YnVnIHdoZXJlIGFuIC1FRVhJU1Qgd2lsbCBiZSByZXR1cm5lZCB0byB1c2Vyc3BhY2UsCj4gPiA+
ID4gYW5kIHdpbGwgZ2VuZXJhdGUgd2hhdCdzIHByb2JhYmx5IGEgc3B1cmlvdXMga3ZtX2Vycigp
IG1lc3NhZ2UuCj4gPiA+Cj4gPiA+IE9uIDMyLWJpdCByaXNjdiwgZHVlIHRvIGxvc2luZyB0aGUg
dXBwZXIgYml0cyBvZiB0aGUgcGh5c2ljYWwgYWRkcmVzcz8gT3IKPiA+ID4gaXMgdGhlcmUgeWV0
IGFub3RoZXIgdGhpbmcgdG8gZml4Pwo+ID4KPiA+IEFub3RoZXIgYnVnLCBJIHRoaW5rLiAgZ3N0
YWdlX3NldF9wdGUoKSByZXR1cm5zIC1FRVhJU1QgaWYgYSBQVEUgZXhpc3RzLCBhbmQgSQo+ID4g
X2Fzc3VtZV8gdGhhdCdzIHN1cHBvc2VkIHRvIGJlIGJlbmlnbj8gIEJ1dCB0aGlzIGNvZGUgcmV0
dXJucyBpdCBibGluZGx5Ogo+IAo+IGdzdGFnZV9zZXRfcHRlKCkgcmV0dXJucyAtRUVYSVNUIG9u
bHkgd2hlbiBpdCB3YXMgZXhwZWN0aW5nIGEgbm9uLWxlYWYKPiBQVEUgYXQgYSBwYXJ0aWN1bGFy
IGxldmVsIGJ1dCBnb3QgYSBsZWFmIFBURSAKClJpZ2h0LCBidXQgaXNuJ3QgcmV0dXJuaW5nIC1F
RVhJU1QgYWxsIHRoZSB3YXkgdG8gdXNlcnNwYWNlIHVuZGVzaXJhYmxlIGJlaGF2aW9yPwoKRS5n
LiBpbiB0aGlzIHNlcXVlbmNlLCBLVk0gd2lsbCByZXR1cm4gLUVFWElTVCBhbmQgaW5jb3JyZWN0
bHkgdGVybWluYXRlIHRoZSBWTQooYXNzdW1pbmcgdGhlIFZNTSBkb2Vzbid0IG1pcmFjdWxvdXNs
eSByZWNvdmVyIHNvbWVob3cpOgoKIDEuIEJhY2sgdGhlIFZNIHdpdGggSHVnZVRMQkZTCiAyLiBG
YXVsdC1pbiBtZW1vcnksIGkuZS4gY3JlYXRlIGh1Z2VwYWdlIG1hcHBpbmdzCiAzLiBFbmFibGUg
S1ZNX01FTV9MT0dfRElSVFlfUEFHRVMKIDQuIFdyaXRlLXByb3RlY3Rpb24gZmF1bHQsIGt2bV9y
aXNjdl9nc3RhZ2VfbWFwKCkgdHJpZXMgdG8gY3JlYXRlIGEgd3JpdGFibGUKICAgIG5vbi1odWdl
IG1hcHBpbmcuCiA1LiBnc3RhZ2Vfc2V0X3B0ZSgpIGVuY291bnRlcnMgdGhlIGh1Z2UgbGVhZiBQ
VEUgYmVmb3JlIHJlYWNoaW5nIHRoZSB0YXJnZXQKICAgIGxldmVsLCBhbmQgcmV0dXJucyAtRUVY
SVNULgoKQUZBSUNULCBnc3RhZ2Vfd3BfbWVtb3J5X3JlZ2lvbigpIGRvZXNuJ3Qgc3BsaXQvc2hh
dHRlci9kZW1vdGUgaHVnZXBhZ2VzLCBpdApzaW1wbHkgY2xlYXJzIF9QQUdFX1dSSVRFLgoKSXQn
cyBlbnRpcmVseSBwb3NzaWJsZSBJJ20gbWlzc2luZyBzb21ldGhpbmcgdGhhdCBtYWtlcyB0aGUg
YWJvdmUgc2NlbmFyaW8KaW1wb3NzaWJsZSBpbiBwcmFjdGljZSwgYnV0IGF0IHRoaXMgcG9pbnQg
SSdtIGdlbnVpbmVseSBjdXJpb3VzIDotKQoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3Zt
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
