Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990F9C7115B
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 15:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9iQd2HIgybcYpfX8bV03Cfp7AqtItlZJUIW+INyi6o=; b=E5dV2lI58aha1V
	jfwXBx7wxEhq5adLBK2hewZkPgJ6/HL/NDoMT/GNpeIFSAc6jkVsR8PGoEVX+HrOSxo0wnTV/kyZ/
	ddEs3PPOxllqSsMPDmufyqkB6cHhZqh3pSciTSjhnKdQIM4OkHfAMxkafXSNVcBCSr8bboGlmPAgx
	ryR1eapmwMkJmEF9gbOO7Hvyv3NsWZjegYIZrvRdtqP8GQnlzIFKWVzAFNpESHSDLBVdGucQopnTV
	EEk5kGVQP46yPdN5c1Q++v1ggzynmzN1zZB7kgrJjeXgWyuztROsbyGazC0hqGOh+TSHBJlX8zjaY
	kwO6DuAakALCtAgaq3tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTj8l-00000003FEX-0Khu;
	Mon, 23 Jun 2025 15:31:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTg2d-00000002dNw-1RQD
	for kvm-riscv@bombadil.infradead.org;
	Mon, 23 Jun 2025 12:12:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eHyOQjUXQ/n7o6SDLI9e+lRQsNueNKsItK2jIA0gB9c=; b=Z+EG6eAKjJlQOE7+k68Su1Y/cG
	x2zUDC5pFAac3viDNN3J46flo8EG/aMP2IBKOtK2QJvQh0YhuUmRDWglu5MXgulcwW/bDv4nMSz4l
	t0mvr1y4gl4TJK+t8hd3b0DOQKBVcXcsv5HLD2UxoU47UCC6H/RlhYj8wgRHVWhQQJfCWyldyvUu+
	d2VPBDZ0CvtA37O/Vb3Wcg6cpATOAVBoUs2uWQI4J+ZACzF1Iod7nfJGySJXalA13rvBgNXY3xZVg
	sfFVvisWVYVpCOI4d4hKauEf6r7Q2hzP0da/Zf1xC5OKCimiRfvydoSG702k4+mZhw3S0o+eqo50x
	uqBJ3szg==;
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTg2X-00000005D0g-2jih
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 12:12:50 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b271f3ae786so3023214a12.3
        for <kvm-riscv@lists.infradead.org>; Mon, 23 Jun 2025 05:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750680762; x=1751285562; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHyOQjUXQ/n7o6SDLI9e+lRQsNueNKsItK2jIA0gB9c=;
        b=Ci+i000B7GXKi9RvFNHNJ7XFe/UvbHhtHXTSx39QRSzMrDmusjEJM6yPsnz+jD6Y1Y
         FXFjfui4Z2CUUAkenm20VBZtx6CirhcskKZCx1IdTKAekutC2gZyNv3/uEnSF+yH9C9p
         QKv+14CZeyXmEouXyi1POhrlMIpJ52ufy7IcUXIeHQtgedTzWptRIjyYGJx9o7zzlr2Q
         WWbaERRYDPkDLl38YsLeNnrE2cbtyIfiFov/uiO5OLc5tyvnMFXFELJ0RfXvavbEvfrA
         83v9W6yWOqsulA7oAP9Z9g1H2yS6WS6vn0I9pRcghlNY7DnS76k0aIfvF6bW7KQAq4mf
         RUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750680762; x=1751285562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHyOQjUXQ/n7o6SDLI9e+lRQsNueNKsItK2jIA0gB9c=;
        b=rXdjL0/uEStVq/rYMeLUBuUNP/nuazjQ8FkYlvaHzxzr8Aani11dvF8xtDDzdlmcBm
         PY3XBmpBo2fqymLpJpeFmj4RihrxKNvT+22s+2azRkdDIQgOfVBuDFcB49fAY76U69Bf
         WRxVhHDqcAwhSDW+JJdTFSDoO93kB5SCXqDoyLWyFmfMPU2OzXmXVIAs7dT3KmwpsNEd
         Ivu8LpC+KRZucNaulOXHMQZumziRnA2VGGg4PCYFIc/sHr7J254NgpgPngauKpxA5EDb
         XfFxPgj4svr7KdEPX+ui7hLBX02RnFUAcbz+0b68pXZ/7QPNz1eVw+0GGTLJTy2+m8tO
         TltQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDWGki4b3P9S6lzXnvgvWbpv+7p5/Cj+t08TJIkYjBJ36T36CBlgAMMOdUBmE/rxGcJ2iaYxn/Gfw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxNnVZtyYmRGoz3cqRumKArq4NsRTRvCL4Tajn/+vIuzeoTqtcZ
	doixZung1rHkUaOY7ODZ4qJMnAw3vjXh1pPqzoGs2pI2udFbmCe5IfURnifo23wPeoodNSfW8Zr
	BetxHt419lKdf2EyziXEJ0SwYLF04Oq+RJi04G85CNw==
