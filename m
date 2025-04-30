Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E684BC3ABA9
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 11:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4hwjjbmeN2rxfg2A14cwwQjcaFhgRSDNxWSYug+5j4w=; b=wYI+0vCx0wT0eJ
	qXcG7AsIUK+Mu1YXYyC/ZuI8PUHXXK1NuoTs/O89XQFBJPg2FNnvxn0v6IOoNYpnjOZRcFjTmQsEA
	vbu5LqeWRJvJJBKRwpslfc6XEnazZNUg+nF+Lp9sJHyxr6DlWH2os3oi1+hwjhpY6mS0MzwNMQFxJ
	BeKLPSJ9BzTRzomC1sFbuIKj/bg66u6zyR5C8UEV2ZTpm94miv6KUDd6EYaS129fRWv9A2km2qg/T
	Ip09oxkNgsls2Aou/30b/SeRGVV81A5PJWgERvJ9V8eLa24JulghueHIM/Y3XRCnf6r3JNBbeNqQO
	/FOktXO/6+szWKScFw1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA60S-0000000CjsW-1uEK;
	Wed, 30 Apr 2025 11:53:40 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4VJ-0000000CVBm-34mP
	for kvm-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 10:17:27 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-85df99da233so783970739f.3
        for <kvm-riscv@lists.infradead.org>; Wed, 30 Apr 2025 03:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1746008244; x=1746613044; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hajr35wXoEFgGrgtJMs5DcJw47JrmZH1jIC06j4iHhQ=;
        b=W1QglAKF/4mZ/KwumlYYKBfNIDvJzSpfnCdHQvHhgfgR2BGzuA6pjp8ktNIDmR8w1z
         6UrUB5BXMMnC0umPVx19HC3MqmB3lJIbSLpGcc+pLCAzMvdsv9FDR+yaSDOHN+uAjZZi
         hL8Gxn7TjmtYUK6tN5rkOdpn1y5kADCxJJ5ffU7NaMNmHu14UatraJXXiy3l1yYBZKpe
         pdKP3Vo20H7SDmZieF29yCj43KkXZR6n2znQb5+brhzyn+sJf/bo6rXdcfZ11p4uA80Q
         bnDTtNuzGGo9zSrfn2JWqBQqLMgs282AmdnYJCps3k8ah9rmcyVoHu8Bz2mCG8oUoOuc
         O4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746008244; x=1746613044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hajr35wXoEFgGrgtJMs5DcJw47JrmZH1jIC06j4iHhQ=;
        b=Z7M1BiJ+8MwyHqrV+qs0YmBT21gAHM3y/56ei7mfuzy9Wjsga4/VZRc8t5CB35VW43
         gh7PlXdLBiD/sS2/f7JueXbUuVtlplIKx64S0m3OvCXZxL+Lsg41LjQrHCece6or7JrS
         k+3XLTJuuSNdCG5zL6Kg7IPKg2iAqCJtBNmJ68lVGFT+PVw1Q8NmTaLLQ0X2734SRtyd
         NsJVu40pyLNaCBO4WjTYSq/9IJNhsdTMZY1A4fOhNOW8Kq9rNALNNqpD+KJ2TORx9WmU
         PboIPDWYSw7NEnP4aXg2VBivx18UXclVEGvibKoRsPwS651afa1TaeS2BSfAWFRItcz2
         h02w==
X-Forwarded-Encrypted: i=1; AJvYcCVNo+e2zlVUzQ0SmClkEUHsocEcsAk08OP/pvsHTuClBATtkbDooRqsTRqWx1IVIk/CPpjBjp6Dsno=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq2RtC2bbQB1Wsf2xnRfV7TLdAdo+Vf5XhnqmnFE8SCysrioND
	atH5V5xoRU6/5x7sNhQ0qsCwnB8KF08ka57uyG03rbKMY5peAx+FrT/6xoLuXb5o3DfPadAjT0S
	q9kOH0iL0ooROL1xv3ZF/r9/hNJL6YupcbOQG7Q==
X-Gm-Gg: ASbGncuuitBLzW+HR2YxuALJe0Fp3zU28rSq+Q/Fa4kUY9Hs8SJAr1k4prkfpu5OHeU
	fJuPnTrnHQxd7dxQqVXjskdji5gze5BoyDcgRHQN29GxSLdaqRr2endqPxwnXl6rQia3Wl5LOnq
	/miFdyFbA1qwtkdyycNKx1L1c=
