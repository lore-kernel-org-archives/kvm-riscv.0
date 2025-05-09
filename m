Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE78C3ABBC
	for <kvm-riscv@archiver.kernel.org>; Fri,  9 May 2025 13:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zylwmelrGCKhpkUsNX3UYVlFvTA2ahkOnLPkJ2iekds=; b=A/0bKq3RsoJ8Be
	iNLjI6sIfXGns7XJLZCVweRV81cPRs2HI3AQN+0wRm1EC/+Z4CttFyETM3ZvqTfOAoa75j5Ouxy4K
	1pJdOR93gVHNLfmhC6D35rF6mg/m4FacccgVTvIVupy90vnh2/mBoUH2HFm/jVyTsYwfErPLhJ0Ud
	oAiTASULv8uwj5waUUSoCm5brbepAWTyMpgLG/HK7dVEuGLFhfnVAQbA1jvJBBfE8uvkrXgdawjAx
	kjjc+IMjqfZL+ZKNZWXzCFZDZ8rW6jUeZxsDURHVVF1FEOjNgZOzPwD2wm5zD6/dkt5ziYZnI9UGA
	8n7oLhaKLgzweYYjPaTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNMA-00000003gUT-2iQT;
	Fri, 09 May 2025 13:01:38 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMh0-00000003YfI-1CL0
	for kvm-riscv@lists.infradead.org;
	Fri, 09 May 2025 12:19:07 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-441d1ed82dbso19064945e9.0
        for <kvm-riscv@lists.infradead.org>; Fri, 09 May 2025 05:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746793145; x=1747397945; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iYWWMGA9lFBZFwBTKYu7MXSa19JW4QPiS7W3A2vxafc=;
        b=HhKc2TiAzUGYMwhoLisRvTfrmyzV+/whfXiT+hqchFGP2DngbUD02XhqdmIZ+cj9Op
         mB/5eRRNERfDLdycICOfM9wLJ5X+puhPy47j37wbe1+FIVYFDlo+7Amskm7Ig1zc+TBD
         MxHt9yk1zQHfm+gR6gh5OuZowoCzKRcuxjwSAmlgL5T1pvCJyCiOwdeudkWJKW+DSz+A
         Z6D7URgUUUmEO1kcRhiHPnKVCb3pNBj2U7UM3ckyghvBWXKzHeqfUr9OckIZtQI9Gb3V
         WMxlBrkjLYNn7kCZKrNEWZ4o3by3w4IYUCfp35KF8Q6PlbLrvo2mGOEFfn3SHPA/xpdA
         tCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746793145; x=1747397945;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iYWWMGA9lFBZFwBTKYu7MXSa19JW4QPiS7W3A2vxafc=;
        b=Co1b1KQDp4WdznSW0CsvnHdC7atM6VZbHo0dR0JO6b0PJaNams0+xamoJcZJxIRD/f
         mVKTQzCUGRmJVBAWb8e6hPQheo/GVCQyUmLaeMTaKo+ISnzb0XgCBGbYosYapEbWfLEe
         qF8x6lsZLo+eTPlO3lNAOOUmOBxghI8O5r2ZSuGgoPkT/yQU+SDoTPBhNKb5r5TZdPVV
         gEJozJ/W+MaucG8H8FsvRP/YtMBEIEnvpX+2nxag6FECBCXJm2CXFFYrr9BBBaVeUEC/
         1AgNPcby8KfrDUzKh5tMQzAKtph93IQKb8C1DDvfsnkACXwctQxRVBGxPJjPUQ2gxhgV
         quNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7+WsGXhSHu0H07wF9HxUNXGhaVsNebMCPpCS9nAznlusAMbRr6L/zG3+aqGF0Kma+YJrBhnZCd4c=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+b5qYBjwMcKEfjz/eosZsKVw2Ddy8k3JQMiJCm/IcZawzUkuI
	TFfQpGlFD+MpaXN/MDB81tU/nRCbdok8xdtceBe7FSzE3y9sqpMcA93YOhIZ4FY=
X-Gm-Gg: ASbGncsbmM2Kg2UiHv3utLisRNmDMr3yhDzefVWE/9wvUpXSwO20JcV1NMLAIoqQmqQ
	MwcHo0TLqEK1mUIr1dxMAkgtAM0k/mu/yT43AOjnqy9BdGtJzTyKXpoI0LklIUbRMzzj/KP8m6o
	g+g8+OApkaqefmqFy/+h31z61syAQHPFG3vBR6sH/VHk9/B/lP0SWmvPHVDJhWVwHa8/QgwE6/0
	ekvnv/291wjt64ISCiJ+U9SoDdf+hGK4PwPv5LPPQdwuuBKKumOTMlhcqPWl1CjzQTJkM6xurtC
	v2VT4QUsr1WA6zX0mV7vnVMgtRj0
