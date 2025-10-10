Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94D5CCA476
	for <kvm-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 19:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J8H2IF4x2bo0BuJ3maA4OmBHZ8sbp2pSMz0xnP2TnFg=; b=DPcCNth6LA/k8O
	whADjiRVCOmGW+4PORoyh+KQzPQ4+5U/ru+oFc/P39iY/wg89A3LPBfWBhtxMjcWFBybXZhnaQiC+
	kSaExQjxGqVOMT6fgdYFc0mwNDtL6NS0o5QI2M5AC2cykSE0abssz3LOsAhW8B/4cIlWGMjm6NgjY
	RgvQzeElHeUTxCYsu3T3f2vPK9l9/kVcROT/nx9Dhtd4Kmvyuc1fVZpUlLplzWnokjd3Q8d1Fg1Aq
	P8NuytWWt6LHhE9W22kCBd36z9zhhFpIBr2yFxnLE2DZ5SV0iTGOKb9K7X4aByaE7AiQc7jJngJS6
	GE8B4ESSEhqIZhvSjjlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7IxB-00000009GNT-0osg;
	Fri, 10 Oct 2025 19:39:01 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Ix9-00000009GMV-0UoA
	for kvm-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 19:39:00 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-46e3bcf272aso12045e9.0
        for <kvm-riscv@lists.infradead.org>; Fri, 10 Oct 2025 12:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760125137; x=1760729937; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G42i/u8MRJ9M6Twy2bIRqjYAwcznw/QdFBR+ThWzAOg=;
        b=3J6+paIAF8eIFbitfOP0fE/FDk4GFqLZWW/2PJQ4bnNtz4owohb62hudzcUPFPB6aH
         Ydt+apSCgRCoV3suP/UG9pm+UgA5H+yvFHB+jZtHtpZIUzGBLvC78ntRURjcFOVBdS06
         N5drIxDSJg6zQaEaKW0XwIcMeuZ38u//F2D8cJg7Sf/kI5HOZgBquSk/6OfVS9f4U1k0
         7gd9t5nBAY9NeTwt8Ih4v2a0aXjXvaBb3SgPA/IdptCvNlRa4hlH2vOAWYs6BJ5l46fu
         5JpFAeYP6NluJSOkbSVHrw+0nYj/bAEKNGX8Kpyq+WRUCbHlpbqoGWSSjDiTWOncmwfH
         P0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760125137; x=1760729937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G42i/u8MRJ9M6Twy2bIRqjYAwcznw/QdFBR+ThWzAOg=;
        b=PdyTehAwE5ULGht3We8GChP+Ned7YQTZZV8BMGFZ+dOlY/Gv1vXk4Oq+XmgMrS9mFy
         1xoRO2ooc3e2hVrhmCxCVA2ake6U0ZjGgPAjN8R567YLY8I1rxCn++avl9mksEic6phE
         2CID/8w43lcIXRpu2pgAm/QIPQL+fxaj2ajRFhOaqUEBSFayGiyet0kqJdFBvoYR/KTw
         q2D8+i5EPQBvguPQ5u7ZXwAMqUvcXg/nhv+5deHVC6CK2e8vSaqWeFlAdZ5NkrX55+oe
         wNyDF/IqLsXm/0m5k4Zonk5eMBuhHbTQnEH+4DiiqV28i6emLnPB+f2i5GAhU5nxAYIg
         JCng==
X-Forwarded-Encrypted: i=1; AJvYcCX2lot471RckYAISwGzbkL7BN0p1g4AKRJCoyuYRjXd9EnyQZgTo4QpvZHHhjV/q3beqtLSW2ItuS0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzzQbHLTVVi/MG2lTn58X+CdtOc7sPRhCEUz5+U7zXd34eSPoMS
	Afjr2XOfdzcpYLR0cCSwogS+mjjQb50lxPxmU0XDYXzAaBvcLzSB+fwfjqL1h1nxwy5kBmepNQI
	wa5nx7VHWBGG+/GGHWYZN0qxl1CPmTHfHrQfFqOUh
