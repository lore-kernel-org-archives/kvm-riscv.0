Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32143C369DC
	for <kvm-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 15:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4SIS2XgOISXXU6g/PPvh/x6Shzl03AxhYiuL9OqgOcA=; b=JI5dbLNfL5rrvs
	6a+apl0s5N4f3jFu53NrxJ4TrewJLD60SrG0Q27vDzIBM0LKh3AddH1piuaz9FdQ6YVazTsKwUsWu
	kFCC5wu0J04QYqJS4aIas3rsTuoa2aE2/2Magw1lYz78HnIcTxVNZw5yMR7oncvqjClSzGYqfX123
	kSLQ52ebJHO3GB4fhvU/eppeH4W6XfTn6OOgWwGH6N2PZ6zYwLoavKShw3F01nUqlBDhS0Ic2PWqt
	vjiTG2sWALKxTfq8C9CEWNNdz4fyy47Z0QlfXs4k9yQzF40wGWN4ioAcvsf51jLCzOzUK55PSDWaV
	VDzHV1Gd/gtgvLOmRPmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mpK-0000000A75z-2pSO;
	Tue, 29 Apr 2025 15:24:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mSn-0000000A31S-1VRy
	for kvm-riscv@bombadil.infradead.org;
	Tue, 29 Apr 2025 15:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jHS4l6RlCuYVQuHb0jm+ZP/YKZBOyNxDq6lKlO8yTMI=; b=ndYxQo/JON0CdBaxCo/1y/PyI8
	ONQeEMq8JmmMlBt2xj6mVRTxOGJEfHyZkYi3hVw2iYnQBl2rD2rsZvfzljS612gvOmi83HSw0XNfZ
	7/EOSbiV3nmuv8ThZ5t50NPWDxR/Q8KwES8MMwbLPDzGxCmyATpUfmLEeJD6Zbp1EluG9mtBSTO74
	FJZo3uspoPZsH+z3iIEw4TeQ5eQj/oAI6HVLGr0HvmUGce350JxKG1Yg5cHw1ybHPYcrGga7MwpN1
	ioQ6R1hvBjr9zZdELM47Jt8O+/UiXtc+q6s91KSUXpYsK5qZ/aGrr7s86GJhFY8ToOhWFt8xvkhjt
	mpf1sg2w==;
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9mSk-0000000DQHc-0NkZ
	for kvm-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 15:01:36 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3d9030c2b73so12910355ab.0
        for <kvm-riscv@lists.infradead.org>; Tue, 29 Apr 2025 08:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745938890; x=1746543690; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHS4l6RlCuYVQuHb0jm+ZP/YKZBOyNxDq6lKlO8yTMI=;
        b=w3QFvRYLCz9Y8ZbRJeNyiLENRFfXebcomelNRKjIBdm/TB30XWVuQdJNOOgybTooKj
         9ZwVAblRWnqlbCa1zbDfwoC58KTSPuYG7Q805HEI4KQgkj9Ecfq0r7HyU+g52wgsUFyI
         Fw8B8wXBlp5vh6UMxzPiuOyAaXKz8cQl412Sq2Y6A3h93J7UhyNMnMKq/p1eiaJlw0vz
         pHk0ggNbi94u8iejlYoYjnn87Tv6zVWf/5Fb0RCNBNrU77ZU3vLOsI4v74BPN1QXabTp
         c8Bm+dF0WYck5N89m80FRINiX/YS54yzdFdP8mqm5jau3WJ79Je7ywxJ4fAtiMAAxDo5
         12kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745938890; x=1746543690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jHS4l6RlCuYVQuHb0jm+ZP/YKZBOyNxDq6lKlO8yTMI=;
        b=CUQ6eK/ANlsnf5PSkhhnLX14z3310cv/V5IjIe5ekUjPNlgNSrPS8hN3Oj63vg2Bp5
         c7mfo6hVB/L1rZ3qmVqntkJ7qUZunYTH6wZ6UNXbewcMrNVvj4xyP3nUG8Y8vvEhpuIF
         3w/b4FUxTNfdMVktMZBt8JNeFMa1twooU8CQafsXAqSMuwsRMQPHlRn1kHpo4RSJumfc
         531GKLQocKHOK259BUn7kiX9RN01wRqCOMlzPoPA0RUzagQSIMxZCTaDB5w3oPuqjzA8
         O+oQVtrOgCZbHzKZc91rxOWjorULCqlXm0+HMsa8pYk12pbF1/mzlvHlLKCcik6S/T9N
         z1uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrzPanfaLo4HrqZ2yhs1J+ZalAnvfy0gvrEoM0cvX+8D9OfBtcSnwqDf2u28PPZ1t7kKDtAzJjHjc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxX18Vc/hPgMkUYqfJXZiz9fJ3kTWoEABlMlOi+Qq307SpHIqbP
	zja4yWRWoIvyXq/P71l13c0rwoXCKVhb/eRuGH9qrEyxU3dnh2SDjPCNjdZ5dTOV7QfNk8KH3ye
	d61eduxuodudog6CIkQ4u+Bbyfel3AY8Roqs9yw==
