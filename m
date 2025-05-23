Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026FDC54ED0
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 May 2025 09:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KAB41S6FSsc8acWvxEWhhGnU1Mu9sitS3feo+UiSuHk=; b=NhUsansnjdQ/bI
	u0lLQCOXdaC37MaMNo7Icw+dhVx53JjfuqcVSHlWCDwitLPeGHA27IHXI7fUrdJwfnJm9e+Y0YaOv
	RL9w+l/zz7lfYQj17VEecOhhlNB+QCSoyJi31i0ITGEZ39d1/BUEEvSh6KYvT6H61V7nEeTu8f5J1
	CT2VUkHf84aYcL8Qb7y23nQwMgqfr3Y6WeCMaWsYqqDmyT0q6rgdaHbkKHGd/jyGzHm4g+LhtcZlD
	3pVikWz378oWrlI9+VKu4Q4Ul91tRgUAoJIJZUptZWNyKUHOwSumFxIBQn2qcRWRDvZ6Y6TO4yH/9
	1SzfBm0Ym83BIhFH2Mug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIObQ-00000003Qiu-2Wbj;
	Fri, 23 May 2025 09:22:08 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIOZj-00000003QTI-0ZT1
	for kvm-riscv@lists.infradead.org;
	Fri, 23 May 2025 09:20:24 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a35ae46214so900932f8f.2
        for <kvm-riscv@lists.infradead.org>; Fri, 23 May 2025 02:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747992021; x=1748596821; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KpJiR9jmmCdIglXVSKgEoS5Pv74wpHne5sRyii9bqBU=;
        b=OBnoMTY+oUbW8TDvQfX6ZpyK/thyKoGpOrDC5t2QD6aEH+DFK1J64spCJ8Kv09Vjo/
         ltMXdrDgavdev/81RaNblAGUYMEdhEzTztlfwgImNFiboHvqyexpi2ErX0S61V9CmGP3
         1tZ//fgOpsxnNbQfhsIAWRvof+LLLQuHLpOLnUQK+Z05l3tbOSuvmvzFHIAznUAUAFP6
         iK0Mc7sARh3tLfUhXk1agid5MPBsA08tZ37daW5cTUMeQ0J+1otyWzRI3Wb7NoP9IgYe
         Erh1/8av2qAXc2T8U5H2pHkxbVAoxCK5vuEXEt14VxwmE5c58hD09zS79r9jINdp7/s6
         p41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747992021; x=1748596821;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KpJiR9jmmCdIglXVSKgEoS5Pv74wpHne5sRyii9bqBU=;
        b=GEUiNShkcYFl21mY3JlBEr8PuKREcheTGsgqZiG2nH0RWuq2MXfpj5gOKJ6Vexkxvh
         gFcyWRrjkx/j7bhvHIV99nIMmCg9zPIOCDxVtivS0Q7VWHp9XbQySijqu62VlhdfBF5d
         nqSmObgi6/3azdDezwSyOWMdLxII+GgU87hVCTyC+d11CcdCIYvFpLnYhjnQWWVmkA4f
         6mtO5+QwOYQP+1fm85Ya0g/hMVYuYBkqK05VG7k/XJi8Lv76hPHzPdh/14CxFFsLefTS
         BplokQjgDQG4sSWKRpV6skaH7xjdXUpfkpNo+dhp/nVXrPjIgj4YD8bm7y5IYhCzR9lI
         uwnw==
X-Forwarded-Encrypted: i=1; AJvYcCXiVLKTfUeYeUM9uJ68b+/JgmvjLZWDdL2bgdkaSNmq/ORetgcDrROpN/BtQwXEG5p4vzqVGbT0VDU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7cqwAJsq6felwK3qRYn85AicCLAQ2WR754pQ/wPnh+171Av6B
	y7ThyEX3zNrxM9qq/m5VY2qxZaZuDsqrwy4syh2NZmysBWFAtPhUr0VDGFpghVYLIBg=
