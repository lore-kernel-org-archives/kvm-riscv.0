Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AA5CA0EEB
	for <kvm-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 14:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZfbcR/5CZMcaQzjBqZr/CRFs1DGeAY2G8XOOPwlGsa4=; b=n91r8qDE9AxWJ1
	jZrzxVvo+1+kYyPJz5QUExFny2CO0ZdGq6HLM2jEZxLotU4odGTs2LOIBwGXZHf6cwZv9grk5QtGc
	BAlUPyhimd/MtxsphvL7y2FAXBTpv0r28mlRff7sk8fZpyjg6zFocKY194le0jkMLdV1m6UOI5jk4
	iguvp9TMswk/tNvepl+HFQh8Dqkub32zeUV0RmvTMDMxfDjOU9ycFF0E7CgfG80ZOgcKyjgY/Kv0P
	oy+2lsAMWQmxTd0HmdYFGxDdZOsf55X9gA/5GM2DMxluooE2YvqpOWukNSaBG3vrTUSmdl5JnPWCL
	ds+i+XKJxha5VMGXYOYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMvz-0000000Ah2C-3nYx;
	Tue, 19 Aug 2025 14:03:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKkC-0000000AJzb-10RN
	for kvm-riscv@bombadil.infradead.org;
	Tue, 19 Aug 2025 11:43:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=J/0raNw155Q0fcr5A7DH7DOXoru7hdxKmPbmEOTm5zY=; b=R8jRXYJsfHl0zVpWOyhBXLvl8g
	qVsdrArTsEUcF/jEdN+SY3iyA6WSrsYgLkoUJVz7RPRfP6Uo6AaFLJEjspcjKzsGVjLP7TbmsxImM
	uW5iz+FObY1nDr1j4Oeo9is5Nv7V6C/ZYkLQ4EOOOoD7M8uhHm1pa7JHsV8+0yZKmcna6mj/gHqKB
	GsXoM6/8eVJxPuukQ3bilz2GTk4WmgnU25XKhl4RMRY437o1RXD7gW5LsvG7+iZXO8X/u4ELPqBVi
	PYEGL58YLpXRo3rjHV/JfYIgaQD41WXBJBoFSL9ZSdr1r2wpY44s3VOaSuP6srjgF0Gy+vNKKnyLb
	Mid1ifUQ==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKk9-000000001VR-0KeQ
	for kvm-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 11:43:11 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3b9d41c0fe4so743910f8f.0
        for <kvm-riscv@lists.infradead.org>; Tue, 19 Aug 2025 04:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755603787; x=1756208587; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/0raNw155Q0fcr5A7DH7DOXoru7hdxKmPbmEOTm5zY=;
        b=QVizXhEX7Tty3H8OyPC7Dw2+sK+AORVy/4SkKjKiLWwpMIFgqyqGrbxDR3o+VUC3LZ
         qTygIhKeZ82jrdvy10zSeY3WCyWO09llrQNNd8g1TzlfEvrvTFNuJDQNnzLnWwgIFQEg
         nPiWn7OzPGA7I5J3GHKJSgu3ubqOdPSuNpnCbZ/ubFSOPik68FT+oru2+RMz3ZciaaTf
         QiE1yruKEjKyKHzM+xRY283uaYRBE5eG2fmgZDPbado0oQKsQ10ruf0ubkGg8Wv6oagC
         gHa4xf5eoGNM597KnFbfjDIJ+nMmLh3QcwUPbT0cduceuptwyM9voPzuxrJhzWjdb1PA
         CQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755603787; x=1756208587;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J/0raNw155Q0fcr5A7DH7DOXoru7hdxKmPbmEOTm5zY=;
        b=WtMbmfYflGwLIwr8EY/dA+sGCWKmDjdJR+nENWyoVmk3qvOIVjwvSsq/3Zm6ES1/Nw
         3VNmUDnePB6EMrZJrDj1nBicyqBu+JBpn/2xpxg3zLW7OrvB8zPPwuh1VIj/G1muduwx
         +Y+usHRPpAw6CYdFYUkpWcvSTy40IgKvzI8A3dp/jUzocnid9kdXp2V2GPhuKnKMHJru
         a8iSWPNwi3rTM90UKhUQflAh7qx4aLRX6DaEy8du5dVmCy4fbF0m0n+sUBCWJ80NfnrC
         KqfJMkDZJ3Vlisp/nokQhGxr6PvTbv8fePyqjjjSEFx+2f1lHWE2LLhZY6keme18S52L
         Fwuw==
