Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0488BCCD199
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 04:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eg+ugVEZead2lLg/12sKQc9JfQr9Rff36+64QzDtetM=; b=rPMJdMryb7goAM
	7cTTaPEiGQou34P562Z2ssOPiB5aFOB4c5TGpUc+zfe2yar07MSrXwsyw5fNOqqSq8iF7lY13NaVM
	lbgaYwa9ev4Sw+SPuSDwdfzIxoQ5ptrNZcxXnpD3D2Z3K/DVqGVn7PppWyEQDp/WTNZEqx/bGbnjk
	b4NOV/bxs8O4vMUi9KSCBQMeRFfnJ9B8gvqTpO/GKJA9NPdzgJf1OzVad2uYMND11Bxw7Evrq7UH0
	56e72OLLZ+hH3NtevUS9IiYI/J6AOLT861tSNdtqIBsWvRr+QWagU/56arzwhMZux3vFs18cybt4h
	+ftqsKWjP7d9OVaGn0Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhbd-0000000BsGo-2fJA;
	Mon, 20 Oct 2025 04:34:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhbc-0000000BsG9-1ayp
	for kvm-riscv@bombadil.infradead.org;
	Mon, 20 Oct 2025 04:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+onDgxMPyKLOY40mbxy0dXul6lSc7HSME7/BE/rGWAw=; b=MNSqD35dIOdm555rnYeSuN8lQ9
	SVoEIqL9KIcgK9wYKEXsAL1Iye8p8Qqvig12PRYFCAONC2WgCbJ/itc6P30/JQIwBfZ+ixOujDpWu
	4ooGTLOq7DCX7Bnl8tU8Ha2RZXEIUv/EpVvLxJ5++hJi/12ACh5HJeqb/KCumFbaEKjwniy3xTbZt
	GVkiuSjtXOHtLRksGmN9IZWcQbM9RfVBx0w6Q5MTpaHWNn7nPWib/s5QXIPLvPeScnileNeds41zr
	1YML2b1J2YrAxXcW9qXbNLTf8Y9u8OIQ+yBqgFjVS3tNR42wQP8mtwq2f9m93FWC4AsIrVfMTQxfI
	5ngf3Rrg==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhbW-00000009VnM-2z97
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 04:34:45 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-33067909400so2965354a91.2
        for <kvm-riscv@lists.infradead.org>; Sun, 19 Oct 2025 21:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760934881; x=1761539681; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+onDgxMPyKLOY40mbxy0dXul6lSc7HSME7/BE/rGWAw=;
        b=azT/39c1imgVf0TVJ47uGKgBVD6hHn3Rq+up4TppMEPpLMSHgDpoEkk9oo7azYlUEr
         siqc2O6L6OzYCRGdUD50rTQjoFazcSar/tiMdL6vTy1UBjbaIeNhtvnpCWlIShJLLr7j
         4nM7OoyNQgnRbXx0SMuSC8WH2UYq9S93CHEVGbZsgA9OWAbrcwN/rFTK2GhuwujfzRIi
         XNJ9v4nJSHsQ20Gzr1018wWoImd22Prv1yo+Pv2ExFxSBBvW50efPZbiDPiIXruUuPlK
         G22TNZi6pVMIY/EbGQBtU+kWXCZ7HBrC6CZxvQUsEg6OCJwMJDew3UwzhxUuXtI0pSJ/
         cWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760934881; x=1761539681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+onDgxMPyKLOY40mbxy0dXul6lSc7HSME7/BE/rGWAw=;
        b=Dj2hVnHXv57qjZcQV1d7BVD0gS7g5k8ubvNe2OZjrZW3fvbtPdkq/AmerMI2gqq8ih
         CKD9DjjA/0mNtdVk9YIFEwiznkCeQcUnEohJLb7zSeiAWoMoTpy1eSTZpyMUTQk/oAUb
         9N4ZEd8V+1iY4PjjK1tdteJQof9hvmtSC5tNkVhW1ysKCTXEDXGP2OfSnZUCsjsGrUEB
         l1Lw4M2q5+EmR5mQHvkzfo6K27Osm16ywRDP6BoKW+a5Vs4aoRdUlpFyhj28iWYODbT3
         UP6Dr3PA4BodAd6wxOEQMQUGErEf0mRMPjFAG38Ui5yMbVu6xMwfpPlt81+tkkwvBmQo
         iL1A==
X-Forwarded-Encrypted: i=1; AJvYcCUTthc2mPpp3CBBZF7G+QHaWcLGcatYE0FVYVK2sj6MmfGxfxIg1sO2XdRKXQwm0h9or+W1eRKrfRQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzizM4ua2ANQzKKkaB0CemcBDZUx9a0Jm/Foc5LzeyYSHaBCQhh
	YbQDsEuz1jK0sAO6RV9T9B35diYdvLaGHrB4I5reobNfCGlvhRWUPbUoFOfH7WvGy1mlVKEoBUw
	0RWwgfnxYw0nqQ0+bnlsvTKhwDmCPOZZoWC6/I8Z3CQ==
