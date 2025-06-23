Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BE3C7115B
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 17:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kI2m0S4ds/12gClLCUcJE6DOuOpTC7HUhxllfjV1bNU=; b=pp42SFGSq2PCpD
	8RTBZTy82izsfSsic1ExHU+D87RC28Ijz5YNrg63F9rajIonqzX6pH24Zl5VaMyXB7wLb1nYGZbpS
	0cdk/CCrtunr8TQiAKI6qu7T5vpgfHcWeEQzemaqNbMDaRbRa5ciaZ6hwGrZSKgowMESPUn0utz9l
	Ifp7OJMjTFqx3EX/hWdn6QQedySZBVQuLqQ0TCjMushA5jLODQwm1LMrvpXcoF/HRS4lHqlt1awtR
	SEW8NMk0V9Plihf79Y3WXD71UDaNqV4H7kuT3rKjPQVxqINIuUBlCo0wif59aj9O6eeOyvQ/MWBC4
	krRHjV9svqamSysR1b/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTkZl-00000003VLv-3KnL;
	Mon, 23 Jun 2025 17:03:21 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThRB-00000002uDp-0Tnc
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 13:42:20 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-235e1d710d8so56373455ad.1
        for <kvm-riscv@lists.infradead.org>; Mon, 23 Jun 2025 06:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750686136; x=1751290936; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PftUyQ0Msb1KfMfvQtr5afZD4s8ype5Bn31YXQgjZhQ=;
        b=il7Gh8A28S+277ZUVpJUdEdIPNINu+kCzRMFLoOp3vGv/HtS6qR5kCJpj/TCAgIyTU
         yiDroLYI5sZ5Q0bZfrirnN0kRar4iuiJ3sVYOg400ODE996E4DkZS+8bR+GGiy93JKng
         BWcm9oAXV0sBGH2KC1oPSersW2jWc8QFVk22TGlFH2FZ6flWWlLGKF9Q3X7BGTp7MxB0
         AkES2DPzjOoOajXRunKHLRFhAu3BK2Uc5nuqKAvM17RRiECLIWasgbvIm+0O7gRBIoQY
         Gz6gmU93sFHpo/SArQWgYAstKsiIEq5srjNI5H1f13BXewIL5E+7sDEuaVCu0b9gFa+7
         wY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750686136; x=1751290936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PftUyQ0Msb1KfMfvQtr5afZD4s8ype5Bn31YXQgjZhQ=;
        b=Q7vCAZ7miqo0HRYst5U7Z0dFqBibmOUfjsQyWUbQ6T1f1vhuKgitMgbBsWEOrH6A0t
         k7x9E9y9GiB+a6VFthX8hdNxf930t/0RVNCaPzNwzFUSwHr2Rb9YIVE194UN4ys7rVYf
         2/UziambRF2ElngHAQBPB0XYqykYHB+I7fCvcccm0N/9jQA0TMwn3OiJO0vZhXFRicUG
         g0QdPdGlJOtVUzQxsHGT581NW6uJIG6l+klS4uy1PZXFV9eDc85wQrq9++lMsZNe8hBX
         doaxtc3PIm1l8dIUsJcuqclwSttlwbesDT6Y41mDX4blGCxzh1RMR98uPwCk4pkwr1Tx
         SK8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXiGJ2YmccDRdy5t+RptFno0F9jSAqhlqa1sP4S5238qA2S/8ZOkad1glg9fSo2NAGZyqRptS2LtuM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQQGy1rxS6CgCp+oUJ38ODYo/oglkezMwj1pqJgbiehERl7NP1
	t66hALfTGGjtemjAOGXAB9j3fd15cYxxIxgCfoQx+rKj8qZtEVHiEbbBC6em3fTn5rw=
