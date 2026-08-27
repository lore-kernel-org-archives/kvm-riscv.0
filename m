Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8E9C5DF9D
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 06:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wkZiopPBOkR9M6OwVIGtI+yTgPdd5Lt5sf94jA6IHZY=; b=PZ3VVvkbfuDRQ6TSvQx+FOdbbo
	PJ9LrLS47gkgYfSiqZNBciVfNEKShoz9v0tXg3zREG4t0FqXR2utXVbzWEBv/qiieE+aiH6Lqz2B6
	I+v5YG7+bjmzRoTNDeuMZVBM2nHoICgLP0o4l+eBqaKs3dS0zEuJR9KT9G9lkbNA3EdXi3bFR0NFx
	7w2mbDYZvFlF0NyM9p7wrPlwJkMXwhswEHRJKqLaWg6Ga6E837KYC4j6oJ/DtEGVLgeN2Cyw0UH8r
	bbGfS3UhCHA8/Gxui8vHjXkvSAKGD1H9TnX6aWt27l4525lPlfev9cILsiVGigMJl6cQkbxDphtGm
	PO/X6o1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzTqW-00000003V2Y-2MG0;
	Thu, 27 Aug 2026 06:44:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzTqU-00000003V2G-3kNn;
	Thu, 27 Aug 2026 06:44:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Do7zuAnsZqtiLlloXwZymdjtDRmu69WlBc61SH4nBO0=; b=kdw60+kBh9YwOjCXqyT+navO/U
	Nt4u7jQcXQ/G2K5MRUMsZmBi3kCWCGxluiQKg2zwYNfWH3VwOi/YJWqsFiB2p3EMF2eduY8Fs+Fl/
	Gh7CesEVRvqLeV6totLN0sY9+CWJ+MmP7Pb9DMVkMF37PmXUze9r3FLIhGnWUgWWYix3exzLMgm/7
	YQ4xypd/RMBList8WsMYP8CXBhpubOKTdE7Q0SVlM2FoDNOV8Z+mbvzFG+HrF8jNwh9L5qHjr7ZZu
	bldHkX5mj0pS4iEC/IxfLl7LXup8MV9A7cZQBB2K1JaW0asZbGvJD083buHXaWpffzlO7PHoPCQaK
	PYE11HVQ==;
Received: from mail.loongson.cn ([114.242.206.163])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wzTqR-00000007EcY-05Yi;
	Thu, 27 Aug 2026 06:44:17 +0000
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8BxrtK23I9qn5gFAA--.15770S3;
	Thu, 27 Aug 2026 14:44:06 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJBxpMyw3I9qFekTAA--.11563S2;
	Thu, 27 Aug 2026 14:44:03 +0800 (CST)
Subject: Re: [PATCH 03/20] KVM: selftests: Use vm_alloc_page_table() to
 allocate LoongArch page tables
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>,
 Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Ritesh Harjani <ritesh.list@gmail.com>
References: <20260826230511.972824-1-seanjc@google.com>
 <20260826230511.972824-4-seanjc@google.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <9b5244ae-5927-b775-e0c4-deaefa9961e7@loongson.cn>
Date: Thu, 27 Aug 2026 14:43:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20260826230511.972824-4-seanjc@google.com>
Content-Language: en-US
X-CM-TRANSID: qMiowJBxpMyw3I9qFekTAA--.11563S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kr17CrW3XF18AFyUJr4UJrc_yoW8WFy3pa
	4kCry0kr4rGw17KrZ7Gwn2qFyxKFs7GrWxAF1ftry8ZwnrAryIqrs7KF9rXa45Z3yvv3WS
	vF1I9r4fZF48Z3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUP529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1q6r43M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUtVW8ZwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jCMKZUUU
	UU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_074415_618131_8C7EC16A 
X-CRM114-Status: GOOD (  15.51  )
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

