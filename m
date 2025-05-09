Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4FAC3ABC3
	for <kvm-riscv@archiver.kernel.org>; Fri,  9 May 2025 12:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uJQ650XR9OwAYbfIKAVSQeAw/lh8J04H4t9sMZzNMR0=; b=gf1vPRd+QbdT7P
	9m4muzhr0FMnkgktQehpz24kqjBNQBdIeqVt8EQBGAVwesiRlZijGS6tNo1gxS09HyQ1Dx2yjXRKJ
	8OWOGOvIrN1JAYea7BgsTX5Os9k6CFyXqmLM8/1+L+wfAApEwW1UQC6+nigPLtaWzSZAZiNQ85ZAg
	Tt8oAavqLZ6xLCbFYE+ULzpIPBvae60xElZnjUcyUWqGBa4vFYZtOQHjgQe1Klt/9VfQCqt0F2qMa
	Q2A+zQD+B/ol822Rvj0NkaLsptZn1bIL3x/iUQNMBNznUyO1SNlpoG2PoGF46cJcKww47E3Qpsamc
	cywGiK7lL0srGpkYNwqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNCQ-00000003e3O-29V9;
	Fri, 09 May 2025 12:51:34 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMSP-00000003WoC-1UMq
	for kvm-riscv@lists.infradead.org;
	Fri, 09 May 2025 12:04:02 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3da6fb115a6so17069585ab.1
        for <kvm-riscv@lists.infradead.org>; Fri, 09 May 2025 05:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1746792240; x=1747397040; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CemopbrpuOPESs7KqAo/mdFnUJ307GHWAfAAUzTtio=;
        b=M/F4NRRBkntbEol6NQFT5u7oyz1mN72Bfo8q/PlTETHbqCmt7s6VdgNNdlvIJKvWvg
         dbQeWmvHDBsyg01idhFfMaCTaLhftHzkigSxIzOhfvuCiS76dQWCT+Gc+XXG7mlS7eIU
         L2wsiUdQMe4/112l9pFpAFgVtbN+Jr3ez7S53aXCre9/cCODSZed3f2i84JqgAbzTy22
         RluhSIUXWlHo5WlYR/VvZsJBd2Pht33VA5xd2P+ssVqlL6SomOhhqyfumIE1WKQKpn+O
         LFbNF0jKm8rax1pzIDBzy7JaRj7V6IR8Lz9I9wVqRI7KUkhyrW7P+e6VM5XD3yqHzkIu
         YTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746792240; x=1747397040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CemopbrpuOPESs7KqAo/mdFnUJ307GHWAfAAUzTtio=;
        b=lYMfDYonHD97qD0MdnJoVPWx/62oeNlXgDFx26ajihci2GjZILwmMJCfpfQSUq8h8V
         Qlj+/D/hue8Cpro5tDK2/9xLTpwQpZsS6zIgJzeVr3C6RjboEeSssAZpSUAMzWVMSjPf
         SbirswT3TMLErmTO8y23lUilrL4yo9T5adrGNfo0VLTO/vqRqrLXgfTr1kr0v+Q14XE4
         ZAEn48MQRAlDPbv/WF7vRQxNXLI8MuWMOK1gmewJsrd4WJ0V0JXAknN7g/B/S91bYJs4
         0b70wAFnGjWF+jtsf5dIeOpU11IfF2DDL4JB32eOzPjwghGy3gnHEvzKaAr81Aeavruc
         CyGw==
X-Gm-Message-State: AOJu0YzuYL0ovPn8OgVgCZcoZnD42jvZo640ylxYHxY4puZG1AFBOcVT
	/9EhlWljh4x2Cr7wm+ZCZNLo1kU9GeBDNYcf+Y7Ssx96obZEYKP9ZEPLv/HYFBLnVi8do6iXh4Q
	atsgzQ/7ta0ZYBaG5OI40mO/73gJMEbrIb7nX+A==
