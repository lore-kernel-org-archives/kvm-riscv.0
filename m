Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06BFCCD1BB
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 14:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CQ/hOhey/fXhEdLpDhHWg9z2VorPGHgsg68wIk3ATZA=; b=ZXztHrFoz8/bOD
	wDYHS0064HixOfu304nca0bYVc2Gc2UjiEyYHH86F36s1ezRlFpu06ytV+pvmvOUZYS4CajVTtRmO
	xt6tOH/WEKLywBLmJdHY6qofPvrW4fXrawrRYQfZTqIgsH2ylqlNTcMKT7UoEyrhnpnidzItoibjf
	LOfI/cO5Z8gULmXGwkrEdof7mgFV7uLm42ho32mwjb/o6iFtCo7bKtpGDAyYqf4I0kcGSfALZG8gs
	pCVMaaNiWJqktioZUJ96tF1lAIwTLQeDY3TBkoP3ogATY4JPPQdSVunvlsqvG6TQj5l0onwbVLIA4
	k6wFHLoXGlYI0tDcMLLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZnJ-00000003DL3-2gEH;
	Wed, 22 Oct 2025 14:26:29 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZnG-00000003DIF-0A0F
	for kvm-riscv@lists.infradead.org;
	Wed, 22 Oct 2025 14:26:27 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-471810a77c1so6014845e9.2
        for <kvm-riscv@lists.infradead.org>; Wed, 22 Oct 2025 07:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761143182; x=1761747982; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wqUmVzTVOr+xOtlxSyFftuV0eY7cySExUp3xpXPUhN8=;
        b=XqDj+euSKC0V6TJPr/cX69zXyJYJBkT1hKdw9il1KXtq6vYVjY7Zj71hrHdtvhu7OM
         +UvsozCeQSySBrtVrhGYSOiiTDhg7FKoHuGPlpCoYGSQsNBMP9C0KXO1Vxn4NzjPStzN
         xM/+D2qmbg+RRno3xJ6C4aUNQdnP6YAZ3PZcRK/Qvf+n3G6lPUEwbfLezDN8g/0NIRIN
         aje/C85HAJT25HfuYW6cNkdFojVuhvWHCuypCPpRSrCzO0v9VxEDsqAjB31P2urpxWK8
         JCvB9RbI5pj7J4PGAtElRjX+RqKnVj3656bSewDKYOkXcKXMWz2DG64xiOtK4zuGJ/8x
         hTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761143182; x=1761747982;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wqUmVzTVOr+xOtlxSyFftuV0eY7cySExUp3xpXPUhN8=;
        b=HnSaU/cR4G0WvMWeI5sItoNvYwOPOLSwGIn8iOoCU9pf3lbmw+Fnn+mvxpR2Ji/IUd
         yopajEMgQSsy5L83yM+IjjUvFq4wp7+CQd5Tt259c0QVfzN8L20g/g74isAaKTGEiv5w
         foUb/Ai5eLtGjr41oGEkevvkVY8dj4BiTY22suCAXKBe/YC23TfvUxyrh54w8vA3N8D4
         GwSjuCULPP6cL2IWDtNtHaqfhRR4jYfv2v4l28eQ6Iy5wqqvCZS8OlaZf0SpqGIEBJ0B
         Ft9lfuChKUAir2qZsq5hp6ZnEckIoa8EaMwAy043dBmMuP5A/oqBzLDMnYcJgoIE0Ttg
         PV2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWkoK7gn/QzDFTQSSzRhwr6ANVtgWgQkEMhx5DlxJDh96s/K/kLiaCrDRx/I09CqLsK/m/8saeyYvU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxrvQDcc7Zmng9LVbof1RPM/e0P1uuOFtx6Z0lDfCwWDMs1AL6+
	upbZmHBtr207u5YhPMsClkf139l25e2ruxPEnKTZe8nbDjUC+2/haTAgfkm1xXglsPI=
