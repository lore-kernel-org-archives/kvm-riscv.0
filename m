Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BCFC3ABA9
	for <kvm-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 10:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WtBNZ3dhj0e7x7NWzHSq/OqZc/7BgweB3a1vcXDp9J4=; b=vKP7RBgXQZ1GOr
	kfjMNDOMLfJZCkO1CNl+Jbl/K0WbXbX10Y1HGkqV/2sGZx2v5Y+HIXaTTcEmbHwVoo/ZK/ZeMLh5q
	3wT6I/9cXXEwWC55+5xSkQ1dM9yeTyfp+bKIdpRLtsATfhca6cr7cSt0K7otsvVfZQdMvHbF6slZk
	1rCUIPnPO5oWoQakJ6yLfD1yq1BX/v0IkZ3MwtfTIUBxLSTu3nY5bxG/IYTKMeWAB1qltYhGv+ovI
	wwkgRE0AuQQCi0CKQTZATmwHtoJ7Q2hZ6BiK+Ow1hyyhya/1/RVgneBZIvZp9f0g03OH821P07OlF
	tRK87DbVsujMrXznNIdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9i9k-00000009Ixc-05va;
	Tue, 29 Apr 2025 10:25:40 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9i9h-00000009Iw3-1L2Q
	for kvm-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 10:25:38 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cf825f46bso3450225e9.3
        for <kvm-riscv@lists.infradead.org>; Tue, 29 Apr 2025 03:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745922336; x=1746527136; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TusfjoOZJ9Q4uXowiWjYTIz+Nnd7Ky1WuLL0Fm5qU4=;
        b=Mq5uKumXhS9nohDquM91hum+Brko0UHyvL6iVtgBMUl9MavQlJGTXWOv3wB9d8wkSv
         fuslVC7mQgy9eMiSUNcgHHiW5ccgoNcynjH3BsngA0t+24mjVkq7o/6FYKv3DZ4eiWkk
         9PlQbhZfAYnDmSvypZXI/2ObGa2QahD6y/G0QdU7k28XAB7zNNcSOCN8oM/uc57AwY2I
         GXEs25qXL0zBy4om9noanaz6EI8j4OUzFl2054L5RPP/2NdsO+KN2pI9Suas3r/EcPTA
         Lfb8ur2g/43WDmYZUOY7ZxMp59yQV3sVAkjEfVcEm9nIHtHgYHgicIpT+AEGma0QQMvt
         ZUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745922336; x=1746527136;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1TusfjoOZJ9Q4uXowiWjYTIz+Nnd7Ky1WuLL0Fm5qU4=;
        b=I9hi/XM3gm4BDOOoxs4M96nlZ+zJMqNfrTVBY4KVTtrshKdZncCWVoz7nR8FQF53gy
         DAi8JAc6KPtb4drW0msmja2xAoyZvQpOSUhpV+N5elE1m8CKpRQT2zcA1r4asJkKnb/N
         ytQ7mbIbXsozABQep4MoFaQ4p0lBST+6gKEKWj+/1+y01yagQ4trpXr2hW2NW3iYCdG5
         DCkes7Dn9+eEw+gJ9ocJAzPKDuEkr4B3O5ULAJ3qF8hfSfMDa1yCaxgNehAbIjrzTnKS
         o1073sYQ+lHbbfypij7gP+lYLVE8RJ2v/zBefg2V2HGt23HYrYkiMM5sqGzvKnu0Oyk3
         VlWg==
X-Forwarded-Encrypted: i=1; AJvYcCUyW6bf0M1/gvck+4yQVExRjGAdn74uobxUFbB4EPfNYTpL+yQkP/I7NS0A4+Ng0MkrD98aoLLW2gc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwTwmaqtQc+R25OfR/KlUmEd7rDMiQ7ZmEGZ883tWNeOvOns/kx
	cDcZCcKQPRJ7y34eFFOj0wmUsVEJVyIfygVtHEeSdCzpd3BbanyiTxDUJEO0VU4=
X-Gm-Gg: ASbGncuvk1wMgZRSdwvE2X36QxCaiqkv+Ac653HzVRRD8MIAqKuGLRXkEcMWEJkTe+B
	466hKu+vI+yIaqvumYsFnmmN45/hpnqdfuyFBF5ean9iyCbMGisSXboQhZKksEgi0TcKYUiE9PK
	hGcXhYbq5+cq/usGh1WExn3xfEwoNq5ay9uilLcoyzxxCHm0MJKoEJ/u99Jc9a7GmNgBVzfgBv2
	EWKzSoL+1SFWB4kzICVrOj+zInUGiHcz1VayCw1tf59wquJOYvkKFHDJUi0ULb81ZmjOcQpR+XG
	7BtYPcXOlWtvuGrsU/rk5UEW9MLk19jtcjXInXE7G3pKbhBs
