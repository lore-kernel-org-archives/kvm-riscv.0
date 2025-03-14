Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14386C35FF1
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 11:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G1K6n8LPzDu3anWxkMGKHGVrQIn8uZz92Ulxw3QyaUE=; b=f6LYBLD+T25cyK
	2iiScRl/595a2AmcHAQcfXDDPCOF6/vl1s3vf3qCBkU+4a//oZrerbwunv6E7jI3pMFm+2E/9QAGO
	iBuO9IHvqmOaPBGPzdDd2RphUymAUNrQnabat6Rk01kkPnA5kbfDXiB/0kCIgbxUlwTNU+GVhVErN
	XfN+RAVYgSByetGQisuJxnvg+o3vQWPmAzb1rHotGKkjfp08oeIpfNURCg2zC/5Rigj48CQBUg4Fc
	usZP3actg65k5if8R5vXdjwdmPGbVtx45oGuyG9fn8M1lqc78gAMluTmk5RninMyag/WImgQdTxQZ
	2is4zgqDtgIn1RnPYhKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3SV-0000000E2iT-3BBZ;
	Fri, 14 Mar 2025 11:44:11 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3SS-0000000E2ha-3FXC
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 11:44:10 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso1282169f8f.2
        for <kvm-riscv@lists.infradead.org>; Fri, 14 Mar 2025 04:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741952647; x=1742557447; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yNXP4301/EYAJtyOh9G36QhlKo8rLTXV/iJ66ebNv0k=;
        b=SrnJvdslov4M9X11W/nFurjsrywbL9PEFIbd70LmZs+LTE5zEllj3TTFnoid6ucnkY
         7Xo1SaSjLiYENhyX2r9wRr/16bDCkmuAzg3M6qkWFRLPVx3UHyuI/FMCfVTo78CQ6RHQ
         2blwfkbhsJpq4xv9Kg/f5OlE75XSp0ECQ1o4WiYRffUSmDjt2KjhJ8eGoYk3DITDfBIW
         5sRPrgyDRSKJv39KA7J5tXNcy68hOZLOkHfHqkF/T71whyMVRwONyUfYVJnq55Th+RHq
         g2Ke5OIU8PXgorv1T6u8oOHJujzJpDrOoy742kJLr+DeD2NvMXa5tP6icLHlswYZnjA/
         uziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741952647; x=1742557447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yNXP4301/EYAJtyOh9G36QhlKo8rLTXV/iJ66ebNv0k=;
        b=GOqkZVs3XZbOSBX9ksJ4bfD5jUkI48yhWL7yoynkfUS5LLCxsS9Z78GOtiZqInUHqN
         hG07/rZjYFH1y/aHFHi3gpP5O7IJ93rehuevOz+z1sYpEYh98svfqUnrCyNfpyF9CHob
         pzxZPKe6GczAtLIibdSwH3ZbHw0C0u0j0eMHnjxPuqSwDkLl64vkE5jDHJen3qKc/FQz
         OktGL09fBNsfhgJFsk0O5PNvurbJskhbEANxt2ei7Gh8hnzUEd0f27LVEt260DtbVgVx
         IZbQ/3pr7y1IB2D9yirtdlswAAr21Ms4VKV7e0ok+NMlF0zcGeeNE/pvEFnuPz7+r5u6
         qe6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrxnHLXbE4/CvMbrjFwa3eiqsw0fIsUGKfuklNjGdU0v3/b+kAms8mw+BEw1fEtaXKVZKcKq9k5o0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxRWyCwOiZn2XaMDZ1rYFXUk0OWFNm16aYe0c/FPgAX/DpOOtlL
	BPepEmQFc0c5QLbfINNsn5EWO/aMJchTOpyWBuwPXrOWPldM4Jd6tukPPsJUUYg=