X-Gm-Gg: ASbGncvl1ysAa79XMu6HUZN2l4Wd10uvXV8MaW9nc9vyLDlWg9dJjsEcVPyCPSrkiKI
	taYuSCd6U/jZMveYZALM33XBqfDOdZaqigvmDvl4xcp91RfUOT7AEvoX9bfqX2BKAAEBbNHXNy4
	5vUBgr/0rQYlOjOLKQV7H1CxYCWpykr8AiTw==
X-Google-Smtp-Source: AGHT+IHo2DZ3uMBqZ8yg3qd4VMFlyLDgboisK6S9lgCMm7JZ5BVsaB07IAemCjbCQKxGLUvsVPdmwklxacR8zt864hQ=
X-Received: by 2002:a05:6e02:3a0d:b0:3d6:d162:be02 with SMTP id
 e9e14a558f8ab-3d95d311a8cmr40608305ab.21.1745938890305; Tue, 29 Apr 2025
 08:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-7-rkrcmar@ventanamicro.com> <CAAhSdy0e3HVN6pX-hcX2N+kpwsupsCf6BqrYq=bvtwtFOuEVhA@mail.gmail.com>
 <D9IGJR9DGFAM.1PVHVOOTVRFZW@ventanamicro.com> <CAK9=C2Woc5MtrJeqNtaVkMXWEsGeZPsmUgtFQET=OKLHLwRbPA@mail.gmail.com>
 <D9J1TBKYC8YH.1OPUI289U0O2C@ventanamicro.com>
In-Reply-To: <D9J1TBKYC8YH.1OPUI289U0O2C@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 29 Apr 2025 20:31:18 +0530
X-Gm-Features: ATxdqUHbWefMOrW2Do9QiC5PVMhlBHVdqKQcPmZPNhp77_UlZJlXnw3QOAdLvxI
Message-ID: <CAAhSdy01yBBfJwdTn90WeXFR85=1zTxuebFhi4CQJuOujVTHXg@mail.gmail.com>
Subject: Re: [PATCH 4/5] KVM: RISC-V: reset VCPU state when becoming runnable
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Anup Patel <apatel@ventanamicro.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Mayuresh Chitale <mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_160134_333561_4534344C 
X-CRM114-Status: GOOD (  31.17  )
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

