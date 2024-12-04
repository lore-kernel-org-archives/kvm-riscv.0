Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6118E7716B
	for <kvm-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 03:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VgWy0n2fX25L5sqocRqDtNty6G8IkB3S8uiNtfmflYk=; b=wXSE9sUL22z1na
	MAM2lRfRvH+bP9B4RIz8L8gsEQIzG7i0DX1H5UmY0NE8xj/4rKuSGiKQ+F7tIDn2CavliolwRCUNE
	sMF96j5JT/qMU82n41ItGZWZw2RVRotRO2IUS5h2CmyTCWAjag9KguWgRFaociVsZsKGAL6zx6Gac
	xDSUEs76NaDebg2bfd1queI9i4IOh16pldx5y1onzhaqGXtYdfhXldKq8pM/fvliOTkxXDMIM0bzV
	ClaT4/Rb7wRAJD7sbv3pu8K/vk1///YJM4uSgIxc5LT3swOMPL9fdhqdjdOhqFGZonluUENkU9avQ
	wcucA6u56JYcCC0D/lFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIgIf-0000000BP7k-1Z5O;
	Wed, 04 Dec 2024 03:43:41 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIgIc-0000000BP6p-1wfI
	for kvm-riscv@lists.infradead.org;
	Wed, 04 Dec 2024 03:43:39 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-8419f5baedcso202081139f.2
        for <kvm-riscv@lists.infradead.org>; Tue, 03 Dec 2024 19:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1733283817; x=1733888617; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGkT/pl1gB1Evs4ReRwjiJx5mPh/IBj5HFwD48IlujU=;
        b=a4NgtdO/gk7Ss134NcYDNBST/22Uw/8adMipPRMKhw+YfdMFTedxt2VgH4yn4LM4LR
         4EvCWwSCjKvK2QA3Y5g239mYkEZlSLQEnZElwNx+s6e0H4wVdCG1JlWDiKdwMYdXOT//
         Ox2IBx54GuT1flc0YGgAESqLPczm+qoK/CXr/Nz9GUzyUUg36F24GFJjRRC0gnZcq73H
         CNG58+8TygYmj8OoKitVvMK35VXkJeltKcx7f4M0xaa7YOWC8lNaSS6jPfeaUci8fD6V
         nDsEc0NDckdIVMEDl3ylylQ5764w73RiTY/D7ic+JtjS9Ow7tEEhIxVvRFRYrTpwxais
         Le3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733283817; x=1733888617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGkT/pl1gB1Evs4ReRwjiJx5mPh/IBj5HFwD48IlujU=;
        b=gRrINtQum3XRzfxLyiTup0eI2YdraBRnqAzYr2Ze6AJlSmjDIlb5EsohSwNkw3j76n
         Om/vaVFQHFdXXH7jHJQVI6YlLYovShak2+JnEQxcOL5EDxpEae/u+EE9t/SocilcLUmu
         AlseYavB3aoveCLcWSekAbgmfi0r6QsC1OzKx1WTflibOnM5cjTgW7U8qM1wSFE7/Jc/
         BKdEvdkeblkphlrH0q/26JNdFmeNqfI0gYV9fBGc8z39lJk4yv1DKctTFJ/GC3+2zm7T
         2vYPPoEFz6Bd4a+rc/nnV1ECPiw2tVlvp7T1BNloKvKQQZ0b5ku2X4HBOqctyhEjLeRn
         POTw==
X-Forwarded-Encrypted: i=1; AJvYcCX7IXZtBaF8epGHcYGUVBfo2HyBNHtqL+mRmLe5+pRkWzKNgUCRwORLu8+Kbv7Kiv32PHAfJnV68oE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7+wfFnddGOpVCuqODgP/kz3utCjIS/NjtjpPtUhCdYa4E9eGr
	aa0Oy74XBgvl9/mJUDrv8v/y2geLcCsJ6qrZQlCV6Wa3DVeiB2jocuQ+dbLq8NObi4siwIu7L3e
	RmLlavh4oJDoyhgVD3AE84+y/Hye5s/OPwZ6zAg==
