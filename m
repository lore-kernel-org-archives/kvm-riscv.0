Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFAFC369D8
	for <kvm-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 17:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=19I2Su+zZvDTl24er8yghajYpQ8tESpAn0YzQovCju4=; b=OY8JVXwMek9ill
	RmZvLS/4d2KBfsUJiW1ZqTrDFgLdhP2OQV0kskOzd5UbcvX90ys4b5GKMNOY3vPfxjT8dqV5PKwzG
	irxkWNaWBH3neWtEsUc+pVdmemDiTDcGlWvhgtZXZA1w0UocqHpreo4EXKuLtm+fKCImeWyVS8/XU
	CXE+RNip4cwAK4SWP0oHT3vAGPOUAhe7FwGtWvLeXKRauAQJJ1pfvggV+CUbJKZ9nAkMXbJRbLt7U
	viYFpHm7O7gV27j/JJP2LjMGCBv4XzYa3UXGbHLW/0QHlhvuZFe1p6VPCavKCH8LAbae33vhLnw7T
	jxFh+3NxlZZMLOocTjRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8MWB-00000000KoY-2Jal;
	Fri, 25 Apr 2025 17:07:15 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8LXr-0000000094S-2gOU
	for kvm-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 16:04:56 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-39ee6260fc7so160531f8f.1
        for <kvm-riscv@lists.infradead.org>; Fri, 25 Apr 2025 09:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745597093; x=1746201893; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVmQISaVL5Cg2XsgzQXK0sbbtQNmhL4LdWnCYGEZ450=;
        b=aNQUoPByqf4Iil7Asp2i6RgF0H6/daoJhum9/JWVIFPxTsMw0PaMx4IVpDeeWTv21J
         3k3T2qJESrqvDJ0HFzlYIjkYMdtysKIW23PTyOI+l2jwBnAoPGoedO8rLs9p0ni9HD4o
         DWEpXPIgPCSXcgLWI+t4iDAWEBCcxf/hWufFSXI7JuQWFXzS2HYNuUdc3nx9FB274nBf
         57XdbaNou3BMaOgDY9SgabybHldwr3eiv0V6bh8SP/8rSkttjBIyS6EA4DaqQyMvNgxz
         juaSE7R9yklhcSNWQy+zWSMl3aCTqh/Mb6UlNA99urcu67eZlF5Do8X8v0sk0Rm+/kKG
         arRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745597093; x=1746201893;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vVmQISaVL5Cg2XsgzQXK0sbbtQNmhL4LdWnCYGEZ450=;
        b=QUStb5YUrMUChPZ/Lsbf4zH5lr74sVcP8X1X1HBDr5FDObZFyT2HwxC3uYOaN7FG10
         PI0ziHX1OIpYZdPPej7oWjddcqrBg6afW0jZAY6HQYSImpF2ZJB26tv5H+/NZqjNL1GA
         LDO7v3RWjVRBgG6EmufHrf9/uJhPAmq8QAZVtbK7EWumWihKQGXHFdQNU/CWf32BM9co
         tUGWWaEsI8EsGcxSRpL0ZX3/BO4Uk36kszoHMLvPjTe/7aS8ljO0zYd3e4GcGlVK/0Hs
         w1zIAv6Kh8SUYDpI5NZ8gmGu4OBFXlD025aJJLWt3EdPzqn69pvwmGTXCAu4rm2ueMlg
         E9qQ==
X-Gm-Message-State: AOJu0YyM7JvEObP7KvRWPbkAsfZEMob9IgjKw5aUjIZDv6eQQNPnklBa
	ihv63+2Ui3QXRCMK5aAyjeuHfSnQXmMHwGsNOh4p/4musjYI6wJXwpZTLL4vYeAKRGzwXU0pSPp
	V+Xo=
X-Gm-Gg: ASbGncvfklPCKbjQ/6bMfraDjgQPBH6YlYS8TFzKNcFgysSbnlkIkwGvgBCExwsTXtj
	gEEyoQOQVFPJ/7aaMZKIBT2g6TkS5EKQ5umTJ3SJlShhGc3pRwthbUfcUBC/xYaYxkAWhsPH6Na
	uVp8ENVWAMQjsJFMzeMV0XrLutE3/AAoznwRY1CcZR1plUXBNXtRftNue5odsvSmnwqmhtyiGbw
	/4sQNvmC7oeQQ/I6STUZ1fPb8iC6Gb3FN1ICJahS3r2OZjM9h4tCgWtZiTAyOsuMSx01RSo/1V7
	a5+41pEysRs5PQj59yhvKtkulLBV85NGc8lKzCbjTMpDcIWS
