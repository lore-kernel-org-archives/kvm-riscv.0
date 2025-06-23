Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40901C7115B
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 17:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G7mVbjTrw2coRpnTR6vW7z6sokvusWItZ6oeD5auCns=; b=Jzf7r5sXPBNBq3
	FawmxnVHf5ys9UrOlsQST1HPzMOtdsXv90YcwWFIqd+sjF2YWGJ+mmd8dmkFsnrahWtpNelSJiL2H
	hnHBrkbvqtYljQttuMyBo1ctble2ma1HTrG7ovgDDtY1MWpkUUGzaj/Dj6LYR42j2Z9AZnb9T35H5
	A4EdqM7s/QuefNDeZ5jqnkR1Ljiyp6cy5MmxR682LAR/hRWTrEUOrkiu7BocmnyYRi3Aih7+9mTi0
	hFuzN/3gdY9BdsqOKrdRZH2YQEuclyRA7fFpofefLXf4BaLYZvU5k+kHM3vxBcCIxwVvf43ObUjID
	V7RtEsQ+cGYCLpAxcGJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTksj-00000003XfB-3yYX;
	Mon, 23 Jun 2025 17:22:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThrN-00000002z9x-1U8B
	for kvm-riscv@bombadil.infradead.org;
	Mon, 23 Jun 2025 14:09:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6cYOpmr7ejhSQ4NGHbHR+I2d9wPM35nKHPVPsDXvgEw=; b=YsE0np7qymDehn/FV1Ou9/aTjS
	LS/CEwUn48fd8Nafxp4jwqwphEfZkszBSwuK1vkSVc7Bk9sI6otwN82LtvFysu2mFspRB61ix0QEW
	KCfHrjBEVyEPagRFjUYmdQniWSAkYvK154gzpg2vIHqPkaiQQDBDv9se2OzDGoLWv8xOgEFTYqiRv
	eDgbL/vCktFBT8EPgBjQrqetXKwUwcsoxYw89DDs1/o/L48DYi3KiBeahoIOtrtIQFHmIdKSASa32
	Ah8p6ZuCc6oo3cKAXTeW/VtUG80ciCMaEuRjWXhm7jV2s6o3vNLiAEPGci+Ad6PxSDAwO67QzyLsZ
	rXxsoqvQ==;
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThrK-00000005Ejn-08T1
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 14:09:20 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b26f5f47ba1so3264618a12.1
        for <kvm-riscv@lists.infradead.org>; Mon, 23 Jun 2025 07:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750687754; x=1751292554; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cYOpmr7ejhSQ4NGHbHR+I2d9wPM35nKHPVPsDXvgEw=;
        b=abe4J0NSt8ZG4WRMf0WXkhXaT5LWn97DnWe6nkOLe09AR/B0XaU4cFJmpetUdfso80
         UX6sHeiE2IpMBcI34Pnvau5mSI17ghAg1aazeUlaQf2UFMSUV9UVyYoyfU/mfors6I2f
         LzwIQA6ETAEc5vf3aOjV1RiUlmxyLG/gPrh5ShwdeSRQ77gSbRY1lGesK5EDTtyH107b
         kJ6ovSORhWjxidHdFkrCPCXj9CVzgTZwVcjViIJHaCu0SCIihvBVftUnau4Bgs2jluKR
         3hNsPi3sOqK80mooxJkhsaiwGJqndZ3auEK+VO65AHM45f2ar6fufuoi0vQw4b8XY1BS
         7rvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687754; x=1751292554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cYOpmr7ejhSQ4NGHbHR+I2d9wPM35nKHPVPsDXvgEw=;
        b=GsKCv9j4PG8bjSFzJ7iqD2Z2iODxmEa11VBwYTuyT6lb05PcRXsfiK4hQA0wnmAWUu
         XPi2FpkQ3K8c/iQfmZldm2vIW0WcXf/noXgWGW9dJUR7syS6OZF5gv/FqN3R8ISR5f4R
         Iz7Pt6qeUypbJmfTCNkLbiThaFXpsyslb49gfT1KNg6ke7sE4WpDbGmjExrUxNK4HmtR
         jNl6LuAhmem1mSGMThiXkX6Uu4pFCdNRBqbNbx9gjSNZQ3ot/tG8Smfpyhc4W+y/KeEq
         EiJVVEDGK0kcz4ip/PWg9hYfGd1tMHMaKpmykduzl8iiadST9/BsddkugjaV+e8MyScj
         VCSw==
