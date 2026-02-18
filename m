Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14C5E9A02C
	for <kvm-riscv@archiver.kernel.org>; Wed, 18 Feb 2026 21:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TfvrxnYOxB0rpByl7kiNcXSvuFOUhN9XLbw1POY4IgA=; b=BGT1RCwersRo6ff18/KRKYu7y7
	eavJDBuOXga+uKEV38vh095W6tZ6+mEPK9DT1VDMEpj/FMReBKB0Ihs5vjCJ1pLx6UEA3y3Dq2W0L
	ESYVc9n9Cd2o3RT26bMGu4lnBml4iZsR75iMaBS3YSTt+JMGdRHhDqkNxBpCSbIOpOZkyIh7nMZ56
	6fmcHgYgBxYjg9bnuER7y+W/8sfp9Br+s43e7vHoulZWVMNF9qRdUim1VWm33fA0Ok0rP+4nIAfu0
	Z6P7nlkMa5q0fpEHaQMmtkmLcsJx300wUoO90C8dx/RJCZsV82KObw43ryaC5iOs6xzV8TmQtFXQV
	gKHIlzvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsokQ-0000000AQLf-0tvp;
	Wed, 18 Feb 2026 21:06:14 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsokN-0000000AQKR-0nLu
	for kvm-riscv@lists.infradead.org;
	Wed, 18 Feb 2026 21:06:12 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so487023a91.0
        for <kvm-riscv@lists.infradead.org>; Wed, 18 Feb 2026 13:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771448769; x=1772053569; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ccWJDzJ7m4S4l+nz4VuzRpZZrXnjyW9kyBaNIifc8MY=;
        b=YNY80BqNjB+Y1BWl0u6kQHx0Yl5dS3K8LHx9UrJBmIidMd7qedtPqsNfXoO7LMXs5D
         EHmFrLJ75Z/4/z5GMPom9zd/71UIlLdW8dLFZzwY2QSjYeJqe4fE1eNTmu/EKQ0vOEzs
         8e3ppoT3kdyWCv2/aBb3UZ8o28/Fr14o/5fNKdr/7j5oekFpTJmMXj+mT5c1iifGXKFG
         Xq0EqXpcklGmi2u1pW8YKKBIrKKtT6XRa0W9ZCkmeN2Cuadisq9ADhmcNZisw1+2RpPJ
         r6WrslBOhUhCu7I5D2VjVsNMy5sa5m5fRRUlro1fYNSDyhJZiuYpmlhANiQYXed0d3tA
         mMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771448769; x=1772053569;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ccWJDzJ7m4S4l+nz4VuzRpZZrXnjyW9kyBaNIifc8MY=;
        b=psqmkTMIQ3dzT2N4tjnS9NPwpmS6eq5FCB0JzrUTDeM+1mj9u8RA4TdGVc30j6ppwt
         eTLkEawoKdCFDKPSC+ur3xjDKUcgK/MBmTyNucYmxdY+0PWGnjToMQMJ+op/9EZPBWHU
         NYbCtPDSLWs+KirysldAEO1CbuRi/Z1HiYZaxUgK6ZwUkrmaPrKpBlE+/6r9OsDa7mz3
         OMs/HkcOpcZIOCp/jXJAhtP6tjTw2TFmpVrNKsSnd8hc83IYkZNNPQY7JeaY8sH9/AR/
         3Bq1L8s0zXu/eeWyI+Mz0gw+wQWef2fDwg9gDLjWp4oxrXqekCqSo3SVH4obt4wgLLs3
         +SVw==
X-Forwarded-Encrypted: i=1; AJvYcCWUAE0mr8P6RjuIV7VIbLEvsAMX1dE18/LXMyjE+EA4SpEQcrgHSvpUXiOW5uKDEt7/W+OMibJLzCk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzIaIe7eDrjTO+NOOdfjzBH62fG+GfYQ7QuE2lKRGSvbmkrutbN
	C6S0n6dUDdaGzzpZNwA5U/QDDQT9dhQC6O+PJMAbmqqKPiABbU/D6EJt+aWMhTQupYdE8l8auZI
	WKV0HPQ==
