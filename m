Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDCBE784BE
	for <kvm-riscv@archiver.kernel.org>; Sun, 28 Dec 2025 13:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74llymDbyL8dNFDQrgf0DEF9w2jz8qpc48Mkkwy+TQ8=; b=GebAVW7rBJacYU
	LSyE6c774d+QWU4EEmbDZYys5aECaCHn5+f1aPMBfYNo9+2uc8sQLskRpueahwxW+s5H0NntbvKXl
	w95D3wIXX3kjixujtiEWD55fGIIxadKlq1T72q0cg4zXQOFFLFVzZt1fqa9DKsHSCGlkzXXt/PZoR
	ifbIEM3eR92yF8hAoE6JVB2HeBduAeXnnLHAgNzUGbaQg5yZyfZ7CN9fgDUuu54vZJee8VQMnyQrG
	qCHTM5gQH9F05DwG7Rf/vyidcoRI8qrylfJCo5LE4ZeQWAtjytKWzgPBCj5926YrDoiFosYUjwbS7
	FN91igint2qIt2PrIFCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZr6g-00000002mk5-0Fj8;
	Sun, 28 Dec 2025 13:46:50 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZr6d-00000002mjO-3woL
	for kvm-riscv@lists.infradead.org;
	Sun, 28 Dec 2025 13:46:49 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b736d883ac4so1420878966b.2
        for <kvm-riscv@lists.infradead.org>; Sun, 28 Dec 2025 05:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1766929605; x=1767534405; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QmyVj6XGPrQWTnO1cmBaHu2RF/dDjLmm14QhvwLLo4=;
        b=YrUXmRB/XWdWcUqh3m6fbqgSi1YpQdoROomi+c0pkLFg8zd8GcKcw5Zm4e8z4ZHSam
         ewF5vwby9mW7Q+DN0dVdX+i6hF5T6RewR9Q3K4cgVEjke0qHBDe7whyLfF19/wfbvtGS
         uzQEX7/NUghGEiX2WhqJZanzl94YBxc7XzeROjx0bAcpEJmna6Rv8v2uFSY01gA5eBgC
         YrnBcXwtTnJUD3vNwjgjuSb0hpo6RmwVl8hfgM33bTRcyq5DXrrhueO43fF7nwCwwJNc
         2Mo2RIlvy1EGIqusyN37uXdsbKW3PR2mEGKrzVpAm0S5jJQooBWo7Siu1jTiwyMDTTCI
         io4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766929605; x=1767534405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0QmyVj6XGPrQWTnO1cmBaHu2RF/dDjLmm14QhvwLLo4=;
        b=F0iFJWxNRhwCw1xFcUphoBbRdAYTpTVIa9nwtm7rkI8zjdz9uc/5tFBApRgX5xLY3f
         VI3ZEqHd1MO2hkK3Vn7dK2fFGJmq1qvVmGPCCE1joXwHxRX8ebg3KsJc+dKWKZXo1EUA
         PSnECeSFK+uIESZvACCqMLYpUQPUDV6OFpfx8tbI59588hkf0bzoQ/UxMWs8+zyMP9g6
         Zio97vma903WVCBsqGg7B6WxfT6DGU0/b4zb45VfE5bZC2uvj0k6RFc/QXTmWfLqyJNE
         VEGE2T59atAXw+tnuHgHpzT60CfsKdxA9Ob6sgoCfmrGqaysyZj0aepkwjjSE0ae9cao
         34XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTLcj12J8Zt8/ZVYDgO0AkibiPWej7fTI0YJjc0+UaDvUjNHZm7F8ipIR2j/DiCg04mw/ghQcDAC4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt5h7pvTF7Eexi/zV+VQ0DiHJ64WH0oE8Zv73/ByKSUi5AzCEx
	jzydcub0+GFGmQJ4ZX/Dw0MPFQh7Wuqe6voa8bL90DhWX+CJnnbJSM/ApO73kadsGD6qrmo1TwW
	v7+AKfazMNM0fUjw1Ce3oG7p6EM2tV9SyiI5tCLmAoA==
