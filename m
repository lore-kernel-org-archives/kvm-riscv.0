Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585D6C54ED1
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 May 2025 19:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=18Xz4XQfJxB/JddL09qYv41YN2RJYjeahL/AEpnA3g8=; b=IHtCZY4fVwsHly
	ftry1IoYEtj6Mn9ygv0N0HJ0b235ec8sYEo+ljtDwG9HRioq7w6cmflKef8nCip+W9IJmpBW7CN54
	7hj5UJb9/fcv+u+ZEzf2pBxUnAr6F5CuE2JnVtSTmg7JjWn8HnyvaYd6BnX2RhSCOhu0sD2HlVqRo
	6lleU8vpL8m5bhCyz06RBw3a5T2WrrSTUZXrc0h+gH/WIZJyNntZiNgp31yYJxRfMZu+2cXgR80xh
	rLJkxLEFm74LKCX1NPfne9T6mwCtIKg7ADwYmlEsMrfG+X+nmCAFd+ElWOTIf1Hf0CoiabAVSg9qt
	eNkworLoZHZkVNRQ9FsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIY3F-00000004nLZ-1twQ;
	Fri, 23 May 2025 19:27:29 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXy0-00000004mm3-0n1K
	for kvm-riscv@lists.infradead.org;
	Fri, 23 May 2025 19:22:05 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7399838db7fso294374b3a.0
        for <kvm-riscv@lists.infradead.org>; Fri, 23 May 2025 12:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748028123; x=1748632923; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ral+N2d0KfCW37vBolJovFgnCe0tWP7reKx7tiu0DfE=;
        b=EqR1igOX7YZrlSSuieKE+bpB0ftsoX9gPNqOwegbaxnvySzqvquck2bvgCEue+//r6
         Tjb8aJLXPvjF0g2vYd0hRS0sKYOVYq0gio0PnWXojOJ4A4al7Hhku1fBIkxG0RoOEtna
         DD2ZJ8zP7af32ESW2jVL7qslbgBmsAcW7rhTDLaU/dxaMPGQky3y5aSpyzEly/PkiRHA
         stF76LqxTLmPAHWsMJl++8wLXx8yMcL58x81cVLqAPd891Q2wLBcQecRs6wHomcvinsS
         dL4wsdcLIccj+2YiMNM/TT2YHewSJuIpGoG0iINM9AKXyTkuPNjMathHEflkOUp8B2mk
         i9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748028123; x=1748632923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ral+N2d0KfCW37vBolJovFgnCe0tWP7reKx7tiu0DfE=;
        b=IwIMHPSFS5JQSb4dMMxFAfn3yl5EXR7jnmJf7uExl+2viJVnfXtbfrMkvLdympZ7Au
         ACitgk7n/IJua8o/MZ1Wpv42wuv70DRG+nQtuD75zboI/QqC9qhgotMyBrdVkfXuDX9T
         Fn4LPdKlNbsHLpwtLQhTpY129bzYr87cFMEMGdjMgLRwLIdk3e6BPhSl0izPJtcutQI2
         lCenGiDFV72ybVfysyVHa0nPuomaC343IGEw0IFTDMTvwXnKXH1H7e+BWQkP6iIhmNkT
         19EwLLc3ldUGCZlhCksomfE25Jwf9iwm4d3vrl0NLLl9PG3gfsb7P1pqKcVWVeoJijdN
         OfEw==
X-Forwarded-Encrypted: i=1; AJvYcCXiBe+3YnxdDUQWDCVor4xompkFqDBGIWCCt3IVtdrEjaFSU/zwOVD+VPPxzLO8U7gFM24wWhJtt6Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YyRSFMNsXw+mpHVH8RicolPNnRM+/X/9HT8brsjXD2TUUfXIZoZ
	me8zM3EbRn/YkRQXGF/tr9p+I85r3UrRa3efyqQ+WiepCg3ofgWMUF3mtjqlknQZfgA=