X-Google-Smtp-Source: AGHT+IFSvfqpgAXd79kfkhiAw4afJN5Oi0WwlrlH7IsWV6fC8ECQn6pF0EjB3PiabWQYmavQwiPMEQ==
X-Received: by 2002:a05:600c:3c86:b0:43d:745a:5a49 with SMTP id 5b1f17b1804b1-441ac890c15mr8097375e9.4.1745922335484;
        Tue, 29 Apr 2025 03:25:35 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b996:f7e3:35e8:5091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5369cdasm154999805e9.31.2025.04.29.03.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 03:25:34 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 29 Apr 2025 12:25:33 +0200
Message-Id: <D9J1TBKYC8YH.1OPUI289U0O2C@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH 4/5] KVM: RISC-V: reset VCPU state when becoming
 runnable
Cc: "Anup Patel" <anup@brainfault.org>, <kvm-riscv@lists.infradead.org>,
 <kvm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Atish Patra" <atishp@atishpatra.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Andrew Jones" <ajones@ventanamicro.com>, "Mayuresh
 Chitale" <mchitale@ventanamicro.com>
To: "Anup Patel" <apatel@ventanamicro.com>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-7-rkrcmar@ventanamicro.com>
 <CAAhSdy0e3HVN6pX-hcX2N+kpwsupsCf6BqrYq=bvtwtFOuEVhA@mail.gmail.com>
 <D9IGJR9DGFAM.1PVHVOOTVRFZW@ventanamicro.com>
 <CAK9=C2Woc5MtrJeqNtaVkMXWEsGeZPsmUgtFQET=OKLHLwRbPA@mail.gmail.com>
In-Reply-To: <CAK9=C2Woc5MtrJeqNtaVkMXWEsGeZPsmUgtFQET=OKLHLwRbPA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_032537_354260_460EB1DA 
X-CRM114-Status: GOOD (  20.65  )
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