X-Gm-Gg: ASbGnctwtxc0zGwt2wwySDmX3uznzUW22ogT4SSEU1vu/pPiSsaIRF5mkBEIm+wqeR5
	CeXPN0IqrZejMMB4uMCxX9jO208/nmpad0ZA2Jvc0Fa+QYd1wqlfKTrM+oZ44NoxFVyaAb2a4OX
	VMxTg1lmSx9Byhz9ESa5HoxTs4gIiEFrzXz0YNwbPr8yk+4PmVvL/22w3fSG/sUsSVloIait2F6
	iFeLQEitIFHYj0Nl6mnlWrvP4SSzufwEGIoK3GhqibkmvCV7wcsdSd4ECvbCzLSTdwygct8n2pY
	55srwOGMQEU21lkErO4=
X-Google-Smtp-Source: AGHT+IH9a1FKrBN3wWlaNuwKbnc7SmqwwgKUv1BbHl2nQXJtIw5nLWAzBwdqnbFCmBJfMi6jc127yHWzB+hEpQgkJLs=
X-Received: by 2002:a17:90b:3510:b0:32c:2cd:4d67 with SMTP id
 98e67ed59e1d1-33bcf892b26mr17239614a91.13.1760934880715; Sun, 19 Oct 2025
 21:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <20251020042056.30283-1-luxu.kernel@bytedance.com>
In-Reply-To: <20251020042056.30283-1-luxu.kernel@bytedance.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Mon, 20 Oct 2025 12:34:29 +0800
X-Gm-Features: AS18NWCAyFau_n9LGvHEY6sx4LEsfPQSzxZhTugNhp11gJ7ivOgOscG6Z4MCNx8
Message-ID: <CAPYmKFs5ATB26ZWtP3vyT=zhJHrafgvBAm6GUw27AM7h5vE9Kw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] riscv: Add Zalasr ISA extension support
To: corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, will@kernel.org, peterz@infradead.org, 
	boqun.feng@gmail.com, mark.rutland@arm.com, anup@brainfault.org, 
	atish.patra@linux.dev, pbonzini@redhat.com, shuah@kernel.org, 
	parri.andrea@gmail.com, ajones@ventanamicro.com, brs@rivosinc.com, 
	guoren@kernel.org
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	apw@canonical.com, joe@perches.com, lukas.bulwahn@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_053443_480474_19ACCB39 
X-CRM114-Status: GOOD (  16.94  )
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