X-Received: from pjbne18.prod.google.com ([2002:a17:90b:3752:b0:356:1da4:5dd1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5584:b0:34a:c671:50df
 with SMTP id 98e67ed59e1d1-35888d58b61mr2639291a91.17.1771448768639; Wed, 18
 Feb 2026 13:06:08 -0800 (PST)
Date: Wed, 18 Feb 2026 13:06:07 -0800
In-Reply-To: <CALzav=fN4FpZsfzwbdLeNSj4nx4OpRkwHvKiZNVgP8S-zsUvJA@mail.gmail.com>
Mime-Version: 1.0
References: <20250501183304.2433192-1-dmatlack@google.com> <aBPhs39MJz-rt_Ob@google.com>
 <CALzav=eqv0Fh9pzaBgjZ-fehwFbD4YscoLQz0=o0TKQT_zLTwQ@mail.gmail.com>
 <aRZ9SQ_G2lsmXtur@google.com> <CALzav=fN4FpZsfzwbdLeNSj4nx4OpRkwHvKiZNVgP8S-zsUvJA@mail.gmail.com>
Message-ID: <aZYpv6O15YMlGkzT@google.com>
Subject: Re: [PATCH 00/10] KVM: selftests: Convert to kernel-style types
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Eric Auger <eric.auger@redhat.com>, 
	James Houghton <jthoughton@google.com>, Colin Ian King <colin.i.king@gmail.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_130611_235545_76A2FCDC 
X-CRM114-Status: GOOD (  16.84  )
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

T24gV2VkLCBEZWMgMDMsIDIwMjUsIERhdmlkIE1hdGxhY2sgd3JvdGU6Cj4gT24gVGh1LCBOb3Yg
MTMsIDIwMjUgYXQgNDo1MuKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUu
Y29tPiB3cm90ZToKPiA+IE15IHNsb3duZXNzIGlzIGxhcmdlbHkgYmVjYXVzZSBJJ20gbm90IHN1
cmUgaG93IHRvIGxhbmQvYXBwcm9hY2ggdGhpcy4gIEknbSAxMDAlCj4gPiBpbiBmYXZvciBvZiB0
aGUgcmVuYW1lcywgaXQncyB0aGUgdGltaW5nIGFuZCBjb29yZGluYXRpb24gSSdtIHVuc3VyZSBv
Zi4KPiA+Cj4gPiBJbiBoaW5kc2lnaHQsIGl0IHByb2JhYmx5IHdvdWxkIGhhdmUgYmVzdCB0byBz
cXVlZXplIGl0IGludG8gNi4xOCwgc28gYXQgbGVhc3QKPiA+IHRoZSBtb3N0IHJlY2VudCBMVFMg
d291bGRuJ3QgZ2VuZXJhdGUgY29uZmxpY3RzIGFsbCBvdmVyIHRoZSBwbGFjZS4gIFRoZSBuZXh0
Cj4gPiBiZXN0IG9wdGlvbiB3b3VsZCBwcm9iYWJseSBiZSB0byBzcGluIGEgbmV3IHZlcnNpb24s
IGJyaWJlIFBhb2xvIHRvIGFwcGx5IGl0IGF0Cj4gPiB0aGUgZW5kIG9mIHRoZSBuZXh0IG1lcmdl
IHdpbmRvdywgYW5kIHRhZyB0aGUgd2hvbGUgdGhpbmcgZm9yIHN0YWJsZUAgKG1heWJlCj4gPiBs
aW1pdGVkIHRvIDYuMTgrPykgdG8gbWluaW1pemUgZG93bnN0cmVhbSBwYWluLgo+IAo+IFdpdGgg
TFBDIGNvbWluZyB1cCBJIHdvbid0IGhhdmUgY3ljbGVzIHRvIHBvc3QgYSBuZXcgdmVyc2lvbiBi
ZWZvcmUKPiB0aGUgNi4xOSBtZXJnZSB3aW5kb3cgY2xvc2VzLgo+IAo+IEknbSB0ZW1wdGVkIHRv
IHNheSBsZXQncyBqdXN0IHdhaXQgZm9yIHRoZSBuZXh0IExUUyByZWxlYXNlIGFuZCBtZXJnZQo+
IGl0IGluIHRoZW4uIFRoaXMgaXMgbG93IHByaW9yaXQsIHNvIEknbSBmaW5lIHdpdGggd2FpdGlu
Zy4KCkkgcmFuIHRoaXMgYnkgUGFvbG8gaW4gbGFzdCB3ZWVrJ3MgUFVDSywgYW5kIGhlJ3MgaW4g
ZmF2b3Igb2YgdGhlIHJlbmFtZXMgKG9yIGF0CmxlYXN0LCBpcyBhLW9rIHdpdGggdXMgZG9pbmcg
aXQpLiAgSWYgeW91IGNhbiBwcmVwIGEgbmV3IHZlcnNpb24gaW4gdGhlIG5leHQgd2VlawpvciBz
bywgd2UgY2FuIGdldCBpdCBhcHBsaWVkIGZvciA3LjEgc2hvcnRseSBhZnRlciB0aGUgbWVyZ2Ug
d2luZG93IGNsb3Nlcy4KCldlIGRvbid0IHNlbmQgYWxsIHRoYXQgbWFueSBzZWxmdGVzdHMgcGF0
Y2hlcyB0byBMVFMga2VybmVscywgc28gSU1PIGl0J3Mgbm90CndvcnRoIHdhaXRpbmcgZm9yIHRo
ZSBuZXh0IExUUyB0byBjb21lIGFyb3VuZC4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2
bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