X-Gm-Gg: AY/fxX4g8yRW7WT1Myrzm1b163RgtPK1kOQa8vFiDM14lA/SOU7XvRc0+eHtqXVX/pL
	rrSmRoP+sG6Fih+g78SNphJOJWdXyq2gyZrhaGxW93rtzT40T2fhkt50BjF5btFyAtWdxQlViee
	ike1cZ+iM7ySjgGFN6ENglr763RyNgko24tO6ssJUmGW5iPPQxkBT2EjHAeUOma2QJEaG9PnPgu
	bmr8WdwEMQLfm+miQRxZaJtDnO+rvocAtE9g99I+OIO12PKCkoifSHSyp7BZ/9xeXRrmh+b+utZ
	Lh4NNHjRys6SXS6y2VURxXnoPWg=
X-Google-Smtp-Source: AGHT+IEdC99j0nCePFhLwmZTnJWkgU+x4D2zxqHSfh/qzCdOT5Mo/lWPNRvdETHSYcJYPuMj/crY4IJKLKDSNORCHKs=
X-Received: by 2002:a17:907:6e9f:b0:b7c:e4e9:b13f with SMTP id
 a640c23a62f3a-b803717d9b0mr3040706066b.39.1766929605212; Sun, 28 Dec 2025
 05:46:45 -0800 (PST)
MIME-Version: 1.0
References: <20250523101932.1594077-1-cleger@rivosinc.com> <20250523101932.1594077-7-cleger@rivosinc.com>
 <38ce44c1-08cf-4e3f-8ade-20da224f529c@iscas.ac.cn>
In-Reply-To: <38ce44c1-08cf-4e3f-8ade-20da224f529c@iscas.ac.cn>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Date: Sun, 28 Dec 2025 14:46:34 +0100
X-Gm-Features: AQt7F2p1_7ko8w_PwIifz2AmUk0sbTmFCv2I3iETmZt8Ofoon78QtnnXQgqC8zk
Message-ID: <CADGDLFjttq5knxRpqktHVEbwTWEAwgJ-p50ajV=Q8b31cZvJxA@mail.gmail.com>
Subject: Re: [PATCH v8 06/14] riscv: misaligned: request misaligned exception
 from SBI
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Deepak Gupta <debug@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_054648_108459_61E0C1BA 
X-CRM114-Status: GOOD (  17.17  )
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

