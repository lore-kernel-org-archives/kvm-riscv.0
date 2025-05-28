Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE08C5AD49
	for <kvm-riscv@archiver.kernel.org>; Wed, 28 May 2025 15:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pdj1a51ejBXTmJ/y4ydPyul3ZDWI/5gB219ntjC46EM=; b=scrh3CxrfGHSJh
	+qurw+H/G846aVRGehJM8l840Zc+wrGqOU1aoAMmoDNQXJSvhS2nl5h9YH1uUTSSNyOFKCi2zUJu3
	HDoXb0zL33VTyWx8BlV4tvhNAlfeLJ5Be0bF1KbKvxHV54N4V0tcCfBnPCoMgzmdaopbZrlmtJvU+
	900IQfaWBEcjyKdg9Sa/TGGteSTgBPJH/hsVBGKCjoq0+3ZFQw3HCbE+TNS/mbROwEfao8IuJrb+o
	U5f07BlWU6gL3r9ENbZkY8TFYB/eBwPutHlCxkhNGUC+sNzt7rVP/aleADHlf09wQBfa+dSJTjbHa
	Sox+MRMIpJNuctsJcjFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKITh-0000000DWi4-0vsD;
	Wed, 28 May 2025 15:14:01 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKIP6-0000000DVtr-1pQN
	for kvm-riscv@lists.infradead.org;
	Wed, 28 May 2025 15:09:17 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so40888695e9.0
        for <kvm-riscv@lists.infradead.org>; Wed, 28 May 2025 08:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748444954; x=1749049754; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+R8yVTWV7faHDggV+H50he2EYWDm1F+x1P6wR58APkU=;
        b=FYTgPyB4pWuMOPu21AWDB9kKTG2dAovRqpWDm9gnNYa82fNpKCIJ3UWmRZ1GQyPbzf
         +Dgue7szp8FXY+1iXfmCg/IZR96RANDTMHXBL+jtuWYDQKMoAa89wRD00cjlSLc+Oi86
         nch+n9KkGLDPR9ksPhP5L9coRIIdDW+anTKZoK+mjMf32IZwBWw1E73OQ5pukuc9FaQz
         UYohcmAMCNuViq1L04KCias3CNhfbvEP+uVbwZjKVe8WPfZejD7A4waEhPAg+5sBHeiY
         9IkaecnRrHJ5oHXwRJvlP5AscvTCbU4Xat5PNEhJgCpYuvYyxof9I++QIfr1kTvq2pjs
         s6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748444954; x=1749049754;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+R8yVTWV7faHDggV+H50he2EYWDm1F+x1P6wR58APkU=;
        b=UeFgzai6+I34OQzokvBp+dcQx0ZhZFs3LhHgj2wec5w5rHNW7ZfEdnLPXyBwbI+gRF
         QQ2K7q4rbWpQEYUVxe1XskZnVeFKKZJNN51dtOHOzDCPwz1B5julthUGN6XJtJMiT3mw
         dPn4aSAdkMqa134Krk+qtsTHX6AfqSZ9BQ7xpkG83g78n5S6cALAhN9odQ+wgMrRvBQR
         vybAmvdcY1ajIs0pqxVoYZhEkUK8nfNRQzUhVNaew7UtoXRprmlLH+5nFQ1sVeaZ/cKc
         AwvCHzWnsrjnJz1/ok2YUTaVIK5DY95tlB0L0VfjRTRLeVXCvfg2fxBBN+65Xg7WJnIp
         F9hQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQnApUvCew3Tsv6N+kykX7c83uUlx1+NsEYIx8MpJZgMTWrkHqfuGhCFshHlUcqsDK+b+7sFtrYJU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3F4ex2+y54+kdj2YdcTD0rV5gI2XfVJqavO6E6KP3ee9qseyb
	1x1BoLfGM/YKpu9V+shymVbjELq4KcKcAO9wbr90gvuoQ8QtlVP/2jwrC3uQZi/3nS8=