X-Gm-Gg: ASbGncv/A7PSL3HOzESSWrXL0SGinuW9VDRTM1jTDQJd9bnh8z5OCpcLDB4kKkeRkqL
	NcnixrhXHhlI1+8O/UBwedX0qqkMsFm1cOHxKn3cJ2OwNCcUXQ8pAb+9f59YesudpkdQ0V5t0Kg
	chhSLCUl50mFNBZuk0uvvcGwMOUAyFVgrZwi/YEjjpb/CZvOAXAWwFfHLTYWw46SxrDmesM+R0m
	CmEjmV8KNWcy4MlW2tkbsUBI4jqXwTqKWAiYA0GU0tTYtpzmy5WdJnEOTdm0ERwog+2GAndCE/A
	MI/mSnoEEeUllRCJPrwmDI1aA7ESuEdzVPuQy5caKAi36+N+911Wrf4kMDiGc9/z5d+L1nISgeA
	QXF9/+XUPAgKI8QwKZC31cYHxA5+3UDEb+pmL8Ryx0dTXMJRzfTedqXc9z2EZ3FvEMmCoDz2Ivz
	6r02MMOZqR1e6gJdlxtisUXwTekPwOC5HGL+o=
X-Google-Smtp-Source: AGHT+IFvRE0z5tv9KQDLdp9s5spUvAdqd31sF8RiG45//xlNc86WeY0WU+Ovx56uQfku3yIlxtjYBA==
X-Received: by 2002:a05:600c:3b04:b0:471:12be:744 with SMTP id 5b1f17b1804b1-47117932dd5mr83954375e9.8.1761143182005;
        Wed, 22 Oct 2025 07:26:22 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475c427c3casm46414035e9.4.2025.10.22.07.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:26:21 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 22 Oct 2025 16:26:20 +0200
Message-Id: <DDOX5JZWQK87.2SZ1CS39ZZAOZ@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH 2/2] KVM: riscv: selftests: Detect supported vm modes
Cc: <wu.fei9@sanechips.com.cn>, <kvm-riscv@lists.infradead.org>, "kvm-riscv"
 <kvm-riscv-bounces@lists.infradead.org>
To: "Wu Fei" <atwufei@163.com>, "Andrew Jones" <ajones@ventanamicro.com>
References: <20251017110908650RWBl7sDIk6WUGhkvJSH4L@zte.com.cn>
 <202510170319.59H3JmWd056039@mse-fl2.zte.com.cn>
 <20251017-f2c1b717d2364067c64f95a6@orel>
 <93d3af21-5d3d-465c-a9f2-0eaed7475fb3@163.com>
 <DDNEF8ASSO19.2P4OJ3KYPWRIH@ventanamicro.com>
 <20251021-a97dc10e19bd8542675484dd@orel>
 <5ed53d05-2ed8-43dc-8a41-1906b6982c80@163.com>
In-Reply-To: <5ed53d05-2ed8-43dc-8a41-1906b6982c80@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_072626_824106_94C0D2A3 
X-CRM114-Status: GOOD (  14.62  )
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

