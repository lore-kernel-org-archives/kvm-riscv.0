Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8F3C5AC7A
	for <kvm-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 16:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NEqdM9WbZBgZHHTlxVapsgmFgNF+ErsjmNE3svjxjP4=; b=2onSjNv1nhpSzl
	tNIyTJ4a7+2mt2CxrROeXb/tCh5/SPT2ymO9HCeYross9tCTEIYx4083dTUmiZhRLlVP9s/FW2ITr
	koLdoevJp4N9CiBUhfnnGL2LDfh69DGehm+c8mBWbKhma+v1dkOsujhuruYjY70QQ7BEHIa3L2dhy
	Un1xC98Le/2roGQroTISNEO5/2f/gud8VYb5cIHqupE2DviziH5y3ngFjOe+sH5Sc9wJINPvaC1vk
	rOXakFLy082oV9GBkr2hbjZknWzBsSYRGfnzUOa2oijRkcjVDuO2wNjX0ysJn/6Yl6ejrj4NdqrBz
	QPKtkChAIPMjxxFavFSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNcZ-00000008RUz-0RRY;
	Fri, 07 Aug 2026 16:40:35 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNcV-00000008RTV-34fl
	for kvm-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 16:40:33 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so38187875e9.2
        for <kvm-riscv@lists.infradead.org>; Fri, 07 Aug 2026 09:40:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786120828; cv=none;
        d=google.com; s=arc-20260327;
        b=lj9Ks5PYENp9/7zXFPmZgc4Z0aFGwJL7YqaYYjzHrN7oNEsObFQXyEawc2z+RTdJZe
         vXwK/dP8g1My5X3MlQUzO7uKVH7Rt6SbnHUoImwVZcnHThzNyd4qsx9lbtCDjMyHYuFL
         QU4oA/HQwC2avJVtqX1pB2dS0c+EjjNLNK64F20qo1QPBfSRCyE2D4fTB2yxbvs3uduk
         6eU812giWYqGNRNE4/q4wmqwhDCTYyQxWSegz2WwwPnVqeD3YZbD70vGLuTYrleDpXVu
         tcNuCfsM3aH3gDgFpp/eRE75JAxgXl1cEJmXF3Va0eVwIQ5Gs62wpNODXd0K5WYs0LGs
         DYwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GSyds6W5OQ66XFXpi1LlEJdTPFK3iE4acomSvTp9bj8=;
        fh=gqKkhKehkNG+i1HWNUxV7a8ptlQQZdGVjF3GJw/3q4I=;
        b=qqTwSHH7rihsx7Fbtl4Jx3ecFZrvcY1VZFt12AVW2hv9xEoPMb639qNpUjPwsWzU9G
         0N+EVWMBktIe8obLz/XC6lXo9n+/InHavHTCt/jQqWuX3KXFHCtrR/GDz15Zx1h5dPx0
         fDnVu1AgjQCz5ng+mMRvJ1Q5F4RdOREYTKNF68AFtHLcHq5GVpHrZauy25aarPSHE+ts
         AkT64zKtPtB6B8q0J0MXLSOgZ2MiUAIJc6IwekdBQ4Ne4SfGzC75N45EkmfqKa6I3GlT
         s84juFYFW1ZUAWdz+434w7nRvLqm6pLckSBYFGWrQzfitKBA3H73mVbJQ2Lke+C0aQBf
         h9Yw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1786120828; x=1786725628; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GSyds6W5OQ66XFXpi1LlEJdTPFK3iE4acomSvTp9bj8=;
        b=FoHtLLC7bg12D6+Fgc3tjnAtu65EF7AVgyeyRUEn59+B7FSBix6SkV0fuzbLZqSlvs
         hhecM2jJcj4JoESQswApJRElQAUTfrbwp0205nJYTtMf5XfE7sX+SDXqpL2Xidh1329S
         ped1xSLXQB7fTcLs5gxVV6Yinu5VzPupx/ROy7lU/5TQU3SqB4V02CF7mSI5/CfYr4bB
         VuBhNOJyeetPMfA37UUu2rz09oSQlbjeItEmGcgCXUBYs4bTg++A4gIUCE3Yz3G5isZa
         VAQ/9yPXtBMPOA0fF2vRpP1S2OO9HnULuTSvjdz+fKNahqDciRJYTT3X8tx3N9RWjIsX
         XOUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786120828; x=1786725628;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GSyds6W5OQ66XFXpi1LlEJdTPFK3iE4acomSvTp9bj8=;
        b=TBsNu5xhDPnZEo4QkIwT/kVq1omHqzonX8J6NZ8Rb65XD+hsIoePdkFc3P2dIPldI2
         PSTuwj5y2khqreCCnrXJTOIg1rAiwC7cISOP7pXTXt2VQHBwDQbzRBA3qwBlVC/I2XPr
         WP6FGYGsGSlg3Isr2irQTQjzrsqnrWX4Gpc1Q98ZGm6s121SoXbSnKQlqSa5GNB+7xDW
         Fq55x+qiQSKXB0FzlJ9c/y03bOThUWIssQ3cl63CmErz38suiUjtbamhMwBVB/eGZ6hP
         ohZ4o5VRBVyt76thuzfiTBJgRVJwkoOEM2kscoV+Ez9LsL/JiBVQuNqYDYQKFF9RMTrj
         uMmQ==
