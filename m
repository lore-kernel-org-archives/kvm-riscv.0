Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176E8C3ABBF
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 May 2025 15:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cfX+xEtIQtG1rjpspX9eu5bzgHBbD46qMBiDqXmOUCI=; b=WaPL65BnGXfH64
	RCO1kouDOrnbucvhaBWRPRzeRU61FFK0d72ZZvMVKW8M72aHk3RKJ4gZ/nuXsWVe3IIP90U2Kkuog
	Kjl71cdDjXfkAaD73smfJEj8l6ee3M02o+psjoKJyxjfR1rYokE1+3b2w+bsQwyxnS1EIE+8433MR
	0yC+Rz2xeNTCoWm2jZ5XQgSn0Rvp/8ljEjhvw4vxnDDHgcbW44xWT99pajPiBHHHXBuhQPrwZ3rph
	P0udkbT9JQSn2LHBF+O7tOOjtqLEoqEWGkmizFHJSULg9dHyzXj283SfdXpgMrp1Dlb/8I0DJvc/c
	tqEhuDmCTq+51DbUQeqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgId-0000000Fsyo-39Xl;
	Wed, 07 May 2025 15:03:07 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfsv-0000000Fo3Z-1Crk
	for kvm-riscv@lists.infradead.org;
	Wed, 07 May 2025 14:36:35 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a0ad54f0aeso167894f8f.3
        for <kvm-riscv@lists.infradead.org>; Wed, 07 May 2025 07:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746628591; x=1747233391; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ziqHwwsRYBlnOytFFSvfeo7+WCPTNxHeZbIxMBlJdhs=;
        b=eZP26Te2X9rJjtl6ajKyQDGJOZmdoQIb2+faNgxHFamE1ofey+ab2gX1s6vY3phMHM
         oPT/QDAwQyql/+xGU1oVgPZBVLVbJpTRrCBVAsOb94/cVvveHA5GDOJOv8teJY5ES54i
         f/BrtHM+6c1tFsSCi4ztf5kB/0bGGmJZiDdea6CtiCVyt1ZgYSsPYeZt55AiyzjXbqnx
         0QHuKpaX56u14C16E/JKucSxyNv4vSQn7kMD2gBUJ9+Jv3deV5i4c5LA/ZdQ4QZD0mTA
         qcXBRl1AxNkhcotQye0XNiwByknX7f+aiAGeNDZTgTnmkKj/a5zpwT1Vz106lP03DZEp
         9IpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628591; x=1747233391;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ziqHwwsRYBlnOytFFSvfeo7+WCPTNxHeZbIxMBlJdhs=;
        b=od/UXRomzsQhVIThppKzrFSItJVmRbZ74ey1uR6UwxpSSc6xhTt/wKXhgM2/VvxriT
         bG3yuefbBYEIyxnTunqMg1cu+A8K5lNDgrslgMvkfhGAEbEnNMriu5d7QL5OI3hJrGtu
         u4RwHSfGpC6N5C6nl8exwrjHdaIfOLR8sHwlp1yy6JaqEUXUH+O4zTRCPrhtAqFO6HA0
         oWPwjkwoys3YeVBCvHQOelyvRC/gvfoixxo+RQfeX0dtIKZkHjs3hCPyeNO6RaY9upIS
         W0B/P5kYnpUDwlirCtscrHRqSWLhxVFypioUA1cga+dYbDcNETMGsX7BJo2XFcwliRzU
         Gj9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVsnj5CFZVWHx67tBnwITH9nQH6fagMgxnlbNXwXXkkw+ih97s49BSoAHInSCmejjHNhkkw7zUvLAk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQKL7PBA7VlwJQpnx3baeuK5rHoc4HbXFo31EjhFC8VfTpgPmm
	KUvlbwu1ofZwRpYKfoQ1wJ5xTGWRk6R3MjE08RMzKrV5F2A8QeJIvM24lPdghcw=
X-Gm-Gg: ASbGncvxrDy+RQE21Ar+G197P6CpwE5U7cco2uofjtkj2tBb1IBffntziNQMvyC9a2r
	d/tEMnXTWq7/55ownkQafOHwlrZXBaY5JlsXCbU0zyfsdTDXt/rgHVntpK/pN4xgCx+PhoQ7uf8
	WLuIdpctKTOX8joiwo66Lhnbno3i6DTztXifsOeAIWLWwLt9f8v1ASEwJnQ9GRC+PgyzjgTEvzl
	OVQgRIJp76Q0LKVOUwmQwz/PaPt1e6A4AlPDjfu5GAQVNF5ZYd+iSOLpm8it6fQxu37qTeioSed
	GN22HsCn1rf9tZJ8T2I6XHLmKobFdaw+QQiCLCgkGV/WTyWo
