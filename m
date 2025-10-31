Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AD0CCFA00
	for <kvm-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 09:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d+FzBME+SQhOSnSHSOimKlDom1GPpT7D7w2/FipIyAg=; b=Otgu7N4dFdVipu
	XltrzFkLKPDTvRzCBeFoJQw+jLJ2u+Ng0+Ug6oGjy1SjumTwr5JU3VkiNAWDB7I/2T08VW7b8FsMf
	c3w8+WWlUFSiDUgrEiBMHYRonOlEaJjzXm0528uhtvhW3WIYoGHU9djeNPZhQR1Oge7DWG4GxTgqb
	4xcTzasNmsr2KwORKJT7v/DSyBS7usW9MXY9MXy17BPXrCRvhyl1Tw5Fc4Sz5uYsviT4HjdAM4pZH
	WV5yGA8F17eIPxHpylgaLtHGoiMCoZx4AGU4uKFhc7ZjZzQW/6eL3IARW/TZUzqZMfbfAs5awY+5x
	wmx0U2tmYkgVSGKamMeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEl4p-00000005kMl-11Oy;
	Fri, 31 Oct 2025 09:05:44 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEl4n-00000005kM6-1wOJ;
	Fri, 31 Oct 2025 09:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761901541; x=1793437541;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qFNmSQUeXMaY7XvP4sAPgKkJ8Ev3XCXyw2q+qbAZDIU=;
  b=D+MDkPJIuJbXracYjeQPrhqp2Z1J8PA42DgmToB5mtukOzejdJb50tr6
   cLik5jPvXKRz1TM0r9X8dHdLwjvAhrFZvBTXG64qqlr2LGGgWJd057SKV
   riKu2x1GjGa/3ov1D3aXluC2bfwO+Lnvk7pyy+UKDpfTqKXZBJhDDNa+K
   wqzyu3ndmH8bFkjB8hFr8tj2gVzIxiJRl5hoyCY9nmtnDWF73mdl49V8F
   KacemejJhnFmXDuQYf52FiW0d3a1eqYStTprjDAyMJ5qMk7cdYqu1SXzT
   ZlAEQkWog/K+kF29XWI6K/5yTiO0WAP93vNCb8WIg58Du34qMeGWNFCv+
   Q==;
X-CSE-ConnectionGUID: tEiLt9G5SqyhLgFW8uPmOA==
X-CSE-MsgGUID: Tue60yezT+2yOgJW9ot+EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="89523298"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="89523298"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:05:41 -0700
X-CSE-ConnectionGUID: wf1Dt5UnRy6jaWYzdx9wDQ==
X-CSE-MsgGUID: x9G1JpmbTtGdOFT3heo6QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186121954"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.240.28]) ([10.124.240.28])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 02:05:32 -0700
Message-ID: <18ecf186-c3b9-4027-a54b-7f3e5ba9f484@linux.intel.com>
Date: Fri, 31 Oct 2025 17:05:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/28] KVM: TDX: Assert that mmu_lock is held for write
 when removing S-EPT entries
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ackerley Tng <ackerleytng@google.com>
References: <20251030200951.3402865-1-seanjc@google.com>
 <20251030200951.3402865-21-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251030200951.3402865-21-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_020541_515641_8C4F1DA8 
X-CRM114-Status: GOOD (  16.41  )
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