X-Gm-Gg: ASbGncsEysyKIizYMIGQDv+XOnokYwGPewKxfTwz67MqPYhdgN6bNN8Wgev1/5Au/I4
	lJtH0UZjznxiRmr4z9jATlEwZXj1HQghAhgW8sZLyYL3vnKpEV/NzId3NtL+uXB13UyeYF1lXm+
	KDGVy2xoU8PyHI2w1F858LW2HhYHM2voGmwfp8mGXCVe24hGjG4+fndyigiSP/+7xlXqtzTcm/U
	m2gvbJSr6ZvgBtU2ZLOzcUgXEqTGdr3d0xEO6oOZ+StRIUm1ZP8KE1pVmbWRqMz+vBld0sdl3yb
	ZWIKBjuU/q0le4TqpY2QMfuFPBRyvm3TzJ4J9OYb0RleaDv+AyPdYr4wUPSoqNjnYRu90Dmpy6i
	nEEao4ciOapmJwSYXSteFMCmgDgR2urs=
X-Google-Smtp-Source: AGHT+IHypS+xDzz1U879jtpZhGUvigf9tfNSNnVtuy85SG8m6dKZiZYIxSM/kZgALCzpYtJTzcvwkQ==
X-Received: by 2002:a17:903:2f86:b0:235:caa8:1a72 with SMTP id d9443c01a7336-237d98537fbmr178038585ad.30.1750686136362;
        Mon, 23 Jun 2025 06:42:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a23e1a7sm10669858a91.11.2025.06.23.06.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 06:42:15 -0700 (PDT)
Message-ID: <b9203c8d-4c34-4eb3-a94f-5455cfc2eb53@rivosinc.com>
Date: Mon, 23 Jun 2025 15:42:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] Re: [PATCH] RISC-V: KVM: Delegate illegal instruction
 fault
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 anup@brainfault.org, atish.patra@linux.dev, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20250620091720.85633-1-luxu.kernel@bytedance.com>
 <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com>
 <1d9ad2a8-6ab5-4f5e-b514-4a902392e074@rivosinc.com>
 <CAPYmKFs7tmMg4VQX=5YFhSzDGxodiBxv+v1SoqwTHvE1Khsr_A@mail.gmail.com>
 <4f47fae6-f516-4b6f-931e-92ee7c406314@rivosinc.com>
 <CAPYmKFvT6HcFByEq+zkh8UBUCyQS_Rv4drnCUU0o-HQ4eScVdA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CAPYmKFvT6HcFByEq+zkh8UBUCyQS_Rv4drnCUU0o-HQ4eScVdA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_064217_413522_51AB0A15 
X-CRM114-Status: GOOD (  32.21  )
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

