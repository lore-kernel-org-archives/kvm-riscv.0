Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D579C54FB3
	for <kvm-riscv@archiver.kernel.org>; Mon, 26 May 2025 09:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kmdCM/LQ3MhIO+xPsyHsQTjbadhxXHOgVH41x0JoyC4=; b=gsVHPXaZVqSBfm
	mrBYZm9+nb4T6DgyQFJzfVy08gFCZsmjYXOK1mBbdrBtTWE5Fwgqt2V0qs6JFbpQiwO64EP8I5lux
	B79nbGA4iL249bbDjtzr+RBqV8LBRVAEn/MKEfT4QgY+i4nazM82Q13UydH1DsLVDLY1Kvsd1RZGi
	e3Q0vJl/yaCxvLibHLVIzTLpGxVkJMR10+QdeYRO2l69gQo3gk3EzW5cHWg9PqEufldcmqV9qrBeG
	ICBI86NCSm34rL1dOtvMCWgcs3qRwTxNdCLjYuK7meZ8rh0Nkh6CwukgaIBpx8vi/BILFg+DuMJm/
	+bsWC7D+YBXospgqw5VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJU4a-00000008UwZ-2uBZ;
	Mon, 26 May 2025 09:24:44 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJU2D-00000008UWF-0j2S
	for kvm-riscv@lists.infradead.org;
	Mon, 26 May 2025 09:22:18 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-445b11306abso12001965e9.3
        for <kvm-riscv@lists.infradead.org>; Mon, 26 May 2025 02:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748251335; x=1748856135; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kVB1vMEDILwI7yDAI9DCK169GFiMbj0azQ2wkTKfU94=;
        b=FYIimVEz07t4hnSDq46naQK8qYz+SSVl1j8vDy6K9FKMHzhQNOgjCFtCes6mzMPqH1
         +4Qp0ximGENFftwpWndg4ETv/HjUazBiHbN/VT3payeZ33uHy6nFmtBP5ye+Lc6IILo0
         ATJOfHlUyESP8E1PvidJHPRIRwKu6o+QwVdcrN/Yh/uDw3CnjhbHhtoFrfVjNUJWDQvh
         Cfhw/yLa1mUopQTA5H1n4kktsqfjM9bGaQUWkq5NsXMRJ58yFhf7KXBoJk9Ybr7NJ4xC
         t+5sw90IoMTmWNi95zV6j4qWO/IkyxZE5wSCIk0Jrj4jl/v5KXEg+YXRpgyC97rkjcY8
         36YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748251335; x=1748856135;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kVB1vMEDILwI7yDAI9DCK169GFiMbj0azQ2wkTKfU94=;
        b=WBcJjffiP00da6ADs+Ndm60wFA5WjYIlH7d+3JnIODiS7gJiDC+2SClOosbhC9rICj
         Tbx7d9Sqz4YbHJFls7JgCL3PYofKIKnmFMFRjJ6nkMKCwZFPiTgwe9GWjcfkVBv46XBf
         N4h1Cv+y56ae2QgKkByA0wFdmA4BfZ2PiNORk1/zeVqiU9Wl9Px7KDMnxsVMgFMooWWr
         RABHFyyCcMQ2jU6ZmW59Y56YG3C5R0FY84/9ZKoeZaVtqkQxYMTpVJEmM3MOnUTJPEBf
         KS/A/N3AoYSRAG+MXUNjXcFmNqjG06zF2Q26XmvU9WW+LkyLRRtdSkUDhZjgylNHczQ8
         iKGw==
X-Gm-Message-State: AOJu0YyEMcLFNC5q17mlwMx3DNIgOwMOE5IFf7MBoWBfHa9V/YunggjF
	YxEPU0NJv0VsUzneSAkQdJGCe9mFUoA7UI8T4pi5rYW8Rw4kBCT3ikrTvTThmR//WUs=
