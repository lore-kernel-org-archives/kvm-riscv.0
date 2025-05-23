Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C2DC3DA6D
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 May 2025 08:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NEN9UNIO/oEY2j+Cxb+ePudxKHK22Db5OacF3cFs3PU=; b=Z9hxpz8lx61dzN
	bIz/LZ3tEnnl2TygJpw6q2vh2P4jOej0CjzGL31BS3YCmHFmowWs98LgZohNPoejgICiK9VsfP+/B
	iVi0XKVraz9U+5u77G+Q5dklokvinzAMDC42RayBWtmCrT2nuPVESiSFQ1hWXr+P7iZIxE8pMJUrS
	F38gXzCoLsfpKO7e+3YskFL5D+zXh1ETQ18YxVssyeL1m5n3McJzgur8109TfU7k7RNY+tD4WSb1v
	a2376DKdpx6ivEMe5myJ3H6H2Ppg8VbB6kDbGZ6nxQOcnLE1z00BfSm6SEAOaQ6i6Bi1Q6vxbPziY
	LJ/4nVeCGklocEsvCtNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIO1O-00000003KWr-3QxN;
	Fri, 23 May 2025 08:44:54 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uINSM-00000003GYD-0Llf
	for kvm-riscv@lists.infradead.org;
	Fri, 23 May 2025 08:08:43 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso83370871fa.2
        for <kvm-riscv@lists.infradead.org>; Fri, 23 May 2025 01:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747987720; x=1748592520; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dypiNcBVG4OJMnXknsT6VxHNsIlokeB6DjiUVywy6W8=;
        b=DQhdeOYl/GPhA/j9t9wA/sskzXLNY6GTdptHHXT9B4WferUir2wzCop62M82BwPhAC
         NieO09SYiHNFMMLsjylVt6okh296og2Ns6Uta3Zif3weBriRXe5WbdRn8iWb34CVuinv
         iwcR3a6K4t/WPrsgCWUeRhgri7gr4AWo1rylVQ9bVuTdshYrxF3ZYE2JvWsrAiZxjaWw
         02WK43nuPcygVWwJuzXua/WWXpidLrEZhLTCs6Cyj5mh6qTwcIjm+grWezJ22xMDj1w5
         NlPlhlzsp5FB/43RNxbJhAvfxkHDglFcPNUZBkS5xrcN1D053Y2tw7t0my+yVZPKQ1lb
         xbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747987720; x=1748592520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dypiNcBVG4OJMnXknsT6VxHNsIlokeB6DjiUVywy6W8=;
        b=v6uDqC9T3DhGUpX11ycmmga/GFXEwIi9m/hszS7r3Jsgha19GLlO2XoBIZkvVCUqxI
         QiwCXwYPeDcS6d+mQXwmGQQq+dBGd+rFpJJ/72tsznbDmSKiMMzsYJkv9FOR+CSuNgQg
         GTrF2OVhkssgXeuXnxPnYzBUPxVwfLf56cTTCThDepi9B4kFd2Mon4Ky2fA4Q9iq7bOv
         VzaZzGdOQiTstjihO0aZoK/U+bNSQZBuW9kE7vzrxnMcF0QFxcDS73kXjsRJ/y/jsqqM
         HTXyIFJ0HwkePhoeF4UiY0oJhXoJEW8tWLiuiMT/34wBxAzFzvk3crliTpiDF9JQcMLz
         Ou4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBBTchlefEelevQ9SXxRdCUBPhky9MXO5ncXz7H9LBQiBwCePGeCpLq/KqZ8CQQWMXwyD4+FBQOPc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyuIaQGMwBumPURu00dQnkZIKBWoTC2SeaoNdvrsE4dL8/d72EI
	ouJ2/ZwlTTJlK564NHStUbl5wr4G0dG/j8io3ayOq5Vf+Cr3WTpXyDWYbZm4n19IfE1B/CWEvWq
	aHx5AlX2xXvxh8CoxKNJwQayGZUu7odLGtxvdwBPLpQ==