X-Forwarded-Encrypted: i=1; AHgh+RqUuuZgUqTTeXHydgSw+I0TlW9Ja4rOljePGUfDrM5rAWH8xasQlyL+fLcBG4UAGT1vKm/eJn/34u8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyzB85xia9pyIgCsMG8wybtV4LqnD8pykS4WzkC3DIaZt2DkuZk
	Cp+1+yyi4kxeyB/S5KcUWrtZe/S9fWdKKFaGUf/EDoRrZ2fYU2cmQ7ICHpXo63ALOhtE9gLLTR6
	McdQPkLu5YczTvSvHSfAPgXXyvU0pEuZ+q1Lelbxf/TlIsHcONCjusTk=
X-Gm-Gg: AR+sD10zf+UTkT7Ok65aiffewzFoYoC9mAlohWvND0XZ5nenmlVP4Tw+xvez+rHImVZ
	Xuvn8QDfaNJEn16TtuICkFOOqtcD2sqhmsdW+ZUzNo2rlzh71FLXG7aL7MX8NdieyNnMzRFHODb
	SPmWcJKKfiOg/Lt+AfbM7fVF5d/SYFFlnJv7TM/dNPtbcoCfpg48icMMwClAtm4Pqzh+KMKce9e
	D2oZcWIfzHsthZohL1Et/M/xDILJ4ibvh4fpNGO/guzx3lbYjieN0TnwiJZJjB7D81f6rszsKkG
	l8tazY5xqvx1UAw6JQXCVAB1rpMMe1mVjQB9buyae2oosb0a+6LTKvADto72iGLOh4jJhxHgK9+
	8d0mGrusaeYi+ekDhaarJl0Rwp0Ql9+wVMegdR26gS6HF33VjjiDjEHYt/IAG7Aj0
X-Received: by 2002:a05:600c:3545:b0:499:52dd:c1f0 with SMTP id
 5b1f17b1804b1-49952ddd05amr206480125e9.1.1786120828407; Fri, 07 Aug 2026
 09:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260717080654.877151-1-wang.yechao255@zte.com.cn>
In-Reply-To: <20260717080654.877151-1-wang.yechao255@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 7 Aug 2026 22:10:16 +0530
X-Gm-Features: AUfX_mzs5xvuhUuNS2PSxFtD2Spckea2gbhirvVXYUtFbIp9N-L4RwLlBOai4MM
Message-ID: <CAAhSdy1g5Qa0OVUyjfz4c+bySkcXyk12LcSnsuDUOCCQo=7_ZQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Improve dirty log clearing by skipping zero
 bits in mask
To: Wang Yechao <wang.yechao255@zte.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_094031_838345_96C43A76 
X-CRM114-Status: GOOD (  29.55  )
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

