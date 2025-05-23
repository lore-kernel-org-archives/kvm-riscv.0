Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D52AC54ED0
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 May 2025 15:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NLwyNlptPkGr+DSNOr3cosmMxExk8JgW7x/gByHgLXU=; b=kGL+hfQSbPcHJH
	Ormk9Lr3warNDkRBLmngLBAPgdR7a3f8JdgBQQAQu0v52qY7fI8CN37PKPaWu3hP3NbFVIGzVEQee
	GJRes6EmlNJYpvfPJ6srmG3mJwGsTCfqgBkEvsSmwMLA7lS23l0/El61TI/YfomjKdPNWCHs7ol1t
	tCqQqw4lIpUzjUpZTF83Znir3SIRl8mpzpcnqNr2uR/tXZ5X5XEj3vV8jduoAsWcxgvM4zg7szNg2
	THoVuOtRADiDG/lx2ZMhUSZ6g3c1d3+FokNNwka+px/X+U699PkXfd9Bh+bFm6GbkKmReiVyXBu3c
	/UOW/Hwdtzu6nwJRvKJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUe1-00000004Idt-3i8d;
	Fri, 23 May 2025 15:49:13 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIULU-00000004Fng-3xQa
	for kvm-riscv@lists.infradead.org;
	Fri, 23 May 2025 15:30:07 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-23274dbcbc2so39098705ad.1
        for <kvm-riscv@lists.infradead.org>; Fri, 23 May 2025 08:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748014204; x=1748619004; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZysAlyZtrotmIvgcjSaWUnFpu8BmC8DX1etzBHhsTSU=;
        b=t/iLo5SHYJNBCX0Bz/O4Oh+fMXw85tiWGAMAiFdn6jkRE7+P5U9U+f+pfevxYf+d4F
         OE/3sMq+eppyLgTPyq4Dh61WB34952p0e4c8o8Ga1klrlGjlo0PC4RGAGLBzcXdkl6bv
         ZaBpikn2B0U0SawCzjbDy6l26z6Lo555U622f7k9frzHzYN9iBHV344DGNNYUczvTO67
         +xUtETvBOx0E/Yb/+mrDhEr4iHZFBtxHEzxJvv+9eX9k5QuIp/TYw7CrjnIii3KoN/0R
         +BgbM64J2xf+W/H4u9m2BrhdNm5HLEcUF9xPnVj7aNtUmIEKkzAuF/AyfqaJirwNRMnZ
         eQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748014204; x=1748619004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZysAlyZtrotmIvgcjSaWUnFpu8BmC8DX1etzBHhsTSU=;
        b=nYMlSyMi3oFvIBMxlT1ZCbZ1eIKwEpQFcLTC3B8vgmygfkyJVKs6cjC07aPgeGauFa
         yssSwmPgJQmFAumhz3xkCRrRqEPEE9bl6uN/nkAUACV927GPwa6LRyij/lpc9B8UmP++
         yopNq6DundfL036kiWKTh6QKQPUmixmSMMg4d9opoItkNzdHbyn9vJDY4YZnVWQUSZqB
         6tzXRBYVobH+A21c2NlNvRbAUL7/YtYKhesUjuUoRGw49UvCOYpRTDa9wCNl/F8NPGhq
         Hmv/0pbEYY4SFLrgbQS/ZQbUWxBbzPA4YDiR4jCLix2Aq/WJRCFwz5rBaFNhGjT+tEG/
         6luQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMYDAF8/iDabB9n++aNxOGSSIzYdjmQ2tH9MIiLMjd2gdDG96n8BGiDADhGneA3G/tjLAR4LYyhTA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwVQXX/QVFYJXSOLtjJMy3znHdOylaDh8kXDGAkAK69P1AIdOep
	XymuFSGXNXe1DWqB3gYhGyOlSoug9wtz1A//L4grGEYrZ8U0HbMZnqtq6w0EOYEWZGI=
X-Gm-Gg: ASbGncsHbSshcaMSUE32M6GVXvbnSJZvI+R7DqNyPL9KmhA+TnrrfiMmDftfDdFyd36
	HdTVZ+Ekqu1JrW0se5IT3vSrCeDqYcEn/GoAC9ctckpz3+jYsiMhXjAYxuExAXyYrvJ911K/oVp
	Xv4hp1xVCn76saSXcxOpycTC+eg8BSB67VC9YWRD06DgTUizbx5btb87lO7QULI2MWOUyRdpTcy
	rXWXfLRI2793OgHggGSJ8PLf9nP1H5yfvjlUXg2i/9QQdqEm5sz6K3Fy4DjnqahoqCZ+mXaMtrx
	T35m7dJGlPS+duOcJExFzXN8J5puqbl8Z7hq1PMlw++kAoPDQ1cnuOtyMjL2HrLORWoWdccg8x8
	i2JtgVtlMZwYs2Zzn9iQH
