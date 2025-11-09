Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0661DCD1288
	for <kvm-riscv@archiver.kernel.org>; Sun,  9 Nov 2025 07:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sfQXdZ8XJD/mSlLhsepy3LN0b4CXFL2kUNqcuG0G0fg=; b=1OaxfyxXqO8W3e
	FHbKXskreOafZBZBwc4sDy1wrxQevL+qEjy6IGuurUL6uv3wBz0EdSOoy8di4bwmbRWAM9jRZEaCE
	O1zNONJv23DsF38/Dsz80oFpnwSl3ZZFL56/tc34gMqOW+vQeqPQ+ynnMpfQxghPU+kDXHqsBD5Ul
	XwUS+j97QuW2XUboz4Z2cKGQ2zYArwCOyzGXvvD37iipW/4eVlRW+9k8FOBoqHa54b3SZRyVTYlU4
	9IUoi/c+K9yw01SbQcFkSGZiuWOkbMxxL9TJ8qZu2+hRYcRLqfMPnSOQOOAFIGZZTs5f+eprprqtq
	vMDnPt747PxrszEX0GHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHzWS-00000003pb9-0DbM;
	Sun, 09 Nov 2025 07:07:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHzWM-00000003paJ-2WT3
	for kvm-riscv@lists.infradead.org;
	Sun, 09 Nov 2025 07:07:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762672048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QHvKsjMe/AixpxnbJYjrVGK6zy8xknqlwpjxpwPDfNM=;
	b=XGUl+MxXhAYGJHK8CJuSIJ899TOuTBoSIKbNXRG/Nsi+x4l1B9qABVrQqHUX/ICKI7QLld
	3AS5L8GHWifcALfRIAhGK8Vd6/6reF9IvOhJCC/VvCUAbgBH5NP+bxbxQ1lPTxzs5Xsff+
	DTlJFS8w6HSvfMRV2QPOKoKMFw44MRg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-ROIyfUi-PD-UmhGT8dkCCQ-1; Sun, 09 Nov 2025 02:07:25 -0500
X-MC-Unique: ROIyfUi-PD-UmhGT8dkCCQ-1
X-Mimecast-MFC-AGG-ID: ROIyfUi-PD-UmhGT8dkCCQ_1762672044
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-429c7b0ae36so953694f8f.0
        for <kvm-riscv@lists.infradead.org>; Sat, 08 Nov 2025 23:07:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762672044; x=1763276844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QHvKsjMe/AixpxnbJYjrVGK6zy8xknqlwpjxpwPDfNM=;
        b=AeQxR5Uts+J1bBk/lABjc8JjrQIebMIPMQobbEQQIfsg23zNTwZmn65BqFwZ+1HmoX
         CET+otzUvF/98de2ZOurp7YzzhPnyxHY6opD/wy5LfrecB2VTa+A1rb157aqg4ScL3q7
         hFjiuJiplWg5lh/pZN7aXoPBr53yf4mDp5Mn48bqXC7CBPQ4iAyrldQUWlyasW/LbPnM
         6Xkcd91Any7RmyfZGmrJ6/bRRQIdI5SCi+vO1PYSF4KYFBRUcsyXNhpXKbr0oNXMH8eU
         yQHiEv5+Hss8U+nFAXu7JXuQSrnSDFJdVnRjttREyyGmVqLadnO8kmll/mba7PolukqP
         ZX4w==
X-Forwarded-Encrypted: i=1; AJvYcCWBah3o1NIIzLHeR653J7u5ewbptxwhM+7FSJvK+Uhgqi23lihgbaMEh5XBwCzVdO+Eo+N0Gs0Jdzk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0MYp1iVB8rDeEld3LCxuHBa3mvhN9iiDTjfWVkAdRXqezUH5K
	Qjz/7TjXs/tQK7iJgdaUglbnoat6iCMD55RW+OWCAirFWiA7+lXfBKaJ2+qweE3PQ7+M83EGbx2
	3oivHuT4Gp10UQ8Y5FWNaBzJZUKdbc4NEcjdGabC1okJYzGA/CY49lWm3uJ4FLNRyq2tjWcQA6m
	4Cb8vm8ZRSOvbaWS5wprA2EbiMxOdn/Od8LFs77rY1HQ==
X-Gm-Gg: ASbGncv/wtDQOy7HGtx13cZEzhk6DDi3IC2jAQ1e8M5QC6DPRJnlKZ2Iv6Z1TTtRy46
	/BBLDASOX4ez39eVfcS30cfK6XrffGz0bBYdanh5OQgBWeVWFRnWqQycZNX/lKHagN0LO22vHp/
	C2pDXP/chw95i4iT53HlqlZqTX5LNj3zJrJvc52t9TcN9DdPMmGCYUTkRZE2yUtwiwStAXjKYXV
	E0tmAtSiIkpy2VG24LnkzkHjgePIkh+ExY0BwwUyEoDLuvuuejAEttQKn38
X-Received: by 2002:a5d:5f51:0:b0:42b:2dc9:437d with SMTP id ffacd0b85a97d-42b2dc945bemr3340225f8f.8.1762672044541;
        Sat, 08 Nov 2025 23:07:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlgHVVqddTf0z9GBTwc7IKuQZJE4lbbt4jIACSUKr9tRwMh48mz2VQwkxk817nUPP85PYqX+H4iU6UOxhzr7A=