X-Google-Smtp-Source: AGHT+IFygwyNuR6Mluia/w4Oq01jCNKf5/yVIETD2X/Y28L1PTlwfkhtOAURq+PQcMZWcGjTeDYsfw==
X-Received: by 2002:a05:6000:2211:b0:3a0:1d90:f7c1 with SMTP id ffacd0b85a97d-3a074d90429mr834424f8f.0.1745597093416;
        Fri, 25 Apr 2025 09:04:53 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:84a3:2b0a:bdb8:ce08])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46981sm2731522f8f.66.2025.04.25.09.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:04:53 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 25 Apr 2025 18:04:52 +0200
Message-Id: <D9FUIXQ1FIHS.2BLRCEWLXZL45@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH 4/5] KVM: RISC-V: reset VCPU state when becoming
 runnable
Cc: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Anup
 Patel" <anup@brainfault.org>, "Atish Patra" <atishp@atishpatra.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Mayuresh Chitale" <mchitale@ventanamicro.com>
To: "Andrew Jones" <ajones@ventanamicro.com>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-7-rkrcmar@ventanamicro.com>
 <20250425-2bc11e21ecef7269702c424e@orel>
In-Reply-To: <20250425-2bc11e21ecef7269702c424e@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_090455_669562_378A8DBA 
X-CRM114-Status: GOOD (  30.19  )
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

