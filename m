Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96693C83F1A
	for <kvm-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 16:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sw1xq8DOQqHScP4K/1YScb7R6b5dgdqzIMF53ScgqQk=; b=oFHQER/TBCb9cQ
	9nu3MaWcKm5jIAakk1ZjPK7onhIirigAy+UN15AkbpB/DHHOhyVsh1uNyrtJC2eSmA058M/u9xjVk
	s8XWjCeZU0rSAM1e6vrTh7n38YJOJDVXftekiohQLuwmwCPD3U9D4YnGYa1YIJbteUyuqRdzj+4n1
	xmMavWaoiyRZUw36r8sh2/p1P0JCRcssWaTQ1mjGkE0z5hKrYx4+ULH12xmqoGQbUA/lTHdIT5MxE
	ulhF+80Rrrc7vf594uOYPC0W+8/kr4ScuM3zLrN1EJG02xyEcQ9qg3Oea7GOzYglzDSE0GcG0SyUa
	QK1axdr7AlFro+u6/Dmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucRq1-0000000AhPP-44cg;
	Thu, 17 Jul 2025 16:52:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQG5-0000000ATse-0X3D
	for kvm-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 15:10:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752765052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HnTl8YyVmCQ+6lx7TAls0CZruBl5qS1i458aSA1jJeM=;
	b=bOhT/9sOwnQQyTrPSsJAPbIF2GygnlOCaoia4auGoDfi0YedXCcxKfEVl0Dz52o6+9Jvko
	xYsCLrr4pEepncnTgpoJhzgyTWvU4UcTDKY1+TD/z2HCL3NypUoQez+kMyC3hUW+vIiUa/
	9AgfnjVA9YXMSPWT9LGhAFcPsleZb1c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-KNFkkUWcPLGWNnNUR0tecg-1; Thu, 17 Jul 2025 11:10:49 -0400
X-MC-Unique: KNFkkUWcPLGWNnNUR0tecg-1
X-Mimecast-MFC-AGG-ID: KNFkkUWcPLGWNnNUR0tecg_1752765049
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f8192e2cso665666f8f.3
        for <kvm-riscv@lists.infradead.org>; Thu, 17 Jul 2025 08:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752765049; x=1753369849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HnTl8YyVmCQ+6lx7TAls0CZruBl5qS1i458aSA1jJeM=;
        b=ID4dK3ND/GPONK6cOG1Pz1tFNacXVLx+WU6Efbi0pylkCXCIMWxTaFfSG4AvhWqiv1
         dew6vMayGh7y9WLt3mprMaH/Z12ZGUiSX6ESLF6RYTtWryKXgb8lJJpQSf7/wbyIbgyi
         j6IW6kSkUU/uqXZKUDE+v1MdVn9uLVgfktKE3ovo4M86AXa52po9bLT6Ry+9VIav6blC
         T20kLWT6V+lwcVqaaaAA662oPVsboSxd2Fyu+vds+Hhpk+Ru8uUowZZHOhYOmNPwi152
         KyNhGhhXmDNuO9tVL+sYmDVw7vXL7sBECe2IYf2PXj6n8TFd/QDT2G8dH6xXCvjwDA4k
         3OSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdmFICfP4wggiPzwwmZRqEWZK/APvWIIo7mEHGXTWmTQ7gNnMzOcM1Q3P3lVwvXIfeu7tSbHJW6Ys=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUANxt4y0LunVodXKOaT+bnPOouk4lDgnl8g9mYrKqihkbXhFL
	KUZ10FwYrTROJzqKeRrZ0D98i3yvGOwx9uXYnpWKX3dWQZTNZG6j//knyvpgWN5S9EwM5+E9yhE
	k8FCovI/BDQ7bUixvMYP50l1VLaS931OORwH5jGngTn4YO1TOeVYq9i7AbRgXZqx74KbEpgKYV/
	AgEgNDtIEwZmFsgB4C7yzF54bq/xPLVxFdD2bezhsDDQ==
X-Gm-Gg: ASbGncsQZryi03v3y17l6o2RnQS2qjez7/x4e/oOk2IqS0JKpWH691lUcN43ZBwHpZR
	/RiG/JATjC3fHxMwhqyTWmd5y735urHCNRAmLoqhEGA7JVJyf1mJmUrhpmckstJXItC1B+ou3Ai
	b5M8zmDNBEcMDOZB5bmyKN
X-Received: by 2002:a05:6000:24c9:b0:3a5:1c0d:85e8 with SMTP id ffacd0b85a97d-3b60e4c219fmr5043593f8f.22.1752765048518;
        Thu, 17 Jul 2025 08:10:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6ENUSGVWfYmEMdWSfORC9F6DnzUU+kA3Bcwc1adVmjk2OuNyCtcLU+5XLyyeGoMwkUt3MfaixMxCh5LTkmLg=
X-Received: by 2002:a05:6000:24c9:b0:3a5:1c0d:85e8 with SMTP id
 ffacd0b85a97d-3b60e4c219fmr5043562f8f.22.1752765048033; Thu, 17 Jul 2025
 08:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy3_OE=R1jhF5-KBiw4mGOqHUXHdkvyeAAR18Qm8dezavQ@mail.gmail.com>