X-Gm-Gg: ASbGncsmokLsTQPGKNDRiFB7HTP2g1PGrAPwY9QP1xVq7aVO2E+9xJNu/7Ts2ZKrikN
	wd0yCAOt4ZgzHf61JgEsqAfHAgzWSCEsK23QkxHLZXb9MK8F/TaBFc92iMouUskMwKBAu9jYQ55
	LjwvfPIPuP2t2X8pC1XxoYOCwfCF9pBEMjvQ1xRbYP54yntiZdnxEHEEJyLPbVNuK+bt94iAAD8
	xwjOnNJf8wTQ2hB6+0DsBlWVTpfRK9tLfiP3FsMEbMX6zGYuH8L70hkk0cbPi/TPNv9YmA+jA==
X-Google-Smtp-Source: AGHT+IHIodl2NROYEXh/33nRBxbfEbLDzR8sSJgEr+hrINiKOgEMjhQA45bKdj70j3vWXJWBDjRujP7bStH4hSJ2gwQ=
X-Received: by 2002:a05:600c:c1d7:20b0:45d:f6a6:a13e with SMTP id
 5b1f17b1804b1-46fa9a94635mr7264035e9.1.1760125137119; Fri, 10 Oct 2025
 12:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250930163635.4035866-1-vipinsh@google.com> <20250930163635.4035866-10-vipinsh@google.com>
 <DDEJY5ON407O.2O7CMOY9311NV@google.com> <aOlM7ngJJsEW-5sV@google.com>
In-Reply-To: <aOlM7ngJJsEW-5sV@google.com>
From: Vipin Sharma <vipinsh@google.com>
Date: Fri, 10 Oct 2025 12:38:19 -0700
X-Gm-Features: AS18NWBZyUvCG4kU2gu0uAzSe3onaIPRVz7Z1T1oN44tuheRWwvOLEuzuPBM3VY
Message-ID: <CAHVum0e9fFfivmDg2N9VvWQfPdc4DfV0_qEhrRaFQXFjhr8LRA@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] KVM: selftests: Provide README.rst for KVM
 selftests runner
To: Sean Christopherson <seanjc@google.com>, Brendan Jackman <jackmanb@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	pbonzini@redhat.com, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, anup@brainfault.org, atish.patra@linux.dev, 
	zhaotianrui@loongson.cn, maobibo@loongson.cn, chenhuacai@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, ajones@ventanamicro.com, 
	kvm-riscv <kvm-riscv-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_123859_175125_4974D846 
X-CRM114-Status: GOOD (  26.90  )
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

