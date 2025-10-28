Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270DACCF9EB
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 00:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ch/dSHGxUjejgbIRliFGcJe5eBRFVOjPKbNGUoYLJcc=; b=WEdpOq56XXknFbcC4qTCdfIT9P
	0a+W6yM/y3bbjjKReKZbKJQqMWjfix3VwHQxcNDXpPh+I9eTPGl6ETag8hZBwaz64fP/jc62lccRc
	nCOA2pkIU7JRUoz7ajINMtcCwnLg93MFGPtVbI6Dd8gtqZgvfpir0zr+I6Osq+kN0YIjN/30BGNG1
	Z3E/z9wHVq8LeEh7SQ545Mi1dUnlLRkXAThXlEFefOJ+sGcsvfAo+5Z2HG5RpTIAQ6hvPjI6CBBUv
	atBIlFQutQk8+HbF+fHOQpoakbxA3Ieg7bYgN16DFVJE2VwYaYQpz0uCdQx15QMiOOUVlsrK4SJKV
	rXLQZ1SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXi1-0000000Ezzi-2zgh;
	Tue, 28 Oct 2025 00:37:09 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXhz-0000000EzxX-0VSR
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 00:37:08 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33dadf7c5beso4768950a91.0
        for <kvm-riscv@lists.infradead.org>; Mon, 27 Oct 2025 17:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761611825; x=1762216625; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3mxOKer4OGfyDxlfqvGDsZ/A3KYgtdet3LczK0ONqE=;
        b=x0J9Gv7No9QFvSn5UWnIJcTpz4HiL74KpiW9aD2Wxt0SncFIg2C97hW0RxJXqaJe1k
         RHo0dDok6A51buDGSwcoVuCXSuHR06i4y/devu6jOJ0tBD3IAVtJdWB8ZP33QZrq2BiA
         Yn88a/TeP/MwECU3EtwYMS3sfGRJaG1wgqu2iOYDJ3IIj0kJvZXSRCdfBz0t3ZofeFmy
         ZSf5NZ9jH7DpE0efEwEikKBan3W2ecq34yOplfeIQEPbQ8CTkllKqTIHc8G5yI/OjgvO
         RjS4ob9TfEKCdeqwWxKC79qzcDcAC/Hk3xKPnBgXMSmPpO8b5bB3X/X0Urmv7Ta8TMOF
         zYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761611825; x=1762216625;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J3mxOKer4OGfyDxlfqvGDsZ/A3KYgtdet3LczK0ONqE=;
        b=NWIDQ4bsezn9blZCkS7B1JRMQjdh/aoBH8/pEgVxwytuGc5fK0EwmWxupUEVloz+gB
         4TsPKYSiKq/d4QjxNLUH4WqlREFS0x4HxBqZQVDL8WSK7zZ0XKGIHmng9wpQVu+IF1lE
         3xX/vk9Sho19JKz4k6oWuYFe8T5ElTxxt0RfJsOVV1V2+oo5K2BM90bOkb+AV/uG3m9u
         Wop7zjoIjiQNNyyeRl7qM+sKvgvQ5GkiqAJDteixmIpUxIusvt6yWs9P84L9lxD7bVBs
         1rnfYEWCo9HAAa7ZQEWt/JUCFNbyG+KOIAt98Ool39baaxqKBvk0/Ik08dyxGQpgtp7J
         szww==
X-Forwarded-Encrypted: i=1; AJvYcCXlYsOURi3UTIMvAeT/v3tg0ADPPiuuY9PPFgQvL3vzcYgxyVojfNFZqyH0eZnkiruLuzEvtGSmfHQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxU1Dt9SIfb7mkPsFPwB30wO0AAPu9Jf+jwHLY9oyW+wrheyjvn
	PKCWFjiFgI399mm2Tnb4lwzqjiyABBP4fIyij4BF9zRwZBog3JStWNhEQzDwgCO6ni5OL36SoTD
	d0FTA5A==