X-Gm-Gg: ASbGncuHyx/UdJjmueESMvNrvtqXuVi1sng8UV5Zbfw5nxbJSS2qt6Wlx66MoW0L8cT
	P3Qm/e/1gRaUTp4dIwEkZQmR7mVESLWjqWcPL7WD90Rolr5LaYHOuLDji7j2N4Kn/Oad+Pz07ou
	SFzCUNtxsf2gedRud8WyUPOtwJNgnReMdrKwpE3/RtQdvG81pjXLetUlMOOj95Sy2OrxnToU/yu
	qsBDzkq2G4dN1CgL3D2GO+gWsIpTJafq6D1qAvU77s2DGdhb62uwnQSxKsqG4s9AJwqc1MTLm+S
	OVuTNCHQkHZOBw3V67uTSKctxxLyJIgZlhOVNe9keGlOv+lUT6h8KxL10b6Ry2nfP3OGOrzNwpT
	z90NIvbtKa+8l0A==
X-Google-Smtp-Source: AGHT+IF+PcMLniUgUw+7z04HFQAwTiKLbHivzVvB0Zh2bIees9zyWsKr40uUY0pHyf5dEv8vx5Q9WQ==
X-Received: by 2002:a5d:5f49:0:b0:390:fb37:1bd with SMTP id ffacd0b85a97d-3971f7f8fccmr2700791f8f.46.1741952647046;
        Fri, 14 Mar 2025 04:44:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b6a32sm5420094f8f.33.2025.03.14.04.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 04:44:06 -0700 (PDT)
Message-ID: <1942580f-cd67-4ddd-b489-0532f95c1ef2@rivosinc.com>
Date: Fri, 14 Mar 2025 12:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/17] riscv: misaligned: use on_each_cpu() for scalar
 misaligned access probing
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-6-cleger@rivosinc.com>
 <20250313-311b94f9bafe73bcd41158a1@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250313-311b94f9bafe73bcd41158a1@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_044408_813670_25F3D404 
X-CRM114-Status: GOOD (  16.48  )
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