X-Gm-Gg: ASbGnct14ANG2hmY/btSPErQRaxcgL+ewfupDX7ALlvMIkJuY4/HWbOEqpLHesXpbE4
	Op2qRNHtlXs3wcEBPzyVN5xBML1sNQxqpR+wmJHs9UtVyuqQ1I+D4XBgcpWiPvvggngVGOZrFNl
	h5cIome8zKomZ1jR60Zx5d4iTyd01lb2/6fo7W7czlSAfwcalhc0+j7ERe+n1uKLd4NzlJjS4Tu
	mCtAFCc5HNXHbo7d1sVQJXtkYVR4bZ7JJIhw8ZWhdimWZcQAYn6rlV1r21G8DZbirwuGUMeR+4A
	H0lV4gMwV84fw0bkxPaSmeufhjbZDXtXCTnevjTqEo73D8k2kJcZc5cyXig77srCsY1znA==
X-Google-Smtp-Source: AGHT+IEMU9a6aZGz+kLhPKpDgsPP465aof0p3jZZCP5dmiHATC63+CKThZDo4xy3NUbvdUIjkoiEdw==
X-Received: by 2002:a05:600c:4f8e:b0:439:a1c7:7b3a with SMTP id 5b1f17b1804b1-442fd60ee47mr80699975e9.1.1747992021455;
        Fri, 23 May 2025 02:20:21 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:be84:d9ad:e5e6:f60b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef0aadsm132780315e9.12.2025.05.23.02.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 02:20:21 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 23 May 2025 11:20:20 +0200
Message-Id: <DA3FGGI5PEZG.3T26KJXT2QO8M@ventanamicro.com>
Cc: "Atish Patra" <atish.patra@linux.dev>, <kvm-riscv@lists.infradead.org>,
 <kvm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Anup Patel" <anup@brainfault.org>, "Atish
 Patra" <atishp@atishpatra.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Andrew Jones" <ajones@ventanamicro.com>
To: "Anup Patel" <apatel@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v3 0/2] RISC-V: KVM: VCPU reset fixes
References: <20250515143723.2450630-4-rkrcmar@ventanamicro.com>
 <1a7a81fd-cf15-4b54-a805-32d66ced4517@linux.dev>
 <DA3CUGMQXZNW.2BF5WWE4ANFS0@ventanamicro.com>
 <CAK9=C2Xi3=9JL5f=0as2nEYKuRVTtJoL6Vdt_y2E06ta6G_07A@mail.gmail.com>
In-Reply-To: <CAK9=C2Xi3=9JL5f=0as2nEYKuRVTtJoL6Vdt_y2E06ta6G_07A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_022023_181089_E3889887 
X-CRM114-Status: GOOD (  22.85  )
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