In-Reply-To: <CAAhSdy3_OE=R1jhF5-KBiw4mGOqHUXHdkvyeAAR18Qm8dezavQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 17 Jul 2025 17:10:35 +0200
X-Gm-Features: Ac12FXwFt8xOw-1JkHEa0ebnk7oHtzkOFfGQMkyq0xmPpds5qhTf7aNpQULhrXU
Message-ID: <CABgObfaqDdY8rv=Oq-BHSXLk_iUCReh_EcUKAhGbcXu7xpL6VQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 6.16 take #2
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W1oF3jkXPNgwztLz8n832hd9MUth69yk1gfIFi4crMs_1752765049
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_081053_228003_B9A07BFC 
X-CRM114-Status: GOOD (  13.07  )
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

T24gU2F0LCBKdWwgMTIsIDIwMjUgYXQgMTI6MjXigK9QTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPiB3cm90ZToKPgo+IEhpIFBhb2xvLAo+Cj4gV2UgaGF2ZSB0d28gbW9yZSBmaXhl
cyBmb3IgdGhlIDYuMTYga2VybmVsLiBUaGUgZmlyc3Qgb25lCj4gZml4ZXMgYW4gaXNzdWUgcmVw
b3J0ZWQgYnkgQ2Fub25pY2FsIFsxXSB3aGljaCB0dXJuZWQtb3V0Cj4gdG8gYmUgYW4gaXNzdWUg
cmVsYXRlZCB0byB0aW1lciBjbGVhbnVwIHdoZW4gZXhpdGluZyB0bwo+IHVzZXItc3BhY2UuIFRo
ZSBzZWNvbmQgZml4IGFkZHJlc3NlcyBhIHJhY2UtY29uZGl0aW9uCj4gaW4gdXBkYXRpbmcgSEdF
SUUgQ1NSIHdoZW4gSU1TSUMgVlMtZmlsZXMgYXJlIGluLXVzZS4KPgo+IFBsZWFzZSBwdWxsLgo+
Cj4gUmVnYXJkcywKPiBBbnVwCj4KPiBbMV0gaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvdWJ1
bnR1Lytzb3VyY2UvbGludXgvK2J1Zy8yMTEyNTc4U2lnbmVkLW9mZi1ieQo+Cj4gVGhlIGZvbGxv
d2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBkN2I4ZjhlMjA4MTNmMDE3OWQ4ZWY1MTk1NDFhMzUy
N2U3NjYxZDNhOgo+Cj4gICBMaW51eCA2LjE2LXJjNSAoMjAyNS0wNy0wNiAxNDoxMDoyNiAtMDcw
MCkKPgo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+Cj4gICBodHRw
czovL2dpdGh1Yi5jb20va3ZtLXJpc2N2L2xpbnV4LmdpdCB0YWdzL2t2bS1yaXNjdi1maXhlcy02
LjE2LTIKPgo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA0Y2VjODlkYjgwYmE4MWZh
NDUyNGM2NDQ5YzA0OTRiOGFlMDhlZWIwOgo+Cj4gICBSSVNDLVY6IEtWTTogTW92ZSBIR0VJW0V8
UF0gQ1NSIGFjY2VzcyB0byBJTVNJQyB2aXJ0dWFsaXphdGlvbgo+ICgyMDI1LTA3LTExIDE4OjMz
OjI3ICswNTMwKQoKUHVsbGVkLCB0aGFua3MuCgpQYW9sbwoKPgo+IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBLVk0vcmlz
Y3YgZml4ZXMgZm9yIDYuMTYsIHRha2UgIzIKPgo+IC0gRGlzYWJsZSB2c3RpbWVjbXAgYmVmb3Jl
IGV4aXRpbmcgdG8gdXNlci1zcGFjZQo+IC0gTW92ZSBIR0VJW0V8UF0gQ1NSIGFjY2VzcyB0byBJ
TVNJQyB2aXJ0dWFsaXphdGlvbgo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IEFudXAgUGF0ZWwgKDIpOgo+ICAgICAg
IFJJU0MtVjogS1ZNOiBEaXNhYmxlIHZzdGltZWNtcCBiZWZvcmUgZXhpdGluZyB0byB1c2VyLXNw
YWNlCj4gICAgICAgUklTQy1WOiBLVk06IE1vdmUgSEdFSVtFfFBdIENTUiBhY2Nlc3MgdG8gSU1T
SUMgdmlydHVhbGl6YXRpb24KPgo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9haWEuaCAg
fCAgNCArKy0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIHwgIDMgKysrCj4g
IGFyY2gvcmlzY3Yva3ZtL2FpYS5jICAgICAgICAgICAgICB8IDUxICsrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYyAgICAg
ICAgfCA0NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGFyY2gvcmlzY3Yv
a3ZtL3ZjcHUuYyAgICAgICAgICAgICB8IDEwIC0tLS0tLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3Zj
cHVfdGltZXIuYyAgICAgICB8IDE2ICsrKysrKysrKysrKwo+ICA2IGZpbGVzIGNoYW5nZWQsIDc0
IGluc2VydGlvbnMoKyksIDU1IGRlbGV0aW9ucygtKQo+CgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5n
IGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
