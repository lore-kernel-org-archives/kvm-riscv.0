Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CB1E7717D
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 08:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cnXWKUuUly73TJbwO507WbjMEgwu/z0iweW8H71qggg=; b=k7iMabhfqKfK5X
	hpYknuWXrosL+UNFlZlDLEux44Grjld92AgHW6JUIj8KfeYBVeatSpYIkYoE9WgvRma9upc138LTC
	hDfgSUu7ybMaWy6hfEj0JkeoDNm/z48MKfNq1il5jytJcCEhKP44M/p12dEHAbFv7Yz1VIzbIuPhz
	HpkJ8DpnvAWzs58dpQ5WU1jrDydf0SJUPEgLKYhfKaD4KSCJOaeJOokIhk4vGM1QaVikexfHJ/HRd
	ngYmJ/Cb0APfuFtq2dIYiabAHdSb6mZ32oXeyppTC/KOsiqw2buSgBFpEztKbApBPU9kdX2aERooN
	36OfZijfw7a1CzJA3E9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLHeH-0000000E8mz-24gH;
	Wed, 11 Dec 2024 08:00:45 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLHeF-0000000E8lf-1XJO
	for kvm-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 08:00:44 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso4036070e87.0
        for <kvm-riscv@lists.infradead.org>; Wed, 11 Dec 2024 00:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1733904041; x=1734508841; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NrdQyx+9sJgMOUwBwVMN1glWXum3hUhQnd/9M2jQnTU=;
        b=RwQLD8F6gss8BLy2eEhiMJnqwK57NCL95wfEk3DrtWVdqwKQ6eZKH2q9Rogxh5FNEa
         81+LBVYRjInnKvR3ATxzNGFdIUNh4XEM3up3GGAuNdz6WUoRcxH8WlxJBZ8k/y7sn0BH
         ikN0/UVZ52II59XvBOnBnqTvu8sZwv7N2BBK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733904041; x=1734508841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrdQyx+9sJgMOUwBwVMN1glWXum3hUhQnd/9M2jQnTU=;
        b=oEqvD/o08u9H0TVEwzwDh8sP2uIAb4MITKzCj6FQMaxeWHKT7a17RQeToAMdWKf7Y7
         R2rzt3PADrgLNsev/H9EgmmdhH+zgeAm4i82ofaB4Mka2phsJP556xU4lN109feEKJWW
         utjlUAOpjDoky7bwjlb3AV0BBCqTQ/+/XnXW1QLb6gKEbv67+3CtBp0g1aIzC9F6QiQN
         mucIMYnUWY4RCs89N7CxlEbUpq7gK4aYeKdr8gMVngbDE4tlwQOwpU/MVWndSS1MY4aO
         7fh69tMwyzrn8hwPGRDSsGJSLjIxDvz1ZCEqBb8MZ2XPm/lq3W1Ck2fBKvIHl0zG6k23
         TlBA==
X-Forwarded-Encrypted: i=1; AJvYcCUbrWdY+UWccDfufMmB5vF1kXQF25G0qcD3vHneHvdXWzEybErTqvN1i6Gj0Lma+ZHPbaDv1JRXNg4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzCpaynvCyRFMsJ5bEbkzMMCEJPOxlqw+v3mxMhRO7ZQOOuJyVv
	kxUjP/ier2LtAP9oXW++gsFokGfihPwltniY6DTXFaGJbACgSDosAOZ44FaA8JvUM2az8qwOicP
	n8Q/igrA1ut8uXpvMPe7pMrhXPghoHDIXTpa9
X-Gm-Gg: ASbGncvtY1jEzw6ZYByEPUe1F0Wdvt1FEp0r5B0e5xBYNbzyuiRIN+HSA7V4eEOpbqh
	Lx3v/u9eMrdT1ZvHxLyU1YNVGcONwMJFW
X-Google-Smtp-Source: AGHT+IEhXnfeK6yO+W2v4MmlALgxJLxT2l4+DlzKO1Sr/OCd9GCNnNzwop5M3W30nNLemrP0ZOnN3mjY5YVh2yw5dBo=
X-Received: by 2002:a05:6512:1110:b0:53e:3729:eaec with SMTP id
 2adb3069b0e04-5402a5dad39mr512830e87.22.1733904040239; Wed, 11 Dec 2024
 00:00:40 -0800 (PST)