MjAyNS0wNC0yNVQxNToyNjowOCswMjowMCwgQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1p
Y3JvLmNvbT46Cj4gT24gVGh1LCBBcHIgMDMsIDIwMjUgYXQgMDE6MjU6MjNQTSArMDIwMCwgUmFk
aW0gS3LEjW3DocWZIHdyb3RlOgo+PiBCZXdhcmUsIHRoaXMgcGF0Y2ggaXMgImJyZWFraW5nIiB0
aGUgdXNlcnNwYWNlIGludGVyZmFjZSwgYmVjYXVzZSBpdAo+PiBmaXhlcyBhIEtWTS9RRU1VIGJ1
ZyB3aGVyZSB0aGUgYm9vdCBWQ1BVIGlzIG5vdCBiZWluZyByZXNldCBieSBLVk0uCj4+IAo+PiBU
aGUgVkNQVSByZXNldCBwYXRocyBhcmUgaW5jb25zaXN0ZW50IHJpZ2h0IG5vdy4gIEtWTSByZXNl
dHMgVkNQVXMgdGhhdAo+PiBhcmUgYnJvdWdodCB1cCBieSBLVk0tYWNjZWxlcmF0ZWQgU0JJIGNh
bGxzLCBidXQgZG9lcyBub3RoaW5nIGZvciBWQ1BVcwo+PiBicm91Z2h0IHVwIHRocm91Z2ggaW9j
dGxzLgo+Cj4gSSBndWVzcyB3ZSBjdXJyZW50bHkgZXhwZWN0IHVzZXJzcGFjZSB0byBtYWtlIGEg
c2VyaWVzIG9mIHNldC1vbmUtcmVnCj4gaW9jdGxzIGluIG9yZGVyIHRvIHByZXBhcmUgKCJyZXNl
dCIpIG5ld2x5IGNyZWF0ZWQgdmNwdXMsCgpVc2Vyc3BhY2Ugc2hvdWxkIGN1cnJlbnRseSBnZXQt
b25lLXJlZyBhIGZyZXNobHkgcmVzZXQgVkNQVSB0byBrbm93IHdoYXQKS1ZNIFNCSSBkZWNpZGVz
IGlzIHRoZSBjb3JyZWN0IHJlc2V0LiAgVXNlcnNwYWNlIHNob3VsZG4ndCBzZXQtb25lLXJlZwph
bnl0aGluZyBvdGhlciB0aGFuIHdoYXQgS1ZNIGRlY2lkZXMsIGhlbmNlIHdlIGNhbiBjdXJyZW50
bHkganVzdCBsZXQKS1ZNIGRvIGl0LgoKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgYW5kIEkgZ3Vlc3MKPiB0aGUgcHJvYmxlbSBpcyB0
aGF0IEtWTSBpc24ndCBjYXB0dXJpbmcgdGhlIHJlc3VsdGluZyBjb25maWd1cmF0aW9uCj4gaW4g
b3JkZXIgdG8gcmVwbGF5IGl0IHdoZW4gU0JJIEhTTSByZXNldCBpcyBpbnZva2VkIGJ5IHRoZSBn
dWVzdC4KClRoYXQgY2FuIGFsc28gYmUgYSBzb2x1dGlvbiwgYnV0IGl0J3Mgbm90IHBvc3NpYmxl
IHRvIGNhcHR1cmUgdGhlCmRlc2lyZWQgcmVzZXQgc3RhdGUgd2l0aCBjdXJyZW50IElPQ1RMcywg
YmVjYXVzZSB0aGUgZmlyc3QgcnVuIG9mIGEgVkNQVQpjYW4ganVzdCBhcyB3ZWxsIGJlIGEgcmVz
dW1lIGZyb20gYSBtaWQtZXhlY3V0aW9uLgoKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCdXQsCj4gaW5zdGVhZCBvZiBj
YXB0dXJlLXJlcGxheSB3ZSBjb3VsZCBqdXN0IGV4aXQgdG8gdXNlcnNwYWNlIG9uIGFuIFNCSQo+
IEhTTSByZXNldCBjYWxsIGFuZCBsZXQgdXNlcnNwYWNlIHJlcGVhdCB3aGF0IGl0IGRpZCBhdCB2
Y3B1LWNyZWF0ZQo+IHRpbWUuCgpSaWdodCwgSSBsaWtlIHRoZSBpZGVhLiAgKEl0IGRvZXNuJ3Qg
Zml4IGN1cnJlbnQgdXNlcnNwYWNlcywgdGhvdWdoLikKCj4+IFdlIG5lZWQgdG8gcGVyZm9ybSBh
IEtWTSByZXNldCBldmVuIHdoZW4gdGhlIFZDUFUgaXMgc3RhcnRlZCB0aHJvdWdoIGFuCj4+IGlv
Y3RsLiAgVGhpcyBwYXRjaCBpcyBvbmUgb2YgdGhlIHdheXMgd2UgY2FuIGFjaGlldmUgaXQuCj4+
IAo+PiBBc3N1bWUgdGhhdCB1c2Vyc3BhY2UgaGFzIG5vIGJ1c2luZXNzIHNldHRpbmcgdGhlIHBv
c3QtcmVzZXQgc3RhdGUuCj4+IEtWTSBpcyBkZS1mYWN0byB0aGUgU0JJIGltcGxlbWVudGF0aW9u
LCBhcyB0aGUgU0JJIEhTTSBhY2NlbGVyYXRpb24KPj4gY2Fubm90IGJlIGRpc2FibGVkIGFuZCB1
c2Vyc3BhY2UgY2Fubm90IGNvbnRyb2wgdGhlIHJlc2V0IHN0YXRlLCBzbyBLVk0KPj4gc2hvdWxk
IGJlIGluIGZ1bGwgY29udHJvbCBvZiB0aGUgcG9zdC1yZXNldCBzdGF0ZS4KPj4gCj4+IERvIG5v
dCByZXNldCB0aGUgcGMgYW5kIGExIHJlZ2lzdGVycywgYmVjYXVzZSBTQkkgcmVzZXQgaXMgZXhw
ZWN0ZWQgdG8KPj4gcHJvdmlkZSB0aGVtIGFuZCBLVk0gaGFzIG5vIGlkZWEgd2hhdCB0aGVzZSBy
ZWdpc3RlcnMgc2hvdWxkIGJlIC0tIG9ubHkKPj4gdGhlIHVzZXJzcGFjZSBrbm93cyB3aGVyZSBp
dCBwdXQgdGhlIGRhdGEuCj4KPiBzL3VzZXJzcGFjZS9ndWVzdC8KCkJvdGggYXJlIGNvcnJlY3Qu
Li4gIEkgc2hvdWxkIGhhdmUgbWFkZSB0aGUgY29udGV4dCBjbGVhcmVyIGhlcmUuCkkgbWVhbnQg
dGhlIGluaXRpYWwgaGFydCBib290LCB3aGVyZSB1c2Vyc3BhY2UgbG9hZHMgY29kZS9kdCBhbmQg
c2V0cwpwYy9hMSB0byB0aGVtLgoKPj4gQW4gaW1wb3J0YW50IGNvbnNpZGVyYXRpb24gaXMgcmVz
dW1lLiAgVXNlcnNwYWNlIG1pZ2h0IHdhbnQgdG8gc3RhcnQKPj4gd2l0aCBub24tcmVzZXQgc3Rh
dGUuICBDaGVjayByYW5fYXRsZWFzdF9vbmNlIHRvIGFsbG93IHRoaXMsIGJlY2F1c2UKPj4gS1ZN
LVNCSSBIU00gY3JlYXRlcyBzb21lIFZDUFVzIGFzIFNUT1BQRUQuCj4+IAo+PiBUaGUgZHJhd2Jh
Y2sgaXMgdGhhdCB1c2Vyc3BhY2UgY2FuIHN0aWxsIHN0YXJ0IHRoZSBib290IFZDUFUgd2l0aCBh
bgo+PiBpbmNvcnJlY3QgcmVzZXQgc3RhdGUsIGJlY2F1c2UgdGhlcmUgaXMgbm8gd2F5IHRvIGRp
c3Rpbmd1aXNoIGEgZnJlc2hseQo+PiByZXNldCBuZXcgVkNQVSBvbiB0aGUgS1ZNIHNpZGUgKHVz
ZXJzcGFjZSBtaWdodCBzZXQgc29tZSB2YWx1ZXMgYnkKPj4gbWlzdGFrZSkgZnJvbSBhIHJlc3Rv
cmVkIFZDUFUgKHVzZXJzcGFjZSBtdXN0IHNldCBhbGwgdmFsdWVzKS4KPgo+IElmIHRoZXJlJ3Mg
YSBjb3JyZWN0IHZzLiBpbmNvcnJlY3QgcmVzZXQgc3RhdGUgdGhhdCBLVk0gbmVlZHMgdG8gZW5m
b3JjZSwKPiB0aGVuIHdlJ2xsIG5lZWQgYSBkaWZmZXJlbnQgQVBJIHRoYW4ganVzdCBhIGJ1bmNo
IG9mIHNldC1vbmUtcmVnIGNhbGxzLAo+IG9yIHNldC9nZXQtb25lLXJlZyBzaG91bGQgYmUgV0FS
TCBmb3IgdXNlcnBhY2UuCgpJbmNvcnJlY3QgbWlnaHQgaGF2ZSBiZWVuIHRvbyBzdHJvbmcgd29y
ZC4uLiB3aGlsZSB0aGUgU0JJIHJlc2V0IHN0YXRlCmlzIHRlY2huaWNhbGx5IFVOU1BFQ0lGSUVE
LCBJIHRoaW5rIGl0J3MganVzdCBhc2tpbmcgZm9yIGJ1Z3MgaWYgdGhlCmhhcnRzIGhhdmUgZGlm
ZmVyZW50IGluaXRpYWwgc3RhdGVzIGJhc2VkIG9uIHRoZWlyIHJlc2V0IG1ldGhvZC4KCj4gICAg
c2V0L2dldC1vbmUtcmVnIHNob3VsZCBiZSBXQVJMIGZvciB1c2VycGFjZS4KCldBQUFBISA6KQoK
Pj4gVGhlIGFkdmFudGFnZSBvZiB0aGlzIHNvbHV0aW9uIGlzIHRoYXQgaXQgZml4ZXMgY3VycmVu
dCBRRU1VIGFuZCBtYWtlcwo+PiBzb21lIHNlbnNlIHdpdGggdGhlIGFzc3VtcHRpb24gdGhhdCBL
Vk0gaW1wbGVtZW50cyBTQkkgSFNNLgo+PiBJIGRvIG5vdCBsaWtlIGl0IHRvbyBtdWNoLCBzbyBJ
J2QgYmUgaW4gZmF2b3Igb2YgYSBkaWZmZXJlbnQgc29sdXRpb24gaWYKPj4gd2UgY2FuIHN0aWxs
IGFmZm9yZCB0byBkcm9wIHN1cHBvcnQgZm9yIGN1cnJlbnQgdXNlcnNwYWNlcy4KPj4gCj4+IEZv
ciBhIGNsZWFuZXIgc29sdXRpb24sIHdlIHNob3VsZCBhZGQgaW50ZXJmYWNlcyB0byBwZXJmb3Jt
IHRoZSBLVk0tU0JJCj4+IHJlc2V0IHJlcXVlc3Qgb24gdXNlcnNwYWNlIGRlbWFuZC4KPgo+IFRo
YXQncyB3aGF0IHRoZSBjaGFuZ2UgdG8ga3ZtX2FyY2hfdmNwdV9pb2N0bF9zZXRfbXBzdGF0ZSgp
IGluIHRoaXMKPiBwYXRjaCBpcyBwcm92aWRpbmcsIHJpZ2h0PwoKSXQgZG9lcy4gIFdpdGggY29u
ZGl0aW9ucyB0byBiZSBhcyBjb21wYXRpYmxlIGFzIHBvc3NpYmxlLgoKPj4gSSB0aGluayBpdCB3
b3VsZCBhbHNvIGJlIG11Y2ggYmV0dGVyCj4+IGlmIHVzZXJzcGFjZSB3YXMgaW4gY29udHJvbCBv
ZiB0aGUgcG9zdC1yZXNldCBzdGF0ZS4KPgo+IEFncmVlZC4gQ2FuIHdlIGp1c3QgZXhpdCB0byB1
c2Vyc3BhY2Ugb24gU0JJIEhTTSByZXNldD8KClllcy4gIChJdCBuZWVkcyBhbiB1c2Vyc3BhY2Ug
dG9nZ2xlIGlmIHdlIGNhcmUgYWJvdXQKYmFja3dhcmQtY29tcGF0aWJsaXR5LCB0aG91Z2guKQoK
SG93IG11Y2ggZG8gd2Ugd2FudCB0byBmaXgvYnJlYWsgY3VycmVudCB1c2Vyc3BhY2VzPwoKVGhh
bmtzLgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlz
Y3YK