T24gRnJpLCBKdWwgMTcsIDIwMjYgYXQgMTozOeKAr1BNIFdhbmcgWWVjaGFvIDx3YW5nLnllY2hh
bzI1NUB6dGUuY29tLmNuPiB3cm90ZToKPgo+IFRoZSBleGlzdGluZyBrdm1fcmlzY3ZfZ3N0YWdl
X3dwX3JhbmdlKCkgd2Fsa3MgdGhlIGVudGlyZSBbc3RhcnQsIGVuZCkKPiByYW5nZSB0byBhcHBs
eSB3cml0ZSBwcm90ZWN0aW9uIGZvciBkaXJ0eSBsb2cgY2xlYXJpbmcsIGV2ZW4gd2hlbiB0aGUK
PiBwcm92aWRlZCBtYXNrIGhhcyB6ZXJvIGJpdHMgKGkuZS4sIG1hbnkgR0ZOcyBkbyBub3QgbmVl
ZCBwcm90ZWN0aW9uKS4KPiBUaGlzIGxlYWRzIHRvIHVubmVjZXNzYXJ5IHBhZ2UgdGFibGUgd2Fs
a3Mgd2hlbiB0aGUgbWFzayBpcyBzcGFyc2UuCj4KPiBSZXBsYWNlIHRoZSByYW5nZS1iYXNlZCBh
cHByb2FjaCB3aXRoIGEgbmV3IGZ1bmN0aW9uCj4ga3ZtX3Jpc2N2X2dzdGFnZV93cF9wdF9tYXNr
ZWQoKSB0aGF0IGl0ZXJhdGVzIG9ubHkgb3ZlciB0aGUgc2V0IGJpdHMgaW4KPiB0aGUgbWFzay4g
Rm9yIGVhY2ggc2V0IGJpdCwgaXQgbG9va3MgdXAgdGhlIGxlYWYgUFRFIGFuZCBhcHBsaWVzIHdy
aXRlCj4gcHJvdGVjdGlvbi4gT25jZSBhIGh1Z2UgcGFnZSBpcyBlbmNvdW50ZXJlZCwgdGhlIGVu
dGlyZSBodWdlLXBhZ2UgcmFuZ2UKPiBpcyBwcm9jZXNzZWQgaW4gb25lIGdvLCBhbmQgdGhlIGNv
cnJlc3BvbmRpbmcgYml0cyBpbiB0aGUgbWFzayBhcmUgY2xlYXJlZAo+IHVzaW5nIGJpdG1hcF9j
bGVhcigpLgo+Cj4gUGVyZm9ybWFuY2Ugd2FzIG1lYXN1cmVkIHdpdGggS1ZNIHNlbGZ0ZXN0cyBk
aXJ0eV9sb2dfcGVyZl90ZXN0IG9uIGEKPiBTcGFjZW1pdCBrMyBob3N0IHdpdGggdGhlIGZvbGxv
d2luZyBjb25maWd1cmF0aW9uOgo+IC0gdkNQVXM6IDIgKC12IDIpCj4gLSBNZW1vcnk6IDFHQiAo
LWIgMUcpCj4gLSBJdGVyYXRpb25zOiAzICgtaSAzKQo+IC0gV3JpdGUgcGVyY2VudGFnZSB2YXJp
ZWQgdmlhIC13IHBhcmFtZXRlciB0byBzaW11bGF0ZSBkaWZmZXJlbnQKPiAgIGRpcnR5IG1hc2sg
ZGVuc2l0aWVzLgo+Cj4gVGhlIGZvbGxvd2luZyBkYXRhIHNob3dzIHRoZSB0aW1lIHNwZW50IGlu
IHRoZSBjbGVhci1kaXJ0eS1sb2cgcGhhc2UKPiAoaS5lLiwgdGhlIEtWTV9DTEVBUl9ESVJUWV9M
T0cgaW9jdGwpIHVuZGVyIGVhY2ggY29uZmlndXJhdGlvbi4KPgo+ICstLS0tLS0tLS0tLS0tLS0t
LS0rLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tKwo+
IHwgV3JpdGUgUGVyY2VudGFnZSB8IE9yaWdpbmFsIChzKSAgICAgfCBQYXRjaGVkIChzKSAgICAg
IHwgSW1wcm92ZW1lbnQgfAo+ICstLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0t
Ky0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tKwo+IHwgMTAlICAgICAgICAgICAgICB8
IDAuMDEyOTA1ICAgICAgICAgfCAwLjAwOTIxMyAgICAgICAgIHwgKzI4LjYlICAgICAgfAo+IHwg
MzAlICAgICAgICAgICAgICB8IDAuMDE0MjE3ICAgICAgICAgfCAwLjAxMDI4NyAgICAgICAgIHwg
KzI3LjYlICAgICAgfAo+IHwgNTAlICAgICAgICAgICAgICB8IDAuMDE0NjA2ICAgICAgICAgfCAw
LjAxMTc3MiAgICAgICAgIHwgKzE5LjQlICAgICAgfAo+IHwgNzAlICAgICAgICAgICAgICB8IDAu
MDE0NzM1ICAgICAgICAgfCAwLjAxMzE5OSAgICAgICAgIHwgKzEwLjQlICAgICAgfAo+IHwgMTAw
JSAgICAgICAgICAgICB8IDAuMDE0NzU5ICAgICAgICAgfCAwLjAxNTI5NCAgICAgICAgIHwgLTMu
NiUgICAgICAgfAo+ICstLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0t
LS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tKwo+Cj4gVGhlIHBlcmZvcm1hbmNlIGltcHJvdmVt
ZW50IGlzIG1vc3Qgc2lnbmlmaWNhbnQgd2hlbiB0aGUgZGlydHkgbWFzayBpcwo+IHNwYXJzZSAo
bG93IHdyaXRlIHBlcmNlbnRhZ2UpLCB3aGljaCBpcyBjb21tb24gaW4gcmVhbC13b3JsZCBzY2Vu
YXJpb3MKPiB3aXRoIGxvdyB0byBtb2RlcmF0ZSBtZW1vcnkgd3JpdGUgaW50ZW5zaXR5LiBJbiB0
aGUgd29yc3QtY2FzZSBzY2VuYXJpbwo+IHdoZXJlIHRoZSBtYXNrIGlzIGZ1bGx5IHNldCAoMTAw
JSB3cml0ZSksIHRoZSBvcHRpbWl6YXRpb24gaW50cm9kdWNlcwo+IGEgc2xpZ2h0IDMuNiUgb3Zl
cmhlYWQgZHVlIHRvIHRoZSBhZGRpdGlvbmFsIGJpdCBvcGVyYXRpb25zLCB3aGljaCBpcwo+IGFj
Y2VwdGFibGUgZ2l2ZW4gdGhlIHN1YnN0YW50aWFsIGdhaW5zIGluIGNvbW1vbiBjYXNlcy4KPgo+
IFRoaXMgY2hhbmdlIHNpZ25pZmljYW50bHkgcmVkdWNlcyB0aGUgbnVtYmVyIG9mIHBhZ2UtdGFi
bGUgd2Fsa3Mgd2hlbgo+IHRoZSBkaXJ0eSBtYXNrIGhhcyBtYW55IHplcm8gYml0cywgaW1wcm92
aW5nIHRoZSBlZmZpY2llbmN5IG9mCj4gS1ZNX0NMRUFSX0RJUlRZX0xPRyBhbmQgcmVsYXRlZCBp
b2N0bHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBXYW5nIFllY2hhbyA8d2FuZy55ZWNoYW8yNTVAenRl
LmNvbS5jbj4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0
Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC03LjMKClRoYW5rcywKQW51cAoKCj4g
LS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oIHwgIDMgKysKPiAgYXJj
aC9yaXNjdi9rdm0vZ3N0YWdlLmMgICAgICAgICAgICAgfCA1OSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2t2bS9tbXUuYyAgICAgICAgICAgICAgICB8ICAyICst
Cj4gIDMgZmlsZXMgY2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9rdm1fZ3N0YWdlLmgKPiBpbmRleCAyMWUyMDE5ZGYwY2YuLjUwYzc0
NTI3ZGRkMiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9nc3RhZ2Uu
aAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oCj4gQEAgLTgyLDYg
KzgyLDkgQEAgYm9vbCBrdm1fcmlzY3ZfZ3N0YWdlX3VubWFwX3JhbmdlKHN0cnVjdCBrdm1fZ3N0
YWdlICpnc3RhZ2UsCj4KPiAgYm9vbCBrdm1fcmlzY3ZfZ3N0YWdlX3dwX3JhbmdlKHN0cnVjdCBr
dm1fZ3N0YWdlICpnc3RhZ2UsIGdwYV90IHN0YXJ0LCBncGFfdCBlbmQpOwo+Cj4gK2Jvb2wga3Zt
X3Jpc2N2X2dzdGFnZV93cF9wdF9tYXNrZWQoc3RydWN0IGt2bV9nc3RhZ2UgKmdzdGFnZSwgZ2Zu
X3QgYmFzZV9nZm4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBsb25nIG1hc2spOwo+ICsKPiAgdm9pZCBrdm1fcmlzY3ZfZ3N0YWdlX21vZGVfZGV0ZWN0KHZv
aWQpOwo+Cj4gIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBrdm1fcmlzY3ZfZ3N0YWdlX21v
ZGUodW5zaWduZWQgbG9uZyBwZ2RfbGV2ZWxzKQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2
bS9nc3RhZ2UuYyBiL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCj4gaW5kZXggYzRjM2I3OTU2N2Yx
Li45YWY4NmIxYzVlM2MgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMKPiAr
KysgYi9hcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYwo+IEBAIC00NzIsNiArNDcyLDY1IEBAIGJvb2wg
a3ZtX3Jpc2N2X2dzdGFnZV93cF9yYW5nZShzdHJ1Y3Qga3ZtX2dzdGFnZSAqZ3N0YWdlLCBncGFf
dCBzdGFydCwgZ3BhX3QgZW5kCj4gICAgICAgICByZXR1cm4gZmx1c2g7Cj4gIH0KPgo+ICtzdGF0
aWMgaW5saW5lIHZvaWQgY2xlYXJfaHVnZV9tYXNrKHVuc2lnbmVkIGxvbmcgKm1hc2ssIHVuc2ln
bmVkIGxvbmcgcGFnZV9zaXplLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Z2ZuX3QgYmFzZV9nZm4sIGdwYV90IGFkZHIpCj4gK3sKPiArICAgICAgIHVuc2lnbmVkIGxvbmcg
c3RhcnRfaW5kZXggPSAwOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBlbmRfaW5kZXggPSBCSVRT
X1BFUl9MT05HIC0gMTsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgZW5kX2dmbiA9IGJhc2VfZ2Zu
ICsgZW5kX2luZGV4Owo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBhbGlnbmVkX3N0YXJ0X2dmbiA9
IGFkZHIgPj4gUEFHRV9TSElGVDsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgYWxpZ25lZF9lbmRf
Z2ZuID0gYWxpZ25lZF9zdGFydF9nZm4gKyAocGFnZV9zaXplID4+IFBBR0VfU0hJRlQpIC0gMTsK
PiArICAgICAgIHVuc2lnbmVkIGludCBuYml0cyA9IDA7Cj4gKwo+ICsgICAgICAgaWYgKGFsaWdu
ZWRfc3RhcnRfZ2ZuID4gYmFzZV9nZm4pCj4gKyAgICAgICAgICAgICAgIHN0YXJ0X2luZGV4ID0g
YWxpZ25lZF9zdGFydF9nZm4gLSBiYXNlX2dmbjsKPiArCj4gKyAgICAgICBpZiAoYWxpZ25lZF9l
bmRfZ2ZuIDwgZW5kX2dmbikKPiArICAgICAgICAgICAgICAgZW5kX2luZGV4ID0gYWxpZ25lZF9l
bmRfZ2ZuIC0gYmFzZV9nZm47Cj4gKwo+ICsgICAgICAgbmJpdHMgPSBlbmRfaW5kZXggLSBzdGFy
dF9pbmRleCArIDE7Cj4gKyAgICAgICBiaXRtYXBfY2xlYXIobWFzaywgc3RhcnRfaW5kZXgsIG5i
aXRzKTsKPiArfQo+ICsKPiArYm9vbCBrdm1fcmlzY3ZfZ3N0YWdlX3dwX3B0X21hc2tlZChzdHJ1
Y3Qga3ZtX2dzdGFnZSAqZ3N0YWdlLCBnZm5fdCBiYXNlX2dmbiwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbWFzaykKPiArewo+ICsgICAgICAgdW5z
aWduZWQgbG9uZyBwYWdlX3NpemU7Cj4gKyAgICAgICBib29sIGZsdXNoID0gZmFsc2U7Cj4gKyAg
ICAgICBib29sIGZvdW5kX2xlYWY7Cj4gKyAgICAgICB1MzIgcHRlcF9sZXZlbDsKPiArICAgICAg
IHB0ZV90ICpwdGVwOwo+ICsgICAgICAgZ3BhX3QgYWRkciA9IDA7Cj4gKyAgICAgICBpbnQgcmV0
Owo+ICsKPiArICAgICAgIHdoaWxlIChtYXNrKSB7Cj4gKyAgICAgICAgICAgICAgIGFkZHIgPSAo
YmFzZV9nZm4gKyBfX2ZmcyhtYXNrKSkgPDwgUEFHRV9TSElGVDsKPiArCj4gKyAgICAgICAgICAg
ICAgIGZvdW5kX2xlYWYgPSBrdm1fcmlzY3ZfZ3N0YWdlX2dldF9sZWFmKGdzdGFnZSwgYWRkciwg
JnB0ZXAsICZwdGVwX2xldmVsKTsKPiArICAgICAgICAgICAgICAgcmV0ID0gZ3N0YWdlX2xldmVs
X3RvX3BhZ2Vfc2l6ZShnc3RhZ2UsIHB0ZXBfbGV2ZWwsICZwYWdlX3NpemUpOwo+ICsgICAgICAg
ICAgICAgICBpZiAocmV0KQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICsKPiAr
ICAgICAgICAgICAgICAgaWYgKGZvdW5kX2xlYWYpIHsKPiArICAgICAgICAgICAgICAgICAgICAg
ICBpZiAocHRlcF9sZXZlbCkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWRk
ciA9IEFMSUdOX0RPV04oYWRkciwgcGFnZV9zaXplKTsKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNsZWFyX2h1Z2VfbWFzaygmbWFzaywgcGFnZV9zaXplLCBiYXNlX2dmbiwgYWRk
cik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgfQo+ICsKPiArICAgICAgICAgICAgICAgICAg
ICAgICBmbHVzaCB8PSBrdm1fcmlzY3ZfZ3N0YWdlX29wX3B0ZShnc3RhZ2UsIGFkZHIsIHB0ZXAs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcHRlcF9sZXZlbCwgR1NUQUdFX09QX1dQKTsKPiArCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgaWYgKHB0ZXBfbGV2ZWwpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250
aW51ZTsKPiArICAgICAgICAgICAgICAgfQo+ICsKPiArICAgICAgICAgICAgICAgLyogY2xlYXIg
dGhlIGZpcnN0IHNldCBiaXQqLwo+ICsgICAgICAgICAgICAgICBtYXNrICY9IG1hc2sgLSAxOwo+
ICsgICAgICAgfQo+ICsKPiArICAgICAgIHJldHVybiBmbHVzaDsKPiArfQo+ICsKPiAgdm9pZCBf
X2luaXQga3ZtX3Jpc2N2X2dzdGFnZV9tb2RlX2RldGVjdCh2b2lkKQo+ICB7Cj4gICNpZmRlZiBD
T05GSUdfNjRCSVQKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vbW11LmMgYi9hcmNoL3Jp
c2N2L2t2bS9tbXUuYwo+IGluZGV4IDA4MmY5YjI2MTczMy4uN2VhYjU4ZmY2M2Y5IDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vbW11LmMK
PiBAQCAtMTEwLDcgKzExMCw3IEBAIHZvaWQga3ZtX2FyY2hfbW11X2VuYWJsZV9sb2dfZGlydHlf
cHRfbWFza2VkKHN0cnVjdCBrdm0gKmt2bSwKPgo+ICAgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9p
bml0KCZnc3RhZ2UsIGt2bSk7Cj4KPiAtICAgICAgIGZsdXNoID0ga3ZtX3Jpc2N2X2dzdGFnZV93
cF9yYW5nZSgmZ3N0YWdlLCBzdGFydCwgZW5kKTsKPiArICAgICAgIGZsdXNoID0ga3ZtX3Jpc2N2
X2dzdGFnZV93cF9wdF9tYXNrZWQoJmdzdGFnZSwgYmFzZV9nZm4sIG1hc2spOwo+ICAgICAgICAg
aWYgKGZsdXNoKQo+ICAgICAgICAgICAgICAgICBrdm1fZmx1c2hfcmVtb3RlX3RsYnNfcmFuZ2Uo
a3ZtLCBzdGFydCA+PiBQQUdFX1NISUZULAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgKGVuZCAtIHN0YXJ0KSA+PiBQQUdFX1NISUZUKTsKPiAtLQo+IDIuMjcu
MAo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNj
dgo=
