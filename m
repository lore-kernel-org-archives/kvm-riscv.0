Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E42C5AD49
	for <kvm-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 08:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i7zjIqDxbDlPeLKh13R49gL/AeR3UQ9cxWMYNfXIFpo=; b=AWg62oFtccf6tq
	VgBuetsJxBnNy0cf6cPeIqdBMfMK/oXb4CC00diM3KNWsm5Yz0I9CGoiktmlj3kLJpYDYEZWKn/1B
	h6Ru3w8O+DZi8FFil52dzjuvYq5yVodOSo8IP4RYheIBJoh6gpqlrIjC+9qLMgBJ4cTPPNWr5FDm3
	DdQjsitF434jQQleLkZA9yuAQ6mNF8mMpNf5MsBZz5JEMk0n4d6r7dt95avHVkdVIHIeP5Zv/Yowt
	Mzjs7XQ8x+kZNnD3xjAXAYK+8kJANUqWHTEddRQF4OYLa/LnPLUJHKhEuPRs+jxMU0fKQtuIjZppy
	xL/+cbesRbbw9Eei4R2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMMuT-0000000AJYc-1I5I;
	Tue, 03 Jun 2025 08:22:13 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMMuQ-0000000AJXa-373G
	for kvm-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 08:22:11 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-450ce671a08so33439805e9.3
        for <kvm-riscv@lists.infradead.org>; Tue, 03 Jun 2025 01:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748938929; x=1749543729; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K2XTvhxjYdBUQTznG5NYPYGKHAJcGp6Opc492M0PGhM=;
        b=X8fXwUfxoaJ21dBPEyJupBN/wa+Mu4jXPMfD4QuG2u289uZe988dCtza+QEWcG2Dhd
         xaqSh3kYL9aF24qoNv9JbYRqZRtCBWLjg7f8kClFavXSsLmL93DszRy+Fud0iL5dK8fU
         qVHX7Oe36E4d8jzagUeTJXxzjJ+DJu+J+e984k2FcCAaWMaNwqVYNjVc35vVmq9K+FZa
         9Oa7c9C6d9dsFqi3+7wgE37SUujrQ2UBw72u76Tr4/F5G6DA5OV9U4ftN7FFCWz0ZFha
         8fKNBzOwZ/F/YPUPQGSfx5f6YEq4JgOzMUuwZYtkkRD8NifBsym+dGBmpd9mcPqlDmUN
         OIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748938929; x=1749543729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K2XTvhxjYdBUQTznG5NYPYGKHAJcGp6Opc492M0PGhM=;
        b=wiLmBFXulIt5ZpcsCt/kWcDLn9nqWrbxLDWEXi2/v5Gq7kv2NBXhQtpKy6f58DGez+
         sQ2xnY7YydMjr0I1jXUttV4MxCW1Xb1ioJjG2GHLgZi6fFxgGCvcIK6KCdTDJMWCcNG4
         nFGLceZLU444FPa5HoRmkyzFM20O6haSyeyFxXNaKvyIb5jegrnw/52mqIWfRYIvRrIO
         RSgssPbqFdAEilwBWyTM3zocsLY/UZZLQ8nCvMYIa9u0nL1wn/F9emWvdNGCyGtmO8UT
         XwIbcLrCaRGuf9v96NNV5ziqVmU+hFWT+648IhGDeE0p+lzB4W3x3o9tyna+Gnja6CVC
         TNAg==
X-Forwarded-Encrypted: i=1; AJvYcCXZd4cpOm4Ar0rbhANh9YN7nBaiwVRgUPYXlLBvW21zTJCEusA9GI4dqR/BIKSrOA7BCwNiPyrM1bY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzhlBnujCy6PUJeK7SrFbRB2TxFG7SX7aTdDBn6EX6C4vLpukP0
	r2JCBajK+DvpwuN2IIi5sV4NSEVYiXI92eR+IBCKNde8ZyFrwiWlAsm1isuqAlI8tOY=
X-Gm-Gg: ASbGnctXRwg0V2SPH7gK6e5nNQqePy2J3asJ1jC+WTESfb1dFYTbJ7ck4/Noj/Qk6+i
	Lo7wzWb+ui1ipAHZOPetW3NMq9Vmlo1VbmsiwD4X5ykkkHR6ZQ4yT4d0D6bswBpRdc/uXHChQjB
	wbdniHgwexhr/iFP6Ihm1pBNiLcMQObgKrlEcqKeuLqY3rYDb0VHCxam/3twhIbXXzZZDgNjkWd
	gHt75VyrwawWn8w3ZXYutbxXYnWAzyUZK1vXp/FLTE7POS8iZPoDspo7ua4dW39AXCb/bh+EJer
	w0cXzkEHbIIL1rALifoJank3idswoHRmDKpoHF5J37N9gqFGdglnDPgx7+SUV89tdwbHlefJgTD
	AILqFMGGUNN0RHI046nse