X-Google-Smtp-Source: AGHT+IEdlANg8wwO3+blZsMeIKZDl/aWdfuOZvDvj8FeW02HTI0mk6reEwHEpni5Wcy/mFcYlo/kjQ==
X-Received: by 2002:a17:902:dac7:b0:224:e0f:4b5 with SMTP id d9443c01a7336-231de351d32mr381454745ad.7.1748014204025;
        Fri, 23 May 2025 08:30:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed195csm125049005ad.212.2025.05.23.08.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 08:30:03 -0700 (PDT)
Message-ID: <9f9e2869-725d-4590-887a-9b0ef091472e@rivosinc.com>
Date: Fri, 23 May 2025 17:29:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/14] RISC-V: KVM: add support for FWFT SBI extension
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
 Andrew Jones <ajones@ventanamicro.com>, Deepak Gupta <debug@rivosinc.com>,
 Charlie Jenkins <charlie@rivosinc.com>, Atish Patra <atishp@rivosinc.com>,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-14-cleger@rivosinc.com>
 <DA3K95ZYJ52S.1K6O3LN6WEI0N@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <DA3K95ZYJ52S.1K6O3LN6WEI0N@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_083005_191524_F61BD9A6 
X-CRM114-Status: GOOD (  10.91  )
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

CgpPbiAyMy8wNS8yMDI1IDE1OjA1LCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4gMjAyNS0wNS0y
M1QxMjoxOTozMCswMjowMCwgQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPjoK
Pj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4+ICtzdGF0aWMgY29uc3Qg
ZW51bSBzYmlfZndmdF9mZWF0dXJlX3Qga3ZtX2Z3ZnRfZGVmaW5lZF9mZWF0dXJlc1tdID0gewo+
PiArCVNCSV9GV0ZUX01JU0FMSUdORURfRVhDX0RFTEVHLAo+PiArCVNCSV9GV0ZUX0xBTkRJTkdf
UEFELAo+PiArCVNCSV9GV0ZUX1NIQURPV19TVEFDSywKPj4gKwlTQklfRldGVF9ET1VCTEVfVFJB
UCwKPj4gKwlTQklfRldGVF9QVEVfQURfSFdfVVBEQVRJTkcsCj4+ICsJU0JJX0ZXRlRfUE9JTlRF
Ul9NQVNLSU5HX1BNTEVOLAo+PiArfTsKPiAKPiBIb3cgd2lsbCB1c2Vyc3BhY2UgY29udHJvbCB3
aGljaCBzdWJzZXQgb2YgdGhlc2UgZmVhdHVyZXMgaXMgYWxsb3dlZCBpbgo+IHRoZSBndWVzdD8K
PiAKPiAoV2UgY2FuIHJldXNlIHRoZSBLVk0gU0JJIGV4dGVuc2lvbiBpbnRlcmZhY2UgaWYgd2Ug
ZG9uJ3Qgd2FudCB0byBhZGQgYQo+ICBGV0ZUIHNwZWNpZmljIE9ORV9SRUcuKQoKSGkgUmFkaW0s
CgpJIGRpZG4ndCBsb29rZWQgYXQgdGhhdCBwYXJ0LiBCdXQgbW9zdCBsaWtlbHkgdXNpbmcgdGhl
IGt2bSBvbmUgcmVnCmludGVyZmFjZSBzZWVtcyBvayBsaWtlIHdoYXQgaXMgZG9uZSBmb3IgU1RB
ID8gV2UgY291bGQgaGF2ZSBwZXIgZmVhdHVyZQpvdmVycmlkZSB3aXRoIG9uZSByZWcgcGVyIGZl
YXR1cmUuCgpJcyB0aGlzIHNvbWV0aGluZyBibG9ja2luZyB0aG91Z2ggPyBXZSdkIGxpa2UgdG8g
bWVyZ2UgRldGVCBvbmNlIFNCSSAzLjAKaXMgcmF0aWZpZWQgc28gdGhhdCB3b3VsZCBiZSBuaWNl
IG5vdCBkZWxheWluZyBpdCB0b28gbXVjaC4gSSdsbCB0YWtlIGEKbG9vayBhdCBpdCB0byBzZWUg
aWYgaXQgaXNuJ3QgdG9vIGxvbmcgdG8gaW1wbGVtZW50LgoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4g
Cj4gVGhhbmtzLgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
a3ZtLXJpc2N2Cg==