X-Forwarded-Encrypted: i=1; AJvYcCXWuTPCQO0guSPcgkmf/YpZ3o/0jeZjTmpp/g+O79ujretLHv91r4jIih2irJoVHIIoSa1DPzLPdCM=@lists.infradead.org
X-Gm-Message-State: AOJu0YycO0gbg1yDK5E83FDCVvkgGkeF0DPQayTVX/Er5A7pxstkAkLx
	x3mWX4bm9xoglPRVMYHK+rCl8mnL/fHNzidg3nAtDkl5qi+iahczN/koeo+baAKZ0VU=
X-Gm-Gg: ASbGncs9H4AH37FrSO+9w2Qt7C6J7ORJi42FQSxZGwnnbx23lvvzflh9zyKhkvk0ks5
	ALhkdoVbAK8JDIOuuEGc6CT78MTueI1w0fs7PpL0FzzJWAAUmdhJJoSz26s6uthpHQDVqNQKTaE
	CZQqGpjqu1n8eER3VZM8El4vIqIUd3P3k4y5dsXNXwYW4N5Xb8O1ox7b+1BzWPv7j9/2X1H9JBc
	WEzPocUYKljm4aTnhFzlBDb/yvAc/bcT7rnmj6WXVE73dp5+OgIDdX6pEP4QdbhBHfHX/Bp7GZA
	BQ3kZCZj6UIUqMGBvwOb3NaxlLA97UAeoI6uYk9m12T2S1Sha6gCCEYRwm4ub1w/qebdIE+qH+T
	BRSVDjH0gu5Ngc0ad56UqYT004dtrhg==
X-Google-Smtp-Source: AGHT+IE0FoFnrqv/364y0JxojzjSjgxBxkWPcaMoaWDVaVYQ/OrVds62/XTIFpn7j8AxOXLMQWkHNw==
X-Received: by 2002:a05:600c:c169:b0:459:d7c4:9e14 with SMTP id 5b1f17b1804b1-45b43e85f3bmr9440455e9.0.1755603786493;
        Tue, 19 Aug 2025 04:43:06 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:e7d6:daad:8c97:a08e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1cda0021sm207509385e9.13.2025.08.19.04.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:43:06 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 19 Aug 2025 13:43:05 +0200
Message-Id: <DC6DLP13J0LA.XW9J3XFBCM1Y@ventanamicro.com>
Subject: Re: [PATCH 0/6] ONE_REG interface for SBI FWFT extension
Cc: "Atish Patra" <atish.patra@linux.dev>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Anup Patel" <anup@brainfault.org>, "Paolo
 Bonzini" <pbonzini@redhat.com>, "Shuah Khan" <shuah@kernel.org>,
 <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Anup Patel" <apatel@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250814155548.457172-1-apatel@ventanamicro.com>
 <DC5HEJRMZ84K.34OPU922A7XBE@ventanamicro.com>
 <CAK9=C2X8-DBi7qQ87kMA0AiVdiFH0_4L4mzzZzbeCg2eiNm8Qg@mail.gmail.com>
In-Reply-To: <CAK9=C2X8-DBi7qQ87kMA0AiVdiFH0_4L4mzzZzbeCg2eiNm8Qg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_124309_327338_8C9FE19B 
X-CRM114-Status: GOOD (  33.64  )
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

