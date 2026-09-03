Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6240AC61DD6
	for <kvm-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 01:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZMsY6tRLyUSwA6a5cKEu7w2o8s7MBbDBzc2l3AaB6JE=; b=dC6Az6wyH9ogMstcoN2xY5CWKj
	enLlpyNKYiPVN4uMIsKJxlP3qyK3Vl8DvaB59RX3Pwl+7jdKjc5svclBYHFlRew7qY1QdVLH/9DcE
	5fQu6CBy6N8Gy3MdBrz1xVwpeiL1ikNV34pGnkDvIZ2Vht9+eu3yxA+p1LVuzpt1Lfot1RZZ4pkBp
	wnZeCARm9rq46EzXRMX2x2tq3we6i890xj3717BU7yHb+Uw+NAf7d1S7gYzJmT/KfL+Jhj0MjZ14n
	kjbC+P7ysIHDeyrcNo3wkI7c5drk9G9Q/W17jQUljXD7K5sivtWvW3R35FNnPZBN9OlBVeRUmKAnN
	sJ5LOJTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1vq2-0000000G8nH-2LiJ;
	Thu, 03 Sep 2026 01:01:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1vq1-0000000G8my-0Vuh;
	Thu, 03 Sep 2026 01:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=VIRv+z3mPNZFa1bmE43M/kgaKBia3XUx5hcUcZMH5lg=; b=RvHCfdH3QVzTyy081zRM1gAbDO
	n6QmCbiMyAI9Ifamg9FQdfvtPYDp+0W8GJAfE01p3ocP796sLiU8Wzjpbn8UEJ9RI5eGb3LJJI2QV
	3yu31P+0GXbPnwR8JyIeyg38K84AcYjpdNy4aACSm20rhVkpjUFccdRToU/lSlZVCpqpW63KyEOlM
	ePt+k3wEOHP+yrAP91LSnUWZmLbiNeoAg9iyGvJNhH/RHK783KYcZdP2ASBF1m8AflpC3gHAJLiKk
	xVRwPSKVH5NAU+ga0XfyEeE2NbVwR45IImyjFyC62MCm2bygHfiUWzT4P0mTFn/YBulbsZfm6+Xq7
	NqE0Nsig==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1vpw-00000008KeR-1HTv;
	Thu, 03 Sep 2026 01:01:55 +0000
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8CxQNH3xphq0P8HAA--.22980S3;
	Thu, 03 Sep 2026 09:01:43 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJDxRs30xphqzu0ZAA--.42143S2;
	Thu, 03 Sep 2026 09:01:41 +0800 (CST)
Subject: Re: [PATCH v2 02/20] KVM: selftests: Use the common minimum GPA for
 page tables on LoongArch
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
 linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>,
 Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com>
 <20260902164123.2546762-3-seanjc@google.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <170acb36-7542-e6f8-d834-250816ddfbfc@loongson.cn>