X-Gm-Gg: ASbGncvFFLs1gTY0dcuFY68Y/Ka4CZ6VZ8x7vZidwC3DctVSyln6bnYVSd8V3L7fmg7
	iwUGueIMab3Jh8bbb+Smo1QjeZElZFXd/tJFrk8S9HttNYyoPpjWGQoF4mFjLC5xRS40/OOW8Tj
	9uRA3UI5mQ7cwUBRzFvplDtbLRRK+3+cj/E0wjG3b8hXpmkFAlA0JnMCS3bxs6Zdzj2dU=
X-Google-Smtp-Source: AGHT+IG6HZ/8Fi0eQ+rXE+47WUzLt+zmbjPe+C1XDxRfNdt32Ri4/qwaBYXVXZGqFfIan5V1AhcN8nK7xhtxwnbINxY=
X-Received: by 2002:a17:90b:2dd0:b0:311:9c1f:8522 with SMTP id
 98e67ed59e1d1-3159d6466bfmr19690671a91.10.1750680762455; Mon, 23 Jun 2025
 05:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250620091720.85633-1-luxu.kernel@bytedance.com>
 <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com> <1d9ad2a8-6ab5-4f5e-b514-4a902392e074@rivosinc.com>
In-Reply-To: <1d9ad2a8-6ab5-4f5e-b514-4a902392e074@rivosinc.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Mon, 23 Jun 2025 20:12:31 +0800
X-Gm-Features: AX0GCFtYKxGqlHuJJ47JAXMxUFhLXnT6cZnnppHiAtMF1rC-04ON37kUhYiGk7I
Message-ID: <CAPYmKFs7tmMg4VQX=5YFhSzDGxodiBxv+v1SoqwTHvE1Khsr_A@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: KVM: Delegate illegal instruction fault
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	anup@brainfault.org, atish.patra@linux.dev, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_131246_322089_C8C491B5 
X-CRM114-Status: GOOD (  16.91  )
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