MjAyNS0wNC0yOVQxMToyNTozNSswNTozMCwgQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNy
by5jb20+Ogo+IE9uIE1vbiwgQXByIDI4LCAyMDI1IGF0IDExOjE14oCvUE0gUmFkaW0gS3LEjW3D
ocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Pgo+PiAyMDI1LTA0LTI4VDE3
OjUyOjI1KzA1OjMwLCBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPjoKPj4gPiBPbiBU
aHUsIEFwciAzLCAyMDI1IGF0IDU6MDLigK9QTSBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4+ID4+IEZvciBhIGNsZWFuZXIgc29sdXRpb24sIHdlIHNo
b3VsZCBhZGQgaW50ZXJmYWNlcyB0byBwZXJmb3JtIHRoZSBLVk0tU0JJCj4+ID4+IHJlc2V0IHJl
cXVlc3Qgb24gdXNlcnNwYWNlIGRlbWFuZC4gIEkgdGhpbmsgaXQgd291bGQgYWxzbyBiZSBtdWNo
IGJldHRlcgo+PiA+PiBpZiB1c2Vyc3BhY2Ugd2FzIGluIGNvbnRyb2wgb2YgdGhlIHBvc3QtcmVz
ZXQgc3RhdGUuCj4+ID4KPj4gPiBBcGFydCBmcm9tIGJyZWFraW5nIEtWTSB1c2VyLXNwYWNlLCB0
aGlzIHBhdGNoIGlzIGluY29ycmVjdCBhbmQKPj4gPiBkb2VzIG5vdCBhbGlnbiB3aXRoIHRoZToK
Pj4gPiAxKSBTQkkgc3BlYwo+PiA+IDIpIE9TIGJvb3QgcHJvdG9jb2wuCj4+ID4KPj4gPiBUaGUg
U0JJIHNwZWMgb25seSBkZWZpbmVzIHRoZSBlbnRyeSBzdGF0ZSBvZiBjZXJ0YWluIENQVSByZWdp
c3RlcnMKPj4gPiAobmFtZWx5LCBQQywgQTAsIGFuZCBBMSkgd2hlbiBDUFUgZW50ZXJzIFMtbW9k
ZToKPj4gPiAxKSBVcG9uIFNCSSBIU00gc3RhcnQgY2FsbCBmcm9tIHNvbWUgb3RoZXIgQ1BVCj4+
ID4gMikgVXBvbiByZXN1bWluZyBmcm9tIG5vbi1yZXRlbnRpdmUgU0JJIEhTTSBzdXNwZW5kIG9y
Cj4+ID4gICAgIFNCSSBzeXN0ZW0gc3VzcGVuZAo+PiA+Cj4+ID4gVGhlIFMtbW9kZSBlbnRyeSBz
dGF0ZSBvZiB0aGUgYm9vdCBDUFUgaXMgZGVmaW5lZCBieSB0aGUKPj4gPiBPUyBib290IHByb3Rv
Y29sIGFuZCBub3QgYnkgdGhlIFNCSSBzcGVjLiBEdWUgdG8gdGhpcywgcmVhc29uCj4+ID4gS1ZN
IFJJU0MtViBleHBlY3RzIHVzZXItc3BhY2UgdG8gc2V0IHVwIHRoZSBTLW1vZGUgZW50cnkKPj4g
PiBzdGF0ZSBvZiB0aGUgYm9vdCBDUFUgdXBvbiBzeXN0ZW0gcmVzZXQuCj4+Cj4+IFdlIGNhbiBo
YW5kbGUgdGhlIGluaXRpYWwgc3RhdGUgY29uc2lzdGVuY3kgaW4gb3RoZXIgcGF0Y2hlcy4KPj4g
V2hhdCBuZWVkcyBhZGRyZXNzaW5nIGlzIGEgd2F5IHRvIHRyaWdnZXIgdGhlIEtWTSByZXNldCBm
cm9tIHVzZXJzcGFjZSwKPj4gZXZlbiBpZiBvbmx5IHRvIGNsZWFyIHRoZSBpbnRlcm5hbCBLVk0g
c3RhdGUuCj4+Cj4+IEkgdGhpbmsgbXBfc3RhdGUgaXMgY3VycmVudGx5IHRoZSBiZXN0IHNpZ25h
bGl6YXRpb24gdGhhdCBLVk0gc2hvdWxkCj4+IHJlc2V0LCBzbyBJIGFkZGVkIGl0IHRoZXJlLgo+
Pgo+PiBXaGF0IHdvdWxkIGJlIHlvdXIgcHJlZmVycmVkIGludGVyZmFjZSBmb3IgdGhhdD8KPj4K
Pgo+IEluc3RlYWQgb2YgY3JlYXRpbmcgYSBuZXcgaW50ZXJmYWNlLCBJIHdvdWxkIHByZWZlciB0
aGF0IFZDUFUKPiB3aGljaCBpbml0aWF0ZXMgU0JJIFN5c3RlbSBSZXNldCBzaG91bGQgYmUgcmVz
ZXR0ZWQgaW1tZWRpYXRlbHkKPiBpbi1rZXJuZWwgc3BhY2UgYmVmb3JlIGZvcndhcmRpbmcgdGhl
IHN5c3RlbSByZXNldCByZXF1ZXN0IHRvCj4gdXNlciBzcGFjZS4KClRoZSBpbml0aWF0aW5nIFZD
UFUgbWlnaHQgbm90IGJlIHRoZSBib290IFZDUFUuCkl0IHdvdWxkIGJlIHNhZmVyIHRvIHJlc2V0
IGFsbCBvZiB0aGVtLgoKWW91IGFsc28gcHJldmlvdXNseSBtZW50aW9uZWQgdGhhdCB3ZSBuZWVk
IHRvIHByZXNlcnZlIHRoZSBwcmUtcmVzZXQKc3RhdGUgZm9yIHVzZXJzcGFjZSwgd2hpY2ggSSBj
b21wbGV0ZWx5IGFncmVlIHdpdGggYW5kIGl0IGlzIHdoeSB0aGUKcmVzZXQgaGFwcGVucyBsYXRl
ci4KCj4gICAgICAgICAgICAgVGhpcyB3YXkgd2UgYWxzbyBmb3JjZSBLVk0gdXNlci1zcGFjZSB0
byBleHBsaWNpdGx5Cj4gc2V0IHRoZSBQQywgQTAsIGFuZCBBMSBiZWZvcmUgcnVubmluZyB0aGUg
VkNQVSBhZ2FpbiBhZnRlcgo+IHN5c3RlbSByZXNldC4KCldlIGFsc28gd2FudCB0byBjb25zaWRl
ciByZXNldCBmcm9tIGVtdWxhdGlvbiBvdXRzaWRlIG9mIEtWTS4KClRoZXJlIGlzIGEgInNpbXBs
ZSIgc29sdXRpb24gdGhhdCBjb3ZlcnMgZXZlcnl0aGluZyAoZXhjZXB0IHNwZWVkKSAtLQp0aGUg
dXNlcnNwYWNlIGNhbiB0ZWFyIGRvd24gdGhlIHdob2xlIFZNIGFuZCByZS1jcmVhdGUgaXQuCkRv
IHdlIHdhbnQgdG8gZG8gdGhpcyBpbnN0ZWFkIGFuZCBkcm9wIGFsbCByZXNldHMgZnJvbSBLVk0/
CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