SGkgVml2aWFuLAoKQXQgdGhlIHRpbWUgdmVjdG9yIGVtdWxhdGlvbiB3YXMgYWRkZWQgaW4gT3Bl
blNCSSwgSSBhc2tlZCBOeWxvbiBpZiBpdAp3YXMgZ29pbmcgdG8gYmUgYmFja3BvcnRlZDoKaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb3BlbnNiaS9DQUhDRWVoSjdKRGhoRl9DOGpuZ0hlemZCSmpX
cCswbTZHenZzcGhrK0JMTXZ5WWRFWEFAbWFpbC5nbWFpbC5jb20vCgpTZWVtcyBsaWtlIGl0IHdh
c24ndCBiYWNrcG9ydGVkIDopIFNvIHllYWgsIGl0IGRlZmluaXRlbHkgbmVlZHMgdG8gYmUKYWRk
ZWQgdG8gdGhlIGtlcm5lbCBtaXNhbGlnbmVkIGhhbmRsaW5nIGNvZGUuCgpUaGFua3MsCgpDbMOp
bWVudAoKT24gVGh1LCBEZWMgMjUsIDIwMjUgYXQgMTE6MTTigK9BTSBWaXZpYW4gV2FuZyA8d2Fu
Z3J1aWthbmdAaXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gSGkgQ2zDqW1lbnQgYW5kIHJpc2N2IG1h
aW50YWluZXJzOgo+Cj4gT24gNS8yMy8yNSAxODoxOSwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+
ID4gTm93IHRoYXQgdGhlIGtlcm5lbCBjYW4gaGFuZGxlIG1pc2FsaWduZWQgYWNjZXNzZXMgaW4g
Uy1tb2RlLCByZXF1ZXN0Cj4gPiBtaXNhbGlnbmVkIGFjY2VzcyBleGNlcHRpb24gZGVsZWdhdGlv
biBmcm9tIFNCSS4gVGhpcyB1c2VzIHRoZSBGV0ZUIFNCSQo+ID4gZXh0ZW5zaW9uIGRlZmluZWQg
aW4gU0JJIHZlcnNpb24gMy4wLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdl
ciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFq
b25lc0B2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9jcHVmZWF0dXJlLmggICAgICAgIHwgIDMgKy0KPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFw
c19taXNhbGlnbmVkLmMgICAgICAgfCA3MSArKysrKysrKysrKysrKysrKysrKystCj4gPiAgYXJj
aC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5jIHwgIDggKystCj4gPiAgMyBm
aWxlcyBjaGFuZ2VkLCA3NyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gVGhpcyBj
YXVzZXMgYSByZWdyZXNzaW9uIG9uIHBsYXRmb3JtcyB3aGVyZSB2ZWN0b3IgbWlzYWxpZ25lZCBh
Y2Nlc3MgY2FuCj4gYmUgZW11bGF0ZWQgd2l0aCBPcGVuU0JJIChzaW5jZSBPcGVuU0JJIGNvbW1p
dCBjMmFjYzVlICgibGliOgo+IHNiaV9taXNhbGlnbmVkX2xkc3Q6IEFkZCBoYW5kbGluZyBvZiB2
ZWN0b3IgbG9hZC9zdG9yZSIpLCBiZWNhdXNlIHRoaXMKPiBkaXNhYmxlcyB0aGF0IHdpdGggRldG
VC4gVGhpcyBtZWFucyB0aGF0IHZlY3RvciBtaXNhbGlnbmVkIGxvYWRzIGFuZAo+IHN0b3JlcyB0
aGF0IHdlcmUgZW11bGF0ZWQgaW5zdGVhZCBnZXQgYSBTSUdCVVMuCj4KPiBUaGlzIGhhcHBlbnMg
b24gU29waGdvIFNHMjA0NCBhbmQgU3BhY2VtaVQgSzEuIE5vdGFibHkgdGhpcyBjYXVzZXMgdGhl
c2UKPiBwbGF0Zm9ybXMgdG8gZmFpbCBaaWNjbHNtIHdoaWNoIHN0aXB1bGF0ZXMgdGhhdCBtaXNh
bGlnbmVkIHZlY3RvciBtZW1vcnkKPiBhY2Nlc3NlcyBzdWNjZWVkIGlmIHZlY3RvciBpbnN0cnVj
dGlvbnMgYXJlIGF2YWlsYWJsZSBhdCBhbGwgWzFdLgo+Cj4gSSdtIG5vdCB2ZXJ5IGNlcnRhaW4g
d2h5IHZlY3RvciBlbXVsYXRpb24gc3VwcG9ydCB3YXMgb21pdHRlZCBpbiB0aGlzCj4gc2VyaWVz
LiBTaG91bGQgd2UgcGVyaGFwcyBhZGQgdGhlIHNhbWUgZW11bGF0aW9uIHN1cHBvcnQgdG8gTGlu
dXggYXMKPiB3ZWxsIGZvciB0aGUgc2FrZSBvZiB0aGVzZSBraW5kIG9mIHBsYXRmb3Jtcz8KPgo+
IFRoYW5rcywKPiBWaXZpYW4gImRyYW1mb3JldmVyIiBXYW5nCj4KPiBbMV06IGh0dHBzOi8vZ2l0
aHViLmNvbS9yaXNjdi9yaXNjdi1wcm9maWxlcy9pc3N1ZXMvNTgKPgoKLS0gCmt2bS1yaXNjdiBt
YWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