X-Gm-Gg: ASbGncsJoNX2pYnZZdWlaOvbHH9ApXOvehngPj39ZpQ0uyx707JdxD3h8nG8Dp4JHCT
	O5YQpu063KHu2tD3HFBzLnknZdhba08lILgdU5GGiKYaBQhbbVK4FPhYuM/ZKZjxDPowFvJdnIp
	m/BTQTVwi99qLYOvAqK1X1bWM=
X-Google-Smtp-Source: AGHT+IECSUjDmuckOfBIScHTJxj3yWladB++b87BYQiYMUU7S/HWB3IxwAUCkCTuDfYz1SRdlxZmyMh2LjW4TJKLUvU=
X-Received: by 2002:a05:6e02:b4c:b0:3d9:6485:39f0 with SMTP id
 e9e14a558f8ab-3da7e1e7848mr39704745ab.9.1746792240369; Fri, 09 May 2025
 05:04:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250508142842.1496099-2-rkrcmar@ventanamicro.com>
 <20250508142842.1496099-4-rkrcmar@ventanamicro.com> <CAAhSdy2nOBndtJ46yHbdjc2f0cNoPV3kjXth-q57cXt8jZA6bQ@mail.gmail.com>
 <D9RHYLQHCFP1.24E5305A5VDZH@ventanamicro.com>
In-Reply-To: <D9RHYLQHCFP1.24E5305A5VDZH@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 May 2025 17:33:49 +0530
X-Gm-Features: AX0GCFus3LXSrSKkS2ynuu10JrArNnS8WLRjt1i8r_eLHo_szj5ZQVIc9wOXqvw
Message-ID: <CAAhSdy2U_LsoVm=4jdZQWdOkPkCH8c2bk6rsts8rY+ZGKwVuUg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] RISC-V: KVM: add KVM_CAP_RISCV_MP_STATE_RESET
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_050401_595000_00964867 
X-CRM114-Status: GOOD (  45.20  )
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