CgpPbiAyMDI2LzgvMjcg5LiK5Y2INzowNCwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToKPiBO
b3cgdGhhdCBLVk1fR1VFU1RfUEFHRV9UQUJMRV9NSU5fUEFERFIgPT0gTE9PTkdBUkNIX1BBR0Vf
VEFCTEVfUEhZU19NSU4sCj4gdXNlIHRoZSBjb21tb24gdm1fYWxsb2NfcGFnZV90YWJsZSgpIGlu
c3RlYWQgb2Ygb3BlbiBjb2RpbmcgdGhlIHNhbWUuCj4gCj4gT3Bwb3J0dW5pc3RpY2FsbHkgZHJv
cCB0aGUgYXNzZXJ0IHRoYXQgdGhlIGFsbG9jYXRpb24gc3VjY2VlZGVkLCBhcyB0aGUKPiBhbGxv
Y2F0b3IgaXRzZWxmIGd1YXJhbnRlZXMgc3VjY2Vzcy4KPiAKPiBGb3IgYWxsIGludGVudHMgYW5k
IHB1cnBvc2VzLCBubyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KPiAtLS0KPiAgIHRv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvbG9vbmdhcmNoL3Byb2Nlc3Nvci5jIHwgNSAr
LS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL2xvb25nYXJj
aC9wcm9jZXNzb3IuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvbG9vbmdhcmNo
L3Byb2Nlc3Nvci5jCj4gaW5kZXggNDdiYmRlM2UyMDVhLi5mY2Q0MWJjNmZiZGEgMTAwNjQ0Cj4g
LS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9sb29uZ2FyY2gvcHJvY2Vzc29y
LmMKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL2xvb25nYXJjaC9wcm9j
ZXNzb3IuYwo+IEBAIC05LDcgKzksNiBAQAo+ICAgI2luY2x1ZGUgInByb2Nlc3Nvci5oIgo+ICAg
I2luY2x1ZGUgInVjYWxsX2NvbW1vbi5oIgo+ICAgCj4gLSNkZWZpbmUgTE9PTkdBUkNIX1BBR0Vf
VEFCTEVfUEhZU19NSU4JCTB4MjAwMDAwCj4gICAjZGVmaW5lIExPT05HQVJDSF9HVUVTVF9TVEFD
S19WQUREUl9NSU4JCTB4MjAwMDAwCj4gICAKPiAgIHN0YXRpYyBncGFfdCBpbnZhbGlkX3BndGFi
bGVbNF07Cj4gQEAgLTU3LDkgKzU2LDcgQEAgdm9pZCB2aXJ0X2FyY2hfcGdkX2FsbG9jKHN0cnVj
dCBrdm1fdm0gKnZtKQo+ICAgCWNoaWxkID0gdGFibGUgPSAwOwo+ICAgCWZvciAoaSA9IDA7IGkg
PCB2bS0+bW11LnBndGFibGVfbGV2ZWxzOyBpKyspIHsKPiAgIAkJaW52YWxpZF9wZ3RhYmxlW2ld
ID0gY2hpbGQ7Cj4gLQkJdGFibGUgPSB2bV9waHlfcGFnZV9hbGxvYyh2bSwgTE9PTkdBUkNIX1BB
R0VfVEFCTEVfUEhZU19NSU4sCj4gLQkJCQl2bS0+bWVtc2xvdHNbTUVNX1JFR0lPTl9QVF0pOwo+
IC0JCVRFU1RfQVNTRVJUKHRhYmxlLCAiRmFpbCB0byBhbGxvY2F0ZSBwYWdlIHRhbGUgYXQgbGV2
ZWwgJWRcbiIsIGkpOwo+ICsJCXRhYmxlID0gdm1fYWxsb2NfcGFnZV90YWJsZSh2bSk7Cj4gICAJ
CXZpcnRfc2V0X3BndGFibGUodm0sIHRhYmxlLCBjaGlsZCk7Cj4gICAJCWNoaWxkID0gdGFibGU7
Cj4gICAJfQo+IApSZXZpZXdlZC1ieTogQmlibyBNYW8gPG1hb2JpYm9AbG9vbmdzb24uY24+CgoK
LS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