X-Google-Smtp-Source: AGHT+IH6bSE/uSlwylASDQl8d49pwO7PohjcuR9xazY2IRh+dA9DL0f7PpSdjTGS8b2Znt9Rspe7bw==
X-Received: by 2002:a05:600c:8b8a:b0:43c:fffc:786c with SMTP id 5b1f17b1804b1-4511edd3dadmr94180225e9.19.1748938929076;
        Tue, 03 Jun 2025 01:22:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8edf9sm151056295e9.3.2025.06.03.01.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 01:22:08 -0700 (PDT)
Message-ID: <bcb3cffe-5fca-45fc-aa30-c167f6cf3c5c@rivosinc.com>
Date: Tue, 3 Jun 2025 10:22:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] lib/riscv: clear SDT when entering exception handling
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 Andrew Jones <ajones@ventanamicro.com>, Ved Shanbhogue <ved@rivosinc.com>
References: <20250523075341.1355755-1-cleger@rivosinc.com>
 <20250523075341.1355755-3-cleger@rivosinc.com>
 <20250603-8e4c2aa217e6be3b3ee43972@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250603-8e4c2aa217e6be3b3ee43972@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_012210_779877_C94F77AB 
X-CRM114-Status: GOOD (  21.48  )
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

CgpPbiAwMy8wNi8yMDI1IDEwOjE2LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gRnJpLCBNYXkg
MjMsIDIwMjUgYXQgMDk6NTM6MDlBTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBJ
biBvcmRlciB0byBhdm9pZCB0YWtpbmcgZG91YmxlIHRyYXAgb25jZSB3ZSBoYXZlIGVudGVyZWQg
YSB0cmFwIGFuZAo+PiBzYXZlZCBldmVyeXRoaW5nLCBjbGVhciBTRFQgYXQgdGhlIGVuZCBvZiBl
bnRyeS4gVGhpcyBpcyBub3QgZXhhY3RseQo+PiByZXF1aXJlZCB3aGVuIGRvdWJsZSB0cmFwIGlz
IGRpc2FibGVkIChwcm9iYWJseSBtb3N0IG9mIHRoZSB0aW1lKSwgYnV0Cj4+IHRoYXQncyBub3Qg
aGFybWZ1bC4KPiAKPiBIbW0uLi4gSSB3b25kZXIgaWYgdGhpcyBzaG91bGRuJ3QgYmUgbGVmdCB0
byB0aGUgaGFuZGxlcnMuIE1heWJlCj4gd2Ugc2hvdWxkIGp1c3QgcHJvdmlkZSBhIGNvdXBsZSBo
ZWxwZXJzIGluIHByb2Nlc3Nvci5oLCBzdWNoIGFzCj4gCj4gbG9jYWxfZGxidHJwX2VuYWJsZSgp
Cj4gbG9jYWxfZGxidHJwX2Rpc2FibGUoKQoKSGkgRHJldywKClllYWggaW5kZWVkLCB0aGF0IG1h
a2VzIHNlbnNlLCBzb21lIG9mIHRoZW0gbWlnaHQgaGF2ZSB0byBzYXZlIG1vcmUgaW5mbwpiZWZv
cmUgcmUtZW5hYmxpbmcgdHJhcCBpbiBhIG5lYXIgZnV0dXJlLgoKSSdsbCBkcm9wIHRoaXMgcGF0
Y2ggYW5kIHVzZSB0aGF0IHByb3Bvc2FsLgoKPiAKPiBJZiB3ZSBkbyBuZWVkIHRvIG1hbmFnZSB0
aGlzIGF0IHNhdmVfY29udGV4dCB0aW1lLCB0aGVuIEkgaGF2ZQo+IGEgY291cGxlIGNvbW1lbnRz
IGJlbG93Cj4gCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KPj4gLS0tCj4+ICByaXNjdi9jc3RhcnQuUyB8IDkgKysrKystLS0tCj4+ICAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvcmlzY3YvY3N0YXJ0LlMgYi9yaXNjdi9jc3RhcnQuUwo+PiBpbmRleCA1NzVmOTI5
Yi4uYTg2Zjk3ZjAgMTAwNjQ0Cj4+IC0tLSBhL3Jpc2N2L2NzdGFydC5TCj4+ICsrKyBiL3Jpc2N2
L2NzdGFydC5TCj4+IEBAIC0yMTIsMTQgKzIxMiwxNSBAQCBzZWNvbmRhcnlfZW50cnk6Cj4+ICAJ
UkVHX1MJdDYsIFBUX1Q2KGEwKQkJCS8vIHgzMQo+PiAgCWNzcnIJYTEsIENTUl9TRVBDCj4+ICAJ
UkVHX1MJYTEsIFBUX0VQQyhhMCkKPj4gLQljc3JyCWExLCBDU1JfU1NUQVRVUwo+PiAtCVJFR19T
CWExLCBQVF9TVEFUVVMoYTApCj4+ICAJY3NycglhMSwgQ1NSX1NUVkFMCj4+ICAJUkVHX1MJYTEs
IFBUX0JBREFERFIoYTApCj4+ICAJY3NycglhMSwgQ1NSX1NDQVVTRQo+PiAgCVJFR19TCWExLCBQ
VF9DQVVTRShhMCkKPj4gIAlSRUdfTAlhMSwgUFRfT1JJR19BMChhMCkKPj4gIAlSRUdfUwlhMSwg
UFRfQTAoYTApCj4+ICsJbGkgdDAsIAlTUl9TRFQKPiAgICAgICAgICAgXiAgICBeIHNob3VsZCBu
b3QgYmUgYSB0YWIKPiAgICAgICAgICAgXiBzaG91bGQgYmUgdGFicwo+IAo+IFNSX1NEVCBpc24n
dCBkZWZpbmVkIHVudGlsIHRoZSBuZXh0IHBhdGNoIHNvIHRoaXMgYnJlYWtzIGNvbXBpbGluZyBh
dCB0aGlzCj4gcG9pbnQsIHdoaWNoIGNvdWxkIGJyZWFrIGJpc2VjdGlvbi4gWW91IGNhbiBkbyBh
IHF1aWNrIGNoZWNrIG9mIGEgc2VyaWVzCj4gZm9yIHRoaXMgd2l0aAo+IAo+ICBnaXQgcmViYXNl
IC1pIC14ICdtYWtlJyA8YmFzZT4KCk1pc3NlZCB0aGF0LCBzb3JyeSwgSSdsbCBjaGVjayBuZXh0
IHRpbWUuCgpUaGFua3MsCgpDbMOpbWVudAoKPiAKPj4gKwljc3JyYyAJYTEsIENTUl9TU1RBVFVT
LCB0MAo+PiArCVJFR19TCWExLCBQVF9TVEFUVVMoYTApCj4+ICAuZW5kbQo+PiAgCj4+ICAvKgo+
PiBAQCAtMjI3LDYgKzIyOCw4IEBAIHNlY29uZGFyeV9lbnRyeToKPj4gICAqIEFsc28gcmVzdG9y
ZXMgYTAuCj4+ICAgKi8KPj4gIC5tYWNybyByZXN0b3JlX2NvbnRleHQKPj4gKwlSRUdfTAlhMSwg
UFRfU1RBVFVTKGEwKQo+PiArCWNzcncJQ1NSX1NTVEFUVVMsIGExCj4+ICAJUkVHX0wJcmEsIFBU
X1JBKGEwKQkJCS8vIHgxCj4+ICAJUkVHX0wJc3AsIFBUX1NQKGEwKQkJCS8vIHgyCj4+ICAJUkVH
X0wJZ3AsIFBUX0dQKGEwKQkJCS8vIHgzCj4+IEBAIC0yNjAsOCArMjYzLDYgQEAgc2Vjb25kYXJ5
X2VudHJ5Ogo+PiAgCVJFR19MCXQ2LCBQVF9UNihhMCkJCQkvLyB4MzEKPj4gIAlSRUdfTAlhMSwg
UFRfRVBDKGEwKQo+PiAgCWNzcncJQ1NSX1NFUEMsIGExCj4+IC0JUkVHX0wJYTEsIFBUX1NUQVRV
UyhhMCkKPj4gLQljc3J3CUNTUl9TU1RBVFVTLCBhMQo+PiAgCVJFR19MCWExLCBQVF9CQURBRERS
KGEwKQo+PiAgCWNzcncJQ1NSX1NUVkFMLCBhMQo+PiAgCVJFR19MCWExLCBQVF9DQVVTRShhMCkK
Pj4gLS0gCj4+IDIuNDkuMAo+Pgo+IAo+IFRoYW5rcywKPiBkcmV3CgoKLS0gCmt2bS1yaXNjdiBt
YWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