X-Gm-Gg: ASbGncvrjGb6jirfoBFcEv0ncpLBxzsEIk44DU3+27Nc1hyw99hS0hFpZqyq5b+k0+F
	E7BOjP+9RKyjOJZ2cKRTiPJwdWf9y5SowKy5DdN56ZHdCLJFwHDc2zFgJXnK3qyKhS0kxSjwqTB
	Sl4dBNBvLzrS5WSPt+tv6KbTDgUpFETBFJBh+mra3blLX1TyIoeB7b19z3T23SQ0IxqunJqM43I
	SkdSnOXiuAOoYvqb1TOcJdY1Z5CPYRtz/Ohjho2F1ksTlLrI/52771DmfVzLQOR5mXWOwxc0VZ2
	XK7edw0eDtnzvI84cqWSwENlKpP5ip+x3aScEQI=
X-Google-Smtp-Source: AGHT+IGlaccgtVXoxgdtRY0DaxB5E5oM1xLtWSVzQKwZmQedIB076PoZ1cGVyfI0Vth+zZs2F/ULAA==
X-Received: by 2002:a05:600c:8487:b0:442:d9fb:d9f1 with SMTP id 5b1f17b1804b1-44c933ed9bbmr168819085e9.4.1748444954154;
        Wed, 28 May 2025 08:09:14 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::ce80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064ae525sm24810625e9.21.2025.05.28.08.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 08:09:13 -0700 (PDT)
Date: Wed, 28 May 2025 17:09:12 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
Message-ID: <20250528-ff9f6120de39c3e4eefc5365@orel>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
 <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
 <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>
 <20250526-224478e15ee50987124a47ac@orel>
 <ace8be22-3dba-41b0-81f0-bf6d661b4343@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ace8be22-3dba-41b0-81f0-bf6d661b4343@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_080916_476053_77D98D83 
X-CRM114-Status: GOOD (  37.39  )
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