CgpPbiAxMy8wMy8yMDI1IDEzOjU3LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gTW9uLCBNYXIg
MTAsIDIwMjUgYXQgMDQ6MTI6MTJQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBz
Y2hlZHVsZV9vbl9lYWNoX2NwdSgpIHdhcyB1c2VkIHdpdGhvdXQgYW55IGdvb2QgcmVhc29uIHdo
aWxlIGRvY3VtZW50ZWQKPj4gYXMgdmVyeSBzbG93LiBUaGlzIGNhbGwgd2FzIGluIHRoZSBib290
IHBhdGgsIHNvIGJldHRlciB1c2UKPj4gb25fZWFjaF9jcHUoKSBmb3Igc2NhbGFyIG1pc2FsaWdu
ZWQgY2hlY2tpbmcuIFZlY3RvciBtaXNhbGlnbmVkIGNoZWNrCj4+IHN0aWxsIG5lZWRzIHRvIHVz
ZSBzY2hlZHVsZV9vbl9lYWNoX2NwdSgpIHNpbmNlIGl0IHJlcXVpcmVzIGlycXMgdG8gYmUKPj4g
ZW5hYmxlZCBidXQgdGhhdCdzIGxlc3Mgb2YgYSBwcm9ibGVtIHNpbmNlIHRoaXMgY29kZSBpcyBy
YW4gaW4gYSBrdGhyZWFkLgo+PiBBZGQgYSBjb21tZW50IHRvIGV4cGxpY2l0IHRoYXQuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPj4g
LS0tCj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCA5ICsrKysrKyst
LQo+PiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwo+PiBpbmRleCA5MGFjNzQxOTEzNTcu
LmZmYWM0MjRmYWE4OCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlz
YWxpZ25lZC5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwo+
PiBAQCAtNjE2LDYgKzYxNiwxMSBAQCBib29sIGNoZWNrX3ZlY3Rvcl91bmFsaWduZWRfYWNjZXNz
X2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpCj4+ICAJCXJldHVybiBmYWxzZTsKPj4gIAl9Cj4+ICAK
Pj4gKwkvKgo+PiArCSAqIFdoaWxlIGJlaW5nIGRvY3VtZW50ZWQgYXMgdmVyeSBzbG93LCBzY2hl
ZHVsZV9vbl9lYWNoX2NwdSgpIGlzIHVzZWQKPj4gKwkgKiBzaW5jZSBrZXJuZWxfdmVjdG9yX2Jl
Z2luKCkgZXhwZWN0cyBpcnFzIHRvIGJlIGVuYWJsZWQgb3IgaXQgd2lsbCBwYW5pYygpLgo+IAo+
IHdoaWNoIGV4cGVjdHMKCkh1bSB0aGF0IHdvdWxkIHlpZWxkIHRoZSBmb2xsb3dpbmc6Cgoic2No
ZWR1bGVfb25fZWFjaF9jcHUoKSBpcyB1c2VkIHNpbmNlIGtlcm5lbF92ZWN0b3JfYmVnaW4oKSB0
aGF0IGlzCmNhbGxlZCBpbnNpZGUgdGhlIHZlY3RvciBjb2RlICd3aGljaCcgZXhwZWN0cyBpcnFz
IHRvIGJlIGVuYWJsZWQgb3IgaXQKd2lsbCBwYW5pYygpLiIgd2hpY2ggc2VlbXMgd3JvbmcgYXMg
d2VsbC4KCkkgZ3Vlc3Mgc29tZXRoaW5nIGxpa2UgdGhpcyB3b3VsZCBiZSBiZXR0ZXI6CgoiV2hp
bGUgYmVpbmcgZG9jdW1lbnRlZCBhcyB2ZXJ5IHNsb3csIHNjaGVkdWxlX29uX2VhY2hfY3B1KCkg
aXMgdXNlZApzaW5jZSBrZXJuZWxfdmVjdG9yX2JlZ2luKCkgZXhwZWN0cyBpcnFzIHRvIGJlIGVu
YWJsZWQgb3IgaXQgd2lsbCBwYW5pYygpIgoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4+ICsJICov
Cj4+ICAJc2NoZWR1bGVfb25fZWFjaF9jcHUoY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3Nf
ZW11bGF0ZWQpOwo+PiAgCj4+ICAJZm9yX2VhY2hfb25saW5lX2NwdShjcHUpCj4+IEBAIC02MzYs
NyArNjQxLDcgQEAgYm9vbCBjaGVja192ZWN0b3JfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9h
bGxfY3B1cyh2b2lkKQo+PiAgCj4+ICBzdGF0aWMgYm9vbCB1bmFsaWduZWRfY3RsIF9fcmVhZF9t
b3N0bHk7Cj4+ICAKPj4gLXN0YXRpYyB2b2lkIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0
ZWQoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrIF9fYWx3YXlzX3VudXNlZCkKPj4gK3N0YXRpYyB2
b2lkIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQodm9pZCAqYXJnIF9fYWx3YXlzX3Vu
dXNlZCkKPj4gIHsKPj4gIAlpbnQgY3B1ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOwo+PiAgCWxvbmcg
Km1hc19wdHIgPSBwZXJfY3B1X3B0cigmbWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQsIGNwdSk7Cj4+
IEBAIC02NzcsNyArNjgyLDcgQEAgYm9vbCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVk
X2FsbF9jcHVzKHZvaWQpCj4+ICAJICogYWNjZXNzZXMgZW11bGF0ZWQgc2luY2UgdGFza3MgcmVx
dWVzdGluZyBzdWNoIGNvbnRyb2wgY2FuIHJ1biBvbiBhbnkKPj4gIAkgKiBDUFUuCj4+ICAJICov
Cj4+IC0Jc2NoZWR1bGVfb25fZWFjaF9jcHUoY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRl
ZCk7Cj4+ICsJb25fZWFjaF9jcHUoY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZCwgTlVM
TCwgMSk7Cj4+ICAKPj4gIAlmb3JfZWFjaF9vbmxpbmVfY3B1KGNwdSkKPj4gIAkJaWYgKHBlcl9j
cHUobWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQsIGNwdSkKPj4gLS0gCj4+IDIuNDcuMgo+Pgo+IAo+
IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgoKCi0t
IAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