X-Gm-Gg: ASbGncsdJTRI+sNMl0jBF8UALP23exstwPpWih1KzXC6Y1JvCIH0XfgGH4IKPtE2uxX
	1yl5b2n8+wh8+ZWCYgwqjyb74aOnRfvDS7OR6uw4xD+b/PBBYWN4KRJfJbl9ZwSrX4vznOo8W2Y
	gLTKcxk8anTLRu14cG14hXEuBOz6fCtktjsA3gieHn12I8Adw4USUQB/DXp7646yQflLh4NvVc0
	hAjh4ihPalxG9gbEU2xFDOi+AyPYPg3UF+TM0JC13p59Gm+K4GBdhDQByqyIC7bn4GC82OtGe+p
	Y8ypFRC2+hzY4s1Ys5uV3WCSXR8+khwHXtKV54f1EeU0qsgJ/NEi0NzRi/T4pgSFDAXBAP2Pfzk
	c4nPz
X-Google-Smtp-Source: AGHT+IEGcjh7xBCh+DfeG8xrQT+wvABD+WF/Eu3axSyNQAacMD1k0+ulmhfWAKZW9jVFPAOFjD/p3g==
X-Received: by 2002:a05:6000:2407:b0:3a3:6f26:5813 with SMTP id ffacd0b85a97d-3a4cb442ea4mr5934699f8f.25.1748251335337;
        Mon, 26 May 2025 02:22:15 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4cd0cf5ccsm6703658f8f.8.2025.05.26.02.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:22:14 -0700 (PDT)
Date: Mon, 26 May 2025 11:22:14 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v4] RISC-V: KVM: add KVM_CAP_RISCV_USERSPACE_SBI
Message-ID: <20250526-e67c64d52c84a8ad7cb519c4@orel>
References: <20250523113347.2898042-3-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250523113347.2898042-3-rkrcmar@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_022217_213565_1A187609 
X-CRM114-Status: GOOD (  34.93  )
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