CgpPbiAyMy8wNi8yMDI1IDE1OjMwLCBYdSBMdSB3cm90ZToKPiBIaSBDbMOpbWVudCwKPiAKPiBP
biBNb24sIEp1biAyMywgMjAyNSBhdCA4OjM14oCvUE0gQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJA
cml2b3NpbmMuY29tPiB3cm90ZToKPj4KPj4KPj4KPj4gT24gMjMvMDYvMjAyNSAxNDoxMiwgWHUg
THUgd3JvdGU6Cj4+PiBIaSBDbMOpbWVudCwKPj4+Cj4+PiBPbiBNb24sIEp1biAyMywgMjAyNSBh
dCA0OjA14oCvUE0gQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPiB3cm90ZToK
Pj4+Pgo+Pj4+Cj4+Pj4KPj4+PiBPbiAyMC8wNi8yMDI1IDE0OjA0LCBSYWRpbSBLcsSNbcOhxZkg
d3JvdGU6Cj4+Pj4+IDIwMjUtMDYtMjBUMTc6MTc6MjArMDg6MDAsIFh1IEx1IDxsdXh1Lmtlcm5l
bEBieXRlZGFuY2UuY29tPjoKPj4+Pj4+IERlbGVnYXRlIGlsbGVnYWwgaW5zdHJ1Y3Rpb24gZmF1
bHQgdG8gVlMgbW9kZSBpbiBkZWZhdWx0IHRvIGF2b2lkIHN1Y2gKPj4+Pj4+IGV4Y2VwdGlvbnMg
YmVpbmcgdHJhcHBlZCB0byBIUyBhbmQgcmVkaXJlY3RlZCBiYWNrIHRvIFZTLgo+Pj4+Pj4KPj4+
Pj4+IFNpZ25lZC1vZmYtYnk6IFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPgo+Pj4+
Pj4gLS0tCj4+Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9z
dC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4+Pj4+PiBAQCAtNDgsNiAr
NDgsNyBAQAo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCSVQo
RVhDX0lOU1RfSUxMRUdBTCkgICAgfCBcCj4+Pj4+Cj4+Pj4+IFlvdSBzaG91bGQgYWxzbyByZW1v
dmUgdGhlIGRlYWQgY29kZSBpbiBrdm1fcmlzY3ZfdmNwdV9leGl0Lgo+Pj4+Pgo+Pj4+PiBBbmQg
d2h5IG5vdCBkZWxlZ2F0ZSB0aGUgb3RoZXJzIGFzIHdlbGw/Cj4+Pj4+IChFWENfTE9BRF9NSVNB
TElHTkVELCBFWENfU1RPUkVfTUlTQUxJR05FRCwgRVhDX0xPQURfQUNDRVNTLAo+Pj4+PiAgRVhD
X1NUT1JFX0FDQ0VTUywgYW5kIEVYQ19JTlNUX0FDQ0VTUy4pCj4+Pj4KPj4+PiBDdXJyZW50bHks
IE9wZW5TQkkgZG9lcyBub3QgZGVsZWdhdGUgbWlzYWxpZ25lZCBleGNlcHRpb24gYnkgZGVmYXVs
dCBhbmQKPj4+PiBoYW5kbGVzIG1pc2FsaWduZWQgYWNjZXNzIGJ5IGl0c2VsZiwgdGhpcyBpcyAo
cGFydGlhbGx5KSB3aHkgd2UgYWRkZWQKPj4+PiB0aGUgRldGVCBTQkkgZXh0ZW5zaW9uIHRvIHJl
cXVlc3Qgc3VjaCBkZWxlZ2F0aW9uLiBTaW5jZSBzb21lIHN1cGVydmlzb3IKPj4+PiBzb2Z0d2Fy
ZSBleHBlY3QgdGhhdCBkZWZhdWx0LCB0aGV5IGRvIG5vdCBoYXZlIGNvZGUgdG8gaGFuZGxlIG1p
c2FsaWduZWQKPj4+PiBhY2Nlc3NlcyBlbXVsYXRpb24uIFNvIHRoZXkgc2hvdWxkIG5vdCBiZSBk
ZWxlZ2F0ZWQgYnkgZGVmYXVsdC4KPj4+Cj4+PiBJdCBkb2Vzbid0IG1hdHRlciB3aGV0aGVyIHRo
ZXNlIGV4Y2VwdGlvbnMgYXJlIGRlbGVnYXRlZCBpbiBtZWRlbGVnLgo+Pgo+PiBOb3Qgc3VyZSB0
byB0b3RhbGx5IHVuZGVyc3RhbmQsIGJ1dCBpZiB0aGUgZXhjZXB0aW9ucyBhcmUgbm90IGRlbGVn
YXRlZAo+PiBpbiBtZWRlbGVnLCB0aGV5IHdvbid0IGJlIGRlbGVnYXRlZCB0byBWUy1tb2RlIGV2
ZW4gdGhvdWdoIGhlZGVsZWcgYml0Cj4+IGlzIHNldCByaWdodCA/IFRoZSBzcGVjIHNheXM6Cj4+
Cj4+IEEgc3luY2hyb25vdXMgdHJhcCB0aGF0IGhhcyBiZWVuIGRlbGVnYXRlZCB0byBIUy1tb2Rl
ICh1c2luZyBtZWRlbGVnKQo+PiBpcyBmdXJ0aGVyIGRlbGVnYXRlZCB0byBWUy1tb2RlIGlmIFY9
MSBiZWZvcmUgdGhlIHRyYXAgYW5kIHRoZQo+PiBjb3JyZXNwb25kaW5nIGhlZGVsZWcgYml0IGlz
IHNldC4KPiAKPiBZZXMsIHlvdSBhcmUgcmlnaHQuIFRoZSBpbGxlZ2FsIGluc24gZXhjZXB0aW9u
IGlzIHN0aWxsIHRyYXBwZWQgaW4gTQo+IG1vZGUgaWYgaXQgaXMgbm90IGRlbGVnYXRlZCBpbiBt
ZWRlbGVnLiBCdXQgZGVsZWdhdGluZyBpdCBpbiBoZWRlbGVnCj4gaXMgc3RpbGwgdXNlZnVsLiBU
aGUgb3BlbnNiaSB3aWxsIGNoZWNrIENTUl9IRURFTEVHIGluIHRoZSBmdW5jdGlvbgo+IHNiaV90
cmFwX3JlZGlyZWN0LiBJZiB0aGUgZXhjZXB0aW9uIGhhcyBiZWVuIGRlbGVnYXRlZCB0byBWUy1t
b2RlIGluCj4gQ1NSX0hFRExFRywgb3BlbnNiaSBjYW4gZGlyZWN0bHkgcmV0dXJuIGJhY2sgdG8g
VlMtbW9kZSwgd2l0aG91dCB0aGUKPiBvdmVyaGVhZCBvZiBnb2luZyBiYWNrIHRvIEhTLW1vZGUg
YW5kIHRoZW4gZ29pbmcgYmFjayB0byBWUy1tb2RlLgo+IAo+Pgo+Pgo+Pgo+Pj4gS1ZNIGluIEhT
LW1vZGUgZG9lcyBub3QgaGFuZGxlIGlsbGVnYWwgaW5zdHJ1Y3Rpb24gb3IgbWlzYWxpZ25lZAo+
Pj4gYWNjZXNzIGFuZCBvbmx5IHJlZGlyZWN0cyB0aGVtIGJhY2sgdG8gVlMtbW9kZS4gRGVsZWdh
dGluZyBzdWNoCj4+PiBleGNlcHRpb25zIGluIGhlZGVsZWcgaGVscHMgc2F2ZSBDUFUgdXNhZ2Ug
ZXZlbiB3aGVuIHRoZXkgYXJlIG5vdAo+Pj4gZGVsZWdhdGVkIGluIG1lZGVsZWc6IG9wZW5zYmkg
d2lsbCBjaGVjayB3aGV0aGVyIHRoZXNlIGV4Y2VwdGlvbnMgYXJlCj4+PiBkZWxlZ2F0ZWQgdG8g
VlMtbW9kZSBhbmQgcmVkaXJlY3QgdGhlbSB0byBWUy1tb2RlIGlmIHBvc3NpYmxlLiBUaGVyZQo+
Pj4gc2VlbXMgdG8gYmUgbm8gY29uZmxpY3RzIHdpdGggU1NFIGltcGxlbWVudGF0aW9uLiBQbGVh
c2UgY29ycmVjdCBtZSBpZgo+Pj4gSSBtaXNzZWQgYW55dGhpbmcuCj4+Cj4+IEFGQUlVLCB0aGlz
IG1lYW5zIHRoYXQgc2luY2UgbWVkZWxlZyBiaXQgZm9yIG1pc2FsaWduZWQgYWNjZXNzZXMgd2Vy
ZQo+PiBub3QgZGVsZWdhdGVkIHVwIHRvIHRoZSBpbnRyb2R1Y3Rpb24gb2YgdGhlIEZXRlQgZXh0
ZW5zaW9uLCBWUy1tb2RlCj4+IGdlbmVyYXRlZCBtaXNhbGlnbmVkIGFjY2Vzc2VzIHdlcmUgaGFu
ZGxlZCBieSBPcGVuU0JJIHJpZ2h0ID8gTm93IHRoYXQKPj4gd2UgYXJlIHJlcXVlc3Rpbmcgb3Bl
blNCSSB0byBkZWxlZ2F0ZSBtaXNhbGlnbmVkIGFjY2Vzc2VzLCBIUy1tb2RlCj4+IGhhbmRsZXMg
aXQncyBvd24gbWlzYWxpZ25lZCBhY2Nlc3NlcyB0aHJvdWdoIHRoZSB0cmFwIGhhbmRsZXIuIFdp
dGggdGhhdAo+PiBjb25maWd1cmF0aW9uLCBpZiBWUy1tb2RlIGdlbmVyYXRlIGEgbWlzYWxpZ25l
ZCBhY2Nlc3MsIGl0IHdpbGwgZW5kIHVwCj4+IGJlaW5nIHJlZGlyZWN0ZWQgdG8gVlMtbW9kZSBh
bmQgd29uJ3QgYmUgaGFuZGxlIGJ5IEhTLW1vZGUuCj4+Cj4+IFRvIHN1bW1hcml6ZSwgcHJpb3Ig
dG8gRldGVCwgbWVkZWxlZyB3YXNuJ3QgZGVsZWdhdGluZyBtaXNhbGlnbmVkCj4+IGFjY2Vzc2Vz
IHRvIFMtbW9kZToKPj4KPj4gLSBWUy1tb2RlIG1pc2FsaWduZWQgYWNjZXNzIC0+IHRyYXAgdG8g
TS1tb2RlIC0+IE9wZW5TQkkgaGFuZGxlIGl0IC0+Cj4+IEJhY2sgdG8gVlMtbW9kZSwgbWlzYWxp
Z25lZCBhY2Nlc3MgZml4ZWQgdXAgYnkgT3BlblNCSQo+IAo+IFllcywgdGhpcyBpcyB3aGF0IEkg
d2FudCB0aGUgcHJvY2VkdXJlIG9mIGhhbmRsaW5nIGlsbGVnYWwgaW5zbgo+IGV4Y2VwdGlvbnMg
dG8gYmUuIEFjdHVhbGx5IGl0IG5vdyBiZWhhdmVzIGFzOgo+IAo+IFZTLW1vZGUgaWxsZWdhbCBp
bnNuIGV4Y2VwdGlvbiAtPiB0cmFwIHRvIE0tbW9kZSAtPiBPcGVuU0JJIGhhbmRsZXMgaXQKPiAt
PiBCYWNrIHRvIEhTLW1vZGUsIGRvZXMgbm90aGluZyAtPiBCYWNrIHRvIFZTLW1vZGUuCj4gCj4g
SSB3YW50IHRvIGF2b2lkIGdvaW5nIHRocm91Z2ggSFMtbW9kZS4KCkhpIFh1LAoKWWVhaCwgdGhh
dCBtYWtlIHNlbnNlIGFzIHdlbGwgYnV0IHRoYXQgc2hvdWxkIG9ubHkgaGFwcGVuIGlmIHRoZSBW
Uy1tb2RlCnJlcXVlc3RlZCBtaXNhbGlnbmVkIGFjY2VzcyBkZWxlZ2F0aW9uIHZpYSBLVk0gU0JJ
IEZXRlQgaW50ZXJmYWNlLiBJCmtub3cgdGhhdCBjdXJyZW50bHkgS1ZNIGRvZXMgZG8gYW55dGhp
bmcgdXNlZnVsIGZyb20gdGhlIG1pc2FsaWduZWQKZXhjZXB0aW9uIGV4Y2VwdCByZWRpcmVjdGlu
ZyBpdCB0byBWUy1tb2RlIGJ1dCBJTUhPLCB0aGF0J3MgYSByZWdyZXNzaW9uCkkgaW50cm9kdWNl
ZCB3aXRoIEZXRlQgbWlzYWxpZ25lZCByZXF1ZXN0ZWQgZGVsZWdhdGlvbi4uLgoKPiAKPj4KPj4g
Tm93IHRoYXQgTGludXggdXNlcyBTQkkgRldGVCB0byBkZWxlZ2F0ZXMgbWlzYWxpZ25lZCBhY2Nl
c3NlcyAod2l0aG91dAo+PiBoZWRlbGVnIGJlaW5nIHNldCBmb3IgbWlzYWxpZ25lZCBkZWxlZ2F0
aW9uLCBidXQgdGhhdCBkb2Vzbid0IHJlYWxseQo+PiBtYXR0ZXIsIHRoZSBvdXRjb21lIGlzIHRo
ZSBzYW1lKToKPj4KPj4gLSBWUy1tb2RlIG1pc2FsaWduZWQgYWNjZXNzIC0+IHRyYXAgdG8gSFMt
bW9kZSAtPiByZWRpcmVjdGlvbiB0bwo+PiBWUy1tb2RlLCBuZWVkcyB0byBoYW5kbGUgdGhlIG1p
c2FsaWduZWQgYWNjZXNzIGJ5IGl0c2VsZgo+Pgo+Pgo+PiBUaGlzIG1lYW5zIHRoYXQgcHJldmlv
dXNseSwgbWlzYWxpZ25lZCBhY2Nlc3Mgd2VyZSBzaWxlbnRseSBmaXhlZCB1cCBieQo+PiBPcGVu
U0JJIGZvciBWUy1tb2RlIGFuZCBub3cgdGhhdCBGV0ZUIGlzIHVzZWQgZm9yIGRlbGVnYXRpb24s
IHRoaXMgaXNuJ3QKPj4gdHJ1ZSBhbnltb3JlLiBTbywgb2xkIGtlcm5lbCBvciBzdWVwcnZpc29y
IHNvZnR3YXJlIHRoYXQgIGluY2x1ZGVkIGNvZGUKPj4gdG8gaGFuZGxlIG1pc2FsaWduZWQgYWNj
ZXNzZXMgd2lsbCBjcmFzaC4gRGlkIEkgbWlzc2VkIHNvbWV0aGluZyA/Cj4gCj4gR3JlYXQhIFlv
dSBtYWtlIGl0IHZlcnkgY2xlYXIhIFRoYW5rcyBmb3IgeW91ciBleHBsYW5hdGlvbi4gQnV0IGV2
ZW4KPiB3aGVuIG1pc2FsaWduIGV4Y2VwdGlvbnMgYXJlIGRlbGVnYXRlZCB0byBIUy1tb2RlLCBL
Vk0gc2VlbXMgdG8gZG8KPiBub3RoaW5nIGJ1dCByZWRpcmVjdCB0byBWUy1tb2RlIHdoZW4gVk0g
Z2V0IHRyYXBwZWQgZHVlIHRvIG1pc2FsaWduCj4gZXhjZXB0aW9ucy4gCgpFeGFjdGx5LCB3aGlj
aCBpcyB3aHkgSSBzYWlkIHRoYXQgZWl0aGVyIHNldHRpbmcgaGVkZWxlZyBieSBkZWZhdWx0IG9y
Cm5vdCB3aWxsIGxlYWQgdG8gdGhlIHNhbWUgb3V0Y29tZSwgaWU6IFZTLW1vZGUgbmVlZHMgdG8g
aGFuZGxlIGFjY2VzcyBieQppdHNlbGYgKHdoaWNoIGlzIGEgcmVncmVzc2lvbiBpbnRyb2R1Y2Vk
IGJ5IEZXRlQgdXNhZ2UpLgoKCj4gU28gbWF5YmUgd2UgY2FuIGRpcmVjdGx5IGRlbGVnYXRlIHRo
ZSBtaXNhbGlnbmVkCj4gZXhjZXB0aW9ucyBpbiBoZWRlbGVnIHRvbyBiZWZvcmUgcnVubmluZyBW
Q1BVIGFuZCByZXRyaWV2ZSB0aGVtIGFmdGVyCj4gVkNQVSBleGlzdHMuIEFuZCB0aGVuIHRoZSBo
YW5kbGluZyBwcm9jZWR1cmUgd2lsbCBiZToKPiAKPiBWUy1tb2RlIG1pc2FsaWduZWQgZXhjZXB0
aW9uIC0+IHRyYXAgdG8gVlMtbW9kZSAtPiBWUyBoYW5kbGVzIGl0IC0+Cj4gQmFjayB0byBWVS1t
b2RlLgoKSSdkIGJldHRlciB3YW50IHRvIGxldCB0aGUgSFMtbW9kZSBoYW5kbGUgdGhlIG1pc2Fs
aWduZWQgYWNjZXNzZXMgaWYgbm90CnJlcXVlc3RlZCB2aWEgdGhlIEtWTSBTQkkgRldGVCBpbnRl
cmZhY2UgYnkgVlMtbW9kZSB0byBrZWVwIEhTLW1vZGUKZXhwZWN0ZWQgYmVoYXZpb3IuIEFzIHlv
dSBwb2ludGVkIG91dCwgdGhpcyBpcyBub3QgY3VycmVudGx5IHRoZSBjYXNlCmFuZCB0aGUgbWlz
YWxpZ25lZCBleGNlcHRpb25zIGFyZSBkaXJlY3RseSByZWRpcmVjdGVkIHRvIFZTLW1vZGUsIHRo
aXMKZGlmZmVycyBmcm9tIHdoYXQgd2FzIGFjdHVhbGx5IGRvbmUgcHJldmlvdXNseSB3aXRob3V0
IEZXRlQgKGllIE9wZW5TQkkKaGFuZGxlcyB0aGUgbWlzYWxpZ25lZCBhY2Nlc3MpLgoKVG8gc3Vt
bWFyaXplLCBJIHRoaW5rIEhTLW1vZGUgc2hvdWxkIGZpeHVwIFZTLW1vZGUgbWlzYWxpZ25lZCBh
Y2Nlc3Nlcwp1bmxlc3MgcmVxdWVzdGVkIHZpYSBLVk0gU0JJIEZXRlQgaW50ZXJmYWNlLCBpbiB3
aGljaCBjYXNlIGl0IHdpbGwKZGVsZWdhdGVzIHRoZW0gKHdoaWNoIGlzIGRvbmUgYnkgdGhlIEZX
RlQgc2VyaWVzKS4gVGhpcyB3b3VsZCBtYXRjaCB0aGUKSFMtbW9kZSA8LT4gT3BlblNCSSBiZWhh
dmlvci4KClRoYW5rcywKCkNsw6ltZW50Cgo+IAo+IFBsZWFzZSBjb3JyZWN0IG1lIGlmIEkgbWlz
c2VkIGFueXRoaW5nLgo+IAo+IEJlc3QgUmVnYXJkcywKPiAKPiBYdSBMdQo+IAo+Pgo+PiBOb3Rl
OiB0aGlzIGlzIG5vdCBkaXJlY3RseSByZWxhdGVkIHRvIHlvdXIgc2VyaWVzIGJ1dCBteSBpbnRy
b2R1Y3Rpb24gb2YKPj4gRldGVCAhCj4+Cj4+IFRoYW5rcywKPj4KPj4gQ2zDqW1lbnQKPj4KPj4+
Cj4+PiBCZXN0IFJlZ2FyZHMsCj4+PiBYdSBMdQo+Pj4KPj4+Pgo+Pj4+IFRoYW5rcywKPj4+Pgo+
Pj4+IENsw6ltZW50Cj4+Pj4KPj4+Pj4KPj4+Pj4gVGhhbmtzLgo+Pj4+Pgo+Pj4+PiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4+PiBsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKPj4+Pj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4+
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cj4+Pj4KPj4KCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2
bS1yaXNjdgo=