X-Forwarded-Encrypted: i=1; AJvYcCUScC+LuUaVVGUSu0lo4da9aNBIwujs9gRrbTWKWCp/I8lr4wb7N0eN1J/gI40PsHB93LKPWlxUsro=@lists.infradead.org
X-Gm-Message-State: AOJu0YyKvNgaWMWUndkvoyIDfxegJ6li2SFHM84SboT2PXXl55WRJG/8
	KRXzEVjgYYAOWAR42fuu+Xz6kldNRQ7F9qRkiO8rcYsh8FBzgtZffxvPlBsHWm78wKzwqdF2IeX
	hTNmd5nzx+Q5q/nu69qNjNbbJIzKoTotcMoVhf3DJ4A==
X-Gm-Gg: ASbGncsH3MYWn/5gisNNtBxn3FIfTNeNMbeb8oE/RvDeejAAazLFlOmgiGGBFQN03RM
	w18vsdZCESvg+IlHAG/F+wITv1n6EvvfeyoC9DPkgrRnv97/WRhsGdsPkwS/jVKc3yij+XQG3/u
	1vLkd30spqQ72PvmfKi/M6xrASswlZOh5bS3LFxz6qMZdl80xJT/lNq4X9
X-Google-Smtp-Source: AGHT+IEl1T3TohTpq5KxIngvVUlDJR7SLQRNvOOpNO1X72zLaXdZXqVz9cSwOMBrztsM8fp8gM2scP6AocjulndvZzo=
X-Received: by 2002:a17:90b:55c3:b0:312:f2ee:a895 with SMTP id
 98e67ed59e1d1-3159d8ff73bmr14894086a91.31.1750687753793; Mon, 23 Jun 2025
 07:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250620091720.85633-1-luxu.kernel@bytedance.com>
 <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com> <1d9ad2a8-6ab5-4f5e-b514-4a902392e074@rivosinc.com>
 <CAPYmKFs7tmMg4VQX=5YFhSzDGxodiBxv+v1SoqwTHvE1Khsr_A@mail.gmail.com>
 <4f47fae6-f516-4b6f-931e-92ee7c406314@rivosinc.com> <CAPYmKFvT6HcFByEq+zkh8UBUCyQS_Rv4drnCUU0o-HQ4eScVdA@mail.gmail.com>
 <b9203c8d-4c34-4eb3-a94f-5455cfc2eb53@rivosinc.com>
In-Reply-To: <b9203c8d-4c34-4eb3-a94f-5455cfc2eb53@rivosinc.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Mon, 23 Jun 2025 22:09:02 +0800
X-Gm-Features: AX0GCFuZxXab4k58liWIS-sy5UXZPZcmAeAg0GwIw73oyms0WAn0rXaWlAM8SU0
Message-ID: <CAPYmKFtCx0qg4fEOVAhthXYvhu-X0MR5zXZLVfSmbCmNMN=ZYg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: KVM: Delegate illegal instruction fault
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	anup@brainfault.org, atish.patra@linux.dev, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_150918_491923_BBCA1B45 
X-CRM114-Status: GOOD (  44.44  )
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