X-Google-Smtp-Source: AGHT+IGfWKyj+8R/G3n3W48fayDFA5SRi91kVSTDvys0efjshDa91rFnxHxj6m5gFXeVWQDRSR/ZJT9BcvR1UL47KAQ=
X-Received: by 2002:a05:6e02:2707:b0:3d8:1768:242f with SMTP id
 e9e14a558f8ab-3d967fa3de9mr20815675ab.2.1746008244393; Wed, 30 Apr 2025
 03:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-7-rkrcmar@ventanamicro.com> <CAAhSdy0e3HVN6pX-hcX2N+kpwsupsCf6BqrYq=bvtwtFOuEVhA@mail.gmail.com>
 <D9IGJR9DGFAM.1PVHVOOTVRFZW@ventanamicro.com> <CAK9=C2Woc5MtrJeqNtaVkMXWEsGeZPsmUgtFQET=OKLHLwRbPA@mail.gmail.com>
 <D9J1TBKYC8YH.1OPUI289U0O2C@ventanamicro.com> <CAAhSdy01yBBfJwdTn90WeXFR85=1zTxuebFhi4CQJuOujVTHXg@mail.gmail.com>
 <D9J9DW53Q2GD.1PB647ISOCXRX@ventanamicro.com> <CAAhSdy0B-pF-jHmTXNYE7NXwdCWJepDtGR__S+P4MhZ1bfUERQ@mail.gmail.com>
 <CAAhSdy20pq3KvbCeST=h+O5PWfs2E4uXpX9BbbzE7GJzn+pzkA@mail.gmail.com> <D9JTZ6HH00KY.1B1SKH1Z0UI1S@ventanamicro.com>
In-Reply-To: <D9JTZ6HH00KY.1B1SKH1Z0UI1S@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 30 Apr 2025 15:47:13 +0530
X-Gm-Features: ATxdqUF_q2ij9AhnCkW-YqEHHIjuO1czpMVKF6K9iOnegwjVM1IJPR_3stGj_7I
Message-ID: <CAAhSdy0TfpWQ-kC_gUUCU0oC5dR45A1v9q84H2Tj9A8kdO0d1A@mail.gmail.com>
Subject: Re: [PATCH 4/5] KVM: RISC-V: reset VCPU state when becoming runnable
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Anup Patel <apatel@ventanamicro.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Mayuresh Chitale <mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_031725_893349_36CCEC1A 
X-CRM114-Status: GOOD (  45.86  )
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