T24gVHVlLCBBcHIgMjksIDIwMjUgYXQgMzo1NeKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IDIwMjUtMDQtMjlUMTE6MjU6MzUrMDU6MzAs
IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPjoKPiA+IE9uIE1vbiwgQXByIDI4
LCAyMDI1IGF0IDExOjE14oCvUE0gUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNy
by5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gMjAyNS0wNC0yOFQxNzo1MjoyNSswNTozMCwgQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz46Cj4gPj4gPiBPbiBUaHUsIEFwciAzLCAyMDI1IGF0
IDU6MDLigK9QTSBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4gd3Jv
dGU6Cj4gPj4gPj4gRm9yIGEgY2xlYW5lciBzb2x1dGlvbiwgd2Ugc2hvdWxkIGFkZCBpbnRlcmZh
Y2VzIHRvIHBlcmZvcm0gdGhlIEtWTS1TQkkKPiA+PiA+PiByZXNldCByZXF1ZXN0IG9uIHVzZXJz
cGFjZSBkZW1hbmQuICBJIHRoaW5rIGl0IHdvdWxkIGFsc28gYmUgbXVjaCBiZXR0ZXIKPiA+PiA+
PiBpZiB1c2Vyc3BhY2Ugd2FzIGluIGNvbnRyb2wgb2YgdGhlIHBvc3QtcmVzZXQgc3RhdGUuCj4g
Pj4gPgo+ID4+ID4gQXBhcnQgZnJvbSBicmVha2luZyBLVk0gdXNlci1zcGFjZSwgdGhpcyBwYXRj
aCBpcyBpbmNvcnJlY3QgYW5kCj4gPj4gPiBkb2VzIG5vdCBhbGlnbiB3aXRoIHRoZToKPiA+PiA+
IDEpIFNCSSBzcGVjCj4gPj4gPiAyKSBPUyBib290IHByb3RvY29sLgo+ID4+ID4KPiA+PiA+IFRo
ZSBTQkkgc3BlYyBvbmx5IGRlZmluZXMgdGhlIGVudHJ5IHN0YXRlIG9mIGNlcnRhaW4gQ1BVIHJl
Z2lzdGVycwo+ID4+ID4gKG5hbWVseSwgUEMsIEEwLCBhbmQgQTEpIHdoZW4gQ1BVIGVudGVycyBT
LW1vZGU6Cj4gPj4gPiAxKSBVcG9uIFNCSSBIU00gc3RhcnQgY2FsbCBmcm9tIHNvbWUgb3RoZXIg
Q1BVCj4gPj4gPiAyKSBVcG9uIHJlc3VtaW5nIGZyb20gbm9uLXJldGVudGl2ZSBTQkkgSFNNIHN1
c3BlbmQgb3IKPiA+PiA+ICAgICBTQkkgc3lzdGVtIHN1c3BlbmQKPiA+PiA+Cj4gPj4gPiBUaGUg
Uy1tb2RlIGVudHJ5IHN0YXRlIG9mIHRoZSBib290IENQVSBpcyBkZWZpbmVkIGJ5IHRoZQo+ID4+
ID4gT1MgYm9vdCBwcm90b2NvbCBhbmQgbm90IGJ5IHRoZSBTQkkgc3BlYy4gRHVlIHRvIHRoaXMs
IHJlYXNvbgo+ID4+ID4gS1ZNIFJJU0MtViBleHBlY3RzIHVzZXItc3BhY2UgdG8gc2V0IHVwIHRo
ZSBTLW1vZGUgZW50cnkKPiA+PiA+IHN0YXRlIG9mIHRoZSBib290IENQVSB1cG9uIHN5c3RlbSBy
ZXNldC4KPiA+Pgo+ID4+IFdlIGNhbiBoYW5kbGUgdGhlIGluaXRpYWwgc3RhdGUgY29uc2lzdGVu
Y3kgaW4gb3RoZXIgcGF0Y2hlcy4KPiA+PiBXaGF0IG5lZWRzIGFkZHJlc3NpbmcgaXMgYSB3YXkg
dG8gdHJpZ2dlciB0aGUgS1ZNIHJlc2V0IGZyb20gdXNlcnNwYWNlLAo+ID4+IGV2ZW4gaWYgb25s
eSB0byBjbGVhciB0aGUgaW50ZXJuYWwgS1ZNIHN0YXRlLgo+ID4+Cj4gPj4gSSB0aGluayBtcF9z
dGF0ZSBpcyBjdXJyZW50bHkgdGhlIGJlc3Qgc2lnbmFsaXphdGlvbiB0aGF0IEtWTSBzaG91bGQK
PiA+PiByZXNldCwgc28gSSBhZGRlZCBpdCB0aGVyZS4KPiA+Pgo+ID4+IFdoYXQgd291bGQgYmUg
eW91ciBwcmVmZXJyZWQgaW50ZXJmYWNlIGZvciB0aGF0Pwo+ID4+Cj4gPgo+ID4gSW5zdGVhZCBv
ZiBjcmVhdGluZyBhIG5ldyBpbnRlcmZhY2UsIEkgd291bGQgcHJlZmVyIHRoYXQgVkNQVQo+ID4g
d2hpY2ggaW5pdGlhdGVzIFNCSSBTeXN0ZW0gUmVzZXQgc2hvdWxkIGJlIHJlc2V0dGVkIGltbWVk
aWF0ZWx5Cj4gPiBpbi1rZXJuZWwgc3BhY2UgYmVmb3JlIGZvcndhcmRpbmcgdGhlIHN5c3RlbSBy
ZXNldCByZXF1ZXN0IHRvCj4gPiB1c2VyIHNwYWNlLgo+Cj4gVGhlIGluaXRpYXRpbmcgVkNQVSBt
aWdodCBub3QgYmUgdGhlIGJvb3QgVkNQVS4KPiBJdCB3b3VsZCBiZSBzYWZlciB0byByZXNldCBh
bGwgb2YgdGhlbS4KCkkgbWVhbnQgaW5pdGlhdGluZyBWQ1BVIGFuZCBub3QgdGhlIGJvb3QgVkNQ
VS4gQ3VycmVudGx5LCB0aGUKbm9uLWluaXRpYXRpbmcgVkNQVXMgYXJlIGFscmVhZHkgcmVzZXR0
ZWQgYnkgVkNQVSByZXF1ZXN0cwpzbyBub3RoaW5nIHNwZWNpYWwgbmVlZHMgdG8gYmUgZG9uZS4K
Cj4KPiBZb3UgYWxzbyBwcmV2aW91c2x5IG1lbnRpb25lZCB0aGF0IHdlIG5lZWQgdG8gcHJlc2Vy
dmUgdGhlIHByZS1yZXNldAo+IHN0YXRlIGZvciB1c2Vyc3BhY2UsIHdoaWNoIEkgY29tcGxldGVs
eSBhZ3JlZSB3aXRoIGFuZCBpdCBpcyB3aHkgdGhlCj4gcmVzZXQgaGFwcGVucyBsYXRlci4KClll
cywgdGhhdCB3YXMgb25seSBmb3IgZGVidWcgcHVycG9zZXMgZnJvbSB1c2VyIHNwYWNlLiBBdCB0
aGUKbW9tZW50LCB0aGVyZSBpcyBubyBvbmUgdXNpbmcgdGhpcyBmb3IgZGVidWcgcHVycG9zZXMg
c28gd2UKY2FuIHNhY3JpZmljZSB0aGF0LgoKPgo+ID4gICAgICAgICAgICAgVGhpcyB3YXkgd2Ug
YWxzbyBmb3JjZSBLVk0gdXNlci1zcGFjZSB0byBleHBsaWNpdGx5Cj4gPiBzZXQgdGhlIFBDLCBB
MCwgYW5kIEExIGJlZm9yZSBydW5uaW5nIHRoZSBWQ1BVIGFnYWluIGFmdGVyCj4gPiBzeXN0ZW0g
cmVzZXQuCj4KPiBXZSBhbHNvIHdhbnQgdG8gY29uc2lkZXIgcmVzZXQgZnJvbSBlbXVsYXRpb24g
b3V0c2lkZSBvZiBLVk0uCj4KPiBUaGVyZSBpcyBhICJzaW1wbGUiIHNvbHV0aW9uIHRoYXQgY292
ZXJzIGV2ZXJ5dGhpbmcgKGV4Y2VwdCBzcGVlZCkgLS0KPiB0aGUgdXNlcnNwYWNlIGNhbiB0ZWFy
IGRvd24gdGhlIHdob2xlIFZNIGFuZCByZS1jcmVhdGUgaXQuCj4gRG8gd2Ugd2FudCB0byBkbyB0
aGlzIGluc3RlYWQgYW5kIGRyb3AgYWxsIHJlc2V0cyBmcm9tIEtWTT8KCkkgdGhpbmsgd2Ugc2hv
dWxkIGtlZXAgdGhlIFZDUFUgcmVzZXRzIGluIEtWTSBzbyB0aGF0IGhhbmRsaW5nCm9mIHN5c3Rl
bSByZXNldCBoYW5kbGluZyBpbiB1c2VyIHNwYWNlIHJlbWFpbnMgc2ltcGxlLiBUaGUgdXNlcgpz
cGFjZSBjYW4gYWxzbyByZS1jcmVhdGUgdGhlIFZNIHVwb24gc3lzdGVtIHJlc2V0IGJ1dCB0aGF0
IGlzCnVzZXIgc3BhY2UgY2hvaWNlLgoKUmVnYXJkcywKQW51cAoKLS0gCmt2bS1yaXNjdiBtYWls
aW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