T24gRnJpLCBNYXkgOSwgMjAyNSBhdCAyOjE24oCvUE0gUmFkaW0gS3LEjW3DocWZIDxya3JjbWFy
QHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gMjAyNS0wNS0wOVQxMjoyNToyNCswNTozMCwg
QW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz46Cj4gPiBPbiBUaHUsIE1heSA4LCAyMDI1
IGF0IDg6MDHigK9QTSBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4g
d3JvdGU6Cj4gPj4KPiA+PiBBZGQgYSB0b2dnbGVhYmxlIFZNIGNhcGFiaWxpdHkgdG8gbW9kaWZ5
IHNldmVyYWwgcmVzZXQgcmVsYXRlZCBjb2RlCj4gPj4gcGF0aHMuICBUaGUgZ29hbHMgYXJlIHRv
Cj4gPj4gIDEpIEFsbG93IHVzZXJzcGFjZSB0byByZXNldCBhbnkgVkNQVS4KPiA+PiAgMikgQWxs
b3cgdXNlcnNwYWNlIHRvIHByb3ZpZGUgdGhlIGluaXRpYWwgVkNQVSBzdGF0ZS4KPiA+Pgo+ID4+
IChSaWdodCBub3csIHRoZSBib290IFZDUFUgaXNuJ3QgcmVzZXQgYnkgS1ZNIGFuZCBLVk0gc2V0
cyB0aGUgc3RhdGUgZm9yCj4gPj4gIFZDUFVzIGJyb3VnaHQgdXAgYnkgc2JpX2hhcnRfc3RhcnQg
d2hpbGUgdXNlcnNwYWNlIGZvciBhbGwgb3RoZXJzLikKPiA+Pgo+ID4+IFRoZSBnb2FscyBhcmUg
YWNoaWV2ZWQgd2l0aCB0aGUgZm9sbG93aW5nIGNoYW5nZXM6Cj4gPj4gICogUmVzZXQgdGhlIFZD
UFUgd2hlbiBzZXR0aW5nIE1QX1NUQVRFX0lOSVRfUkVDRUlWRUQgdGhyb3VnaCBJT0NUTC4KPiA+
Cj4gPiBSYXRoZXIgdGhhbiB1c2luZyBzZXBhcmF0ZSBNUF9TVEFURV9JTklUX1JFQ0VJVkVEIGlv
Y3RsKCksIHdlIGNhbgo+ID4gZGVmaW5lIGEgY2FwYWJpbGl0eSB3aGljaCB3aGVuIHNldCwgdGhl
IHNldF9tcHN0YXRlIGlvY3RsKCkgd2lsbCByZXNldCB0aGUKPiA+IFZDUFUgdXBvbiBjaGFuZ2lu
ZyBWQ1BVIHN0YXRlIGZyb20gUlVOTkFCTEUgdG8gU1RPUFBFRCBzdGF0ZS4KPgo+IFllYWgsIEkg
c3RhcnRlZCB3aXRoIHRoYXQgYW5kIHRoZW4gcmVhbGl6ZWQgaXQgaGFzIHR3byBkcmF3YmFja3M6
Cj4KPiAgKiBJdCB3aWxsIHJlcXVpcmUgbGFyZ2VyIGNoYW5nZXMgaW4gdXNlcnNwYWNlcywgYmVj
YXVzZSBmb3IKPiAgICBleGFtcGxlIFFFTVUgbm93IGZpcnN0IGxvYWRzIHRoZSBpbml0aWFsIHN0
YXRlIGFuZCB0aGVuIHRvZ2dsZXMgdGhlCj4gICAgbXBfc3RhdGUsIHdoaWNoIHdvdWxkIGluY29y
cmVjdGx5IHJlc2V0IHRoZSBzdGF0ZS4KPgo+ICAqIEl0IHdpbGwgYWxzbyByZXF1aXJlIGFuIGV4
dHJhIElPQ1RMIGlmIGEgc3RvcHBlZCBWQ1BVIHNob3VsZCBiZQo+ICAgIHJlc2V0Cj4gICAgIDEp
IFNUT1BQRUQgLT4gUlVOTklORyAoPSByZXNldCkKPiAgICAgMikgUlVOTklORyAtPiBTVE9QUEVE
IChWQ1BVIHNob3VsZCBiZSBzdG9wcGVkKQo+ICAgIG9yIGlmIHRoZSBjdXJyZW50IHN0YXRlIG9m
IGEgVkNQVSBpcyBub3Qga25vd24uCj4gICAgIDEpID8/PyAgICAgLT4gU1RPUFBFRAo+ICAgICAy
KSBTVE9QUEVEIC0+IFJVTk5JTkcKPiAgICAgMykgUlVOTklORyAtPiBTVE9QUEVECj4KPiBJIGNh
biBkbyB0aGF0IGZvciB2MyBpZiB5b3UgdGhpbmsgaXQncyBiZXR0ZXIuCgpPa2F5LCBmb3Igbm93
IGtlZXAgdGhlIE1QX1NUQVRFX0lOSVRfUkVDRUlWRUQgaW9jdGwoKQoKPgo+ID4+ICAqIFByZXNl
cnZlIHRoZSB1c2Vyc3BhY2UgaW5pdGlhbGl6ZWQgVkNQVSBzdGF0ZSBvbiBzYmlfaGFydF9zdGFy
dC4KPiA+PiAgKiBSZXR1cm4gdG8gdXNlcnNwYWNlIG9uIHNiaV9oYXJ0X3N0b3AuCj4gPgo+ID4g
VGhlcmUgaXMgbm8gdXNlcnNwYWNlIGludm9sdmVtZW50IHJlcXVpcmVkIHdoZW4gYSBHdWVzdCBW
Q1BVCj4gPiBzdG9wcyBpdHNlbGYgdXNpbmcgU0JJIEhTTSBzdG9wKCkgY2FsbCBzbyBTVFJPTkcg
Tk8gdG8gdGhpcyBjaGFuZ2UuCj4KPiBPaywgSSdsbCBkcm9wIGl0IGZyb20gdjMgLS0gaXQgY2Fu
IGJlIGhhbmRsZWQgYnkgZnV0dXJlIHBhdGNoZXMgdGhhdAo+IHRyYXAgU0JJIGNhbGxzIHRvIHVz
ZXJzcGFjZS4KPgo+IFRoZSBsYWNrIG9mIHVzZXJzcGFjZSBpbnZvbHZlbWVudCBpcyB0aGUgaXNz
dWUuICBLVk0gZG9lc24ndCBrbm93IHdoYXQKPiB0aGUgaW5pdGlhbCBzdGF0ZSBzaG91bGQgYmUu
CgpUaGUgU0JJIEhTTSB2aXJ0dWFsaXphdGlvbiBkb2VzIG5vdCBuZWVkIGFueSBLVk0gdXNlcnNw
YWNlCmludm9sdmVtZW50LgoKV2hlbiBhIFZDUFUgc3RvcHMgaXRzZWxmIHVzaW5nIFNCSSBIU00g
c3RvcCgpLCB0aGUgR3Vlc3QgaXRzZWxmCnByb3ZpZGVzIHRoZSBlbnRyeSBhZGRyZXNzIGFuZCBh
cmd1bWVudCB3aGVuIHN0YXJ0aW5nIHRoZSBWQ1BVCnVzaW5nIFNCSSBIU00gc3RhcnQoKSB3aXRo
b3V0IGFueSBLVk0gdXNlcnNwYWNlIGludm9sdmVtZW50LgoKSW4gZmFjdCwgZXZlbiBhdCBHdWVz
dCBib290IHRpbWUgYWxsIG5vbi1ib290IFZDUFVzIGFyZSBicm91Z2h0LXVwCnVzaW5nIFNCSSBI
U00gc3RhcnQoKSBieSB0aGUgYm9vdCBWQ1BVIHdoZXJlIHRoZSBHdWVzdCBpdHNlbGYKcHJvdmlk
ZXMgZW50cnkgYWRkcmVzcyBhbmQgYXJndW1lbnQgd2l0aG91dCBhbnkgS1ZNIHVzZXJzcGFjZQpp
bnZvbHZlbWVudC4KCj4KPiA+PiAgKiBEb24ndCBtYWtlIFZDUFUgcmVzZXQgcmVxdWVzdCBvbiBz
Ymlfc3lzdGVtX3N1c3BlbmQuCj4gPgo+ID4gVGhlIGVudHJ5IHN0YXRlIG9mIGluaXRpYXRpbmcg
VkNQVSBpcyBhbHJlYWR5IGF2YWlsYWJsZSBvbiBTQkkgc3lzdGVtCj4gPiBzdXNwZW5kIGNhbGwu
IFRoZSBpbml0aWF0aW5nIFZDUFUgbXVzdCBiZSByZXNldHRlZCBhbmQgZW50cnkgc3RhdGUgb2YK
PiA+IGluaXRpYXRpbmcgVkNQVSBtdXN0IGJlIHNldHVwLgo+Cj4gVXNlcnNwYWNlIHdvdWxkIHNp
bXBseSBjYWxsIHRoZSBWQ1BVIHJlc2V0IGFuZCBzZXQgdGhlIGNvbXBsZXRlIHN0YXRlLAo+IGJl
Y2F1c2UgdGhlIHVzZXJzcGFjZSBleGl0IGFscmVhZHkgcHJvdmlkZXMgYWxsIHRoZSBzYmkgaW5m
b3JtYXRpb24uCj4KPiBJJ2xsIGRyb3AgdGhpcyBjaGFuZ2UuICBJdCBkb2Vzbid0IG1ha2UgbXVj
aCBzZW5zZSBpZiB3ZSBhcmVuJ3QgZml4aW5nCj4gdGhlIHNiaV9oYXJ0X3N0YXJ0IHJlc2V0Lgo+
Cj4gPj4gVGhlIHBhdGNoIGlzIHJldXNpbmcgTVBfU1RBVEVfSU5JVF9SRUNFSVZFRCwgYmVjYXVz
ZSB3ZSBkaWRuJ3Qgd2FudCB0bwo+ID4+IGFkZCBhIG5ldyBJT0NUTCwgc29ycnkuIDopCj4gPj4K
PiA+PiBTaWduZWQtb2ZmLWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3Jv
LmNvbT4KPiA+PiAtLS0KPiA+PiBJZiB5b3Ugc2VhcmNoIGZvciBjYXAgNy40MiBpbiBhcGkucnN0
LCB5b3UnbGwgc2VlIHRoYXQgaXQgaGFzIGEgd3JvbmcKPiA+PiBudW1iZXIsIHdoaWNoIGlzIHdo
eSB3ZSdyZSA3LjQzLCBpbiBjYXNlIHNvbWVvbmUgYm90aGVycyB0byBmaXggQVJNLgo+ID4+Cj4g
Pj4gSSB3YXMgYWxzbyBzdHJvbmdseSBjb25zaWRlcmluZyBjcmVhdGluZyBhbGwgVkNQVXMgaW4g
UlVOTkFCTEUgc3RhdGUgLS0KPiA+PiBkbyB5b3Uga25vdyBvZiBhbnkgc2ltaWxhciBxdWlya3Mg
dGhhdCBhcmVuJ3QgaW1wb3J0YW50LCBidXQgY291bGQgYmUKPiA+PiBmaXhlZCB3aXRoIHRoZSBu
ZXcgdXNlcnNwYWNlIHRvZ2dsZT8KPiA+Cj4gPiBVcG9uIGNyZWF0aW5nIGEgVk0sIG9ubHkgb25l
IFZDUFUgc2hvdWxkIGJlIFJVTk5BQkxFIGFuZCBhbGwKPiA+IG90aGVyIFZDUFVzIG11c3QgcmVt
YWluIGluIE9GRiBzdGF0ZS4gVGhpcyBpcyBpbnRlbnRpb25hbCBiZWNhdXNlCj4gPiBpbWFnaW5l
IGEgbGFyZ2UgbnVtYmVyIG9mIFZDUFVzIGVudGVyaW5nIEd1ZXN0IE9TIGF0IHRoZSBzYW1lCj4g
PiB0aW1lLiBXZSBoYXZlIHNwZW50IGEgbG90IG9mIGVmZm9ydCBpbiB0aGUgcGFzdCB0byBnZXQg
YXdheSBmcm9tIHRoaXMKPiA+IHNpdHVhdGlvbiBldmVuIGluIHRoZSBob3N0IGJvb3QgZmxvdy4g
V2UgY2FuJ3QgZXhwZWN0IHVzZXIgc3BhY2UgdG8KPiA+IGNvcnJlY3RseSBzZXQgdGhlIGluaXRp
YWwgTVBfU1RBVEUgb2YgYWxsIFZDUFVzLiBXZSBjYW4gY2VydGFpbmx5Cj4gPiB0aGluayBvZiBz
b21lIG1lY2hhbmlzbSB1c2luZyB3aGljaCB1c2VyIHNwYWNlIGNhbiBzcGVjaWZ5Cj4gPiB3aGlj
aCBWQ1BVIHNob3VsZCBiZSBydW5uYWJsZSB1cG9uIFZNIGNyZWF0aW9uLgo+Cj4gV2UgYWxyZWFk
eSBkbyBoYXZlIHRoZSBtZWNoYW5pc20gLS0gdGhlIHVzZXJzcGFjZSB3aWxsIHNldCBNUF9TVEFU
RSBvZgo+IFZDUFUgMCB0byBTVE9QUEVEIGFuZCB3aGF0ZXZlciBWQ1BVcyBpdCB3YW50cyBhcyBi
b290IHdpdGggdG8gUlVOTkFCTEUKPiBiZWZvcmUgcnVubmluZyBhbGwgdGhlIFZDUFVzIGZvciB0
aGUgZmlyc3QgdGltZS4KCk9rYXksIG5vdGhpbmcgdG8gYmUgZG9uZSBvbiB0aGlzIGZyb250LgoK
Pgo+IFRoZSB1c2Vyc3BhY2UgbXVzdCBjb3JyZWN0bHkgc2V0IHRoZSBpbml0aWFsIE1QIHN0YXRl
IGFueXdheSwgYmVjYXVzZSBhCj4gcmVzdW1lIHdpbGwgd2FudCBhIG1wX3N0YXRlIHRoYXQgYSBm
cmVzaCBib290Lgo+Cj4gPiBUaGUgY3VycmVudCBhcHByb2FjaCBpcyB0byBkbyBIU00gc3RhdGUg
bWFuYWdlbWVudCBpbiBrZXJuZWwKPiA+IHNwYWNlIGl0c2VsZiBhbmQgbm90IHJlbHkgb24gdXNl
ciBzcGFjZS4gQWxsb3dpbmcgdXNlcnNwYWNlIHRvCj4gPiByZXNldHRpbmcgYW55IFZDUFUgaXMg
ZmluZSBidXQgdGhpcyBzaG91bGQgbm90IGFmZmVjdCB0aGUgZmxvdyBmb3IKPiA+IFNCSSBIU00s
IFNCSSBTeXN0ZW0gUmVzZXQsIGFuZCBTQkkgU3lzdGVtIFN1c3BlbmQuCj4KPiBZZXMsIHRoYXQg
aXMgdGhlIGRlc2lnbiBJIHdhcyB0cnlpbmcgdG8gY2hhbmdlLiAgSSB0aGluayB1c2Vyc3BhY2UK
PiBzaG91bGQgaGF2ZSBjb250cm9sIG92ZXIgYWxsIGFzcGVjdHMgb2YgdGhlIGd1ZXN0IGl0IGV4
ZWN1dGVzIGluIEtWTS4KCkZvciBTQkkgSFNNLCB0aGUga2VybmVsIHNwYWNlIHNob3VsZCBiZSB0
aGUgb25seSBlbnRpdHkgbWFuYWdpbmcuCgo+Cj4gQWNjZWxlcmF0aW5nIFNCSSBpbiBLVk0gaXMg
Z29vZCwgYnV0IHVzZXJzcGFjZSBzaG91bGQgYmUgYWJsZSB0byBzYXkgaG93Cj4gdGhlIHVuc3Bl
Y2lmaWVkIHBhcnRzIGFyZSBpbXBsZW1lbnRlZC4gIFRyYXBwaW5nIHRvIHVzZXJzcGFjZSBpcyB0
aGUKPiBzaW1wbGVzdCBvcHRpb24uICAoQW5kIHN1ZmZpY2llbnQgZm9yIGVjYWxscyB0aGF0IGFy
ZSBub3QgYSBob3QgcGF0aC4pCj4KCkZvciB0aGUgdW5zcGVjaWZpZWQgcGFydHMsIHdlIGhhdmUg
S1ZNIGV4aXRzIGF0IGFwcHJvcHJpYXRlIHBsYWNlcwplLmcuIFNCSSBzeXN0ZW0gcmVzZXQsIFNC
SSBzeXN0ZW0gc3VzcGVuZCwgZXRjLgoKUmVnYXJkcywKQW51cAoKLS0gCmt2bS1yaXNjdiBtYWls
aW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
