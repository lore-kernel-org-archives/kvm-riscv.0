Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD35C369D9
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 09:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xLjLePE76VL+9s4DQjUZrnAFNny6WEQXtiaPW/rzFhw=; b=ZI5NrHQN6aLw3Y
	+1hbFZ+FzVR0GzGn+Rx4fwk5CzKaNmXO7ByH2TtdkpM2ELdhEZ2WGhuHC932hHHFxJSQNHpVbvorT
	g80mx1bkOYJ8rWpnqhDQzG1pJoMQdI90ovNJSBtbSwlUS+eWXzJTrtRXKEoxYmPeldok6w8M5606i
	ncAirub98yPs/CK+XyAeEM/mbyzBRZYKA4R+ezlEz9WMxNpvWMfYa+iXDb/B1YpjyfjIc0YORQWE/
	KufYFzDQASIpKPNO8UWJp61GVK93zXGflJCD6m5EzjAvy9UTpG6neTCKYAcyRyAQxzU+LUO/kEDGl
	wDEFW+Rmlu2YXo+/nesQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA41J-0000000CQHM-31wE;
	Wed, 30 Apr 2025 09:46:25 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2p8-0000000C9hf-35KY
	for kvm-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 08:29:47 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43d4ff56136so8091755e9.3
        for <kvm-riscv@lists.infradead.org>; Wed, 30 Apr 2025 01:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746001785; x=1746606585; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjLDCSYme2TvJ6cWJlZ375xtH0fHLFeKajOPyMJ/Dkc=;
        b=nez7Sd3/axayyRzhx7XRlxufkT+9xXryXo3X1/jJqtOHQ7XLWbGkDk0pGq4acQeJnV
         /FQzAJvUXhSbr2/m42efObJ8RTmbGQ5dBrvyGL+3YGQBe53BX3Cu+Ud/7r917n6aVxt+
         OwqoM5oUj1rAFSyNd7C2868NU4ui4p76z8i1wp3vzc6qUzlKLzIQVr8H38FvJIClWvgA
         fhCAllLXRG0nvZZEc/y38U4TfKC/QohQpbmOzZgI4JNKE41c5+HO7HJY7ASdzdH5Yqc5
         lp7oEePDC5klEN0L0foOq0JlqXTPcy29Eo1I37jFEhXfCXEDw8MOTmN4YsTWHjZcqqdx
         SDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746001785; x=1746606585;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bjLDCSYme2TvJ6cWJlZ375xtH0fHLFeKajOPyMJ/Dkc=;
        b=d+9etLT0sZtyAgEgldDkU3CAIz73zOAvqKhLY2Sj24M1eDagVon3Iomrdt8O1IbgVE
         ejNDJO6JCr+UxAx3rgTfZbmMXFISIaEVxYivvENUJTsdinvMNAKCFti0czIg2Z0rXEMc
         hVtVairku9t3tDexSoKZFv6axFnvJyRh+5UqQjxK2y82WMiloKJV7uoQyKzrOvA0aH6Q
         R8yxXvnL5pz2kUpSPqa4Zr6RHbvB3QkrtQvoJ5x9Cu0CLQ1BHy8HNVZCkywaYuM71t4k
         9EU2JLNqlgc2u4WiXNLHsNHu3pVckNuFvK6Main9xeZfYUqDz6VPHQissdelxYFkQMAX
         JutA==
X-Forwarded-Encrypted: i=1; AJvYcCXGnckvmTE1tBCTYq7MKk7hT64ozLVnLzg7hefPB0Cp9jWQJwkkuO3xzs3IVfqUKzX1BQ7GWRqhBOE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxcklg4S1cGRXFnZwibwp8LkpWE2cxnFmZs3gh+RnL7/Y/mOxle
	4QxpfLPr2XKaHMVdPHnRI9HGCqOiTRpvGphGRbhMiTNDfyY7OWQmhw+E6e0O04s=