X-Google-Smtp-Source: AGHT+IHRvpoEOT4UewNsN8KepaxHw/rtKZiDOTYSwD9xFrN8ARTxLI7Pzt+/OC51njY+2qGyohZrhQ==
X-Received: by 2002:a05:600c:6307:b0:43b:c284:5bc2 with SMTP id 5b1f17b1804b1-442d6c36448mr32832675e9.0.1746793144451;
        Fri, 09 May 2025 05:19:04 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::ce80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd34bef4sm71800985e9.24.2025.05.09.05.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 05:19:03 -0700 (PDT)
Date: Fri, 9 May 2025 14:19:03 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <anup@brainfault.org>
Cc: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v2 2/2] RISC-V: KVM: add KVM_CAP_RISCV_MP_STATE_RESET
Message-ID: <20250509-0811f32c1643d3db0ad04f63@orel>
References: <20250508142842.1496099-2-rkrcmar@ventanamicro.com>
 <20250508142842.1496099-4-rkrcmar@ventanamicro.com>
 <CAAhSdy2nOBndtJ46yHbdjc2f0cNoPV3kjXth-q57cXt8jZA6bQ@mail.gmail.com>
 <D9RHYLQHCFP1.24E5305A5VDZH@ventanamicro.com>
 <CAAhSdy2U_LsoVm=4jdZQWdOkPkCH8c2bk6rsts8rY+ZGKwVuUg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy2U_LsoVm=4jdZQWdOkPkCH8c2bk6rsts8rY+ZGKwVuUg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_051906_327286_BAADFE07 
X-CRM114-Status: GOOD (  51.92  )
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