X-Google-Smtp-Source: AGHT+IEajZZzNeyoeib2XsmQjInc2KEWeUmYjGy4p5Qc/30lHXvX26EPvLDj1a/b0VLqz2Zq6F2iCA==
X-Received: by 2002:a5d:64e2:0:b0:3a0:7e53:b52d with SMTP id ffacd0b85a97d-3a0b4a69bdamr1109869f8f.15.1746628590982;
        Wed, 07 May 2025 07:36:30 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:f39f:9517:bfc5:cd5e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0efbfsm17536249f8f.69.2025.05.07.07.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:36:30 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 07 May 2025 16:36:30 +0200
Message-Id: <D9Q05T702L8Y.3UTLG7VXIFXOK@ventanamicro.com>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atish.patra@linux.dev>, "Anup Patel"
 <anup@brainfault.org>, "Atish Patra" <atishp@atishpatra.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Alexandre Ghiti" <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH 0/5] Enable hstateen bits lazily for the KVM RISC-V
 Guests
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com> <D9OYWFEXSA55.OUUXFPIGGBZV@ventanamicro.com> <bc0f1273-d596-47dd-bcc6-be9894157828@linux.dev>
In-Reply-To: <bc0f1273-d596-47dd-bcc6-be9894157828@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_073633_397633_F875CB2F 
X-CRM114-Status: GOOD (  26.08  )
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