X-Google-Smtp-Source: AGHT+IGoxyiEdJHjsguM4HhfYAa3a3WGl9IwGzua+OMwKu3+3dxnKcX9NeqRP2yYPcwFhiCcHGTefjSDvqI=
X-Received: from pjcc13.prod.google.com ([2002:a17:90b:574d:b0:33d:813f:6829])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5241:b0:329:cb75:fef2
 with SMTP id 98e67ed59e1d1-340279e5c84mr1590788a91.3.1761611825209; Mon, 27
 Oct 2025 17:37:05 -0700 (PDT)
Date: Mon, 27 Oct 2025 17:37:03 -0700
In-Reply-To: <55461c549803e08db97528127c29e092c597adc5.camel@intel.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-25-seanjc@google.com>
 <55461c549803e08db97528127c29e092c597adc5.camel@intel.com>
Message-ID: <aQAQLzxyGFooGtNV@google.com>
Subject: Re: [PATCH v3 24/25] KVM: TDX: Guard VM state transitions with "all"
 the locks
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"kas@kernel.org" <kas@kernel.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, 
	"zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, Vishal Annapurve <vannapurve@google.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_173707_156876_1839A2CA 
X-CRM114-Status: GOOD (  17.79  )
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

T24gVHVlLCBPY3QgMjgsIDIwMjUsIEthaSBIdWFuZyB3cm90ZToKPiBPbiBUaHUsIDIwMjUtMTAt
MTYgYXQgMTc6MzIgLTA3MDAsIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3JvdGU6Cj4gPiBAQCAtMjc4
MSw4ICsyODI3LDYgQEAgaW50IHRkeF92bV9pb2N0bChzdHJ1Y3Qga3ZtICprdm0sIHZvaWQgX191
c2VyICphcmdwKQo+ID4gwqAJaWYgKHIpCj4gPiDCoAkJcmV0dXJuIHI7Cj4gPiDCoAo+ID4gLQln
dWFyZChtdXRleCkoJmt2bS0+bG9jayk7Cj4gPiAtCj4gPiDCoAlzd2l0Y2ggKHRkeF9jbWQuaWQp
IHsKPiA+IMKgCWNhc2UgS1ZNX1REWF9DQVBBQklMSVRJRVM6Cj4gPiDCoAkJciA9IHRkeF9nZXRf
Y2FwYWJpbGl0aWVzKCZ0ZHhfY21kKTsKPiAKPiBJSVJDLCB0aGlzIHBhdGNoIHJlbW92ZXMgZ3Jh
YmJpbmcgdGhlIGt2bS0+bG9jayBpbiB0ZHhfdm1faW9jdGwoKSBidXQgb25seQo+IGFkZHMgdGhl
ICJiaWcgaGFtbWVyIiB0byB0ZHhfdGRfaW5pdCgpIGFuZCB0ZHhfdGRfZmluYWxpemUoKSwgc28g
dGhlCj4gdGR4X2dldF9jYXBhYmlsaXRpZXMoKSBsb3N0IGhvbGRpbmcgdGhlIGt2bS0+bG9jay4K
Ck9vaCwgeWVhaCwgbmljZSBjYXRjaCwgdGhhdCBpcyBpbmRlZWQgc2lsbHkgYW5kIHVubmVjZXNz
YXJ5IGNodXJuLgoKPiBBcyByZXBsaWVkIGVhcmxpZXIsIEkgdGhpbmsgd2UgY2FuIGp1c3QgaG9s
ZCB0aGUgImJpZyBoYW1tZXIiIGluCj4gdGR4X3ZtX2lvY3RsKCk/CgpBY3R1YWxseSwgSSB0aGlu
ayB3ZSBjYW4gaGF2ZSBvdXIgY2FrZSBhbmQgZWF0IGl0IHRvby4gIFdpdGggdGhpcyBzbG90dGVk
IGluIGFzCmEgcHJlcCBwYXRjaCwgdGhlIGJpZyBoYW1tZXIgY2FuIGxhbmQgZGlyZWN0bHkgaW4g
dGR4X3ZtX2lvY3RsKCksIHdpdGhvdXQgYW55CmNoYW5nZSBpbiBmdW5jdGlvbmFsaXR5IGZvciBL
Vk1fVERYX0NBUEFCSUxJVElFUy4KCi0tCkZyb206IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5q
Y0Bnb29nbGUuY29tPgpEYXRlOiBNb24sIDI3IE9jdCAyMDI1IDE3OjMyOjM0IC0wNzAwClN1Ympl
Y3Q6IFtQQVRDSF0gS1ZNOiBURFg6IERvbid0IGNvcHkgImNtZCIgYmFjayB0byB1c2Vyc3BhY2Ug
Zm9yCiBLVk1fVERYX0NBUEFCSUxJVElFUwoKRG9uJ3QgY29weSB0aGUga3ZtX3RkeF9jbWQgc3Ry
dWN0dXJlIGJhY2sgdG8gdXNlcnNwYWNlIHdoZW4gaGFuZGxpbmcKS1ZNX1REWF9DQVBBQklMSVRJ
RVMsIGFzIHRkeF9nZXRfY2FwYWJpbGl0aWVzKCkgZG9lc24ndCBtb2RpZnkgaHdfZXJyb3Igb3IK
YW55IG90aGVyIGZpZWxkcy4KCk9wcG9ydHVuaXN0aWNhbGx5IGhvaXN0IHRoZSBjYWxsIHRvIHRk
eF9nZXRfY2FwYWJpbGl0aWVzKCkgb3V0c2lkZSBvZiB0aGUKa3ZtLT5sb2NrIGNyaXRpY2FsIHNl
Y3Rpb24sIGFzIGdldHRpbmcgdGhlIGNhcGFiaWxpdGllcyBkb2Vzbid0IHRvdWNoIHRoZQpWTSBp
biBhbnkgd2F5LCBlLmcuIGRvZXNuJ3QgZXZlbiB0YWtlIEBrdm0uCgpTdWdnZXN0ZWQtYnk6IEth
aSBIdWFuZyA8a2FpLmh1YW5nQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogU2VhbiBDaHJpc3Rv
cGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Ci0tLQogYXJjaC94ODYva3ZtL3ZteC90ZHguYyB8
IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS92bXgvdGR4LmMgYi9hcmNoL3g4Ni9rdm0vdm14
L3RkeC5jCmluZGV4IDE2NDJkYTljMWZhOS4uNDNjMGMzZjZhOGMwIDEwMDY0NAotLS0gYS9hcmNo
L3g4Ni9rdm0vdm14L3RkeC5jCisrKyBiL2FyY2gveDg2L2t2bS92bXgvdGR4LmMKQEAgLTI4MDcs
MTIgKzI4MDcsMTIgQEAgaW50IHRkeF92bV9pb2N0bChzdHJ1Y3Qga3ZtICprdm0sIHZvaWQgX191
c2VyICphcmdwKQogCWlmIChyKQogCQlyZXR1cm4gcjsKIAorCWlmICh0ZHhfY21kLmlkID09IEtW
TV9URFhfQ0FQQUJJTElUSUVTKQorCQlyZXR1cm4gdGR4X2dldF9jYXBhYmlsaXRpZXMoJnRkeF9j
bWQpOworCiAJZ3VhcmQobXV0ZXgpKCZrdm0tPmxvY2spOwogCiAJc3dpdGNoICh0ZHhfY21kLmlk
KSB7Ci0JY2FzZSBLVk1fVERYX0NBUEFCSUxJVElFUzoKLQkJciA9IHRkeF9nZXRfY2FwYWJpbGl0
aWVzKCZ0ZHhfY21kKTsKLQkJYnJlYWs7CiAJY2FzZSBLVk1fVERYX0lOSVRfVk06CiAJCXIgPSB0
ZHhfdGRfaW5pdChrdm0sICZ0ZHhfY21kKTsKIAkJYnJlYWs7CgpiYXNlLWNvbW1pdDogNjcyNTM3
MjMzYjhkYTJjMjlkY2E3MTU0YmYzYTMyMTFhZjdmNjEyOAotLQoKLS0gCmt2bS1yaXNjdiBtYWls
aW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
