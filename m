Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5842CC369D9
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 04:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lA4wdCS/8+9Js0fxEJmBtEDE6socmm9W/mO0oY478io=; b=FrmT9NPx9/9nVY
	d8Uv33tPq5NZlTU7RdSC/kSx3/xCcVgAJ6sFMcggK6QhWCKVzWafLXpmIazSNW56wFDqZMk2raEsp
	3vlchdPHeBnv5UypKEyx/n2FtHg5UhI24lhj70EI4v9sQc7Ej2Qy9eqTCAFbAHKtfWo6pRuAGCncj
	r6mHUCDb1QuRRlovtcsjhaKr3Giv8YjA3zEZDA4SQkFbqpmvosVO3orXANrNnBdNHwXWhw23SPcvm
	RNAbiMh/pRpCNuUU5qt1M4hXxwUEEGPt71kbOYHshXce/SGN3L6NIz4Zwfgy0/pBW6rs5y1pdjR1/
	HMWMUyajrAzlWAkOsYfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9yzl-0000000Bezu-2zD7;
	Wed, 30 Apr 2025 04:24:29 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9yyF-0000000BerP-30OI
	for kvm-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 04:22:57 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3d91db4f0c3so33129475ab.3
        for <kvm-riscv@lists.infradead.org>; Tue, 29 Apr 2025 21:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745986974; x=1746591774; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38ct102e6rV67TAerTfgwlZVdfvCfH6VgRwQ5JTNiqY=;
        b=aAmiRAqjtM5vrAwKWbl30Ucg3FR1Kf3Tk3QRlmCDC15BtNgLqQkXIxXkJtUsmCwKE+
         0+vf4YEFcag5aXB9sV+vJNLOSoP2HDB07VDOiVm37tiam7u26fFra/wi8b2i4Vaq0LB8
         opHvPXAMtrLMn/7VYi4Ov90iO0/Hd+LO1b+bRbE7q/s+dHaDBmflJjzrwtQ+WUZgMuw8
         Mo9mKywXFN7qYyy6SQuq3rQno4kxZ+iJMbmANTWnk+ZizkdWhZPo2SG2HPYsHA1elzhS
         8vVhb/UFRw5T8mti7qyphPumyBf6e8YBE5+q4jLKXP5wkbseO9L+axR0MKEjNqFQM/ge
         acMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745986974; x=1746591774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38ct102e6rV67TAerTfgwlZVdfvCfH6VgRwQ5JTNiqY=;
        b=Putagy3p5YQuhNlGHyif48hqP7UQPDXbD3WTgg+ZFendUZL9e7cBIAFj6q58fkZrCN
         7VD9zzCiAZi6zqIVIMiBe3GHMJaFUoOyZ6I6RxkUbUhA7/ENzxslREGiq/QMizdr5btH
         uZXFkq7ECox5ZvpxYKPsKbowr80yosLdQqyzzZ5Bb60iwr82djLttj+g07CSMrkHuP0P
         0M7xE7ZZNDRD8QZzwX3F+dZE5gGcb9CiMWx13h/QeI2uzZt24DBQfwTkGlfbcMbL5Lnj
         a64dOxxLsTtCGf1r/0cl+iZrmbBTAHlIU1qKqMbBzxeQ66+0hklbJsSMgXj/4xPlOeal
         sLRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5YP7r/kuSZNAbVsTJSt4ltZuxAd0hM2GT88FipTsl3PXjg45Fl+lHjlEdZyr8YXBrirRbPYHKRjk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9zOM2XP89Mi5A8hZ/s1dd3qlV/t3eRrL3PBW+zxGsBd5iYZtl
	QFC0cbvKpgirMIvLu+Q90ivKj7lxFzK00N1mwuQ3FmbFpoHH3IqlkP/e9QiB3c3GD7t7D7gtTZy
	oTQx3HHUJlN8c+5EA99k//tO+yEr8WZRJsJ6TCA==