MjAyNS0wNS0yM1QxMzozODoyNiswNTozMCwgQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNy
by5jb20+Ogo+IE9uIEZyaSwgTWF5IDIzLCAyMDI1IGF0IDEyOjQ34oCvUE0gUmFkaW0gS3LEjW3D
ocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Pgo+PiAyMDI1LTA1LTIyVDE0
OjQzOjQwLTA3OjAwLCBBdGlzaCBQYXRyYSA8YXRpc2gucGF0cmFAbGludXguZGV2PjoKPj4gPiBP
biA1LzE1LzI1IDc6MzcgQU0sIFJhZGltIEtyw4Rtw4PCocOFIHdyb3RlOgo+PiA+PiBIZWxsbywK
Pj4gPj4KPj4gPj4gdGhlIGRlc2lnbiBzdGlsbCByZXF1aXJlcyBhIGRpc2N1c3Npb24uCj4+ID4+
Cj4+ID4+IFt2MyAxLzJdIHJlbW92ZXMgbW9zdCBvZiB0aGUgYWRkaXRpb25hbCBjaGFuZ2VzIHRo
YXQgdGhlIEtWTSBjYXBhYmlsaXR5Cj4+ID4+IHdhcyBkb2luZyBpbiB2Mi4gIFt2MyAyLzJdIGlz
IG5ldyBhbmQgcHJldmlld3MgYSBnZW5lcmFsIHNvbHV0aW9uIHRvIHRoZQo+PiA+PiBsYWNrIG9m
IHVzZXJzcGFjZSBjb250cm9sIG92ZXIgS1ZNIFNCSS4KPj4gPj4KPj4gPgo+PiA+IEkgYW0gc3Rp
bGwgbWlzc2luZyB0aGUgbW90aXZhdGlvbiBiZWhpbmQgaXQuIElmIHRoZSBtb3RpdmF0aW9uIGlz
IFNCSQo+PiA+IEhTTSBzdXNwZW5kLCB0aGUgUEFUQ0gyIGRvZXNuJ3QgYWNoaWV2ZSB0aGF0IGFz
IGl0IGZvcndhcmRzIGV2ZXJ5IGNhbGwKPj4gPiB0byB0aGUgdXNlciBzcGFjZS4gV2h5IGRvIHlv
dSB3YW50IHRvIGNvbnRyb2wgaHNtIHN0YXJ0L3N0b3AgZnJvbSB0aGUKPj4gPiB1c2VyIHNwYWNl
ID8KPj4KPj4gSFNNIG5lZWRzIGZpeGluZywgYmVjYXVzZSBLVk0gZG9lc24ndCBrbm93IHdoYXQg
dGhlIHN0YXRlIGFmdGVyCj4+IHNiaV9oYXJ0X3N0YXJ0IHNob3VsZCBiZS4KPj4gRm9yIGV4YW1w
bGUsIHdlIGhhZCBhIGRpc2N1c3Npb24gYWJvdXQgc2NvdW50ZXJlbiBhbmQgcmVnYXJkbGVzcyBv
ZiB3aGF0Cj4+IGRlZmF1bHQgd2UgY2hvb3NlIGluIEtWTSwgdGhlIHVzZXJzcGFjZSBtaWdodCB3
YW50IGEgZGlmZmVyZW50IHZhbHVlLgo+PiBJIGRvbid0IHRoaW5rIHRoYXQgSFNNIHN0YXJ0L3N0
b3AgaXMgYSBob3QgcGF0aCwgc28gdHJhcHBpbmcgdG8KPj4gdXNlcnNwYWNlIHNlZW1zIGJldHRl
ciB0aGFuIGFkZGluZyBtb3JlIGtlcm5lbCBjb2RlLgo+Cj4gVGhlcmUgYXJlIG5vIGltcGxlbWVu
dGF0aW9uIHNwZWNpZmljIFMtbW9kZSBDU1IgcmVzZXQgdmFsdWVzCj4gcmVxdWlyZWQgYXQgdGhl
IG1vbWVudC4KCkplc3NpY2EgbWVudGlvbmVkIHRoYXQgQlNEIHJlcXVpcmVzIHNjb3VudGVyZW4g
dG8gYmUgbm9uLXplcm8sIHNvCnVzZXJzcGFjZSBzaG91bGQgYmUgYWJsZSB0byBwcm92aWRlIHRo
YXQgdmFsdWUuCgpJIHdvdWxkIHByZWZlciBpZiBLVk0gY291bGQgYXZvaWQgZ2V0dGluZyBpbnRv
IHRob3NlIGRpc2N1c3Npb25zLgpXZSBjYW4ganVzdCBqdXN0IGxldCB1c2Vyc3BhY2UgYmUgYXMg
Y3JhenkgYXMgaXQgd2FudHMuCgo+ICAgICAgICAgICAgICAgICAgICAgICAgIFdoZW5ldmVyIHRo
ZSBuZWVkIGFyaXNlcywgd2Ugd2lsbCBleHRlbmQKPiB0aGUgT05FX1JFRyBpbnRlcmZhY2Ugc28g
dGhhdCB1c2VyIHNwYWNlIGNhbiBzcGVjaWZ5IGN1c3RvbQo+IENTUiByZXNldCB2YWx1ZXMgYXQg
R3Vlc3QvVk0gY3JlYXRpb24gdGltZS4gV2UgZG9uJ3QgbmVlZCB0bwo+IGZvcndhcmQgU0JJIEhT
TSBjYWxscyB0byB1c2VyIHNwYWNlIGZvciBjdXN0b20gUy1tb2RlIENTUgo+IHJlc2V0IHZhbHVl
cy4KClRoZSBiZW5lZml0cyBvZiBhZGRpbmcgYSBuZXcgT05FX1JFRyBpbnRlcmZhY2Ugc2VlbSB2
ZXJ5IHNtYWxsIGNvbXBhcmVkCnRvIHRoZSBkcmF3YmFja3Mgb2YgaGF2aW5nIGV4dHJhIGtlcm5l
bCBjb2RlLgoKSWYgdXNlcnNwYWNlIHdvdWxkIHdhbnQgdG8gcmVzZXQgb3Igc2V0dXAgbmV3IG11
bHRpLVZDUFVzIFZNcyBvZnRlbiwgd2UKY291bGQgYWRkIGFuIGludGVyZmFjZSB0aGF0IGxvYWRz
IHRoZSB3aG9sZSByZWdpc3RlciBzdGF0ZSBmcm9tCnVzZXJzcGFjZSBpbiBhIHNpbmdsZSBJT0NU
TCwgYmVjYXVzZSBPTkVfUkVHIGlzIG5vdCB0aGUgYmVzdCBpbnRlcmZhY2UKZm9yIGJ1bGsgZGF0
YSB0cmFuc2ZlciBlaXRoZXIuCgo+PiBGb3J3YXJkaW5nIGFsbCB0aGUgdW5pbXBsZW1lbnRlZCBT
QkkgZWNhbGxzIHNob3VsZG4ndCBiZSBhIHBlcmZvcm1hbmNlCj4+IGlzc3VlLCBiZWNhdXNlIFMt
bW9kZSBzb2Z0d2FyZSB3b3VsZCBob3BlZnVsbHkgbGVhcm4gYWZ0ZXIgdGhlIGZpcnN0Cj4+IGVy
cm9yIGFuZCBzdG9wIHRyeWluZyBhZ2Fpbi4KPj4KPj4gQWxsb3dpbmcgdXNlcnNwYWNlIHRvIGZ1
bGx5IGltcGxlbWVudCB0aGUgZWNhbGwgaW5zdHJ1Y3Rpb24gb25lIG9mIHRoZQo+PiBtb3RpdmF0
aW9ucyBhcyB3ZWxsIC0tIFNCSSBpcyBub3QgYSBwYXJ0IG9mIFJJU0MtViBJU0EsIHNvIHNvbWVv
bmUgbWlnaHQKPj4gYmUgaW50ZXJlc3RlZCBpbiBhY2NlbGVyYXRpbmcgYSBkaWZmZXJlbnQgTS1t
b2RlIHNvZnR3YXJlIHdpdGggS1ZNLgo+Pgo+PiBJJ2xsIHNlbmQgdjQgbGF0ZXIgdG9kYXkgLS0g
dGhlcmUgaXMgYSBtaXNzaW5nIHBhcnQgaW4gWzIvMl0sIGJlY2F1c2UKPj4gdXNlcnNwYWNlIGFs
c28gbmVlZHMgdG8gYmUgYWJsZSB0byBlbXVsYXRlIHRoZSBiYXNlIFNCSSBleHRlbnNpb24uCj4+
Cj4KPiBbLi4uXSAgICAgICAgICBUaGUgYmVzdCBhcHByb2FjaCBpcyB0byBzZWxlY3RpdmVseSBm
b3J3YXJkIFNCSQo+IGNhbGxzIHRvIHVzZXIgc3BhY2Ugd2hlcmUgbmVlZGVkIChlLmcuIFNCSSBz
eXN0ZW0gcmVzZXQsCj4gU0JJIHN5c3RlbSBzdXNwZW5kLCBTQkkgZGVidWcgY29uc29sZSwgZXRj
LikuCgpUaGF0IGlzIGV4YWN0bHkgd2hhdCBteSBwcm9wb3NhbCBkb2VzLCBpdCdzIGp1c3QgdGhh
dCB0aGUgdXNlcnNwYWNlIHNheXMKd2hhdCBpcyAibmVlZGVkIi4KCklmIHdlIHN0YXJ0ZWQgd2l0
aCB0aGlzIG1lY2hhbmlzbSwgS1ZNIHdvdWxkIG5vdCBoYXZlIG5lZWRlZCB0byBhZGQKU1JTVC9T
VVNQL0RCQ04gU0JJIGVtdWxhdGlvbiBhdCBhbGwgLS0gdGhleSB3b3VsZCBiZSBmb3J3YXJkZWQg
YXMgYW55Cm90aGVyIHVuaGFuZGxlZCBlY2FsbC4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0
Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