X-Gm-Gg: ASbGncvmjisDfdv5eWKvPskB8E0FKjTYYIq8WuYea6Zkk+WS+IaRhwKJOzVQRXt4wDO
	aVn4pAuh2iGXyS+X5rb1d45jNyrqtG/cnQDlv0hy+mGbD8capYmmV9NrJGIVXsqyhed+5ZhBMxa
	UW4KmXHHIvGLX9hyxkqwnOmAqfEPzCisT5rBAPfACM+sUUNNtc1SS0i/0Tiell9ZRaX3mfLBgoO
	XnxTVL6qHufa64UbucVekI9Ll37RrTbL5aujyJ0/x0aV8IcS8KLJL4dgPJ6OQ0iQ5QlCuS92Ci4
	ly5iwjwOSTr8sq3R3oqtl24Cl+ceeRA+iVN4TYMbRJ5uy4XIJatkTfb3zzKEx1N9silZ5ptF6uq
	+
X-Google-Smtp-Source: AGHT+IElJ6bzFuyM/pSP5u9AllDzzrZUuMITibyohlqbbv+eRenSAoVF4bi3E9BpC3i9wIEQOj9V1g==
X-Received: by 2002:a05:600c:4e8e:b0:439:9909:c785 with SMTP id 5b1f17b1804b1-441b1f618f3mr6085885e9.7.1746001785148;
        Wed, 30 Apr 2025 01:29:45 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b9726fsm16193745e9.8.2025.04.30.01.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:29:44 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 30 Apr 2025 10:29:44 +0200
Message-Id: <D9JTZ6HH00KY.1B1SKH1Z0UI1S@ventanamicro.com>
Subject: Re: [PATCH 4/5] KVM: RISC-V: reset VCPU state when becoming
 runnable
Cc: "Anup Patel" <apatel@ventanamicro.com>, <kvm-riscv@lists.infradead.org>,
 <kvm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Atish Patra" <atishp@atishpatra.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Andrew Jones" <ajones@ventanamicro.com>, "Mayuresh
 Chitale" <mchitale@ventanamicro.com>
To: "Anup Patel" <anup@brainfault.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-7-rkrcmar@ventanamicro.com>
 <CAAhSdy0e3HVN6pX-hcX2N+kpwsupsCf6BqrYq=bvtwtFOuEVhA@mail.gmail.com>
 <D9IGJR9DGFAM.1PVHVOOTVRFZW@ventanamicro.com>
 <CAK9=C2Woc5MtrJeqNtaVkMXWEsGeZPsmUgtFQET=OKLHLwRbPA@mail.gmail.com>
 <D9J1TBKYC8YH.1OPUI289U0O2C@ventanamicro.com>
 <CAAhSdy01yBBfJwdTn90WeXFR85=1zTxuebFhi4CQJuOujVTHXg@mail.gmail.com>
 <D9J9DW53Q2GD.1PB647ISOCXRX@ventanamicro.com>
 <CAAhSdy0B-pF-jHmTXNYE7NXwdCWJepDtGR__S+P4MhZ1bfUERQ@mail.gmail.com>
 <CAAhSdy20pq3KvbCeST=h+O5PWfs2E4uXpX9BbbzE7GJzn+pzkA@mail.gmail.com>
In-Reply-To: <CAAhSdy20pq3KvbCeST=h+O5PWfs2E4uXpX9BbbzE7GJzn+pzkA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_012946_781077_E53F717B 
X-CRM114-Status: GOOD (  36.99  )
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