MjAyNS0wNS0wNlQxMToyNDo0MS0wNzowMCwgQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQGxpbnV4
LmRldj46Cj4gT24gNS82LzI1IDI6MjQgQU0sIFJhZGltIEtyxI1tw6HFmSB3cm90ZToKPj4gMjAy
NS0wNS0wNVQxNDozOToyNS0wNzowMCwgQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+
Ogo+Pj4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBlbmFibGluZyBoc3RhdGVlbiBiaXRz
IGxhemlseSBhdCBydW50aW1lCj4+PiBpbnN0ZWFkIG9mIHN0YXRpY2FsbHkgYXQgYm9vdGltZS4g
VGhlIGJvb3QgdGltZSBlbmFibGluZyBoYXBwZW5zIGZvcgo+Pj4gYWxsIHRoZSBndWVzdHMgaWYg
dGhlIHJlcXVpcmVkIGV4dGVuc2lvbnMgYXJlIHByZXNlbnQgaW4gdGhlIGhvc3QgYW5kL29yCj4+
PiBndWVzdC4gVGhhdCBtYXkgbm90IGJlIG5lY2Vzc2FyeSBpZiB0aGUgZ3Vlc3QgbmV2ZXIgZXhl
cmNpc2UgdGhhdAo+Pj4gZmVhdHVyZS4gV2UgY2FuIGVuYWJsZSB0aGUgaHN0YXRlZW4gYml0cyB0
aGF0IGNvbnRyb2xzIHRoZSBhY2Nlc3MgbGF6aWx5Cj4+PiB1cG9uIGZpcnN0IGFjY2Vzcy4gVGhp
cyBwcm92aWRlcnMgS1ZNIG1vcmUgZ3JhbnVsYXIgY29udHJvbCBvZiB3aGljaAo+Pj4gZmVhdHVy
ZSBpcyBlbmFibGVkIGluIHRoZSBndWVzdCBhdCBydW50aW1lLgo+Pj4KPj4+IEN1cnJlbnRseSwg
dGhlIGZvbGxvd2luZyBoc3RhdGVlbiBiaXRzIGFyZSBzdXBwb3J0ZWQgdG8gY29udHJvbCB0aGUg
YWNjZXNzCj4+PiBmcm9tIFZTIG1vZGUuCj4+Pgo+Pj4gMS4gQklUKDU4KTogSU1TSUMgICAgIDog
U1RPUEVJIGFuZCBJTVNJQyBndWVzdCBpbnRlcnJ1cHQgZmlsZQo+Pj4gMi4gQklUKDU5KTogQUlB
ICAgICAgIDogU0lQSC9TSUVIL1NUT1BJCj4+PiAzLiBCSVQoNjApOiBBSUFfSVNFTCAgOiBJbmRp
cmVjdCBjc3IgYWNjZXNzIHZpYSBzaXNlbGVjdC9zaXJlZwo+Pj4gNC4gQklUKDYyKTogSFNFTlZD
RkcgIDogU0VOVkNGRyBhY2Nlc3MKPj4+IDUuIEJJVCg2Myk6IFNTVEFURUVOMCA6IFNTVEFURUVO
MCBhY2Nlc3MKPj4+Cj4+PiBLVk0gYWxyZWFkeSBzdXBwb3J0IHRyYXAvZW5hYmxpbmcgb2YgQklU
KDU4KSBhbmQgQklUKDYwKSBpbiBvcmRlcgo+Pj4gdG8gc3VwcG9ydCBzdyB2ZXJzaW9uIG9mIHRo
ZSBndWVzdCBpbnRlcnJ1cHQgZmlsZS4KPj4gSSBkb24ndCB0aGluayBLVk0gdG9nZ2xlcyB0aGUg
aHN0YXRlZW4gYml0cyBhdCBydW50aW1lLCBiZWNhdXNlIHRoYXQKPj4gd291bGQgbWVhbiB0aGVy
ZSBpcyBhIGJ1ZyBldmVuIGluIGN1cnJlbnQgS1ZNLgo+Cj4gVGhpcyB3YXMgYSB0eXBvLiBJIG1l
YW50IHRvIHNheSB0cmFwL2VtdWxhdGUgQklUKDU4KSBhbmQgQklUKDYwKS4KPiBUaGlzIHBhdGNo
IHNlcmllcyBpcyB0cnlpbmcgdG8gZW5hYmxlIHRoZSB0b2dnbGluZyBvZiB0aGUgaHN0YXRlZW4g
Yml0cyAKPiB1cG9uIGZpcnN0IGFjY2Vzcy4KPgo+IFNvcnJ5IGZvciB0aGUgY29uZnVzaW9uLgoK
Tm8gd29ycmllcywgaXQncyBteSBmYXVsdCBmb3IgbWlzcmVhZGluZy4KSSBnb3QgY29uZnVzZWQs
IGJlY2F1c2UgdGhlIGNvZGUgbG9va2VkIGxpa2UgZ2VuZXJpYyBsYXp5IGVuYWJsZW1lbnQsCndo
aWxlIGl0J3MgcmVhbGx5IG9ubHkgZm9yIHRoZSB1cHBlciAzMiBiaXRzIGFuZCB0aGlzIHNlcmll
cyBpcyBub3QgbGF6eQp0b2dnbGluZyBhbnkgVlMtbW9kZSB2aXNpYmxlIGJpdHMuCgo+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRoaXMgc2Vy
aWVzIGV4dGVuZHMKPj4+IHRob3NlIHRvIGVuYWJsZSB0byBjb3JyZXBzb25kaW5nIGhzdGF0ZWVu
IGJpdHMgaW4gUEFUQ0gxLiBUaGUgcmVtYWluaW5nCj4+PiBwYXRjaGVzIGFkZHMgbGF6eSBlbmFi
bGluZyBzdXBwb3J0IG9mIHRoZSBvdGhlciBiaXRzLgo+PiBUaGUgSVNBIGhhcyBhIHBlY3VsaWFy
IGRlc2lnbiBmb3IgaHN0YXRlZW4vc3N0YXRlZW4gaW50ZXJhY3Rpb246Cj4+Cj4+ICAgIEZvciBl
dmVyeSBiaXQgaW4gYW4gaHN0YXRlZW4gQ1NSIHRoYXQgaXMgemVybyAod2hldGhlciByZWFkLW9u
bHkgemVybwo+PiAgICBvciBzZXQgdG8gemVybyksIHRoZSBzYW1lIGJpdCBhcHBlYXJzIGFzIHJl
YWQtb25seSB6ZXJvIGluIHNzdGF0ZWVuCj4+ICAgIHdoZW4gYWNjZXNzZWQgaW4gVlMtbW9kZS4K
Pgo+IENvcnJlY3QuCj4KPj4gVGhpcyBtZWFucyB3ZSBtdXN0IGNsZWFyIGJpdCA2MyBpbiBoc3Rh
dGVlbiBhbmQgdHJhcCBvbiBzc3RhdGVlbgo+PiBhY2Nlc3NlcyBpZiBhbnkgb2YgdGhlIHNzdGF0
ZWVuIGJpdHMgYXJlIG5vdCBzdXBwb3NlZCB0byBiZSByZWFkLW9ubHkgMAo+PiB0byB0aGUgZ3Vl
c3Qgd2hpbGUgdGhlIGh5cGVydmlzb3Igd2FudHMgdG8gaGF2ZSB0aGVtIGFzIDAuCj4KPiBDdXJy
ZW50bHksIHRoZXJlIGFyZSB0d28gYml0cyBpbiBzc3RhdGVlbi4gRkNTUiBhbmQgWlZUIHdoaWNo
IGFyZSBub3QgCj4gdXNlZCBhbnl3aGVyZSBpbiBvcGVuc2JpL0xpbnV4L0tWTSBzdGFjay4KClRy
dWUsIEkgZ3Vlc3Mgd2UgY2FuIGp1c3QgbWFrZSBzdXJlIHRoZSBjdXJyZW50IGNvZGUgY2FuJ3Qg
YnkgbWlzdGFrZQpsYXppbHkgZW5hYmxlIGFueSBvZiB0aGUgYm90dG9tIDMyIGhzdGF0ZWVuIGJp
dHMgYW5kIGhhbmRsZSB0aGUgY2FzZQpwcm9wZXJseSBsYXRlci4KCj4gSW4gY2FzZSwgd2UgbmVl
ZCB0byBlbmFibGUgb25lIG9mIHRoZSBiaXRzIGluIHRoZSBmdXR1cmUsIGRvZXMgaHlwZXZpc29y
IAo+IG5lZWQgdG8gdHJhcCBldmVyeSBzc3RhdGVlbiBhY2Nlc3MgPwoKV2UgbmVlZCB0byB0cmFw
IHNzdGF0ZWVuIGFjY2Vzc2VzIGlmIHRoZSBndWVzdCBpcyBzdXBwb3NlZCB0byBiZSBhYmxlIHRv
CmNvbnRyb2wgYSBiaXQgaW4gc3N0YXRlZW4sIGJ1dCB0aGUgaHlwZXJ2aXNvciB3YW50cyB0byBs
YXppbHkgZW5hYmxlCnRoYXQgZmVhdHVyZSBhbmQgc2V0cyAwIGluIGhzdGF0ZWVuIHVudGlsIHRo
ZSBmaXJzdCB0cmFwLgoKSWYgaHN0YXRlZW4gaXMgMSBmb3IgYWxsIGZlYXR1cmVzIHRoYXQgdGhl
IGd1ZXN0IGNvdWxkIGNvbnRyb2wgdGhyb3VnaApzc3RhdGVlbiwgd2UgY2FuIGFuZCBzaG91bGQg
anVzdCBzZXQgdGhlIFNFIGJpdCAoNjMpIHRvIDEgYXMgd2VsbC4KCj4gQXMgcGVyIG15IHVuZGVy
c3RhbmRpbmcsIGl0IHNob3VsZCBiZSBoYW5kbGVkIGluIHRoZSBoYXJkd2FyZSBhbmQgYW55IAo+
IHdyaXRlIGFjY2VzcyB0byB0byB0aG9zZSBiaXRzIHNob3VsZCBiZSBtYXNrZWQKPiB3aXRoIGhz
dGF0ZWVuIGJpdCB2YWx1ZSBzbyB0aGF0IGl0IG1hdGNoZXMuIFRoYXQncyB3aGF0IHdlIGRvIGlu
IFFlbXUgYXMgCj4gd2VsbC4KClJpZ2h0LCBoYXJkd2FyZSB3aWxsIGRvIHRoZSBqb2IgbW9zdCBv
ZiB0aGUgdGltZS4gIEl0J3MgcmVhbGx5IG9ubHkgZm9yCnRoZSBsYXp5IG1hc2tpbmcsIGJlYXVz
ZSBpZiB3ZSBkb24ndCB0cmFwIHRoZSBzdGF0ZWVuIGFjY2Vzc2VzLCB0aGV5CndvdWxkIGRpZmZl
ciBmcm9tIHdoYXQgdGhlIGd1ZXN0IHNob3VsZCBzZWUuCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcg
bGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
