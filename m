Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17330C021BB
	for <kvm-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 18:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LFsLSGvR4tlhHkT5QEpDnrYtx2A/8Na7Yqf6jrHMSUM=; b=mq970/1+Mh05kE
	jpNmMArPV7E1GFq/aKMgdBuogY3mi1ctmqCnWjYX5s23YDkYb1CbYnk3vEhzB+tbZktRcZmQn4qXe
	ATdetCzama0HISmolti/8EOg2Pa4Wx6yUm98nf5iIgvHcnpN+roPXrQdVopoKxYhnrlSII1xwcD7p
	bb7S8Y9hr33fjmTRooWAb+uMVM1in0inV7lHmrJrd/V66Bw84Cm8IY1gfqfchas1iHQwQmlqx8X+R
	P6fnocuzmb6WrT8Gb/GBZ8YJr9EM7pMj/7oum3A949t+KGCaJzsditPyga80hPJ9qNV7MLbV7fklO
	YtM9b90rNYSR2+9GSTWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdFj-0000000Eoj6-3JDR;
	Mon, 24 Feb 2025 18:32:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmd4g-0000000EmWi-0cCd
	for kvm-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 18:21:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740421261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u7xELZHJie6Fl0P2HGMVjkjGrKUGnwvDBmjOpl74Jkg=;
	b=DOkw7SwU2Pu9B/3KCGO8vMJC/HEsnJO9AcZRoRthDbLLwzrmCe7M34rhiL5WZ2lJF1EUcm
	HZTHDJ0kUVMrpWwrKwEq480+FcvHLvX1LMM8k1A4VNm2L91KSu/VkK6U2qNgxlRajpuHQz
	35NH6EPf2AiLTRbceQ0YEc3hNc46PH0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-ek86mB2LPmOQWqTtNeSDJg-1; Mon, 24 Feb 2025 13:20:59 -0500
X-MC-Unique: ek86mB2LPmOQWqTtNeSDJg-1
X-Mimecast-MFC-AGG-ID: ek86mB2LPmOQWqTtNeSDJg_1740421258
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38f455a8fcaso3621303f8f.2
        for <kvm-riscv@lists.infradead.org>; Mon, 24 Feb 2025 10:20:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740421258; x=1741026058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7xELZHJie6Fl0P2HGMVjkjGrKUGnwvDBmjOpl74Jkg=;
        b=SHDa00nHVk0U9IiyjsCn3EjxZTNWh1Z961hTgBc8cd67IxfjTmTETJO2XdW0RhuGzD
         9TSp3Nvc+ZT/LrH26RD9XWJ4Q1CJY7rRde44NC31Wpaiw3jZCdpVRuWCbrtS+kkYlOVF
         vZHp5M/BaEDmj6iqvOWcU3msrBa3bB7pLs+cBjw0ZjxpSwiXgAQRxHIUWEBrmVL9Bvsi
         MD/+WolzwnhffbphWUz9LumCCZu1u2IIWzL3qGs3uZVT+nNkY5Bu4mQJhB1+ciLtaYdA
         E7WZjvVnV7t927K3Vg1le1wx8mmD7jcCS1JkcbYJl21yl9Wl6wBG2FVkhu7cvms85JhD
         PNkg==
X-Forwarded-Encrypted: i=1; AJvYcCWjfrv8vSvAZauTBtqj0fJO/FtwwNJT+pGFMIcsyhfpEGyF4eS/Fz1KJ3LT8lW3t09vAigfBZnBv/M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9S2qkzPMA9FJn4Ia/u0Jn3g2E5wA9Tw0D712Upry+tLIFx5cQ
	PJJn/9M6U/CBdG4vMTSXKtg77KFUxcmbBHC6o7H5ghOChI2ZPsDgbXVq3laZA+Wa5nwD9Pp/Py4
	S3OinwZvZJG56BitNoeLr9dF0c1VWOVtt+9t7l6iL+Q+b0C8GzYhTQsulTsXI0N8G1uUo6wGed8
	tXWa2bdQXlUi8qeSwaoniB37KSEcO1dD3wDc1KEQ==
X-Gm-Gg: ASbGncvZAQd4l1eOJpbIy7frL5Ahla/I2xI8ny7m98Zgrhn30LV+o7kfxIHmv1hKKiI
	O7ducZrVLgoGIVFanVc50vU/OytulrCBYamBD5EwtLoZxWPiYFwVrdxnSWO7T94R+daGGd7MGUA
	==
X-Received: by 2002:a5d:47cb:0:b0:38d:de92:adad with SMTP id ffacd0b85a97d-38f6e95c4aemr9698941f8f.22.1740421258495;
        Mon, 24 Feb 2025 10:20:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdoqcjY6M2ITOtK0J4C8ZZqwTjbsEXxZzmRUh3glHKJRit9eR6FaDOe3JruMVtsoM71Am043xhfFfSHW4WvTE=
X-Received: by 2002:a5d:47cb:0:b0:38d:de92:adad with SMTP id
 ffacd0b85a97d-38f6e95c4aemr9698920f8f.22.1740421258135; Mon, 24 Feb 2025
 10:20:58 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy0Wo4hQ=gnhpJGU-khA4g-0VkfkMECDjnAsq4Fg6xfWjw@mail.gmail.com>