X-Gm-Gg: ASbGnctJg1kohR0QZ7LfADgcXRd0HO+ndeaztDcjCFrGL5hx2fuSfe01SOhtZcRsQ2b
	6nBoa6O1YRjv4C7iqPBmWfMoDjXWI3GG3gE8skPlISHF9/NnR7rBE5+YYEHxA+F5ibjJOMEEkkq
	sw3DcPIyL6ta6SNmb7Oj16qWW7N5+teh2q
X-Google-Smtp-Source: AGHT+IGBWGbvTx7BQMeoVdfMzTjiV714zLjub63DnKd4CcjGSz5Rh79IxGXRhtq0036FNv1p8KYTEfYuBPB1oZQn9Xs=
X-Received: by 2002:a05:651c:e18:b0:30b:f775:bb25 with SMTP id
 38308e7fff4ca-328097a7fd4mr82948211fa.36.1747987719490; Fri, 23 May 2025
 01:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250515143723.2450630-4-rkrcmar@ventanamicro.com>
 <1a7a81fd-cf15-4b54-a805-32d66ced4517@linux.dev> <DA3CUGMQXZNW.2BF5WWE4ANFS0@ventanamicro.com>
In-Reply-To: <DA3CUGMQXZNW.2BF5WWE4ANFS0@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 23 May 2025 13:38:26 +0530
X-Gm-Features: AX0GCFue-dsAlqCUbca0f2FbyJ1Uuu3t8ikYPvU9ghMwoHzDApFhc1zUuloECeE
Message-ID: <CAK9=C2Xi3=9JL5f=0as2nEYKuRVTtJoL6Vdt_y2E06ta6G_07A@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] RISC-V: KVM: VCPU reset fixes
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_010842_132370_1D9DFBE0 
X-CRM114-Status: GOOD (  24.93  )
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