T24gRnJpLCBPY3QgMTAsIDIwMjUgYXQgMTE6MTTigK9BTSBTZWFuIENocmlzdG9waGVyc29uIDxz
ZWFuamNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIE9jdCAxMCwgMjAyNSwgQnJlbmRh
biBKYWNrbWFuIHdyb3RlOgo+ID4gVG8gYXZvaWQgY29uZnVzaW5nIHBlb3BsZSBhbmQgcG90ZW50
aWFsbHkgbGVhdmUgdGhlIGRvb3Igb3BlbiB0byBhCj4gPiBjbGVhbmVyIGludGVncmF0aW9uLCBw
bGVhc2UgY2FuIHlvdSBhZGQgc29tZSBiaXRzIGhlcmUgYWJvdXQgaG93IHRoaXMKPiA+IHJlbGF0
ZXMgdG8gdGhlIHJlc3Qgb2YgdGhlIGtzZWxmdGVzdCBpbmZyYXN0cnVjdHVyZT8gU29tZSBxdWVz
dGlvbnMgSQo+ID4gdGhpbmsgYXJlIHdvcnRoIGFuc3dlcmluZzoKPiA+CgpJdCdzIGEgZ29vZCBw
b2ludCwgSSBzaG91bGQgd3JpdGUgYWJvdXQgaG93IGl0IGNvbXBhcmVzIHdpdGgga3NlbGZ0ZXN0
CmluZnJhc3RydWN0dXJlLgoKPiA+IC0gQXMgc29tZW9uZSB3aG8gcnVucyBLVk0gc2VsZnRlc3Rz
LCBidXQgZG9lc24ndCB3b3JrIHNwZWNpZmljYWxseSBvbgo+ID4gICBLVk0sIHRvIHdoYXQgZXh0
ZW50IGRvIEkgbmVlZCB0byBrbm93IGFib3V0IHRoaXMgdG9vbD8gQ2FuIEkgc3RpbGwgcnVuCj4g
PiAgIHRoZSBzZWxmdGVzdHMgInRoZSBvbGQgZmFzaGlvbmVkIHdheSIgYW5kIGlmIHNvIHdoYXQg
ZG8gSSBsb3NlIGFzCj4gPiAgIGNvbXBhcmVkIHRvIHVzaW5nIHRoZSBLVk0gcnVubmVyPwo+Cj4g
VGhlIHJ1bm5lciBpcyBwdXJlbHkgb3B0aW9uYWwuICBZb3UnbGwgbG9zZSB3aGF0ZXZlciB5b3Ug
ZG9uJ3QgaGF2ZSwgdGhhdCB0aGUKPiBydW5uZXIgcHJvdmlkZXMuICBFLmcuIEkgaGF2ZSAoaGFj
a3kpIHNjcmlwdHMgdG8gcnVuIEtWTSBzZWxmdGVzdHMgaW4gcGFyYWxsZWwsCj4gYnV0IHdpdGhv
dXQgbXVjaCBvZiB0aGUgbmljZXRpZXMgcHJvdmlkZWQgYnkgdGhpcyBydW5uZXIuCj4KCkZvciBv
Y2Nhc2lvbmFsIGNvbnRyaWJ1dG9ycywgaXQgd2lsbCBwcm92aWRlIG9wcG9ydHVuaXR5IHRvIHJ1
biB0aGUKZGVmYXVsdCB0ZXN0cyBhbmQgcnVuIHRlc3RzIHdpdGggZGlmZmVyZW50IGNvbWJpbmF0
aW9ucyBvZiB0aGVpcgpjb21tYW5kIGxpbmUgb3B0aW9ucy4gT3ZlcmFsbCwgcHJvdmlkZXMgYmV0
dGVyIHRlc3QgY292ZXJhZ2UgYW5kCmNvbmZpZGVuY2UgYmVmb3JlIHNlbmRpbmcgcGF0Y2hlcyB1
cHN0cmVhbS4KCkZvciByZWd1bGFyIGNvbnRyaWJ1dG9ycyBhbmQgbWFpbnRhaW5lcnMsIGEgZmFz
dCBleGVjdXRpb24gb2YKc2VsZnRlc3RzICsgbW9yZSBjb3ZlcmFnZS4gUnVubmVyIGFsbG93cyB0
aGVtIHRvIGNvbmZpZ3VyZSBvdXRwdXQgYW5kCnJlc3VsdHMgYXMgcGVyIHRoZWlyIHdpc2gvd29y
a2Zsb3dzLgoKRm9yIGV2ZXJ5b25lLCB0byB1cGxvYWQgdGhlaXIgaW50ZXJlc3RpbmcgdGVzdCBj
b21iaW5hdGlvbnMgdGhleSB1c2UKc28gdGhhdCB0aGUgb3ZlcmFsbCBLVk0gY29tbXVuaXR5IGdl
dHMgYmVuZWZpdCBvdXQgb2YgaXQuCgo+ID4gLSBEb2VzIHRoaXMgc3lzdGVtIGNoYW5nZSB0aGUg
ImRhdGEgbW9kZWwiIG9mIHRoZSBzZWxmdGVzdHMgYXQgYWxsLCBhbmQKPiA+ICAgaWYgc28gaG93
PyBJLmUuIEkgdGhpbmsgKGJ1dCBob25lc3RseSBJJ20gbm90IHN1cmUpIHRoYXQga3NlbGZ0ZXN0
cwo+ID4gICBhcmUgYSAyLXRpZXIgaGllcmFyY2h5IG9mICRzdWl0ZTokdGVzdCB3aXRob3V0IGFu
eSBmdXJ0aGVyCj4gPiAgIHBhcmFtZXRlcmlzYXRpb24gb3IgbmVzdGluZyAod2hlcmUgdGhlcmUg
aXMgbW9yZSBkZXRhaWwsIGl0J3MgaGlkZGVuCj4gPiAgIGFzIGltcGxlbWVudGF0aW9uIGRldGFp
bHMgb2YgaW5kaXZpZHVhbCAkdGVzdHMpLiBEbyB0aGUgS1ZNIHNlbGZ0ZXN0cwo+ID4gICBoYXZl
IHRoaXMgc3RydWN0dXJlPwo+Cj4gTW9yZSBvciBsZXNzLgo+Cj4gPiAgIElmIGl0IGRpZmZlcnMs
IGhvdyBkb2VzIHRoYXQgZWZmZWN0IHRoZSB2aWV3IGZyb20gcnVuX2tzZWxmdGVzdC5zaD8KPgo+
IEFGQUlLLCBub3RoaW5nIGluIEtWTSBzZWxmdGVzdHMgaXMgYXQgb2RkcyB3aXRoIHJ1bl9rc2Vs
ZnRlc3Quc2guCj4KPiA+IC0gSSB0aGluayAoYWdhaW4sIG5vdCB2ZXJ5IHN1cmUpIHRoYXQgaW4g
a3NlbGZ0ZXN0IHRoYXQgZWFjaCAkdGVzdCBpcyBhCj4gPiAgIGNvbW1hbmQgZXhlY3V0aW5nIGEg
cHJvY2Vzcy4gQW5kIHRoaXMgcHJvY2VzcyBjb21tdW5pY2F0ZXMgaXRzIHN0YXR1cwo+ID4gICBi
eSBwcmludGluZyBLVEFQIGFuZCByZXR1cm5pbmcgYW4gZXhpdCBjb2RlLiBJcyB0aGF0IHN0dWZm
IHRoZSBzYW1lCj4gPiAgIGZvciB0aGlzIHJ1bm5lcj8KPgo+IFllcz8gIEV4Y2VwdCBtb3N0IEtW
TSBzZWxmdGVzdHMgZG9uJ3Qgc3VwcG9ydCBUQVAgKHlldCkuCgpIZXJlIGVhY2ggdGVzdCBpcyBl
eGVjdXRlZCBpbiBpdHMgb3duIHN1YnByb2Nlc3MuIE91dHB1dCBvZiBydW5uZXIgaXMKbm90IGlu
IEtUQVAgZm9ybWF0LCBzYW1lIGZvciBtYWpvcml0eSBvZiB0aGUgS1ZNIHRlc3RzLgoKRXhlY3V0
aW9uIGlzIGFueSBjb21tYW5kIHdyaXR0ZW4gaW4gKi50ZXN0IGZpbGUsIHdoaWNoIGlzIGludGVy
cHJldGVkCmFzIGEgY29tbWFuZCB0byBleGVjdXRlIGluIGEgc2hlbGwuIFRoaXMgYWxsb3dzIHVz
IHRvIHdyaXRlIHRlc3RzCndoaWNoIGNhbiBydW4gYmFzZWQgb24gdGhlIHJlc291cmNlcyBvbiB0
aGUgaG9zdCBsaWtlIG51bWJlciBvZiB2Y3B1cwp0byB1c2UsIGhvdyBtdWNoIG1lbW9yeSB0byBh
bGxvY2F0ZSwgZXRjLgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9rdm0tcmlzY3YK
