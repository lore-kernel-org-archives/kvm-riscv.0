Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46024C79FBF
	for <kvm-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 15:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2boLNRKD/q+PNgz9gG0wXajxGX2dZCKYz6c/ieCL2NA=; b=PVKczZ548NwWfe
	aB6+bSIr9cZCb8DhSGLRK4Y+0loUDjI4qqmluQ8khYky0afYZxY3+j/Q7BW2i0pda7jEGItcODVIF
	XqWZOUqtWR+6w8pMtBZhqZOVZdrFSLQX2juTsrejr3z3fFhkeXlh8228qbVQFID1XTEZtVCBCV7qr
	R33ujMd+NLT3DFVcCBNKQ1PQG5VhO2MG8V4l3sAZCn2EwnnbrI8rW8UnyFCxGaaYW/gFwZ+moJFTl
	cqle53QWpHVJX9ozk4QAxWlu+lufNiSgq/uh5QBvA+B78R4L+6ASQ2WQ4FUOQHu0mChhr3OjsUMbP
	KpVlE59karGOw+iynA2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gij-0000000EnQu-2OOw;
	Thu, 10 Sep 2026 15:29:49 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gig-0000000EnQC-2MI0;
	Thu, 10 Sep 2026 15:29:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789054186; x=1820590186;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SFcUASuvlDRtE2C4hK5s4ZmzjFE6/W3nNqwA+OR44zY=;
  b=k2egxiLIxOiBR9RNUCG9keDbzF7F1l5fuFxQ3z3Z02qJkD4/wOzYyzku
   KCm/TqJ+AEiK6ScBJNIzBUv/BSh4UBUp2cS53bU7Z38CQ4Wz+cq+s5Qwc
   w14kqgDTHecTdD1fq5KczfU2BOY8Zh7BHbJ0UEsZ9aU+EhGOWnZBgtG5Z
   DvpzYCdr6LJ0QNkHSx+uApj7858h1a0mIsONcQ7g6GonCPKRH/CxjGYXd
   Tzc6nKpZRar23SUeTAZ8tWwEMceS0nKPoNWSf3+UEglKhq6gAupw5ijm4
   hZLDkkCz/vcOFftFKz3I1737Qq7JzPoZGJkzaQl7PlItzUG0lPEUKIRei
   w==;
X-CSE-ConnectionGUID: 6eiEuW8RSpq4s3Br3A91Sg==
X-CSE-MsgGUID: UXhc4BAiSe6z+Z2pFAPXmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="106875859"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="106875859"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:29:45 -0700
X-CSE-ConnectionGUID: 8Dukv6vfSb2j1KuCmCzgkg==
X-CSE-MsgGUID: XenJd8NISqWyB5sRR4Bqeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="270317323"
Received: from ssimmeri-mobl2.amr.corp.intel.com (HELO [10.125.111.208]) ([10.125.111.208])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:29:43 -0700
Message-ID: <c1ce8e10-e190-45b4-b279-18f92aa4029d@intel.com>
Date: Thu, 10 Sep 2026 08:29:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 13/21] x86: mm: use pgtable_level enum in
 effective_prot_pXd()
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Russell King <linux@armlinux.org.uk>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>,
 Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-openrisc@vger.kernel.org
References: <20260902-dummy_ptxp3-v3-0-5d8f5b17c25c@arm.com>
 <20260902-dummy_ptxp3-v3-13-5d8f5b17c25c@arm.com>
 <8f3979a9-238a-4d7d-a040-6aa526fedec5@intel.com>
 <aed03085-1d9c-4a26-be9e-196c3ea941d1@kernel.org>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <aed03085-1d9c-4a26-be9e-196c3ea941d1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_082946_643532_F56BD580 
X-CRM114-Status: GOOD (  11.99  )
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

T24gOS8xMC8yNiAwNDowMiwgRGF2aWQgSGlsZGVuYnJhbmQgKEFybSkgd3JvdGU6Cj4gT24gOS8y
LzI2IDIyOjQ4LCBEYXZlIEhhbnNlbiB3cm90ZToKPj4gT24gOS8yLzI2IDA0OjU2LCBZZW9yZXVt
IFl1biB3cm90ZToKPj4+IEluc3RlYWQgb2YgdXNpbmcgaGFyZC1jb2RlZCBpbnRlZ2VyIGluIGVm
ZmVjdGl2ZV9wcm90X3BYZCgpLCB1c2UKPj4+IHBndGFibGUgbGV2ZWwgZW51bS4KPj4gRG9lcyB0
aGlzIGFjdHVhbGx5ICpkbyogYW55dGhpbmc/IPCfmIkKPj4KPj4gSSBndWVzcyBpdCdzIG5pY2Ug
dG8gaGF2ZSBhIHdlZSBiaXQgb2YgdHlwZSBzYWZldHkgZnJvbSB0aGUgZW51bSBhbmQgaXQKPj4g
bWVhbnMgdGhhdCB5b3UgZG9uJ3QgaGF2ZSB0byAqa25vdyogd2hpY2ggbGV2ZWwgbnVtYmVyIGEg
UFVEIGlzLCBmb3IKPj4gZXhhbXBsZS4KPiBUaGUgbmV4dCBwYXRjaCBwYXNzZXMgdGhlIHZhbHVl
IHRvIG1tX2ZpcnN0X3BndGFibGVfbGV2ZWwoKS4gTm90IHN1cmUgd2hhdCB4ODYncwo+IHByZWZl
cmVuY2UgaXMgdG8gc3BlbGwgc29tZXRoaW5nIGxpa2UgdGhhdCBvdXQgaW4gdGhlIHBhdGNoIGRl
c2NyaXB0aW9uLgo+IAo+ICJQcmVwYXJlIGZvciBmdXR1cmUgY29kZSBjaGFuZ2VzIHRoYXQgd2ls
bCBjb25zdW1lIHRoZSBnZW5lcmljIGVudW0KPiBwZ3RhYmxlX2xldmVsIGZyb20gaW5zaWRlIGVm
ZmVjdGl2ZV9wcm90KCkuIgoKWWVzLCBhIGxpdHRsZSAicHJlcGFyZSIgYmxvYiB3b3VsZCBiZSBn
cmVhdC4KCk1heWJlIGV2ZW4gZXhwbGFpbiB0aGF0IGdlbmVyaWMgbW0gY29kZSB1c2VzIHN5bWJv
bGljIG5hbWVzIGZvciB0aGUgcGFnZQp0YWJsZSBsZXZlbHMsIG5vdCBpbnRlZ2VycyBhbmQgdGhp
cyBtYWtlcyB0aGUgaGVscGVyIHVzYWJsZSBpbiB0aGlzIHg4Ngpjb2RlLgoKLS0gCmt2bS1yaXNj
diBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