X-Gm-Gg: ASbGncvovVTZcdYa9icryYz2W55ceoU+n00mMWTPLiwOn2zSHlcEOzBx7y2apYuQrPT
	bULevjjaY4811t2bOMR9N3JFML4Fl7yzPHA==
X-Google-Smtp-Source: AGHT+IGWdFp8FF+1NtOQA0riwNaVCNa+lNq7c5BS40O1U8dW0QvsTp35bk3sIYPxMlaLCPGVX4HHb6tLAmO9iVR0CsU=
X-Received: by 2002:a05:6602:29c8:b0:807:f0fb:1192 with SMTP id
 ca18e2360f4ac-8445b5477f8mr665966539f.1.1733283817005; Tue, 03 Dec 2024
 19:43:37 -0800 (PST)
MIME-Version: 1.0
References: <20241114161845.502027-17-ajones@ventanamicro.com>
 <20241114161845.502027-18-ajones@ventanamicro.com> <87mshcub2u.ffs@tglx>
 <CAAhSdy08gi998HsTkGpaV+bTWczVSL6D8c7EmuTQqovo63oXDw@mail.gmail.com>
 <874j3ktrjv.ffs@tglx> <87ser4s796.ffs@tglx>
In-Reply-To: <87ser4s796.ffs@tglx>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 4 Dec 2024 09:13:24 +0530
Message-ID: <CAAhSdy27gaVJaXBrx8GB+Xr4ZTvp8hd0Jg8JokzehgC-=5pOmA@mail.gmail.com>
Subject: Re: [RFC PATCH 01/15] irqchip/riscv-imsic: Use hierarchy to reach irq_set_affinity
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Jones <ajones@ventanamicro.com>, iommu@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tjeznach@rivosinc.com, zong.li@sifive.com, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, atishp@atishpatra.org, alex.williamson@redhat.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_194338_761316_443746DC 
X-CRM114-Status: GOOD (  35.78  )
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