T24gV2VkLCBBcHIgMzAsIDIwMjUgYXQgMTo1OeKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IDIwMjUtMDQtMzBUMTA6NTY6MzUrMDU6MzAs
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Ogo+ID4gT24gV2VkLCBBcHIgMzAsIDIw
MjUgYXQgOTo1MuKAr0FNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+
ID4+Cj4gPj4gT24gVHVlLCBBcHIgMjksIDIwMjUgYXQgOTo1MeKAr1BNIFJhZGltIEtyxI1tw6HF
mSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+PiA+Cj4gPj4gPiAyMDI1LTA0
LTI5VDIwOjMxOjE4KzA1OjMwLCBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPjoKPiA+
PiA+ID4gT24gVHVlLCBBcHIgMjksIDIwMjUgYXQgMzo1NeKAr1BNIFJhZGltIEtyxI1tw6HFmSA8
cmtyY21hckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+PiA+ID4+Cj4gPj4gPiA+PiAyMDI1
LTA0LTI5VDExOjI1OjM1KzA1OjMwLCBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNv
bT46Cj4gPj4gPiA+PiA+IE9uIE1vbiwgQXByIDI4LCAyMDI1IGF0IDExOjE14oCvUE0gUmFkaW0g
S3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4+ID4gPj4gPj4K
PiA+PiA+ID4+ID4+IDIwMjUtMDQtMjhUMTc6NTI6MjUrMDU6MzAsIEFudXAgUGF0ZWwgPGFudXBA
YnJhaW5mYXVsdC5vcmc+Ogo+ID4+ID4gPj4gPj4gPiBPbiBUaHUsIEFwciAzLCAyMDI1IGF0IDU6
MDLigK9QTSBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6
Cj4gPj4gPiA+PiA+PiA+PiBGb3IgYSBjbGVhbmVyIHNvbHV0aW9uLCB3ZSBzaG91bGQgYWRkIGlu
dGVyZmFjZXMgdG8gcGVyZm9ybSB0aGUgS1ZNLVNCSQo+ID4+ID4gPj4gPj4gPj4gcmVzZXQgcmVx
dWVzdCBvbiB1c2Vyc3BhY2UgZGVtYW5kLiAgSSB0aGluayBpdCB3b3VsZCBhbHNvIGJlIG11Y2gg
YmV0dGVyCj4gPj4gPiA+PiA+PiA+PiBpZiB1c2Vyc3BhY2Ugd2FzIGluIGNvbnRyb2wgb2YgdGhl
IHBvc3QtcmVzZXQgc3RhdGUuCj4gPj4gPiA+PiA+PiA+Cj4gPj4gPiA+PiA+PiA+IEFwYXJ0IGZy
b20gYnJlYWtpbmcgS1ZNIHVzZXItc3BhY2UsIHRoaXMgcGF0Y2ggaXMgaW5jb3JyZWN0IGFuZAo+
ID4+ID4gPj4gPj4gPiBkb2VzIG5vdCBhbGlnbiB3aXRoIHRoZToKPiA+PiA+ID4+ID4+ID4gMSkg
U0JJIHNwZWMKPiA+PiA+ID4+ID4+ID4gMikgT1MgYm9vdCBwcm90b2NvbC4KPiA+PiA+ID4+ID4+
ID4KPiA+PiA+ID4+ID4+ID4gVGhlIFNCSSBzcGVjIG9ubHkgZGVmaW5lcyB0aGUgZW50cnkgc3Rh
dGUgb2YgY2VydGFpbiBDUFUgcmVnaXN0ZXJzCj4gPj4gPiA+PiA+PiA+IChuYW1lbHksIFBDLCBB
MCwgYW5kIEExKSB3aGVuIENQVSBlbnRlcnMgUy1tb2RlOgo+ID4+ID4gPj4gPj4gPiAxKSBVcG9u
IFNCSSBIU00gc3RhcnQgY2FsbCBmcm9tIHNvbWUgb3RoZXIgQ1BVCj4gPj4gPiA+PiA+PiA+IDIp
IFVwb24gcmVzdW1pbmcgZnJvbSBub24tcmV0ZW50aXZlIFNCSSBIU00gc3VzcGVuZCBvcgo+ID4+
ID4gPj4gPj4gPiAgICAgU0JJIHN5c3RlbSBzdXNwZW5kCj4gPj4gPiA+PiA+PiA+Cj4gPj4gPiA+
PiA+PiA+IFRoZSBTLW1vZGUgZW50cnkgc3RhdGUgb2YgdGhlIGJvb3QgQ1BVIGlzIGRlZmluZWQg
YnkgdGhlCj4gPj4gPiA+PiA+PiA+IE9TIGJvb3QgcHJvdG9jb2wgYW5kIG5vdCBieSB0aGUgU0JJ
IHNwZWMuIER1ZSB0byB0aGlzLCByZWFzb24KPiA+PiA+ID4+ID4+ID4gS1ZNIFJJU0MtViBleHBl
Y3RzIHVzZXItc3BhY2UgdG8gc2V0IHVwIHRoZSBTLW1vZGUgZW50cnkKPiA+PiA+ID4+ID4+ID4g
c3RhdGUgb2YgdGhlIGJvb3QgQ1BVIHVwb24gc3lzdGVtIHJlc2V0Lgo+ID4+ID4gPj4gPj4KPiA+
PiA+ID4+ID4+IFdlIGNhbiBoYW5kbGUgdGhlIGluaXRpYWwgc3RhdGUgY29uc2lzdGVuY3kgaW4g
b3RoZXIgcGF0Y2hlcy4KPiA+PiA+ID4+ID4+IFdoYXQgbmVlZHMgYWRkcmVzc2luZyBpcyBhIHdh
eSB0byB0cmlnZ2VyIHRoZSBLVk0gcmVzZXQgZnJvbSB1c2Vyc3BhY2UsCj4gPj4gPiA+PiA+PiBl
dmVuIGlmIG9ubHkgdG8gY2xlYXIgdGhlIGludGVybmFsIEtWTSBzdGF0ZS4KPiA+PiA+ID4+ID4+
Cj4gPj4gPiA+PiA+PiBJIHRoaW5rIG1wX3N0YXRlIGlzIGN1cnJlbnRseSB0aGUgYmVzdCBzaWdu
YWxpemF0aW9uIHRoYXQgS1ZNIHNob3VsZAo+ID4+ID4gPj4gPj4gcmVzZXQsIHNvIEkgYWRkZWQg
aXQgdGhlcmUuCj4gPj4gPiA+PiA+Pgo+ID4+ID4gPj4gPj4gV2hhdCB3b3VsZCBiZSB5b3VyIHBy
ZWZlcnJlZCBpbnRlcmZhY2UgZm9yIHRoYXQ/Cj4gPj4gPiA+PiA+Pgo+ID4+ID4gPj4gPgo+ID4+
ID4gPj4gPiBJbnN0ZWFkIG9mIGNyZWF0aW5nIGEgbmV3IGludGVyZmFjZSwgSSB3b3VsZCBwcmVm
ZXIgdGhhdCBWQ1BVCj4gPj4gPiA+PiA+IHdoaWNoIGluaXRpYXRlcyBTQkkgU3lzdGVtIFJlc2V0
IHNob3VsZCBiZSByZXNldHRlZCBpbW1lZGlhdGVseQo+ID4+ID4gPj4gPiBpbi1rZXJuZWwgc3Bh
Y2UgYmVmb3JlIGZvcndhcmRpbmcgdGhlIHN5c3RlbSByZXNldCByZXF1ZXN0IHRvCj4gPj4gPiA+
PiA+IHVzZXIgc3BhY2UuCj4gPj4gPiA+Pgo+ID4+ID4gPj4gVGhlIGluaXRpYXRpbmcgVkNQVSBt
aWdodCBub3QgYmUgdGhlIGJvb3QgVkNQVS4KPiA+PiA+ID4+IEl0IHdvdWxkIGJlIHNhZmVyIHRv
IHJlc2V0IGFsbCBvZiB0aGVtLgo+ID4+ID4gPgo+ID4+ID4gPiBJIG1lYW50IGluaXRpYXRpbmcg
VkNQVSBhbmQgbm90IHRoZSBib290IFZDUFUuIEN1cnJlbnRseSwgdGhlCj4gPj4gPiA+IG5vbi1p
bml0aWF0aW5nIFZDUFVzIGFyZSBhbHJlYWR5IHJlc2V0dGVkIGJ5IFZDUFUgcmVxdWVzdHMKPiA+
PiA+ID4gc28gbm90aGluZyBzcGVjaWFsIG5lZWRzIHRvIGJlIGRvbmUuCj4gPj4KPiA+PiBUaGVy
ZSBpcyBubyBkZXNpZ25hdGVkIGJvb3QgVkNQVSBmb3IgS1ZNIHNvIGxldCB1cyBvbmx5IHVzZSB0
aGUKPiA+PiB0ZXJtICJpbml0aWF0aW5nIiBvciAibm9uLWluaXRpYXRpbmciIFZDUFVzIGluIGNv
bnRleHQgb2Ygc3lzdGVtIHJlc2V0Lgo+Cj4gVGhhdCBpcyBleGFjdGx5IGhvdyBJIHVzZSBpdC4g
IFNvbWUgVkNQVSB3aWxsIGJlIHRoZSBib290IFZDUFUgKHRoZSBWQ1BVCj4gbWFkZSBydW5uYWJs
ZSBieSBLVk1fU0VUX01QX1NUQVRFKSBhbmQgbG9hZGVkIHdpdGggc3RhdGUgZnJvbSB1c2Vyc3Bh
Y2UuCj4KPiBSSVNDLVYgZG9lc24ndCBndWFyYW50ZWUgdGhhdCB0aGUgYm9vdCBWQ1BVIGlzIHRo
ZSByZXNldCBpbml0aWF0aW5nCj4gVkNQVSwgc28gSSB0aGluayBLVk0gc2hvdWxkIGFsbG93IGl0
LgoKV2UgZG8gYWxsb3cgYW55IFZDUFUgdG8gYmUgdGhlIGJvb3QgVkNQVS4gSSBhbSBub3Qgc3Vy
ZSB3aHkgeW91CnRoaW5rIG90aGVyd2lzZS4KCj4KPiA+PiA+IEN1cnJlbnRseSwgd2UgbWFrZSB0
aGUgcmVxdWVzdCBvbmx5IGZvciBWQ1BVcyBicm91Z2h0IHVwIGJ5IEhTTSAtLSB0aGUKPiA+PiA+
IG5vbi1ib290IFZDUFVzLiAgVGhlcmUgaXMgYSBzaW5nbGUgVkNQVSBub3QgYmVpbmcgcmVzZXQg
YW5kIHJlc2V0dGluZwo+ID4+ID4gdGhlIHJlc2V0IGluaXRpYXRpbmcgVkNQVSBjaGFuZ2VzIG5v
dGhpbmcuIGUuZy4KPiA+PiA+Cj4gPj4gPiAgIDEpIFZDUFUgMSBpbml0aWF0ZXMgdGhlIHJlc2V0
IHRocm91Z2ggYW4gZWNhbGwuCj4gPj4gPiAgIDIpIEFsbCBWQ1BVcyBhcmUgc3RvcHBlZCBhbmQg
cmV0dXJuIHRvIHVzZXJzcGFjZS4KPiA+Pgo+ID4+IFdoZW4gYWxsIFZDUFVzIGFyZSBzdG9wcGVk
LCBhbGwgVkNQVXMgZXhjZXB0IFZDUFUxCj4gPj4gKGluIHRoaXMgZXhhbXBsZSkgd2lsbCBTTEVF
UCBiZWNhdXNlIHdlIGRvCj4gPj4gImt2bV9tYWtlX2FsbF9jcHVzX3JlcXVlc3QodmNwdS0+a3Zt
LCBLVk1fUkVRX1NMRUVQKSIKPiA+PiBzbyBub25lIG9mIHRoZSBWQ1BVcyBleGNlcHQgVkNQVTEg
KGluIHRoaXMgY2FzZSkgd2lsbAo+ID4+IHJldHVybiB0byB1c2Vyc3BhY2UuCj4KPiBVc2Vyc3Bh
Y2Ugc2hvdWxkIGJlIGFibGUgdG8gZG8gd2hhdGV2ZXIgaXQgbGlrZXMgLS0gaW4gbXkgZXhhbXBs
ZSwgYWxsCj4gdGhlIFZDUFVzIGFyZSBicm91Z2h0IHRvIHVzZXJzcGFjZSBhbmQgYSBkaWZmZXJl
bnQgYm9vdCBWQ1BVIGlzCj4gc2VsZWN0ZWQuCgpJbiB5b3VyIGV4YW1wbGUsIHRoZSBWQ1BVMSAo
aW5pdGlhdGluZyBWQ1BVKSBuZWVkIG5vdCBiZSB0aGUKYm9vdCBWQ1BVIGFmdGVyIHN5c3RlbSBy
ZXNldC4gVGhlIHVzZXIgc3BhY2UgY2FuIHNldHVwIHNvbWUKb3RoZXIgVkNQVSBhcyBib290IFZD
UFUgKGJ5IHNldHRpbmcgaXRzIE1QU1RBVEUsIFBDLCBBMCwKYW5kIEExKSBhbmQgc2ltcGx5IGRv
IGlvY3RsX3J1bigpIGZvciB0aGUgaW5pdGlhdGluZyBWQ1BVIHdpdGhvdXQKY2hhbmdpbmcgaXRz
IE1QU1RBVEUuCgo+Cj4gKFBlcmhhcHMgdXNlcnNwYWNlIHdhbnRlZCB0byByZWNvcmQgdGhlaXIg
cmVzZXQgcHJlLXJlc2V0IHN0YXRlLCBvcgo+ICBtYXliZSBpdCByZWFsbHkgd2FudHMgdG8gYm9v
dCB3aXRoIGEgZGVzaWduYXRlZCBWQ1BVLikKPgo+ID4+ID4gICAzKSBVc2Vyc3BhY2UgcHJlcGFy
ZXMgVkNQVSAwIGFzIHRoZSBib290IFZDUFUuCj4gPj4gPiAgIDQpIFZDUFUgMCBleGVjdXRlcyB3
aXRob3V0IGdvaW5nIHRocm91Z2ggS1ZNIHJlc2V0IHBhdGhzLgo+ID4+Cj4gPj4gVXNlcnNwYWNl
IHdpbGwgc2VlIGEgc3lzdGVtIHJlc2V0IGV2ZW50IGV4aXQgZm9yIHRoZQo+ID4+IGluaXRpYXRp
bmcgVkNQVSBieSB0aGF0IHRpbWUgYWxsIG90aGVyIFZDUFVzIGFyZSBhbHJlYWR5Cj4gPj4gc2xl
ZXBpbmcgd2l0aCBtcF9zdGF0ZSA9PSBLVk1fTVBfU1RBVEVfU1RPUFBFRC4KPiA+Pgo+ID4+ID4K
PiA+PiA+IFRoZSBwb2ludCBvZiB0aGlzIHBhdGNoIGlzIHRvIHJlc2V0IHRoZSBib290IFZDUFUs
IHNvIHdlIHJlc2V0IHRoZSBWQ1BVCj4gPj4gPiB0aGF0IGlzIG1hZGUgcnVubmFibGUgYnkgdGhl
IEtWTV9TRVRfTVBfU1RBVEUgSU9DVEwuCj4gPj4KPiA+PiBMaWtlIEkgc2FpZCBiZWZvcmUsIHdl
IGRvbid0IG5lZWQgdG8gZG8gdGhpcy4gVGhlIGluaXRpYXRpbmcgVkNQVQo+ID4+IGNhbiBiZSBy
ZXNldHRlZCBqdXN0IGJlZm9yZSBleGl0aW5nIHRvIHVzZXIgc3BhY2UgZm9yIHN5c3RlbSByZXNl
dAo+ID4+IGV2ZW50IGV4aXQuCj4KPiBZb3UgYXNzdW1lIGluaXRpYXRpbmcgVkNQVSA9PSBib290
IFZDUFUuCj4KPiBXZSBzaG91bGQgcHJldmVudCBLVk1fU0VUX01QX1NUQVRFIElPQ1RMIGZvciBh
bGwgbm9uLWluaXRpYXRpbmcgVkNQVXMgaWYKPiB3ZSBkZWNpZGUgdG8gYWNjZXB0IHRoZSBhc3N1
bXB0aW9uLgoKVGhlcmUgaXMgbm8gc3VjaCBhc3N1bXB0aW9uLgoKPgo+IEknZCByYXRoZXIgY2hv
b3NlIGEgZGlmZmVyZW50IGRlc2lnbiwgdGhvdWdoLgo+Cj4gSG93IGFib3V0IGEgbmV3IHVzZXJz
cGFjZSBpbnRlcmZhY2UgZm9yIElPQ1RMIHJlc2V0Pwo+IChDYW4gYmUgY2FwYWJpbGl0eSB0b2dn
bGUgZm9yIEtWTV9TRVRfTVBfU1RBVEUgb3IgYSBzdHJhaWdodCBuZXcgSU9DVEwuKQo+Cj4gVGhh
dCB3b3VsZG4ndCAiZml4IiBjdXJyZW50IHVzZXJzcGFjZXMsIGJ1dCB3b3VsZCBzaWduaWZpY2Fu
dGx5IGltcHJvdmUKPiB0aGUgc2FuaXR5IG9mIHRoZSBLVk0gaW50ZXJmYWNlLgoKSSBiZWxpZXZl
IHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIG5lZWRzIGEgZmV3IGltcHJvdmVtZW50cwp0aGF0
J3MgYWxsLiBXZSBjZXJ0YWlubHkgZG9uJ3QgbmVlZCB0byBpbnRyb2R1Y2UgYW55IG5ldyBJT0NU
TC4KCkFsc28sIGtlZXAgaW4gbWluZCB0aGF0IHNvIGZhciB3ZSBoYXZlIGF2b2lkZWQgYW55IFJJ
U0MtVgpzcGVjaWZpYyBLVk0gSU9DVExzIGFuZCB3ZSBzaG91bGQgdHJ5IHRvIGtlZXAgaXQgdGhh
dCB3YXkKYXMgbG9uZyBhcyB3ZSBjYW4uCgpSZWdhcmRzLApBbnVwCgotLSAKa3ZtLXJpc2N2IG1h
aWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