X-Gm-Gg: ASbGncu+6j4t3qZEAudbef1h/o+5MDdbhTbwAUV3X2Kvtyj+pUCmmkt8dfdElL1mUDR
	Lr4BeZe66K3tFlYIueWdCHh0qJc1V5drzyGCCavAw2v1OW8RjyA2QLZKjXvhbhq5Ws5F6gwN0ch
	to2+1kZQB+1Ge9bwNEpGX4AkU=
X-Google-Smtp-Source: AGHT+IGl4iGmSaKp5RMw7EFDZJmn8F4FnfgYTHM0Ni9376soeIPJv4IoaKlXnzwrp9V2WncKuJ+CQDmMBVybP2mqJe8=
X-Received: by 2002:a05:6e02:4506:20b0:3d8:1e50:1d55 with SMTP id
 e9e14a558f8ab-3d967fc205dmr5957645ab.11.1745986974519; Tue, 29 Apr 2025
 21:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-7-rkrcmar@ventanamicro.com> <CAAhSdy0e3HVN6pX-hcX2N+kpwsupsCf6BqrYq=bvtwtFOuEVhA@mail.gmail.com>
 <D9IGJR9DGFAM.1PVHVOOTVRFZW@ventanamicro.com> <CAK9=C2Woc5MtrJeqNtaVkMXWEsGeZPsmUgtFQET=OKLHLwRbPA@mail.gmail.com>
 <D9J1TBKYC8YH.1OPUI289U0O2C@ventanamicro.com> <CAAhSdy01yBBfJwdTn90WeXFR85=1zTxuebFhi4CQJuOujVTHXg@mail.gmail.com>
 <D9J9DW53Q2GD.1PB647ISOCXRX@ventanamicro.com>
In-Reply-To: <D9J9DW53Q2GD.1PB647ISOCXRX@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 30 Apr 2025 09:52:43 +0530
X-Gm-Features: ATxdqUGmKl8csSBnKXlzPOE4lM8k7L-kt85DmcktMYspDC-PRgYE5KsnznLpoKg
Message-ID: <CAAhSdy0B-pF-jHmTXNYE7NXwdCWJepDtGR__S+P4MhZ1bfUERQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] KVM: RISC-V: reset VCPU state when becoming runnable
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Anup Patel <apatel@ventanamicro.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Mayuresh Chitale <mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_212256_025256_034DE923 
X-CRM114-Status: GOOD (  45.02  )
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

