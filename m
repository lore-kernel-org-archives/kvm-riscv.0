Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DC1C71157
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 06:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ctZq+juA9wZuLT4Plm/MWOjQ+n5KZByAm+IkLGKHzpk=; b=vJDBqMPXbZ4I5a
	kjDJpXSpYne0A/z0ipRNJeSc/UZRQu/hxeMpwJPCXyRHteM9V/3RFau4fjhmT1C70Pyb92TwDwHgL
	1M4doVpZLImgDrE1/EkUzzW8Vdp7T8Rf81NkuqqJ1qfbDZN0LZMItQzdPOnR4svZGueqrTcwBe5QG
	5UAnJrOAsHzaAp8PSsbnk+WsKqdi9fXCVcmlHH7yvdp39GbDwK+HrFlZerPzECxZ5fVnGGExetXg2
	vqvoKjL4wKTD2pZLQxhJnuvuxIEUvht14RImzvDFE5li59cqrn0rmrMhtfoayRYyrviqvVcHKK4ui
	+veG9d7KtsvOnpL7mAOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTxEm-00000004lpL-2QwY;
	Tue, 24 Jun 2025 06:34:32 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTwxw-00000004kaV-41A1
	for kvm-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 06:17:11 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3ddd38ee5b8so402755ab.1
        for <kvm-riscv@lists.infradead.org>; Mon, 23 Jun 2025 23:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1750745828; x=1751350628; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYG91yD8Ep2EXRSGpuOy5eRtahYB+nXeo+0C962eFWM=;
        b=q0reRjbaWvI5FUcGLGSjDbv6wE7gKbqnnxGxAWn/G+oEkFXNtnTy0n7O1XBCL7+jHz
         fA10UJg7M8fWNXYoxBCHKGfIbxV3g3NaG4uV9TvN/lw0kg+eWxKWr+FYl9TD/NFJbaKC
         haFwZ5UFVt1iR44rvZrphDYxqBXdbRgmrAs87gdyG/4fKfn7zkFkgyBGQ9mVctzuKvJw
         eKWPtXFW7xIiC4NurVToNzsuzpfJlKQyD/77KuqNLnAzuKVPIQrBNFkkIRjkWwsC/Xkv
         LctzIRcvIa8PAxbE+AeWxaV7A994GxNMh0j5Y3ALxKNtqetXXNtYmjIRADcUOzXe1+Sz
         Iypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745828; x=1751350628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYG91yD8Ep2EXRSGpuOy5eRtahYB+nXeo+0C962eFWM=;
        b=TN3nl4y5wb8wR+gn0jNZUJ3TpH/hfqbZNpLWItYt3szGbRnE2cpfV05mN5uMeVH2Jz
         XagHdOE0FK9IKlALsdlbeXbD0aQfMuK29Sv9cr2TVS7ZIeIL1LgOky0EQJLiS5+MbYV/
         4G+ovM9eEKXvNoegYb8tkAsyt0zNHpemCEO2RkV9sRemJteWF0qCJGROvYo+PoMzKpBI
         NTnRusV9atEIePB5F2Uu2WkE1SY17Lbo+wBLwORPqjIF8m6mOFXsa8q62svIQxRx5IOo
         +ZXCGthAH22NR6w3egZHeBPkUvBDqGXMtoLwJ4kqE76iaCuqelV0rIjoJsuuB/QM7Y8f
         JG7A==
X-Forwarded-Encrypted: i=1; AJvYcCVdylXv7aAgnAyUDiW1lAy/8Rmp3GxS8zPVUyvkZH5J9sz7PQOW7zYnkZCXsiM4R0pnpWKmfUeMzdI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxYglYfe0dLwZa+E9eoBX0xB+DAtrI3cDN6e3VdpLEMV/BE69A2
	zW6of60TLZJDiPa6uqZm4TnxPgbTA19yg8aeIdjdkfWAYH2GR5F+I2cEF0bF6X3almUF2T4RLxD
	9Mla46/hjErBlp7wlsYXw9u2dT10Dck8BwDTb490m5g==
X-Gm-Gg: ASbGncu9MrvfcJyurn/t41aLMLpfe5QwsuMM/csjABP0oTIhPk2LFR8PJ58OWxzLejD
	+cOezinShvImzKLYzIaiK6fPb/nuA7gTbivsl/O86mPpspHMIlUEO0X72ar1eFCw6H5wVlOkRwJ
	LdckQ9jX0ncyg+DVaqmxZzky/EDxXG+MYr1thNdx9nP4I//bAOv1vboLqHEzJsb4nS6wFd3mtZs
	2oUd9BZE4DPR2k=
