Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0022DC54E65
	for <kvm-riscv@archiver.kernel.org>; Thu, 22 May 2025 21:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jg7cmEo4ZEHHfpkmzyBWSIOrfLumj6AnjK2npx6fX3I=; b=BdVw+jJ2lcd41i
	btBAfZwMT7M5w+G637oGbGgFrwnmOZx3hYXuiNbn4KA+FkY4tfiDdiHR/rkr3wAqpypninUUzqdAU
	MGmNef9ADuCEMCwhmmsZZaodZdFBp1VMKeWy64bAg11evBhEE/AwJmVfkiSWL9IQo29vjBYVwtCFN
	nVum3gMpzsxXibxvpUQqdz+Pb1LvURmZC8OFp9HrzEuO//hphw+gFtaYk0Q63HblPzSxsRBqkDEx4
	dW7fMrf5BlU/OJbLt4ZTqbM6O7XQqn0AVIVIQlf7KGL9EPOHeBIkoFRlcGXLr/Mf/ez58qb/hMudf
	8dRWzHL0FYLVkA+pq2DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIDhs-00000002E3P-2S1i;
	Thu, 22 May 2025 21:44:04 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIDhq-00000002DzM-29Ab
	for kvm-riscv@lists.infradead.org;
	Thu, 22 May 2025 21:44:03 +0000
Message-ID: <1a7a81fd-cf15-4b54-a805-32d66ced4517@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747950227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=plmj0gdkiLDj4KVFLXX5cTeiNOeT4yGDHPQsokxsHYA=;
	b=OOkG4nO6c5U8WpwXR5zHF9F4hraYfw3IqEfgDjBO5ZMGHMQNcyDuF6iF0vJTho3r/Z1Cmo
	aO2zKV1AZgm9LSAdsZIsdIPSJ/E26aJyz9VWKCUF8uBhNWRnNB2o0sxPviVwWFYpKO4H2E
	QLcdkZY7Sl/SgBnOzB43xKs05KME/ss=
Date: Thu, 22 May 2025 14:43:40 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/2] RISC-V: KVM: VCPU reset fixes
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 kvm-riscv@lists.infradead.org
Cc: kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>
References: <20250515143723.2450630-4-rkrcmar@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250515143723.2450630-4-rkrcmar@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_144402_692712_74D2C677 
X-CRM114-Status: GOOD (  11.40  )
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

T24gNS8xNS8yNSA3OjM3IEFNLCBSYWRpbSBLcsOEbcODwqHDhSB3cm90ZToKPiBIZWxsbywKPiAK
PiB0aGUgZGVzaWduIHN0aWxsIHJlcXVpcmVzIGEgZGlzY3Vzc2lvbi4KPiAKPiBbdjMgMS8yXSBy
ZW1vdmVzIG1vc3Qgb2YgdGhlIGFkZGl0aW9uYWwgY2hhbmdlcyB0aGF0IHRoZSBLVk0gY2FwYWJp
bGl0eQo+IHdhcyBkb2luZyBpbiB2Mi4gIFt2MyAyLzJdIGlzIG5ldyBhbmQgcHJldmlld3MgYSBn
ZW5lcmFsIHNvbHV0aW9uIHRvIHRoZQo+IGxhY2sgb2YgdXNlcnNwYWNlIGNvbnRyb2wgb3ZlciBL
Vk0gU0JJLgo+IAoKSSBhbSBzdGlsbCBtaXNzaW5nIHRoZSBtb3RpdmF0aW9uIGJlaGluZCBpdC4g
SWYgdGhlIG1vdGl2YXRpb24gaXMgU0JJIApIU00gc3VzcGVuZCwgdGhlIFBBVENIMiBkb2Vzbid0
IGFjaGlldmUgdGhhdCBhcyBpdCBmb3J3YXJkcyBldmVyeSBjYWxsIAp0byB0aGUgdXNlciBzcGFj
ZS4gV2h5IGRvIHlvdSB3YW50IHRvIGNvbnRyb2wgaHNtIHN0YXJ0L3N0b3AgZnJvbSB0aGUgCnVz
ZXIgc3BhY2UgPwoKCj4gQSBwb3NzaWJsZSBRRU1VIGltcGxlbWVudGF0aW9uIGZvciBib3RoIGNh
cGFiaWxpdGllcyBjYW4gYmUgc2VlbiBpbgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9yYWRpbWtyY21h
ci9xZW11L3RyZWUvcmVzZXRfZml4ZXNfdjMKPiBUaGUgbmV4dCBzdGVwIHdvdWxkIGJlIHRvIGZv
cndhcmQgdGhlIEhTTSBlY2FsbHMgdG8gUUVNVS4KPiAKPiB2MjogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcva3ZtLXJpc2N2LzIwMjUwNTA4MTQyODQyLjE0OTYwOTktMi1ya3JjbWFyQHZlbnRhbmFt
aWNyby5jb20vCj4gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2t2bS1yaXNjdi8yMDI1MDQw
MzExMjUyMi4xNTY2NjI5LTMtcmtyY21hckB2ZW50YW5hbWljcm8uY29tLwo+IAo+IFJhZGltIEty
xI1tw6HFmSAoMik6Cj4gICAgUklTQy1WOiBLVk06IGFkZCBLVk1fQ0FQX1JJU0NWX01QX1NUQVRF
X1JFU0VUCj4gICAgUklTQy1WOiBLVk06IGFkZCBLVk1fQ0FQX1JJU0NWX1VTRVJTUEFDRV9TQkkK
PiAKPiAgIERvY3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnJzdCAgICAgICAgfCAyMiArKysrKysr
KysrKysrKysrKysrKysrCj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggICAg
IHwgIDYgKysrKysrCj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oIHwg
IDEgKwo+ICAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAgICAgICB8IDI3ICsrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLQo+ICAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyAgICAg
ICAgICAgICB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKystLQo+ICAgYXJjaC9yaXNjdi9r
dm0vdm0uYyAgICAgICAgICAgICAgICAgICB8IDE4ICsrKysrKysrKysrKysrKysrKwo+ICAgaW5j
bHVkZS91YXBpL2xpbnV4L2t2bS5oICAgICAgICAgICAgICB8ICAyICsrCj4gICA3IGZpbGVzIGNo
YW5nZWQsIDg4IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+IAoKCi0tIAprdm0tcmlz
Y3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