X-Received: by 2002:a5d:5f51:0:b0:42b:2dc9:437d with SMTP id
 ffacd0b85a97d-42b2dc945bemr3340209f8f.8.1762672044139; Sat, 08 Nov 2025
 23:07:24 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy1jcXypH3yCUBaci2EbOy2cbr2qNtdYriKa-vcyFFeCzg@mail.gmail.com>
In-Reply-To: <CAAhSdy1jcXypH3yCUBaci2EbOy2cbr2qNtdYriKa-vcyFFeCzg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sun, 9 Nov 2025 08:07:12 +0100
X-Gm-Features: AWmQ_bnx7mWPxNcnsLGyK7FcbtNdFOMyOYxt5lXfFl9U8cdhZMTbepfHl2tYedU
Message-ID: <CABgObfYYc1MTR6MFjVWfXKu6tOe0iVY-dh9OnGU_6RvF1fCMeg@mail.gmail.com>
Subject: Re: [GIT PULL v2] KVM/riscv fixes for 6.18 take #2
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vw38FEMGnPTWeAssOtTXjot6RdbYaaVL-TmiNBayx10_1762672044
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_230730_980637_AE5F81F0 
X-CRM114-Status: GOOD (  14.78  )
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

T24gU2F0LCBPY3QgMjUsIDIwMjUgYXQgMTI6MTTigK9QTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPiB3cm90ZToKPgo+IEhpIFBhb2xvLAo+Cj4gV2UgaGF2ZSB0aHJlZSBmaXhlcyBm
b3IgdGhlIDYuMTgga2VybmVsLiBUd28gb2YgdGhlc2UKPiBhcmUgcmVsYXRlZCB0byBjaGVja2lu
ZyBwZW5kaW5nIGludGVycnVwdHMgd2hlcmVhcwo+IHRoZSB0aGlyZCBvbmUgcmVtb3ZlcyBhdXRv
bWF0aWMgSS9PIG1hcHBpbmcgZnJvbQo+IGt2bV9hcmNoX3ByZXBhcmVfbWVtb3J5X3JlZ2lvbigp
Lgo+Cj4gUGxlYXNlIHB1bGwuCgpQdWxsZWQsIHRoYW5rcy4KClBhb2xvCgo+Cj4gUmVnYXJkcywK
PiBBbnVwCj4KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDNhODY2MDg3ODgz
OWZhYWRiNGYxYTZkZDcyYzMxNzljMWRmNTY3ODc6Cj4KPiAgIExpbnV4IDYuMTgtcmMxICgyMDI1
LTEwLTEyIDEzOjQyOjM2IC0wNzAwKQo+Cj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9z
aXRvcnkgYXQ6Cj4KPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9rdm0tcmlzY3YvbGludXguZ2l0IHRh
Z3Mva3ZtLXJpc2N2LWZpeGVzLTYuMTgtMgo+Cj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVw
IHRvIDhjNWZhMzc2NGZhY2FhZDZkMzgzMzZlOTBmNDA2YzJjMTFkNjk3MzM6Cj4KPiAgIFJJU0Mt
VjogS1ZNOiBSZW1vdmUgYXV0b21hdGljIEkvTyBtYXBwaW5nIGZvciBWTV9QRk5NQVAgKDIwMjUt
MTAtMjQKPiAyMToyNDozNiArMDUzMCkKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBLVk0vcmlzY3YgZml4ZXMgZm9y
IDYuMTgsIHRha2UgIzIKPgo+IC0gRml4IGNoZWNrIGZvciBsb2NhbCBpbnRlcnJ1cHRzIG9uIHJp
c2N2MzIKPiAtIFJlYWQgSEdFSVAgQ1NSIG9uIHRoZSBjb3JyZWN0IGNwdSB3aGVuIGNoZWNraW5n
IGZvciBJTVNJQyBpbnRlcnJ1cHRzCj4gLSBSZW1vdmUgYXV0b21hdGljIEkvTyBtYXBwaW5nIGZy
b20ga3ZtX2FyY2hfcHJlcGFyZV9tZW1vcnlfcmVnaW9uKCkKPgo+IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBGYW5neXUg
WXUgKDIpOgo+ICAgICAgIFJJU0MtVjogS1ZNOiBSZWFkIEhHRUlQIENTUiBvbiB0aGUgY29ycmVj
dCBjcHUKPiAgICAgICBSSVNDLVY6IEtWTTogUmVtb3ZlIGF1dG9tYXRpYyBJL08gbWFwcGluZyBm
b3IgVk1fUEZOTUFQCj4KPiBTYW11ZWwgSG9sbGFuZCAoMSk6Cj4gICAgICAgUklTQy1WOiBLVk06
IEZpeCBjaGVjayBmb3IgbG9jYWwgaW50ZXJydXB0cyBvbiByaXNjdjMyCj4KPiAgYXJjaC9yaXNj
di9rdm0vYWlhX2ltc2ljLmMgfCAxNiArKysrKysrKysrKysrKy0tCj4gIGFyY2gvcmlzY3Yva3Zt
L21tdS5jICAgICAgIHwgMjUgKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBhcmNoL3Jpc2N2
L2t2bS92Y3B1LmMgICAgICB8ICAyICstCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9u
cygrKSwgMjYgZGVsZXRpb25zKC0pCj4KCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0t
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