T24gVHVlLCBBcHIgMjksIDIwMjUgYXQgOTo1MeKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IDIwMjUtMDQtMjlUMjA6MzE6MTgrMDU6MzAs
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Ogo+ID4gT24gVHVlLCBBcHIgMjksIDIw
MjUgYXQgMzo1NeKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29t
PiB3cm90ZToKPiA+Pgo+ID4+IDIwMjUtMDQtMjlUMTE6MjU6MzUrMDU6MzAsIEFudXAgUGF0ZWwg
PGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPjoKPiA+PiA+IE9uIE1vbiwgQXByIDI4LCAyMDI1IGF0
IDExOjE14oCvUE0gUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdy
b3RlOgo+ID4+ID4+Cj4gPj4gPj4gMjAyNS0wNC0yOFQxNzo1MjoyNSswNTozMCwgQW51cCBQYXRl
bCA8YW51cEBicmFpbmZhdWx0Lm9yZz46Cj4gPj4gPj4gPiBPbiBUaHUsIEFwciAzLCAyMDI1IGF0
IDU6MDLigK9QTSBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4gd3Jv
dGU6Cj4gPj4gPj4gPj4gRm9yIGEgY2xlYW5lciBzb2x1dGlvbiwgd2Ugc2hvdWxkIGFkZCBpbnRl
cmZhY2VzIHRvIHBlcmZvcm0gdGhlIEtWTS1TQkkKPiA+PiA+PiA+PiByZXNldCByZXF1ZXN0IG9u
IHVzZXJzcGFjZSBkZW1hbmQuICBJIHRoaW5rIGl0IHdvdWxkIGFsc28gYmUgbXVjaCBiZXR0ZXIK
PiA+PiA+PiA+PiBpZiB1c2Vyc3BhY2Ugd2FzIGluIGNvbnRyb2wgb2YgdGhlIHBvc3QtcmVzZXQg
c3RhdGUuCj4gPj4gPj4gPgo+ID4+ID4+ID4gQXBhcnQgZnJvbSBicmVha2luZyBLVk0gdXNlci1z
cGFjZSwgdGhpcyBwYXRjaCBpcyBpbmNvcnJlY3QgYW5kCj4gPj4gPj4gPiBkb2VzIG5vdCBhbGln
biB3aXRoIHRoZToKPiA+PiA+PiA+IDEpIFNCSSBzcGVjCj4gPj4gPj4gPiAyKSBPUyBib290IHBy
b3RvY29sLgo+ID4+ID4+ID4KPiA+PiA+PiA+IFRoZSBTQkkgc3BlYyBvbmx5IGRlZmluZXMgdGhl
IGVudHJ5IHN0YXRlIG9mIGNlcnRhaW4gQ1BVIHJlZ2lzdGVycwo+ID4+ID4+ID4gKG5hbWVseSwg
UEMsIEEwLCBhbmQgQTEpIHdoZW4gQ1BVIGVudGVycyBTLW1vZGU6Cj4gPj4gPj4gPiAxKSBVcG9u
IFNCSSBIU00gc3RhcnQgY2FsbCBmcm9tIHNvbWUgb3RoZXIgQ1BVCj4gPj4gPj4gPiAyKSBVcG9u
IHJlc3VtaW5nIGZyb20gbm9uLXJldGVudGl2ZSBTQkkgSFNNIHN1c3BlbmQgb3IKPiA+PiA+PiA+
ICAgICBTQkkgc3lzdGVtIHN1c3BlbmQKPiA+PiA+PiA+Cj4gPj4gPj4gPiBUaGUgUy1tb2RlIGVu
dHJ5IHN0YXRlIG9mIHRoZSBib290IENQVSBpcyBkZWZpbmVkIGJ5IHRoZQo+ID4+ID4+ID4gT1Mg
Ym9vdCBwcm90b2NvbCBhbmQgbm90IGJ5IHRoZSBTQkkgc3BlYy4gRHVlIHRvIHRoaXMsIHJlYXNv
bgo+ID4+ID4+ID4gS1ZNIFJJU0MtViBleHBlY3RzIHVzZXItc3BhY2UgdG8gc2V0IHVwIHRoZSBT
LW1vZGUgZW50cnkKPiA+PiA+PiA+IHN0YXRlIG9mIHRoZSBib290IENQVSB1cG9uIHN5c3RlbSBy
ZXNldC4KPiA+PiA+Pgo+ID4+ID4+IFdlIGNhbiBoYW5kbGUgdGhlIGluaXRpYWwgc3RhdGUgY29u
c2lzdGVuY3kgaW4gb3RoZXIgcGF0Y2hlcy4KPiA+PiA+PiBXaGF0IG5lZWRzIGFkZHJlc3Npbmcg
aXMgYSB3YXkgdG8gdHJpZ2dlciB0aGUgS1ZNIHJlc2V0IGZyb20gdXNlcnNwYWNlLAo+ID4+ID4+
IGV2ZW4gaWYgb25seSB0byBjbGVhciB0aGUgaW50ZXJuYWwgS1ZNIHN0YXRlLgo+ID4+ID4+Cj4g
Pj4gPj4gSSB0aGluayBtcF9zdGF0ZSBpcyBjdXJyZW50bHkgdGhlIGJlc3Qgc2lnbmFsaXphdGlv
biB0aGF0IEtWTSBzaG91bGQKPiA+PiA+PiByZXNldCwgc28gSSBhZGRlZCBpdCB0aGVyZS4KPiA+
PiA+Pgo+ID4+ID4+IFdoYXQgd291bGQgYmUgeW91ciBwcmVmZXJyZWQgaW50ZXJmYWNlIGZvciB0
aGF0Pwo+ID4+ID4+Cj4gPj4gPgo+ID4+ID4gSW5zdGVhZCBvZiBjcmVhdGluZyBhIG5ldyBpbnRl
cmZhY2UsIEkgd291bGQgcHJlZmVyIHRoYXQgVkNQVQo+ID4+ID4gd2hpY2ggaW5pdGlhdGVzIFNC
SSBTeXN0ZW0gUmVzZXQgc2hvdWxkIGJlIHJlc2V0dGVkIGltbWVkaWF0ZWx5Cj4gPj4gPiBpbi1r
ZXJuZWwgc3BhY2UgYmVmb3JlIGZvcndhcmRpbmcgdGhlIHN5c3RlbSByZXNldCByZXF1ZXN0IHRv
Cj4gPj4gPiB1c2VyIHNwYWNlLgo+ID4+Cj4gPj4gVGhlIGluaXRpYXRpbmcgVkNQVSBtaWdodCBu
b3QgYmUgdGhlIGJvb3QgVkNQVS4KPiA+PiBJdCB3b3VsZCBiZSBzYWZlciB0byByZXNldCBhbGwg
b2YgdGhlbS4KPiA+Cj4gPiBJIG1lYW50IGluaXRpYXRpbmcgVkNQVSBhbmQgbm90IHRoZSBib290
IFZDUFUuIEN1cnJlbnRseSwgdGhlCj4gPiBub24taW5pdGlhdGluZyBWQ1BVcyBhcmUgYWxyZWFk
eSByZXNldHRlZCBieSBWQ1BVIHJlcXVlc3RzCj4gPiBzbyBub3RoaW5nIHNwZWNpYWwgbmVlZHMg
dG8gYmUgZG9uZS4KClRoZXJlIGlzIG5vIGRlc2lnbmF0ZWQgYm9vdCBWQ1BVIGZvciBLVk0gc28g
bGV0IHVzIG9ubHkgdXNlIHRoZQp0ZXJtICJpbml0aWF0aW5nIiBvciAibm9uLWluaXRpYXRpbmci
IFZDUFVzIGluIGNvbnRleHQgb2Ygc3lzdGVtIHJlc2V0LgoKPgo+IEN1cnJlbnRseSwgd2UgbWFr
ZSB0aGUgcmVxdWVzdCBvbmx5IGZvciBWQ1BVcyBicm91Z2h0IHVwIGJ5IEhTTSAtLSB0aGUKPiBu
b24tYm9vdCBWQ1BVcy4gIFRoZXJlIGlzIGEgc2luZ2xlIFZDUFUgbm90IGJlaW5nIHJlc2V0IGFu
ZCByZXNldHRpbmcKPiB0aGUgcmVzZXQgaW5pdGlhdGluZyBWQ1BVIGNoYW5nZXMgbm90aGluZy4g
ZS5nLgo+Cj4gICAxKSBWQ1BVIDEgaW5pdGlhdGVzIHRoZSByZXNldCB0aHJvdWdoIGFuIGVjYWxs
Lgo+ICAgMikgQWxsIFZDUFVzIGFyZSBzdG9wcGVkIGFuZCByZXR1cm4gdG8gdXNlcnNwYWNlLgoK
V2hlbiBhbGwgVkNQVXMgYXJlIHN0b3BwZWQsIGFsbCBWQ1BVcyBleGNlcHQgVkNQVTEKKGluIHRo
aXMgZXhhbXBsZSkgd2lsbCBTTEVFUCBiZWNhdXNlIHdlIGRvCiJrdm1fbWFrZV9hbGxfY3B1c19y
ZXF1ZXN0KHZjcHUtPmt2bSwgS1ZNX1JFUV9TTEVFUCkiCnNvIG5vbmUgb2YgdGhlIFZDUFVzIGV4
Y2VwdCBWQ1BVMSAoaW4gdGhpcyBjYXNlKSB3aWxsCnJldHVybiB0byB1c2Vyc3BhY2UuCgo+ICAg
MykgVXNlcnNwYWNlIHByZXBhcmVzIFZDUFUgMCBhcyB0aGUgYm9vdCBWQ1BVLgo+ICAgNCkgVkNQ
VSAwIGV4ZWN1dGVzIHdpdGhvdXQgZ29pbmcgdGhyb3VnaCBLVk0gcmVzZXQgcGF0aHMuCgpVc2Vy
c3BhY2Ugd2lsbCBzZWUgYSBzeXN0ZW0gcmVzZXQgZXZlbnQgZXhpdCBmb3IgdGhlCmluaXRpYXRp
bmcgVkNQVSBieSB0aGF0IHRpbWUgYWxsIG90aGVyIFZDUFVzIGFyZSBhbHJlYWR5CnNsZWVwaW5n
IHdpdGggbXBfc3RhdGUgPT0gS1ZNX01QX1NUQVRFX1NUT1BQRUQuCgo+Cj4gVGhlIHBvaW50IG9m
IHRoaXMgcGF0Y2ggaXMgdG8gcmVzZXQgdGhlIGJvb3QgVkNQVSwgc28gd2UgcmVzZXQgdGhlIFZD
UFUKPiB0aGF0IGlzIG1hZGUgcnVubmFibGUgYnkgdGhlIEtWTV9TRVRfTVBfU1RBVEUgSU9DVEwu
CgpMaWtlIEkgc2FpZCBiZWZvcmUsIHdlIGRvbid0IG5lZWQgdG8gZG8gdGhpcy4gVGhlIGluaXRp
YXRpbmcgVkNQVQpjYW4gYmUgcmVzZXR0ZWQganVzdCBiZWZvcmUgZXhpdGluZyB0byB1c2VyIHNw
YWNlIGZvciBzeXN0ZW0gcmVzZXQKZXZlbnQgZXhpdC4KCj4KPiBGb3IgZGVzaWduIGFsdGVybmF0
aXZlcywgaXQgaXMgYWxzbyBwb3NzaWJsZSB0byByZXNldCBpbW1lZGlhdGVseSBpbiBhbgo+IElP
Q1RMIGluc3RlYWQgb2YgbWFraW5nIHRoZSByZXNldCByZXF1ZXN0Lgo+Cj4gPj4gWW91IGFsc28g
cHJldmlvdXNseSBtZW50aW9uZWQgdGhhdCB3ZSBuZWVkIHRvIHByZXNlcnZlIHRoZSBwcmUtcmVz
ZXQKPiA+PiBzdGF0ZSBmb3IgdXNlcnNwYWNlLCB3aGljaCBJIGNvbXBsZXRlbHkgYWdyZWUgd2l0
aCBhbmQgaXQgaXMgd2h5IHRoZQo+ID4+IHJlc2V0IGhhcHBlbnMgbGF0ZXIuCj4gPgo+ID4gWWVz
LCB0aGF0IHdhcyBvbmx5IGZvciBkZWJ1ZyBwdXJwb3NlcyBmcm9tIHVzZXIgc3BhY2UuIEF0IHRo
ZQo+ID4gbW9tZW50LCB0aGVyZSBpcyBubyBvbmUgdXNpbmcgdGhpcyBmb3IgZGVidWcgcHVycG9z
ZXMgc28gd2UKPiA+IGNhbiBzYWNyaWZpY2UgdGhhdC4KPgo+IFdlIHN0aWxsIGNhbid0IGltbWVk
aWF0ZWx5IHJlc2V0IHRoZSBib290IFZDUFUsIGJlY2F1c2UgaXQgbWlnaHQgYWxyZWFkeQo+IGJl
IGluIHVzZXJzcGFjZS4gIFdlIGRvbid0IHJlYWxseSBiZW5lZml0IGZyb20gaW1tZWRpYXRlbHkg
cmVzZXR0aW5nIHRoZQo+IGluaXRpYXRpbmcgVkNQVS4KPiBBbHNvLCBtYWtpbmcgdGhlIHJlc2V0
IHJlcXVlc3QgZm9yIGFsbCBWQ1BVcyBmcm9tIHRoZSBpbml0aWF0aW5nIFZDUFUKPiBoYXMgc29t
ZSB1bmRlc2lyYWJsZSByYWNlIGNvbmRpdGlvbnMgd2Ugd291bGQgaGF2ZSB0byBwcmV2ZW50LCBz
byBJIGRvCj4gcHJlZmVyIHdlIGdvIHRoZSBJT0NUTCByZXNldCB3YXkuCgpBbGwgVkNQVXMgYXJl
IHNsZWVwaW5nIHdpdGggbXBfc3RhdGUgPT0gS1ZNX01QX1NUQVRFX1NUT1BQRUQKd2hlbiB1c2Vy
c3BhY2Ugc2VlcyBzeXN0ZW0gcmVzZXQgZXhpdCBvbiB0aGUgaW5pdGlhdGluZyBWQ1BVIHNvIEkg
ZG9uJ3QKc2VlIGFueSByYWNlIGNvbmRpdGlvbiBpZiB3ZSBhbHNvIHJlc2V0IHRoZSBpbml0aWF0
aW5nIFZDUFUgYmVmb3JlIGV4aXRpbmcKdG8gdXNlcnNwYWNlLgoKPgo+ID4+ID4gICAgICAgICAg
ICAgVGhpcyB3YXkgd2UgYWxzbyBmb3JjZSBLVk0gdXNlci1zcGFjZSB0byBleHBsaWNpdGx5Cj4g
Pj4gPiBzZXQgdGhlIFBDLCBBMCwgYW5kIEExIGJlZm9yZSBydW5uaW5nIHRoZSBWQ1BVIGFnYWlu
IGFmdGVyCj4gPj4gPiBzeXN0ZW0gcmVzZXQuCj4gPj4KPiA+PiBXZSBhbHNvIHdhbnQgdG8gY29u
c2lkZXIgcmVzZXQgZnJvbSBlbXVsYXRpb24gb3V0c2lkZSBvZiBLVk0uCj4gPj4KPiA+PiBUaGVy
ZSBpcyBhICJzaW1wbGUiIHNvbHV0aW9uIHRoYXQgY292ZXJzIGV2ZXJ5dGhpbmcgKGV4Y2VwdCBz
cGVlZCkgLS0KPiA+PiB0aGUgdXNlcnNwYWNlIGNhbiB0ZWFyIGRvd24gdGhlIHdob2xlIFZNIGFu
ZCByZS1jcmVhdGUgaXQuCj4gPj4gRG8gd2Ugd2FudCB0byBkbyB0aGlzIGluc3RlYWQgYW5kIGRy
b3AgYWxsIHJlc2V0cyBmcm9tIEtWTT8KPiA+Cj4gPiBJIHRoaW5rIHdlIHNob3VsZCBrZWVwIHRo
ZSBWQ1BVIHJlc2V0cyBpbiBLVk0gc28gdGhhdCBoYW5kbGluZwo+ID4gb2Ygc3lzdGVtIHJlc2V0
IGhhbmRsaW5nIGluIHVzZXIgc3BhY2UgcmVtYWlucyBzaW1wbGUuIFRoZSB1c2VyCj4gPiBzcGFj
ZSBjYW4gYWxzbyByZS1jcmVhdGUgdGhlIFZNIHVwb24gc3lzdGVtIHJlc2V0IGJ1dCB0aGF0IGlz
Cj4gPiB1c2VyIHNwYWNlIGNob2ljZS4KPgo+IE9rLgoKUmVnYXJkcywKQW51cAoKLS0gCmt2bS1y
aXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