VGhpcyBzZXJpZXMgd2FzIGF1dG9tYXRpY2FsbHkgYmxvY2tlZCBieSBHbWFpbCBkdWUgdG8gdG9v
IG1hbnkKcmVjaXBpZW50cywgc28gSSByZXNlbnQgaXQgdHdpY2UsIGNhdXNpbmcgdGhlIGVtYWls
cyB0byBhcHBlYXIKZGlzY29udGludW91cy4gSSBhcG9sb2dpemUgZm9yIGFueSBpbmNvbnZlbmll
bmNlIHRoaXMgbWF5IGhhdmUgY2F1c2VkCnRvIHRoZSByZXZpZXdlci4KCkJlc3QgcmVnYXJkcywK
WHUgTHUKCk9uIE1vbiwgT2N0IDIwLCAyMDI1IGF0IDEyOjIx4oCvUE0gWHUgTHUgPGx1eHUua2Vy
bmVsQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9y
IHRoZSBaYWxhc3IgSVNBIGV4dGVuc2lvbiwgd2hpY2ggc3VwcGxpZXMgdGhlCj4gcmVhbCBsb2Fk
IGFjcXVpcmUvc3RvcmUgcmVsZWFzZSBpbnN0cnVjdGlvbnMuCj4KPiBUaGUgc3BlY2lmaWNhdGlv
biBjYW4gYmUgZm91bmQgaGVyZToKPiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtemFs
YXNyL2Jsb2IvbWFpbi9jaGFwdGVyMi5hZG9jCj4KPiBUaGlzIHBhdGNoIHNlaXJlcyBoYXMgYmVl
biB0ZXN0ZWQgd2l0aCBsdHAgb24gUWVtdSB3aXRoIEJyZW5zYW4ncyB6YWxhc3IKPiBzdXBwb3J0
IHBhdGNoWzFdLgo+Cj4gU29tZSBmYWxzZSBwb3NpdGl2ZSBzcGFjaW5nIGVycm9yIGhhcHBlbnMg
ZHVyaW5nIHBhdGNoIGNoZWNraW5nLiBUaHVzIEkKPiBDQ2VkIG1haW50YWluZXJzIG9mIGNoZWNr
cGF0Y2gucGwgYXMgd2VsbC4KPgo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0FH
UFNYd0pFZHRxVz1ueDcxb3VmWnA2NG5LNnRLPTByeXRWRWN6NEYtZ2Z2Q09YazJ3QG1haWwuZ21h
aWwuY29tLwo+Cj4gdjQ6Cj4gIC0gQXBwbHkgYWNxdWlyZS9yZWxlYXNlIHNlbWFudGljcyB0byBh
cmNoX2F0b21pYyBvcGVyYXRpb25zLiBUaGFua3MKPiAgdG8gQW5kcmVhLgo+Cj4gdjM6Cj4gIC0g
QXBwbHkgYWNxdWlyZS9yZWxlYXNlIHNlbWFudGljcyB0byBhcmNoX3hjaGcvYXJjaF9jbXB4Y2hn
IG9wZXJhdGlvbnMKPiAgc28gYXMgdG8gZW5zdXJlIEZFTkNFLlRTTyBvcmRlcmluZyBiZXR3ZWVu
IG9wZXJhdGlvbnMgd2hpY2ggcHJlY2VkZSB0aGUKPiAgVU5MT0NLK0xPQ0sgc2VxdWVuY2UgYW5k
IG9wZXJhdGlvbnMgd2hpY2ggZm9sbG93IHRoZSBzZXF1ZW5jZS4gVGhhbmtzCj4gIHRvIEFuZHJl
YS4KPiAgLSBTdXBwb3J0IGh3cHJvYmUgb2YgWmFsYXNyLgo+ICAtIEFsbG93IFphbGFzciBleHRl
bnNpb25zIGZvciBHdWVzdC9WTS4KPgo+IHYyOgo+ICAtIEFkanVzdCB0aGUgb3JkZXIgb2YgWmFs
YXNyIGFuZCBaYWxyc2MgaW4gZHQtYmluZGluZ3MuIFRoYW5rcyB0bwo+ICBDb25vci4KPgo+IFh1
IEx1ICgxMCk6Cj4gICByaXNjdjogQWRkIElTQSBleHRlbnNpb24gcGFyc2luZyBmb3IgWmFsYXNy
Cj4gICBkdC1iaW5kaW5nczogcmlzY3Y6IEFkZCBaYWxhc3IgSVNBIGV4dGVuc2lvbiBkZXNjcmlw
dGlvbgo+ICAgcmlzY3Y6IGh3cHJvYmU6IEV4cG9ydCBaYWxhc3IgZXh0ZW5zaW9uCj4gICByaXNj
djogSW50cm9kdWNlIFphbGFzciBpbnN0cnVjdGlvbnMKPiAgIHJpc2N2OiBBcHBseSBaYWxhc3Ig
dG8gc21wX2xvYWRfYWNxdWlyZS9zbXBfc3RvcmVfcmVsZWFzZQo+ICAgcmlzY3Y6IEFwcGx5IGFj
cXVpcmUvcmVsZWFzZSBzZW1hbnRpY3MgdG8gYXJjaF94Y2hnL2FyY2hfY21weGNoZwo+ICAgICBv
cGVyYXRpb25zCj4gICByaXNjdjogQXBwbHkgYWNxdWlyZS9yZWxlYXNlIHNlbWFudGljcyB0byBh
cmNoX2F0b21pYyBvcGVyYXRpb25zCj4gICByaXNjdjogUmVtb3ZlIGFyY2ggc3BlY2lmaWMgX19h
dG9taWNfYWNxdWlyZS9yZWxlYXNlX2ZlbmNlCj4gICBSSVNDLVY6IEtWTTogQWxsb3cgWmFsYXNy
IGV4dGVuc2lvbnMgZm9yIEd1ZXN0L1ZNCj4gICBSSVNDLVY6IEtWTTogc2VsZnRlc3RzOiBBZGQg
WmFsYXNyIGV4dGVuc2lvbnMgdG8gZ2V0LXJlZy1saXN0IHRlc3QKPgo+ICBEb2N1bWVudGF0aW9u
L2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgICAgICAgICAgfCAgIDUgKy0KPiAgLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIHwgICA1ICsKPiAgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9hdG9taWMuaCAgICAgICAgICAgICAgIHwgIDcwICsrKysrKysrLQo+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2JhcnJpZXIuaCAgICAgICAgICAgICAgfCAgOTEgKysrKysrKysr
LS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4Y2hnLmggICAgICAgICAgICAgIHwgMTQ0
ICsrKysrKysrKy0tLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2ZlbmNlLmggICAg
ICAgICAgICAgICAgfCAgIDQgLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggICAg
ICAgICAgICAgICAgfCAgIDEgKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2luc24tZGVmLmgg
ICAgICAgICAgICAgfCAgNzkgKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20vaHdwcm9iZS5oICAgICAgICAgfCAgIDEgKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20va3ZtLmggICAgICAgICAgICAgfCAgIDEgKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0
dXJlLmMgICAgICAgICAgICAgICAgfCAgIDEgKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdw
cm9iZS5jICAgICAgICAgICAgICAgfCAgIDEgKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJl
Zy5jICAgICAgICAgICAgICAgICAgfCAgIDIgKwo+ICAuLi4vc2VsZnRlc3RzL2t2bS9yaXNjdi9n
ZXQtcmVnLWxpc3QuYyAgICAgICAgfCAgIDQgKwo+ICAxNCBmaWxlcyBjaGFuZ2VkLCAzMTQgaW5z
ZXJ0aW9ucygrKSwgOTUgZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuMjAuMQo+CgotLSAKa3ZtLXJp
c2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