In-Reply-To: <CAAhSdy0Wo4hQ=gnhpJGU-khA4g-0VkfkMECDjnAsq4Fg6xfWjw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 24 Feb 2025 19:20:46 +0100
X-Gm-Features: AWEUYZmirAbaCLPAASL9k1ey1yRhraHtQYqh2iKwvRPu6z7rtoFlwTs6G6HOStc
Message-ID: <CABgObfbKPQ807vchetgjdFbzFiBgSCXXHCTu-Qq-XgA2dzuDCg@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 6.14 take #1
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vGhZddN0A0gF8enDQ9_VnkhpegiYlq267HuKcPWx5Ys_1740421258
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_102102_257088_38A49743 
X-CRM114-Status: GOOD (  12.05  )
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

T24gRnJpLCBGZWIgMjEsIDIwMjUgYXQgNjowOOKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFvbG8sCj4KPiBXZSBoYXZlIGEgYnVuY2ggb2YgU0JJ
IHJlbGF0ZWQgZml4ZXMgYW5kIG9uZSBmaXggdG8gcmVtb3ZlCj4gYSByZWR1bmRhbnQgdmNwdSBr
aWNrIGZvciB0aGUgNi4xNCBrZXJuZWwuCj4KPiBQbGVhc2UgcHVsbC4KPgo+IFJlZ2FyZHMsCj4g
QW51cAo+Cj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAwYWQyNTA3ZDVkOTNm
Mzk2MTlmYzQyMzcyYzM0N2Q2MDA2YjY0MzE5Ogo+Cj4gICBMaW51eCA2LjE0LXJjMyAoMjAyNS0w
Mi0xNiAxNDowMjo0NCAtMDgwMCkKPgo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0
b3J5IGF0Ogo+Cj4gICBodHRwczovL2dpdGh1Yi5jb20va3ZtLXJpc2N2L2xpbnV4LmdpdCB0YWdz
L2t2bS1yaXNjdi1maXhlcy02LjE0LTEKPgo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0
byBkMjUyNDM1YWNhNDRkNjQ3ZDU3Yjg0ZGU1MTA4NTU2ZjljOTc2MTRhOgo+Cj4gICByaXNjdjog
S1ZNOiBSZW1vdmUgdW5uZWNlc3NhcnkgdmNwdSBraWNrICgyMDI1LTAyLTIxIDE3OjI3OjMyICsw
NTMwKQoKUHVsbGVkLCB0aGFua3MuCgpQYW9sbwoKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gS1ZNL3Jpc2N2IGZpeGVz
IGZvciA2LjE0LCB0YWtlICMxCj4KPiAtIEZpeCBoYXJ0IHN0YXR1cyBjaGVjayBpbiBTQkkgSFNN
IGV4dGVuc2lvbgo+IC0gRml4IGhhcnQgc3VzcGVuZF90eXBlIHVzYWdlIGluIFNCSSBIU00gZXh0
ZW5zaW9uCj4gLSBGaXggZXJyb3IgcmV0dXJuZWQgYnkgU0JJIElQSSBhbmQgVElNRSBleHRlbnNp
b25zIGZvcgo+ICAgdW5zdXBwb3J0ZWQgZnVuY3Rpb24gSURzCj4gLSBGaXggc3VzcGVuZF90eXBl
IHVzYWdlIGluIFNCSSBTVVNQIGV4dGVuc2lvbgo+IC0gUmVtb3ZlIHVubmVjZXNzYXJ5IHZjcHUg
a2ljayBhZnRlciBpbmplY3RpbmcgaW50ZXJydXB0Cj4gICB2aWEgSU1TSUMgZ3Vlc3QgZmlsZQo+
Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+IEFuZHJldyBKb25lcyAoNSk6Cj4gICAgICAgcmlzY3Y6IEtWTTogRml4IGhh
cnQgc3VzcGVuZCBzdGF0dXMgY2hlY2sKPiAgICAgICByaXNjdjogS1ZNOiBGaXggaGFydCBzdXNw
ZW5kX3R5cGUgdXNlCj4gICAgICAgcmlzY3Y6IEtWTTogRml4IFNCSSBJUEkgZXJyb3IgZ2VuZXJh
dGlvbgo+ICAgICAgIHJpc2N2OiBLVk06IEZpeCBTQkkgVElNRSBlcnJvciBnZW5lcmF0aW9uCj4g
ICAgICAgcmlzY3Y6IEtWTTogRml4IFNCSSBzbGVlcF90eXBlIHVzZQo+Cj4gQmlsbFhpYW5nICgx
KToKPiAgICAgICByaXNjdjogS1ZNOiBSZW1vdmUgdW5uZWNlc3NhcnkgdmNwdSBraWNrCj4KPiAg
YXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMgICAgICAgIHwgIDEgLQo+ICBhcmNoL3Jpc2N2L2t2
bS92Y3B1X3NiaV9oc20uYyAgICAgfCAxMSArKysrKystLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92
Y3B1X3NiaV9yZXBsYWNlLmMgfCAxNSArKysrKysrKysrKystLS0KPiAgYXJjaC9yaXNjdi9rdm0v
dmNwdV9zYmlfc3lzdGVtLmMgIHwgIDMgKystCj4gIDQgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0
aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4KCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdApr
dm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