X-Gm-Gg: ASbGnctOpEHMXC+QGOgdoCoAlmZv9eCkiNvswbgksUpp7veAVsIXCB4/6FsiujTZlbK
	NV7Gbl4b7hn2/CGA0BP5WsnfBsRIipRVjbqBUUyehGcx+WdALG6OTkHDnVi+S92YkcffRcfQVAC
	3Ka4kwlEpwhKJ/X2PIHFVp9ksmF+InCQTpmqzTWHtMWQnw9uOxDqHaq7/BzAB7XOMFUHIPsV8/5
	ovrOBQUDzEfx2XjdlvcXuNtd7oQgHp5CGIEylwG+UXHfgkslKwCucaW9bNU+TRNCBNZtoj9SmIR
	itQuNWN7EKYXU33/TV57GzH9ySX9BTDLOcHht30IyH3DrJIHPYQ5WGwijhcXCtL/AVo3wJKkKcM
	oBahjfsF1JHGdrtYrW215
X-Google-Smtp-Source: AGHT+IFZ/6OL3e/+nBzCYIYloiMUYM//2VK/chpXTyoMI+nuh1v5hqPREUkHkrHrx1lhvJEatv4h8w==
X-Received: by 2002:a05:6a00:391e:b0:742:ae7e:7da1 with SMTP id d2e1a72fcca58-745fdb50dfamr1094649b3a.0.1748028123175;
        Fri, 23 May 2025 12:22:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98770cdsm13178352b3a.151.2025.05.23.12.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 12:22:02 -0700 (PDT)
Message-ID: <b2afb9c7-a3d2-4bf6-bfaa-d804358ccd88@rivosinc.com>
Date: Fri, 23 May 2025 21:21:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 09/14] riscv: misaligned: move emulated access
 uniformity check in a function
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>,
 Andrew Jones <ajones@ventanamicro.com>, Deepak Gupta <debug@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-10-cleger@rivosinc.com> <aDC-0qe5STR7ow4m@ghost>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <aDC-0qe5STR7ow4m@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_122204_231086_ECEB483A 
X-CRM114-Status: GOOD (  19.70  )
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