T24gRnJpLCBNYXkgMDksIDIwMjUgYXQgMDU6MzM6NDlQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBGcmksIE1heSA5LCAyMDI1IGF0IDI6MTbigK9QTSBSYWRpbSBLcsSNbcOhxZkgPHJr
cmNtYXJAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gMjAyNS0wNS0wOVQxMjoyNToy
NCswNTozMCwgQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz46Cj4gPiA+IE9uIFRodSwg
TWF5IDgsIDIwMjUgYXQgODowMeKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5h
bWljcm8uY29tPiB3cm90ZToKPiA+ID4+Cj4gPiA+PiBBZGQgYSB0b2dnbGVhYmxlIFZNIGNhcGFi
aWxpdHkgdG8gbW9kaWZ5IHNldmVyYWwgcmVzZXQgcmVsYXRlZCBjb2RlCj4gPiA+PiBwYXRocy4g
IFRoZSBnb2FscyBhcmUgdG8KPiA+ID4+ICAxKSBBbGxvdyB1c2Vyc3BhY2UgdG8gcmVzZXQgYW55
IFZDUFUuCj4gPiA+PiAgMikgQWxsb3cgdXNlcnNwYWNlIHRvIHByb3ZpZGUgdGhlIGluaXRpYWwg
VkNQVSBzdGF0ZS4KPiA+ID4+Cj4gPiA+PiAoUmlnaHQgbm93LCB0aGUgYm9vdCBWQ1BVIGlzbid0
IHJlc2V0IGJ5IEtWTSBhbmQgS1ZNIHNldHMgdGhlIHN0YXRlIGZvcgo+ID4gPj4gIFZDUFVzIGJy
b3VnaHQgdXAgYnkgc2JpX2hhcnRfc3RhcnQgd2hpbGUgdXNlcnNwYWNlIGZvciBhbGwgb3RoZXJz
LikKPiA+ID4+Cj4gPiA+PiBUaGUgZ29hbHMgYXJlIGFjaGlldmVkIHdpdGggdGhlIGZvbGxvd2lu
ZyBjaGFuZ2VzOgo+ID4gPj4gICogUmVzZXQgdGhlIFZDUFUgd2hlbiBzZXR0aW5nIE1QX1NUQVRF
X0lOSVRfUkVDRUlWRUQgdGhyb3VnaCBJT0NUTC4KPiA+ID4KPiA+ID4gUmF0aGVyIHRoYW4gdXNp
bmcgc2VwYXJhdGUgTVBfU1RBVEVfSU5JVF9SRUNFSVZFRCBpb2N0bCgpLCB3ZSBjYW4KPiA+ID4g
ZGVmaW5lIGEgY2FwYWJpbGl0eSB3aGljaCB3aGVuIHNldCwgdGhlIHNldF9tcHN0YXRlIGlvY3Rs
KCkgd2lsbCByZXNldCB0aGUKPiA+ID4gVkNQVSB1cG9uIGNoYW5naW5nIFZDUFUgc3RhdGUgZnJv
bSBSVU5OQUJMRSB0byBTVE9QUEVEIHN0YXRlLgo+ID4KPiA+IFllYWgsIEkgc3RhcnRlZCB3aXRo
IHRoYXQgYW5kIHRoZW4gcmVhbGl6ZWQgaXQgaGFzIHR3byBkcmF3YmFja3M6Cj4gPgo+ID4gICog
SXQgd2lsbCByZXF1aXJlIGxhcmdlciBjaGFuZ2VzIGluIHVzZXJzcGFjZXMsIGJlY2F1c2UgZm9y
Cj4gPiAgICBleGFtcGxlIFFFTVUgbm93IGZpcnN0IGxvYWRzIHRoZSBpbml0aWFsIHN0YXRlIGFu
ZCB0aGVuIHRvZ2dsZXMgdGhlCj4gPiAgICBtcF9zdGF0ZSwgd2hpY2ggd291bGQgaW5jb3JyZWN0
bHkgcmVzZXQgdGhlIHN0YXRlLgo+ID4KPiA+ICAqIEl0IHdpbGwgYWxzbyByZXF1aXJlIGFuIGV4
dHJhIElPQ1RMIGlmIGEgc3RvcHBlZCBWQ1BVIHNob3VsZCBiZQo+ID4gICAgcmVzZXQKPiA+ICAg
ICAxKSBTVE9QUEVEIC0+IFJVTk5JTkcgKD0gcmVzZXQpCj4gPiAgICAgMikgUlVOTklORyAtPiBT
VE9QUEVEIChWQ1BVIHNob3VsZCBiZSBzdG9wcGVkKQo+ID4gICAgb3IgaWYgdGhlIGN1cnJlbnQg
c3RhdGUgb2YgYSBWQ1BVIGlzIG5vdCBrbm93bi4KPiA+ICAgICAxKSA/Pz8gICAgIC0+IFNUT1BQ
RUQKPiA+ICAgICAyKSBTVE9QUEVEIC0+IFJVTk5JTkcKPiA+ICAgICAzKSBSVU5OSU5HIC0+IFNU
T1BQRUQKPiA+Cj4gPiBJIGNhbiBkbyB0aGF0IGZvciB2MyBpZiB5b3UgdGhpbmsgaXQncyBiZXR0
ZXIuCj4gCj4gT2theSwgZm9yIG5vdyBrZWVwIHRoZSBNUF9TVEFURV9JTklUX1JFQ0VJVkVEIGlv
Y3RsKCkKPiAKPiA+Cj4gPiA+PiAgKiBQcmVzZXJ2ZSB0aGUgdXNlcnNwYWNlIGluaXRpYWxpemVk
IFZDUFUgc3RhdGUgb24gc2JpX2hhcnRfc3RhcnQuCj4gPiA+PiAgKiBSZXR1cm4gdG8gdXNlcnNw
YWNlIG9uIHNiaV9oYXJ0X3N0b3AuCj4gPiA+Cj4gPiA+IFRoZXJlIGlzIG5vIHVzZXJzcGFjZSBp
bnZvbHZlbWVudCByZXF1aXJlZCB3aGVuIGEgR3Vlc3QgVkNQVQo+ID4gPiBzdG9wcyBpdHNlbGYg
dXNpbmcgU0JJIEhTTSBzdG9wKCkgY2FsbCBzbyBTVFJPTkcgTk8gdG8gdGhpcyBjaGFuZ2UuCj4g
Pgo+ID4gT2ssIEknbGwgZHJvcCBpdCBmcm9tIHYzIC0tIGl0IGNhbiBiZSBoYW5kbGVkIGJ5IGZ1
dHVyZSBwYXRjaGVzIHRoYXQKPiA+IHRyYXAgU0JJIGNhbGxzIHRvIHVzZXJzcGFjZS4KPiA+Cj4g
PiBUaGUgbGFjayBvZiB1c2Vyc3BhY2UgaW52b2x2ZW1lbnQgaXMgdGhlIGlzc3VlLiAgS1ZNIGRv
ZXNuJ3Qga25vdyB3aGF0Cj4gPiB0aGUgaW5pdGlhbCBzdGF0ZSBzaG91bGQgYmUuCj4gCj4gVGhl
IFNCSSBIU00gdmlydHVhbGl6YXRpb24gZG9lcyBub3QgbmVlZCBhbnkgS1ZNIHVzZXJzcGFjZQo+
IGludm9sdmVtZW50Lgo+IAo+IFdoZW4gYSBWQ1BVIHN0b3BzIGl0c2VsZiB1c2luZyBTQkkgSFNN
IHN0b3AoKSwgdGhlIEd1ZXN0IGl0c2VsZgo+IHByb3ZpZGVzIHRoZSBlbnRyeSBhZGRyZXNzIGFu
ZCBhcmd1bWVudCB3aGVuIHN0YXJ0aW5nIHRoZSBWQ1BVCj4gdXNpbmcgU0JJIEhTTSBzdGFydCgp
IHdpdGhvdXQgYW55IEtWTSB1c2Vyc3BhY2UgaW52b2x2ZW1lbnQuCj4gCj4gSW4gZmFjdCwgZXZl
biBhdCBHdWVzdCBib290IHRpbWUgYWxsIG5vbi1ib290IFZDUFVzIGFyZSBicm91Z2h0LXVwCj4g
dXNpbmcgU0JJIEhTTSBzdGFydCgpIGJ5IHRoZSBib290IFZDUFUgd2hlcmUgdGhlIEd1ZXN0IGl0
c2VsZgo+IHByb3ZpZGVzIGVudHJ5IGFkZHJlc3MgYW5kIGFyZ3VtZW50IHdpdGhvdXQgYW55IEtW
TSB1c2Vyc3BhY2UKPiBpbnZvbHZlbWVudC4KCkhTTSBvbmx5IHNwZWNpZmllcyB0aGUgc3RhdGUg
b2YgYSBmZXcgcmVnaXN0ZXJzIGFuZCB0aGUgSVNBIG9ubHkgYSBmZXcKbW9yZS4gQWxsIG90aGVy
IHJlZ2lzdGVycyBoYXZlIElNUERFRiByZXNldCB2YWx1ZXMuIFplcm9zLCBsaWtlIEtWTQpzZWxl
Y3RzLCBhcmUgYSBnb29kIGNob2ljZSBhbmQgdGhlIGJlc3QgZGVmYXVsdCwgYnV0IGlmIHRoZSBW
TU0gZGlzYWdyZWVzLAp0aGVuIGl0IHNob3VsZCBiZSBhbGxvd2VkIHRvIHNlbGVjdCB3aGF0IGl0
IGxpa2VzLCBhcyB0aGUgVk1NL3VzZXIgaXMgdGhlCnBvbGljeSBtYWtlciBhbmQgS1ZNIGlzICJq
dXN0IiB0aGUgYWNjZWxlcmF0b3IuCgo+IAo+ID4KPiA+ID4+ICAqIERvbid0IG1ha2UgVkNQVSBy
ZXNldCByZXF1ZXN0IG9uIHNiaV9zeXN0ZW1fc3VzcGVuZC4KPiA+ID4KPiA+ID4gVGhlIGVudHJ5
IHN0YXRlIG9mIGluaXRpYXRpbmcgVkNQVSBpcyBhbHJlYWR5IGF2YWlsYWJsZSBvbiBTQkkgc3lz
dGVtCj4gPiA+IHN1c3BlbmQgY2FsbC4gVGhlIGluaXRpYXRpbmcgVkNQVSBtdXN0IGJlIHJlc2V0
dGVkIGFuZCBlbnRyeSBzdGF0ZSBvZgo+ID4gPiBpbml0aWF0aW5nIFZDUFUgbXVzdCBiZSBzZXR1
cC4KPiA+Cj4gPiBVc2Vyc3BhY2Ugd291bGQgc2ltcGx5IGNhbGwgdGhlIFZDUFUgcmVzZXQgYW5k
IHNldCB0aGUgY29tcGxldGUgc3RhdGUsCj4gPiBiZWNhdXNlIHRoZSB1c2Vyc3BhY2UgZXhpdCBh
bHJlYWR5IHByb3ZpZGVzIGFsbCB0aGUgc2JpIGluZm9ybWF0aW9uLgo+ID4KPiA+IEknbGwgZHJv
cCB0aGlzIGNoYW5nZS4gIEl0IGRvZXNuJ3QgbWFrZSBtdWNoIHNlbnNlIGlmIHdlIGFyZW4ndCBm
aXhpbmcKPiA+IHRoZSBzYmlfaGFydF9zdGFydCByZXNldC4KPiA+Cj4gPiA+PiBUaGUgcGF0Y2gg
aXMgcmV1c2luZyBNUF9TVEFURV9JTklUX1JFQ0VJVkVELCBiZWNhdXNlIHdlIGRpZG4ndCB3YW50
IHRvCj4gPiA+PiBhZGQgYSBuZXcgSU9DVEwsIHNvcnJ5LiA6KQo+ID4gPj4KPiA+ID4+IFNpZ25l
ZC1vZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPgo+ID4g
Pj4gLS0tCj4gPiA+PiBJZiB5b3Ugc2VhcmNoIGZvciBjYXAgNy40MiBpbiBhcGkucnN0LCB5b3Un
bGwgc2VlIHRoYXQgaXQgaGFzIGEgd3JvbmcKPiA+ID4+IG51bWJlciwgd2hpY2ggaXMgd2h5IHdl
J3JlIDcuNDMsIGluIGNhc2Ugc29tZW9uZSBib3RoZXJzIHRvIGZpeCBBUk0uCj4gPiA+Pgo+ID4g
Pj4gSSB3YXMgYWxzbyBzdHJvbmdseSBjb25zaWRlcmluZyBjcmVhdGluZyBhbGwgVkNQVXMgaW4g
UlVOTkFCTEUgc3RhdGUgLS0KPiA+ID4+IGRvIHlvdSBrbm93IG9mIGFueSBzaW1pbGFyIHF1aXJr
cyB0aGF0IGFyZW4ndCBpbXBvcnRhbnQsIGJ1dCBjb3VsZCBiZQo+ID4gPj4gZml4ZWQgd2l0aCB0
aGUgbmV3IHVzZXJzcGFjZSB0b2dnbGU/Cj4gPiA+Cj4gPiA+IFVwb24gY3JlYXRpbmcgYSBWTSwg
b25seSBvbmUgVkNQVSBzaG91bGQgYmUgUlVOTkFCTEUgYW5kIGFsbAo+ID4gPiBvdGhlciBWQ1BV
cyBtdXN0IHJlbWFpbiBpbiBPRkYgc3RhdGUuIFRoaXMgaXMgaW50ZW50aW9uYWwgYmVjYXVzZQo+
ID4gPiBpbWFnaW5lIGEgbGFyZ2UgbnVtYmVyIG9mIFZDUFVzIGVudGVyaW5nIEd1ZXN0IE9TIGF0
IHRoZSBzYW1lCj4gPiA+IHRpbWUuIFdlIGhhdmUgc3BlbnQgYSBsb3Qgb2YgZWZmb3J0IGluIHRo
ZSBwYXN0IHRvIGdldCBhd2F5IGZyb20gdGhpcwo+ID4gPiBzaXR1YXRpb24gZXZlbiBpbiB0aGUg
aG9zdCBib290IGZsb3cuIFdlIGNhbid0IGV4cGVjdCB1c2VyIHNwYWNlIHRvCj4gPiA+IGNvcnJl
Y3RseSBzZXQgdGhlIGluaXRpYWwgTVBfU1RBVEUgb2YgYWxsIFZDUFVzLiBXZSBjYW4gY2VydGFp
bmx5Cj4gPiA+IHRoaW5rIG9mIHNvbWUgbWVjaGFuaXNtIHVzaW5nIHdoaWNoIHVzZXIgc3BhY2Ug
Y2FuIHNwZWNpZnkKPiA+ID4gd2hpY2ggVkNQVSBzaG91bGQgYmUgcnVubmFibGUgdXBvbiBWTSBj
cmVhdGlvbi4KPiA+Cj4gPiBXZSBhbHJlYWR5IGRvIGhhdmUgdGhlIG1lY2hhbmlzbSAtLSB0aGUg
dXNlcnNwYWNlIHdpbGwgc2V0IE1QX1NUQVRFIG9mCj4gPiBWQ1BVIDAgdG8gU1RPUFBFRCBhbmQg
d2hhdGV2ZXIgVkNQVXMgaXQgd2FudHMgYXMgYm9vdCB3aXRoIHRvIFJVTk5BQkxFCj4gPiBiZWZv
cmUgcnVubmluZyBhbGwgdGhlIFZDUFVzIGZvciB0aGUgZmlyc3QgdGltZS4KPiAKPiBPa2F5LCBu
b3RoaW5nIHRvIGJlIGRvbmUgb24gdGhpcyBmcm9udC4KPiAKPiA+Cj4gPiBUaGUgdXNlcnNwYWNl
IG11c3QgY29ycmVjdGx5IHNldCB0aGUgaW5pdGlhbCBNUCBzdGF0ZSBhbnl3YXksIGJlY2F1c2Ug
YQo+ID4gcmVzdW1lIHdpbGwgd2FudCBhIG1wX3N0YXRlIHRoYXQgYSBmcmVzaCBib290Lgo+ID4K
PiA+ID4gVGhlIGN1cnJlbnQgYXBwcm9hY2ggaXMgdG8gZG8gSFNNIHN0YXRlIG1hbmFnZW1lbnQg
aW4ga2VybmVsCj4gPiA+IHNwYWNlIGl0c2VsZiBhbmQgbm90IHJlbHkgb24gdXNlciBzcGFjZS4g
QWxsb3dpbmcgdXNlcnNwYWNlIHRvCj4gPiA+IHJlc2V0dGluZyBhbnkgVkNQVSBpcyBmaW5lIGJ1
dCB0aGlzIHNob3VsZCBub3QgYWZmZWN0IHRoZSBmbG93IGZvcgo+ID4gPiBTQkkgSFNNLCBTQkkg
U3lzdGVtIFJlc2V0LCBhbmQgU0JJIFN5c3RlbSBTdXNwZW5kLgo+ID4KPiA+IFllcywgdGhhdCBp
cyB0aGUgZGVzaWduIEkgd2FzIHRyeWluZyB0byBjaGFuZ2UuICBJIHRoaW5rIHVzZXJzcGFjZQo+
ID4gc2hvdWxkIGhhdmUgY29udHJvbCBvdmVyIGFsbCBhc3BlY3RzIG9mIHRoZSBndWVzdCBpdCBl
eGVjdXRlcyBpbiBLVk0uCj4gCj4gRm9yIFNCSSBIU00sIHRoZSBrZXJuZWwgc3BhY2Ugc2hvdWxk
IGJlIHRoZSBvbmx5IGVudGl0eSBtYW5hZ2luZy4KClRoZSBWTU0gc2hvdWxkIGFsd2F5cyBiZSB0
aGUgb25seSBtYW5hZ2VyLiBLVk0gY2FuIHByb3ZpZGUgZGVmYXVsdHMgaW4Kb3JkZXIgdG8gc3Vw
cG9ydCBzaW1wbGUgVk1NcyB0aGF0IGRvbid0IGhhdmUgb3BpbmlvbnMsIGJ1dCBWTU1zIGNvbmNl
cm5lZAp3aXRoIG1hbmFnaW5nIGFsbCBzdGF0ZSBvbiBiZWhhbGYgb2YgdGhlaXIgdXNlcnMnIGNo
b2ljZXMgYW5kIHRvIGVuc3VyZQpzdWNjZXNzZnVsIG1pZ3JhdGlvbnMsIHdpbGwgd2FudCB0byBi
ZSBpbnZvbHZlZC4KClRoYW5rcywKZHJldwoKPiAKPiA+Cj4gPiBBY2NlbGVyYXRpbmcgU0JJIGlu
IEtWTSBpcyBnb29kLCBidXQgdXNlcnNwYWNlIHNob3VsZCBiZSBhYmxlIHRvIHNheSBob3cKPiA+
IHRoZSB1bnNwZWNpZmllZCBwYXJ0cyBhcmUgaW1wbGVtZW50ZWQuICBUcmFwcGluZyB0byB1c2Vy
c3BhY2UgaXMgdGhlCj4gPiBzaW1wbGVzdCBvcHRpb24uICAoQW5kIHN1ZmZpY2llbnQgZm9yIGVj
YWxscyB0aGF0IGFyZSBub3QgYSBob3QgcGF0aC4pCj4gPgo+IAo+IEZvciB0aGUgdW5zcGVjaWZp
ZWQgcGFydHMsIHdlIGhhdmUgS1ZNIGV4aXRzIGF0IGFwcHJvcHJpYXRlIHBsYWNlcwo+IGUuZy4g
U0JJIHN5c3RlbSByZXNldCwgU0JJIHN5c3RlbSBzdXNwZW5kLCBldGMuCj4gCj4gUmVnYXJkcywK
PiBBbnVwCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1y
aXNjdgo=