CgpPbiAxMC8zMS8yMDI1IDQ6MDkgQU0sIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3JvdGU6Cj4gVW5j
b25kaXRpb25hbGx5IGFzc2VydCB0aGF0IG1tdV9sb2NrIGlzIGhlbGQgZm9yIHdyaXRlIHdoZW4g
cmVtb3ZpbmcgUy1FUFQKPiBlbnRyaWVzLCBub3QganVzdCB3aGVuIHJlbW92aW5nIFMtRVBUIGVu
dHJpZXMgdHJpZ2dlcnMgY2VydGFpbiBjb25kaXRpb25zLAo+IGUuZy4gbmVlZHMgdG8gZG8gVERI
X01FTV9UUkFDSyBvciBraWNrIHZDUFVzIG91dCBvZiB0aGUgZ3Vlc3QuCj4gQ29uZGl0aW9uYWxs
eSBhc3NlcnRpbmcgaW1wbGllcyB0aGF0IGl0J3Mgc2FmZSB0byBob2xkIG1tdV9sb2NrIGZvciBy
ZWFkCj4gd2hlbiB0aG9zZSBwYXRocyBhcmVuJ3QgaGl0LCB3aGljaCBpcyBzaW1wbHkgbm90IHRy
dWUsIGFzIEtWTSBkb2Vzbid0Cj4gc3VwcG9ydCByZW1vdmluZyBTLUVQVCBlbnRyaWVzIHVuZGVy
IHJlYWQtbG9jay4KPgo+IE9ubHkgdHdvIHBhdGhzIGxlYWQgdG8gcmVtb3ZlX2V4dGVybmFsX3Nw
dGUoKSwgYW5kIGJvdGggcGF0aHMgYXNzZXJ0cyB0aGF0CiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBeCiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBh
c3NlcnQKPiBtbXVfbG9jayBpcyBoZWxkIGZvciB3cml0ZSAodGRwX21tdV9zZXRfc3B0ZSgpIHZp
YSBsb2NrZGVwLCBhbmQKPiBoYW5kbGVfcmVtb3ZlZF9wdCgpIHZpYSBLVk1fQlVHX09OKCkpLgo+
Cj4gRGVsaWJlcmF0ZWx5IGxlYXZlIGxvY2tkZXAgYXNzZXJ0aW9ucyBpbiB0aGUgIm5vIHZDUFVz
IiBoZWxwZXJzIHRvIGRvY3VtZW50Cj4gdGhhdCB3YWl0X2Zvcl9zZXB0X3phcCBpcyBndWFyZGVk
IGJ5IGhvbGRpbmcgbW11X2xvY2sgZm9yIHdyaXRlLCBhbmQga2VlcAo+IHRoZSBjb25kaXRpb25h
bCBhc3NlcnQgaW4gdGR4X3RyYWNrKCkgYXMgd2VsbCwgYnV0IHdpdGggYSBjb21tZW50IHRvIGhl
bHAKPiBleHBsYWluIHdoeSBob2xkaW5nIG1tdV9sb2NrIGZvciB3cml0ZSBtYXR0ZXJzIChhYm92
ZSBhbmQgYmV5b25kIHdoeQo+IHRkeF9zZXB0X3JlbW92ZV9wcml2YXRlX3NwdGUoKSdzIHJlcXVp
cmVtZW50cykuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNA
Z29vZ2xlLmNvbT4KClJldmlld2VkLWJ5OiBCaW5iaW4gV3UgPGJpbmJpbi53dUBsaW51eC5pbnRl
bC5jb20+Cgo+IC0tLQo+ICAgYXJjaC94ODYva3ZtL3ZteC90ZHguYyB8IDcgKysrKysrKwo+ICAg
MSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2
L2t2bS92bXgvdGR4LmMgYi9hcmNoL3g4Ni9rdm0vdm14L3RkeC5jCj4gaW5kZXggNjNkNDYwOWNj
M2JjLi45OTliNTE5NDk0ZTkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYva3ZtL3ZteC90ZHguYwo+
ICsrKyBiL2FyY2gveDg2L2t2bS92bXgvdGR4LmMKPiBAQCAtMTcxNSw2ICsxNzE1LDExIEBAIHN0
YXRpYyB2b2lkIHRkeF90cmFjayhzdHJ1Y3Qga3ZtICprdm0pCj4gICAJaWYgKHVubGlrZWx5KGt2
bV90ZHgtPnN0YXRlICE9IFREX1NUQVRFX1JVTk5BQkxFKSkKPiAgIAkJcmV0dXJuOwo+ICAgCj4g
KwkvKgo+ICsJICogVGhlIGZ1bGwgc2VxdWVuY2Ugb2YgVERILk1FTS5UUkFDSyBhbmQgZm9yY2lu
ZyB2Q1BVcyBvdXQgb2YgZ3Vlc3QKPiArCSAqIG1vZGUgbXVzdCBiZSBzZXJpYWxpemVkLCBhcyBU
REguTUVNLlRSQUNLIHdpbGwgZmFpbCBpZiB0aGUgcHJldmlvdXMKPiArCSAqIHRyYWNraW5nIGVw
b2NoIGhhc24ndCBjb21wbGV0ZWQuCj4gKwkgKi8KPiAgIAlsb2NrZGVwX2Fzc2VydF9oZWxkX3dy
aXRlKCZrdm0tPm1tdV9sb2NrKTsKPiAgIAo+ICAgCWVyciA9IHRkaF9tZW1fdHJhY2soJmt2bV90
ZHgtPnRkKTsKPiBAQCAtMTc2Miw2ICsxNzY3LDggQEAgc3RhdGljIHZvaWQgdGR4X3NlcHRfcmVt
b3ZlX3ByaXZhdGVfc3B0ZShzdHJ1Y3Qga3ZtICprdm0sIGdmbl90IGdmbiwKPiAgIAlncGFfdCBn
cGEgPSBnZm5fdG9fZ3BhKGdmbik7Cj4gICAJdTY0IGVyciwgZW50cnksIGxldmVsX3N0YXRlOwo+
ICAgCj4gKwlsb2NrZGVwX2Fzc2VydF9oZWxkX3dyaXRlKCZrdm0tPm1tdV9sb2NrKTsKPiArCj4g
ICAJLyoKPiAgIAkgKiBIS0lEIGlzIHJlbGVhc2VkIGFmdGVyIGFsbCBwcml2YXRlIHBhZ2VzIGhh
dmUgYmVlbiByZW1vdmVkLCBhbmQgc2V0Cj4gICAJICogYmVmb3JlIGFueSBtaWdodCBiZSBwb3B1
bGF0ZWQuIFdhcm4gaWYgemFwcGluZyBpcyBhdHRlbXB0ZWQgd2hlbgoKCi0tIAprdm0tcmlzY3Yg
bWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