T24gV2VkLCBEZWMgNCwgMjAyNCBhdCA0OjI54oCvQU0gVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxp
bnV0cm9uaXguZGU+IHdyb3RlOgo+Cj4gT24gVHVlLCBEZWMgMDMgMjAyNCBhdCAyMTo1NSwgVGhv
bWFzIEdsZWl4bmVyIHdyb3RlOgo+ID4gT24gVHVlLCBEZWMgMDMgMjAyNCBhdCAyMjowNywgQW51
cCBQYXRlbCB3cm90ZToKPiA+PiBPbiBUdWUsIERlYyAzLCAyMDI0IGF0IDc6MjPigK9QTSBUaG9t
YXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4gd3JvdGU6Cj4gPj4+IFNvcnJ5LCBJIG1p
c3NlZCB0aGF0IHdoZW4gcmV2aWV3aW5nIHRoZSBvcmlnaW5hbCBJTVNJQyBNU0kgc3VwcG9ydC4K
PiA+Pj4KPiA+Pj4gVGhlIHdob2xlIElNU0lDIE1TSSBzdXBwb3J0IGNhbiBiZSBtb3ZlZCBvdmVy
IHRvIE1TSSBMSUIgd2hpY2ggbWFrZXMgYWxsCj4gPj4+IG9mIHRoaXMgaW5kaXJlY3Rpb24gZ28g
YXdheSBhbmQgeW91ciBpbnRlcm1lZGlhdGUgZG9tYWluIHdpbGwganVzdCBmaXQKPiA+Pj4gaW4u
Cj4gPj4+Cj4gPj4+IFVuY29tcGlsZWQgcGF0Y2ggYmVsb3cuIElmIHRoYXQgd29ya3MsIGl0IG5l
ZWRzIHRvIGJlIHNwbGl0IHVwIHByb3Blcmx5Lgo+ID4+Pgo+ID4+PiBOb3RlLCB0aGlzIHJlbW92
ZXMgdGhlIHNldHVwIG9mIHRoZSBpcnFfcmV0cmlnZ2VyIGNhbGxiYWNrLCBidXQgdGhhdCdzCj4g
Pj4+IGZpbmUgYmVjYXVzZSBvbiBoaWVyYXJjaGljYWwgZG9tYWlucyBpcnFfY2hpcF9yZXRyaWdn
ZXJfaGllcmFyY2h5KCkgaXMKPiA+Pj4gaW52b2tlZCBhbnl3YXkuIFNlZSB0cnlfcmV0cmlnZ2Vy
KCkuCj4gPj4KPiA+PiBUaGUgSU1TSUMgZHJpdmVyIHdhcyBtZXJnZWQgb25lIGtlcm5lbCByZWxl
YXNlIGJlZm9yZSBjb21tb24KPiA+PiBNU0kgTElCIHdhcyBtZXJnZWQuCj4gPgo+ID4gQWggaW5k
ZWVkLgo+ID4KPiA+PiBXZSBzaG91bGQgZGVmaW5pdGVseSB1cGRhdGUgdGhlIElNU0lDIGRyaXZl
ciB0byB1c2UgTVNJIExJQiwgSSB3aWxsCj4gPj4gdHJ5IHlvdXIgc3VnZ2VzdGVkIGNoYW5nZXMg
KGJlbG93KSBhbmQgcG9zdCBhIHNlcGFyYXRlIHNlcmllcy4KPiA+Cj4gPiBQaWNrIHVwIHRoZSBk
ZWx0YSBwYXRjaCBJIGdhdmUgQW5kcmV3Li4uCj4KPiBBcyBJIHdhcyBsb29raW5nIGF0IHNvbWV0
aGluZyBlbHNlIE1TSSByZWxhdGVkIEkgaGFkIGEgbG9vayBhdAo+IGltc2ljX2lycV9zZXRfYWZm
aW5pdHkoKSBhZ2Fpbi4KPgo+IEl0J3MgYWN0dWFsbHkgcmVxdWlyZWQgdG8gaGF2ZSB0aGUgbWVz
c2FnZSB3cml0ZSBpbiB0aGF0IGZ1bmN0aW9uIGFuZAo+IG5vdCBhZnRlcndhcmRzIGFzIHlvdSBp
bnZva2UgaW1zaWNfdmVjdG9yX21vdmUoKSBmcm9tIHRoYXQgZnVuY3Rpb24uCj4KPiBUaGF0J3Mg
b2J2aW91c2x5IG5vdCB0cnVlIGZvciB0aGUgcmVtYXAgY2FzZSBhcyB0aGF0IHdpbGwgbm90IGNo
YW5nZSB0aGUKPiBtZXNzYWdlIGFkZHJlc3MvZGF0YSBwYWlyIGJlY2F1c2UgdGhlIHJlbWFwIHRh
YmxlIGVudHJ5IGlzIGltbXV0YWJsZSAtCj4gYXQgbGVhc3QgSSBhc3N1bWUgc28gZm9yIG15IG1l
bnRhbCBzYW5pdHkgc2FrZSA6KQo+Cj4gQnV0IHRoYXQgYnJpbmdzIG1lIHRvIGEgcmVsYXRlZCBx
dWVzdGlvbi4gSG93IGlzIHRoaXMgc3VwcG9zZWQgdG8gd29yawo+IHdpdGggbm9uLWF0b21pYyBt
ZXNzYWdlIHVwZGF0ZXM/IFBDSS9NU0kgZG9lcyBub3QgbmVjZXNzYXJpbHkgcHJvdmlkZQo+IG1h
c2tpbmcsIGFuZCB0aGUgd3JpdGUgb2YgdGhlIGFkZHJlc3MvZGF0YSBwYWlyIGlzIGRvbmUgaW4g
Yml0cyBhbmQKPiBwaWVjZXMuIFNvIHlvdSBjYW4gZW5kIHVwIHdpdGggYW4gaW50ZXJtZWRpYXRl
IHN0YXRlIHNlZW4gYnkgdGhlIGRldmljZQo+IHdoaWNoIGVuZHMgdXAgc29tZXdoZXJlIGluIGlu
dGVycnVwdCBuaXJ2YW5hIHNwYWNlLgo+Cj4gU2VlIHRoZSBkYW5jZSBpbiBtc2lfc2V0X2FmZmlu
aXR5KCkgYW5kIGNvbW1pdCA2ZjFhNDg5MWE1OTIKPiAoIng4Ni9hcGljL21zaTogUGx1ZyBub24t
bWFza2FibGUgTVNJIGFmZmluaXR5IHJhY2UiKSBmb3IgZnVydGhlcgo+IGV4cGxhbmF0aW9uLgo+
Cj4gVGhlIHdheSBob3cgdGhlIElNU0lDIGRyaXZlciB3b3JrcyBzZWVtcyB0byBiZSBwcmV0dHkg
bXVjaCB0aGUgc2FtZSBhcwo+IHRoZSB4ODYgQVBJQyBtZXNzOgo+Cj4gICAgICAgICBAYWRkcmVz
cyBpcyB0aGUgcGh5c2ljYWwgYWRkcmVzcyBvZiB0aGUgcGVyIENQVSBNU0kgdGFyZ2V0Cj4gICAg
ICAgICBhZGRyZXNzIGFuZCBAZGF0YSBpcyB0aGUgdmVjdG9yIElEIG9uIHRoYXQgQ1BVLgo+Cj4g
U28gdGhlIG5vbi1hdG9taWMgdXBkYXRlIGluIGNhc2Ugb2Ygbm9uLW1hc2thYmxlIE1TSSBzdWZm
ZXJzIGZyb20gdGhlCj4gc2FtZSBwcm9ibGVtLiBJdCB3b3JrcyBtb3N0IG9mIHRoZSB0aW1lLCBi
dXQgaWYgaXQgZG9lc24ndCB5b3UgbWlnaHQKPiBzdGFyZSBhdCB0aGUgb2NjYXNpb25hbGx5IGxv
c3QgaW50ZXJydXB0IGFuZCB0aGUgc3RhbGUgZGV2aWNlIGluCj4gZGlzYmVsaWVmIGZvciBxdWl0
ZSBhIHdoaWxlIDopCgpZZXMsIHdlIGhhdmUgdGhlIHNhbWUgY2hhbGxlbmdlcyBhcyB4ODYgQVBJ
QyB3aGVuIGNoYW5naW5nCk1TSSBhZmZpbml0eS4KCj4KPiBJIG1pZ2h0IGJlIG1pc3Npbmcgc29t
ZXRoaW5nIHdoaWNoIG1hZ2ljYWxseSBwcmV2ZW50IHRoYXQgdGhvdWdoIDopCj4KCllvdXIgdW5k
ZXJzdGFuZGluZyBpcyBjb3JyZWN0LiBJbiBmYWN0LCB0aGUgSU1TSUMgbXNpX3NldF9hZmZpbml0
eSgpCmhhbmRsaW5nIGlzIGluc3BpcmVkIGZyb20geDg2IEFQSUMgYXBwcm9hY2ggZHVlIHRvIHNp
bWlsYXJpdHkgaW4KdGhlIG92ZXJhbGwgTVNJIGNvbnRyb2xsZXIuCgpUaGUgaGlnaC1sZXZlbCBp
ZGVhIG9mIGltc2ljX2lycV9zZXRfYWZmaW5pdHkoKSBpcyBhcyBmb2xsb3dzOgoKMSkgQWxsb2Nh
dGUgbmV3X3ZlY3RvciAobmV3IENQVSBJTVNJQyBhZGRyZXNzICsgbmV3IElEIG9uIHRoYXQgQ1BV
KQoKMikgVXBkYXRlIHRoZSBNU0kgYWRkcmVzcyBhbmQgZGF0YSBwcm9ncmFtbWVkIGluIHRoZSBk
ZXZpY2UKYmFzZWQgb24gbmV3X3ZlY3RvciAoc2VlIGltc2ljX21zaV91cGRhdGVfbXNnKCkpCgoz
KSBBdCB0aGlzIHBvaW50IHRoZSBkZXZpY2UgcG9pbnRzIHRvIHRoZSBuZXdfdmVjdG9yIGJ1dCBv
bGRfdmVjdG9yCihvbGQgQ1BVIElNU0lDIGFkZHJlc3MgKyBvbGQgSUQgb24gdGhhdCBDUFUpIGlz
IHN0aWxsIGVuYWJsZWQgYW5kCndlIG1pZ2h0IGhhdmUgcmVjZWl2ZWQgTVNJIG9uIG9sZF92ZWN0
b3Igd2hpbGUgd2Ugd2VyZSBidXN5CnNldHRpbmcgdXAgYSBuZXdfdmVjdG9yIGZvciB0aGUgZGV2
aWNlLiBUbyBhZGRyZXNzIHRoaXMsIHdlIGNhbGwKaW1zaWNfdmVjdG9yX21vdmUoKS4KCjQpIFRo
ZSBpbXNpY192ZWN0b3JfbW92ZSgpIG1hcmtzIHRoZSBvbGRfdmVjdG9yIGFzIGJlaW5nCm1vdmVk
IGFuZCBzY2hlZHVsZXMgYSBsYXp5IHRpbWVyIG9uIHRoZSBvbGQgQ1BVLgoKNSkgVGhlIGxhenkg
dGltZXIgZXhwaXJlcyBvbiB0aGUgb2xkIENQVSBhbmQgcmVzdWx0cyBpbgpfX2ltc2ljX2xvY2Fs
X3N5bmMoKSBiZWluZyBjYWxsZWQgb24gdGhlIG9sZCBDUFUuCgo2KSBJZiB0aGVyZSB3YXMgYSBw
ZW5kaW5nIE1TSSBvbiB0aGUgb2xkIHZlY3RvciB0aGVuIHRoZQpfX2ltc2ljX2xvY2FsX3N5bmMo
KSBmdW5jdGlvbiBpbmplY3RzIGFuIE1TSSB0byB0aGUKbmV3X3ZlY3RvciB1c2luZyBhbiBNTUlP
IHdyaXRlLgoKSXQgaXMgdmVyeSB1bmxpa2VseSB0aGF0IGFuIE1TSSBmcm9tIGRldmljZSB3aWxs
IGJlIGRyb3BwZWQKKHVubGVzcyBJIGFtIG1pc3Npbmcgc29tZXRoaW5nKSBidXQgdGhlIHVuc29s
dmVkIGlzc3VlCmlzIHRoYXQgaGFuZGxpbmcgb2YgaW4tZmxpZ2h0IE1TSSByZWNlaXZlZCBvbiB0
aGUgb2xkX3ZlY3RvcgpkdXJpbmcgdGhlIE1TSSByZS1wcm9ncmFtbWluZyBpcyBkZWxheWVkIHdo
aWNoIG1heSBoYXZlCnNpZGUgZWZmZWN0cyBvbiB0aGUgZGV2aWNlIGRyaXZlciBzaWRlLgoKSSBi
ZWxpZXZlIGluIHRoZSBmdXR1cmUgUklTQy1WIEFJQSB2Mi4wICh3aGVuZXZlciB0aGF0CmhhcHBl
bnMpIHdpbGwgYWRkcmVzcyB0aGUgZ2FwcyBpbiBBSUEgdjEuMCAobGlrZSB0aGlzIG9uZSkuCgpS
ZWdhcmRzLApBbnVwCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2t2bS1yaXNjdgo=