T24gTW9uLCBKdW4gMjMsIDIwMjUgYXQgOTo0MuKAr1BNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gMjMvMDYvMjAyNSAxNTozMCwgWHUgTHUg
d3JvdGU6Cj4gPiBIaSBDbMOpbWVudCwKPiA+Cj4gPiBPbiBNb24sIEp1biAyMywgMjAyNSBhdCA4
OjM14oCvUE0gQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+
Pgo+ID4+Cj4gPj4KPiA+PiBPbiAyMy8wNi8yMDI1IDE0OjEyLCBYdSBMdSB3cm90ZToKPiA+Pj4g
SGkgQ2zDqW1lbnQsCj4gPj4+Cj4gPj4+IE9uIE1vbiwgSnVuIDIzLCAyMDI1IGF0IDQ6MDXigK9Q
TSBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4+Pj4KPiA+
Pj4+Cj4gPj4+Pgo+ID4+Pj4gT24gMjAvMDYvMjAyNSAxNDowNCwgUmFkaW0gS3LEjW3DocWZIHdy
b3RlOgo+ID4+Pj4+IDIwMjUtMDYtMjBUMTc6MTc6MjArMDg6MDAsIFh1IEx1IDxsdXh1Lmtlcm5l
bEBieXRlZGFuY2UuY29tPjoKPiA+Pj4+Pj4gRGVsZWdhdGUgaWxsZWdhbCBpbnN0cnVjdGlvbiBm
YXVsdCB0byBWUyBtb2RlIGluIGRlZmF1bHQgdG8gYXZvaWQgc3VjaAo+ID4+Pj4+PiBleGNlcHRp
b25zIGJlaW5nIHRyYXBwZWQgdG8gSFMgYW5kIHJlZGlyZWN0ZWQgYmFjayB0byBWUy4KPiA+Pj4+
Pj4KPiA+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5j
b20+Cj4gPj4+Pj4+IC0tLQo+ID4+Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9rdm1faG9zdC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gPj4+
Pj4+IEBAIC00OCw2ICs0OCw3IEBACj4gPj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgQklUKEVYQ19JTlNUX0lMTEVHQUwpICAgIHwgXAo+ID4+Pj4+Cj4gPj4+Pj4g
WW91IHNob3VsZCBhbHNvIHJlbW92ZSB0aGUgZGVhZCBjb2RlIGluIGt2bV9yaXNjdl92Y3B1X2V4
aXQuCj4gPj4+Pj4KPiA+Pj4+PiBBbmQgd2h5IG5vdCBkZWxlZ2F0ZSB0aGUgb3RoZXJzIGFzIHdl
bGw/Cj4gPj4+Pj4gKEVYQ19MT0FEX01JU0FMSUdORUQsIEVYQ19TVE9SRV9NSVNBTElHTkVELCBF
WENfTE9BRF9BQ0NFU1MsCj4gPj4+Pj4gIEVYQ19TVE9SRV9BQ0NFU1MsIGFuZCBFWENfSU5TVF9B
Q0NFU1MuKQo+ID4+Pj4KPiA+Pj4+IEN1cnJlbnRseSwgT3BlblNCSSBkb2VzIG5vdCBkZWxlZ2F0
ZSBtaXNhbGlnbmVkIGV4Y2VwdGlvbiBieSBkZWZhdWx0IGFuZAo+ID4+Pj4gaGFuZGxlcyBtaXNh
bGlnbmVkIGFjY2VzcyBieSBpdHNlbGYsIHRoaXMgaXMgKHBhcnRpYWxseSkgd2h5IHdlIGFkZGVk
Cj4gPj4+PiB0aGUgRldGVCBTQkkgZXh0ZW5zaW9uIHRvIHJlcXVlc3Qgc3VjaCBkZWxlZ2F0aW9u
LiBTaW5jZSBzb21lIHN1cGVydmlzb3IKPiA+Pj4+IHNvZnR3YXJlIGV4cGVjdCB0aGF0IGRlZmF1
bHQsIHRoZXkgZG8gbm90IGhhdmUgY29kZSB0byBoYW5kbGUgbWlzYWxpZ25lZAo+ID4+Pj4gYWNj
ZXNzZXMgZW11bGF0aW9uLiBTbyB0aGV5IHNob3VsZCBub3QgYmUgZGVsZWdhdGVkIGJ5IGRlZmF1
bHQuCj4gPj4+Cj4gPj4+IEl0IGRvZXNuJ3QgbWF0dGVyIHdoZXRoZXIgdGhlc2UgZXhjZXB0aW9u
cyBhcmUgZGVsZWdhdGVkIGluIG1lZGVsZWcuCj4gPj4KPiA+PiBOb3Qgc3VyZSB0byB0b3RhbGx5
IHVuZGVyc3RhbmQsIGJ1dCBpZiB0aGUgZXhjZXB0aW9ucyBhcmUgbm90IGRlbGVnYXRlZAo+ID4+
IGluIG1lZGVsZWcsIHRoZXkgd29uJ3QgYmUgZGVsZWdhdGVkIHRvIFZTLW1vZGUgZXZlbiB0aG91
Z2ggaGVkZWxlZyBiaXQKPiA+PiBpcyBzZXQgcmlnaHQgPyBUaGUgc3BlYyBzYXlzOgo+ID4+Cj4g
Pj4gQSBzeW5jaHJvbm91cyB0cmFwIHRoYXQgaGFzIGJlZW4gZGVsZWdhdGVkIHRvIEhTLW1vZGUg
KHVzaW5nIG1lZGVsZWcpCj4gPj4gaXMgZnVydGhlciBkZWxlZ2F0ZWQgdG8gVlMtbW9kZSBpZiBW
PTEgYmVmb3JlIHRoZSB0cmFwIGFuZCB0aGUKPiA+PiBjb3JyZXNwb25kaW5nIGhlZGVsZWcgYml0
IGlzIHNldC4KPiA+Cj4gPiBZZXMsIHlvdSBhcmUgcmlnaHQuIFRoZSBpbGxlZ2FsIGluc24gZXhj
ZXB0aW9uIGlzIHN0aWxsIHRyYXBwZWQgaW4gTQo+ID4gbW9kZSBpZiBpdCBpcyBub3QgZGVsZWdh
dGVkIGluIG1lZGVsZWcuIEJ1dCBkZWxlZ2F0aW5nIGl0IGluIGhlZGVsZWcKPiA+IGlzIHN0aWxs
IHVzZWZ1bC4gVGhlIG9wZW5zYmkgd2lsbCBjaGVjayBDU1JfSEVERUxFRyBpbiB0aGUgZnVuY3Rp
b24KPiA+IHNiaV90cmFwX3JlZGlyZWN0LiBJZiB0aGUgZXhjZXB0aW9uIGhhcyBiZWVuIGRlbGVn
YXRlZCB0byBWUy1tb2RlIGluCj4gPiBDU1JfSEVETEVHLCBvcGVuc2JpIGNhbiBkaXJlY3RseSBy
ZXR1cm4gYmFjayB0byBWUy1tb2RlLCB3aXRob3V0IHRoZQo+ID4gb3ZlcmhlYWQgb2YgZ29pbmcg
YmFjayB0byBIUy1tb2RlIGFuZCB0aGVuIGdvaW5nIGJhY2sgdG8gVlMtbW9kZS4KPiA+Cj4gPj4K
PiA+Pgo+ID4+Cj4gPj4+IEtWTSBpbiBIUy1tb2RlIGRvZXMgbm90IGhhbmRsZSBpbGxlZ2FsIGlu
c3RydWN0aW9uIG9yIG1pc2FsaWduZWQKPiA+Pj4gYWNjZXNzIGFuZCBvbmx5IHJlZGlyZWN0cyB0
aGVtIGJhY2sgdG8gVlMtbW9kZS4gRGVsZWdhdGluZyBzdWNoCj4gPj4+IGV4Y2VwdGlvbnMgaW4g
aGVkZWxlZyBoZWxwcyBzYXZlIENQVSB1c2FnZSBldmVuIHdoZW4gdGhleSBhcmUgbm90Cj4gPj4+
IGRlbGVnYXRlZCBpbiBtZWRlbGVnOiBvcGVuc2JpIHdpbGwgY2hlY2sgd2hldGhlciB0aGVzZSBl
eGNlcHRpb25zIGFyZQo+ID4+PiBkZWxlZ2F0ZWQgdG8gVlMtbW9kZSBhbmQgcmVkaXJlY3QgdGhl
bSB0byBWUy1tb2RlIGlmIHBvc3NpYmxlLiBUaGVyZQo+ID4+PiBzZWVtcyB0byBiZSBubyBjb25m
bGljdHMgd2l0aCBTU0UgaW1wbGVtZW50YXRpb24uIFBsZWFzZSBjb3JyZWN0IG1lIGlmCj4gPj4+
IEkgbWlzc2VkIGFueXRoaW5nLgo+ID4+Cj4gPj4gQUZBSVUsIHRoaXMgbWVhbnMgdGhhdCBzaW5j
ZSBtZWRlbGVnIGJpdCBmb3IgbWlzYWxpZ25lZCBhY2Nlc3NlcyB3ZXJlCj4gPj4gbm90IGRlbGVn
YXRlZCB1cCB0byB0aGUgaW50cm9kdWN0aW9uIG9mIHRoZSBGV0ZUIGV4dGVuc2lvbiwgVlMtbW9k
ZQo+ID4+IGdlbmVyYXRlZCBtaXNhbGlnbmVkIGFjY2Vzc2VzIHdlcmUgaGFuZGxlZCBieSBPcGVu
U0JJIHJpZ2h0ID8gTm93IHRoYXQKPiA+PiB3ZSBhcmUgcmVxdWVzdGluZyBvcGVuU0JJIHRvIGRl
bGVnYXRlIG1pc2FsaWduZWQgYWNjZXNzZXMsIEhTLW1vZGUKPiA+PiBoYW5kbGVzIGl0J3Mgb3du
IG1pc2FsaWduZWQgYWNjZXNzZXMgdGhyb3VnaCB0aGUgdHJhcCBoYW5kbGVyLiBXaXRoIHRoYXQK
PiA+PiBjb25maWd1cmF0aW9uLCBpZiBWUy1tb2RlIGdlbmVyYXRlIGEgbWlzYWxpZ25lZCBhY2Nl
c3MsIGl0IHdpbGwgZW5kIHVwCj4gPj4gYmVpbmcgcmVkaXJlY3RlZCB0byBWUy1tb2RlIGFuZCB3
b24ndCBiZSBoYW5kbGUgYnkgSFMtbW9kZS4KPiA+Pgo+ID4+IFRvIHN1bW1hcml6ZSwgcHJpb3Ig
dG8gRldGVCwgbWVkZWxlZyB3YXNuJ3QgZGVsZWdhdGluZyBtaXNhbGlnbmVkCj4gPj4gYWNjZXNz
ZXMgdG8gUy1tb2RlOgo+ID4+Cj4gPj4gLSBWUy1tb2RlIG1pc2FsaWduZWQgYWNjZXNzIC0+IHRy
YXAgdG8gTS1tb2RlIC0+IE9wZW5TQkkgaGFuZGxlIGl0IC0+Cj4gPj4gQmFjayB0byBWUy1tb2Rl
LCBtaXNhbGlnbmVkIGFjY2VzcyBmaXhlZCB1cCBieSBPcGVuU0JJCj4gPgo+ID4gWWVzLCB0aGlz
IGlzIHdoYXQgSSB3YW50IHRoZSBwcm9jZWR1cmUgb2YgaGFuZGxpbmcgaWxsZWdhbCBpbnNuCj4g
PiBleGNlcHRpb25zIHRvIGJlLiBBY3R1YWxseSBpdCBub3cgYmVoYXZlcyBhczoKPiA+Cj4gPiBW
Uy1tb2RlIGlsbGVnYWwgaW5zbiBleGNlcHRpb24gLT4gdHJhcCB0byBNLW1vZGUgLT4gT3BlblNC
SSBoYW5kbGVzIGl0Cj4gPiAtPiBCYWNrIHRvIEhTLW1vZGUsIGRvZXMgbm90aGluZyAtPiBCYWNr
IHRvIFZTLW1vZGUuCj4gPgo+ID4gSSB3YW50IHRvIGF2b2lkIGdvaW5nIHRocm91Z2ggSFMtbW9k
ZS4KPgo+IEhpIFh1LAo+Cj4gWWVhaCwgdGhhdCBtYWtlIHNlbnNlIGFzIHdlbGwgYnV0IHRoYXQg
c2hvdWxkIG9ubHkgaGFwcGVuIGlmIHRoZSBWUy1tb2RlCj4gcmVxdWVzdGVkIG1pc2FsaWduZWQg
YWNjZXNzIGRlbGVnYXRpb24gdmlhIEtWTSBTQkkgRldGVCBpbnRlcmZhY2UuIEkKPiBrbm93IHRo
YXQgY3VycmVudGx5IEtWTSBkb2VzIGRvIGFueXRoaW5nIHVzZWZ1bCBmcm9tIHRoZSBtaXNhbGln
bmVkCj4gZXhjZXB0aW9uIGV4Y2VwdCByZWRpcmVjdGluZyBpdCB0byBWUy1tb2RlIGJ1dCBJTUhP
LCB0aGF0J3MgYSByZWdyZXNzaW9uCj4gSSBpbnRyb2R1Y2VkIHdpdGggRldGVCBtaXNhbGlnbmVk
IHJlcXVlc3RlZCBkZWxlZ2F0aW9uLi4uCj4KPiA+Cj4gPj4KPiA+PiBOb3cgdGhhdCBMaW51eCB1
c2VzIFNCSSBGV0ZUIHRvIGRlbGVnYXRlcyBtaXNhbGlnbmVkIGFjY2Vzc2VzICh3aXRob3V0Cj4g
Pj4gaGVkZWxlZyBiZWluZyBzZXQgZm9yIG1pc2FsaWduZWQgZGVsZWdhdGlvbiwgYnV0IHRoYXQg
ZG9lc24ndCByZWFsbHkKPiA+PiBtYXR0ZXIsIHRoZSBvdXRjb21lIGlzIHRoZSBzYW1lKToKPiA+
Pgo+ID4+IC0gVlMtbW9kZSBtaXNhbGlnbmVkIGFjY2VzcyAtPiB0cmFwIHRvIEhTLW1vZGUgLT4g
cmVkaXJlY3Rpb24gdG8KPiA+PiBWUy1tb2RlLCBuZWVkcyB0byBoYW5kbGUgdGhlIG1pc2FsaWdu
ZWQgYWNjZXNzIGJ5IGl0c2VsZgo+ID4+Cj4gPj4KPiA+PiBUaGlzIG1lYW5zIHRoYXQgcHJldmlv
dXNseSwgbWlzYWxpZ25lZCBhY2Nlc3Mgd2VyZSBzaWxlbnRseSBmaXhlZCB1cCBieQo+ID4+IE9w
ZW5TQkkgZm9yIFZTLW1vZGUgYW5kIG5vdyB0aGF0IEZXRlQgaXMgdXNlZCBmb3IgZGVsZWdhdGlv
biwgdGhpcyBpc24ndAo+ID4+IHRydWUgYW55bW9yZS4gU28sIG9sZCBrZXJuZWwgb3Igc3VlcHJ2
aXNvciBzb2Z0d2FyZSB0aGF0ICBpbmNsdWRlZCBjb2RlCj4gPj4gdG8gaGFuZGxlIG1pc2FsaWdu
ZWQgYWNjZXNzZXMgd2lsbCBjcmFzaC4gRGlkIEkgbWlzc2VkIHNvbWV0aGluZyA/Cj4gPgo+ID4g
R3JlYXQhIFlvdSBtYWtlIGl0IHZlcnkgY2xlYXIhIFRoYW5rcyBmb3IgeW91ciBleHBsYW5hdGlv
bi4gQnV0IGV2ZW4KPiA+IHdoZW4gbWlzYWxpZ24gZXhjZXB0aW9ucyBhcmUgZGVsZWdhdGVkIHRv
IEhTLW1vZGUsIEtWTSBzZWVtcyB0byBkbwo+ID4gbm90aGluZyBidXQgcmVkaXJlY3QgdG8gVlMt
bW9kZSB3aGVuIFZNIGdldCB0cmFwcGVkIGR1ZSB0byBtaXNhbGlnbgo+ID4gZXhjZXB0aW9ucy4K
Pgo+IEV4YWN0bHksIHdoaWNoIGlzIHdoeSBJIHNhaWQgdGhhdCBlaXRoZXIgc2V0dGluZyBoZWRl
bGVnIGJ5IGRlZmF1bHQgb3IKPiBub3Qgd2lsbCBsZWFkIHRvIHRoZSBzYW1lIG91dGNvbWUsIGll
OiBWUy1tb2RlIG5lZWRzIHRvIGhhbmRsZSBhY2Nlc3MgYnkKPiBpdHNlbGYgKHdoaWNoIGlzIGEg
cmVncmVzc2lvbiBpbnRyb2R1Y2VkIGJ5IEZXRlQgdXNhZ2UpLgo+Cj4KPiA+IFNvIG1heWJlIHdl
IGNhbiBkaXJlY3RseSBkZWxlZ2F0ZSB0aGUgbWlzYWxpZ25lZAo+ID4gZXhjZXB0aW9ucyBpbiBo
ZWRlbGVnIHRvbyBiZWZvcmUgcnVubmluZyBWQ1BVIGFuZCByZXRyaWV2ZSB0aGVtIGFmdGVyCj4g
PiBWQ1BVIGV4aXN0cy4gQW5kIHRoZW4gdGhlIGhhbmRsaW5nIHByb2NlZHVyZSB3aWxsIGJlOgo+
ID4KPiA+IFZTLW1vZGUgbWlzYWxpZ25lZCBleGNlcHRpb24gLT4gdHJhcCB0byBWUy1tb2RlIC0+
IFZTIGhhbmRsZXMgaXQgLT4KPiA+IEJhY2sgdG8gVlUtbW9kZS4KPgo+IEknZCBiZXR0ZXIgd2Fu
dCB0byBsZXQgdGhlIEhTLW1vZGUgaGFuZGxlIHRoZSBtaXNhbGlnbmVkIGFjY2Vzc2VzIGlmIG5v
dAo+IHJlcXVlc3RlZCB2aWEgdGhlIEtWTSBTQkkgRldGVCBpbnRlcmZhY2UgYnkgVlMtbW9kZSB0
byBrZWVwIEhTLW1vZGUKPiBleHBlY3RlZCBiZWhhdmlvci4gQXMgeW91IHBvaW50ZWQgb3V0LCB0
aGlzIGlzIG5vdCBjdXJyZW50bHkgdGhlIGNhc2UKPiBhbmQgdGhlIG1pc2FsaWduZWQgZXhjZXB0
aW9ucyBhcmUgZGlyZWN0bHkgcmVkaXJlY3RlZCB0byBWUy1tb2RlLCB0aGlzCj4gZGlmZmVycyBm
cm9tIHdoYXQgd2FzIGFjdHVhbGx5IGRvbmUgcHJldmlvdXNseSB3aXRob3V0IEZXRlQgKGllIE9w
ZW5TQkkKPiBoYW5kbGVzIHRoZSBtaXNhbGlnbmVkIGFjY2VzcykuCj4KPiBUbyBzdW1tYXJpemUs
IEkgdGhpbmsgSFMtbW9kZSBzaG91bGQgZml4dXAgVlMtbW9kZSBtaXNhbGlnbmVkIGFjY2Vzc2Vz
Cj4gdW5sZXNzIHJlcXVlc3RlZCB2aWEgS1ZNIFNCSSBGV0ZUIGludGVyZmFjZSwgaW4gd2hpY2gg
Y2FzZSBpdCB3aWxsCj4gZGVsZWdhdGVzIHRoZW0gKHdoaWNoIGlzIGRvbmUgYnkgdGhlIEZXRlQg
c2VyaWVzKS4gVGhpcyB3b3VsZCBtYXRjaCB0aGUKPiBIUy1tb2RlIDwtPiBPcGVuU0JJIGJlaGF2
aW9yLgoKR3JlYXQhIFJvZ2VyIHRoYXQuIEhvcGUgaXQgY2FuIGJlIGZpeGVkIGluIHRoZSBmdXR1
cmUuCgo+Cj4gVGhhbmtzLAo+Cj4gQ2zDqW1lbnQKPgo+ID4KPiA+IFBsZWFzZSBjb3JyZWN0IG1l
IGlmIEkgbWlzc2VkIGFueXRoaW5nLgo+ID4KPiA+IEJlc3QgUmVnYXJkcywKPiA+Cj4gPiBYdSBM
dQo+ID4KPiA+Pgo+ID4+IE5vdGU6IHRoaXMgaXMgbm90IGRpcmVjdGx5IHJlbGF0ZWQgdG8geW91
ciBzZXJpZXMgYnV0IG15IGludHJvZHVjdGlvbiBvZgo+ID4+IEZXRlQgIQo+ID4+Cj4gPj4gVGhh
bmtzLAo+ID4+Cj4gPj4gQ2zDqW1lbnQKPiA+Pgo+ID4+Pgo+ID4+PiBCZXN0IFJlZ2FyZHMsCj4g
Pj4+IFh1IEx1Cj4gPj4+Cj4gPj4+Pgo+ID4+Pj4gVGhhbmtzLAo+ID4+Pj4KPiA+Pj4+IENsw6lt
ZW50Cj4gPj4+Pgo+ID4+Pj4+Cj4gPj4+Pj4gVGhhbmtzLgo+ID4+Pj4+Cj4gPj4+Pj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+Pj4+PiBsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKPiA+Pj4+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4gPj4+Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo+ID4+Pj4KPiA+Pgo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2t2bS1yaXNjdgo=