MIME-Version: 1.0
References: <83c2234d582b7e823ce9ac9b73a6bbcf63971a29.1724911120.git.zhouquan@iscas.ac.cn>
 <b5128162-278a-4284-8271-b2b91dc446e1@iscas.ac.cn> <380f4da9-50e9-4632-bdc8-b1723eb19ca5@sifive.com>
 <CAAhSdy1zSTWuTW1KohUDXr9UXUx-QL1A30AUkTGoL7W2L7JWLQ@mail.gmail.com> <d161a6ea-6975-4427-8de8-93d4ee9e80fb@sifive.com>
In-Reply-To: <d161a6ea-6975-4427-8de8-93d4ee9e80fb@sifive.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 11 Dec 2024 00:00:28 -0800
Message-ID: <CAOnJCUJr8_EWrtU_9i1U+6KRNRhqyt__sS5J5Q+vueOfchNM2w@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Redirect instruction access fault trap to guest
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Anup Patel <anup@brainfault.org>, Quan Zhou <zhouquan@iscas.ac.cn>, ajones@ventanamicro.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_000043_507865_B2079326 
X-CRM114-Status: GOOD (  39.20  )
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

T24gU2F0LCBTZXAgMTQsIDIwMjQgYXQgOTozOeKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBPbiAyMDI0LTA5LTEy
IDExOjMyIFBNLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gT24gRnJpLCBTZXAgMTMsIDIwMjQgYXQg
NjowOeKAr0FNIFNhbXVlbCBIb2xsYW5kCj4gPiA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4g
d3JvdGU6Cj4gPj4KPiA+PiBPbiAyMDI0LTA5LTEyIDQ6MDMgQU0sIFF1YW4gWmhvdSB3cm90ZToK
PiA+Pj4KPiA+Pj4gT24gMjAyNC84LzI5IDE0OjIwLCB6aG91cXVhbkBpc2Nhcy5hYy5jbiB3cm90
ZToKPiA+Pj4+IEZyb206IFF1YW4gWmhvdSA8emhvdXF1YW5AaXNjYXMuYWMuY24+Cj4gPj4+Pgo+
ID4+Pj4gVGhlIE0tbW9kZSByZWRpcmVjdHMgYW4gdW5oYW5kbGVkIGluc3RydWN0aW9uIGFjY2Vz
cwo+ID4+Pj4gZmF1bHQgdHJhcCBiYWNrIHRvIFMtbW9kZSB3aGVuIG5vdCBkZWxlZ2F0aW5nIGl0
IHRvCj4gPj4+PiBWUy1tb2RlKGhlZGVsZWcpLiBIb3dldmVyLCBLVk0gcnVubmluZyBpbiBIUy1t
b2RlCj4gPj4+PiB0ZXJtaW5hdGVzIHRoZSBWUy1tb2RlIHNvZnR3YXJlIHdoZW4gYmFjayBmcm9t
IE0tbW9kZS4KPiA+Pj4+Cj4gPj4+PiBUaGUgS1ZNIHNob3VsZCByZWRpcmVjdCB0aGUgdHJhcCBi
YWNrIHRvIFZTLW1vZGUsIGFuZAo+ID4+Pj4gbGV0IFZTLW1vZGUgdHJhcCBoYW5kbGVyIGRlY2lk
ZSB0aGUgbmV4dCBzdGVwLgo+ID4+Pj4KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IFF1YW4gWmhvdSA8
emhvdXF1YW5AaXNjYXMuYWMuY24+Cj4gPj4+PiAtLS0KPiA+Pj4+ICAgYXJjaC9yaXNjdi9rdm0v
dmNwdV9leGl0LmMgfCAxICsKPiA+Pj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
Cj4gPj4+Pgo+ID4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfZXhpdC5jIGIv
YXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMKPiA+Pj4+IGluZGV4IGZhOThlNWMwMjRiMi4uNjk2
YjYyODUwZDBiIDEwMDY0NAo+ID4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMK
PiA+Pj4+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfZXhpdC5jCj4gPj4+PiBAQCAtMTgyLDYg
KzE4Miw3IEBAIGludCBrdm1fcmlzY3ZfdmNwdV9leGl0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwg
c3RydWN0Cj4gPj4+PiBrdm1fcnVuICpydW4sCj4gPj4+PiAgICAgICByZXQgPSAtRUZBVUxUOwo+
ID4+Pj4gICAgICAgcnVuLT5leGl0X3JlYXNvbiA9IEtWTV9FWElUX1VOS05PV047Cj4gPj4+PiAg
ICAgICBzd2l0Y2ggKHRyYXAtPnNjYXVzZSkgewo+ID4+Pj4gKyAgICBjYXNlIEVYQ19JTlNUX0FD
Q0VTUzoKPiA+Pj4KPiA+Pj4gQSBnZW50bGUgcGluZywgdGhlIGluc3RydWN0aW9uIGFjY2VzcyBm
YXVsdCBzaG91bGQgYmUgcmVkaXJlY3RlZCB0bwo+ID4+PiBWUy1tb2RlIGZvciBoYW5kbGluZywg
aXMgbXkgdW5kZXJzdGFuZGluZyBjb3JyZWN0Pwo+ID4+Cj4gPj4gWWVzLCB0aGlzIGxvb2tzIGNv
cnJlY3QuIEhvd2V2ZXIsIEkgYmVsaWV2ZSBpdCB3b3VsZCBiZSBlcXVpdmFsZW50IChhbmQgbW9y
ZQo+ID4+IGVmZmljaWVudCkgdG8gYWRkIEVYQ19JTlNUX0FDQ0VTUyB0byBLVk1fSEVERUxFR19E
RUZBVUxUIGluIGFzbS9rdm1faG9zdC5oLgo+ID4+Cj4gPj4gSSBkb24ndCB1bmRlcnN0YW5kIHdo
eSBzb21lIGV4Y2VwdGlvbnMgYXJlIGRlbGVnYXRlZCB3aXRoIGhlZGVsZWcgYW5kIG90aGVycyBh
cmUKPiA+PiBjYXVnaHQgYW5kIHJlZGlyZWN0ZWQgaGVyZSB3aXRoIG5vIGZ1cnRoZXIgcHJvY2Vz
c2luZy4gTWF5YmUgc29tZW9uZSB0aG91Z2h0Cj4gPj4gdGhhdCBpdCB3YXNuJ3QgdmFsaWQgdG8g
c2V0IGEgYml0IGluIGhlZGVsZWcgaWYgdGhlIGNvcnJlc3BvbmRpbmcgYml0IHdhcwo+ID4+IGNs
ZWFyZWQgaW4gbWVkZWxlZz8gQnV0IHRoaXMgZG9lc24ndCBtYWtlIHNlbnNlLCBhcyBTLW1vZGUg
Y2Fubm90IGtub3cgd2hpY2gKPiA+PiBiaXRzIGFyZSBzZXQgaW4gbWVkZWxlZyAobWF5YmUgbm9u
ZSBhcmUhKS4KPiA+Pgo+ID4+IFNvIHRoZSBoeXBlcnZpc29yIG11c3QgZWl0aGVyOgo+ID4+ICAx
KSBhc3N1bWUgTS1tb2RlIGZpcm13YXJlIGNoZWNrcyBoZWRlbGVnIGFuZCByZWRpcmVjdHMgZXhj
ZXB0aW9ucyB0byBWUy1tb2RlCj4gPj4gICAgIHJlZ2FyZGxlc3Mgb2YgbWVkZWxlZywgaW4gd2hp
Y2ggY2FzZSBhbGwgZm91ciBvZiB0aGVzZSBleGNlcHRpb25zIGNhbiBiZQo+ID4+ICAgICBtb3Zl
ZCB0byBLVk1fSEVERUxFR19ERUZBVUxUIGFuZCByZW1vdmVkIGZyb20gdGhpcyBzd2l0Y2ggc3Rh
dGVtZW50LCBvcgo+ID4+Cj4gPj4gIDIpIGFzc3VtZSBNLW1vZGUgbWlnaHQgbm90IGNoZWNrIGhl
ZGVsZWcgYW5kIHJlZGlyZWN0IGV4Y2VwdGlvbnMgdG8gVlMtbW9kZSwKPiA+PiAgICAgYW5kIHNp
bmNlIG5vIGJpdHMgYXJlIGd1YXJhbnRlZWQgdG8gYmUgc2V0IGluIG1lZGVsZWcsIGFueSBiaXQg
c2V0IGluCj4gPj4gICAgIGhlZGVsZWcgbXVzdCBfYWxzb18gYmUgaGFuZGxlZCBpbiB0aGUgc3dp
dGNoIGNhc2UgaGVyZS4KPiA+Pgo+ID4+IEFudXAsIEF0aXNoLCB0aG91Z2h0cz8KPiA+Cj4gPiBB
bnkgZXhjZXB0aW9uIGRlbGVnYXRlZCB0byBWUy1tb2RlIHZpYSBoZWRlbGVnIG1lYW5zIGl0IGlz
IGRpcmVjdGx5IGRlbGl2ZXJlZAo+ID4gdG8gVlMtbW9kZSB3aXRob3V0IGFueSBpbnRlcnZlbnRp
b24gb2YgSFMtbW9kZS4gVGhpcyBhbGlnbnMgd2l0aCB0aGUgUklTQy1WCj4gPiBwcml2IHNwZWNp
ZmljYXRpb24gYW5kIHRoZXJlIGlzIG5vIGFsdGVybmF0ZSBzZW1hbnRpY3MgYXNzdW1lZCBieSBL
Vk0gUklTQy1WLgo+ID4KPiA+IEF0IHRoZSBtb21lbnQsIGZvciBLVk0gUklTQy1WIHdlIGFyZSBj
b252ZXJnaW5nIHRvd2FyZHMgdGhlIGZvbGxvd2luZwo+ID4gYXBwcm9hY2g6Cj4gPgo+ID4gMSkg
T25seSBkZWxlZ2F0ZSAic3VwZXJ2aXNvciBleHBlY3RlZCIgdHJhcHMgdG8gVlMtbW9kZSB2aWEg
aGVkZWxlZwo+ID4gd2hpY2ggc3VwZXJ2aXNvciBzb2Z0d2FyZSBpcyBnZW5lcmFsbHkgZXhwZWN0
ZWQgdG8gZGlyZWN0bHkgaGFuZGxlIHN1Y2gKPiA+IGFzIGJyZWFrcG9pbnQsIHVzZXIgc3lzY2Fs
bCwgaW5zdCBwYWdlIGZhdWx0LCBsb2FkIHBhZ2UgZmF1bHQsIGFuZCBzdG9yZQo+ID4gcGFnZSBm
YXVsdC4KPiA+Cj4gPiAyKSBPdGhlciAic3VwZXJ2aXNvciB1bmV4cGVjdGVkIiB0cmFwcyBhcmUg
cmVkaXJlY3RlZCB0byBWUy1tb2RlIHZpYQo+ID4gc29mdHdhcmUgaW4gSFMtbW9kZSBiZWNhdXNl
IHRoZXNlIGFyZSBub3QgdHlwaWNhbGx5IGV4cGVjdGVkIGJ5IHN1cGVydmlzb3IKPiA+IHNvZnR3
YXJlIGFuZCBLVk0gUklTQy1WIHNob3VsZCBhdCBsZWFzdCBnYXRoZXIgc29tZSBzdGF0cyBmb3Ig
c3VjaCB0cmFwcy4KPgo+IENhbiB5b3UgcG9pbnQgbWUgdG8gd2hlcmUgd2UgY29sbGVjdCBzdGF0
cyBmb3IgdGhlc2UgdHJhcHM/IEkgZG9uJ3Qgc2VlIGFueSBjb2RlCj4gaW4ga3ZtX3Jpc2N2X3Zj
cHVfZXhpdCgpIHRoYXQgZG9lcyB0aGlzLgo+CgpJdCBkb2Vzbid0IGV4aXN0IHRvZGF5LiBCdXQg
d2Ugc2hvdWxkIGFkZCBpdCBmb3IgZGVidWcgcHVycG9zZXMgSU1PLgoKPiA+IFByZXZpb3VzbHks
IHdlIHdlcmUgcmVkaXJlY3Rpbmcgc3VjaCB1bmV4cGVjdCB0cmFwcyB0byBLVk0gdXNlciBzcGFj
ZQo+ID4gd2hlcmUgdGhlIEtWTSB1c2VyIHNwYWNlIHRvb2wgd2lsbCBzaW1wbHkgZHVtcCB0aGUg
VkNQVSBzdGF0ZSBhbmQga2lsbAo+ID4gdGhlIEd1ZXN0L1ZNLgo+Cj4gQ3VycmVudGx5IHdlIGhh
dmUgNSBleGNlcHRpb24gdHlwZXMgdGhhdCBnbyB0aHJvdWdoIHNvZnR3YXJlIGluIEhTLW1vZGUg
YnV0Cj4gbmV2ZXIga2lsbCB0aGUgZ3Vlc3Q6IEVYQ19JTlNUX0lMTEVHQUwsIEVYQ19MT0FEX01J
U0FMSUdORUQsCj4gRVhDX1NUT1JFX01JU0FMSUdORUQsIEVYQ19MT0FEX0FDQ0VTUywgYW5kIEVY
Q19TVE9SRV9BQ0NFU1MuIEFyZSB0aG9zZQo+IGNvbnNpZGVyZWQgImV4cGVjdGVkIiBvciAidW5l
eHBlY3RlZCI/Cj4KPiA+IFRoZSBpbnN0IG1pc2FsaWduZWQgdHJhcCB3YXMgaGlzdG9yaWNhbGx5
IGFsd2F5cyBzZXQgaW4gaGVkZWxlZyBidXQgd2UKPiA+IHNob3VsZCB1cGRhdGUgaXQgYmFzZWQg
b24gdGhlIGFib3ZlIGFwcHJvYWNoLgo+Cj4gV2hhdCBhcmUgdGhlIGNyaXRlcmlhIGZvciBkZXRl
cm1pbmluZyBpZiBhIHRyYXAgaXMgInN1cGVydmlzb3IgZXhwZWN0ZWQiIG9yCj4gInN1cGVydmlz
b3IgdW5leHBlY3RlZCI/IENlcnRhaW5seSBhbnkgdHJhcCB0aGF0IGNhbiBiZSB0cmlnZ2VyZWQg
YnkgbWlzYmVoYXZlZAo+IHNvZnR3YXJlIGluIFZVLW1vZGUgc2hvdWxkIG5vdCBraWxsIHRoZSBn
dWVzdC4gU2ltaWxhcmx5LCBhbnkgdHJhcCB0aGF0IGNhbiBiZQo+IHRyaWdnZXJlZCBieSBhIG1p
c2JlaGF2ZWQgbmVzdGVkIFZTLW1vZGUgZ3Vlc3Qgc2hvdWxkIG5vdCBraWxsIHRoZSBvdXRlciBn
dWVzdAo+IGVpdGhlci4KPgo+IFNvIHRoZSBvbmx5IHJlYXNvbiBJIHNlZSBmb3Igbm90IGRlbGVn
YXRpbmcgdGhlbSBpcyB0byBjb2xsZWN0IHN0YXRzLCBidXQgSQo+IHdvbmRlciBpZiB0aGF0IGlz
IHdvcnRoIHRoZSBwZXJmb3JtYW5jZSBjb3N0LiBJIHdvdWxkIHJhdGhlciBtYWtlIG1pc2FsaWdu
ZWQKPiBsb2Fkcy9zdG9yZXMgKGZvciBleGFtcGxlKSBmYXN0ZXIgaW4gdGhlIGd1ZXN0IHRoYW4g
aGF2ZSBhIGNvdW50IG9mIHRoZW0gYXQgdGhlCj4gaHlwZXJ2aXNvciBsZXZlbC4KPgoKVGhlc2Ug
YXJlIG5vdCBpbiBhIGhvdCBwYXRoIHdoZXJlIHVwZGF0aW5nIGEgc3RhdHMgY291bnRlciB3aWxs
IGFmZmVjdAp0aGUgcGVyZm9ybWFuY2UuCkkgdGhpbmsgd2Ugc2hvdWxkIHVzZSBib3RoIGt2bSBz
dGF0cyAoZm9yIG1vbml0b3JpbmcgZnJvbSB0aGUgaG9zdCkKYW5kIFNCSSBQTVUgZmlybXdhcmUg
Y291bnRlcnMgKGZvciBtb25pdG9yaW5nIHdpdGhpbiB0aGUgZ3Vlc3QpCndoaWNoIHdpbGwgaGVs
cCBib3RoIGd1ZXN0IGFuZCB0aGUgaG9zdCBwZXJmb3JtYW5jZSBib3R0bGVuZWNrcy4KCkkgd2ls
bCBzZW5kIGEgcGF0Y2guCgo+IFJlZ2FyZHMsCj4gU2FtdWVsCj4KCgotLSAKUmVnYXJkcywKQXRp
c2gKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2
Cg==