MjAyNS0xMC0yMlQyMToxMzowOCswODowMCwgV3UgRmVpIDxhdHd1ZmVpQDE2My5jb20+Ogo+IE9u
IDEwLzIyLzI1IDA3OjU1LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4+IE9uIE1vbiwgT2N0IDIwLCAy
MDI1IGF0IDA5OjMyOjU3UE0gKzAyMDAsIFJhZGltIEtyxI1tw6HFmSB3cm90ZToKPj4+IDIwMjUt
MTAtMjBUMjE6MjY6MTgrMDg6MDAsIFd1IEZlaSA8YXR3dWZlaUAxNjMuY29tPjoKPj4+PiBPbiAx
MC8xOC8yNSAwMDowNCwgQW5kcmV3IEpvbmVzIHdyb3RlOgo+Pj4+Pj4gLSAgICAgICAgICAgICAg
IGd1ZXN0X21vZGVfYXBwZW5kKFZNX01PREVfUDU2VjU3XzRLLCBzeiA+PSA1OSk7Cj4+Pj4+PiAt
ICAgICAgICAgICAgICAgZ3Vlc3RfbW9kZV9hcHBlbmQoVk1fTU9ERV9QNTBWNDhfNEssIHN6ID49
IDUwKTsKPj4+Pj4+IC0gICAgICAgICAgICAgICBndWVzdF9tb2RlX2FwcGVuZChWTV9NT0RFX1A0
MVYzOV80Sywgc3ogPj0gNDEpOwo+Pj4+Pj4gKyAgICAgICAgICAgICAgIGd1ZXN0X21vZGVfYXBw
ZW5kKFZNX01PREVfUDU2VjU3XzRLLCBzYXRwX21vZGUgPj0gU0FUUF9NT0RFXzU3ICYmIHN6ID49
IDU5KTsKPj4+Pj4+ICsgICAgICAgICAgICAgICBndWVzdF9tb2RlX2FwcGVuZChWTV9NT0RFX1A1
MFY0OF80Sywgc2F0cF9tb2RlID49IFNBVFBfTU9ERV80OCAmJiBzeiA+PSA1MCk7Cj4+Pj4+PiAr
ICAgICAgICAgICAgICAgZ3Vlc3RfbW9kZV9hcHBlbmQoVk1fTU9ERV9QNDFWMzlfNEssIHNhdHBf
bW9kZSA+PSBTQVRQX01PREVfMzkgJiYgc3ogPj0gNDEpOwo+Pj4+Pgo+Pj4+PiBTb21ldGhpbmcg
YWxvbmcgdGhlc2UgbGluZXMgd2FzIHdoYXQgSSB3YXMgc3VnZ2VzdGluZyBpbiB0aGUgbGFzdCBw
YXRjaCwKPj4+Pj4gYnV0IHdoZXJlIHdlIHNlbGVjdCBmcm9tIG1hbnkgbW9yZSBjb21iaW5hdGlv
bnMgb2YgUCBhbmQgViBmb3IgbW9kZXMuCj4+Pj4+Cj4+Pj4+IFZNX01PREVfUDQxVjM5XzRLCj4+
Pj4+IFZNX01PREVfUDQxVjQ4XzRLCj4+Pj4+IFZNX01PREVfUDQxVjU3XzRLCj4+Pj4+IFZNX01P
REVfUDUwVjQ4XzRLCj4+Pj4+IFZNX01PREVfUDUwVjU3XzRLCj4+Pj4+IFZNX01PREVfUDU5VjU3
XzRLCj4+Pj4KPj4+PiBEbyB3ZSBuZWVkIG1vcmU/IGUuZy4gZm9yIHN2MzksIHRoZXJlIGNvdWxk
IGJlIFA1MFYzOSBhbmQgUDU2VjM5Lgo+Pj4KPj4+IEJhcmUgaXMgcHJvYmFibHkgdGhlIG1vc3Qg
aW1wb3J0YW50IGZpcnN0IHN0YWdlIG1vZGUsIGFzIGl0J3MgdGhlIG9ubHkKPj4+IG9uZSB0aGF0
IG1pZ2h0IGZ1bGx5IHRlc3QgdGhlIHR3byBleHRyYSBiaXRzIG9mIFN2NTd4NC4KPj4gCj4+IElu
ZGVlZCwgYnV0IGZvciB0aGF0IHdlIG5lZWQgYSBtb2RlIG5hbWVkIHNvbWV0aGluZyBsaWtlIFZN
X01PREVfQkFSRTU5Lgo+Cj4gVGhlIGN1cnJlbnQgY29kZSBoYXMgc29tZSBhc3N1bXB0aW9uIG9u
IG5vbi1iYXJlIG1vZGUsIHN1Y2ggYXMgdmlydF9tYXAuIAo+IEl0IGxvb2tzIG5vdCB0cml2aWFs
IHRvIHN1cHBvcnQgQkFSRSBtb2RlLiBJcyBpdCBva2F5IHRvIGZvY3VzIG9uIAo+IG5vbi1iYXJl
IG1vZGUgaW4gdGhpcyBzZXJpZXMsIGFuZCBsZWF2ZSBiYXJlIG1vZGUgc3VwcG9ydCB0byBhbm90
aGVyIAo+IHBhdGNoc2V0Pz4KCk9mIGNvdXJzZS4gIFRoZXJlIGlzIG5vIHBvaW50IGluIGFkZGlu
ZyBzeW1ib2xzIHRoYXQgYXJlIG5vdCB1c2VkLgoKPj4+IEkgdGhpbmsgYSBzaW5nbGUgY29tYmlu
YXRpb24gcGVyICJ4NCIgbW9kZSBtaWdodCBiZSBzdWZmaWNpZW50LCBzaW5jZQo+Pj4gYWxsIG5v
bi1iYXJlIGZpcnN0IHN0YWdlcyBnZW5lcmF0ZSA1Ni1iaXQgcGh5c2ljYWwgYWRkcmVzc2VzIGFu
eXdheSwgYnV0Cj4+PiBpdCBtYWtlcyBzZW5zZSB0byBoYXZlIGFsbCBvZiB0aGVtIGlmIHdlJ3Jl
IGRvaW5nIG1vcmUgdGhhbiBvbmUuCj4+IAo+PiBZZWFoLCBtaWdodCBhcyB3ZWxsLgo+Cj4gQWRk
IGFsbCBvZiB0aGVtPwoKVGVzdHMgY2Fubm90IGNob29zZSBoZ2F0cDsgS1ZNIGp1c3QgdGVsbHMg
dXMgdGhhdCB0aGUgcGh5c2ljYWwgd2lkdGggaXMuClRoaXMgbWVhbnMgdGhhdCB3ZSBtdXN0IHN1
cHBvcnQgdGhlIGZvbGxvd2luZzoKCiAgVk1fTU9ERV9QNDFWMzlfNEsKICBWTV9NT0RFX1A1MFYz
OV80SwogIFZNX01PREVfUDU5VjM5XzRLCgpJIGRvbid0IHRoaW5rIGl0J3MgY29ycmVjdCB0byBh
c3N1bWUgdGhhdCB3aGVuIFN2QUJ4NCBpcyBzdXBwb3J0ZWQsIHRoZW4KU3ZBQiBpcyBzdXBwb3J0
ZWQsIGhlbmNlIHdlIG11c3QgaGF2ZSBTdjM5IGZvciBlYWNoIGhnYXRwIG1vZGUgdGhhdCBLVk0K
c3VwcG9ydHMuCgpBbmQgc2hvdWxkbid0IGl0IGJlIGludmFsaWQgdG8gcGljayBWTV9NT0RFX1A0
MVYzOV80SyB3aGVuIEtWTSBpcyB1c2luZwpTdjQ4eDQ/ICBGb3IgdGVzdHMgdGhhdCB0aGF0IGRv
bid0IGNhcmUgYWJvdXQgcGh5c2ljYWwgd2lkdGgsIHdlIGNvdWxkCmFkZDoKCiAgVk1fTU9ERV9Q
WFhWMzlfNEsKCkl0IGRvZXNuJ3Qgc2VlbSBuZWNlc3NhcnkgdG8gc3VwcG9ydCBtb3JlIHRoYW4g
dGhhdCwgYnV0IGlmIG91ciB0ZXN0cwp3YW50IGxhcmdlciB2aXJ0dWFsIGFkZHJlc3Mgc3BhY2Us
IHdlIGNhbiBhZGQgVjQ4IGFuZCBWNTcgdmFyaWFudHMuCgpUaGFua3MuCgotLSAKa3ZtLXJpc2N2
IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