CgpPbiAyMy8wNS8yMDI1IDIwOjMwLCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4gT24gRnJpLCBN
YXkgMjMsIDIwMjUgYXQgMTI6MTk6MjZQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+
PiBTcGxpdCB0aGUgY29kZSB0aGF0IGNoZWNrIGZvciB0aGUgdW5pZm9ybWl0eSBvZiBtaXNhbGln
bmVkIGFjY2Vzc2VzCj4+IHBlcmZvcm1hbmNlIG9uIGFsbCBjcHVzIGZyb20gY2hlY2tfdW5hbGln
bmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cygpCj4+IHRvIGl0cyBvd24gZnVuY3Rpb24gd2hp
Y2ggd2lsbCBiZSB1c2VkIGZvciBkZWxlZ2F0aW9uIGNoZWNrLiBObwo+PiBmdW5jdGlvbmFsIGNo
YW5nZXMgaW50ZW5kZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xl
Z2VyQHJpdm9zaW5jLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+Cj4+IC0tLQo+PiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxp
Z25lZC5jIHwgMjAgKysrKysrKysrKysrKystLS0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlz
YWxpZ25lZC5jCj4+IGluZGV4IGYxYjJhZjUxNTU5Mi4uN2VjYWE4MTAzZmU3IDEwMDY0NAo+PiAt
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKPj4gKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCj4+IEBAIC02NDUsNiArNjQ1LDE4IEBAIGJv
b2wgX19pbml0IGNoZWNrX3ZlY3Rvcl91bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVz
KHZvaWQpCj4+ICB9Cj4+ICAjZW5kaWYKPj4gIAo+PiArc3RhdGljIGJvb2wgYWxsX2NwdXNfdW5h
bGlnbmVkX3NjYWxhcl9hY2Nlc3NfZW11bGF0ZWQodm9pZCkKPj4gK3sKPj4gKwlpbnQgY3B1Owo+
PiArCj4+ICsJZm9yX2VhY2hfb25saW5lX2NwdShjcHUpCj4+ICsJCWlmIChwZXJfY3B1KG1pc2Fs
aWduZWRfYWNjZXNzX3NwZWVkLCBjcHUpICE9Cj4+ICsJCSAgICBSSVNDVl9IV1BST0JFX01JU0FM
SUdORURfU0NBTEFSX0VNVUxBVEVEKQo+PiArCQkJcmV0dXJuIGZhbHNlOwo+PiArCj4+ICsJcmV0
dXJuIHRydWU7Cj4+ICt9Cj4gCj4gVGhpcyBlbmRzIHVwIHdhc3RpbmcgdGltZSB3aGVuICFDT05G
SUdfUklTQ1ZfU0NBTEFSX01JU0FMSUdORUQgc2luY2UgaXQKPiB3aWxsIGFsd2F5cyByZXR1cm4g
ZmFsc2UgaW4gdGhhdCBjYXNlLiBNYXliZSB0aGVyZSBpcyBhIHdheSB0byBzaW1wbGlmeQo+IHRo
ZSBpZmRlZnMgYW5kIHN0aWxsIGhhdmUgcGVyZm9ybWFudCBjb2RlLCBidXQgSSBkb24ndCB0aGlu
ayB0aGlzIGlzIGEKPiBiaWcgZW5vdWdoIHByb2JsZW0gdG8gcHJldmVudCB0aGlzIHBhdGNoIGZy
b20gbWVyZ2luZy4KClllYWggSSB0aG91Z2ggb2YgdGhhdCBhcyB3ZWxsIGJ1dCB0aGUgYW1vdW50
IG9mIGNhbGwgdG8gdGhpcyBmdW5jdGlvbiBpcwpwcm9iYWJseSB3ZWxsIGJlbG93IDEwIHRpbWVz
IHNvIEkgZ3Vlc3MgaXQgZG9lcyBub3QgcmVhbGx5IG1hdHRlcnMgaW4KdGhhdCBjYXNlIHRvIGp1
c3RpZnkgeWV0IGFub3RoZXIgaWZkZWYgPwoKPiAKPiBSZXZpZXdlZC1ieTogQ2hhcmxpZSBKZW5r
aW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KPiBUZXN0ZWQtYnk6IENoYXJsaWUgSmVua2lucyA8
Y2hhcmxpZUByaXZvc2luYy5jb20+CgpUaGFua3MsCgpDbMOpbWVudAoKPiAKPj4gKwo+PiAgI2lm
ZGVmIENPTkZJR19SSVNDVl9TQ0FMQVJfTUlTQUxJR05FRAo+PiAgCj4+ICBzdGF0aWMgYm9vbCB1
bmFsaWduZWRfY3RsIF9fcmVhZF9tb3N0bHk7Cj4+IEBAIC02ODMsOCArNjk1LDYgQEAgc3RhdGlj
IGludCBjcHVfb25saW5lX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQodW5zaWduZWQg
aW50IGNwdSkKPj4gIAo+PiAgYm9vbCBfX2luaXQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVs
YXRlZF9hbGxfY3B1cyh2b2lkKQo+PiAgewo+PiAtCWludCBjcHU7Cj4+IC0KPj4gIAkvKgo+PiAg
CSAqIFdlIGNhbiBvbmx5IHN1cHBvcnQgUFJfVU5BTElHTiBjb250cm9scyBpZiBhbGwgQ1BVcyBo
YXZlIG1pc2FsaWduZWQKPj4gIAkgKiBhY2Nlc3NlcyBlbXVsYXRlZCBzaW5jZSB0YXNrcyByZXF1
ZXN0aW5nIHN1Y2ggY29udHJvbCBjYW4gcnVuIG9uIGFueQo+PiBAQCAtNjkyLDEwICs3MDIsOCBA
QCBib29sIF9faW5pdCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZv
aWQpCj4+ICAJICovCj4+ICAJb25fZWFjaF9jcHUoY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVs
YXRlZCwgTlVMTCwgMSk7Cj4+ICAKPj4gLQlmb3JfZWFjaF9vbmxpbmVfY3B1KGNwdSkKPj4gLQkJ
aWYgKHBlcl9jcHUobWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQsIGNwdSkKPj4gLQkJICAgICE9IFJJ
U0NWX0hXUFJPQkVfTUlTQUxJR05FRF9TQ0FMQVJfRU1VTEFURUQpCj4+IC0JCQlyZXR1cm4gZmFs
c2U7Cj4+ICsJaWYgKCFhbGxfY3B1c191bmFsaWduZWRfc2NhbGFyX2FjY2Vzc19lbXVsYXRlZCgp
KQo+PiArCQlyZXR1cm4gZmFsc2U7Cj4+ICAKPj4gIAl1bmFsaWduZWRfY3RsID0gdHJ1ZTsKPj4g
IAlyZXR1cm4gdHJ1ZTsKPj4gLS0gCj4+IDIuNDkuMAo+PgoKCi0tIAprdm0tcmlzY3YgbWFpbGlu
ZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