T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMTI6NDfigK9QTSBSYWRpbSBLcsSNbcOhxZkgPHJrcmNt
YXJAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiAyMDI1LTA1LTIyVDE0OjQzOjQwLTA3OjAw
LCBBdGlzaCBQYXRyYSA8YXRpc2gucGF0cmFAbGludXguZGV2PjoKPiA+IE9uIDUvMTUvMjUgNzoz
NyBBTSwgUmFkaW0gS3LDhG3Dg8Khw4Ugd3JvdGU6Cj4gPj4gSGVsbG8sCj4gPj4KPiA+PiB0aGUg
ZGVzaWduIHN0aWxsIHJlcXVpcmVzIGEgZGlzY3Vzc2lvbi4KPiA+Pgo+ID4+IFt2MyAxLzJdIHJl
bW92ZXMgbW9zdCBvZiB0aGUgYWRkaXRpb25hbCBjaGFuZ2VzIHRoYXQgdGhlIEtWTSBjYXBhYmls
aXR5Cj4gPj4gd2FzIGRvaW5nIGluIHYyLiAgW3YzIDIvMl0gaXMgbmV3IGFuZCBwcmV2aWV3cyBh
IGdlbmVyYWwgc29sdXRpb24gdG8gdGhlCj4gPj4gbGFjayBvZiB1c2Vyc3BhY2UgY29udHJvbCBv
dmVyIEtWTSBTQkkuCj4gPj4KPiA+Cj4gPiBJIGFtIHN0aWxsIG1pc3NpbmcgdGhlIG1vdGl2YXRp
b24gYmVoaW5kIGl0LiBJZiB0aGUgbW90aXZhdGlvbiBpcyBTQkkKPiA+IEhTTSBzdXNwZW5kLCB0
aGUgUEFUQ0gyIGRvZXNuJ3QgYWNoaWV2ZSB0aGF0IGFzIGl0IGZvcndhcmRzIGV2ZXJ5IGNhbGwK
PiA+IHRvIHRoZSB1c2VyIHNwYWNlLiBXaHkgZG8geW91IHdhbnQgdG8gY29udHJvbCBoc20gc3Rh
cnQvc3RvcCBmcm9tIHRoZQo+ID4gdXNlciBzcGFjZSA/Cj4KPiBIU00gbmVlZHMgZml4aW5nLCBi
ZWNhdXNlIEtWTSBkb2Vzbid0IGtub3cgd2hhdCB0aGUgc3RhdGUgYWZ0ZXIKPiBzYmlfaGFydF9z
dGFydCBzaG91bGQgYmUuCj4gRm9yIGV4YW1wbGUsIHdlIGhhZCBhIGRpc2N1c3Npb24gYWJvdXQg
c2NvdW50ZXJlbiBhbmQgcmVnYXJkbGVzcyBvZiB3aGF0Cj4gZGVmYXVsdCB3ZSBjaG9vc2UgaW4g
S1ZNLCB0aGUgdXNlcnNwYWNlIG1pZ2h0IHdhbnQgYSBkaWZmZXJlbnQgdmFsdWUuCj4gSSBkb24n
dCB0aGluayB0aGF0IEhTTSBzdGFydC9zdG9wIGlzIGEgaG90IHBhdGgsIHNvIHRyYXBwaW5nIHRv
Cj4gdXNlcnNwYWNlIHNlZW1zIGJldHRlciB0aGFuIGFkZGluZyBtb3JlIGtlcm5lbCBjb2RlLgoK
VGhlcmUgYXJlIG5vIGltcGxlbWVudGF0aW9uIHNwZWNpZmljIFMtbW9kZSBDU1IgcmVzZXQgdmFs
dWVzCnJlcXVpcmVkIGF0IHRoZSBtb21lbnQuIFdoZW5ldmVyIHRoZSBuZWVkIGFyaXNlcywgd2Ug
d2lsbCBleHRlbmQKdGhlIE9ORV9SRUcgaW50ZXJmYWNlIHNvIHRoYXQgdXNlciBzcGFjZSBjYW4g
c3BlY2lmeSBjdXN0b20KQ1NSIHJlc2V0IHZhbHVlcyBhdCBHdWVzdC9WTSBjcmVhdGlvbiB0aW1l
LiBXZSBkb24ndCBuZWVkIHRvCmZvcndhcmQgU0JJIEhTTSBjYWxscyB0byB1c2VyIHNwYWNlIGZv
ciBjdXN0b20gUy1tb2RlIENTUgpyZXNldCB2YWx1ZXMuCgo+Cj4gRm9yd2FyZGluZyBhbGwgdGhl
IHVuaW1wbGVtZW50ZWQgU0JJIGVjYWxscyBzaG91bGRuJ3QgYmUgYSBwZXJmb3JtYW5jZQo+IGlz
c3VlLCBiZWNhdXNlIFMtbW9kZSBzb2Z0d2FyZSB3b3VsZCBob3BlZnVsbHkgbGVhcm4gYWZ0ZXIg
dGhlIGZpcnN0Cj4gZXJyb3IgYW5kIHN0b3AgdHJ5aW5nIGFnYWluLgo+Cj4gQWxsb3dpbmcgdXNl
cnNwYWNlIHRvIGZ1bGx5IGltcGxlbWVudCB0aGUgZWNhbGwgaW5zdHJ1Y3Rpb24gb25lIG9mIHRo
ZQo+IG1vdGl2YXRpb25zIGFzIHdlbGwgLS0gU0JJIGlzIG5vdCBhIHBhcnQgb2YgUklTQy1WIElT
QSwgc28gc29tZW9uZSBtaWdodAo+IGJlIGludGVyZXN0ZWQgaW4gYWNjZWxlcmF0aW5nIGEgZGlm
ZmVyZW50IE0tbW9kZSBzb2Z0d2FyZSB3aXRoIEtWTS4KPgo+IEknbGwgc2VuZCB2NCBsYXRlciB0
b2RheSAtLSB0aGVyZSBpcyBhIG1pc3NpbmcgcGFydCBpbiBbMi8yXSwgYmVjYXVzZQo+IHVzZXJz
cGFjZSBhbHNvIG5lZWRzIHRvIGJlIGFibGUgdG8gZW11bGF0ZSB0aGUgYmFzZSBTQkkgZXh0ZW5z
aW9uLgo+CgpFbXVsYXRpbmcgZW50aXJlIFNCSSBpbiB1c2VyIHNwYWNlIGhhcyBtYXkgY2hhbGxl
bmdlcywgaGVyZQphcmUgZmV3OgoKMSkgU0JJIElQSSBpbiB1c2Vyc3BhY2Ugd2lsbCByZXF1aXJl
IGFuIGlvY3RsIHRvIHRyaWdnZXIgVkNQVSBsb2NhbAppbnRlcnJ1cHQgd2hpY2ggZG9lcyBub3Qg
ZXhpc3QuIFdlIG9ubHkgaGF2ZSBLVk0gaW9jdGxzIHRvIHRyaWdnZXIKZXh0ZXJuYWwgaW50ZXJy
dXB0cyBhbmQgTVNJcy4KCjIpIFNCSSBSRkVOQ0UgaW4gdXNlcnNwYWNlIHdpbGwgcmVxdWlyZXMg
SEZFTkNFIG9wZXJhdGlvbiBpbgp1c2VyIHNwYWNlIHdoaWNoIGlzIG5vdCBhbGxvd2VkIGJ5IFJJ
U0MtViBJU0EuCgozKSBTQkkgUE1VIHVzZXMgTGludXggcGVyZiBmcmFtZXdvcmsgQVBJcyB0byBz
aGFyZSBjb3VudGVycwpiZXR3ZWVuIGhvc3QgYW5kIGd1ZXN0LiBUaGUgTGludXggcGVyZiBBUElz
IGZvciBndWVzdCBwZXJmIGV2ZW50cwphcmUgbm90IGF2YWlsYWJsZSB0byB1c2Vyc3BhY2UgYXMg
c3lzY2FsbCBvciBpb2N0bC4KCjQpIFNCSSBTVEEgdXNlcyBzY2hlZF9pbmZvLnJ1bl9kZWxheSB3
aGljaCBJIGFtIHN1cmUgaXMgbm90CmF2YWlsYWJsZSB0byB1c2VyIHNwYWNlLgoKNSkgU0JJIE5B
Q0wgd2hlbiBpbXBsZW1lbnRlZCB3aWxsIGJlIHVzaW5nIHRvbnMgb2YgSFMtbW9kZQpmdW5jdGlv
bmFsaXR5IChIUy1tb2RlIENTUnMsIEhGRU5DRXMsIGV0Yy4pIHRvIGFjaGlldmUgdGhlCm5lc3Rl
ZCB3b3JsZC1zd2l0Y2ggYW5kIG5vbmUgb2YgdGhlc2UgYXJlIGFjY2Vzc2libGUgdG8gdXNlcnNw
YWNlLgoKNikgU0JJIEZXRlQgbWF5IHJlcXVpcmUgcHJvZ3JhbW1pbmcgaHN0YXRlZW5YIENTUnMg
d2hpY2gKYXJlIG5vdCBhY2Nlc3NpYmxlIHRvIHVzZXJzcGFjZS4KCjcpIFNCSSBEQlRSIHJlcXVp
cmVzIGRpcmVjdCBjb29yZGluYXRpb24gYmV0d2VlbiB0aGUgS1ZNIFJJU0MtVgphbmQga2VybmVs
IGh3X2JyZWFrcG9pbnQgZHJpdmVyIHRvIHNoYXJlIHRoZSBkZWJ1ZyB0cmlnZ2Vycy4KCi4uLiBh
bmQgc28gb24gLi4uCgpCYXNlZCBvbiB0aGUgYWJvdmUsIGVtdWxhdGluZyB0aGUgZW50aXJlIFNC
SSBpbiB1c2VyIHNwYWNlIGlzCmEgbm9uLXN0YXJ0ZXIuIFRoZSBiZXN0IGFwcHJvYWNoIGlzIHRv
IHNlbGVjdGl2ZWx5IGZvcndhcmQgU0JJCmNhbGxzIHRvIHVzZXIgc3BhY2Ugd2hlcmUgbmVlZGVk
IChlLmcuIFNCSSBzeXN0ZW0gcmVzZXQsClNCSSBzeXN0ZW0gc3VzcGVuZCwgU0JJIGRlYnVnIGNv
bnNvbGUsIGV0Yy4pLgoKUmVnYXJkcywKQW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QK
a3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
