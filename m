Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F149CC5B555
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 00:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EFEBanDotj7gK+7GVdKpnHRd7JnGvXAFVNjEFp1/cck=; b=r8rioDgzIfm4PU
	P8+KiKNmxFrKp6kIQkYbJIy8GlldoX0+iR+BCfwWEET4hZ8pzyw/M9n12a3v62D2M4HnbXz4zFZyl
	i5laSIPSIvhZrFi9mtRpiT3o8oC1Vz7GU7y7YsLSFy340htzT0CzbX29ePfP6HSMu61n0wa6itS+K
	OlEjFi8My7lThl3IfsLAEIiCUypwAhO2DFmSKo7vXRVv/bC0SmvwsX67YtXR8B28MR8RQAsrI/aEj
	5xuJagg13SksbDLBY9dgIqq81/0d9qecZVQ3gn5WmWKHyBC9okdDRJWQyUBNGAe4rOuhSXX9LccRM
	LIYCkS+7+H0OCwbZoKug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNKgm-0000000GpXl-2LUP;
	Fri, 06 Jun 2025 00:12:04 +0000
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNKgk-0000000GpXL-1ZY3
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 00:12:03 +0000
Message-ID: <a17bf7bf-238f-4b71-8f77-6ca4fea380f8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749168718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uXGHLViCT6YsAqsubq+1xL9M6AMjoxBoATCFHCFNHMw=;
	b=ITauuJeusjWNoPZBazcCGDTBOS9Mzdjmvqy+zHyfdEJxh9I5R+6TB+D6FH2g60izyxGVIj
	y8LTRwAPhaN/omJbgCxyx40ZZX/H/8QW+iIhnwPrf0u9C+GHyX3Km2xSGTe2nEZlOGg+YD
	7Jm9BC3zaOXU7d/fDTh+4fstAorXqkU=
Date: Thu, 5 Jun 2025 17:11:47 -0700
MIME-Version: 1.0
Subject: Re: [PATCH 02/13] RISC-V: KVM: Don't treat SBI HFENCE calls as NOPs
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250605061458.196003-1-apatel@ventanamicro.com>
 <20250605061458.196003-3-apatel@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250605061458.196003-3-apatel@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_171202_624129_DCC76E06 
X-CRM114-Status: GOOD (  11.75  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDYvNC8yNSAxMToxNCBQTSwgQW51cCBQYXRlbCB3cm90ZToKPiBUaGUgU0JJIHNwZWNpZmlj
YXRpb24gY2xlYXJseSBzdGF0ZXMgdGhhdCBTQkkgSEZFTkNFIGNhbGxzIHNob3VsZAo+IHJldHVy
biBTQklfRVJSX05PVF9TVVBQT1JURUQgd2hlbiBvbmUgb2YgdGhlIHRhcmdldCBoYXJ0IGRvZXNu
4oCZdAo+IHN1cHBvcnQgaHlwZXJ2aXNvciBleHRlbnNpb24gKGFrYSBuZXN0ZWQgdmlydHVhbGl6
YXRpb24gaW4tY2FzZQo+IG9mIEtWTSBSSVNDLVYpLgo+Cj4gRml4ZXM6IGM3ZmEzYzQ4ZGU4NiAo
IlJJU0MtVjogS1ZNOiBUcmVhdCBTQkkgSEZFTkNFIGNhbGxzIGFzIE5PUHMiKQo+IFNpZ25lZC1v
ZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+ICAgYXJj
aC9yaXNjdi9rdm0vdmNwdV9zYmlfcmVwbGFjZS5jIHwgNCArKy0tCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfc2JpX3JlcGxhY2UuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3Jl
cGxhY2UuYwo+IGluZGV4IDk3NTJkMmZmZmY2OC4uYjE3ZmFkMDkxYmFiIDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3JlcGxhY2UuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3Zt
L3ZjcHVfc2JpX3JlcGxhY2UuYwo+IEBAIC0xMjcsOSArMTI3LDkgQEAgc3RhdGljIGludCBrdm1f
c2JpX2V4dF9yZmVuY2VfaGFuZGxlcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1f
cnVuICpydW4KPiAgIAljYXNlIFNCSV9FWFRfUkZFTkNFX1JFTU9URV9IRkVOQ0VfVlZNQV9BU0lE
Ogo+ICAgCQkvKgo+ICAgCQkgKiBVbnRpbCBuZXN0ZWQgdmlydHVhbGl6YXRpb24gaXMgaW1wbGVt
ZW50ZWQsIHRoZQo+IC0JCSAqIFNCSSBIRkVOQ0UgY2FsbHMgc2hvdWxkIGJlIHRyZWF0ZWQgYXMg
Tk9Qcwo+ICsJCSAqIFNCSSBIRkVOQ0UgY2FsbHMgc2hvdWxkIHJldHVybiBub3Qgc3VwcG9ydGVk
Cj4gKwkJICogaGVuY2UgZmFsbHRocm91Z2guCj4gICAJCSAqLwo+IC0JCWJyZWFrOwo+ICAgCWRl
ZmF1bHQ6Cj4gICAJCXJldGRhdGEtPmVycl92YWwgPSBTQklfRVJSX05PVF9TVVBQT1JURUQ7Cj4g
ICAJfQoKUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgoKCi0t
IAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