MjAyNS0wOC0xOVQxMjowMDo0MyswNTozMCwgQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNy
by5jb20+Ogo+IE9uIE1vbiwgQXVnIDE4LCAyMDI1IGF0IDM6NTnigK9QTSBSYWRpbSBLcsSNbcOh
xZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4+Cj4+IDIwMjUtMDgtMTRUMjE6
MjU6NDIrMDU6MzAsIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPjoKPj4gPiBU
aGlzIHNlcmllcyBhZGRzIE9ORV9SRUcgaW50ZXJmYWNlIGZvciBTQkkgRldGVCBleHRlbnNpb24g
aW1wbGVtZW50ZWQKPj4gPiBieSBLVk0gUklTQy1WLgo+Pgo+PiBJIHRoaW5rIGl0IHdvdWxkIGJl
IGJldHRlciB0byBPTkVfUkVHIHRoZSBDU1JzIChtZWRlbGVnL21lbnZjZmcpLCBvciBhdAo+PiBs
ZWFzdCBleHBvc2UgdGhlaXIgQ1NSIGZpZWxkcyAoZWFjaCBzZW5zaWJsZSBtZWRlbGVnIGJpdCwg
UE1NLCAuLi4pCj4+IHRocm91Z2gga3ZtX3Jpc2N2X2NvbmZpZywgdGhhbiB0byBjb3VwbGUgdGhp
cyB3aXRoIFNCSS9GV0ZULgo+Pgo+PiBUaGUgY29udHJvbGxlZCBiZWhhdmlvciBpcyBkZWZpbmVk
IGJ5IHRoZSBJU0EsIGFuZCB1c2Vyc3BhY2UgbWlnaHQgd2FudAo+PiB0byBjb25maWd1cmUgdGhl
IFMtbW9kZSBleGVjdXRpb24gZW52aXJvbm1lbnQgZXZlbiB3aGVuIFNCSS9GV0ZUIGlzIG5vdAo+
PiBwcmVzZW50LCB3aGljaCBpcyBub3QgcG9zc2libGUgd2l0aCB0aGUgY3VycmVudCBkZXNpZ24u
Cj4+Cj4+IElzIHRoZXJlIGEgYmVuZWZpdCBpbiBleHByZXNzaW5nIHRoZSBJU0EgbW9kZWwgdGhy
b3VnaCBTQkkvRldGVD8KPj4KPgo+IEV4cG9zaW5nIG1lZGVsZWcvbWVudmNmZyBpcyBub3QgdGhl
IHJpZ2h0IGFwcHJvYWNoIGJlY2F1c2UgYQo+IEd1ZXN0L1ZNIGRvZXMgbm90IGhhdmUgTS1tb2Rl
IGhlbmNlIGl0IGlzIG5vdCBhcHByb3ByaWF0ZSB0bwo+IGV4cG9zZSBtPHh5ej4gQ1NScyB2aWEg
T05FX1JFRyBpbnRlcmZhY2UuIFRoaXMgYWxzbyBhbGlnbnMKPiB3aXRoIEgtZXh0ZW5zaW9uIGFy
Y2hpdGVjdHVyZSB3aGljaCBkb2VzIG5vdCB2aXJ0dWFsaXplIE0tbW9kZS4KCldlIGFscmVhZHkg
aGF2ZSBtdmVuZG9yaWQsIG1hcmNoaWQsIGFuZCBtaXBpZCBpbiBrdm1fcmlzY3ZfY29uZmlnLgoK
VGhlIHZpcnR1YWxpemVkIE0tbW9kZSBpcyB1c2Vyc3BhY2UrS1ZNLiAgKEtWTSBkb2Vzbid0IGFs
bG93IHVzZXJzcGFjZQp0byBjb25maWd1cmUgbW9zdCB0aGluZ3Mgbm93LCBidXQgSSB0aGluayB3
ZSdsbCBoYXZlIHRvIGNoYW5nZSB0aGF0IHdoZW4KZ2V0dGluZyByZWFkeSBmb3IgcHJvZHVjdGlv
bi4pCgo+IFdlIGFscmVhZHkgaGFkIGRpc2N1c3Npb25zIGFib3V0IHRoaXMgaW4gdGhlIHBhc3Qu
Cj4KPiBBcyBzdWNoLCB3ZSBoYXZlIHR3byBvcHRpb25zLiBPbmUgb3B0aW9uIGlzIHRvIGV4cG9z
ZQo+IGhlZGVsZWcvaGVudmNmZyB2aWEga3ZtX3Jpc2N2X2NvbmZpZyBhbmQgYW5vdGhlciBvcHRp
b24KPiBpcyB0byBoYXZlIGEgc2VwYXJhdGUgT05FX1JFRyBmb3IgZWFjaCBGV0ZUIGZlYXR1cmUu
Cj4KPiBTZXBhcmF0ZSBPTkVfUkVHIHJlZ2lzdGVycyBmb3IgZWFjaCBGV0ZUIGZlYXR1cmUgaXMg
YmV0dGVyCj4gdGhhbiBkaXJlY3RseSBleHBvc2luZyBoZWRlbGVnL2hlbnZjZmcgdmlhIE9ORV9S
RUcgYmVjYXVzZToKPgo+IDEpIE9uY2UgbmVzdGVkIHZpcnR1YWxpemF0aW9uIGxhbmRzLCB3ZSB3
aWxsIGJlIGhhdmluZyBzZXBhcmF0ZQo+IGhlZGVsZWcvaGVudmNmZyBhcyBwYXJ0IG9mIG5lc3Rl
ZCB2aXJ0dWFsaXphdGlvbiBzdGF0ZSBvZiBHdWVzdAo+IHdoaWNoIGlzIHRyYXAtbi1lbXVsYXRl
ZCBieSBLVk0uIFRoZSBleGlzdGVuY2Ugb2YgaGVkZWxlZy9oZW52Y2ZnCj4gaW4ga3ZtX3Jpc2N2
X2NvbmZpZyBhbmQgbmVzdGVkIHZpcnR1YWxpemF0aW9uIHN0YXRlIHdpbGwgb25seSBjcmVhdGUK
PiBtb3JlIGNvbmZ1c2lvbi4KClJpZ2h0LCB0aGUgdXNlcnNwYWNlIHJlZ2lzdGVycyBmb3IgdGhp
cyBjYW4ndCBiZSBjYWxsZWQgaCouCgo+IDIpIE5vdCBhbGwgYml0cyBpbiBoZWRlbGVnL2hlbnZj
ZmcgYXJlIHVzZWQgZm9yIEZXRlQgc2luY2UgcXVpdGUKPiBhIGZldyBiaXRzIGFyZSBwcm9ncmFt
bWVkIHdpdGggZml4ZWQgdmFsdWUgYmFzZWQgb24gS1ZNCj4gaW1wbGVtZW50YXRpb24gY2hvaWNl
cyAod2hpY2ggbWF5IGNoYW5nZSBpbiBmdXR1cmUpLgoKWWVzLCB3ZSdsbCB3YW50IHRvIGV4cG9z
ZSBzb21lIHRvIHVzZXJzcGFjZS4KCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBBbHNvLAo+IHRoaW5ncyBsaWtlIHNldF9kZWJ1Z19pb2N0bCgp
IGNoYW5nZSBoZWRlbGVnIGF0IHJ1bnRpbWUKPiB3aGljaCBhbGxvdyBLVk0gdXNlciBzcGFjZSB0
byBkZWNpZGUgd2hvIHRha2VzIGJyZWFrcG9pbnQKPiB0cmFwcyBmcm9tIEd1ZXN0L1ZNLgoKVGhp
cyBpcyBzdGlsbCBkb2FibGUuICBUaGUgY2xlYXIgaGVkZWxlZyBiaXQgZG9lcyBub3QgaGF2ZSB0
byBjaGFuZ2UgdGhlCnZpcnR1YWxpemVkIGJlaGF2aW9yIC0tIGlmIHRoZSBndWVzdCBpcyBleHBl
Y3RpbmcgdG8gc2VlIGJyZWFrcG9pbnQKdHJhcHMsIHRoZW4gZXZlbiBpZiB1c2Vyc3BhY2UrS1ZN
IGNvbmZpZ3VyZSB0aGUgYXJjaGl0ZWN0dXJlIHRvIGRpcmVjdAp0aGUgdHJhcHMgdG8gdGhlIGh5
cGVydmlzb3IsIHRoZXkgbXVzdCB0aGVuIGZvcndhcmQgdGhlIGJyZWFrcG9pbnRzIHRoYXQKd2Vy
ZSBzdXBwb3NlZCB0byBiZSBkZWxpdmVyZWQgdG8gdGhlIGd1ZXN0LgoKPiAgICAgICAgICAgICAg
ICAgICAgICBUaGlzIG1lYW5zIHZhbHVlIHNhdmVkL3Jlc3RvcmVkCj4gdGhyb3VnaCBoZWRlbGVn
L2hlbnZjZmcgaW4ga3ZtX3Jpc2N2X2NvbmZpZyBiZWNvbWVzCj4gc3BlY2lmaWMgdG8gdGhlIGtl
cm5lbCB2ZXJzaW9uIGFuZCBzcGVjaWZpYyB0byBob3N0IElTQSBmZWF0dXJlcy4KCkhlZGVsZWcv
aGVudmNmZyBiaXRzIGRvIG5vdCBoYXZlIHRvIGJlIHRoZSBzYW1lIGFzIHVzZXJzcGFjZSBpbnRl
cmZhY2UKYml0cyAtLSBLVk0gYWx3YXlzIGhhcyB0byBkaXN0aW5ndWlzaCB3aGF0IHRoZSB1c2Vy
c3BhY2Ugd2FudHMgdG8KdmlydHVhbGl6ZSwgYW5kIHdoYXQgdGhlIEtWTSBjaGFuZ2VkIGZvciBp
dHMgb3duIHJlYXNvbnMuCgo+IDMpIFdlIGFueXdheSBuZWVkIHRvIHByb3ZpZGUgT05FX1JFRyBp
bnRlcmZhY2UgdG8KPiBzYXZlL3Jlc3RvcmUgRldGVCBmZWF0dXJlIGZsYWdzIHNvIGl0J3MgYmV0
dGVyIHRvIGtlZXAgdGhlCj4gRldGVCBmZWF0dXJlIHZhbHVlIGFzIHBhcnQgb2YgdGhlIHNhbWUg
T05FX1JFRyBpbnRlcmZhY2UuCgpJIHRoaW5rIHdlIHdhbnQgdG8gaGF2ZSBTQkkgaW4gdXNlcnNw
YWNlIChlc3BlY2lhbGx5IGZvciBzaW5nbGUtc2hvdAplY2FsbHMgbGlrZSBGV0ZUKS4gIFRoZSB1
c2Vyc3BhY2UgaW1wbGVtZW50YXRpb24gd2lsbCB3YW50IGFuIGludGVyZmFjZQp0byBzZXQgdGhl
IElTQSBiaXRzLCBhbmQgaXQncyB2ZXJ5IGF3a3dhcmQgd2l0aCB0aGUgcHJvcG9zZWQgZGVzaWdu
LgoKRmxhZ3MgY2FuIHRvIHN0YXksIGluIGNhc2UgdGhlIHVzZXJwYWNlIHdhbnRzIHRvIGFjY2Vs
ZXJhdGUgRldGVC4KCj4gNCkgVGhlIGF2YWlsYWJpbGl0eSBvZiBxdWl0ZSBhIGZldyBGV0ZUIGZl
YXR1cmVzIGlzIGRlcGVuZGVudAo+IG9uIGNvcnJlc3BvbmRpbmcgSVNBIGV4dGVuc2lvbnMgc28g
aGF2aW5nIHNlcGFyYXRlIE9ORV9SRUcKPiByZWdpc3RlcnMgb2YgZWFjaCBGV0ZUIGZlYXR1cmUg
YWxsb3dzIGdldF9yZWdfbGlzdF9pb2N0bCgpIHRvCj4gcHJvdmlkZSBLVk0gdXNlci1zcGFjZSBv
bmx5IGF2YWlsYWJsZSBGV0ZUIGZlYXR1cmUgcmVnaXN0ZXJzLgoKWWVzLCBidXQgc2ltaWxhcmx5
IHRoZSB1c2Vyc3BhY2Ugd291bGQgYmUgZm9yYmlkZGVuIGZyb20gc2V0dGluZyBiaXRzCnRoYXQg
Y2Fubm90IGJlIGV4cHJlc3NlZCBpbiBoZW52Y2ZnL2hlZGVkZWcuCgpUaGVyZSBhcmUgYWxzbyBi
ZWhhdmlvcnMgd2Ugd2FudCB0byBjb25maWd1cmUgdGhhdCBkbyBub3QgaGF2ZSBhIEZXRlQKdG9n
Z2xlLiAgZS5nLiB0aGUgcmVjZW50IHBhdGNoZXMgZm9yIGRlbGVnYXRpb24gb2YgaWxsZWdhbC1p
bnN0cnVjdGlvbgpleGNlcHRpb25zIHRoYXQgY2hhbmdlZCB0aGUgZ3Vlc3QgYmVoYXZpb3IgLS0g
c29tZW9uZSBtaWdodCB3YW50IHRvCmtlZXAgaW5jcmVtZW50aW5nIHRoZSBTQkkgUE1VIGNvdW50
ZXIsIGFuZCBzb21lb25lIHdpbGwgd2FudCB0byBmb3J3YXJkCnRoZW0gdG8gYmUgaW1wbGVtZW50
ZWQgaW4gdXNlcnNwYWNlICh3aGVuIGRldmVsb3BpbmcgYSBuZXcgZXh0ZW5zaW9uLApiZWNhdXNl
IG1vc3Qgb2YgdGhlIGV4aXN0aW5nIElTQSBjYW4gc3RpbGwgYmUgYWNjZWxlcmF0ZWQgYnkgS1ZN
KS4KCkZvciBnZW5lcmFsIHZpcnR1YWxpemF0aW9uLCB3ZSB3YW50IHRvIGJlIGFibGUgdG8gY29u
ZmlndXJlIHRoZQpmb2xsb3dpbmcgYmVoYXZpb3IgZm9yIGVhY2ggZXhjZXB0aW9uIHRoYXQgd291
bGQgZ28gdG8gdGhlIHZpcnR1YWxpemVkCk0tbW9kZToKICAwKSBkZWxlZ2F0ZWQgdG8gdGhlIGd1
ZXN0CiAgMSkgaW1wbGVtZW50ZWQgYnkgdXNlcnNwYWNlCiAgMi1OKSBpbXBsZW1lbnRhdGlvbnMg
YnkgS1ZNIChpZGVhbGx5IHplcm8gb3Igb25lKQoKV2UgY2FuIGhhdmUgbWVkZWxlZywgYW5kIGFu
b3RoZXIgbWV0aG9kIHRvIGRlY2lkZSBob3cgdG8gaGFuZGxlIHRyYXBwZWQKZXhjZXB0aW9ucywg
YnV0IGl0IHByb2JhYmx5IG1ha2VzIG1vcmUgc2Vuc2UgdG8gaGF2ZSBhIHBlci1leGNlcHRpb24K
T05FX1JFRyB0aGF0IHNldHMgaG93IGVhY2ggZXhjZXB0aW9uIGJlaGF2ZXMuCgpUaGUgRldGVCB2
YWx1ZSBjb3VsZCBiZSBhIHBhcnQgb2YgYSBtb3JlIGdlbmVyYWwgaW50ZXJmYWNlLgoKVGhhbmtz
LgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