T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMDE6MzM6NDlQTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+IFRoZSBuZXcgY2FwYWJpbGl0eSBhbGxvd3MgdXNlcnNwYWNlIHRvIGltcGxlbWVu
dCBTQkkgZXh0ZW5zaW9ucyB0aGF0IEtWTQo+IGRvZXMgbm90IGhhbmRsZS4gIFRoaXMgYWxsb3dz
IHVzZXJzcGFjZSB0byBpbXBsZW1lbnQgYW55IFNCSSBlY2FsbCBhcwo+IHVzZXJzcGFjZSBhbHJl
YWR5IGhhcyB0aGUgYWJpbGl0eSB0byBkaXNhYmxlIGFjY2VsZXJhdGlvbiBvZiBzZWxlY3RlZAo+
IFNCSSBleHRlbnNpb25zLgo+IFRoZSBiYXNlIGV4dGVuc2lvbiBpcyBtYWRlIGNvbnRyb2xsYWJs
ZSBhcyB3ZWxsLCBidXQgb25seSB3aXRoIHRoZSBuZXcKPiBjYXBhYmlsaXR5LCBiZWNhdXNlIGl0
IHdhcyBwcmV2aW91c2x5IGhhbmRsZWQgc3BlY2lhbGx5IGZvciBzb21lIHJlYXNvbi4KPiAqKiog
VGhlIHJlbGF0ZWQgY29tcGF0aWJpbGl0eSBUT0RPIGluIHRoZSBjb2RlIG5lZWRzIGFkZHJlc3Np
bmcuICoqKgo+IAo+IFRoaXMgaXMgYSBWTSBjYXBhYmlsaXR5LCBiZWNhdXNlIHVzZXJzcGFjZSB3
aWxsIG1vc3QgbGlrZWx5IHdhbnQgdG8gaGF2ZQo+IHRoZSBzYW1lIGJlaGF2aW9yIGZvciBhbGwg
VkNQVXMuICBXZSBjYW4gZWFzaWx5IG1ha2UgaXQgYm90aCBhIFZDUFUgYW5kCj4gYSBWTSBjYXBh
YmlsaXR5IGlmIHRoZXJlIGlzIGRlbWFuZCBpbiB0aGUgZnV0dXJlLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+IHY0
Ogo+ICogZm9yd2FyZCBiYXNlIGV4dGVuc2lvbiBhcyB3ZWxsCj4gKiBjaGFuZ2UgdGhlIGlkIHRv
IDI0MiwgYmVjYXVzZSAyNDEgaXMgYWxyZWFkeSB0YWtlbiBpbiBsaW51eC1uZXh0Cj4gKiBRRU1V
IGV4YW1wbGU6IGh0dHBzOi8vZ2l0aHViLmNvbS9yYWRpbWtyY21hci9xZW11L3RyZWUvbXBfc3Rh
dGVfcmVzZXQKPiB2MzogbmV3Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnJz
dCAgICB8IDExICsrKysrKysrKysrCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3Qu
aCB8ICAzICsrKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggfCAgMSArCj4g
IGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMgICAgICAgICB8IDE3ICsrKysrKysrKysrKysrLS0t
Cj4gIGFyY2gvcmlzY3Yva3ZtL3ZtLmMgICAgICAgICAgICAgICB8ICA1ICsrKysrCj4gIGluY2x1
ZGUvdWFwaS9saW51eC9rdm0uaCAgICAgICAgICB8ICAxICsKPiAgNiBmaWxlcyBjaGFuZ2VkLCAz
NSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QK
PiBpbmRleCBlMTA3Njk0ZmI0MWYuLmM5ZDYyN2QxM2E1ZSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2Fw
aS5yc3QKPiBAQCAtODUwNyw2ICs4NTA3LDE3IEBAIGdpdmVuIFZNLgo+ICBXaGVuIHRoaXMgY2Fw
YWJpbGl0eSBpcyBlbmFibGVkLCBLVk0gcmVzZXRzIHRoZSBWQ1BVIHdoZW4gc2V0dGluZwo+ICBN
UF9TVEFURV9JTklUX1JFQ0VJVkVEIHRocm91Z2ggSU9DVEwuICBUaGUgb3JpZ2luYWwgTVBfU1RB
VEUgaXMgcHJlc2VydmVkLgo+ICAKPiArNy40NCBLVk1fQ0FQX1JJU0NWX1VTRVJTUEFDRV9TQkkK
PiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiArCj4gKzpBcmNoaXRlY3R1cmVz
OiByaXNjdgo+ICs6VHlwZTogVk0KPiArOlBhcmFtZXRlcnM6IE5vbmUKPiArOlJldHVybnM6IDAg
b24gc3VjY2VzcywgLUVJTlZBTCBpZiBhcmdbMF0gaXMgbm90IHplcm8KPiArCj4gK1doZW4gdGhp
cyBjYXBhYmlsaXR5IGlzIGVuYWJsZWQsIEtWTSBmb3J3YXJkcyBlY2FsbHMgZnJvbSBkaXNhYmxl
ZCBvciB1bmtub3duCj4gK1NCSSBleHRlbnNpb25zIHRvIHVzZXJzcGFjZS4KPiArCj4gIDguIE90
aGVyIGNhcGFiaWxpdGllcy4KPiAgPT09PT09PT09PT09PT09PT09PT09PQo+ICAKPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9rdm1faG9zdC5oCj4gaW5kZXggODVjZmViYzMyZTRjLi42ZjE3Y2Q5MjM4ODkgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gKysrIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gQEAgLTEyMiw2ICsxMjIsOSBAQCBzdHJ1
Y3Qga3ZtX2FyY2ggewo+ICAKPiAgCS8qIEtWTV9DQVBfUklTQ1ZfTVBfU1RBVEVfUkVTRVQgKi8K
PiAgCWJvb2wgbXBfc3RhdGVfcmVzZXQ7Cj4gKwo+ICsJLyogS1ZNX0NBUF9SSVNDVl9VU0VSU1BB
Q0VfU0JJICovCj4gKwlib29sIHVzZXJzcGFjZV9zYmk7Cj4gIH07Cj4gIAo+ICBzdHJ1Y3Qga3Zt
X2NwdV90cmFwIHsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2
bS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gaW5kZXggNWY1OWZkMjI2
Y2M1Li5kZDNhNWRjNTNkMzQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2t2bS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gQEAg
LTIwNCw2ICsyMDQsNyBAQCBlbnVtIEtWTV9SSVNDVl9TQklfRVhUX0lEIHsKPiAgCUtWTV9SSVND
Vl9TQklfRVhUX0RCQ04sCj4gIAlLVk1fUklTQ1ZfU0JJX0VYVF9TVEEsCj4gIAlLVk1fUklTQ1Zf
U0JJX0VYVF9TVVNQLAo+ICsJS1ZNX1JJU0NWX1NCSV9FWFRfQkFTRSwKPiAgCUtWTV9SSVNDVl9T
QklfRVhUX01BWCwKPiAgfTsKPiAgCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVf
c2JpLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCj4gaW5kZXggMzFmZDNjYzk4ZDY2Li40
OTdkNWIwMjMxNTMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYwo+ICsr
KyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKPiBAQCAtMzksNyArMzksNyBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IGt2bV9yaXNjdl9zYmlfZXh0ZW5zaW9uX2VudHJ5IHNiaV9leHRbXSA9IHsK
PiAgCQkuZXh0X3B0ciA9ICZ2Y3B1X3NiaV9leHRfdjAxLAo+ICAJfSwKPiAgCXsKPiAtCQkuZXh0
X2lkeCA9IEtWTV9SSVNDVl9TQklfRVhUX01BWCwgLyogQ2FuJ3QgYmUgZGlzYWJsZWQgKi8KPiAr
CQkuZXh0X2lkeCA9IEtWTV9SSVNDVl9TQklfRVhUX0JBU0UsCj4gIAkJLmV4dF9wdHIgPSAmdmNw
dV9zYmlfZXh0X2Jhc2UsCj4gIAl9LAo+ICAJewo+IEBAIC0yMTcsNiArMjE3LDExIEBAIHN0YXRp
YyBpbnQgcmlzY3ZfdmNwdV9zZXRfc2JpX2V4dF9zaW5nbGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LAo+ICAJaWYgKCFzZXh0IHx8IHNjb250ZXh0LT5leHRfc3RhdHVzW3NleHQtPmV4dF9pZHhdID09
IEtWTV9SSVNDVl9TQklfRVhUX1NUQVRVU19VTkFWQUlMQUJMRSkKPiAgCQlyZXR1cm4gLUVOT0VO
VDsKPiAgCj4gKwkvLyBUT0RPOiBwcm9iYWJseSByZW1vdmUsIHRoZSBleHRlbnNpb24gb3JpZ2lu
YWxseSBjb3VsZG4ndCBiZQo+ICsJLy8gZGlzYWJsZWQsIGJ1dCBpdCBkb2Vzbid0IHNlZW0gbmVj
ZXNzYXJ5Cj4gKwlpZiAoIXZjcHUtPmt2bS0+YXJjaC51c2Vyc3BhY2Vfc2JpICYmIHNleHQtPmV4
dF9pZCA9PSBLVk1fUklTQ1ZfU0JJX0VYVF9CQVNFKQo+ICsJCXJldHVybiAtRU5PRU5UOwo+ICsK
CkkgYWdyZWUgdGhhdCB3ZSBkb24ndCBuZWVkIHRvIGJhYnlzaXQgdXNlcnNwYWNlIGFuZCBpdCdz
IGV2ZW4gY29uY2VpdmFibGUKdG8gaGF2ZSBndWVzdHMgdGhhdCBkb24ndCBuZWVkIFNCSS4gS1ZN
IHNob3VsZCBvbmx5IG5lZWQgY2hlY2tzIGluIGl0cwpVQVBJIHRvIHByb3RlY3QgaXRzZWxmIGZy
b20gdXNlcnNwYWNlIGFuZCB0byBlbmZvcmNlIHByb3BlciB1c2Ugb2YgdGhlCkFQSS4gSXQncyBu
b3QgS1ZNJ3MgcGxhY2UgdG8gZW5zdXJlIHVzZXJzcGFjZSBkb2Vzbid0IHZpb2xhdGUgdGhlIFNC
SSBzcGVjCm9yIGNyZWF0ZSBicm9rZW4gZ3Vlc3RzICh1c2Vyc3BhY2UgaXMgdGhlIGJvc3MsIGV2
ZW4gaWYgaXQncyBhIGJvc3MgdGhhdApkb2Vzbid0IG1ha2Ugc2Vuc2UpCgpTbywgSSB2b3RlIHdl
IGRyb3AgdGhlIGNoZWNrLgoKPiAgCXNjb250ZXh0LT5leHRfc3RhdHVzW3NleHQtPmV4dF9pZHhd
ID0gKHJlZ192YWwpID8KPiAgCQkJS1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTX0VOQUJMRUQgOgo+
ICAJCQlLVk1fUklTQ1ZfU0JJX0VYVF9TVEFUVVNfRElTQUJMRUQ7Cj4gQEAgLTQ3MSw4ICs0NzYs
MTQgQEAgaW50IGt2bV9yaXNjdl92Y3B1X3NiaV9lY2FsbChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUs
IHN0cnVjdCBrdm1fcnVuICpydW4pCj4gICNlbmRpZgo+ICAJCXJldCA9IHNiaV9leHQtPmhhbmRs
ZXIodmNwdSwgcnVuLCAmc2JpX3JldCk7Cj4gIAl9IGVsc2Ugewo+IC0JCS8qIFJldHVybiBlcnJv
ciBmb3IgdW5zdXBwb3J0ZWQgU0JJIGNhbGxzICovCj4gLQkJY3AtPmEwID0gU0JJX0VSUl9OT1Rf
U1VQUE9SVEVEOwo+ICsJCWlmICh2Y3B1LT5rdm0tPmFyY2gudXNlcnNwYWNlX3NiaSkgewo+ICsJ
CQluZXh0X3NlcGMgPSBmYWxzZTsKPiArCQkJcmV0ID0gMDsKPiArCQkJa3ZtX3Jpc2N2X3ZjcHVf
c2JpX2ZvcndhcmQodmNwdSwgcnVuKTsKPiArCQl9IGVsc2Ugewo+ICsJCQkvKiBSZXR1cm4gZXJy
b3IgZm9yIHVuc3VwcG9ydGVkIFNCSSBjYWxscyAqLwo+ICsJCQljcC0+YTAgPSBTQklfRVJSX05P
VF9TVVBQT1JURUQ7Cj4gKwkJfQo+ICAJCWdvdG8gZWNhbGxfZG9uZTsKPiAgCX0KPiAgCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZtLmMgYi9hcmNoL3Jpc2N2L2t2bS92bS5jCj4gaW5k
ZXggYjI3ZWM4Zjk2Njk3Li4wYjYzNzhiODM5NTUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9r
dm0vdm0uYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZtLmMKPiBAQCAtMjE3LDYgKzIxNywxMSBA
QCBpbnQga3ZtX3ZtX2lvY3RsX2VuYWJsZV9jYXAoc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3Zt
X2VuYWJsZV9jYXAgKmNhcCkKPiAgCQkJcmV0dXJuIC1FSU5WQUw7Cj4gIAkJa3ZtLT5hcmNoLm1w
X3N0YXRlX3Jlc2V0ID0gdHJ1ZTsKPiAgCQlyZXR1cm4gMDsKPiArCWNhc2UgS1ZNX0NBUF9SSVND
Vl9VU0VSU1BBQ0VfU0JJOgo+ICsJCWlmIChjYXAtPmZsYWdzKQo+ICsJCQlyZXR1cm4gLUVJTlZB
TDsKPiArCQlrdm0tPmFyY2gudXNlcnNwYWNlX3NiaSA9IHRydWU7Cj4gKwkJcmV0dXJuIDA7Cj4g
IAlkZWZhdWx0Ogo+ICAJCXJldHVybiAtRUlOVkFMOwo+ICAJfQo+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL3VhcGkvbGludXgva3ZtLmggYi9pbmNsdWRlL3VhcGkvbGludXgva3ZtLmgKPiBpbmRleCA0
NTRiN2Q0YTA0NDguLmJmMjNkZWI2Njc5ZSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3VhcGkvbGlu
dXgva3ZtLmgKPiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgva3ZtLmgKPiBAQCAtOTMxLDYgKzkz
MSw3IEBAIHN0cnVjdCBrdm1fZW5hYmxlX2NhcCB7Cj4gICNkZWZpbmUgS1ZNX0NBUF9YODZfR1VF
U1RfTU9ERSAyMzgKPiAgI2RlZmluZSBLVk1fQ0FQX0FSTV9XUklUQUJMRV9JTVBfSURfUkVHUyAy
MzkKPiAgI2RlZmluZSBLVk1fQ0FQX1JJU0NWX01QX1NUQVRFX1JFU0VUIDI0MAo+ICsjZGVmaW5l
IEtWTV9DQVBfUklTQ1ZfVVNFUlNQQUNFX1NCSSAyNDIKPiAgCj4gIHN0cnVjdCBrdm1faXJxX3Jv
dXRpbmdfaXJxY2hpcCB7Cj4gIAlfX3UzMiBpcnFjaGlwOwo+IC0tIAo+IDIuNDkuMAo+CgpPdGhl
cndpc2UsCgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNv
bT4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2
Cg==