MjAyNS0wNC0zMFQxMDo1NjozNSswNTozMCwgQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz46Cj4gT24gV2VkLCBBcHIgMzAsIDIwMjUgYXQgOTo1MuKAr0FNIEFudXAgUGF0ZWwgPGFudXBA
YnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+Pgo+PiBPbiBUdWUsIEFwciAyOSwgMjAyNSBhdCA5OjUx
4oCvUE0gUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+
PiA+Cj4+ID4gMjAyNS0wNC0yOVQyMDozMToxOCswNTozMCwgQW51cCBQYXRlbCA8YW51cEBicmFp
bmZhdWx0Lm9yZz46Cj4+ID4gPiBPbiBUdWUsIEFwciAyOSwgMjAyNSBhdCAzOjU14oCvUE0gUmFk
aW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+PiA+ID4+Cj4+
ID4gPj4gMjAyNS0wNC0yOVQxMToyNTozNSswNTozMCwgQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRh
bmFtaWNyby5jb20+Ogo+PiA+ID4+ID4gT24gTW9uLCBBcHIgMjgsIDIwMjUgYXQgMTE6MTXigK9Q
TSBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4+ID4g
Pj4gPj4KPj4gPiA+PiA+PiAyMDI1LTA0LTI4VDE3OjUyOjI1KzA1OjMwLCBBbnVwIFBhdGVsIDxh
bnVwQGJyYWluZmF1bHQub3JnPjoKPj4gPiA+PiA+PiA+IE9uIFRodSwgQXByIDMsIDIwMjUgYXQg
NTowMuKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPiB3cm90
ZToKPj4gPiA+PiA+PiA+PiBGb3IgYSBjbGVhbmVyIHNvbHV0aW9uLCB3ZSBzaG91bGQgYWRkIGlu
dGVyZmFjZXMgdG8gcGVyZm9ybSB0aGUgS1ZNLVNCSQo+PiA+ID4+ID4+ID4+IHJlc2V0IHJlcXVl
c3Qgb24gdXNlcnNwYWNlIGRlbWFuZC4gIEkgdGhpbmsgaXQgd291bGQgYWxzbyBiZSBtdWNoIGJl
dHRlcgo+PiA+ID4+ID4+ID4+IGlmIHVzZXJzcGFjZSB3YXMgaW4gY29udHJvbCBvZiB0aGUgcG9z
dC1yZXNldCBzdGF0ZS4KPj4gPiA+PiA+PiA+Cj4+ID4gPj4gPj4gPiBBcGFydCBmcm9tIGJyZWFr
aW5nIEtWTSB1c2VyLXNwYWNlLCB0aGlzIHBhdGNoIGlzIGluY29ycmVjdCBhbmQKPj4gPiA+PiA+
PiA+IGRvZXMgbm90IGFsaWduIHdpdGggdGhlOgo+PiA+ID4+ID4+ID4gMSkgU0JJIHNwZWMKPj4g
PiA+PiA+PiA+IDIpIE9TIGJvb3QgcHJvdG9jb2wuCj4+ID4gPj4gPj4gPgo+PiA+ID4+ID4+ID4g
VGhlIFNCSSBzcGVjIG9ubHkgZGVmaW5lcyB0aGUgZW50cnkgc3RhdGUgb2YgY2VydGFpbiBDUFUg
cmVnaXN0ZXJzCj4+ID4gPj4gPj4gPiAobmFtZWx5LCBQQywgQTAsIGFuZCBBMSkgd2hlbiBDUFUg
ZW50ZXJzIFMtbW9kZToKPj4gPiA+PiA+PiA+IDEpIFVwb24gU0JJIEhTTSBzdGFydCBjYWxsIGZy
b20gc29tZSBvdGhlciBDUFUKPj4gPiA+PiA+PiA+IDIpIFVwb24gcmVzdW1pbmcgZnJvbSBub24t
cmV0ZW50aXZlIFNCSSBIU00gc3VzcGVuZCBvcgo+PiA+ID4+ID4+ID4gICAgIFNCSSBzeXN0ZW0g
c3VzcGVuZAo+PiA+ID4+ID4+ID4KPj4gPiA+PiA+PiA+IFRoZSBTLW1vZGUgZW50cnkgc3RhdGUg
b2YgdGhlIGJvb3QgQ1BVIGlzIGRlZmluZWQgYnkgdGhlCj4+ID4gPj4gPj4gPiBPUyBib290IHBy
b3RvY29sIGFuZCBub3QgYnkgdGhlIFNCSSBzcGVjLiBEdWUgdG8gdGhpcywgcmVhc29uCj4+ID4g
Pj4gPj4gPiBLVk0gUklTQy1WIGV4cGVjdHMgdXNlci1zcGFjZSB0byBzZXQgdXAgdGhlIFMtbW9k
ZSBlbnRyeQo+PiA+ID4+ID4+ID4gc3RhdGUgb2YgdGhlIGJvb3QgQ1BVIHVwb24gc3lzdGVtIHJl
c2V0Lgo+PiA+ID4+ID4+Cj4+ID4gPj4gPj4gV2UgY2FuIGhhbmRsZSB0aGUgaW5pdGlhbCBzdGF0
ZSBjb25zaXN0ZW5jeSBpbiBvdGhlciBwYXRjaGVzLgo+PiA+ID4+ID4+IFdoYXQgbmVlZHMgYWRk
cmVzc2luZyBpcyBhIHdheSB0byB0cmlnZ2VyIHRoZSBLVk0gcmVzZXQgZnJvbSB1c2Vyc3BhY2Us
Cj4+ID4gPj4gPj4gZXZlbiBpZiBvbmx5IHRvIGNsZWFyIHRoZSBpbnRlcm5hbCBLVk0gc3RhdGUu
Cj4+ID4gPj4gPj4KPj4gPiA+PiA+PiBJIHRoaW5rIG1wX3N0YXRlIGlzIGN1cnJlbnRseSB0aGUg
YmVzdCBzaWduYWxpemF0aW9uIHRoYXQgS1ZNIHNob3VsZAo+PiA+ID4+ID4+IHJlc2V0LCBzbyBJ
IGFkZGVkIGl0IHRoZXJlLgo+PiA+ID4+ID4+Cj4+ID4gPj4gPj4gV2hhdCB3b3VsZCBiZSB5b3Vy
IHByZWZlcnJlZCBpbnRlcmZhY2UgZm9yIHRoYXQ/Cj4+ID4gPj4gPj4KPj4gPiA+PiA+Cj4+ID4g
Pj4gPiBJbnN0ZWFkIG9mIGNyZWF0aW5nIGEgbmV3IGludGVyZmFjZSwgSSB3b3VsZCBwcmVmZXIg
dGhhdCBWQ1BVCj4+ID4gPj4gPiB3aGljaCBpbml0aWF0ZXMgU0JJIFN5c3RlbSBSZXNldCBzaG91
bGQgYmUgcmVzZXR0ZWQgaW1tZWRpYXRlbHkKPj4gPiA+PiA+IGluLWtlcm5lbCBzcGFjZSBiZWZv
cmUgZm9yd2FyZGluZyB0aGUgc3lzdGVtIHJlc2V0IHJlcXVlc3QgdG8KPj4gPiA+PiA+IHVzZXIg
c3BhY2UuCj4+ID4gPj4KPj4gPiA+PiBUaGUgaW5pdGlhdGluZyBWQ1BVIG1pZ2h0IG5vdCBiZSB0
aGUgYm9vdCBWQ1BVLgo+PiA+ID4+IEl0IHdvdWxkIGJlIHNhZmVyIHRvIHJlc2V0IGFsbCBvZiB0
aGVtLgo+PiA+ID4KPj4gPiA+IEkgbWVhbnQgaW5pdGlhdGluZyBWQ1BVIGFuZCBub3QgdGhlIGJv
b3QgVkNQVS4gQ3VycmVudGx5LCB0aGUKPj4gPiA+IG5vbi1pbml0aWF0aW5nIFZDUFVzIGFyZSBh
bHJlYWR5IHJlc2V0dGVkIGJ5IFZDUFUgcmVxdWVzdHMKPj4gPiA+IHNvIG5vdGhpbmcgc3BlY2lh
bCBuZWVkcyB0byBiZSBkb25lLgo+Pgo+PiBUaGVyZSBpcyBubyBkZXNpZ25hdGVkIGJvb3QgVkNQ
VSBmb3IgS1ZNIHNvIGxldCB1cyBvbmx5IHVzZSB0aGUKPj4gdGVybSAiaW5pdGlhdGluZyIgb3Ig
Im5vbi1pbml0aWF0aW5nIiBWQ1BVcyBpbiBjb250ZXh0IG9mIHN5c3RlbSByZXNldC4KClRoYXQg
aXMgZXhhY3RseSBob3cgSSB1c2UgaXQuICBTb21lIFZDUFUgd2lsbCBiZSB0aGUgYm9vdCBWQ1BV
ICh0aGUgVkNQVQptYWRlIHJ1bm5hYmxlIGJ5IEtWTV9TRVRfTVBfU1RBVEUpIGFuZCBsb2FkZWQg
d2l0aCBzdGF0ZSBmcm9tIHVzZXJzcGFjZS4KClJJU0MtViBkb2Vzbid0IGd1YXJhbnRlZSB0aGF0
IHRoZSBib290IFZDUFUgaXMgdGhlIHJlc2V0IGluaXRpYXRpbmcKVkNQVSwgc28gSSB0aGluayBL
Vk0gc2hvdWxkIGFsbG93IGl0LgoKPj4gPiBDdXJyZW50bHksIHdlIG1ha2UgdGhlIHJlcXVlc3Qg
b25seSBmb3IgVkNQVXMgYnJvdWdodCB1cCBieSBIU00gLS0gdGhlCj4+ID4gbm9uLWJvb3QgVkNQ
VXMuICBUaGVyZSBpcyBhIHNpbmdsZSBWQ1BVIG5vdCBiZWluZyByZXNldCBhbmQgcmVzZXR0aW5n
Cj4+ID4gdGhlIHJlc2V0IGluaXRpYXRpbmcgVkNQVSBjaGFuZ2VzIG5vdGhpbmcuIGUuZy4KPj4g
Pgo+PiA+ICAgMSkgVkNQVSAxIGluaXRpYXRlcyB0aGUgcmVzZXQgdGhyb3VnaCBhbiBlY2FsbC4K
Pj4gPiAgIDIpIEFsbCBWQ1BVcyBhcmUgc3RvcHBlZCBhbmQgcmV0dXJuIHRvIHVzZXJzcGFjZS4K
Pj4KPj4gV2hlbiBhbGwgVkNQVXMgYXJlIHN0b3BwZWQsIGFsbCBWQ1BVcyBleGNlcHQgVkNQVTEK
Pj4gKGluIHRoaXMgZXhhbXBsZSkgd2lsbCBTTEVFUCBiZWNhdXNlIHdlIGRvCj4+ICJrdm1fbWFr
ZV9hbGxfY3B1c19yZXF1ZXN0KHZjcHUtPmt2bSwgS1ZNX1JFUV9TTEVFUCkiCj4+IHNvIG5vbmUg
b2YgdGhlIFZDUFVzIGV4Y2VwdCBWQ1BVMSAoaW4gdGhpcyBjYXNlKSB3aWxsCj4+IHJldHVybiB0
byB1c2Vyc3BhY2UuCgpVc2Vyc3BhY2Ugc2hvdWxkIGJlIGFibGUgdG8gZG8gd2hhdGV2ZXIgaXQg
bGlrZXMgLS0gaW4gbXkgZXhhbXBsZSwgYWxsCnRoZSBWQ1BVcyBhcmUgYnJvdWdodCB0byB1c2Vy
c3BhY2UgYW5kIGEgZGlmZmVyZW50IGJvb3QgVkNQVSBpcwpzZWxlY3RlZC4KCihQZXJoYXBzIHVz
ZXJzcGFjZSB3YW50ZWQgdG8gcmVjb3JkIHRoZWlyIHJlc2V0IHByZS1yZXNldCBzdGF0ZSwgb3IK
IG1heWJlIGl0IHJlYWxseSB3YW50cyB0byBib290IHdpdGggYSBkZXNpZ25hdGVkIFZDUFUuKQoK
Pj4gPiAgIDMpIFVzZXJzcGFjZSBwcmVwYXJlcyBWQ1BVIDAgYXMgdGhlIGJvb3QgVkNQVS4KPj4g
PiAgIDQpIFZDUFUgMCBleGVjdXRlcyB3aXRob3V0IGdvaW5nIHRocm91Z2ggS1ZNIHJlc2V0IHBh
dGhzLgo+Pgo+PiBVc2Vyc3BhY2Ugd2lsbCBzZWUgYSBzeXN0ZW0gcmVzZXQgZXZlbnQgZXhpdCBm
b3IgdGhlCj4+IGluaXRpYXRpbmcgVkNQVSBieSB0aGF0IHRpbWUgYWxsIG90aGVyIFZDUFVzIGFy
ZSBhbHJlYWR5Cj4+IHNsZWVwaW5nIHdpdGggbXBfc3RhdGUgPT0gS1ZNX01QX1NUQVRFX1NUT1BQ
RUQuCj4+Cj4+ID4KPj4gPiBUaGUgcG9pbnQgb2YgdGhpcyBwYXRjaCBpcyB0byByZXNldCB0aGUg
Ym9vdCBWQ1BVLCBzbyB3ZSByZXNldCB0aGUgVkNQVQo+PiA+IHRoYXQgaXMgbWFkZSBydW5uYWJs
ZSBieSB0aGUgS1ZNX1NFVF9NUF9TVEFURSBJT0NUTC4KPj4KPj4gTGlrZSBJIHNhaWQgYmVmb3Jl
LCB3ZSBkb24ndCBuZWVkIHRvIGRvIHRoaXMuIFRoZSBpbml0aWF0aW5nIFZDUFUKPj4gY2FuIGJl
IHJlc2V0dGVkIGp1c3QgYmVmb3JlIGV4aXRpbmcgdG8gdXNlciBzcGFjZSBmb3Igc3lzdGVtIHJl
c2V0Cj4+IGV2ZW50IGV4aXQuCgpZb3UgYXNzdW1lIGluaXRpYXRpbmcgVkNQVSA9PSBib290IFZD
UFUuCgpXZSBzaG91bGQgcHJldmVudCBLVk1fU0VUX01QX1NUQVRFIElPQ1RMIGZvciBhbGwgbm9u
LWluaXRpYXRpbmcgVkNQVXMgaWYKd2UgZGVjaWRlIHRvIGFjY2VwdCB0aGUgYXNzdW1wdGlvbi4K
CkknZCByYXRoZXIgY2hvb3NlIGEgZGlmZmVyZW50IGRlc2lnbiwgdGhvdWdoLgoKSG93IGFib3V0
IGEgbmV3IHVzZXJzcGFjZSBpbnRlcmZhY2UgZm9yIElPQ1RMIHJlc2V0PwooQ2FuIGJlIGNhcGFi
aWxpdHkgdG9nZ2xlIGZvciBLVk1fU0VUX01QX1NUQVRFIG9yIGEgc3RyYWlnaHQgbmV3IElPQ1RM
LikKClRoYXQgd291bGRuJ3QgImZpeCIgY3VycmVudCB1c2Vyc3BhY2VzLCBidXQgd291bGQgc2ln
bmlmaWNhbnRseSBpbXByb3ZlCnRoZSBzYW5pdHkgb2YgdGhlIEtWTSBpbnRlcmZhY2UuCgo+IEJl
bG93IGlzIHdoYXQgSSBhbSBzdWdnZXN0aW5nLiBUaGlzIGNoYW5nZSBjb21wbGV0ZWx5IHJlbW92
ZXMKPiBkZXBlbmRlbmN5IG9mIGt2bV9zYmlfaHNtX3ZjcHVfc3RhcnQoKSBvbiAicmVzZXQiIHN0
cnVjdHVyZXMuCgpJJ2Qga2VlcCB0aGUgcmVzZXQgc3RydWN0dXJlIGluIHRoaXMgc2VyaWVzIC0t
IGl0J3Mgc21hbGwgZW5vdWdoIGFuZApsb2NrbGVzc2x5IGFjY2Vzc2luZyB0aGUgc3RhdGUgb2Yg
YW5vdGhlciBWQ1BVIG5lZWRzIGEgbG90IG9mCmNvbnNpZGVyYXRpb24gdG8gcHJldmVudCBhbGwg
cG9zc2libGUgcmFjZSBjb25kaXRpb25zLgoKVGhhbmtzLgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5n
IGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