X-Google-Smtp-Source: AGHT+IFwOF9k2nb1vIM4HBKlhQn3P/HTPfDXxywRlHGTWdHMw5hoNm/+IT6iRV+qxyKkYESXR3ipGWMbxS5qleBQHcE=
X-Received: by 2002:a05:6e02:1fc8:b0:3d9:6485:39f0 with SMTP id
 e9e14a558f8ab-3de38c5547cmr149451765ab.9.1750745828023; Mon, 23 Jun 2025
 23:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250618113532.471448-1-apatel@ventanamicro.com>
In-Reply-To: <20250618113532.471448-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 24 Jun 2025 11:46:56 +0530
X-Gm-Features: AX0GCFs_mePpNxQYfE3ujwI_mugaGrSNJrso1cJLOw_Iw1ipREGGeBwAWpV5eNU
Message-ID: <CAAhSdy0=aAzu=Hu72h21GU2bxBZ+oVWuZG6TDiOag2NYBf=ATA@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] MMU related improvements for KVM RISC-V
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_231709_259047_063E0893 
X-CRM114-Status: GOOD (  17.76  )
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

T24gV2VkLCBKdW4gMTgsIDIwMjUgYXQgNTowNeKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIHByaW1hcmlseSBoYXMgdmFyaW91
cyBNTVUgaW1wcm92ZW1lbnRzIGZvciBLVk0gUklTQy1WCj4gYW5kIGl0IGFsc28gc2VydmVzIGFz
IGEgcHJlcGFyYXRvcnkgc2VyaWVzIGZvciB0aGUgdXBjb21pbmcgbmVzdGVkCj4gdmlydHVhbGl6
YXRpb24gc3VwcG9ydC4KPgo+IFBBVENIMSB0byBQQVRDSDQ6IEZldyBjb3NtZXRpYyBpbXByb3Zl
bWVudHMKPiBQQVRDSDUgdG8gUEFUQ0g3OiBUTEIgbWFpbnRlbmFuY2UgYW5kIFNCSSBOQUNMIHJl
bGF0ZWQgaW1wcm92ZW1lbnRzCj4gUEFUQ0g4IHRvIFBBVENIMTI6IE1NVSByZWxhdGVkIHByZXBh
cmF0b3J5IHdvcmsgZm9yIG5lc3RlZCB2aXJ0dWFsaXphdGlvbgo+Cj4gVGhlc2UgcGF0Y2hlcyBj
YW4gYWxzbyBiZSBmb3VuZCBpbiB0aGUgcmlzY3Zfa3ZtX21tdV9pbXBfdjMgYnJhbmNoCj4gYXQ6
IGh0dHBzOi8vZ2l0aHViLmNvbS9hdnBhdGVsL2xpbnV4LmdpdAo+Cj4gQ2hhbmdlcyBzaW5jZSB2
MjoKPiAgLSBSZWJhc2VkIHVwb24gTGludXgtNi4xNi1yYzIgYW5kIGxhdGVzdCByaXNjdl9rdm1f
cXVldWUgYnJhbmNoCj4gIC0gQWRkZWQgUmV2aWV3ZWQtYnkgdGFncyB0byBhcHByb3ByaWF0ZSBw
YXRjaGVzCj4KPiBDaGFuZ2VzIHNpbmNlIHYxOgo+ICAtIFJlYmFzZWQgdXBvbiBMaW51eC02LjE2
LXJjMQo+ICAtIERyb3BwZWQgUEFUQ0gxIGFuZCBQQVRDSDIgb2YgdjEgc2VyaWVzIHNpbmNlIHRo
ZXNlIGFyZSBxdWV1ZWQKPiAgICBhcyBmaXhlcyBmb3IgTGludXgtNi4xNgo+ICAtIEFkZHJlc3Nl
ZCBBdGlzaCdzIGNvbW1lbnQgb24gUEFUQ0gxIGluIHRoaXMgc2VyaWVzCj4gIC0gQWRkZWQgbmV3
IFBBVENINyBpbiB0aGlzIHNlcmllcwo+Cj4gQW51cCBQYXRlbCAoMTIpOgo+ICAgUklTQy1WOiBL
Vk06IENoZWNrIGt2bV9yaXNjdl92Y3B1X2FsbG9jX3ZlY3Rvcl9jb250ZXh0KCkgcmV0dXJuIHZh
bHVlCj4gICBSSVNDLVY6IEtWTTogRHJvcCB0aGUgcmV0dXJuIHZhbHVlIG9mIGt2bV9yaXNjdl92
Y3B1X2FpYV9pbml0KCkKPiAgIFJJU0MtVjogS1ZNOiBSZW5hbWUgYW5kIG1vdmUga3ZtX3Jpc2N2
X2xvY2FsX3RsYl9zYW5pdGl6ZSgpCj4gICBSSVNDLVY6IEtWTTogUmVwbGFjZSBLVk1fUkVRX0hG
RU5DRV9HVk1BX1ZNSURfQUxMIHdpdGgKPiAgICAgS1ZNX1JFUV9UTEJfRkxVU0gKPiAgIFJJU0Mt
VjogS1ZNOiBEb24ndCBmbHVzaCBUTEIgd2hlbiBQVEUgaXMgdW5jaGFuZ2VkCj4gICBSSVNDLVY6
IEtWTTogSW1wbGVtZW50IGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJzX3JhbmdlKCkKPiAgIFJJ
U0MtVjogS1ZNOiBVc2UgbmNzcl94eXooKSBpbiBrdm1fcmlzY3ZfdmNwdV90cmFwX3JlZGlyZWN0
KCkKPiAgIFJJU0MtVjogS1ZNOiBGYWN0b3Itb3V0IE1NVSByZWxhdGVkIGRlY2xhcmF0aW9ucyBp
bnRvIHNlcGFyYXRlIGhlYWRlcnMKPiAgIFJJU0MtVjogS1ZNOiBJbnRyb2R1Y2Ugc3RydWN0IGt2
bV9nc3RhZ2VfbWFwcGluZwo+ICAgUklTQy1WOiBLVk06IEFkZCB2bWlkIGZpZWxkIHRvIHN0cnVj
dCBrdm1fcmlzY3ZfaGZlbmNlCj4gICBSSVNDLVY6IEtWTTogRmFjdG9yLW91dCBnLXN0YWdlIHBh
Z2UgdGFibGUgbWFuYWdlbWVudAo+ICAgUklTQy1WOiBLVk06IFBhc3MgVk1JRCBhcyBwYXJhbWV0
ZXIgdG8ga3ZtX3Jpc2N2X2hmZW5jZV94eXooKSBBUElzCgpRdWV1ZWQgdGhpcyBzZXJpZXMgZm9y
IExpbnV4LTYuMTcKClRoYW5rcywKQW51cAoKPgo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2
bV9haWEuaCAgICB8ICAgMiArLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9nc3RhZ2Uu
aCB8ICA3MiArKysrCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCAgIHwgMTAz
ICstLS0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9tbXUuaCAgICB8ICAyMSArKwo+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV90bGIuaCAgICB8ICA4NCArKysrKwo+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92bWlkLmggICB8ICAyNyArKwo+ICBhcmNoL3Jpc2N2L2t2
bS9NYWtlZmlsZSAgICAgICAgICAgICB8ICAgMSArCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYV9kZXZp
Y2UuYyAgICAgICAgIHwgICA2ICstCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jICAgICAg
ICAgIHwgIDEyICstCj4gIGFyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jICAgICAgICAgICAgIHwgMzM4
ICsrKysrKysrKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9rdm0vbWFpbi5jICAgICAgICAgICAg
ICAgfCAgIDMgKy0KPiAgYXJjaC9yaXNjdi9rdm0vbW11LmMgICAgICAgICAgICAgICAgfCA0OTkg
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS90bGIuYyAgICAg
ICAgICAgICAgICB8IDExMCArKystLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAg
ICAgICAgfCAgMjYgKy0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMgICAgICAgICAgfCAg
MjAgKy0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfcmVwbGFjZS5jICAgfCAgMTcgKy0KPiAg
YXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfdjAxLmMgICAgICAgfCAgMjUgKy0KPiAgYXJjaC9yaXNj
di9rdm0vdm0uYyAgICAgICAgICAgICAgICAgfCAgIDcgKy0KPiAgYXJjaC9yaXNjdi9rdm0vdm1p
ZC5jICAgICAgICAgICAgICAgfCAgMjUgKysKPiAgMTkgZmlsZXMgY2hhbmdlZCwgNzk1IGluc2Vy
dGlvbnMoKyksIDYwMyBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2t2bV9tbXUuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9rdm1fdGxiLmgKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20va3ZtX3ZtaWQuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9r
dm0vZ3N0YWdlLmMKPgo+IC0tCj4gMi40My4wCj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0
Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