SGkgQ2zDqW1lbnQsCgpPbiBNb24sIEp1biAyMywgMjAyNSBhdCA0OjA14oCvUE0gQ2zDqW1lbnQg
TMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+Cj4KPiBPbiAyMC8wNi8yMDI1
IDE0OjA0LCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4gPiAyMDI1LTA2LTIwVDE3OjE3OjIwKzA4
OjAwLCBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT46Cj4gPj4gRGVsZWdhdGUgaWxs
ZWdhbCBpbnN0cnVjdGlvbiBmYXVsdCB0byBWUyBtb2RlIGluIGRlZmF1bHQgdG8gYXZvaWQgc3Vj
aAo+ID4+IGV4Y2VwdGlvbnMgYmVpbmcgdHJhcHBlZCB0byBIUyBhbmQgcmVkaXJlY3RlZCBiYWNr
IHRvIFZTLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVk
YW5jZS5jb20+Cj4gPj4gLS0tCj4gPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20va3ZtX2hvc3QuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+ID4+IEBA
IC00OCw2ICs0OCw3IEBACj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBCSVQoRVhDX0lOU1RfSUxMRUdBTCkgICAgfCBcCj4gPgo+ID4gWW91IHNob3VsZCBhbHNvIHJl
bW92ZSB0aGUgZGVhZCBjb2RlIGluIGt2bV9yaXNjdl92Y3B1X2V4aXQuCj4gPgo+ID4gQW5kIHdo
eSBub3QgZGVsZWdhdGUgdGhlIG90aGVycyBhcyB3ZWxsPwo+ID4gKEVYQ19MT0FEX01JU0FMSUdO
RUQsIEVYQ19TVE9SRV9NSVNBTElHTkVELCBFWENfTE9BRF9BQ0NFU1MsCj4gPiAgRVhDX1NUT1JF
X0FDQ0VTUywgYW5kIEVYQ19JTlNUX0FDQ0VTUy4pCj4KPiBDdXJyZW50bHksIE9wZW5TQkkgZG9l
cyBub3QgZGVsZWdhdGUgbWlzYWxpZ25lZCBleGNlcHRpb24gYnkgZGVmYXVsdCBhbmQKPiBoYW5k
bGVzIG1pc2FsaWduZWQgYWNjZXNzIGJ5IGl0c2VsZiwgdGhpcyBpcyAocGFydGlhbGx5KSB3aHkg
d2UgYWRkZWQKPiB0aGUgRldGVCBTQkkgZXh0ZW5zaW9uIHRvIHJlcXVlc3Qgc3VjaCBkZWxlZ2F0
aW9uLiBTaW5jZSBzb21lIHN1cGVydmlzb3IKPiBzb2Z0d2FyZSBleHBlY3QgdGhhdCBkZWZhdWx0
LCB0aGV5IGRvIG5vdCBoYXZlIGNvZGUgdG8gaGFuZGxlIG1pc2FsaWduZWQKPiBhY2Nlc3NlcyBl
bXVsYXRpb24uIFNvIHRoZXkgc2hvdWxkIG5vdCBiZSBkZWxlZ2F0ZWQgYnkgZGVmYXVsdC4KCkl0
IGRvZXNuJ3QgbWF0dGVyIHdoZXRoZXIgdGhlc2UgZXhjZXB0aW9ucyBhcmUgZGVsZWdhdGVkIGlu
IG1lZGVsZWcuCktWTSBpbiBIUy1tb2RlIGRvZXMgbm90IGhhbmRsZSBpbGxlZ2FsIGluc3RydWN0
aW9uIG9yIG1pc2FsaWduZWQKYWNjZXNzIGFuZCBvbmx5IHJlZGlyZWN0cyB0aGVtIGJhY2sgdG8g
VlMtbW9kZS4gRGVsZWdhdGluZyBzdWNoCmV4Y2VwdGlvbnMgaW4gaGVkZWxlZyBoZWxwcyBzYXZl
IENQVSB1c2FnZSBldmVuIHdoZW4gdGhleSBhcmUgbm90CmRlbGVnYXRlZCBpbiBtZWRlbGVnOiBv
cGVuc2JpIHdpbGwgY2hlY2sgd2hldGhlciB0aGVzZSBleGNlcHRpb25zIGFyZQpkZWxlZ2F0ZWQg
dG8gVlMtbW9kZSBhbmQgcmVkaXJlY3QgdGhlbSB0byBWUy1tb2RlIGlmIHBvc3NpYmxlLiBUaGVy
ZQpzZWVtcyB0byBiZSBubyBjb25mbGljdHMgd2l0aCBTU0UgaW1wbGVtZW50YXRpb24uIFBsZWFz
ZSBjb3JyZWN0IG1lIGlmCkkgbWlzc2VkIGFueXRoaW5nLgoKQmVzdCBSZWdhcmRzLApYdSBMdQoK
Pgo+IFRoYW5rcywKPgo+IENsw6ltZW50Cj4KPiA+Cj4gPiBUaGFua3MuCj4gPgo+ID4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdAo+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+Cgot
LSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