Date: Thu, 3 Sep 2026 09:01:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20260902164123.2546762-3-seanjc@google.com>
Content-Language: en-US
X-CM-TRANSID: qMiowJDxRs30xphqzu0ZAA--.42143S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZF43uFy8JrWDCF15CFWUJrc_yoW8CrWUpa
	ykAryY9r4rGr17KFZ7WwnYqFy8Wa97GFWxAr1S9ryDurnrAry2gFWxKasrXFy5Z39Yq34S
	v3WI93W5Za1kZwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUd529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUtVW8ZwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUShiSDUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_020152_974008_C1C60034 
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAyMDI2LzkvMyDkuIrljYgxMjo0MSwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToKPiBV
c2UgdGhlIGNvbW1vbiBtaW5pbXVtIEdQQSBmb3IgcGFnZSB0YWJsZXMgKDB4MTgwMDAwKSBvbiBM
b29uZ0FyY2ggaW5zdGVhZAo+IG9mIExvb25nQXJjaCdzIGN1c3RvbSBtaW5pbXVtIG9mIDB4MjAw
MDAwLCBzbyB0aGF0IExvb25nQXJjaCBjYW4gdXNlCj4gdm1fYWxsb2NfcGFnZV90YWJsZSgpIGlu
c3RlYWQgb2Ygb3BlbiBjb2RpbmcgYSByb3VnaCBlcXVpdmFsZW50LiAgVGhlcmUgYXJlCj4gbm8g
a25vd24gcmVhc29ucyB3aHkgTG9vbmdBcmNoIGNhbid0IHVzZSBhIGxvd2VyLCBsZXNzLWFsaWdu
ZWQgbWluaW11bS4KPiBUaGUgbW9yZS1hbGlnbmVkIHZhbHVlIHdhcyBvcmlnaW5hbGx5IHNlbGVj
dGVkIHRvIHN1cHBvcnQgaHVnZSBwYWdlcyBmb3IKPiB0aGUgZ3Vlc3QsIGJ1dCB0aGF0IG9ubHkg
cmVxdWlyZXMgdGhlIGFkZHJlc3Mgb2YgdGhlIGZpbmFsIGFsbG9jYXRpb24gdG8gYmUKPiBhbGln
bmVkLCB0aGUgYWRkcmVzc2VzIG9mIHBhZ2UgdGFibGUgcGFnZXMgaXMgaXJyZWxldmFudCBvbiB0
aGF0IGZyb250Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5q
Y0Bnb29nbGUuY29tPgo+IC0tLQo+ICAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9s
b29uZ2FyY2gvcHJvY2Vzc29yLmMgfCAzICstLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9rdm0vbGliL2xvb25nYXJjaC9wcm9jZXNzb3IuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9saWIvbG9vbmdhcmNoL3Byb2Nlc3Nvci5jCj4gaW5kZXggNDdiYmRlM2UyMDVh
Li4wNTdhNzc3MTM1NDIgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3Zt
L2xpYi9sb29uZ2FyY2gvcHJvY2Vzc29yLmMKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9rdm0vbGliL2xvb25nYXJjaC9wcm9jZXNzb3IuYwo+IEBAIC05LDcgKzksNiBAQAo+ICAgI2lu
Y2x1ZGUgInByb2Nlc3Nvci5oIgo+ICAgI2luY2x1ZGUgInVjYWxsX2NvbW1vbi5oIgo+ICAgCj4g
LSNkZWZpbmUgTE9PTkdBUkNIX1BBR0VfVEFCTEVfUEhZU19NSU4JCTB4MjAwMDAwCj4gICAjZGVm
aW5lIExPT05HQVJDSF9HVUVTVF9TVEFDS19WQUREUl9NSU4JCTB4MjAwMDAwCj4gICAKPiAgIHN0
YXRpYyBncGFfdCBpbnZhbGlkX3BndGFibGVbNF07Cj4gQEAgLTU3LDcgKzU2LDcgQEAgdm9pZCB2
aXJ0X2FyY2hfcGdkX2FsbG9jKHN0cnVjdCBrdm1fdm0gKnZtKQo+ICAgCWNoaWxkID0gdGFibGUg
PSAwOwo+ICAgCWZvciAoaSA9IDA7IGkgPCB2bS0+bW11LnBndGFibGVfbGV2ZWxzOyBpKyspIHsK
PiAgIAkJaW52YWxpZF9wZ3RhYmxlW2ldID0gY2hpbGQ7Cj4gLQkJdGFibGUgPSB2bV9waHlfcGFn
ZV9hbGxvYyh2bSwgTE9PTkdBUkNIX1BBR0VfVEFCTEVfUEhZU19NSU4sCj4gKwkJdGFibGUgPSB2
bV9waHlfcGFnZV9hbGxvYyh2bSwgS1ZNX0dVRVNUX1BBR0VfVEFCTEVfTUlOX1BBRERSLAo+ICAg
CQkJCXZtLT5tZW1zbG90c1tNRU1fUkVHSU9OX1BUXSk7Cj4gICAJCVRFU1RfQVNTRVJUKHRhYmxl
LCAiRmFpbCB0byBhbGxvY2F0ZSBwYWdlIHRhbGUgYXQgbGV2ZWwgJWRcbiIsIGkpOwo+ICAgCQl2
aXJ0X3NldF9wZ3RhYmxlKHZtLCB0YWJsZSwgY2hpbGQpOwo+IApSZXZpZXdlZC1ieTogQmlibyBN
YW8gPG1hb2JpYm9AbG9vbmdzb24uY24+CgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3Zt
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