T24gV2VkLCBNYXkgMjgsIDIwMjUgYXQgMDc6MTY6MTFBTSAtMDcwMCwgQXRpc2ggUGF0cmEgd3Jv
dGU6Cj4gT24gNS8yNi8yNSA0OjEzIEFNLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gPiBPbiBNb24s
IE1heSAyNiwgMjAyNSBhdCAxMTowMDozMEFNICswMjAwLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6
Cj4gPiA+IDIwMjUtMDUtMjNUMTA6MTY6MTEtMDc6MDAsIEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRy
YUBsaW51eC5kZXY+Ogo+ID4gPiA+IE9uIDUvMjMvMjUgNjozMSBBTSwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+ID4gPiA+ID4gMjAyNS0wNS0yMlQxMjowMzo0My0wNzowMCwgQXRpc2ggUGF0cmEg
PGF0aXNocEByaXZvc2luYy5jb20+Ogo+ID4gPiA+ID4gPiBVcGdyYWRlIHRoZSBTQkkgdmVyc2lv
biB0byB2My4wIHNvIHRoYXQgY29ycmVzcG9uZGluZyBmZWF0dXJlcwo+ID4gPiA+ID4gPiBjYW4g
YmUgZW5hYmxlZCBpbiB0aGUgZ3Vlc3QuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiA+ID4gPiA+ID4gLS0t
Cj4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1
X3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAo+ID4gPiA+ID4g
PiAtI2RlZmluZSBLVk1fU0JJX1ZFUlNJT05fTUFKT1IgMgo+ID4gPiA+ID4gPiArI2RlZmluZSBL
Vk1fU0JJX1ZFUlNJT05fTUFKT1IgMwo+ID4gPiA+ID4gSSB0aGluayBpdCdzIHRpbWUgdG8gYWRk
IHZlcnNpb25pbmcgdG8gS1ZNIFNCSSBpbXBsZW1lbnRhdGlvbi4KPiA+ID4gPiA+IFVzZXJzcGFj
ZSBzaG91bGQgYmUgYWJsZSB0byBzZWxlY3QgdGhlIGRlc2lyZWQgU0JJIHZlcnNpb24gYW5kIEtW
TSB3b3VsZAo+ID4gPiA+ID4gdGVsbCB0aGUgZ3Vlc3QgdGhhdCBuZXdlciBmZWF0dXJlcyBhcmUg
bm90IHN1cHBvcnRlZC4KPiA+IAo+ID4gV2UgbmVlZCBuZXcgY29kZSBmb3IgdGhpcywgYnV0IGl0
J3MgYSBnb29kIGlkZWEuCj4gPiAKPiA+ID4gPiAKPiA+ID4gPiBXZSBjYW4gYWNoaWV2ZSB0aGF0
IHRocm91Z2ggb25lcmVnIGludGVyZmFjZSBieSBkaXNhYmxpbmcgaW5kaXZpZHVhbCBTQkkKPiA+
ID4gPiBleHRlbnNpb25zLgo+ID4gPiA+IFdlIGNhbiBleHRlbmQgdGhlIGV4aXN0aW5nIG9uZXJl
ZyBpbnRlcmZhY2UgdG8gZGlzYWJsZSBhIHNwZWNpZmljIFNCSQo+ID4gPiA+IHZlcnNpb24gZGly
ZWN0bHkKPiA+ID4gPiBpbnN0ZWFkIG9mIGluZGl2aWR1YWwgb25lcyB0byBzYXZlIHRob3NlIElP
Q1RMIGFzIHdlbGwuCj4gPiA+IAo+ID4gPiBZZXMsIEkgYW0gYWxsIGluIGZhdm9yIG9mIGxldHRp
bmcgdXNlcnNwYWNlIHByb3ZpZGUgYWxsIHZhbHVlcyBpbiB0aGUKPiA+ID4gQkFTRSBleHRlbnNp
b24uCj4gPiAKPiAKPiBXZSBhbHJlYWR5IHN1cHBvcnQgdmVuZG9yaWQvYXJjaGlkL2ltcGlkIHRo
cm91Z2ggb25lIHJlZy4gSSB0aGluayB3ZSBqdXN0Cj4gbmVlZCB0byBhZGQgdGhlIFNCSSB2ZXJz
aW9uIHN1cHBvcnQgdG8gdGhhdCBzbyB0aGF0IHVzZXIgc3BhY2UgY2FuIHNldCBpdC4KPiAKPiA+
IFRoaXMgaXMgY292ZXJlZCBieSB5b3VyIHJlY2VudCBwYXRjaCB0aGF0IHByb3ZpZGVzIHVzZXJz
cGFjZV9zYmkuCj4gCj4gV2h5IGRvIHdlIG5lZWQgdG8gaW52ZW50IG5ldyBJT0NUTCBmb3IgdGhp
cyA/IE9uY2UgdGhlIHVzZXIgc3BhY2Ugc2V0cyB0aGUKPiBTQkkgdmVyc2lvbiwgS1ZNIGNhbiBl
bmZvcmNlIGl0LgoKSWYgYW4gU0JJIHNwZWMgdmVyc2lvbiBwcm92aWRlcyBhbiBleHRlbnNpb24g
dGhhdCBjYW4gYmUgZW11bGF0ZWQgYnkKdXNlcnNwYWNlLCB0aGVuIHVzZXJzcGFjZSBjb3VsZCBj
aG9vc2UgdG8gYWR2ZXJ0aXNlIHRoYXQgc3BlYyB2ZXJzaW9uLAppbXBsZW1lbnQgYSBCQVNFIHBy
b2JlIGZ1bmN0aW9uIHRoYXQgYWR2ZXJ0aXNlcyB0aGUgZXh0ZW5zaW9uLCBhbmQKaW1wbGVtZW50
IHRoZSBleHRlbnNpb24sIGV2ZW4gaWYgdGhlIEtWTSB2ZXJzaW9uIHJ1bm5pbmcgaXMgb2xkZXIK
YW5kIHVuYXdhcmUgb2YgaXQuIEJ1dCwgaW4gb3JkZXIgdG8gZG8gdGhhdCwgd2UgbmVlZCBLVk0g
dG8gZXhpdCB0bwp1c2Vyc3BhY2UgZm9yIGFsbCB1bmtub3duIFNCSSBjYWxscyBhbmQgdG8gYWxs
b3cgQkFTRSB0byBiZSBvdmVycmlkZGVuCmJ5IHVzZXJzcGFjZS4gVGhlIG5ldyBLVk0gQ0FQIGlv
Y3RsIGFsbG93cyBvcHRpbmcgaW50byB0aGF0IG5ldyBiZWhhdmlvci4KClRoZSBvbGQgS1ZNIHdp
dGggbmV3IFZNTSBjb25maWd1cmF0aW9uIGlzbid0IHRvdGFsbHkgZmFyLWZldGNoZWQuIFdoaWxl
Cmhvc3Qga2VybmVscyB0ZW5kIHRvIGdldCB1cGRhdGVkIHJlZ3VsYXJseSB0byBpbmNsdWRlIHNl
Y3VyaXR5IGZpeGVzLAplbnRlcnByaXNlIGtlcm5lbHMgdGVuZCB0byBzdG9wIGFkZGluZyBmZWF0
dXJlcyBhdCBzb21lIHBvaW50IGluIG9yZGVyCnRvIG1heGltaXplIHN0YWJpbGl0eS4gV2hpbGUg
ZW50ZXJwcmlzZSBWTU1zIHdvdWxkIGFsc28gZXZlbnR1YWxseSBzdG9wCmFkZGluZyBmZWF0dXJl
cywgZW50ZXJwcmlzZSBjb25zdW1lcnMgYXJlIGFsd2F5cyBmcmVlIHRvIHVzZSB0aGVpciBvd24K
Vk1NcyAoYXQgdGhlaXIgb3duIHJpc2spLiBTbywgdGhlcmUncyBhIHJlYWwgY2hhbmNlIHdlIGNv
dWxkIGhhdmUKZGVwbG95bWVudHMgd2l0aCBvbGRlciwgc3RhYmxlIEtWTSB3aGVyZSB1c2VycyB3
YW50IHRvIGVuYWJsZSBsYXRlciBTQkkKZXh0ZW5zaW9ucywgYW5kLCBpbiBzb21lIGNhc2VzLCB0
aGF0IHNob3VsZCBiZSBwb3NzaWJsZSBieSBqdXN0IHVwZGF0aW5nCnRoZSBWTU0gLS0gYnV0IG9u
bHkgaWYgS1ZNIGlzIG9ubHkgYWN0aW5nIGFzIGFuIFNCSSBpbXBsZW1lbnRhdGlvbgphY2NlbGVy
YXRvciBhbmQgbm90IGFzIGEgdXNlcnNwYWNlIFNCSSBpbXBsZW1lbnRhdGlvbiBnYXRla2VlcGVy
LgoKVGhhbmtzLApkcmV3Cgo+IAo+ID4gV2l0aCB0aGF0LCB1c2Vyc3BhY2UgY2FuIGRpc2FibGUg
YWxsIGV4dGVuc2lvbnMgdGhhdCBhcmVuJ3QKPiA+IHN1cHBvcnRlZCBieSBhIGdpdmVuIHNwZWMg
dmVyc2lvbiwgZGlzYWJsZSBCQVNFIGFuZCB0aGVuIHByb3ZpZGUKPiA+IGEgQkFTRSB0aGF0IGFk
dmVydGlzZXMgdGhlIHZlcnNpb24gaXQgd2FudHMuIFRoZSBuZXcgY29kZSBpcyBuZWVkZWQKPiA+
IGZvciBleHRlbnNpb25zIHRoYXQgdXNlcnNwYWNlIHN0aWxsIHdhbnRzIEtWTSB0byBhY2NlbGVy
YXRlLCBidXQgdGhlbgo+ID4gS1ZNIG5lZWRzIHRvIGJlIGluZm9ybWVkIGl0IHNob3VsZCBkZW55
IGFsbCBmdW5jdGlvbnMgbm90IGluY2x1ZGVkIGluCj4gPiB0aGUgc2VsZWN0ZWQgc3BlYyB2ZXJz
aW9uLgo+ID4gCj4gPiBUaGFua3MsCj4gPiBkcmV3Cj4gPiAKPiA+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPiAKCi0tIAprdm0tcmlz
Y3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
